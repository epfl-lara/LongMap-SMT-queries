; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28734 () Bool)

(assert start!28734)

(declare-fun b!293415 () Bool)

(declare-fun res!154332 () Bool)

(declare-fun e!185535 () Bool)

(assert (=> b!293415 (=> (not res!154332) (not e!185535))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293415 (= res!154332 (validKeyInArray!0 k!2524))))

(declare-fun res!154335 () Bool)

(assert (=> start!28734 (=> (not res!154335) (not e!185535))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28734 (= res!154335 (validMask!0 mask!3809))))

(assert (=> start!28734 e!185535))

(assert (=> start!28734 true))

(declare-datatypes ((array!14868 0))(
  ( (array!14869 (arr!7055 (Array (_ BitVec 32) (_ BitVec 64))) (size!7407 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14868)

(declare-fun array_inv!5018 (array!14868) Bool)

(assert (=> start!28734 (array_inv!5018 a!3312)))

(declare-fun b!293416 () Bool)

(declare-fun e!185537 () Bool)

(assert (=> b!293416 (= e!185535 e!185537)))

(declare-fun res!154333 () Bool)

(assert (=> b!293416 (=> (not res!154333) (not e!185537))))

(declare-fun lt!145441 () Bool)

(declare-datatypes ((SeekEntryResult!2204 0))(
  ( (MissingZero!2204 (index!10986 (_ BitVec 32))) (Found!2204 (index!10987 (_ BitVec 32))) (Intermediate!2204 (undefined!3016 Bool) (index!10988 (_ BitVec 32)) (x!29169 (_ BitVec 32))) (Undefined!2204) (MissingVacant!2204 (index!10989 (_ BitVec 32))) )
))
(declare-fun lt!145438 () SeekEntryResult!2204)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293416 (= res!154333 (or lt!145441 (= lt!145438 (MissingVacant!2204 i!1256))))))

(assert (=> b!293416 (= lt!145441 (= lt!145438 (MissingZero!2204 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14868 (_ BitVec 32)) SeekEntryResult!2204)

(assert (=> b!293416 (= lt!145438 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!293417 () Bool)

(declare-fun res!154331 () Bool)

(assert (=> b!293417 (=> (not res!154331) (not e!185535))))

(assert (=> b!293417 (= res!154331 (and (= (size!7407 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7407 a!3312))))))

(declare-fun b!293418 () Bool)

(declare-fun lt!145437 () SeekEntryResult!2204)

(assert (=> b!293418 (= e!185537 (and lt!145441 (let ((bdg!6217 (not (is-Intermediate!2204 lt!145437)))) (and (or bdg!6217 (not (undefined!3016 lt!145437))) (not bdg!6217) (or (bvslt (index!10988 lt!145437) #b00000000000000000000000000000000) (bvsge (index!10988 lt!145437) (size!7407 a!3312)))))))))

(declare-fun lt!145439 () (_ BitVec 32))

(declare-fun lt!145440 () SeekEntryResult!2204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14868 (_ BitVec 32)) SeekEntryResult!2204)

(assert (=> b!293418 (= lt!145440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145439 k!2524 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312)) mask!3809))))

(assert (=> b!293418 (= lt!145437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145439 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293418 (= lt!145439 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!293419 () Bool)

(declare-fun res!154334 () Bool)

(assert (=> b!293419 (=> (not res!154334) (not e!185535))))

(declare-fun arrayContainsKey!0 (array!14868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293419 (= res!154334 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293420 () Bool)

(declare-fun res!154330 () Bool)

(assert (=> b!293420 (=> (not res!154330) (not e!185537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14868 (_ BitVec 32)) Bool)

(assert (=> b!293420 (= res!154330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28734 res!154335) b!293417))

(assert (= (and b!293417 res!154331) b!293415))

(assert (= (and b!293415 res!154332) b!293419))

(assert (= (and b!293419 res!154334) b!293416))

(assert (= (and b!293416 res!154333) b!293420))

(assert (= (and b!293420 res!154330) b!293418))

(declare-fun m!307125 () Bool)

(assert (=> start!28734 m!307125))

(declare-fun m!307127 () Bool)

(assert (=> start!28734 m!307127))

(declare-fun m!307129 () Bool)

(assert (=> b!293416 m!307129))

(declare-fun m!307131 () Bool)

(assert (=> b!293420 m!307131))

(declare-fun m!307133 () Bool)

(assert (=> b!293415 m!307133))

(declare-fun m!307135 () Bool)

(assert (=> b!293419 m!307135))

(declare-fun m!307137 () Bool)

(assert (=> b!293418 m!307137))

(declare-fun m!307139 () Bool)

(assert (=> b!293418 m!307139))

(declare-fun m!307141 () Bool)

(assert (=> b!293418 m!307141))

(declare-fun m!307143 () Bool)

(assert (=> b!293418 m!307143))

(push 1)

(assert (not b!293418))

(assert (not b!293420))

(assert (not b!293416))

(assert (not b!293419))

(assert (not start!28734))

(assert (not b!293415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66569 () Bool)

(declare-fun res!154382 () Bool)

(declare-fun e!185570 () Bool)

(assert (=> d!66569 (=> res!154382 e!185570)))

(assert (=> d!66569 (= res!154382 (= (select (arr!7055 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66569 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185570)))

(declare-fun b!293479 () Bool)

(declare-fun e!185571 () Bool)

(assert (=> b!293479 (= e!185570 e!185571)))

(declare-fun res!154383 () Bool)

(assert (=> b!293479 (=> (not res!154383) (not e!185571))))

(assert (=> b!293479 (= res!154383 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7407 a!3312)))))

(declare-fun b!293480 () Bool)

(assert (=> b!293480 (= e!185571 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66569 (not res!154382)) b!293479))

(assert (= (and b!293479 res!154383) b!293480))

(declare-fun m!307185 () Bool)

(assert (=> d!66569 m!307185))

(declare-fun m!307187 () Bool)

(assert (=> b!293480 m!307187))

(assert (=> b!293419 d!66569))

(declare-fun d!66573 () Bool)

(assert (=> d!66573 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28734 d!66573))

(declare-fun d!66585 () Bool)

(assert (=> d!66585 (= (array_inv!5018 a!3312) (bvsge (size!7407 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28734 d!66585))

(declare-fun b!293574 () Bool)

(declare-fun e!185631 () Bool)

(declare-fun lt!145515 () SeekEntryResult!2204)

(assert (=> b!293574 (= e!185631 (bvsge (x!29169 lt!145515) #b01111111111111111111111111111110))))

(declare-fun b!293575 () Bool)

(declare-fun e!185635 () SeekEntryResult!2204)

(assert (=> b!293575 (= e!185635 (Intermediate!2204 true lt!145439 #b00000000000000000000000000000000))))

(declare-fun b!293576 () Bool)

(assert (=> b!293576 (and (bvsge (index!10988 lt!145515) #b00000000000000000000000000000000) (bvslt (index!10988 lt!145515) (size!7407 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312)))))))

(declare-fun e!185632 () Bool)

(assert (=> b!293576 (= e!185632 (= (select (arr!7055 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312))) (index!10988 lt!145515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66587 () Bool)

(assert (=> d!66587 e!185631))

(declare-fun c!47144 () Bool)

(assert (=> d!66587 (= c!47144 (and (is-Intermediate!2204 lt!145515) (undefined!3016 lt!145515)))))

(assert (=> d!66587 (= lt!145515 e!185635)))

(declare-fun c!47143 () Bool)

(assert (=> d!66587 (= c!47143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145514 () (_ BitVec 64))

(assert (=> d!66587 (= lt!145514 (select (arr!7055 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312))) lt!145439))))

(assert (=> d!66587 (validMask!0 mask!3809)))

(assert (=> d!66587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145439 k!2524 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312)) mask!3809) lt!145515)))

(declare-fun b!293577 () Bool)

(assert (=> b!293577 (and (bvsge (index!10988 lt!145515) #b00000000000000000000000000000000) (bvslt (index!10988 lt!145515) (size!7407 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312)))))))

(declare-fun res!154425 () Bool)

(assert (=> b!293577 (= res!154425 (= (select (arr!7055 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312))) (index!10988 lt!145515)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293577 (=> res!154425 e!185632)))

(declare-fun e!185633 () SeekEntryResult!2204)

(declare-fun b!293578 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293578 (= e!185633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145439 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312)) mask!3809))))

(declare-fun b!293579 () Bool)

(declare-fun e!185634 () Bool)

(assert (=> b!293579 (= e!185631 e!185634)))

(declare-fun res!154424 () Bool)

(assert (=> b!293579 (= res!154424 (and (is-Intermediate!2204 lt!145515) (not (undefined!3016 lt!145515)) (bvslt (x!29169 lt!145515) #b01111111111111111111111111111110) (bvsge (x!29169 lt!145515) #b00000000000000000000000000000000) (bvsge (x!29169 lt!145515) #b00000000000000000000000000000000)))))

(assert (=> b!293579 (=> (not res!154424) (not e!185634))))

(declare-fun b!293580 () Bool)

(assert (=> b!293580 (= e!185633 (Intermediate!2204 false lt!145439 #b00000000000000000000000000000000))))

(declare-fun b!293581 () Bool)

(assert (=> b!293581 (= e!185635 e!185633)))

(declare-fun c!47145 () Bool)

(assert (=> b!293581 (= c!47145 (or (= lt!145514 k!2524) (= (bvadd lt!145514 lt!145514) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293582 () Bool)

(assert (=> b!293582 (and (bvsge (index!10988 lt!145515) #b00000000000000000000000000000000) (bvslt (index!10988 lt!145515) (size!7407 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312)))))))

(declare-fun res!154426 () Bool)

(assert (=> b!293582 (= res!154426 (= (select (arr!7055 (array!14869 (store (arr!7055 a!3312) i!1256 k!2524) (size!7407 a!3312))) (index!10988 lt!145515)) k!2524))))

(assert (=> b!293582 (=> res!154426 e!185632)))

(assert (=> b!293582 (= e!185634 e!185632)))

(assert (= (and d!66587 c!47143) b!293575))

(assert (= (and d!66587 (not c!47143)) b!293581))

(assert (= (and b!293581 c!47145) b!293580))

(assert (= (and b!293581 (not c!47145)) b!293578))

(assert (= (and d!66587 c!47144) b!293574))

(assert (= (and d!66587 (not c!47144)) b!293579))

(assert (= (and b!293579 res!154424) b!293582))

(assert (= (and b!293582 (not res!154426)) b!293577))

(assert (= (and b!293577 (not res!154425)) b!293576))

(declare-fun m!307237 () Bool)

(assert (=> b!293577 m!307237))

(assert (=> b!293582 m!307237))

(assert (=> b!293576 m!307237))

(declare-fun m!307241 () Bool)

(assert (=> d!66587 m!307241))

(assert (=> d!66587 m!307125))

(declare-fun m!307245 () Bool)

(assert (=> b!293578 m!307245))

(assert (=> b!293578 m!307245))

(declare-fun m!307249 () Bool)

(assert (=> b!293578 m!307249))

(assert (=> b!293418 d!66587))

(declare-fun b!293592 () Bool)

(declare-fun e!185641 () Bool)

(declare-fun lt!145519 () SeekEntryResult!2204)

(assert (=> b!293592 (= e!185641 (bvsge (x!29169 lt!145519) #b01111111111111111111111111111110))))

(declare-fun b!293593 () Bool)

(declare-fun e!185645 () SeekEntryResult!2204)

(assert (=> b!293593 (= e!185645 (Intermediate!2204 true lt!145439 #b00000000000000000000000000000000))))

(declare-fun b!293594 () Bool)

(assert (=> b!293594 (and (bvsge (index!10988 lt!145519) #b00000000000000000000000000000000) (bvslt (index!10988 lt!145519) (size!7407 a!3312)))))

(declare-fun e!185642 () Bool)

(assert (=> b!293594 (= e!185642 (= (select (arr!7055 a!3312) (index!10988 lt!145519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66601 () Bool)

(assert (=> d!66601 e!185641))

(declare-fun c!47150 () Bool)

(assert (=> d!66601 (= c!47150 (and (is-Intermediate!2204 lt!145519) (undefined!3016 lt!145519)))))

(assert (=> d!66601 (= lt!145519 e!185645)))

(declare-fun c!47149 () Bool)

(assert (=> d!66601 (= c!47149 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145518 () (_ BitVec 64))

(assert (=> d!66601 (= lt!145518 (select (arr!7055 a!3312) lt!145439))))

(assert (=> d!66601 (validMask!0 mask!3809)))

(assert (=> d!66601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145439 k!2524 a!3312 mask!3809) lt!145519)))

(declare-fun b!293595 () Bool)

(assert (=> b!293595 (and (bvsge (index!10988 lt!145519) #b00000000000000000000000000000000) (bvslt (index!10988 lt!145519) (size!7407 a!3312)))))

(declare-fun res!154431 () Bool)

(assert (=> b!293595 (= res!154431 (= (select (arr!7055 a!3312) (index!10988 lt!145519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293595 (=> res!154431 e!185642)))

(declare-fun e!185643 () SeekEntryResult!2204)

(declare-fun b!293596 () Bool)

(assert (=> b!293596 (= e!185643 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145439 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293597 () Bool)

(declare-fun e!185644 () Bool)

(assert (=> b!293597 (= e!185641 e!185644)))

(declare-fun res!154430 () Bool)

(assert (=> b!293597 (= res!154430 (and (is-Intermediate!2204 lt!145519) (not (undefined!3016 lt!145519)) (bvslt (x!29169 lt!145519) #b01111111111111111111111111111110) (bvsge (x!29169 lt!145519) #b00000000000000000000000000000000) (bvsge (x!29169 lt!145519) #b00000000000000000000000000000000)))))

(assert (=> b!293597 (=> (not res!154430) (not e!185644))))

(declare-fun b!293598 () Bool)

(assert (=> b!293598 (= e!185643 (Intermediate!2204 false lt!145439 #b00000000000000000000000000000000))))

(declare-fun b!293599 () Bool)

(assert (=> b!293599 (= e!185645 e!185643)))

(declare-fun c!47151 () Bool)

(assert (=> b!293599 (= c!47151 (or (= lt!145518 k!2524) (= (bvadd lt!145518 lt!145518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293600 () Bool)

(assert (=> b!293600 (and (bvsge (index!10988 lt!145519) #b00000000000000000000000000000000) (bvslt (index!10988 lt!145519) (size!7407 a!3312)))))

(declare-fun res!154432 () Bool)

(assert (=> b!293600 (= res!154432 (= (select (arr!7055 a!3312) (index!10988 lt!145519)) k!2524))))

(assert (=> b!293600 (=> res!154432 e!185642)))

(assert (=> b!293600 (= e!185644 e!185642)))

(assert (= (and d!66601 c!47149) b!293593))

(assert (= (and d!66601 (not c!47149)) b!293599))

(assert (= (and b!293599 c!47151) b!293598))

(assert (= (and b!293599 (not c!47151)) b!293596))

(assert (= (and d!66601 c!47150) b!293592))

(assert (= (and d!66601 (not c!47150)) b!293597))

(assert (= (and b!293597 res!154430) b!293600))

(assert (= (and b!293600 (not res!154432)) b!293595))

(assert (= (and b!293595 (not res!154431)) b!293594))

(declare-fun m!307251 () Bool)

(assert (=> b!293595 m!307251))

(assert (=> b!293600 m!307251))

(assert (=> b!293594 m!307251))

(declare-fun m!307253 () Bool)

(assert (=> d!66601 m!307253))

(assert (=> d!66601 m!307125))

(assert (=> b!293596 m!307245))

(assert (=> b!293596 m!307245))

(declare-fun m!307255 () Bool)

(assert (=> b!293596 m!307255))

(assert (=> b!293418 d!66601))

(declare-fun d!66605 () Bool)

(declare-fun lt!145531 () (_ BitVec 32))

(declare-fun lt!145530 () (_ BitVec 32))

(assert (=> d!66605 (= lt!145531 (bvmul (bvxor lt!145530 (bvlshr lt!145530 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66605 (= lt!145530 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66605 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154434 (let ((h!5273 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29177 (bvmul (bvxor h!5273 (bvlshr h!5273 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29177 (bvlshr x!29177 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154434 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154434 #b00000000000000000000000000000000))))))

(assert (=> d!66605 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145531 (bvlshr lt!145531 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293418 d!66605))

(declare-fun d!66609 () Bool)

(assert (=> d!66609 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293415 d!66609))

(declare-fun b!293627 () Bool)

(declare-fun e!185665 () Bool)

(declare-fun e!185666 () Bool)

(assert (=> b!293627 (= e!185665 e!185666)))

(declare-fun lt!145546 () (_ BitVec 64))

(assert (=> b!293627 (= lt!145546 (select (arr!7055 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9188 0))(
  ( (Unit!9189) )
))
(declare-fun lt!145545 () Unit!9188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14868 (_ BitVec 64) (_ BitVec 32)) Unit!9188)

(assert (=> b!293627 (= lt!145545 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145546 #b00000000000000000000000000000000))))

(assert (=> b!293627 (arrayContainsKey!0 a!3312 lt!145546 #b00000000000000000000000000000000)))

(declare-fun lt!145544 () Unit!9188)

(assert (=> b!293627 (= lt!145544 lt!145545)))

(declare-fun res!154445 () Bool)

(assert (=> b!293627 (= res!154445 (= (seekEntryOrOpen!0 (select (arr!7055 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2204 #b00000000000000000000000000000000)))))

(assert (=> b!293627 (=> (not res!154445) (not e!185666))))

(declare-fun b!293628 () Bool)

(declare-fun e!185664 () Bool)

(assert (=> b!293628 (= e!185664 e!185665)))

(declare-fun c!47160 () Bool)

(assert (=> b!293628 (= c!47160 (validKeyInArray!0 (select (arr!7055 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293629 () Bool)

(declare-fun call!25678 () Bool)

(assert (=> b!293629 (= e!185666 call!25678)))

(declare-fun d!66611 () Bool)

(declare-fun res!154446 () Bool)

(assert (=> d!66611 (=> res!154446 e!185664)))

(assert (=> d!66611 (= res!154446 (bvsge #b00000000000000000000000000000000 (size!7407 a!3312)))))

(assert (=> d!66611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185664)))

(declare-fun b!293630 () Bool)

(assert (=> b!293630 (= e!185665 call!25678)))

(declare-fun bm!25675 () Bool)

(assert (=> bm!25675 (= call!25678 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66611 (not res!154446)) b!293628))

(assert (= (and b!293628 c!47160) b!293627))

(assert (= (and b!293628 (not c!47160)) b!293630))

(assert (= (and b!293627 res!154445) b!293629))

(assert (= (or b!293629 b!293630) bm!25675))

(assert (=> b!293627 m!307185))

(declare-fun m!307259 () Bool)

(assert (=> b!293627 m!307259))

(declare-fun m!307261 () Bool)

(assert (=> b!293627 m!307261))

(assert (=> b!293627 m!307185))

(declare-fun m!307263 () Bool)

(assert (=> b!293627 m!307263))

(assert (=> b!293628 m!307185))

(assert (=> b!293628 m!307185))

(declare-fun m!307265 () Bool)

(assert (=> b!293628 m!307265))

(declare-fun m!307267 () Bool)

(assert (=> bm!25675 m!307267))

(assert (=> b!293420 d!66611))

(declare-fun b!293661 () Bool)

(declare-fun e!185683 () SeekEntryResult!2204)

(declare-fun lt!145563 () SeekEntryResult!2204)

(assert (=> b!293661 (= e!185683 (MissingZero!2204 (index!10988 lt!145563)))))

(declare-fun b!293662 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14868 (_ BitVec 32)) SeekEntryResult!2204)

(assert (=> b!293662 (= e!185683 (seekKeyOrZeroReturnVacant!0 (x!29169 lt!145563) (index!10988 lt!145563) (index!10988 lt!145563) k!2524 a!3312 mask!3809))))

(declare-fun d!66615 () Bool)

(declare-fun lt!145562 () SeekEntryResult!2204)

(assert (=> d!66615 (and (or (is-Undefined!2204 lt!145562) (not (is-Found!2204 lt!145562)) (and (bvsge (index!10987 lt!145562) #b00000000000000000000000000000000) (bvslt (index!10987 lt!145562) (size!7407 a!3312)))) (or (is-Undefined!2204 lt!145562) (is-Found!2204 lt!145562) (not (is-MissingZero!2204 lt!145562)) (and (bvsge (index!10986 lt!145562) #b00000000000000000000000000000000) (bvslt (index!10986 lt!145562) (size!7407 a!3312)))) (or (is-Undefined!2204 lt!145562) (is-Found!2204 lt!145562) (is-MissingZero!2204 lt!145562) (not (is-MissingVacant!2204 lt!145562)) (and (bvsge (index!10989 lt!145562) #b00000000000000000000000000000000) (bvslt (index!10989 lt!145562) (size!7407 a!3312)))) (or (is-Undefined!2204 lt!145562) (ite (is-Found!2204 lt!145562) (= (select (arr!7055 a!3312) (index!10987 lt!145562)) k!2524) (ite (is-MissingZero!2204 lt!145562) (= (select (arr!7055 a!3312) (index!10986 lt!145562)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2204 lt!145562) (= (select (arr!7055 a!3312) (index!10989 lt!145562)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185684 () SeekEntryResult!2204)

(assert (=> d!66615 (= lt!145562 e!185684)))

(declare-fun c!47176 () Bool)

(assert (=> d!66615 (= c!47176 (and (is-Intermediate!2204 lt!145563) (undefined!3016 lt!145563)))))

(assert (=> d!66615 (= lt!145563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66615 (validMask!0 mask!3809)))

(assert (=> d!66615 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145562)))

(declare-fun b!293663 () Bool)

(assert (=> b!293663 (= e!185684 Undefined!2204)))

(declare-fun b!293664 () Bool)

(declare-fun e!185682 () SeekEntryResult!2204)

(assert (=> b!293664 (= e!185684 e!185682)))

(declare-fun lt!145564 () (_ BitVec 64))

(assert (=> b!293664 (= lt!145564 (select (arr!7055 a!3312) (index!10988 lt!145563)))))

(declare-fun c!47178 () Bool)

(assert (=> b!293664 (= c!47178 (= lt!145564 k!2524))))

(declare-fun b!293665 () Bool)

(declare-fun c!47177 () Bool)

(assert (=> b!293665 (= c!47177 (= lt!145564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293665 (= e!185682 e!185683)))

(declare-fun b!293666 () Bool)

(assert (=> b!293666 (= e!185682 (Found!2204 (index!10988 lt!145563)))))

(assert (= (and d!66615 c!47176) b!293663))

(assert (= (and d!66615 (not c!47176)) b!293664))

(assert (= (and b!293664 c!47178) b!293666))

(assert (= (and b!293664 (not c!47178)) b!293665))

(assert (= (and b!293665 c!47177) b!293661))

(assert (= (and b!293665 (not c!47177)) b!293662))

(declare-fun m!307281 () Bool)

(assert (=> b!293662 m!307281))

(assert (=> d!66615 m!307143))

(assert (=> d!66615 m!307125))

(declare-fun m!307283 () Bool)

(assert (=> d!66615 m!307283))

(declare-fun m!307285 () Bool)

(assert (=> d!66615 m!307285))

(assert (=> d!66615 m!307143))

(declare-fun m!307287 () Bool)

(assert (=> d!66615 m!307287))

(declare-fun m!307289 () Bool)

(assert (=> d!66615 m!307289))

(declare-fun m!307291 () Bool)

(assert (=> b!293664 m!307291))

(assert (=> b!293416 d!66615))

(push 1)

(assert (not d!66587))

(assert (not bm!25675))

(assert (not d!66615))

(assert (not b!293480))

(assert (not b!293596))

(assert (not b!293627))

(assert (not b!293578))

(assert (not d!66601))

(assert (not b!293628))

(assert (not b!293662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

