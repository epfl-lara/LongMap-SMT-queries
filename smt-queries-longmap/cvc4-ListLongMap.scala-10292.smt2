; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121024 () Bool)

(assert start!121024)

(declare-fun b!1407472 () Bool)

(declare-fun e!796610 () Bool)

(declare-fun e!796607 () Bool)

(assert (=> b!1407472 (= e!796610 (not e!796607))))

(declare-fun res!945364 () Bool)

(assert (=> b!1407472 (=> res!945364 e!796607)))

(declare-datatypes ((SeekEntryResult!10770 0))(
  ( (MissingZero!10770 (index!45457 (_ BitVec 32))) (Found!10770 (index!45458 (_ BitVec 32))) (Intermediate!10770 (undefined!11582 Bool) (index!45459 (_ BitVec 32)) (x!127061 (_ BitVec 32))) (Undefined!10770) (MissingVacant!10770 (index!45460 (_ BitVec 32))) )
))
(declare-fun lt!619803 () SeekEntryResult!10770)

(assert (=> b!1407472 (= res!945364 (or (not (is-Intermediate!10770 lt!619803)) (undefined!11582 lt!619803)))))

(declare-fun e!796608 () Bool)

(assert (=> b!1407472 e!796608))

(declare-fun res!945365 () Bool)

(assert (=> b!1407472 (=> (not res!945365) (not e!796608))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96229 0))(
  ( (array!96230 (arr!46459 (Array (_ BitVec 32) (_ BitVec 64))) (size!47009 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96229)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96229 (_ BitVec 32)) Bool)

(assert (=> b!1407472 (= res!945365 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47514 0))(
  ( (Unit!47515) )
))
(declare-fun lt!619801 () Unit!47514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47514)

(assert (=> b!1407472 (= lt!619801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619802 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96229 (_ BitVec 32)) SeekEntryResult!10770)

(assert (=> b!1407472 (= lt!619803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619802 (select (arr!46459 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407472 (= lt!619802 (toIndex!0 (select (arr!46459 a!2901) j!112) mask!2840))))

(declare-fun b!1407473 () Bool)

(declare-fun res!945362 () Bool)

(assert (=> b!1407473 (=> res!945362 e!796607)))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407473 (= res!945362 (not (= lt!619803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901)) mask!2840))))))

(declare-fun b!1407474 () Bool)

(declare-fun res!945360 () Bool)

