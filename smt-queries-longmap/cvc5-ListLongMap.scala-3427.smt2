; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47616 () Bool)

(assert start!47616)

(declare-fun b!523786 () Bool)

(declare-fun e!305485 () Bool)

(declare-fun e!305481 () Bool)

(assert (=> b!523786 (= e!305485 (not e!305481))))

(declare-fun res!320942 () Bool)

(assert (=> b!523786 (=> res!320942 e!305481)))

(declare-datatypes ((array!33316 0))(
  ( (array!33317 (arr!16011 (Array (_ BitVec 32) (_ BitVec 64))) (size!16375 (_ BitVec 32))) )
))
(declare-fun lt!240342 () array!33316)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!240343 () (_ BitVec 32))

(declare-fun lt!240341 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4478 0))(
  ( (MissingZero!4478 (index!20121 (_ BitVec 32))) (Found!4478 (index!20122 (_ BitVec 32))) (Intermediate!4478 (undefined!5290 Bool) (index!20123 (_ BitVec 32)) (x!49106 (_ BitVec 32))) (Undefined!4478) (MissingVacant!4478 (index!20124 (_ BitVec 32))) )
))
(declare-fun lt!240340 () SeekEntryResult!4478)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33316 (_ BitVec 32)) SeekEntryResult!4478)

(assert (=> b!523786 (= res!320942 (= lt!240340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240343 lt!240341 lt!240342 mask!3524)))))

(declare-fun a!3235 () array!33316)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240338 () (_ BitVec 32))

