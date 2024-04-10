; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30830 () Bool)

(assert start!30830)

(declare-fun b!309579 () Bool)

(declare-fun res!166195 () Bool)

(declare-fun e!193376 () Bool)

(assert (=> b!309579 (=> (not res!166195) (not e!193376))))

(declare-datatypes ((array!15783 0))(
  ( (array!15784 (arr!7475 (Array (_ BitVec 32) (_ BitVec 64))) (size!7827 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15783)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309579 (= res!166195 (and (= (select (arr!7475 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7827 a!3293))))))

(declare-fun b!309580 () Bool)

(declare-fun e!193377 () Bool)

(assert (=> b!309580 (= e!193377 e!193376)))

(declare-fun res!166197 () Bool)

(assert (=> b!309580 (=> (not res!166197) (not e!193376))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2615 0))(
  ( (MissingZero!2615 (index!12636 (_ BitVec 32))) (Found!2615 (index!12637 (_ BitVec 32))) (Intermediate!2615 (undefined!3427 Bool) (index!12638 (_ BitVec 32)) (x!30867 (_ BitVec 32))) (Undefined!2615) (MissingVacant!2615 (index!12639 (_ BitVec 32))) )
))
(declare-fun lt!151622 () SeekEntryResult!2615)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15783 (_ BitVec 32)) SeekEntryResult!2615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309580 (= res!166197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151622))))

(assert (=> b!309580 (= lt!151622 (Intermediate!2615 false resIndex!52 resX!52))))

(declare-fun b!309582 () Bool)

(declare-fun res!166194 () Bool)

(assert (=> b!309582 (=> (not res!166194) (not e!193377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309582 (= res!166194 (validKeyInArray!0 k!2441))))

(declare-fun b!309583 () Bool)

(declare-fun res!166193 () Bool)

(assert (=> b!309583 (=> (not res!166193) (not e!193377))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15783 (_ BitVec 32)) SeekEntryResult!2615)

(assert (=> b!309583 (= res!166193 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2615 i!1240)))))

(declare-fun b!309584 () Bool)

(declare-fun res!166196 () Bool)

(assert (=> b!309584 (=> (not res!166196) (not e!193377))))