(assert (=> b!1407474 (=> (not res!945360) (not e!796610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407474 (= res!945360 (validKeyInArray!0 (select (arr!46459 a!2901) i!1037)))))

(declare-fun b!1407475 () Bool)

(declare-fun res!945367 () Bool)

(assert (=> b!1407475 (=> (not res!945367) (not e!796610))))

(assert (=> b!1407475 (= res!945367 (validKeyInArray!0 (select (arr!46459 a!2901) j!112)))))

(declare-fun b!1407476 () Bool)

(declare-fun res!945366 () Bool)

(assert (=> b!1407476 (=> (not res!945366) (not e!796610))))

(assert (=> b!1407476 (= res!945366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407477 () Bool)

(declare-fun res!945361 () Bool)

(assert (=> b!1407477 (=> (not res!945361) (not e!796610))))

(assert (=> b!1407477 (= res!945361 (and (= (size!47009 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47009 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47009 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407478 () Bool)

(assert (=> b!1407478 (= e!796607 (or (bvslt (x!127061 lt!619803) #b00000000000000000000000000000000) (bvsgt (x!127061 lt!619803) #b01111111111111111111111111111110) (bvslt lt!619802 #b00000000000000000000000000000000) (bvsge lt!619802 (size!47009 a!2901)) (and (bvsge (index!45459 lt!619803) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619803) (size!47009 a!2901)))))))

(declare-fun b!1407479 () Bool)

(declare-fun res!945359 () Bool)

(assert (=> b!1407479 (=> (not res!945359) (not e!796610))))

(declare-datatypes ((List!32978 0))(
  ( (Nil!32975) (Cons!32974 (h!34234 (_ BitVec 64)) (t!47672 List!32978)) )
))
(declare-fun arrayNoDuplicates!0 (array!96229 (_ BitVec 32) List!32978) Bool)

(assert (=> b!1407479 (= res!945359 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32975))))

(declare-fun res!945363 () Bool)

(assert (=> start!121024 (=> (not res!945363) (not e!796610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121024 (= res!945363 (validMask!0 mask!2840))))

(assert (=> start!121024 e!796610))

(assert (=> start!121024 true))

(declare-fun array_inv!35487 (array!96229) Bool)

(assert (=> start!121024 (array_inv!35487 a!2901)))

(declare-fun b!1407480 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96229 (_ BitVec 32)) SeekEntryResult!10770)

(assert (=> b!1407480 (= e!796608 (= (seekEntryOrOpen!0 (select (arr!46459 a!2901) j!112) a!2901 mask!2840) (Found!10770 j!112)))))

(assert (= (and start!121024 res!945363) b!1407477))

(assert (= (and b!1407477 res!945361) b!1407474))

(assert (= (and b!1407474 res!945360) b!1407475))

(assert (= (and b!1407475 res!945367) b!1407476))

(assert (= (and b!1407476 res!945366) b!1407479))

(assert (= (and b!1407479 res!945359) b!1407472))

(assert (= (and b!1407472 res!945365) b!1407480))

(assert (= (and b!1407472 (not res!945364)) b!1407473))

(assert (= (and b!1407473 (not res!945362)) b!1407478))

(declare-fun m!1296593 () Bool)

(assert (=> b!1407472 m!1296593))

(declare-fun m!1296595 () Bool)

(assert (=> b!1407472 m!1296595))

(assert (=> b!1407472 m!1296593))

(declare-fun m!1296597 () Bool)

(assert (=> b!1407472 m!1296597))

(assert (=> b!1407472 m!1296593))

(declare-fun m!1296599 () Bool)

(assert (=> b!1407472 m!1296599))

(declare-fun m!1296601 () Bool)

(assert (=> b!1407472 m!1296601))

(assert (=> b!1407480 m!1296593))

(assert (=> b!1407480 m!1296593))

(declare-fun m!1296603 () Bool)

(assert (=> b!1407480 m!1296603))

(declare-fun m!1296605 () Bool)

(assert (=> b!1407473 m!1296605))

(declare-fun m!1296607 () Bool)

(assert (=> b!1407473 m!1296607))

(assert (=> b!1407473 m!1296607))

(declare-fun m!1296609 () Bool)

(assert (=> b!1407473 m!1296609))

(assert (=> b!1407473 m!1296609))

(assert (=> b!1407473 m!1296607))

(declare-fun m!1296611 () Bool)

(assert (=> b!1407473 m!1296611))

(declare-fun m!1296613 () Bool)

(assert (=> b!1407479 m!1296613))

(declare-fun m!1296615 () Bool)

(assert (=> b!1407474 m!1296615))

(assert (=> b!1407474 m!1296615))

(declare-fun m!1296617 () Bool)

(assert (=> b!1407474 m!1296617))

(assert (=> b!1407475 m!1296593))

(assert (=> b!1407475 m!1296593))

(declare-fun m!1296619 () Bool)

(assert (=> b!1407475 m!1296619))

(declare-fun m!1296621 () Bool)

(assert (=> b!1407476 m!1296621))

(declare-fun m!1296623 () Bool)

(assert (=> start!121024 m!1296623))

(declare-fun m!1296625 () Bool)

(assert (=> start!121024 m!1296625))

(push 1)

(assert (not b!1407474))

(assert (not b!1407476))

(assert (not b!1407480))

(assert (not b!1407473))

(assert (not b!1407479))

(assert (not b!1407475))

(assert (not b!1407472))

(assert (not start!121024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151601 () Bool)

(declare-fun lt!619845 () SeekEntryResult!10770)

(assert (=> d!151601 (and (or (is-Undefined!10770 lt!619845) (not (is-Found!10770 lt!619845)) (and (bvsge (index!45458 lt!619845) #b00000000000000000000000000000000) (bvslt (index!45458 lt!619845) (size!47009 a!2901)))) (or (is-Undefined!10770 lt!619845) (is-Found!10770 lt!619845) (not (is-MissingZero!10770 lt!619845)) (and (bvsge (index!45457 lt!619845) #b00000000000000000000000000000000) (bvslt (index!45457 lt!619845) (size!47009 a!2901)))) (or (is-Undefined!10770 lt!619845) (is-Found!10770 lt!619845) (is-MissingZero!10770 lt!619845) (not (is-MissingVacant!10770 lt!619845)) (and (bvsge (index!45460 lt!619845) #b00000000000000000000000000000000) (bvslt (index!45460 lt!619845) (size!47009 a!2901)))) (or (is-Undefined!10770 lt!619845) (ite (is-Found!10770 lt!619845) (= (select (arr!46459 a!2901) (index!45458 lt!619845)) (select (arr!46459 a!2901) j!112)) (ite (is-MissingZero!10770 lt!619845) (= (select (arr!46459 a!2901) (index!45457 lt!619845)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10770 lt!619845) (= (select (arr!46459 a!2901) (index!45460 lt!619845)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!796655 () SeekEntryResult!10770)

(assert (=> d!151601 (= lt!619845 e!796655)))

(declare-fun c!130550 () Bool)

(declare-fun lt!619843 () SeekEntryResult!10770)

(assert (=> d!151601 (= c!130550 (and (is-Intermediate!10770 lt!619843) (undefined!11582 lt!619843)))))

(assert (=> d!151601 (= lt!619843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46459 a!2901) j!112) mask!2840) (select (arr!46459 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151601 (validMask!0 mask!2840)))

(assert (=> d!151601 (= (seekEntryOrOpen!0 (select (arr!46459 a!2901) j!112) a!2901 mask!2840) lt!619845)))

(declare-fun e!796656 () SeekEntryResult!10770)

(declare-fun b!1407552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96229 (_ BitVec 32)) SeekEntryResult!10770)

(assert (=> b!1407552 (= e!796656 (seekKeyOrZeroReturnVacant!0 (x!127061 lt!619843) (index!45459 lt!619843) (index!45459 lt!619843) (select (arr!46459 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407553 () Bool)

(assert (=> b!1407553 (= e!796655 Undefined!10770)))

(declare-fun b!1407554 () Bool)

(assert (=> b!1407554 (= e!796656 (MissingZero!10770 (index!45459 lt!619843)))))

(declare-fun b!1407555 () Bool)

(declare-fun e!796653 () SeekEntryResult!10770)

(assert (=> b!1407555 (= e!796655 e!796653)))

(declare-fun lt!619844 () (_ BitVec 64))

(assert (=> b!1407555 (= lt!619844 (select (arr!46459 a!2901) (index!45459 lt!619843)))))

(declare-fun c!130551 () Bool)

(assert (=> b!1407555 (= c!130551 (= lt!619844 (select (arr!46459 a!2901) j!112)))))

(declare-fun b!1407556 () Bool)

(declare-fun c!130549 () Bool)

(assert (=> b!1407556 (= c!130549 (= lt!619844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407556 (= e!796653 e!796656)))

(declare-fun b!1407557 () Bool)

(assert (=> b!1407557 (= e!796653 (Found!10770 (index!45459 lt!619843)))))

(assert (= (and d!151601 c!130550) b!1407553))

(assert (= (and d!151601 (not c!130550)) b!1407555))

(assert (= (and b!1407555 c!130551) b!1407557))

(assert (= (and b!1407555 (not c!130551)) b!1407556))

(assert (= (and b!1407556 c!130549) b!1407554))

(assert (= (and b!1407556 (not c!130549)) b!1407552))

(assert (=> d!151601 m!1296593))

(assert (=> d!151601 m!1296597))

(declare-fun m!1296655 () Bool)

(assert (=> d!151601 m!1296655))

(declare-fun m!1296657 () Bool)

(assert (=> d!151601 m!1296657))

(assert (=> d!151601 m!1296597))

(assert (=> d!151601 m!1296593))

(declare-fun m!1296659 () Bool)

(assert (=> d!151601 m!1296659))

(assert (=> d!151601 m!1296623))

(declare-fun m!1296661 () Bool)

(assert (=> d!151601 m!1296661))

(assert (=> b!1407552 m!1296593))

(declare-fun m!1296663 () Bool)

(assert (=> b!1407552 m!1296663))

(declare-fun m!1296665 () Bool)

(assert (=> b!1407555 m!1296665))

(assert (=> b!1407480 d!151601))

(declare-fun d!151611 () Bool)

(assert (=> d!151611 (= (validKeyInArray!0 (select (arr!46459 a!2901) j!112)) (and (not (= (select (arr!46459 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46459 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407475 d!151611))

(declare-fun d!151613 () Bool)

(assert (=> d!151613 (= (validKeyInArray!0 (select (arr!46459 a!2901) i!1037)) (and (not (= (select (arr!46459 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46459 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407474 d!151613))

(declare-fun d!151615 () Bool)

(assert (=> d!151615 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121024 d!151615))

(declare-fun d!151619 () Bool)

(assert (=> d!151619 (= (array_inv!35487 a!2901) (bvsge (size!47009 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121024 d!151619))

(declare-fun b!1407631 () Bool)

(declare-fun e!796704 () Bool)

(declare-fun e!796703 () Bool)

(assert (=> b!1407631 (= e!796704 e!796703)))

(declare-fun c!130573 () Bool)

(assert (=> b!1407631 (= c!130573 (validKeyInArray!0 (select (arr!46459 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151621 () Bool)

(declare-fun res!945418 () Bool)

(assert (=> d!151621 (=> res!945418 e!796704)))

(assert (=> d!151621 (= res!945418 (bvsge #b00000000000000000000000000000000 (size!47009 a!2901)))))

(assert (=> d!151621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796704)))

(declare-fun b!1407632 () Bool)

(declare-fun e!796705 () Bool)

(assert (=> b!1407632 (= e!796703 e!796705)))

(declare-fun lt!619883 () (_ BitVec 64))

(assert (=> b!1407632 (= lt!619883 (select (arr!46459 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619885 () Unit!47514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96229 (_ BitVec 64) (_ BitVec 32)) Unit!47514)

(assert (=> b!1407632 (= lt!619885 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619883 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407632 (arrayContainsKey!0 a!2901 lt!619883 #b00000000000000000000000000000000)))

(declare-fun lt!619884 () Unit!47514)

(assert (=> b!1407632 (= lt!619884 lt!619885)))

(declare-fun res!945419 () Bool)

(assert (=> b!1407632 (= res!945419 (= (seekEntryOrOpen!0 (select (arr!46459 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10770 #b00000000000000000000000000000000)))))

(assert (=> b!1407632 (=> (not res!945419) (not e!796705))))

(declare-fun bm!67001 () Bool)

(declare-fun call!67004 () Bool)

(assert (=> bm!67001 (= call!67004 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407633 () Bool)

(assert (=> b!1407633 (= e!796705 call!67004)))

(declare-fun b!1407634 () Bool)

(assert (=> b!1407634 (= e!796703 call!67004)))

(assert (= (and d!151621 (not res!945418)) b!1407631))

(assert (= (and b!1407631 c!130573) b!1407632))

(assert (= (and b!1407631 (not c!130573)) b!1407634))

(assert (= (and b!1407632 res!945419) b!1407633))

(assert (= (or b!1407633 b!1407634) bm!67001))

(declare-fun m!1296711 () Bool)

(assert (=> b!1407631 m!1296711))

(assert (=> b!1407631 m!1296711))

(declare-fun m!1296713 () Bool)

(assert (=> b!1407631 m!1296713))

(assert (=> b!1407632 m!1296711))

(declare-fun m!1296715 () Bool)

(assert (=> b!1407632 m!1296715))

(declare-fun m!1296717 () Bool)

(assert (=> b!1407632 m!1296717))

(assert (=> b!1407632 m!1296711))

(declare-fun m!1296719 () Bool)

(assert (=> b!1407632 m!1296719))

(declare-fun m!1296721 () Bool)

(assert (=> bm!67001 m!1296721))

(assert (=> b!1407476 d!151621))

(declare-fun b!1407635 () Bool)

(declare-fun e!796707 () Bool)

(declare-fun e!796706 () Bool)

(assert (=> b!1407635 (= e!796707 e!796706)))

(declare-fun c!130574 () Bool)

(assert (=> b!1407635 (= c!130574 (validKeyInArray!0 (select (arr!46459 a!2901) j!112)))))

(declare-fun d!151641 () Bool)

(declare-fun res!945420 () Bool)

(assert (=> d!151641 (=> res!945420 e!796707)))

(assert (=> d!151641 (= res!945420 (bvsge j!112 (size!47009 a!2901)))))

(assert (=> d!151641 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796707)))

(declare-fun b!1407636 () Bool)

(declare-fun e!796708 () Bool)

(assert (=> b!1407636 (= e!796706 e!796708)))

(declare-fun lt!619886 () (_ BitVec 64))

(assert (=> b!1407636 (= lt!619886 (select (arr!46459 a!2901) j!112))))

(declare-fun lt!619888 () Unit!47514)

(assert (=> b!1407636 (= lt!619888 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619886 j!112))))

(assert (=> b!1407636 (arrayContainsKey!0 a!2901 lt!619886 #b00000000000000000000000000000000)))

(declare-fun lt!619887 () Unit!47514)

(assert (=> b!1407636 (= lt!619887 lt!619888)))

(declare-fun res!945421 () Bool)

(assert (=> b!1407636 (= res!945421 (= (seekEntryOrOpen!0 (select (arr!46459 a!2901) j!112) a!2901 mask!2840) (Found!10770 j!112)))))

(assert (=> b!1407636 (=> (not res!945421) (not e!796708))))

(declare-fun call!67005 () Bool)

(declare-fun bm!67002 () Bool)

(assert (=> bm!67002 (= call!67005 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407637 () Bool)

(assert (=> b!1407637 (= e!796708 call!67005)))

(declare-fun b!1407638 () Bool)

(assert (=> b!1407638 (= e!796706 call!67005)))

(assert (= (and d!151641 (not res!945420)) b!1407635))

(assert (= (and b!1407635 c!130574) b!1407636))

(assert (= (and b!1407635 (not c!130574)) b!1407638))

(assert (= (and b!1407636 res!945421) b!1407637))

(assert (= (or b!1407637 b!1407638) bm!67002))

(assert (=> b!1407635 m!1296593))

(assert (=> b!1407635 m!1296593))

(assert (=> b!1407635 m!1296619))

(assert (=> b!1407636 m!1296593))

(declare-fun m!1296723 () Bool)

(assert (=> b!1407636 m!1296723))

(declare-fun m!1296725 () Bool)

(assert (=> b!1407636 m!1296725))

(assert (=> b!1407636 m!1296593))

(assert (=> b!1407636 m!1296603))

(declare-fun m!1296727 () Bool)

(assert (=> bm!67002 m!1296727))

(assert (=> b!1407472 d!151641))

(declare-fun d!151643 () Bool)

(assert (=> d!151643 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619891 () Unit!47514)

(declare-fun choose!38 (array!96229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47514)

(assert (=> d!151643 (= lt!619891 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151643 (validMask!0 mask!2840)))

(assert (=> d!151643 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619891)))

(declare-fun bs!41023 () Bool)

(assert (= bs!41023 d!151643))

(assert (=> bs!41023 m!1296601))

(declare-fun m!1296729 () Bool)

(assert (=> bs!41023 m!1296729))

(assert (=> bs!41023 m!1296623))

(assert (=> b!1407472 d!151643))

(declare-fun b!1407699 () Bool)

(declare-fun e!796745 () SeekEntryResult!10770)

(assert (=> b!1407699 (= e!796745 (Intermediate!10770 false lt!619802 #b00000000000000000000000000000000))))

(declare-fun d!151645 () Bool)

(declare-fun e!796748 () Bool)

(assert (=> d!151645 e!796748))

(declare-fun c!130596 () Bool)

(declare-fun lt!619909 () SeekEntryResult!10770)

(assert (=> d!151645 (= c!130596 (and (is-Intermediate!10770 lt!619909) (undefined!11582 lt!619909)))))

(declare-fun e!796747 () SeekEntryResult!10770)

(assert (=> d!151645 (= lt!619909 e!796747)))

(declare-fun c!130598 () Bool)

(assert (=> d!151645 (= c!130598 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619910 () (_ BitVec 64))

(assert (=> d!151645 (= lt!619910 (select (arr!46459 a!2901) lt!619802))))

(assert (=> d!151645 (validMask!0 mask!2840)))

(assert (=> d!151645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619802 (select (arr!46459 a!2901) j!112) a!2901 mask!2840) lt!619909)))

(declare-fun b!1407700 () Bool)

(assert (=> b!1407700 (= e!796748 (bvsge (x!127061 lt!619909) #b01111111111111111111111111111110))))

(declare-fun b!1407701 () Bool)

(assert (=> b!1407701 (and (bvsge (index!45459 lt!619909) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619909) (size!47009 a!2901)))))

(declare-fun res!945440 () Bool)

(assert (=> b!1407701 (= res!945440 (= (select (arr!46459 a!2901) (index!45459 lt!619909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796749 () Bool)

(assert (=> b!1407701 (=> res!945440 e!796749)))

(declare-fun b!1407702 () Bool)

(declare-fun e!796746 () Bool)

(assert (=> b!1407702 (= e!796748 e!796746)))

(declare-fun res!945441 () Bool)

(assert (=> b!1407702 (= res!945441 (and (is-Intermediate!10770 lt!619909) (not (undefined!11582 lt!619909)) (bvslt (x!127061 lt!619909) #b01111111111111111111111111111110) (bvsge (x!127061 lt!619909) #b00000000000000000000000000000000) (bvsge (x!127061 lt!619909) #b00000000000000000000000000000000)))))

(assert (=> b!1407702 (=> (not res!945441) (not e!796746))))

(declare-fun b!1407703 () Bool)

(assert (=> b!1407703 (and (bvsge (index!45459 lt!619909) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619909) (size!47009 a!2901)))))

(assert (=> b!1407703 (= e!796749 (= (select (arr!46459 a!2901) (index!45459 lt!619909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407704 () Bool)

(assert (=> b!1407704 (= e!796747 (Intermediate!10770 true lt!619802 #b00000000000000000000000000000000))))

(declare-fun b!1407705 () Bool)

(assert (=> b!1407705 (and (bvsge (index!45459 lt!619909) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619909) (size!47009 a!2901)))))

(declare-fun res!945442 () Bool)

(assert (=> b!1407705 (= res!945442 (= (select (arr!46459 a!2901) (index!45459 lt!619909)) (select (arr!46459 a!2901) j!112)))))

(assert (=> b!1407705 (=> res!945442 e!796749)))

(assert (=> b!1407705 (= e!796746 e!796749)))

(declare-fun b!1407706 () Bool)

(assert (=> b!1407706 (= e!796747 e!796745)))

(declare-fun c!130597 () Bool)

(assert (=> b!1407706 (= c!130597 (or (= lt!619910 (select (arr!46459 a!2901) j!112)) (= (bvadd lt!619910 lt!619910) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407707 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407707 (= e!796745 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619802 #b00000000000000000000000000000000 mask!2840) (select (arr!46459 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151645 c!130598) b!1407704))

(assert (= (and d!151645 (not c!130598)) b!1407706))

(assert (= (and b!1407706 c!130597) b!1407699))

(assert (= (and b!1407706 (not c!130597)) b!1407707))

(assert (= (and d!151645 c!130596) b!1407700))

(assert (= (and d!151645 (not c!130596)) b!1407702))

(assert (= (and b!1407702 res!945441) b!1407705))

(assert (= (and b!1407705 (not res!945442)) b!1407701))

(assert (= (and b!1407701 (not res!945440)) b!1407703))

(declare-fun m!1296755 () Bool)

(assert (=> b!1407703 m!1296755))

(assert (=> b!1407701 m!1296755))

(declare-fun m!1296757 () Bool)

(assert (=> b!1407707 m!1296757))

(assert (=> b!1407707 m!1296757))

(assert (=> b!1407707 m!1296593))

(declare-fun m!1296759 () Bool)

(assert (=> b!1407707 m!1296759))

(assert (=> b!1407705 m!1296755))

(declare-fun m!1296761 () Bool)

(assert (=> d!151645 m!1296761))

(assert (=> d!151645 m!1296623))

(assert (=> b!1407472 d!151645))

(declare-fun d!151657 () Bool)

(declare-fun lt!619919 () (_ BitVec 32))

(declare-fun lt!619918 () (_ BitVec 32))

(assert (=> d!151657 (= lt!619919 (bvmul (bvxor lt!619918 (bvlshr lt!619918 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151657 (= lt!619918 ((_ extract 31 0) (bvand (bvxor (select (arr!46459 a!2901) j!112) (bvlshr (select (arr!46459 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151657 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945443 (let ((h!34237 ((_ extract 31 0) (bvand (bvxor (select (arr!46459 a!2901) j!112) (bvlshr (select (arr!46459 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127067 (bvmul (bvxor h!34237 (bvlshr h!34237 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127067 (bvlshr x!127067 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945443 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945443 #b00000000000000000000000000000000))))))

(assert (=> d!151657 (= (toIndex!0 (select (arr!46459 a!2901) j!112) mask!2840) (bvand (bvxor lt!619919 (bvlshr lt!619919 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407472 d!151657))

(declare-fun b!1407722 () Bool)

(declare-fun e!796764 () Bool)

(declare-fun e!796763 () Bool)

(assert (=> b!1407722 (= e!796764 e!796763)))

(declare-fun c!130602 () Bool)

(assert (=> b!1407722 (= c!130602 (validKeyInArray!0 (select (arr!46459 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407723 () Bool)

(declare-fun call!67012 () Bool)

(assert (=> b!1407723 (= e!796763 call!67012)))

(declare-fun b!1407724 () Bool)

(declare-fun e!796761 () Bool)

(declare-fun contains!9802 (List!32978 (_ BitVec 64)) Bool)

(assert (=> b!1407724 (= e!796761 (contains!9802 Nil!32975 (select (arr!46459 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407725 () Bool)

(declare-fun e!796762 () Bool)

(assert (=> b!1407725 (= e!796762 e!796764)))

(declare-fun res!945453 () Bool)

(assert (=> b!1407725 (=> (not res!945453) (not e!796764))))

(assert (=> b!1407725 (= res!945453 (not e!796761))))

(declare-fun res!945452 () Bool)

(assert (=> b!1407725 (=> (not res!945452) (not e!796761))))

(assert (=> b!1407725 (= res!945452 (validKeyInArray!0 (select (arr!46459 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151667 () Bool)

(declare-fun res!945454 () Bool)

(assert (=> d!151667 (=> res!945454 e!796762)))

(assert (=> d!151667 (= res!945454 (bvsge #b00000000000000000000000000000000 (size!47009 a!2901)))))

(assert (=> d!151667 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32975) e!796762)))

(declare-fun bm!67009 () Bool)

(assert (=> bm!67009 (= call!67012 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130602 (Cons!32974 (select (arr!46459 a!2901) #b00000000000000000000000000000000) Nil!32975) Nil!32975)))))

(declare-fun b!1407726 () Bool)

(assert (=> b!1407726 (= e!796763 call!67012)))

(assert (= (and d!151667 (not res!945454)) b!1407725))

(assert (= (and b!1407725 res!945452) b!1407724))

(assert (= (and b!1407725 res!945453) b!1407722))

(assert (= (and b!1407722 c!130602) b!1407723))

(assert (= (and b!1407722 (not c!130602)) b!1407726))

(assert (= (or b!1407723 b!1407726) bm!67009))

(assert (=> b!1407722 m!1296711))

(assert (=> b!1407722 m!1296711))

(assert (=> b!1407722 m!1296713))

(assert (=> b!1407724 m!1296711))

(assert (=> b!1407724 m!1296711))

(declare-fun m!1296771 () Bool)

(assert (=> b!1407724 m!1296771))

(assert (=> b!1407725 m!1296711))

(assert (=> b!1407725 m!1296711))

(assert (=> b!1407725 m!1296713))

(assert (=> bm!67009 m!1296711))

(declare-fun m!1296773 () Bool)

(assert (=> bm!67009 m!1296773))

(assert (=> b!1407479 d!151667))

(declare-fun e!796765 () SeekEntryResult!10770)

(declare-fun b!1407727 () Bool)

(assert (=> b!1407727 (= e!796765 (Intermediate!10770 false (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151669 () Bool)

(declare-fun e!796768 () Bool)

(assert (=> d!151669 e!796768))

(declare-fun c!130603 () Bool)

(declare-fun lt!619920 () SeekEntryResult!10770)

(assert (=> d!151669 (= c!130603 (and (is-Intermediate!10770 lt!619920) (undefined!11582 lt!619920)))))

(declare-fun e!796767 () SeekEntryResult!10770)

(assert (=> d!151669 (= lt!619920 e!796767)))

(declare-fun c!130605 () Bool)

(assert (=> d!151669 (= c!130605 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619921 () (_ BitVec 64))

(assert (=> d!151669 (= lt!619921 (select (arr!46459 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901))) (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151669 (validMask!0 mask!2840)))

(assert (=> d!151669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901)) mask!2840) lt!619920)))

(declare-fun b!1407728 () Bool)

(assert (=> b!1407728 (= e!796768 (bvsge (x!127061 lt!619920) #b01111111111111111111111111111110))))

(declare-fun b!1407729 () Bool)

(assert (=> b!1407729 (and (bvsge (index!45459 lt!619920) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619920) (size!47009 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901)))))))

(declare-fun res!945455 () Bool)

(assert (=> b!1407729 (= res!945455 (= (select (arr!46459 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901))) (index!45459 lt!619920)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796769 () Bool)

(assert (=> b!1407729 (=> res!945455 e!796769)))

(declare-fun b!1407730 () Bool)

(declare-fun e!796766 () Bool)

(assert (=> b!1407730 (= e!796768 e!796766)))

(declare-fun res!945456 () Bool)

(assert (=> b!1407730 (= res!945456 (and (is-Intermediate!10770 lt!619920) (not (undefined!11582 lt!619920)) (bvslt (x!127061 lt!619920) #b01111111111111111111111111111110) (bvsge (x!127061 lt!619920) #b00000000000000000000000000000000) (bvsge (x!127061 lt!619920) #b00000000000000000000000000000000)))))

(assert (=> b!1407730 (=> (not res!945456) (not e!796766))))

(declare-fun b!1407731 () Bool)

(assert (=> b!1407731 (and (bvsge (index!45459 lt!619920) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619920) (size!47009 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901)))))))

(assert (=> b!1407731 (= e!796769 (= (select (arr!46459 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901))) (index!45459 lt!619920)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407732 () Bool)

(assert (=> b!1407732 (= e!796767 (Intermediate!10770 true (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407733 () Bool)

(assert (=> b!1407733 (and (bvsge (index!45459 lt!619920) #b00000000000000000000000000000000) (bvslt (index!45459 lt!619920) (size!47009 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901)))))))

(declare-fun res!945457 () Bool)

(assert (=> b!1407733 (= res!945457 (= (select (arr!46459 (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901))) (index!45459 lt!619920)) (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407733 (=> res!945457 e!796769)))

(assert (=> b!1407733 (= e!796766 e!796769)))

(declare-fun b!1407734 () Bool)

(assert (=> b!1407734 (= e!796767 e!796765)))

(declare-fun c!130604 () Bool)

(assert (=> b!1407734 (= c!130604 (or (= lt!619921 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619921 lt!619921) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407735 () Bool)

(assert (=> b!1407735 (= e!796765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96230 (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47009 a!2901)) mask!2840))))

(assert (= (and d!151669 c!130605) b!1407732))

(assert (= (and d!151669 (not c!130605)) b!1407734))

(assert (= (and b!1407734 c!130604) b!1407727))

(assert (= (and b!1407734 (not c!130604)) b!1407735))

(assert (= (and d!151669 c!130603) b!1407728))

(assert (= (and d!151669 (not c!130603)) b!1407730))

(assert (= (and b!1407730 res!945456) b!1407733))

(assert (= (and b!1407733 (not res!945457)) b!1407729))

(assert (= (and b!1407729 (not res!945455)) b!1407731))

(declare-fun m!1296775 () Bool)

(assert (=> b!1407731 m!1296775))

(assert (=> b!1407729 m!1296775))

(assert (=> b!1407735 m!1296609))

(declare-fun m!1296777 () Bool)

(assert (=> b!1407735 m!1296777))

(assert (=> b!1407735 m!1296777))

(assert (=> b!1407735 m!1296607))

(declare-fun m!1296779 () Bool)

(assert (=> b!1407735 m!1296779))

(assert (=> b!1407733 m!1296775))

(assert (=> d!151669 m!1296609))

(declare-fun m!1296781 () Bool)

(assert (=> d!151669 m!1296781))

(assert (=> d!151669 m!1296623))

(assert (=> b!1407473 d!151669))

(declare-fun d!151671 () Bool)

(declare-fun lt!619923 () (_ BitVec 32))

(declare-fun lt!619922 () (_ BitVec 32))

(assert (=> d!151671 (= lt!619923 (bvmul (bvxor lt!619922 (bvlshr lt!619922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151671 (= lt!619922 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151671 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945443 (let ((h!34237 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127067 (bvmul (bvxor h!34237 (bvlshr h!34237 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127067 (bvlshr x!127067 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945443 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945443 #b00000000000000000000000000000000))))))

(assert (=> d!151671 (= (toIndex!0 (select (store (arr!46459 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619923 (bvlshr lt!619923 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407473 d!151671))

(push 1)

