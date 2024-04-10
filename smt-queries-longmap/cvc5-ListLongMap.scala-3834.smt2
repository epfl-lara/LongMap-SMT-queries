; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52688 () Bool)

(assert start!52688)

(declare-fun b!574661 () Bool)

(declare-fun e!330637 () Bool)

(declare-fun e!330633 () Bool)

(assert (=> b!574661 (= e!330637 e!330633)))

(declare-fun res!363353 () Bool)

(assert (=> b!574661 (=> res!363353 e!330633)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35896 0))(
  ( (array!35897 (arr!17232 (Array (_ BitVec 32) (_ BitVec 64))) (size!17596 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35896)

(declare-fun lt!262474 () (_ BitVec 64))

(assert (=> b!574661 (= res!363353 (or (= lt!262474 (select (arr!17232 a!3118) j!142)) (= lt!262474 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5681 0))(
  ( (MissingZero!5681 (index!24951 (_ BitVec 32))) (Found!5681 (index!24952 (_ BitVec 32))) (Intermediate!5681 (undefined!6493 Bool) (index!24953 (_ BitVec 32)) (x!53841 (_ BitVec 32))) (Undefined!5681) (MissingVacant!5681 (index!24954 (_ BitVec 32))) )
))
(declare-fun lt!262475 () SeekEntryResult!5681)

(assert (=> b!574661 (= lt!262474 (select (arr!17232 a!3118) (index!24953 lt!262475)))))

(declare-fun b!574662 () Bool)

(declare-fun res!363358 () Bool)

(declare-fun e!330636 () Bool)

(assert (=> b!574662 (=> (not res!363358) (not e!330636))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35896 (_ BitVec 32)) Bool)

(assert (=> b!574662 (= res!363358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun b!574663 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun e!330634 () Bool)

(assert (=> b!574663 (= e!330634 (not (or (undefined!6493 lt!262475) (not (is-Intermediate!5681 lt!262475)) (let ((bdg!18025 (select (arr!17232 a!3118) (index!24953 lt!262475)))) (or (= bdg!18025 (select (arr!17232 a!3118) j!142)) (= bdg!18025 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24953 lt!262475) #b00000000000000000000000000000000) (bvsge (index!24953 lt!262475) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53841 lt!262475) #b01111111111111111111111111111110) (bvslt (x!53841 lt!262475) #b00000000000000000000000000000000) (not (= bdg!18025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (store (arr!17232 a!3118) i!1132 k!1914) (index!24953 lt!262475)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330639 () Bool)

(assert (=> b!574663 e!330639))

(declare-fun res!363361 () Bool)

(assert (=> b!574663 (=> (not res!363361) (not e!330639))))

(declare-fun lt!262471 () SeekEntryResult!5681)

(assert (=> b!574663 (= res!363361 (= lt!262471 (Found!5681 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35896 (_ BitVec 32)) SeekEntryResult!5681)

(assert (=> b!574663 (= lt!262471 (seekEntryOrOpen!0 (select (arr!17232 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574663 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18064 0))(
  ( (Unit!18065) )
))
(declare-fun lt!262470 () Unit!18064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18064)

(assert (=> b!574663 (= lt!262470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574664 () Bool)

(declare-fun res!363350 () Bool)

(declare-fun e!330638 () Bool)

(assert (=> b!574664 (=> (not res!363350) (not e!330638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574664 (= res!363350 (validKeyInArray!0 k!1914))))

(declare-fun b!574665 () Bool)

(declare-fun res!363354 () Bool)

(assert (=> b!574665 (=> (not res!363354) (not e!330638))))

(assert (=> b!574665 (= res!363354 (validKeyInArray!0 (select (arr!17232 a!3118) j!142)))))

(declare-fun b!574666 () Bool)

(declare-fun res!363352 () Bool)

(assert (=> b!574666 (=> (not res!363352) (not e!330638))))

(declare-fun arrayContainsKey!0 (array!35896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574666 (= res!363352 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574667 () Bool)

(assert (=> b!574667 (= e!330639 e!330637)))

(declare-fun res!363360 () Bool)

(assert (=> b!574667 (=> res!363360 e!330637)))

(assert (=> b!574667 (= res!363360 (or (undefined!6493 lt!262475) (not (is-Intermediate!5681 lt!262475))))))

(declare-fun b!574668 () Bool)

(declare-fun res!363355 () Bool)

(assert (=> b!574668 (=> (not res!363355) (not e!330636))))

(declare-datatypes ((List!11312 0))(
  ( (Nil!11309) (Cons!11308 (h!12344 (_ BitVec 64)) (t!17540 List!11312)) )
))
(declare-fun arrayNoDuplicates!0 (array!35896 (_ BitVec 32) List!11312) Bool)

(assert (=> b!574668 (= res!363355 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11309))))

(declare-fun b!574669 () Bool)

(declare-fun res!363362 () Bool)

(assert (=> b!574669 (=> (not res!363362) (not e!330638))))

(assert (=> b!574669 (= res!363362 (and (= (size!17596 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17596 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17596 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!330635 () Bool)

(declare-fun lt!262476 () array!35896)

(declare-fun b!574670 () Bool)

(declare-fun lt!262473 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35896 (_ BitVec 32)) SeekEntryResult!5681)

(assert (=> b!574670 (= e!330635 (= (seekEntryOrOpen!0 lt!262473 lt!262476 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262475) (index!24953 lt!262475) (index!24953 lt!262475) lt!262473 lt!262476 mask!3119)))))

(declare-fun b!574671 () Bool)

(assert (=> b!574671 (= e!330636 e!330634)))

(declare-fun res!363356 () Bool)

(assert (=> b!574671 (=> (not res!363356) (not e!330634))))

(declare-fun lt!262472 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35896 (_ BitVec 32)) SeekEntryResult!5681)

(assert (=> b!574671 (= res!363356 (= lt!262475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262472 lt!262473 lt!262476 mask!3119)))))

(declare-fun lt!262469 () (_ BitVec 32))

(assert (=> b!574671 (= lt!262475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262469 (select (arr!17232 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574671 (= lt!262472 (toIndex!0 lt!262473 mask!3119))))

(assert (=> b!574671 (= lt!262473 (select (store (arr!17232 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!574671 (= lt!262469 (toIndex!0 (select (arr!17232 a!3118) j!142) mask!3119))))

(assert (=> b!574671 (= lt!262476 (array!35897 (store (arr!17232 a!3118) i!1132 k!1914) (size!17596 a!3118)))))

(declare-fun b!574672 () Bool)

(assert (=> b!574672 (= e!330638 e!330636)))

(declare-fun res!363357 () Bool)

(assert (=> b!574672 (=> (not res!363357) (not e!330636))))

(declare-fun lt!262477 () SeekEntryResult!5681)

(assert (=> b!574672 (= res!363357 (or (= lt!262477 (MissingZero!5681 i!1132)) (= lt!262477 (MissingVacant!5681 i!1132))))))

(assert (=> b!574672 (= lt!262477 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!363359 () Bool)

(assert (=> start!52688 (=> (not res!363359) (not e!330638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52688 (= res!363359 (validMask!0 mask!3119))))

(assert (=> start!52688 e!330638))

(assert (=> start!52688 true))

(declare-fun array_inv!13028 (array!35896) Bool)

(assert (=> start!52688 (array_inv!13028 a!3118)))

(declare-fun b!574673 () Bool)

(assert (=> b!574673 (= e!330633 e!330635)))

(declare-fun res!363351 () Bool)

(assert (=> b!574673 (=> (not res!363351) (not e!330635))))

(assert (=> b!574673 (= res!363351 (= lt!262471 (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262475) (index!24953 lt!262475) (index!24953 lt!262475) (select (arr!17232 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52688 res!363359) b!574669))

(assert (= (and b!574669 res!363362) b!574665))

(assert (= (and b!574665 res!363354) b!574664))

(assert (= (and b!574664 res!363350) b!574666))

(assert (= (and b!574666 res!363352) b!574672))

(assert (= (and b!574672 res!363357) b!574662))

(assert (= (and b!574662 res!363358) b!574668))

(assert (= (and b!574668 res!363355) b!574671))

(assert (= (and b!574671 res!363356) b!574663))

(assert (= (and b!574663 res!363361) b!574667))

(assert (= (and b!574667 (not res!363360)) b!574661))

(assert (= (and b!574661 (not res!363353)) b!574673))

(assert (= (and b!574673 res!363351) b!574670))

(declare-fun m!553497 () Bool)

(assert (=> b!574665 m!553497))

(assert (=> b!574665 m!553497))

(declare-fun m!553499 () Bool)

(assert (=> b!574665 m!553499))

(declare-fun m!553501 () Bool)

(assert (=> start!52688 m!553501))

(declare-fun m!553503 () Bool)

(assert (=> start!52688 m!553503))

(assert (=> b!574663 m!553497))

(declare-fun m!553505 () Bool)

(assert (=> b!574663 m!553505))

(declare-fun m!553507 () Bool)

(assert (=> b!574663 m!553507))

(declare-fun m!553509 () Bool)

(assert (=> b!574663 m!553509))

(assert (=> b!574663 m!553497))

(declare-fun m!553511 () Bool)

(assert (=> b!574663 m!553511))

(declare-fun m!553513 () Bool)

(assert (=> b!574663 m!553513))

(declare-fun m!553515 () Bool)

(assert (=> b!574663 m!553515))

(assert (=> b!574673 m!553497))

(assert (=> b!574673 m!553497))

(declare-fun m!553517 () Bool)

(assert (=> b!574673 m!553517))

(assert (=> b!574661 m!553497))

(assert (=> b!574661 m!553509))

(declare-fun m!553519 () Bool)

(assert (=> b!574672 m!553519))

(assert (=> b!574671 m!553497))

(declare-fun m!553521 () Bool)

(assert (=> b!574671 m!553521))

(assert (=> b!574671 m!553497))

(declare-fun m!553523 () Bool)

(assert (=> b!574671 m!553523))

(declare-fun m!553525 () Bool)

(assert (=> b!574671 m!553525))

(assert (=> b!574671 m!553505))

(assert (=> b!574671 m!553497))

(declare-fun m!553527 () Bool)

(assert (=> b!574671 m!553527))

(declare-fun m!553529 () Bool)

(assert (=> b!574671 m!553529))

(declare-fun m!553531 () Bool)

(assert (=> b!574666 m!553531))

(declare-fun m!553533 () Bool)

(assert (=> b!574664 m!553533))

(declare-fun m!553535 () Bool)

(assert (=> b!574662 m!553535))

(declare-fun m!553537 () Bool)

(assert (=> b!574668 m!553537))

(declare-fun m!553539 () Bool)

(assert (=> b!574670 m!553539))

(declare-fun m!553541 () Bool)

(assert (=> b!574670 m!553541))

(push 1)

(assert (not b!574670))

(assert (not start!52688))

(assert (not b!574673))

(assert (not b!574671))

(assert (not b!574672))

(assert (not b!574665))

(assert (not b!574666))

(assert (not b!574668))

(assert (not b!574662))

(assert (not b!574664))

(assert (not b!574663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85191 () Bool)

(declare-fun lt!262547 () SeekEntryResult!5681)

(assert (=> d!85191 (and (or (is-Undefined!5681 lt!262547) (not (is-Found!5681 lt!262547)) (and (bvsge (index!24952 lt!262547) #b00000000000000000000000000000000) (bvslt (index!24952 lt!262547) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262547) (is-Found!5681 lt!262547) (not (is-MissingZero!5681 lt!262547)) (and (bvsge (index!24951 lt!262547) #b00000000000000000000000000000000) (bvslt (index!24951 lt!262547) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262547) (is-Found!5681 lt!262547) (is-MissingZero!5681 lt!262547) (not (is-MissingVacant!5681 lt!262547)) (and (bvsge (index!24954 lt!262547) #b00000000000000000000000000000000) (bvslt (index!24954 lt!262547) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262547) (ite (is-Found!5681 lt!262547) (= (select (arr!17232 a!3118) (index!24952 lt!262547)) k!1914) (ite (is-MissingZero!5681 lt!262547) (= (select (arr!17232 a!3118) (index!24951 lt!262547)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5681 lt!262547) (= (select (arr!17232 a!3118) (index!24954 lt!262547)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330746 () SeekEntryResult!5681)

(assert (=> d!85191 (= lt!262547 e!330746)))

(declare-fun c!66043 () Bool)

(declare-fun lt!262546 () SeekEntryResult!5681)

(assert (=> d!85191 (= c!66043 (and (is-Intermediate!5681 lt!262546) (undefined!6493 lt!262546)))))

(assert (=> d!85191 (= lt!262546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!85191 (validMask!0 mask!3119)))

(assert (=> d!85191 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!262547)))

(declare-fun b!574836 () Bool)

(declare-fun e!330744 () SeekEntryResult!5681)

(assert (=> b!574836 (= e!330744 (Found!5681 (index!24953 lt!262546)))))

(declare-fun b!574837 () Bool)

(assert (=> b!574837 (= e!330746 Undefined!5681)))

(declare-fun b!574838 () Bool)

(declare-fun c!66042 () Bool)

(declare-fun lt!262548 () (_ BitVec 64))

(assert (=> b!574838 (= c!66042 (= lt!262548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330745 () SeekEntryResult!5681)

(assert (=> b!574838 (= e!330744 e!330745)))

(declare-fun b!574839 () Bool)

(assert (=> b!574839 (= e!330746 e!330744)))

(assert (=> b!574839 (= lt!262548 (select (arr!17232 a!3118) (index!24953 lt!262546)))))

(declare-fun c!66044 () Bool)

(assert (=> b!574839 (= c!66044 (= lt!262548 k!1914))))

(declare-fun b!574840 () Bool)

(assert (=> b!574840 (= e!330745 (MissingZero!5681 (index!24953 lt!262546)))))

(declare-fun b!574841 () Bool)

(assert (=> b!574841 (= e!330745 (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262546) (index!24953 lt!262546) (index!24953 lt!262546) k!1914 a!3118 mask!3119))))

(assert (= (and d!85191 c!66043) b!574837))

(assert (= (and d!85191 (not c!66043)) b!574839))

(assert (= (and b!574839 c!66044) b!574836))

(assert (= (and b!574839 (not c!66044)) b!574838))

(assert (= (and b!574838 c!66042) b!574840))

(assert (= (and b!574838 (not c!66042)) b!574841))

(declare-fun m!553669 () Bool)

(assert (=> d!85191 m!553669))

(assert (=> d!85191 m!553501))

(declare-fun m!553671 () Bool)

(assert (=> d!85191 m!553671))

(declare-fun m!553673 () Bool)

(assert (=> d!85191 m!553673))

(declare-fun m!553675 () Bool)

(assert (=> d!85191 m!553675))

(assert (=> d!85191 m!553675))

(declare-fun m!553677 () Bool)

(assert (=> d!85191 m!553677))

(declare-fun m!553679 () Bool)

(assert (=> b!574839 m!553679))

(declare-fun m!553681 () Bool)

(assert (=> b!574841 m!553681))

(assert (=> b!574672 d!85191))

(declare-fun b!574890 () Bool)

(declare-fun e!330773 () Bool)

(declare-fun lt!262577 () SeekEntryResult!5681)

(assert (=> b!574890 (= e!330773 (bvsge (x!53841 lt!262577) #b01111111111111111111111111111110))))

(declare-fun b!574891 () Bool)

(declare-fun e!330774 () Bool)

(assert (=> b!574891 (= e!330773 e!330774)))

(declare-fun res!363485 () Bool)

(assert (=> b!574891 (= res!363485 (and (is-Intermediate!5681 lt!262577) (not (undefined!6493 lt!262577)) (bvslt (x!53841 lt!262577) #b01111111111111111111111111111110) (bvsge (x!53841 lt!262577) #b00000000000000000000000000000000) (bvsge (x!53841 lt!262577) #b00000000000000000000000000000000)))))

(assert (=> b!574891 (=> (not res!363485) (not e!330774))))

(declare-fun b!574892 () Bool)

(assert (=> b!574892 (and (bvsge (index!24953 lt!262577) #b00000000000000000000000000000000) (bvslt (index!24953 lt!262577) (size!17596 lt!262476)))))

(declare-fun res!363486 () Bool)

(assert (=> b!574892 (= res!363486 (= (select (arr!17232 lt!262476) (index!24953 lt!262577)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330776 () Bool)

(assert (=> b!574892 (=> res!363486 e!330776)))

(declare-fun b!574893 () Bool)

(declare-fun e!330772 () SeekEntryResult!5681)

(assert (=> b!574893 (= e!330772 (Intermediate!5681 false lt!262472 #b00000000000000000000000000000000))))

(declare-fun b!574894 () Bool)

(assert (=> b!574894 (and (bvsge (index!24953 lt!262577) #b00000000000000000000000000000000) (bvslt (index!24953 lt!262577) (size!17596 lt!262476)))))

(declare-fun res!363484 () Bool)

(assert (=> b!574894 (= res!363484 (= (select (arr!17232 lt!262476) (index!24953 lt!262577)) lt!262473))))

(assert (=> b!574894 (=> res!363484 e!330776)))

(assert (=> b!574894 (= e!330774 e!330776)))

(declare-fun b!574895 () Bool)

(assert (=> b!574895 (and (bvsge (index!24953 lt!262577) #b00000000000000000000000000000000) (bvslt (index!24953 lt!262577) (size!17596 lt!262476)))))

(assert (=> b!574895 (= e!330776 (= (select (arr!17232 lt!262476) (index!24953 lt!262577)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85201 () Bool)

(assert (=> d!85201 e!330773))

(declare-fun c!66067 () Bool)

(assert (=> d!85201 (= c!66067 (and (is-Intermediate!5681 lt!262577) (undefined!6493 lt!262577)))))

(declare-fun e!330775 () SeekEntryResult!5681)

(assert (=> d!85201 (= lt!262577 e!330775)))

(declare-fun c!66068 () Bool)

(assert (=> d!85201 (= c!66068 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262576 () (_ BitVec 64))

(assert (=> d!85201 (= lt!262576 (select (arr!17232 lt!262476) lt!262472))))

(assert (=> d!85201 (validMask!0 mask!3119)))

(assert (=> d!85201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262472 lt!262473 lt!262476 mask!3119) lt!262577)))

(declare-fun b!574896 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574896 (= e!330772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262472 #b00000000000000000000000000000000 mask!3119) lt!262473 lt!262476 mask!3119))))

(declare-fun b!574897 () Bool)

(assert (=> b!574897 (= e!330775 e!330772)))

(declare-fun c!66066 () Bool)

(assert (=> b!574897 (= c!66066 (or (= lt!262576 lt!262473) (= (bvadd lt!262576 lt!262576) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574898 () Bool)

(assert (=> b!574898 (= e!330775 (Intermediate!5681 true lt!262472 #b00000000000000000000000000000000))))

(assert (= (and d!85201 c!66068) b!574898))

(assert (= (and d!85201 (not c!66068)) b!574897))

(assert (= (and b!574897 c!66066) b!574893))

(assert (= (and b!574897 (not c!66066)) b!574896))

(assert (= (and d!85201 c!66067) b!574890))

(assert (= (and d!85201 (not c!66067)) b!574891))

(assert (= (and b!574891 res!363485) b!574894))

(assert (= (and b!574894 (not res!363484)) b!574892))

(assert (= (and b!574892 (not res!363486)) b!574895))

(declare-fun m!553695 () Bool)

(assert (=> d!85201 m!553695))

(assert (=> d!85201 m!553501))

(declare-fun m!553697 () Bool)

(assert (=> b!574896 m!553697))

(assert (=> b!574896 m!553697))

(declare-fun m!553699 () Bool)

(assert (=> b!574896 m!553699))

(declare-fun m!553701 () Bool)

(assert (=> b!574894 m!553701))

(assert (=> b!574892 m!553701))

(assert (=> b!574895 m!553701))

(assert (=> b!574671 d!85201))

(declare-fun b!574905 () Bool)

(declare-fun e!330781 () Bool)

(declare-fun lt!262582 () SeekEntryResult!5681)

(assert (=> b!574905 (= e!330781 (bvsge (x!53841 lt!262582) #b01111111111111111111111111111110))))

(declare-fun b!574906 () Bool)

(declare-fun e!330782 () Bool)

(assert (=> b!574906 (= e!330781 e!330782)))

(declare-fun res!363488 () Bool)

(assert (=> b!574906 (= res!363488 (and (is-Intermediate!5681 lt!262582) (not (undefined!6493 lt!262582)) (bvslt (x!53841 lt!262582) #b01111111111111111111111111111110) (bvsge (x!53841 lt!262582) #b00000000000000000000000000000000) (bvsge (x!53841 lt!262582) #b00000000000000000000000000000000)))))

(assert (=> b!574906 (=> (not res!363488) (not e!330782))))

(declare-fun b!574907 () Bool)

(assert (=> b!574907 (and (bvsge (index!24953 lt!262582) #b00000000000000000000000000000000) (bvslt (index!24953 lt!262582) (size!17596 a!3118)))))

(declare-fun res!363489 () Bool)

(assert (=> b!574907 (= res!363489 (= (select (arr!17232 a!3118) (index!24953 lt!262582)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330784 () Bool)

(assert (=> b!574907 (=> res!363489 e!330784)))

(declare-fun b!574908 () Bool)

(declare-fun e!330780 () SeekEntryResult!5681)

(assert (=> b!574908 (= e!330780 (Intermediate!5681 false lt!262469 #b00000000000000000000000000000000))))

(declare-fun b!574909 () Bool)

(assert (=> b!574909 (and (bvsge (index!24953 lt!262582) #b00000000000000000000000000000000) (bvslt (index!24953 lt!262582) (size!17596 a!3118)))))

(declare-fun res!363487 () Bool)

(assert (=> b!574909 (= res!363487 (= (select (arr!17232 a!3118) (index!24953 lt!262582)) (select (arr!17232 a!3118) j!142)))))

(assert (=> b!574909 (=> res!363487 e!330784)))

(assert (=> b!574909 (= e!330782 e!330784)))

(declare-fun b!574910 () Bool)

(assert (=> b!574910 (and (bvsge (index!24953 lt!262582) #b00000000000000000000000000000000) (bvslt (index!24953 lt!262582) (size!17596 a!3118)))))

(assert (=> b!574910 (= e!330784 (= (select (arr!17232 a!3118) (index!24953 lt!262582)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85209 () Bool)

(assert (=> d!85209 e!330781))

(declare-fun c!66073 () Bool)

(assert (=> d!85209 (= c!66073 (and (is-Intermediate!5681 lt!262582) (undefined!6493 lt!262582)))))

(declare-fun e!330783 () SeekEntryResult!5681)

(assert (=> d!85209 (= lt!262582 e!330783)))

(declare-fun c!66074 () Bool)

(assert (=> d!85209 (= c!66074 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262581 () (_ BitVec 64))

(assert (=> d!85209 (= lt!262581 (select (arr!17232 a!3118) lt!262469))))

(assert (=> d!85209 (validMask!0 mask!3119)))

(assert (=> d!85209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262469 (select (arr!17232 a!3118) j!142) a!3118 mask!3119) lt!262582)))

(declare-fun b!574911 () Bool)

(assert (=> b!574911 (= e!330780 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262469 #b00000000000000000000000000000000 mask!3119) (select (arr!17232 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574912 () Bool)

(assert (=> b!574912 (= e!330783 e!330780)))

(declare-fun c!66072 () Bool)

(assert (=> b!574912 (= c!66072 (or (= lt!262581 (select (arr!17232 a!3118) j!142)) (= (bvadd lt!262581 lt!262581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574913 () Bool)

(assert (=> b!574913 (= e!330783 (Intermediate!5681 true lt!262469 #b00000000000000000000000000000000))))

(assert (= (and d!85209 c!66074) b!574913))

(assert (= (and d!85209 (not c!66074)) b!574912))

(assert (= (and b!574912 c!66072) b!574908))

(assert (= (and b!574912 (not c!66072)) b!574911))

(assert (= (and d!85209 c!66073) b!574905))

(assert (= (and d!85209 (not c!66073)) b!574906))

(assert (= (and b!574906 res!363488) b!574909))

(assert (= (and b!574909 (not res!363487)) b!574907))

(assert (= (and b!574907 (not res!363489)) b!574910))

(declare-fun m!553715 () Bool)

(assert (=> d!85209 m!553715))

(assert (=> d!85209 m!553501))

(declare-fun m!553717 () Bool)

(assert (=> b!574911 m!553717))

(assert (=> b!574911 m!553717))

(assert (=> b!574911 m!553497))

(declare-fun m!553719 () Bool)

(assert (=> b!574911 m!553719))

(declare-fun m!553721 () Bool)

(assert (=> b!574909 m!553721))

(assert (=> b!574907 m!553721))

(assert (=> b!574910 m!553721))

(assert (=> b!574671 d!85209))

(declare-fun d!85213 () Bool)

(declare-fun lt!262588 () (_ BitVec 32))

(declare-fun lt!262587 () (_ BitVec 32))

(assert (=> d!85213 (= lt!262588 (bvmul (bvxor lt!262587 (bvlshr lt!262587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85213 (= lt!262587 ((_ extract 31 0) (bvand (bvxor lt!262473 (bvlshr lt!262473 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85213 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363490 (let ((h!12348 ((_ extract 31 0) (bvand (bvxor lt!262473 (bvlshr lt!262473 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53847 (bvmul (bvxor h!12348 (bvlshr h!12348 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53847 (bvlshr x!53847 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363490 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363490 #b00000000000000000000000000000000))))))

(assert (=> d!85213 (= (toIndex!0 lt!262473 mask!3119) (bvand (bvxor lt!262588 (bvlshr lt!262588 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574671 d!85213))

(declare-fun d!85215 () Bool)

(declare-fun lt!262594 () (_ BitVec 32))

(declare-fun lt!262593 () (_ BitVec 32))

(assert (=> d!85215 (= lt!262594 (bvmul (bvxor lt!262593 (bvlshr lt!262593 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85215 (= lt!262593 ((_ extract 31 0) (bvand (bvxor (select (arr!17232 a!3118) j!142) (bvlshr (select (arr!17232 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85215 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363490 (let ((h!12348 ((_ extract 31 0) (bvand (bvxor (select (arr!17232 a!3118) j!142) (bvlshr (select (arr!17232 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53847 (bvmul (bvxor h!12348 (bvlshr h!12348 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53847 (bvlshr x!53847 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363490 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363490 #b00000000000000000000000000000000))))))

(assert (=> d!85215 (= (toIndex!0 (select (arr!17232 a!3118) j!142) mask!3119) (bvand (bvxor lt!262594 (bvlshr lt!262594 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574671 d!85215))

(declare-fun d!85217 () Bool)

(declare-fun res!363495 () Bool)

(declare-fun e!330795 () Bool)

(assert (=> d!85217 (=> res!363495 e!330795)))

(assert (=> d!85217 (= res!363495 (= (select (arr!17232 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!85217 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!330795)))

(declare-fun b!574930 () Bool)

(declare-fun e!330796 () Bool)

(assert (=> b!574930 (= e!330795 e!330796)))

(declare-fun res!363496 () Bool)

(assert (=> b!574930 (=> (not res!363496) (not e!330796))))

(assert (=> b!574930 (= res!363496 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17596 a!3118)))))

(declare-fun b!574931 () Bool)

(assert (=> b!574931 (= e!330796 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85217 (not res!363495)) b!574930))

(assert (= (and b!574930 res!363496) b!574931))

(declare-fun m!553723 () Bool)

(assert (=> d!85217 m!553723))

(declare-fun m!553725 () Bool)

(assert (=> b!574931 m!553725))

(assert (=> b!574666 d!85217))

(declare-fun d!85219 () Bool)

(assert (=> d!85219 (= (validKeyInArray!0 (select (arr!17232 a!3118) j!142)) (and (not (= (select (arr!17232 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17232 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574665 d!85219))

(declare-fun d!85221 () Bool)

(declare-fun lt!262598 () SeekEntryResult!5681)

(assert (=> d!85221 (and (or (is-Undefined!5681 lt!262598) (not (is-Found!5681 lt!262598)) (and (bvsge (index!24952 lt!262598) #b00000000000000000000000000000000) (bvslt (index!24952 lt!262598) (size!17596 lt!262476)))) (or (is-Undefined!5681 lt!262598) (is-Found!5681 lt!262598) (not (is-MissingZero!5681 lt!262598)) (and (bvsge (index!24951 lt!262598) #b00000000000000000000000000000000) (bvslt (index!24951 lt!262598) (size!17596 lt!262476)))) (or (is-Undefined!5681 lt!262598) (is-Found!5681 lt!262598) (is-MissingZero!5681 lt!262598) (not (is-MissingVacant!5681 lt!262598)) (and (bvsge (index!24954 lt!262598) #b00000000000000000000000000000000) (bvslt (index!24954 lt!262598) (size!17596 lt!262476)))) (or (is-Undefined!5681 lt!262598) (ite (is-Found!5681 lt!262598) (= (select (arr!17232 lt!262476) (index!24952 lt!262598)) lt!262473) (ite (is-MissingZero!5681 lt!262598) (= (select (arr!17232 lt!262476) (index!24951 lt!262598)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5681 lt!262598) (= (select (arr!17232 lt!262476) (index!24954 lt!262598)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330802 () SeekEntryResult!5681)

(assert (=> d!85221 (= lt!262598 e!330802)))

(declare-fun c!66085 () Bool)

(declare-fun lt!262597 () SeekEntryResult!5681)

(assert (=> d!85221 (= c!66085 (and (is-Intermediate!5681 lt!262597) (undefined!6493 lt!262597)))))

(assert (=> d!85221 (= lt!262597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262473 mask!3119) lt!262473 lt!262476 mask!3119))))

(assert (=> d!85221 (validMask!0 mask!3119)))

(assert (=> d!85221 (= (seekEntryOrOpen!0 lt!262473 lt!262476 mask!3119) lt!262598)))

(declare-fun b!574938 () Bool)

(declare-fun e!330800 () SeekEntryResult!5681)

(assert (=> b!574938 (= e!330800 (Found!5681 (index!24953 lt!262597)))))

(declare-fun b!574939 () Bool)

(assert (=> b!574939 (= e!330802 Undefined!5681)))

(declare-fun b!574940 () Bool)

(declare-fun c!66084 () Bool)

(declare-fun lt!262599 () (_ BitVec 64))

(assert (=> b!574940 (= c!66084 (= lt!262599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330801 () SeekEntryResult!5681)

(assert (=> b!574940 (= e!330800 e!330801)))

(declare-fun b!574941 () Bool)

(assert (=> b!574941 (= e!330802 e!330800)))

(assert (=> b!574941 (= lt!262599 (select (arr!17232 lt!262476) (index!24953 lt!262597)))))

(declare-fun c!66086 () Bool)

(assert (=> b!574941 (= c!66086 (= lt!262599 lt!262473))))

(declare-fun b!574942 () Bool)

(assert (=> b!574942 (= e!330801 (MissingZero!5681 (index!24953 lt!262597)))))

(declare-fun b!574943 () Bool)

(assert (=> b!574943 (= e!330801 (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262597) (index!24953 lt!262597) (index!24953 lt!262597) lt!262473 lt!262476 mask!3119))))

(assert (= (and d!85221 c!66085) b!574939))

(assert (= (and d!85221 (not c!66085)) b!574941))

(assert (= (and b!574941 c!66086) b!574938))

(assert (= (and b!574941 (not c!66086)) b!574940))

(assert (= (and b!574940 c!66084) b!574942))

(assert (= (and b!574940 (not c!66084)) b!574943))

(declare-fun m!553735 () Bool)

(assert (=> d!85221 m!553735))

(assert (=> d!85221 m!553501))

(declare-fun m!553739 () Bool)

(assert (=> d!85221 m!553739))

(declare-fun m!553741 () Bool)

(assert (=> d!85221 m!553741))

(assert (=> d!85221 m!553523))

(assert (=> d!85221 m!553523))

(declare-fun m!553743 () Bool)

(assert (=> d!85221 m!553743))

(declare-fun m!553745 () Bool)

(assert (=> b!574941 m!553745))

(declare-fun m!553747 () Bool)

(assert (=> b!574943 m!553747))

(assert (=> b!574670 d!85221))

(declare-fun b!575006 () Bool)

(declare-fun e!330840 () SeekEntryResult!5681)

(assert (=> b!575006 (= e!330840 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53841 lt!262475) #b00000000000000000000000000000001) (nextIndex!0 (index!24953 lt!262475) (x!53841 lt!262475) mask!3119) (index!24953 lt!262475) lt!262473 lt!262476 mask!3119))))

(declare-fun b!575008 () Bool)

(declare-fun e!330839 () SeekEntryResult!5681)

(assert (=> b!575008 (= e!330839 Undefined!5681)))

(declare-fun b!575009 () Bool)

(declare-fun c!66115 () Bool)

(declare-fun lt!262631 () (_ BitVec 64))

(assert (=> b!575009 (= c!66115 (= lt!262631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330841 () SeekEntryResult!5681)

(assert (=> b!575009 (= e!330841 e!330840)))

(declare-fun b!575010 () Bool)

(assert (=> b!575010 (= e!330840 (MissingVacant!5681 (index!24953 lt!262475)))))

(declare-fun b!575011 () Bool)

(assert (=> b!575011 (= e!330841 (Found!5681 (index!24953 lt!262475)))))

(declare-fun d!85225 () Bool)

(declare-fun lt!262630 () SeekEntryResult!5681)

(assert (=> d!85225 (and (or (is-Undefined!5681 lt!262630) (not (is-Found!5681 lt!262630)) (and (bvsge (index!24952 lt!262630) #b00000000000000000000000000000000) (bvslt (index!24952 lt!262630) (size!17596 lt!262476)))) (or (is-Undefined!5681 lt!262630) (is-Found!5681 lt!262630) (not (is-MissingVacant!5681 lt!262630)) (not (= (index!24954 lt!262630) (index!24953 lt!262475))) (and (bvsge (index!24954 lt!262630) #b00000000000000000000000000000000) (bvslt (index!24954 lt!262630) (size!17596 lt!262476)))) (or (is-Undefined!5681 lt!262630) (ite (is-Found!5681 lt!262630) (= (select (arr!17232 lt!262476) (index!24952 lt!262630)) lt!262473) (and (is-MissingVacant!5681 lt!262630) (= (index!24954 lt!262630) (index!24953 lt!262475)) (= (select (arr!17232 lt!262476) (index!24954 lt!262630)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85225 (= lt!262630 e!330839)))

(declare-fun c!66114 () Bool)

(assert (=> d!85225 (= c!66114 (bvsge (x!53841 lt!262475) #b01111111111111111111111111111110))))

(assert (=> d!85225 (= lt!262631 (select (arr!17232 lt!262476) (index!24953 lt!262475)))))

(assert (=> d!85225 (validMask!0 mask!3119)))

(assert (=> d!85225 (= (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262475) (index!24953 lt!262475) (index!24953 lt!262475) lt!262473 lt!262476 mask!3119) lt!262630)))

(declare-fun b!575007 () Bool)

(assert (=> b!575007 (= e!330839 e!330841)))

(declare-fun c!66113 () Bool)

(assert (=> b!575007 (= c!66113 (= lt!262631 lt!262473))))

(assert (= (and d!85225 c!66114) b!575008))

(assert (= (and d!85225 (not c!66114)) b!575007))

(assert (= (and b!575007 c!66113) b!575011))

(assert (= (and b!575007 (not c!66113)) b!575009))

(assert (= (and b!575009 c!66115) b!575010))

(assert (= (and b!575009 (not c!66115)) b!575006))

(declare-fun m!553787 () Bool)

(assert (=> b!575006 m!553787))

(assert (=> b!575006 m!553787))

(declare-fun m!553789 () Bool)

(assert (=> b!575006 m!553789))

(declare-fun m!553791 () Bool)

(assert (=> d!85225 m!553791))

(declare-fun m!553793 () Bool)

(assert (=> d!85225 m!553793))

(declare-fun m!553795 () Bool)

(assert (=> d!85225 m!553795))

(assert (=> d!85225 m!553501))

(assert (=> b!574670 d!85225))

(declare-fun d!85241 () Bool)

(assert (=> d!85241 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52688 d!85241))

(declare-fun d!85257 () Bool)

(assert (=> d!85257 (= (array_inv!13028 a!3118) (bvsge (size!17596 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52688 d!85257))

(declare-fun d!85259 () Bool)

(assert (=> d!85259 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574664 d!85259))

(declare-fun d!85261 () Bool)

(declare-fun lt!262645 () SeekEntryResult!5681)

(assert (=> d!85261 (and (or (is-Undefined!5681 lt!262645) (not (is-Found!5681 lt!262645)) (and (bvsge (index!24952 lt!262645) #b00000000000000000000000000000000) (bvslt (index!24952 lt!262645) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262645) (is-Found!5681 lt!262645) (not (is-MissingZero!5681 lt!262645)) (and (bvsge (index!24951 lt!262645) #b00000000000000000000000000000000) (bvslt (index!24951 lt!262645) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262645) (is-Found!5681 lt!262645) (is-MissingZero!5681 lt!262645) (not (is-MissingVacant!5681 lt!262645)) (and (bvsge (index!24954 lt!262645) #b00000000000000000000000000000000) (bvslt (index!24954 lt!262645) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262645) (ite (is-Found!5681 lt!262645) (= (select (arr!17232 a!3118) (index!24952 lt!262645)) (select (arr!17232 a!3118) j!142)) (ite (is-MissingZero!5681 lt!262645) (= (select (arr!17232 a!3118) (index!24951 lt!262645)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5681 lt!262645) (= (select (arr!17232 a!3118) (index!24954 lt!262645)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330859 () SeekEntryResult!5681)

(assert (=> d!85261 (= lt!262645 e!330859)))

(declare-fun c!66122 () Bool)

(declare-fun lt!262644 () SeekEntryResult!5681)

(assert (=> d!85261 (= c!66122 (and (is-Intermediate!5681 lt!262644) (undefined!6493 lt!262644)))))

(assert (=> d!85261 (= lt!262644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17232 a!3118) j!142) mask!3119) (select (arr!17232 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85261 (validMask!0 mask!3119)))

(assert (=> d!85261 (= (seekEntryOrOpen!0 (select (arr!17232 a!3118) j!142) a!3118 mask!3119) lt!262645)))

(declare-fun b!575032 () Bool)

(declare-fun e!330857 () SeekEntryResult!5681)

(assert (=> b!575032 (= e!330857 (Found!5681 (index!24953 lt!262644)))))

(declare-fun b!575033 () Bool)

(assert (=> b!575033 (= e!330859 Undefined!5681)))

(declare-fun b!575034 () Bool)

(declare-fun c!66121 () Bool)

(declare-fun lt!262646 () (_ BitVec 64))

(assert (=> b!575034 (= c!66121 (= lt!262646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330858 () SeekEntryResult!5681)

(assert (=> b!575034 (= e!330857 e!330858)))

(declare-fun b!575035 () Bool)

(assert (=> b!575035 (= e!330859 e!330857)))

(assert (=> b!575035 (= lt!262646 (select (arr!17232 a!3118) (index!24953 lt!262644)))))

(declare-fun c!66123 () Bool)

(assert (=> b!575035 (= c!66123 (= lt!262646 (select (arr!17232 a!3118) j!142)))))

(declare-fun b!575036 () Bool)

(assert (=> b!575036 (= e!330858 (MissingZero!5681 (index!24953 lt!262644)))))

(declare-fun b!575037 () Bool)

(assert (=> b!575037 (= e!330858 (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262644) (index!24953 lt!262644) (index!24953 lt!262644) (select (arr!17232 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85261 c!66122) b!575033))

(assert (= (and d!85261 (not c!66122)) b!575035))

(assert (= (and b!575035 c!66123) b!575032))

(assert (= (and b!575035 (not c!66123)) b!575034))

(assert (= (and b!575034 c!66121) b!575036))

(assert (= (and b!575034 (not c!66121)) b!575037))

(declare-fun m!553827 () Bool)

(assert (=> d!85261 m!553827))

(assert (=> d!85261 m!553501))

(declare-fun m!553829 () Bool)

(assert (=> d!85261 m!553829))

(declare-fun m!553831 () Bool)

(assert (=> d!85261 m!553831))

(assert (=> d!85261 m!553497))

(assert (=> d!85261 m!553521))

(assert (=> d!85261 m!553521))

(assert (=> d!85261 m!553497))

(declare-fun m!553833 () Bool)

(assert (=> d!85261 m!553833))

(declare-fun m!553835 () Bool)

(assert (=> b!575035 m!553835))

(assert (=> b!575037 m!553497))

(declare-fun m!553837 () Bool)

(assert (=> b!575037 m!553837))

(assert (=> b!574663 d!85261))

(declare-fun b!575046 () Bool)

(declare-fun e!330867 () Bool)

(declare-fun call!32703 () Bool)

(assert (=> b!575046 (= e!330867 call!32703)))

(declare-fun b!575047 () Bool)

(declare-fun e!330868 () Bool)

(assert (=> b!575047 (= e!330867 e!330868)))

(declare-fun lt!262654 () (_ BitVec 64))

(assert (=> b!575047 (= lt!262654 (select (arr!17232 a!3118) j!142))))

(declare-fun lt!262655 () Unit!18064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35896 (_ BitVec 64) (_ BitVec 32)) Unit!18064)

(assert (=> b!575047 (= lt!262655 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262654 j!142))))

(assert (=> b!575047 (arrayContainsKey!0 a!3118 lt!262654 #b00000000000000000000000000000000)))

(declare-fun lt!262653 () Unit!18064)

(assert (=> b!575047 (= lt!262653 lt!262655)))

(declare-fun res!363521 () Bool)

(assert (=> b!575047 (= res!363521 (= (seekEntryOrOpen!0 (select (arr!17232 a!3118) j!142) a!3118 mask!3119) (Found!5681 j!142)))))

(assert (=> b!575047 (=> (not res!363521) (not e!330868))))

(declare-fun b!575048 () Bool)

(assert (=> b!575048 (= e!330868 call!32703)))

(declare-fun b!575049 () Bool)

(declare-fun e!330866 () Bool)

(assert (=> b!575049 (= e!330866 e!330867)))

(declare-fun c!66126 () Bool)

(assert (=> b!575049 (= c!66126 (validKeyInArray!0 (select (arr!17232 a!3118) j!142)))))

(declare-fun d!85263 () Bool)

(declare-fun res!363522 () Bool)

(assert (=> d!85263 (=> res!363522 e!330866)))

(assert (=> d!85263 (= res!363522 (bvsge j!142 (size!17596 a!3118)))))

(assert (=> d!85263 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330866)))

(declare-fun bm!32700 () Bool)

(assert (=> bm!32700 (= call!32703 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85263 (not res!363522)) b!575049))

(assert (= (and b!575049 c!66126) b!575047))

(assert (= (and b!575049 (not c!66126)) b!575046))

(assert (= (and b!575047 res!363521) b!575048))

(assert (= (or b!575048 b!575046) bm!32700))

(assert (=> b!575047 m!553497))

(declare-fun m!553839 () Bool)

(assert (=> b!575047 m!553839))

(declare-fun m!553841 () Bool)

(assert (=> b!575047 m!553841))

(assert (=> b!575047 m!553497))

(assert (=> b!575047 m!553511))

(assert (=> b!575049 m!553497))

(assert (=> b!575049 m!553497))

(assert (=> b!575049 m!553499))

(declare-fun m!553843 () Bool)

(assert (=> bm!32700 m!553843))

(assert (=> b!574663 d!85263))

(declare-fun d!85265 () Bool)

(assert (=> d!85265 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262662 () Unit!18064)

(declare-fun choose!38 (array!35896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18064)

(assert (=> d!85265 (= lt!262662 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85265 (validMask!0 mask!3119)))

(assert (=> d!85265 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262662)))

(declare-fun bs!17777 () Bool)

(assert (= bs!17777 d!85265))

(assert (=> bs!17777 m!553515))

(declare-fun m!553845 () Bool)

(assert (=> bs!17777 m!553845))

(assert (=> bs!17777 m!553501))

(assert (=> b!574663 d!85265))

(declare-fun b!575068 () Bool)

(declare-fun e!330880 () SeekEntryResult!5681)

(assert (=> b!575068 (= e!330880 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53841 lt!262475) #b00000000000000000000000000000001) (nextIndex!0 (index!24953 lt!262475) (x!53841 lt!262475) mask!3119) (index!24953 lt!262475) (select (arr!17232 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575070 () Bool)

(declare-fun e!330879 () SeekEntryResult!5681)

(assert (=> b!575070 (= e!330879 Undefined!5681)))

(declare-fun b!575071 () Bool)

(declare-fun c!66135 () Bool)

(declare-fun lt!262664 () (_ BitVec 64))

(assert (=> b!575071 (= c!66135 (= lt!262664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330881 () SeekEntryResult!5681)

(assert (=> b!575071 (= e!330881 e!330880)))

(declare-fun b!575072 () Bool)

(assert (=> b!575072 (= e!330880 (MissingVacant!5681 (index!24953 lt!262475)))))

(declare-fun b!575073 () Bool)

(assert (=> b!575073 (= e!330881 (Found!5681 (index!24953 lt!262475)))))

(declare-fun d!85267 () Bool)

(declare-fun lt!262663 () SeekEntryResult!5681)

(assert (=> d!85267 (and (or (is-Undefined!5681 lt!262663) (not (is-Found!5681 lt!262663)) (and (bvsge (index!24952 lt!262663) #b00000000000000000000000000000000) (bvslt (index!24952 lt!262663) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262663) (is-Found!5681 lt!262663) (not (is-MissingVacant!5681 lt!262663)) (not (= (index!24954 lt!262663) (index!24953 lt!262475))) (and (bvsge (index!24954 lt!262663) #b00000000000000000000000000000000) (bvslt (index!24954 lt!262663) (size!17596 a!3118)))) (or (is-Undefined!5681 lt!262663) (ite (is-Found!5681 lt!262663) (= (select (arr!17232 a!3118) (index!24952 lt!262663)) (select (arr!17232 a!3118) j!142)) (and (is-MissingVacant!5681 lt!262663) (= (index!24954 lt!262663) (index!24953 lt!262475)) (= (select (arr!17232 a!3118) (index!24954 lt!262663)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85267 (= lt!262663 e!330879)))

(declare-fun c!66134 () Bool)

(assert (=> d!85267 (= c!66134 (bvsge (x!53841 lt!262475) #b01111111111111111111111111111110))))

(assert (=> d!85267 (= lt!262664 (select (arr!17232 a!3118) (index!24953 lt!262475)))))

(assert (=> d!85267 (validMask!0 mask!3119)))

(assert (=> d!85267 (= (seekKeyOrZeroReturnVacant!0 (x!53841 lt!262475) (index!24953 lt!262475) (index!24953 lt!262475) (select (arr!17232 a!3118) j!142) a!3118 mask!3119) lt!262663)))

(declare-fun b!575069 () Bool)

(assert (=> b!575069 (= e!330879 e!330881)))

(declare-fun c!66133 () Bool)

(assert (=> b!575069 (= c!66133 (= lt!262664 (select (arr!17232 a!3118) j!142)))))

(assert (= (and d!85267 c!66134) b!575070))

(assert (= (and d!85267 (not c!66134)) b!575069))

(assert (= (and b!575069 c!66133) b!575073))

(assert (= (and b!575069 (not c!66133)) b!575071))

(assert (= (and b!575071 c!66135) b!575072))

(assert (= (and b!575071 (not c!66135)) b!575068))

(assert (=> b!575068 m!553787))

(assert (=> b!575068 m!553787))

(assert (=> b!575068 m!553497))

(declare-fun m!553847 () Bool)

(assert (=> b!575068 m!553847))

(declare-fun m!553849 () Bool)

(assert (=> d!85267 m!553849))

(declare-fun m!553851 () Bool)

(assert (=> d!85267 m!553851))

(assert (=> d!85267 m!553509))

(assert (=> d!85267 m!553501))

(assert (=> b!574673 d!85267))

(declare-fun bm!32703 () Bool)

(declare-fun call!32706 () Bool)

(declare-fun c!66144 () Bool)

(assert (=> bm!32703 (= call!32706 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66144 (Cons!11308 (select (arr!17232 a!3118) #b00000000000000000000000000000000) Nil!11309) Nil!11309)))))

(declare-fun b!575102 () Bool)

(declare-fun e!330901 () Bool)

(declare-fun e!330900 () Bool)

(assert (=> b!575102 (= e!330901 e!330900)))

(assert (=> b!575102 (= c!66144 (validKeyInArray!0 (select (arr!17232 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575103 () Bool)

(declare-fun e!330902 () Bool)

(declare-fun contains!2893 (List!11312 (_ BitVec 64)) Bool)

(assert (=> b!575103 (= e!330902 (contains!2893 Nil!11309 (select (arr!17232 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85269 () Bool)

(declare-fun res!363544 () Bool)

(declare-fun e!330903 () Bool)

(assert (=> d!85269 (=> res!363544 e!330903)))

(assert (=> d!85269 (= res!363544 (bvsge #b00000000000000000000000000000000 (size!17596 a!3118)))))

(assert (=> d!85269 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11309) e!330903)))

(declare-fun b!575104 () Bool)

(assert (=> b!575104 (= e!330900 call!32706)))

(declare-fun b!575105 () Bool)

(assert (=> b!575105 (= e!330903 e!330901)))

(declare-fun res!363542 () Bool)

(assert (=> b!575105 (=> (not res!363542) (not e!330901))))

(assert (=> b!575105 (= res!363542 (not e!330902))))

(declare-fun res!363543 () Bool)

(assert (=> b!575105 (=> (not res!363543) (not e!330902))))

(assert (=> b!575105 (= res!363543 (validKeyInArray!0 (select (arr!17232 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575106 () Bool)

(assert (=> b!575106 (= e!330900 call!32706)))

(assert (= (and d!85269 (not res!363544)) b!575105))

(assert (= (and b!575105 res!363543) b!575103))

(assert (= (and b!575105 res!363542) b!575102))

(assert (= (and b!575102 c!66144) b!575106))

(assert (= (and b!575102 (not c!66144)) b!575104))

(assert (= (or b!575106 b!575104) bm!32703))

(assert (=> bm!32703 m!553723))

(declare-fun m!553869 () Bool)

(assert (=> bm!32703 m!553869))

(assert (=> b!575102 m!553723))

(assert (=> b!575102 m!553723))

(declare-fun m!553871 () Bool)

(assert (=> b!575102 m!553871))

(assert (=> b!575103 m!553723))

(assert (=> b!575103 m!553723))

(declare-fun m!553873 () Bool)

(assert (=> b!575103 m!553873))

(assert (=> b!575105 m!553723))

(assert (=> b!575105 m!553723))

(assert (=> b!575105 m!553871))

(assert (=> b!574668 d!85269))

(declare-fun b!575107 () Bool)

(declare-fun e!330905 () Bool)

(declare-fun call!32707 () Bool)

(assert (=> b!575107 (= e!330905 call!32707)))

(declare-fun b!575108 () Bool)

(declare-fun e!330906 () Bool)

(assert (=> b!575108 (= e!330905 e!330906)))

(declare-fun lt!262674 () (_ BitVec 64))

(assert (=> b!575108 (= lt!262674 (select (arr!17232 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262675 () Unit!18064)

(assert (=> b!575108 (= lt!262675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262674 #b00000000000000000000000000000000))))

(assert (=> b!575108 (arrayContainsKey!0 a!3118 lt!262674 #b00000000000000000000000000000000)))

(declare-fun lt!262673 () Unit!18064)

(assert (=> b!575108 (= lt!262673 lt!262675)))

(declare-fun res!363545 () Bool)

(assert (=> b!575108 (= res!363545 (= (seekEntryOrOpen!0 (select (arr!17232 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5681 #b00000000000000000000000000000000)))))

(assert (=> b!575108 (=> (not res!363545) (not e!330906))))

(declare-fun b!575109 () Bool)

(assert (=> b!575109 (= e!330906 call!32707)))

(declare-fun b!575110 () Bool)

(declare-fun e!330904 () Bool)

(assert (=> b!575110 (= e!330904 e!330905)))

(declare-fun c!66145 () Bool)

(assert (=> b!575110 (= c!66145 (validKeyInArray!0 (select (arr!17232 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85275 () Bool)

(declare-fun res!363546 () Bool)

(assert (=> d!85275 (=> res!363546 e!330904)))

(assert (=> d!85275 (= res!363546 (bvsge #b00000000000000000000000000000000 (size!17596 a!3118)))))

(assert (=> d!85275 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330904)))

(declare-fun bm!32704 () Bool)

(assert (=> bm!32704 (= call!32707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85275 (not res!363546)) b!575110))

(assert (= (and b!575110 c!66145) b!575108))

(assert (= (and b!575110 (not c!66145)) b!575107))

(assert (= (and b!575108 res!363545) b!575109))

(assert (= (or b!575109 b!575107) bm!32704))

(assert (=> b!575108 m!553723))

(declare-fun m!553875 () Bool)

(assert (=> b!575108 m!553875))

(declare-fun m!553877 () Bool)

(assert (=> b!575108 m!553877))

(assert (=> b!575108 m!553723))

(declare-fun m!553879 () Bool)

(assert (=> b!575108 m!553879))

(assert (=> b!575110 m!553723))

(assert (=> b!575110 m!553723))

(assert (=> b!575110 m!553871))

(declare-fun m!553881 () Bool)

(assert (=> bm!32704 m!553881))

(assert (=> b!574662 d!85275))

(push 1)