(assert (=> b!523786 (= lt!240340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240338 (select (arr!16011 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523786 (= lt!240343 (toIndex!0 lt!240341 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523786 (= lt!240341 (select (store (arr!16011 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523786 (= lt!240338 (toIndex!0 (select (arr!16011 a!3235) j!176) mask!3524))))

(assert (=> b!523786 (= lt!240342 (array!33317 (store (arr!16011 a!3235) i!1204 k!2280) (size!16375 a!3235)))))

(declare-fun e!305483 () Bool)

(assert (=> b!523786 e!305483))

(declare-fun res!320941 () Bool)

(assert (=> b!523786 (=> (not res!320941) (not e!305483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33316 (_ BitVec 32)) Bool)

(assert (=> b!523786 (= res!320941 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16364 0))(
  ( (Unit!16365) )
))
(declare-fun lt!240339 () Unit!16364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16364)

(assert (=> b!523786 (= lt!240339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523787 () Bool)

(declare-fun res!320946 () Bool)

(declare-fun e!305484 () Bool)

(assert (=> b!523787 (=> (not res!320946) (not e!305484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523787 (= res!320946 (validKeyInArray!0 k!2280))))

(declare-fun b!523788 () Bool)

(declare-fun res!320948 () Bool)

(assert (=> b!523788 (=> (not res!320948) (not e!305484))))

(assert (=> b!523788 (= res!320948 (validKeyInArray!0 (select (arr!16011 a!3235) j!176)))))

(declare-fun b!523789 () Bool)

(declare-fun res!320940 () Bool)

(assert (=> b!523789 (=> (not res!320940) (not e!305484))))

(assert (=> b!523789 (= res!320940 (and (= (size!16375 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16375 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16375 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523790 () Bool)

(assert (=> b!523790 (= e!305481 (or (bvsgt #b00000000000000000000000000000000 (x!49106 lt!240340)) (bvsgt (x!49106 lt!240340) #b01111111111111111111111111111110) (bvslt lt!240338 #b00000000000000000000000000000000) (bvsge lt!240338 (size!16375 a!3235)) (and (bvsge (index!20123 lt!240340) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240340) (size!16375 a!3235)))))))

(assert (=> b!523790 (and (or (= (select (arr!16011 a!3235) (index!20123 lt!240340)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16011 a!3235) (index!20123 lt!240340)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16011 a!3235) (index!20123 lt!240340)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16011 a!3235) (index!20123 lt!240340)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240335 () Unit!16364)

(declare-fun e!305482 () Unit!16364)

(assert (=> b!523790 (= lt!240335 e!305482)))

(declare-fun c!61727 () Bool)

(assert (=> b!523790 (= c!61727 (= (select (arr!16011 a!3235) (index!20123 lt!240340)) (select (arr!16011 a!3235) j!176)))))

(assert (=> b!523790 (and (bvslt (x!49106 lt!240340) #b01111111111111111111111111111110) (or (= (select (arr!16011 a!3235) (index!20123 lt!240340)) (select (arr!16011 a!3235) j!176)) (= (select (arr!16011 a!3235) (index!20123 lt!240340)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16011 a!3235) (index!20123 lt!240340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523791 () Bool)

(declare-fun e!305486 () Bool)

(assert (=> b!523791 (= e!305486 false)))

(declare-fun b!523792 () Bool)

(declare-fun res!320949 () Bool)

(assert (=> b!523792 (=> res!320949 e!305481)))

(assert (=> b!523792 (= res!320949 (or (undefined!5290 lt!240340) (not (is-Intermediate!4478 lt!240340))))))

(declare-fun b!523793 () Bool)

(declare-fun res!320951 () Bool)

(assert (=> b!523793 (=> (not res!320951) (not e!305484))))

(declare-fun arrayContainsKey!0 (array!33316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523793 (= res!320951 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523794 () Bool)

(declare-fun res!320947 () Bool)

(assert (=> b!523794 (=> (not res!320947) (not e!305485))))

(declare-datatypes ((List!10169 0))(
  ( (Nil!10166) (Cons!10165 (h!11093 (_ BitVec 64)) (t!16397 List!10169)) )
))
(declare-fun arrayNoDuplicates!0 (array!33316 (_ BitVec 32) List!10169) Bool)

(assert (=> b!523794 (= res!320947 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10166))))

(declare-fun b!523795 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33316 (_ BitVec 32)) SeekEntryResult!4478)

(assert (=> b!523795 (= e!305483 (= (seekEntryOrOpen!0 (select (arr!16011 a!3235) j!176) a!3235 mask!3524) (Found!4478 j!176)))))

(declare-fun b!523796 () Bool)

(declare-fun Unit!16366 () Unit!16364)

(assert (=> b!523796 (= e!305482 Unit!16366)))

(declare-fun lt!240337 () Unit!16364)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33316 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16364)

(assert (=> b!523796 (= lt!240337 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240338 #b00000000000000000000000000000000 (index!20123 lt!240340) (x!49106 lt!240340) mask!3524))))

(declare-fun res!320943 () Bool)

(assert (=> b!523796 (= res!320943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240338 lt!240341 lt!240342 mask!3524) (Intermediate!4478 false (index!20123 lt!240340) (x!49106 lt!240340))))))

(assert (=> b!523796 (=> (not res!320943) (not e!305486))))

(assert (=> b!523796 e!305486))

(declare-fun b!523797 () Bool)

(declare-fun res!320945 () Bool)

(assert (=> b!523797 (=> (not res!320945) (not e!305485))))

(assert (=> b!523797 (= res!320945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523798 () Bool)

(assert (=> b!523798 (= e!305484 e!305485)))

(declare-fun res!320944 () Bool)

(assert (=> b!523798 (=> (not res!320944) (not e!305485))))

(declare-fun lt!240336 () SeekEntryResult!4478)

(assert (=> b!523798 (= res!320944 (or (= lt!240336 (MissingZero!4478 i!1204)) (= lt!240336 (MissingVacant!4478 i!1204))))))

(assert (=> b!523798 (= lt!240336 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!320950 () Bool)

(assert (=> start!47616 (=> (not res!320950) (not e!305484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47616 (= res!320950 (validMask!0 mask!3524))))

(assert (=> start!47616 e!305484))

(assert (=> start!47616 true))

(declare-fun array_inv!11807 (array!33316) Bool)

(assert (=> start!47616 (array_inv!11807 a!3235)))

(declare-fun b!523799 () Bool)

(declare-fun Unit!16367 () Unit!16364)

(assert (=> b!523799 (= e!305482 Unit!16367)))

(assert (= (and start!47616 res!320950) b!523789))

(assert (= (and b!523789 res!320940) b!523788))

(assert (= (and b!523788 res!320948) b!523787))

(assert (= (and b!523787 res!320946) b!523793))

(assert (= (and b!523793 res!320951) b!523798))

(assert (= (and b!523798 res!320944) b!523797))

(assert (= (and b!523797 res!320945) b!523794))

(assert (= (and b!523794 res!320947) b!523786))

(assert (= (and b!523786 res!320941) b!523795))

(assert (= (and b!523786 (not res!320942)) b!523792))

(assert (= (and b!523792 (not res!320949)) b!523790))

(assert (= (and b!523790 c!61727) b!523796))

(assert (= (and b!523790 (not c!61727)) b!523799))

(assert (= (and b!523796 res!320943) b!523791))

(declare-fun m!504513 () Bool)

(assert (=> b!523793 m!504513))

(declare-fun m!504515 () Bool)

(assert (=> b!523798 m!504515))

(declare-fun m!504517 () Bool)

(assert (=> b!523788 m!504517))

(assert (=> b!523788 m!504517))

(declare-fun m!504519 () Bool)

(assert (=> b!523788 m!504519))

(declare-fun m!504521 () Bool)

(assert (=> b!523794 m!504521))

(declare-fun m!504523 () Bool)

(assert (=> b!523787 m!504523))

(declare-fun m!504525 () Bool)

(assert (=> b!523796 m!504525))

(declare-fun m!504527 () Bool)

(assert (=> b!523796 m!504527))

(declare-fun m!504529 () Bool)

(assert (=> start!47616 m!504529))

(declare-fun m!504531 () Bool)

(assert (=> start!47616 m!504531))

(assert (=> b!523795 m!504517))

(assert (=> b!523795 m!504517))

(declare-fun m!504533 () Bool)

(assert (=> b!523795 m!504533))

(declare-fun m!504535 () Bool)

(assert (=> b!523790 m!504535))

(assert (=> b!523790 m!504517))

(declare-fun m!504537 () Bool)

(assert (=> b!523797 m!504537))

(declare-fun m!504539 () Bool)

(assert (=> b!523786 m!504539))

(declare-fun m!504541 () Bool)

(assert (=> b!523786 m!504541))

(declare-fun m!504543 () Bool)

(assert (=> b!523786 m!504543))

(declare-fun m!504545 () Bool)

(assert (=> b!523786 m!504545))

(assert (=> b!523786 m!504517))

(declare-fun m!504547 () Bool)

(assert (=> b!523786 m!504547))

(assert (=> b!523786 m!504517))

(declare-fun m!504549 () Bool)

(assert (=> b!523786 m!504549))

(assert (=> b!523786 m!504517))

(declare-fun m!504551 () Bool)

(assert (=> b!523786 m!504551))

(declare-fun m!504553 () Bool)

(assert (=> b!523786 m!504553))

(push 1)

(assert (not b!523787))

(assert (not b!523786))

(assert (not b!523796))

(assert (not b!523788))

(assert (not b!523797))

(assert (not b!523798))

(assert (not b!523794))

(assert (not b!523795))

(assert (not start!47616))

(assert (not b!523793))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80635 () Bool)

(assert (=> d!80635 (= (validKeyInArray!0 (select (arr!16011 a!3235) j!176)) (and (not (= (select (arr!16011 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16011 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523788 d!80635))

(declare-fun d!80637 () Bool)

(declare-fun res!321043 () Bool)

(declare-fun e!305552 () Bool)

(assert (=> d!80637 (=> res!321043 e!305552)))

(assert (=> d!80637 (= res!321043 (= (select (arr!16011 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80637 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!305552)))

(declare-fun b!523909 () Bool)

(declare-fun e!305553 () Bool)

(assert (=> b!523909 (= e!305552 e!305553)))

(declare-fun res!321044 () Bool)

(assert (=> b!523909 (=> (not res!321044) (not e!305553))))

(assert (=> b!523909 (= res!321044 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16375 a!3235)))))

(declare-fun b!523910 () Bool)

(assert (=> b!523910 (= e!305553 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80637 (not res!321043)) b!523909))

(assert (= (and b!523909 res!321044) b!523910))

(declare-fun m!504657 () Bool)

(assert (=> d!80637 m!504657))

(declare-fun m!504659 () Bool)

(assert (=> b!523910 m!504659))

(assert (=> b!523793 d!80637))

(declare-fun bm!31853 () Bool)

(declare-fun call!31856 () Bool)

(declare-fun c!61739 () Bool)

(assert (=> bm!31853 (= call!31856 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61739 (Cons!10165 (select (arr!16011 a!3235) #b00000000000000000000000000000000) Nil!10166) Nil!10166)))))

(declare-fun b!523927 () Bool)

(declare-fun e!305571 () Bool)

(declare-fun e!305568 () Bool)

(assert (=> b!523927 (= e!305571 e!305568)))

(declare-fun res!321059 () Bool)

(assert (=> b!523927 (=> (not res!321059) (not e!305568))))

(declare-fun e!305570 () Bool)

(assert (=> b!523927 (= res!321059 (not e!305570))))

(declare-fun res!321057 () Bool)

(assert (=> b!523927 (=> (not res!321057) (not e!305570))))

(assert (=> b!523927 (= res!321057 (validKeyInArray!0 (select (arr!16011 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523928 () Bool)

(declare-fun contains!2770 (List!10169 (_ BitVec 64)) Bool)

(assert (=> b!523928 (= e!305570 (contains!2770 Nil!10166 (select (arr!16011 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523929 () Bool)

(declare-fun e!305569 () Bool)

(assert (=> b!523929 (= e!305569 call!31856)))

(declare-fun b!523930 () Bool)

(assert (=> b!523930 (= e!305569 call!31856)))

(declare-fun d!80641 () Bool)

(declare-fun res!321058 () Bool)

(assert (=> d!80641 (=> res!321058 e!305571)))

(assert (=> d!80641 (= res!321058 (bvsge #b00000000000000000000000000000000 (size!16375 a!3235)))))

(assert (=> d!80641 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10166) e!305571)))

(declare-fun b!523931 () Bool)

(assert (=> b!523931 (= e!305568 e!305569)))

(assert (=> b!523931 (= c!61739 (validKeyInArray!0 (select (arr!16011 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80641 (not res!321058)) b!523927))

(assert (= (and b!523927 res!321057) b!523928))

(assert (= (and b!523927 res!321059) b!523931))

(assert (= (and b!523931 c!61739) b!523929))

(assert (= (and b!523931 (not c!61739)) b!523930))

(assert (= (or b!523929 b!523930) bm!31853))

(assert (=> bm!31853 m!504657))

(declare-fun m!504665 () Bool)

(assert (=> bm!31853 m!504665))

(assert (=> b!523927 m!504657))

(assert (=> b!523927 m!504657))

(declare-fun m!504667 () Bool)

(assert (=> b!523927 m!504667))

(assert (=> b!523928 m!504657))

(assert (=> b!523928 m!504657))

(declare-fun m!504669 () Bool)

(assert (=> b!523928 m!504669))

(assert (=> b!523931 m!504657))

(assert (=> b!523931 m!504657))

(assert (=> b!523931 m!504667))

(assert (=> b!523794 d!80641))

(declare-fun b!523974 () Bool)

(declare-fun e!305596 () SeekEntryResult!4478)

(declare-fun e!305598 () SeekEntryResult!4478)

(assert (=> b!523974 (= e!305596 e!305598)))

(declare-fun lt!240427 () (_ BitVec 64))

(declare-fun lt!240426 () SeekEntryResult!4478)

(assert (=> b!523974 (= lt!240427 (select (arr!16011 a!3235) (index!20123 lt!240426)))))

(declare-fun c!61755 () Bool)

(assert (=> b!523974 (= c!61755 (= lt!240427 (select (arr!16011 a!3235) j!176)))))

(declare-fun d!80649 () Bool)

(declare-fun lt!240425 () SeekEntryResult!4478)

(assert (=> d!80649 (and (or (is-Undefined!4478 lt!240425) (not (is-Found!4478 lt!240425)) (and (bvsge (index!20122 lt!240425) #b00000000000000000000000000000000) (bvslt (index!20122 lt!240425) (size!16375 a!3235)))) (or (is-Undefined!4478 lt!240425) (is-Found!4478 lt!240425) (not (is-MissingZero!4478 lt!240425)) (and (bvsge (index!20121 lt!240425) #b00000000000000000000000000000000) (bvslt (index!20121 lt!240425) (size!16375 a!3235)))) (or (is-Undefined!4478 lt!240425) (is-Found!4478 lt!240425) (is-MissingZero!4478 lt!240425) (not (is-MissingVacant!4478 lt!240425)) (and (bvsge (index!20124 lt!240425) #b00000000000000000000000000000000) (bvslt (index!20124 lt!240425) (size!16375 a!3235)))) (or (is-Undefined!4478 lt!240425) (ite (is-Found!4478 lt!240425) (= (select (arr!16011 a!3235) (index!20122 lt!240425)) (select (arr!16011 a!3235) j!176)) (ite (is-MissingZero!4478 lt!240425) (= (select (arr!16011 a!3235) (index!20121 lt!240425)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4478 lt!240425) (= (select (arr!16011 a!3235) (index!20124 lt!240425)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80649 (= lt!240425 e!305596)))

(declare-fun c!61756 () Bool)

(assert (=> d!80649 (= c!61756 (and (is-Intermediate!4478 lt!240426) (undefined!5290 lt!240426)))))

(assert (=> d!80649 (= lt!240426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16011 a!3235) j!176) mask!3524) (select (arr!16011 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80649 (validMask!0 mask!3524)))

(assert (=> d!80649 (= (seekEntryOrOpen!0 (select (arr!16011 a!3235) j!176) a!3235 mask!3524) lt!240425)))

(declare-fun b!523975 () Bool)

(assert (=> b!523975 (= e!305598 (Found!4478 (index!20123 lt!240426)))))

(declare-fun b!523976 () Bool)

(assert (=> b!523976 (= e!305596 Undefined!4478)))

(declare-fun b!523977 () Bool)

(declare-fun e!305597 () SeekEntryResult!4478)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33316 (_ BitVec 32)) SeekEntryResult!4478)

(assert (=> b!523977 (= e!305597 (seekKeyOrZeroReturnVacant!0 (x!49106 lt!240426) (index!20123 lt!240426) (index!20123 lt!240426) (select (arr!16011 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523978 () Bool)

(assert (=> b!523978 (= e!305597 (MissingZero!4478 (index!20123 lt!240426)))))

(declare-fun b!523979 () Bool)

(declare-fun c!61757 () Bool)

(assert (=> b!523979 (= c!61757 (= lt!240427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523979 (= e!305598 e!305597)))

(assert (= (and d!80649 c!61756) b!523976))

(assert (= (and d!80649 (not c!61756)) b!523974))

(assert (= (and b!523974 c!61755) b!523975))

(assert (= (and b!523974 (not c!61755)) b!523979))

(assert (= (and b!523979 c!61757) b!523978))

(assert (= (and b!523979 (not c!61757)) b!523977))

(declare-fun m!504683 () Bool)

(assert (=> b!523974 m!504683))

(assert (=> d!80649 m!504529))

(assert (=> d!80649 m!504547))

(assert (=> d!80649 m!504517))

(declare-fun m!504685 () Bool)

(assert (=> d!80649 m!504685))

(declare-fun m!504687 () Bool)

(assert (=> d!80649 m!504687))

(assert (=> d!80649 m!504517))

(assert (=> d!80649 m!504547))

(declare-fun m!504689 () Bool)

(assert (=> d!80649 m!504689))

(declare-fun m!504691 () Bool)

(assert (=> d!80649 m!504691))

(assert (=> b!523977 m!504517))

(declare-fun m!504693 () Bool)

(assert (=> b!523977 m!504693))

(assert (=> b!523795 d!80649))

(declare-fun d!80657 () Bool)

(declare-fun e!305625 () Bool)

(assert (=> d!80657 e!305625))

(declare-fun res!321084 () Bool)

(assert (=> d!80657 (=> (not res!321084) (not e!305625))))

(assert (=> d!80657 (= res!321084 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16375 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16375 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16375 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16375 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16375 a!3235))))))

(declare-fun lt!240445 () Unit!16364)

(declare-fun choose!47 (array!33316 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16364)

(assert (=> d!80657 (= lt!240445 (choose!47 a!3235 i!1204 k!2280 j!176 lt!240338 #b00000000000000000000000000000000 (index!20123 lt!240340) (x!49106 lt!240340) mask!3524))))

(assert (=> d!80657 (validMask!0 mask!3524)))

(assert (=> d!80657 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240338 #b00000000000000000000000000000000 (index!20123 lt!240340) (x!49106 lt!240340) mask!3524) lt!240445)))

(declare-fun b!524027 () Bool)

(assert (=> b!524027 (= e!305625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240338 (select (store (arr!16011 a!3235) i!1204 k!2280) j!176) (array!33317 (store (arr!16011 a!3235) i!1204 k!2280) (size!16375 a!3235)) mask!3524) (Intermediate!4478 false (index!20123 lt!240340) (x!49106 lt!240340))))))

(assert (= (and d!80657 res!321084) b!524027))

(declare-fun m!504715 () Bool)

(assert (=> d!80657 m!504715))

(assert (=> d!80657 m!504529))

(assert (=> b!524027 m!504539))

(assert (=> b!524027 m!504543))

(assert (=> b!524027 m!504543))

(declare-fun m!504717 () Bool)

(assert (=> b!524027 m!504717))

(assert (=> b!523796 d!80657))

(declare-fun d!80663 () Bool)

(declare-fun e!305687 () Bool)

(assert (=> d!80663 e!305687))

(declare-fun c!61805 () Bool)

(declare-fun lt!240499 () SeekEntryResult!4478)

(assert (=> d!80663 (= c!61805 (and (is-Intermediate!4478 lt!240499) (undefined!5290 lt!240499)))))

(declare-fun e!305686 () SeekEntryResult!4478)

(assert (=> d!80663 (= lt!240499 e!305686)))

(declare-fun c!61807 () Bool)

(assert (=> d!80663 (= c!61807 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240498 () (_ BitVec 64))

(assert (=> d!80663 (= lt!240498 (select (arr!16011 lt!240342) lt!240338))))

(assert (=> d!80663 (validMask!0 mask!3524)))

(assert (=> d!80663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240338 lt!240341 lt!240342 mask!3524) lt!240499)))

(declare-fun e!305689 () SeekEntryResult!4478)

(declare-fun b!524123 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524123 (= e!305689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240338 #b00000000000000000000000000000000 mask!3524) lt!240341 lt!240342 mask!3524))))

(declare-fun b!524124 () Bool)

(assert (=> b!524124 (= e!305689 (Intermediate!4478 false lt!240338 #b00000000000000000000000000000000))))

(declare-fun b!524125 () Bool)

(assert (=> b!524125 (and (bvsge (index!20123 lt!240499) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240499) (size!16375 lt!240342)))))

(declare-fun res!321124 () Bool)

(assert (=> b!524125 (= res!321124 (= (select (arr!16011 lt!240342) (index!20123 lt!240499)) lt!240341))))

(declare-fun e!305690 () Bool)

(assert (=> b!524125 (=> res!321124 e!305690)))

(declare-fun e!305688 () Bool)

(assert (=> b!524125 (= e!305688 e!305690)))

(declare-fun b!524126 () Bool)

(assert (=> b!524126 (= e!305687 e!305688)))

(declare-fun res!321125 () Bool)

(assert (=> b!524126 (= res!321125 (and (is-Intermediate!4478 lt!240499) (not (undefined!5290 lt!240499)) (bvslt (x!49106 lt!240499) #b01111111111111111111111111111110) (bvsge (x!49106 lt!240499) #b00000000000000000000000000000000) (bvsge (x!49106 lt!240499) #b00000000000000000000000000000000)))))

(assert (=> b!524126 (=> (not res!321125) (not e!305688))))

(declare-fun b!524127 () Bool)

(assert (=> b!524127 (= e!305686 (Intermediate!4478 true lt!240338 #b00000000000000000000000000000000))))

(declare-fun b!524128 () Bool)

(assert (=> b!524128 (= e!305687 (bvsge (x!49106 lt!240499) #b01111111111111111111111111111110))))

(declare-fun b!524129 () Bool)

(assert (=> b!524129 (and (bvsge (index!20123 lt!240499) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240499) (size!16375 lt!240342)))))

(declare-fun res!321123 () Bool)

(assert (=> b!524129 (= res!321123 (= (select (arr!16011 lt!240342) (index!20123 lt!240499)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524129 (=> res!321123 e!305690)))

(declare-fun b!524130 () Bool)

(assert (=> b!524130 (= e!305686 e!305689)))

(declare-fun c!61806 () Bool)

(assert (=> b!524130 (= c!61806 (or (= lt!240498 lt!240341) (= (bvadd lt!240498 lt!240498) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524131 () Bool)

(assert (=> b!524131 (and (bvsge (index!20123 lt!240499) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240499) (size!16375 lt!240342)))))

(assert (=> b!524131 (= e!305690 (= (select (arr!16011 lt!240342) (index!20123 lt!240499)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80663 c!61807) b!524127))

(assert (= (and d!80663 (not c!61807)) b!524130))

(assert (= (and b!524130 c!61806) b!524124))

(assert (= (and b!524130 (not c!61806)) b!524123))

(assert (= (and d!80663 c!61805) b!524128))

(assert (= (and d!80663 (not c!61805)) b!524126))

(assert (= (and b!524126 res!321125) b!524125))

(assert (= (and b!524125 (not res!321124)) b!524129))

(assert (= (and b!524129 (not res!321123)) b!524131))

(declare-fun m!504791 () Bool)

(assert (=> b!524125 m!504791))

(declare-fun m!504793 () Bool)

(assert (=> d!80663 m!504793))

(assert (=> d!80663 m!504529))

(assert (=> b!524129 m!504791))

(declare-fun m!504795 () Bool)

(assert (=> b!524123 m!504795))

(assert (=> b!524123 m!504795))

(declare-fun m!504797 () Bool)

(assert (=> b!524123 m!504797))

(assert (=> b!524131 m!504791))

(assert (=> b!523796 d!80663))

(declare-fun d!80695 () Bool)

(declare-fun lt!240505 () (_ BitVec 32))

(declare-fun lt!240504 () (_ BitVec 32))

(assert (=> d!80695 (= lt!240505 (bvmul (bvxor lt!240504 (bvlshr lt!240504 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80695 (= lt!240504 ((_ extract 31 0) (bvand (bvxor lt!240341 (bvlshr lt!240341 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80695 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321126 (let ((h!11098 ((_ extract 31 0) (bvand (bvxor lt!240341 (bvlshr lt!240341 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49117 (bvmul (bvxor h!11098 (bvlshr h!11098 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49117 (bvlshr x!49117 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321126 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321126 #b00000000000000000000000000000000))))))

(assert (=> d!80695 (= (toIndex!0 lt!240341 mask!3524) (bvand (bvxor lt!240505 (bvlshr lt!240505 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523786 d!80695))

(declare-fun d!80697 () Bool)

(declare-fun lt!240507 () (_ BitVec 32))

(declare-fun lt!240506 () (_ BitVec 32))

(assert (=> d!80697 (= lt!240507 (bvmul (bvxor lt!240506 (bvlshr lt!240506 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80697 (= lt!240506 ((_ extract 31 0) (bvand (bvxor (select (arr!16011 a!3235) j!176) (bvlshr (select (arr!16011 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80697 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321126 (let ((h!11098 ((_ extract 31 0) (bvand (bvxor (select (arr!16011 a!3235) j!176) (bvlshr (select (arr!16011 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49117 (bvmul (bvxor h!11098 (bvlshr h!11098 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49117 (bvlshr x!49117 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321126 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321126 #b00000000000000000000000000000000))))))

(assert (=> d!80697 (= (toIndex!0 (select (arr!16011 a!3235) j!176) mask!3524) (bvand (bvxor lt!240507 (bvlshr lt!240507 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523786 d!80697))

(declare-fun call!31867 () Bool)

(declare-fun bm!31864 () Bool)

(assert (=> bm!31864 (= call!31867 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!524140 () Bool)

(declare-fun e!305698 () Bool)

(assert (=> b!524140 (= e!305698 call!31867)))

(declare-fun b!524141 () Bool)

(declare-fun e!305697 () Bool)

(assert (=> b!524141 (= e!305697 e!305698)))

(declare-fun c!61810 () Bool)

(assert (=> b!524141 (= c!61810 (validKeyInArray!0 (select (arr!16011 a!3235) j!176)))))

(declare-fun d!80699 () Bool)

(declare-fun res!321132 () Bool)

(assert (=> d!80699 (=> res!321132 e!305697)))

(assert (=> d!80699 (= res!321132 (bvsge j!176 (size!16375 a!3235)))))

(assert (=> d!80699 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305697)))

(declare-fun b!524142 () Bool)

(declare-fun e!305699 () Bool)

(assert (=> b!524142 (= e!305698 e!305699)))

(declare-fun lt!240514 () (_ BitVec 64))

(assert (=> b!524142 (= lt!240514 (select (arr!16011 a!3235) j!176))))

(declare-fun lt!240516 () Unit!16364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33316 (_ BitVec 64) (_ BitVec 32)) Unit!16364)

(assert (=> b!524142 (= lt!240516 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240514 j!176))))

(assert (=> b!524142 (arrayContainsKey!0 a!3235 lt!240514 #b00000000000000000000000000000000)))

(declare-fun lt!240515 () Unit!16364)

(assert (=> b!524142 (= lt!240515 lt!240516)))

(declare-fun res!321131 () Bool)

(assert (=> b!524142 (= res!321131 (= (seekEntryOrOpen!0 (select (arr!16011 a!3235) j!176) a!3235 mask!3524) (Found!4478 j!176)))))

(assert (=> b!524142 (=> (not res!321131) (not e!305699))))

(declare-fun b!524143 () Bool)

(assert (=> b!524143 (= e!305699 call!31867)))

(assert (= (and d!80699 (not res!321132)) b!524141))

(assert (= (and b!524141 c!61810) b!524142))

(assert (= (and b!524141 (not c!61810)) b!524140))

(assert (= (and b!524142 res!321131) b!524143))

(assert (= (or b!524143 b!524140) bm!31864))

(declare-fun m!504799 () Bool)

(assert (=> bm!31864 m!504799))

(assert (=> b!524141 m!504517))

(assert (=> b!524141 m!504517))

(assert (=> b!524141 m!504519))

(assert (=> b!524142 m!504517))

(declare-fun m!504801 () Bool)

(assert (=> b!524142 m!504801))

(declare-fun m!504803 () Bool)

(assert (=> b!524142 m!504803))

(assert (=> b!524142 m!504517))

(assert (=> b!524142 m!504533))

(assert (=> b!523786 d!80699))

(declare-fun d!80701 () Bool)

(declare-fun e!305701 () Bool)

(assert (=> d!80701 e!305701))

(declare-fun c!61811 () Bool)

(declare-fun lt!240518 () SeekEntryResult!4478)

(assert (=> d!80701 (= c!61811 (and (is-Intermediate!4478 lt!240518) (undefined!5290 lt!240518)))))

(declare-fun e!305700 () SeekEntryResult!4478)

(assert (=> d!80701 (= lt!240518 e!305700)))

(declare-fun c!61813 () Bool)

(assert (=> d!80701 (= c!61813 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240517 () (_ BitVec 64))

(assert (=> d!80701 (= lt!240517 (select (arr!16011 a!3235) lt!240338))))

(assert (=> d!80701 (validMask!0 mask!3524)))

(assert (=> d!80701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240338 (select (arr!16011 a!3235) j!176) a!3235 mask!3524) lt!240518)))

(declare-fun e!305703 () SeekEntryResult!4478)

(declare-fun b!524144 () Bool)

(assert (=> b!524144 (= e!305703 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240338 #b00000000000000000000000000000000 mask!3524) (select (arr!16011 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!524145 () Bool)

(assert (=> b!524145 (= e!305703 (Intermediate!4478 false lt!240338 #b00000000000000000000000000000000))))

(declare-fun b!524146 () Bool)

(assert (=> b!524146 (and (bvsge (index!20123 lt!240518) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240518) (size!16375 a!3235)))))

(declare-fun res!321134 () Bool)

(assert (=> b!524146 (= res!321134 (= (select (arr!16011 a!3235) (index!20123 lt!240518)) (select (arr!16011 a!3235) j!176)))))

(declare-fun e!305704 () Bool)

(assert (=> b!524146 (=> res!321134 e!305704)))

(declare-fun e!305702 () Bool)

(assert (=> b!524146 (= e!305702 e!305704)))

(declare-fun b!524147 () Bool)

(assert (=> b!524147 (= e!305701 e!305702)))

(declare-fun res!321135 () Bool)

(assert (=> b!524147 (= res!321135 (and (is-Intermediate!4478 lt!240518) (not (undefined!5290 lt!240518)) (bvslt (x!49106 lt!240518) #b01111111111111111111111111111110) (bvsge (x!49106 lt!240518) #b00000000000000000000000000000000) (bvsge (x!49106 lt!240518) #b00000000000000000000000000000000)))))

(assert (=> b!524147 (=> (not res!321135) (not e!305702))))

(declare-fun b!524148 () Bool)

(assert (=> b!524148 (= e!305700 (Intermediate!4478 true lt!240338 #b00000000000000000000000000000000))))

(declare-fun b!524149 () Bool)

(assert (=> b!524149 (= e!305701 (bvsge (x!49106 lt!240518) #b01111111111111111111111111111110))))

(declare-fun b!524150 () Bool)

(assert (=> b!524150 (and (bvsge (index!20123 lt!240518) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240518) (size!16375 a!3235)))))

(declare-fun res!321133 () Bool)

(assert (=> b!524150 (= res!321133 (= (select (arr!16011 a!3235) (index!20123 lt!240518)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524150 (=> res!321133 e!305704)))

(declare-fun b!524151 () Bool)

(assert (=> b!524151 (= e!305700 e!305703)))

(declare-fun c!61812 () Bool)

(assert (=> b!524151 (= c!61812 (or (= lt!240517 (select (arr!16011 a!3235) j!176)) (= (bvadd lt!240517 lt!240517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524152 () Bool)

(assert (=> b!524152 (and (bvsge (index!20123 lt!240518) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240518) (size!16375 a!3235)))))

(assert (=> b!524152 (= e!305704 (= (select (arr!16011 a!3235) (index!20123 lt!240518)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80701 c!61813) b!524148))

(assert (= (and d!80701 (not c!61813)) b!524151))

(assert (= (and b!524151 c!61812) b!524145))

(assert (= (and b!524151 (not c!61812)) b!524144))

(assert (= (and d!80701 c!61811) b!524149))

(assert (= (and d!80701 (not c!61811)) b!524147))

(assert (= (and b!524147 res!321135) b!524146))

(assert (= (and b!524146 (not res!321134)) b!524150))

(assert (= (and b!524150 (not res!321133)) b!524152))

(declare-fun m!504805 () Bool)

(assert (=> b!524146 m!504805))

(declare-fun m!504807 () Bool)

(assert (=> d!80701 m!504807))

(assert (=> d!80701 m!504529))

(assert (=> b!524150 m!504805))

(assert (=> b!524144 m!504795))

(assert (=> b!524144 m!504795))

(assert (=> b!524144 m!504517))

(declare-fun m!504809 () Bool)

(assert (=> b!524144 m!504809))

(assert (=> b!524152 m!504805))

(assert (=> b!523786 d!80701))

(declare-fun d!80703 () Bool)

(assert (=> d!80703 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240527 () Unit!16364)

(declare-fun choose!38 (array!33316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16364)

(assert (=> d!80703 (= lt!240527 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80703 (validMask!0 mask!3524)))

(assert (=> d!80703 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240527)))

(declare-fun bs!16458 () Bool)

(assert (= bs!16458 d!80703))

(assert (=> bs!16458 m!504549))

(declare-fun m!504811 () Bool)

(assert (=> bs!16458 m!504811))

(assert (=> bs!16458 m!504529))

(assert (=> b!523786 d!80703))

(declare-fun d!80705 () Bool)

(declare-fun e!305712 () Bool)

(assert (=> d!80705 e!305712))

(declare-fun c!61820 () Bool)

(declare-fun lt!240529 () SeekEntryResult!4478)

(assert (=> d!80705 (= c!61820 (and (is-Intermediate!4478 lt!240529) (undefined!5290 lt!240529)))))

(declare-fun e!305711 () SeekEntryResult!4478)

(assert (=> d!80705 (= lt!240529 e!305711)))

(declare-fun c!61822 () Bool)

(assert (=> d!80705 (= c!61822 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240528 () (_ BitVec 64))

(assert (=> d!80705 (= lt!240528 (select (arr!16011 lt!240342) lt!240343))))

(assert (=> d!80705 (validMask!0 mask!3524)))

(assert (=> d!80705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240343 lt!240341 lt!240342 mask!3524) lt!240529)))

(declare-fun b!524165 () Bool)

(declare-fun e!305714 () SeekEntryResult!4478)

(assert (=> b!524165 (= e!305714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240343 #b00000000000000000000000000000000 mask!3524) lt!240341 lt!240342 mask!3524))))

(declare-fun b!524166 () Bool)

(assert (=> b!524166 (= e!305714 (Intermediate!4478 false lt!240343 #b00000000000000000000000000000000))))

(declare-fun b!524167 () Bool)

(assert (=> b!524167 (and (bvsge (index!20123 lt!240529) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240529) (size!16375 lt!240342)))))

(declare-fun res!321137 () Bool)

(assert (=> b!524167 (= res!321137 (= (select (arr!16011 lt!240342) (index!20123 lt!240529)) lt!240341))))

(declare-fun e!305715 () Bool)

(assert (=> b!524167 (=> res!321137 e!305715)))

(declare-fun e!305713 () Bool)

(assert (=> b!524167 (= e!305713 e!305715)))

(declare-fun b!524168 () Bool)

(assert (=> b!524168 (= e!305712 e!305713)))

(declare-fun res!321138 () Bool)

(assert (=> b!524168 (= res!321138 (and (is-Intermediate!4478 lt!240529) (not (undefined!5290 lt!240529)) (bvslt (x!49106 lt!240529) #b01111111111111111111111111111110) (bvsge (x!49106 lt!240529) #b00000000000000000000000000000000) (bvsge (x!49106 lt!240529) #b00000000000000000000000000000000)))))

(assert (=> b!524168 (=> (not res!321138) (not e!305713))))

(declare-fun b!524169 () Bool)

(assert (=> b!524169 (= e!305711 (Intermediate!4478 true lt!240343 #b00000000000000000000000000000000))))

(declare-fun b!524170 () Bool)

(assert (=> b!524170 (= e!305712 (bvsge (x!49106 lt!240529) #b01111111111111111111111111111110))))

(declare-fun b!524171 () Bool)

(assert (=> b!524171 (and (bvsge (index!20123 lt!240529) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240529) (size!16375 lt!240342)))))

(declare-fun res!321136 () Bool)

(assert (=> b!524171 (= res!321136 (= (select (arr!16011 lt!240342) (index!20123 lt!240529)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524171 (=> res!321136 e!305715)))

(declare-fun b!524172 () Bool)

(assert (=> b!524172 (= e!305711 e!305714)))

(declare-fun c!61821 () Bool)

(assert (=> b!524172 (= c!61821 (or (= lt!240528 lt!240341) (= (bvadd lt!240528 lt!240528) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524173 () Bool)

(assert (=> b!524173 (and (bvsge (index!20123 lt!240529) #b00000000000000000000000000000000) (bvslt (index!20123 lt!240529) (size!16375 lt!240342)))))

(assert (=> b!524173 (= e!305715 (= (select (arr!16011 lt!240342) (index!20123 lt!240529)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80705 c!61822) b!524169))

(assert (= (and d!80705 (not c!61822)) b!524172))

(assert (= (and b!524172 c!61821) b!524166))

(assert (= (and b!524172 (not c!61821)) b!524165))

(assert (= (and d!80705 c!61820) b!524170))

(assert (= (and d!80705 (not c!61820)) b!524168))

(assert (= (and b!524168 res!321138) b!524167))

(assert (= (and b!524167 (not res!321137)) b!524171))

(assert (= (and b!524171 (not res!321136)) b!524173))

(declare-fun m!504813 () Bool)

(assert (=> b!524167 m!504813))

(declare-fun m!504815 () Bool)

(assert (=> d!80705 m!504815))

(assert (=> d!80705 m!504529))

(assert (=> b!524171 m!504813))

(declare-fun m!504817 () Bool)

(assert (=> b!524165 m!504817))

(assert (=> b!524165 m!504817))

(declare-fun m!504819 () Bool)

(assert (=> b!524165 m!504819))

(assert (=> b!524173 m!504813))

(assert (=> b!523786 d!80705))

(declare-fun bm!31865 () Bool)

(declare-fun call!31868 () Bool)

(assert (=> bm!31865 (= call!31868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!524174 () Bool)

(declare-fun e!305717 () Bool)

(assert (=> b!524174 (= e!305717 call!31868)))

(declare-fun b!524175 () Bool)

(declare-fun e!305716 () Bool)

(assert (=> b!524175 (= e!305716 e!305717)))

(declare-fun c!61823 () Bool)

(assert (=> b!524175 (= c!61823 (validKeyInArray!0 (select (arr!16011 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80707 () Bool)

(declare-fun res!321140 () Bool)

(assert (=> d!80707 (=> res!321140 e!305716)))

(assert (=> d!80707 (= res!321140 (bvsge #b00000000000000000000000000000000 (size!16375 a!3235)))))

(assert (=> d!80707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305716)))

(declare-fun b!524176 () Bool)

(declare-fun e!305718 () Bool)

(assert (=> b!524176 (= e!305717 e!305718)))

(declare-fun lt!240530 () (_ BitVec 64))

(assert (=> b!524176 (= lt!240530 (select (arr!16011 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240532 () Unit!16364)

(assert (=> b!524176 (= lt!240532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240530 #b00000000000000000000000000000000))))

(assert (=> b!524176 (arrayContainsKey!0 a!3235 lt!240530 #b00000000000000000000000000000000)))

(declare-fun lt!240531 () Unit!16364)

(assert (=> b!524176 (= lt!240531 lt!240532)))

(declare-fun res!321139 () Bool)

(assert (=> b!524176 (= res!321139 (= (seekEntryOrOpen!0 (select (arr!16011 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4478 #b00000000000000000000000000000000)))))

(assert (=> b!524176 (=> (not res!321139) (not e!305718))))

(declare-fun b!524177 () Bool)

(assert (=> b!524177 (= e!305718 call!31868)))

(assert (= (and d!80707 (not res!321140)) b!524175))

(assert (= (and b!524175 c!61823) b!524176))

(assert (= (and b!524175 (not c!61823)) b!524174))

(assert (= (and b!524176 res!321139) b!524177))

(assert (= (or b!524177 b!524174) bm!31865))

(declare-fun m!504821 () Bool)

(assert (=> bm!31865 m!504821))

(assert (=> b!524175 m!504657))

(assert (=> b!524175 m!504657))

(assert (=> b!524175 m!504667))

(assert (=> b!524176 m!504657))

(declare-fun m!504823 () Bool)

(assert (=> b!524176 m!504823))

(declare-fun m!504825 () Bool)

(assert (=> b!524176 m!504825))

(assert (=> b!524176 m!504657))

(declare-fun m!504827 () Bool)

(assert (=> b!524176 m!504827))

(assert (=> b!523797 d!80707))

(declare-fun d!80709 () Bool)

(assert (=> d!80709 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47616 d!80709))

(declare-fun d!80717 () Bool)

(assert (=> d!80717 (= (array_inv!11807 a!3235) (bvsge (size!16375 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47616 d!80717))

(declare-fun b!524205 () Bool)

(declare-fun e!305737 () SeekEntryResult!4478)

(declare-fun e!305739 () SeekEntryResult!4478)

(assert (=> b!524205 (= e!305737 e!305739)))

(declare-fun lt!240541 () (_ BitVec 64))

(declare-fun lt!240540 () SeekEntryResult!4478)

(assert (=> b!524205 (= lt!240541 (select (arr!16011 a!3235) (index!20123 lt!240540)))))

(declare-fun c!61833 () Bool)

(assert (=> b!524205 (= c!61833 (= lt!240541 k!2280))))

(declare-fun d!80719 () Bool)

(declare-fun lt!240539 () SeekEntryResult!4478)

(assert (=> d!80719 (and (or (is-Undefined!4478 lt!240539) (not (is-Found!4478 lt!240539)) (and (bvsge (index!20122 lt!240539) #b00000000000000000000000000000000) (bvslt (index!20122 lt!240539) (size!16375 a!3235)))) (or (is-Undefined!4478 lt!240539) (is-Found!4478 lt!240539) (not (is-MissingZero!4478 lt!240539)) (and (bvsge (index!20121 lt!240539) #b00000000000000000000000000000000) (bvslt (index!20121 lt!240539) (size!16375 a!3235)))) (or (is-Undefined!4478 lt!240539) (is-Found!4478 lt!240539) (is-MissingZero!4478 lt!240539) (not (is-MissingVacant!4478 lt!240539)) (and (bvsge (index!20124 lt!240539) #b00000000000000000000000000000000) (bvslt (index!20124 lt!240539) (size!16375 a!3235)))) (or (is-Undefined!4478 lt!240539) (ite (is-Found!4478 lt!240539) (= (select (arr!16011 a!3235) (index!20122 lt!240539)) k!2280) (ite (is-MissingZero!4478 lt!240539) (= (select (arr!16011 a!3235) (index!20121 lt!240539)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4478 lt!240539) (= (select (arr!16011 a!3235) (index!20124 lt!240539)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80719 (= lt!240539 e!305737)))

(declare-fun c!61834 () Bool)

(assert (=> d!80719 (= c!61834 (and (is-Intermediate!4478 lt!240540) (undefined!5290 lt!240540)))))

(assert (=> d!80719 (= lt!240540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80719 (validMask!0 mask!3524)))

(assert (=> d!80719 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!240539)))

(declare-fun b!524206 () Bool)

(assert (=> b!524206 (= e!305739 (Found!4478 (index!20123 lt!240540)))))

(declare-fun b!524207 () Bool)

(assert (=> b!524207 (= e!305737 Undefined!4478)))

(declare-fun e!305738 () SeekEntryResult!4478)

(declare-fun b!524208 () Bool)

(assert (=> b!524208 (= e!305738 (seekKeyOrZeroReturnVacant!0 (x!49106 lt!240540) (index!20123 lt!240540) (index!20123 lt!240540) k!2280 a!3235 mask!3524))))

(declare-fun b!524209 () Bool)

(assert (=> b!524209 (= e!305738 (MissingZero!4478 (index!20123 lt!240540)))))

(declare-fun b!524210 () Bool)

(declare-fun c!61835 () Bool)

(assert (=> b!524210 (= c!61835 (= lt!240541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524210 (= e!305739 e!305738)))

(assert (= (and d!80719 c!61834) b!524207))

(assert (= (and d!80719 (not c!61834)) b!524205))

(assert (= (and b!524205 c!61833) b!524206))

(assert (= (and b!524205 (not c!61833)) b!524210))

(assert (= (and b!524210 c!61835) b!524209))

(assert (= (and b!524210 (not c!61835)) b!524208))

(declare-fun m!504859 () Bool)

(assert (=> b!524205 m!504859))

(assert (=> d!80719 m!504529))

(declare-fun m!504861 () Bool)

(assert (=> d!80719 m!504861))

(declare-fun m!504863 () Bool)

(assert (=> d!80719 m!504863))

(declare-fun m!504865 () Bool)

(assert (=> d!80719 m!504865))

(assert (=> d!80719 m!504861))

(declare-fun m!504867 () Bool)

(assert (=> d!80719 m!504867))

(declare-fun m!504869 () Bool)

(assert (=> d!80719 m!504869))

(declare-fun m!504871 () Bool)

(assert (=> b!524208 m!504871))

(assert (=> b!523798 d!80719))

(declare-fun d!80721 () Bool)

(assert (=> d!80721 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523787 d!80721))

(push 1)

(assert (not bm!31864))

(assert (not b!524144))

(assert (not d!80719))

(assert (not bm!31853))

(assert (not b!523977))

(assert (not d!80705))

(assert (not d!80701))

(assert (not b!524123))

(assert (not b!523931))

(assert (not b!524208))

(assert (not bm!31865))

(assert (not b!524141))

(assert (not d!80649))

(assert (not b!523927))

(assert (not d!80703))

(assert (not b!524027))

(assert (not b!524142))

(assert (not b!524176))

(assert (not b!523928))

(assert (not b!524175))

(assert (not b!524165))

(assert (not d!80657))

(assert (not b!523910))

(assert (not d!80663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