(declare-fun arrayContainsKey!0 (array!15783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309584 (= res!166196 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309585 () Bool)

(declare-fun e!193378 () Bool)

(assert (=> b!309585 (= e!193376 e!193378)))

(declare-fun res!166192 () Bool)

(assert (=> b!309585 (=> (not res!166192) (not e!193378))))

(declare-fun lt!151623 () SeekEntryResult!2615)

(assert (=> b!309585 (= res!166192 (and (= lt!151623 lt!151622) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7475 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309585 (= lt!151623 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!166198 () Bool)

(assert (=> start!30830 (=> (not res!166198) (not e!193377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30830 (= res!166198 (validMask!0 mask!3709))))

(assert (=> start!30830 e!193377))

(declare-fun array_inv!5438 (array!15783) Bool)

(assert (=> start!30830 (array_inv!5438 a!3293)))

(assert (=> start!30830 true))

(declare-fun b!309581 () Bool)

(declare-fun res!166200 () Bool)

(assert (=> b!309581 (=> (not res!166200) (not e!193377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15783 (_ BitVec 32)) Bool)

(assert (=> b!309581 (= res!166200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309586 () Bool)

(declare-fun res!166199 () Bool)

(assert (=> b!309586 (=> (not res!166199) (not e!193377))))

(assert (=> b!309586 (= res!166199 (and (= (size!7827 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7827 a!3293))))))

(declare-fun b!309587 () Bool)

(declare-fun lt!151621 () (_ BitVec 32))

(assert (=> b!309587 (= e!193378 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!151621 #b00000000000000000000000000000000) (bvslt lt!151621 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(assert (=> b!309587 (= lt!151623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151621 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309587 (= lt!151621 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30830 res!166198) b!309586))

(assert (= (and b!309586 res!166199) b!309582))

(assert (= (and b!309582 res!166194) b!309584))

(assert (= (and b!309584 res!166196) b!309583))

(assert (= (and b!309583 res!166193) b!309581))

(assert (= (and b!309581 res!166200) b!309580))

(assert (= (and b!309580 res!166197) b!309579))

(assert (= (and b!309579 res!166195) b!309585))

(assert (= (and b!309585 res!166192) b!309587))

(declare-fun m!319577 () Bool)

(assert (=> b!309583 m!319577))

(declare-fun m!319579 () Bool)

(assert (=> b!309581 m!319579))

(declare-fun m!319581 () Bool)

(assert (=> b!309582 m!319581))

(declare-fun m!319583 () Bool)

(assert (=> b!309580 m!319583))

(assert (=> b!309580 m!319583))

(declare-fun m!319585 () Bool)

(assert (=> b!309580 m!319585))

(declare-fun m!319587 () Bool)

(assert (=> b!309585 m!319587))

(declare-fun m!319589 () Bool)

(assert (=> b!309585 m!319589))

(declare-fun m!319591 () Bool)

(assert (=> b!309587 m!319591))

(declare-fun m!319593 () Bool)

(assert (=> b!309587 m!319593))

(declare-fun m!319595 () Bool)

(assert (=> b!309579 m!319595))

(declare-fun m!319597 () Bool)

(assert (=> start!30830 m!319597))

(declare-fun m!319599 () Bool)

(assert (=> start!30830 m!319599))

(declare-fun m!319601 () Bool)

(assert (=> b!309584 m!319601))

(push 1)

(assert (not b!309581))

(assert (not b!309584))

(assert (not b!309587))

(assert (not b!309580))

(assert (not b!309583))

(assert (not b!309585))

(assert (not start!30830))

(assert (not b!309582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68351 () Bool)

(declare-fun res!166265 () Bool)

(declare-fun e!193413 () Bool)

(assert (=> d!68351 (=> res!166265 e!193413)))

(assert (=> d!68351 (= res!166265 (= (select (arr!7475 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68351 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!193413)))

(declare-fun b!309652 () Bool)

(declare-fun e!193414 () Bool)

(assert (=> b!309652 (= e!193413 e!193414)))

(declare-fun res!166266 () Bool)

(assert (=> b!309652 (=> (not res!166266) (not e!193414))))

(assert (=> b!309652 (= res!166266 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7827 a!3293)))))

(declare-fun b!309653 () Bool)

(assert (=> b!309653 (= e!193414 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68351 (not res!166265)) b!309652))

(assert (= (and b!309652 res!166266) b!309653))

(declare-fun m!319659 () Bool)

(assert (=> d!68351 m!319659))

(declare-fun m!319661 () Bool)

(assert (=> b!309653 m!319661))

(assert (=> b!309584 d!68351))

(declare-fun d!68357 () Bool)

(declare-fun lt!151657 () SeekEntryResult!2615)

(assert (=> d!68357 (and (or (is-Undefined!2615 lt!151657) (not (is-Found!2615 lt!151657)) (and (bvsge (index!12637 lt!151657) #b00000000000000000000000000000000) (bvslt (index!12637 lt!151657) (size!7827 a!3293)))) (or (is-Undefined!2615 lt!151657) (is-Found!2615 lt!151657) (not (is-MissingZero!2615 lt!151657)) (and (bvsge (index!12636 lt!151657) #b00000000000000000000000000000000) (bvslt (index!12636 lt!151657) (size!7827 a!3293)))) (or (is-Undefined!2615 lt!151657) (is-Found!2615 lt!151657) (is-MissingZero!2615 lt!151657) (not (is-MissingVacant!2615 lt!151657)) (and (bvsge (index!12639 lt!151657) #b00000000000000000000000000000000) (bvslt (index!12639 lt!151657) (size!7827 a!3293)))) (or (is-Undefined!2615 lt!151657) (ite (is-Found!2615 lt!151657) (= (select (arr!7475 a!3293) (index!12637 lt!151657)) k!2441) (ite (is-MissingZero!2615 lt!151657) (= (select (arr!7475 a!3293) (index!12636 lt!151657)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2615 lt!151657) (= (select (arr!7475 a!3293) (index!12639 lt!151657)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!193430 () SeekEntryResult!2615)

(assert (=> d!68357 (= lt!151657 e!193430)))

(declare-fun c!49312 () Bool)

(declare-fun lt!151658 () SeekEntryResult!2615)

(assert (=> d!68357 (= c!49312 (and (is-Intermediate!2615 lt!151658) (undefined!3427 lt!151658)))))

(assert (=> d!68357 (= lt!151658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68357 (validMask!0 mask!3709)))

(assert (=> d!68357 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!151657)))

(declare-fun b!309684 () Bool)

(declare-fun e!193432 () SeekEntryResult!2615)

(assert (=> b!309684 (= e!193432 (MissingZero!2615 (index!12638 lt!151658)))))

(declare-fun b!309685 () Bool)

(assert (=> b!309685 (= e!193430 Undefined!2615)))

(declare-fun b!309686 () Bool)

(declare-fun e!193431 () SeekEntryResult!2615)

(assert (=> b!309686 (= e!193430 e!193431)))

(declare-fun lt!151659 () (_ BitVec 64))

(assert (=> b!309686 (= lt!151659 (select (arr!7475 a!3293) (index!12638 lt!151658)))))

(declare-fun c!49314 () Bool)

(assert (=> b!309686 (= c!49314 (= lt!151659 k!2441))))

(declare-fun b!309687 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15783 (_ BitVec 32)) SeekEntryResult!2615)

(assert (=> b!309687 (= e!193432 (seekKeyOrZeroReturnVacant!0 (x!30867 lt!151658) (index!12638 lt!151658) (index!12638 lt!151658) k!2441 a!3293 mask!3709))))

(declare-fun b!309688 () Bool)

(assert (=> b!309688 (= e!193431 (Found!2615 (index!12638 lt!151658)))))

(declare-fun b!309689 () Bool)

(declare-fun c!49313 () Bool)

(assert (=> b!309689 (= c!49313 (= lt!151659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309689 (= e!193431 e!193432)))

(assert (= (and d!68357 c!49312) b!309685))

(assert (= (and d!68357 (not c!49312)) b!309686))

(assert (= (and b!309686 c!49314) b!309688))

(assert (= (and b!309686 (not c!49314)) b!309689))

(assert (= (and b!309689 c!49313) b!309684))

(assert (= (and b!309689 (not c!49313)) b!309687))

(assert (=> d!68357 m!319583))

(assert (=> d!68357 m!319597))

(declare-fun m!319671 () Bool)

(assert (=> d!68357 m!319671))

(assert (=> d!68357 m!319583))

(assert (=> d!68357 m!319585))

(declare-fun m!319675 () Bool)

(assert (=> d!68357 m!319675))

(declare-fun m!319677 () Bool)

(assert (=> d!68357 m!319677))

(declare-fun m!319679 () Bool)

(assert (=> b!309686 m!319679))

(declare-fun m!319681 () Bool)

(assert (=> b!309687 m!319681))

(assert (=> b!309583 d!68357))

(declare-fun d!68363 () Bool)

(assert (=> d!68363 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!309582 d!68363))

(declare-fun d!68365 () Bool)

(declare-fun e!193477 () Bool)

(assert (=> d!68365 e!193477))

(declare-fun c!49341 () Bool)

(declare-fun lt!151679 () SeekEntryResult!2615)

(assert (=> d!68365 (= c!49341 (and (is-Intermediate!2615 lt!151679) (undefined!3427 lt!151679)))))

(declare-fun e!193476 () SeekEntryResult!2615)

(assert (=> d!68365 (= lt!151679 e!193476)))

(declare-fun c!49340 () Bool)

(assert (=> d!68365 (= c!49340 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!151680 () (_ BitVec 64))

(assert (=> d!68365 (= lt!151680 (select (arr!7475 a!3293) lt!151621))))

(assert (=> d!68365 (validMask!0 mask!3709)))

(assert (=> d!68365 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151621 k!2441 a!3293 mask!3709) lt!151679)))

(declare-fun b!309759 () Bool)

(assert (=> b!309759 (= e!193477 (bvsge (x!30867 lt!151679) #b01111111111111111111111111111110))))

(declare-fun b!309760 () Bool)

(assert (=> b!309760 (and (bvsge (index!12638 lt!151679) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151679) (size!7827 a!3293)))))

(declare-fun res!166290 () Bool)

(assert (=> b!309760 (= res!166290 (= (select (arr!7475 a!3293) (index!12638 lt!151679)) k!2441))))

(declare-fun e!193474 () Bool)

(assert (=> b!309760 (=> res!166290 e!193474)))

(declare-fun e!193473 () Bool)

(assert (=> b!309760 (= e!193473 e!193474)))

(declare-fun b!309761 () Bool)

(assert (=> b!309761 (and (bvsge (index!12638 lt!151679) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151679) (size!7827 a!3293)))))

(declare-fun res!166288 () Bool)

(assert (=> b!309761 (= res!166288 (= (select (arr!7475 a!3293) (index!12638 lt!151679)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309761 (=> res!166288 e!193474)))

(declare-fun b!309762 () Bool)

(assert (=> b!309762 (and (bvsge (index!12638 lt!151679) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151679) (size!7827 a!3293)))))

(assert (=> b!309762 (= e!193474 (= (select (arr!7475 a!3293) (index!12638 lt!151679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309763 () Bool)

(declare-fun e!193475 () SeekEntryResult!2615)

(assert (=> b!309763 (= e!193475 (Intermediate!2615 false lt!151621 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309764 () Bool)

(assert (=> b!309764 (= e!193476 (Intermediate!2615 true lt!151621 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309765 () Bool)

(assert (=> b!309765 (= e!193477 e!193473)))

(declare-fun res!166289 () Bool)

(assert (=> b!309765 (= res!166289 (and (is-Intermediate!2615 lt!151679) (not (undefined!3427 lt!151679)) (bvslt (x!30867 lt!151679) #b01111111111111111111111111111110) (bvsge (x!30867 lt!151679) #b00000000000000000000000000000000) (bvsge (x!30867 lt!151679) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!309765 (=> (not res!166289) (not e!193473))))

(declare-fun b!309766 () Bool)

(assert (=> b!309766 (= e!193475 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!151621 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309767 () Bool)

(assert (=> b!309767 (= e!193476 e!193475)))

(declare-fun c!49339 () Bool)

(assert (=> b!309767 (= c!49339 (or (= lt!151680 k!2441) (= (bvadd lt!151680 lt!151680) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68365 c!49340) b!309764))

(assert (= (and d!68365 (not c!49340)) b!309767))

(assert (= (and b!309767 c!49339) b!309763))

(assert (= (and b!309767 (not c!49339)) b!309766))

(assert (= (and d!68365 c!49341) b!309759))

(assert (= (and d!68365 (not c!49341)) b!309765))

(assert (= (and b!309765 res!166289) b!309760))

(assert (= (and b!309760 (not res!166290)) b!309761))

(assert (= (and b!309761 (not res!166288)) b!309762))

(declare-fun m!319705 () Bool)

(assert (=> b!309766 m!319705))

(assert (=> b!309766 m!319705))

(declare-fun m!319707 () Bool)

(assert (=> b!309766 m!319707))

(declare-fun m!319709 () Bool)

(assert (=> b!309762 m!319709))

(declare-fun m!319711 () Bool)

(assert (=> d!68365 m!319711))

(assert (=> d!68365 m!319597))

(assert (=> b!309760 m!319709))

(assert (=> b!309761 m!319709))

(assert (=> b!309587 d!68365))

(declare-fun d!68379 () Bool)

(declare-fun lt!151686 () (_ BitVec 32))

(assert (=> d!68379 (and (bvsge lt!151686 #b00000000000000000000000000000000) (bvslt lt!151686 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68379 (= lt!151686 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68379 (validMask!0 mask!3709)))

(assert (=> d!68379 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151686)))

(declare-fun bs!10881 () Bool)

(assert (= bs!10881 d!68379))

(declare-fun m!319715 () Bool)

(assert (=> bs!10881 m!319715))

(assert (=> bs!10881 m!319597))

(assert (=> b!309587 d!68379))

(declare-fun d!68383 () Bool)

(assert (=> d!68383 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30830 d!68383))

(declare-fun d!68389 () Bool)

(assert (=> d!68389 (= (array_inv!5438 a!3293) (bvsge (size!7827 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30830 d!68389))

(declare-fun b!309833 () Bool)

(declare-fun e!193520 () Bool)

(declare-fun call!25924 () Bool)

(assert (=> b!309833 (= e!193520 call!25924)))

(declare-fun d!68391 () Bool)

(declare-fun res!166319 () Bool)

(declare-fun e!193519 () Bool)

(assert (=> d!68391 (=> res!166319 e!193519)))

(assert (=> d!68391 (= res!166319 (bvsge #b00000000000000000000000000000000 (size!7827 a!3293)))))

(assert (=> d!68391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!193519)))

(declare-fun bm!25921 () Bool)

(assert (=> bm!25921 (= call!25924 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!309834 () Bool)

(assert (=> b!309834 (= e!193519 e!193520)))

(declare-fun c!49362 () Bool)

(assert (=> b!309834 (= c!49362 (validKeyInArray!0 (select (arr!7475 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!309835 () Bool)

(declare-fun e!193518 () Bool)

(assert (=> b!309835 (= e!193520 e!193518)))

(declare-fun lt!151718 () (_ BitVec 64))

(assert (=> b!309835 (= lt!151718 (select (arr!7475 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9589 0))(
  ( (Unit!9590) )
))
(declare-fun lt!151720 () Unit!9589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15783 (_ BitVec 64) (_ BitVec 32)) Unit!9589)

(assert (=> b!309835 (= lt!151720 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151718 #b00000000000000000000000000000000))))

(assert (=> b!309835 (arrayContainsKey!0 a!3293 lt!151718 #b00000000000000000000000000000000)))

(declare-fun lt!151719 () Unit!9589)

(assert (=> b!309835 (= lt!151719 lt!151720)))

(declare-fun res!166318 () Bool)

(assert (=> b!309835 (= res!166318 (= (seekEntryOrOpen!0 (select (arr!7475 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2615 #b00000000000000000000000000000000)))))

(assert (=> b!309835 (=> (not res!166318) (not e!193518))))

(declare-fun b!309836 () Bool)

(assert (=> b!309836 (= e!193518 call!25924)))

(assert (= (and d!68391 (not res!166319)) b!309834))

(assert (= (and b!309834 c!49362) b!309835))

(assert (= (and b!309834 (not c!49362)) b!309833))

(assert (= (and b!309835 res!166318) b!309836))

(assert (= (or b!309836 b!309833) bm!25921))

(declare-fun m!319747 () Bool)

(assert (=> bm!25921 m!319747))

(assert (=> b!309834 m!319659))

(assert (=> b!309834 m!319659))

(declare-fun m!319749 () Bool)

(assert (=> b!309834 m!319749))

(assert (=> b!309835 m!319659))

(declare-fun m!319751 () Bool)

(assert (=> b!309835 m!319751))

(declare-fun m!319753 () Bool)

(assert (=> b!309835 m!319753))

(assert (=> b!309835 m!319659))

(declare-fun m!319755 () Bool)

(assert (=> b!309835 m!319755))

(assert (=> b!309581 d!68391))

(declare-fun d!68397 () Bool)

(declare-fun e!193525 () Bool)

(assert (=> d!68397 e!193525))

(declare-fun c!49365 () Bool)

(declare-fun lt!151721 () SeekEntryResult!2615)

(assert (=> d!68397 (= c!49365 (and (is-Intermediate!2615 lt!151721) (undefined!3427 lt!151721)))))

(declare-fun e!193524 () SeekEntryResult!2615)

(assert (=> d!68397 (= lt!151721 e!193524)))

(declare-fun c!49364 () Bool)

(assert (=> d!68397 (= c!49364 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!151722 () (_ BitVec 64))

(assert (=> d!68397 (= lt!151722 (select (arr!7475 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68397 (validMask!0 mask!3709)))

(assert (=> d!68397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151721)))

(declare-fun b!309837 () Bool)

(assert (=> b!309837 (= e!193525 (bvsge (x!30867 lt!151721) #b01111111111111111111111111111110))))

(declare-fun b!309838 () Bool)

(assert (=> b!309838 (and (bvsge (index!12638 lt!151721) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151721) (size!7827 a!3293)))))

(declare-fun res!166322 () Bool)

(assert (=> b!309838 (= res!166322 (= (select (arr!7475 a!3293) (index!12638 lt!151721)) k!2441))))

(declare-fun e!193522 () Bool)

(assert (=> b!309838 (=> res!166322 e!193522)))

(declare-fun e!193521 () Bool)

(assert (=> b!309838 (= e!193521 e!193522)))

(declare-fun b!309839 () Bool)

(assert (=> b!309839 (and (bvsge (index!12638 lt!151721) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151721) (size!7827 a!3293)))))

(declare-fun res!166320 () Bool)

(assert (=> b!309839 (= res!166320 (= (select (arr!7475 a!3293) (index!12638 lt!151721)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309839 (=> res!166320 e!193522)))

(declare-fun b!309840 () Bool)

(assert (=> b!309840 (and (bvsge (index!12638 lt!151721) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151721) (size!7827 a!3293)))))

(assert (=> b!309840 (= e!193522 (= (select (arr!7475 a!3293) (index!12638 lt!151721)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309841 () Bool)

(declare-fun e!193523 () SeekEntryResult!2615)

(assert (=> b!309841 (= e!193523 (Intermediate!2615 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309842 () Bool)

(assert (=> b!309842 (= e!193524 (Intermediate!2615 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309843 () Bool)

(assert (=> b!309843 (= e!193525 e!193521)))

(declare-fun res!166321 () Bool)

(assert (=> b!309843 (= res!166321 (and (is-Intermediate!2615 lt!151721) (not (undefined!3427 lt!151721)) (bvslt (x!30867 lt!151721) #b01111111111111111111111111111110) (bvsge (x!30867 lt!151721) #b00000000000000000000000000000000) (bvsge (x!30867 lt!151721) #b00000000000000000000000000000000)))))

(assert (=> b!309843 (=> (not res!166321) (not e!193521))))

(declare-fun b!309844 () Bool)

(assert (=> b!309844 (= e!193523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309845 () Bool)

(assert (=> b!309845 (= e!193524 e!193523)))

(declare-fun c!49363 () Bool)

(assert (=> b!309845 (= c!49363 (or (= lt!151722 k!2441) (= (bvadd lt!151722 lt!151722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68397 c!49364) b!309842))

(assert (= (and d!68397 (not c!49364)) b!309845))

(assert (= (and b!309845 c!49363) b!309841))

(assert (= (and b!309845 (not c!49363)) b!309844))

(assert (= (and d!68397 c!49365) b!309837))

(assert (= (and d!68397 (not c!49365)) b!309843))

(assert (= (and b!309843 res!166321) b!309838))

(assert (= (and b!309838 (not res!166322)) b!309839))

(assert (= (and b!309839 (not res!166320)) b!309840))

(assert (=> b!309844 m!319583))

(declare-fun m!319757 () Bool)

(assert (=> b!309844 m!319757))

(assert (=> b!309844 m!319757))

(declare-fun m!319759 () Bool)

(assert (=> b!309844 m!319759))

(declare-fun m!319761 () Bool)

(assert (=> b!309840 m!319761))

(assert (=> d!68397 m!319583))

(declare-fun m!319763 () Bool)

(assert (=> d!68397 m!319763))

(assert (=> d!68397 m!319597))

(assert (=> b!309838 m!319761))

(assert (=> b!309839 m!319761))

(assert (=> b!309580 d!68397))

(declare-fun d!68399 () Bool)

(declare-fun lt!151736 () (_ BitVec 32))

(declare-fun lt!151735 () (_ BitVec 32))

(assert (=> d!68399 (= lt!151736 (bvmul (bvxor lt!151735 (bvlshr lt!151735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68399 (= lt!151735 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68399 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!166323 (let ((h!5345 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30877 (bvmul (bvxor h!5345 (bvlshr h!5345 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30877 (bvlshr x!30877 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!166323 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!166323 #b00000000000000000000000000000000))))))

(assert (=> d!68399 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!151736 (bvlshr lt!151736 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!309580 d!68399))

(declare-fun d!68405 () Bool)

(declare-fun e!193535 () Bool)

(assert (=> d!68405 e!193535))

(declare-fun c!49371 () Bool)

(declare-fun lt!151737 () SeekEntryResult!2615)

(assert (=> d!68405 (= c!49371 (and (is-Intermediate!2615 lt!151737) (undefined!3427 lt!151737)))))

(declare-fun e!193534 () SeekEntryResult!2615)

(assert (=> d!68405 (= lt!151737 e!193534)))

(declare-fun c!49370 () Bool)

(assert (=> d!68405 (= c!49370 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!151738 () (_ BitVec 64))

(assert (=> d!68405 (= lt!151738 (select (arr!7475 a!3293) index!1781))))

(assert (=> d!68405 (validMask!0 mask!3709)))

(assert (=> d!68405 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151737)))

(declare-fun b!309855 () Bool)

(assert (=> b!309855 (= e!193535 (bvsge (x!30867 lt!151737) #b01111111111111111111111111111110))))

(declare-fun b!309856 () Bool)

(assert (=> b!309856 (and (bvsge (index!12638 lt!151737) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151737) (size!7827 a!3293)))))

(declare-fun res!166329 () Bool)

(assert (=> b!309856 (= res!166329 (= (select (arr!7475 a!3293) (index!12638 lt!151737)) k!2441))))

(declare-fun e!193532 () Bool)

(assert (=> b!309856 (=> res!166329 e!193532)))

(declare-fun e!193531 () Bool)

(assert (=> b!309856 (= e!193531 e!193532)))

(declare-fun b!309857 () Bool)

(assert (=> b!309857 (and (bvsge (index!12638 lt!151737) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151737) (size!7827 a!3293)))))

(declare-fun res!166327 () Bool)

(assert (=> b!309857 (= res!166327 (= (select (arr!7475 a!3293) (index!12638 lt!151737)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309857 (=> res!166327 e!193532)))

(declare-fun b!309858 () Bool)

(assert (=> b!309858 (and (bvsge (index!12638 lt!151737) #b00000000000000000000000000000000) (bvslt (index!12638 lt!151737) (size!7827 a!3293)))))

(assert (=> b!309858 (= e!193532 (= (select (arr!7475 a!3293) (index!12638 lt!151737)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309859 () Bool)

(declare-fun e!193533 () SeekEntryResult!2615)

(assert (=> b!309859 (= e!193533 (Intermediate!2615 false index!1781 x!1427))))

(declare-fun b!309860 () Bool)

(assert (=> b!309860 (= e!193534 (Intermediate!2615 true index!1781 x!1427))))

(declare-fun b!309861 () Bool)

(assert (=> b!309861 (= e!193535 e!193531)))

(declare-fun res!166328 () Bool)

(assert (=> b!309861 (= res!166328 (and (is-Intermediate!2615 lt!151737) (not (undefined!3427 lt!151737)) (bvslt (x!30867 lt!151737) #b01111111111111111111111111111110) (bvsge (x!30867 lt!151737) #b00000000000000000000000000000000) (bvsge (x!30867 lt!151737) x!1427)))))

(assert (=> b!309861 (=> (not res!166328) (not e!193531))))

(declare-fun b!309862 () Bool)

(assert (=> b!309862 (= e!193533 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309863 () Bool)

(assert (=> b!309863 (= e!193534 e!193533)))

(declare-fun c!49369 () Bool)

(assert (=> b!309863 (= c!49369 (or (= lt!151738 k!2441) (= (bvadd lt!151738 lt!151738) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68405 c!49370) b!309860))

(assert (= (and d!68405 (not c!49370)) b!309863))

(assert (= (and b!309863 c!49369) b!309859))

(assert (= (and b!309863 (not c!49369)) b!309862))

(assert (= (and d!68405 c!49371) b!309855))

(assert (= (and d!68405 (not c!49371)) b!309861))

(assert (= (and b!309861 res!166328) b!309856))

(assert (= (and b!309856 (not res!166329)) b!309857))

(assert (= (and b!309857 (not res!166327)) b!309858))

(assert (=> b!309862 m!319593))

(assert (=> b!309862 m!319593))

(declare-fun m!319769 () Bool)

(assert (=> b!309862 m!319769))

(declare-fun m!319771 () Bool)

(assert (=> b!309858 m!319771))

(assert (=> d!68405 m!319587))

(assert (=> d!68405 m!319597))

(assert (=> b!309856 m!319771))

(assert (=> b!309857 m!319771))

(assert (=> b!309585 d!68405))

(push 1)

(assert (not b!309766))

(assert (not d!68405))

(assert (not d!68365))

(assert (not b!309687))

(assert (not b!309834))

(assert (not b!309653))

(assert (not bm!25921))

(assert (not b!309844))

(assert (not b!309862))

(assert (not b!309835))

(assert (not d!68357))

(assert (not d!68397))

(assert (not d!68379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

