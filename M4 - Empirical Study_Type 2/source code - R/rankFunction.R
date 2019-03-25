rankMRLOC <- function(M, H, VH) {
	if (M <= 25 && H == 0 && VH == 0){
		print('++')
	}else if (M <= 30 && H <= 5 && VH == 0){
		print('+')
	}else if (M <= 40 && H <= 10 && VH == 0){
		print('o')
	}else if (M <= 50 && H <= 15 && VH <= 5){
		print('-')
	}else {
		print('--')
	}
}