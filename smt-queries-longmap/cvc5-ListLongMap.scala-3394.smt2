; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46776 () Bool)

(assert start!46776)

(declare-fun b!516668 () Bool)

(declare-fun res!316232 () Bool)

(declare-fun e!301506 () Bool)

(assert (=> b!516668 (=> (not res!316232) (not e!301506))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33088 0))(
  ( (array!33089 (arr!15912 (Array (_ BitVec 32) (_ BitVec 64))) (size!16276 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33088)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516668 (= res!316232 (and (= (size!16276 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16276 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16276 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516669 () Bool)

(declare-fun res!316233 () Bool)

(assert (=> b!516669 (=> (not res!316233) (not e!301506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516669 (= res!316233 (validKeyInArray!0 (select (arr!15912 a!3235) j!176)))))

(declare-fun b!516670 () Bool)

(declare-fun e!301505 () Bool)

(assert (=> b!516670 (= e!301506 e!301505)))

(declare-fun res!316236 () Bool)

(assert (=> b!516670 (=> (not res!316236) (not e!301505))))

(declare-datatypes ((SeekEntryResult!4379 0))(
  ( (MissingZero!4379 (index!19704 (_ BitVec 32))) (Found!4379 (index!19705 (_ BitVec 32))) (Intermediate!4379 (undefined!5191 Bool) (index!19706 (_ BitVec 32)) (x!48662 (_ BitVec 32))) (Undefined!4379) (MissingVacant!4379 (index!19707 (_ BitVec 32))) )
))
(declare-fun lt!236524 () SeekEntryResult!4379)

(assert (=> b!516670 (= res!316236 (or (= lt!236524 (MissingZero!4379 i!1204)) (= lt!236524 (MissingVacant!4379 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33088 (_ BitVec 32)) SeekEntryResult!4379)

(assert (=> b!516670 (= lt!236524 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516671 () Bool)

(declare-fun res!316234 () Bool)

(assert (=> b!516671 (=> (not res!316234) (not e!301506))))

(declare-fun arrayContainsKey!0 (array!33088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516671 (= res!316234 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516672 () Bool)

(declare-fun e!301508 () Bool)

(assert (=> b!516672 (= e!301505 (not e!301508))))

(declare-fun res!316231 () Bool)

(assert (=> b!516672 (=> res!316231 e!301508)))

(declare-fun lt!236521 () (_ BitVec 32))

(declare-fun lt!236520 () SeekEntryResult!4379)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33088 (_ BitVec 32)) SeekEntryResult!4379)

(assert (=> b!516672 (= res!316231 (= lt!236520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236521 (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235)) mask!3524)))))

(declare-fun lt!236522 () (_ BitVec 32))

(assert (=> b!516672 (= lt!236520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236522 (select (arr!15912 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516672 (= lt!236521 (toIndex!0 (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516672 (= lt!236522 (toIndex!0 (select (arr!15912 a!3235) j!176) mask!3524))))

(declare-fun e!301509 () Bool)

(assert (=> b!516672 e!301509))

(declare-fun res!316238 () Bool)

(assert (=> b!516672 (=> (not res!316238) (not e!301509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33088 (_ BitVec 32)) Bool)

(assert (=> b!516672 (= res!316238 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16016 0))(
  ( (Unit!16017) )
))
(declare-fun lt!236523 () Unit!16016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16016)

(assert (=> b!516672 (= lt!236523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516673 () Bool)

(declare-fun res!316235 () Bool)

(assert (=> b!516673 (=> (not res!316235) (not e!301505))))

(declare-datatypes ((List!10070 0))(
  ( (Nil!10067) (Cons!10066 (h!10964 (_ BitVec 64)) (t!16298 List!10070)) )
))
(declare-fun arrayNoDuplicates!0 (array!33088 (_ BitVec 32) List!10070) Bool)

(assert (=> b!516673 (= res!316235 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10067))))

(declare-fun b!516674 () Bool)

(declare-fun res!316237 () Bool)

(assert (=> b!516674 (=> (not res!316237) (not e!301506))))

(assert (=> b!516674 (= res!316237 (validKeyInArray!0 k!2280))))

(declare-fun b!516675 () Bool)

(declare-fun res!316239 () Bool)

(assert (=> b!516675 (=> res!316239 e!301508)))

(assert (=> b!516675 (= res!316239 (or (undefined!5191 lt!236520) (not (is-Intermediate!4379 lt!236520))))))

(declare-fun b!516676 () Bool)

(assert (=> b!516676 (= e!301508 (or (not (= (select (arr!15912 a!3235) (index!19706 lt!236520)) (select (arr!15912 a!3235) j!176))) (bvsgt (x!48662 lt!236520) #b01111111111111111111111111111110) (bvsle #b00000000000000000000000000000000 (x!48662 lt!236520))))))

(assert (=> b!516676 (and (bvslt (x!48662 lt!236520) #b01111111111111111111111111111110) (or (= (select (arr!15912 a!3235) (index!19706 lt!236520)) (select (arr!15912 a!3235) j!176)) (= (select (arr!15912 a!3235) (index!19706 lt!236520)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15912 a!3235) (index!19706 lt!236520)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516677 () Bool)

(declare-fun res!316240 () Bool)

(assert (=> b!516677 (=> (not res!316240) (not e!301505))))

(assert (=> b!516677 (= res!316240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!316241 () Bool)

(assert (=> start!46776 (=> (not res!316241) (not e!301506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46776 (= res!316241 (validMask!0 mask!3524))))

(assert (=> start!46776 e!301506))

(assert (=> start!46776 true))

(declare-fun array_inv!11708 (array!33088) Bool)

(assert (=> start!46776 (array_inv!11708 a!3235)))

(declare-fun b!516667 () Bool)

(assert (=> b!516667 (= e!301509 (= (seekEntryOrOpen!0 (select (arr!15912 a!3235) j!176) a!3235 mask!3524) (Found!4379 j!176)))))

(assert (= (and start!46776 res!316241) b!516668))

(assert (= (and b!516668 res!316232) b!516669))

(assert (= (and b!516669 res!316233) b!516674))

(assert (= (and b!516674 res!316237) b!516671))

(assert (= (and b!516671 res!316234) b!516670))

(assert (= (and b!516670 res!316236) b!516677))

(assert (= (and b!516677 res!316240) b!516673))

(assert (= (and b!516673 res!316235) b!516672))

(assert (= (and b!516672 res!316238) b!516667))

(assert (= (and b!516672 (not res!316231)) b!516675))

(assert (= (and b!516675 (not res!316239)) b!516676))

(declare-fun m!498189 () Bool)

(assert (=> b!516676 m!498189))

(declare-fun m!498191 () Bool)

(assert (=> b!516676 m!498191))

(assert (=> b!516667 m!498191))

(assert (=> b!516667 m!498191))

(declare-fun m!498193 () Bool)

(assert (=> b!516667 m!498193))

(assert (=> b!516669 m!498191))

(assert (=> b!516669 m!498191))

(declare-fun m!498195 () Bool)

(assert (=> b!516669 m!498195))

(declare-fun m!498197 () Bool)

(assert (=> b!516670 m!498197))

(declare-fun m!498199 () Bool)

(assert (=> start!46776 m!498199))

(declare-fun m!498201 () Bool)

(assert (=> start!46776 m!498201))

(declare-fun m!498203 () Bool)

(assert (=> b!516674 m!498203))

(declare-fun m!498205 () Bool)

(assert (=> b!516672 m!498205))

(declare-fun m!498207 () Bool)

(assert (=> b!516672 m!498207))

(declare-fun m!498209 () Bool)

(assert (=> b!516672 m!498209))

(assert (=> b!516672 m!498191))

(declare-fun m!498211 () Bool)

(assert (=> b!516672 m!498211))

(assert (=> b!516672 m!498191))

(declare-fun m!498213 () Bool)

(assert (=> b!516672 m!498213))

(assert (=> b!516672 m!498191))

(declare-fun m!498215 () Bool)

(assert (=> b!516672 m!498215))

(assert (=> b!516672 m!498209))

(declare-fun m!498217 () Bool)

(assert (=> b!516672 m!498217))

(assert (=> b!516672 m!498209))

(declare-fun m!498219 () Bool)

(assert (=> b!516672 m!498219))

(declare-fun m!498221 () Bool)

(assert (=> b!516677 m!498221))

(declare-fun m!498223 () Bool)

(assert (=> b!516671 m!498223))

(declare-fun m!498225 () Bool)

(assert (=> b!516673 m!498225))

(push 1)

(assert (not b!516677))

(assert (not b!516670))

(assert (not b!516673))

(assert (not b!516669))

(assert (not start!46776))

(assert (not b!516674))

(assert (not b!516671))

(assert (not b!516667))

(assert (not b!516672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79581 () Bool)

(assert (=> d!79581 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516674 d!79581))

(declare-fun d!79583 () Bool)

(assert (=> d!79583 (= (validKeyInArray!0 (select (arr!15912 a!3235) j!176)) (and (not (= (select (arr!15912 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15912 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516669 d!79583))

(declare-fun d!79585 () Bool)

(declare-fun res!316317 () Bool)

(declare-fun e!301557 () Bool)

(assert (=> d!79585 (=> res!316317 e!301557)))

(assert (=> d!79585 (= res!316317 (bvsge #b00000000000000000000000000000000 (size!16276 a!3235)))))

(assert (=> d!79585 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10067) e!301557)))

(declare-fun bm!31640 () Bool)

(declare-fun call!31643 () Bool)

(declare-fun c!60518 () Bool)

(assert (=> bm!31640 (= call!31643 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60518 (Cons!10066 (select (arr!15912 a!3235) #b00000000000000000000000000000000) Nil!10067) Nil!10067)))))

(declare-fun b!516772 () Bool)

(declare-fun e!301560 () Bool)

(declare-fun contains!2740 (List!10070 (_ BitVec 64)) Bool)

(assert (=> b!516772 (= e!301560 (contains!2740 Nil!10067 (select (arr!15912 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516773 () Bool)

(declare-fun e!301559 () Bool)

(assert (=> b!516773 (= e!301559 call!31643)))

(declare-fun b!516774 () Bool)

(declare-fun e!301558 () Bool)

(assert (=> b!516774 (= e!301557 e!301558)))

(declare-fun res!316316 () Bool)

(assert (=> b!516774 (=> (not res!316316) (not e!301558))))

(assert (=> b!516774 (= res!316316 (not e!301560))))

(declare-fun res!316315 () Bool)

(assert (=> b!516774 (=> (not res!316315) (not e!301560))))

(assert (=> b!516774 (= res!316315 (validKeyInArray!0 (select (arr!15912 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516775 () Bool)

(assert (=> b!516775 (= e!301559 call!31643)))

(declare-fun b!516776 () Bool)

(assert (=> b!516776 (= e!301558 e!301559)))

(assert (=> b!516776 (= c!60518 (validKeyInArray!0 (select (arr!15912 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79585 (not res!316317)) b!516774))

(assert (= (and b!516774 res!316315) b!516772))

(assert (= (and b!516774 res!316316) b!516776))

(assert (= (and b!516776 c!60518) b!516775))

(assert (= (and b!516776 (not c!60518)) b!516773))

(assert (= (or b!516775 b!516773) bm!31640))

(declare-fun m!498317 () Bool)

(assert (=> bm!31640 m!498317))

(declare-fun m!498319 () Bool)

(assert (=> bm!31640 m!498319))

(assert (=> b!516772 m!498317))

(assert (=> b!516772 m!498317))

(declare-fun m!498321 () Bool)

(assert (=> b!516772 m!498321))

(assert (=> b!516774 m!498317))

(assert (=> b!516774 m!498317))

(declare-fun m!498323 () Bool)

(assert (=> b!516774 m!498323))

(assert (=> b!516776 m!498317))

(assert (=> b!516776 m!498317))

(assert (=> b!516776 m!498323))

(assert (=> b!516673 d!79585))

(declare-fun b!516812 () Bool)

(declare-fun e!301584 () Bool)

(declare-fun call!31646 () Bool)

(assert (=> b!516812 (= e!301584 call!31646)))

(declare-fun b!516813 () Bool)

(declare-fun e!301582 () Bool)

(assert (=> b!516813 (= e!301582 e!301584)))

(declare-fun c!60530 () Bool)

(assert (=> b!516813 (= c!60530 (validKeyInArray!0 (select (arr!15912 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79589 () Bool)

(declare-fun res!316331 () Bool)

(assert (=> d!79589 (=> res!316331 e!301582)))

(assert (=> d!79589 (= res!316331 (bvsge #b00000000000000000000000000000000 (size!16276 a!3235)))))

(assert (=> d!79589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301582)))

(declare-fun b!516814 () Bool)

(declare-fun e!301583 () Bool)

(assert (=> b!516814 (= e!301583 call!31646)))

(declare-fun bm!31643 () Bool)

(assert (=> bm!31643 (= call!31646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516815 () Bool)

(assert (=> b!516815 (= e!301584 e!301583)))

(declare-fun lt!236582 () (_ BitVec 64))

(assert (=> b!516815 (= lt!236582 (select (arr!15912 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236584 () Unit!16016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33088 (_ BitVec 64) (_ BitVec 32)) Unit!16016)

(assert (=> b!516815 (= lt!236584 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236582 #b00000000000000000000000000000000))))

(assert (=> b!516815 (arrayContainsKey!0 a!3235 lt!236582 #b00000000000000000000000000000000)))

(declare-fun lt!236583 () Unit!16016)

(assert (=> b!516815 (= lt!236583 lt!236584)))

(declare-fun res!316332 () Bool)

(assert (=> b!516815 (= res!316332 (= (seekEntryOrOpen!0 (select (arr!15912 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4379 #b00000000000000000000000000000000)))))

(assert (=> b!516815 (=> (not res!316332) (not e!301583))))

(assert (= (and d!79589 (not res!316331)) b!516813))

(assert (= (and b!516813 c!60530) b!516815))

(assert (= (and b!516813 (not c!60530)) b!516812))

(assert (= (and b!516815 res!316332) b!516814))

(assert (= (or b!516814 b!516812) bm!31643))

(assert (=> b!516813 m!498317))

(assert (=> b!516813 m!498317))

(assert (=> b!516813 m!498323))

(declare-fun m!498333 () Bool)

(assert (=> bm!31643 m!498333))

(assert (=> b!516815 m!498317))

(declare-fun m!498335 () Bool)

(assert (=> b!516815 m!498335))

(declare-fun m!498337 () Bool)

(assert (=> b!516815 m!498337))

(assert (=> b!516815 m!498317))

(declare-fun m!498339 () Bool)

(assert (=> b!516815 m!498339))

(assert (=> b!516677 d!79589))

(declare-fun d!79593 () Bool)

(assert (=> d!79593 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46776 d!79593))

(declare-fun d!79601 () Bool)

(assert (=> d!79601 (= (array_inv!11708 a!3235) (bvsge (size!16276 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46776 d!79601))

(declare-fun d!79605 () Bool)

(declare-fun lt!236615 () (_ BitVec 32))

(declare-fun lt!236614 () (_ BitVec 32))

(assert (=> d!79605 (= lt!236615 (bvmul (bvxor lt!236614 (bvlshr lt!236614 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79605 (= lt!236614 ((_ extract 31 0) (bvand (bvxor (select (arr!15912 a!3235) j!176) (bvlshr (select (arr!15912 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79605 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316342 (let ((h!10968 ((_ extract 31 0) (bvand (bvxor (select (arr!15912 a!3235) j!176) (bvlshr (select (arr!15912 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48667 (bvmul (bvxor h!10968 (bvlshr h!10968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48667 (bvlshr x!48667 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316342 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316342 #b00000000000000000000000000000000))))))

(assert (=> d!79605 (= (toIndex!0 (select (arr!15912 a!3235) j!176) mask!3524) (bvand (bvxor lt!236615 (bvlshr lt!236615 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516672 d!79605))

(declare-fun b!516865 () Bool)

(declare-fun e!301620 () Bool)

(declare-fun call!31650 () Bool)

(assert (=> b!516865 (= e!301620 call!31650)))

(declare-fun b!516866 () Bool)

(declare-fun e!301618 () Bool)

(assert (=> b!516866 (= e!301618 e!301620)))

(declare-fun c!60546 () Bool)

(assert (=> b!516866 (= c!60546 (validKeyInArray!0 (select (arr!15912 a!3235) j!176)))))

(declare-fun d!79613 () Bool)

(declare-fun res!316353 () Bool)

(assert (=> d!79613 (=> res!316353 e!301618)))

(assert (=> d!79613 (= res!316353 (bvsge j!176 (size!16276 a!3235)))))

(assert (=> d!79613 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301618)))

(declare-fun b!516867 () Bool)

(declare-fun e!301619 () Bool)

(assert (=> b!516867 (= e!301619 call!31650)))

(declare-fun bm!31647 () Bool)

(assert (=> bm!31647 (= call!31650 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516868 () Bool)

(assert (=> b!516868 (= e!301620 e!301619)))

(declare-fun lt!236616 () (_ BitVec 64))

(assert (=> b!516868 (= lt!236616 (select (arr!15912 a!3235) j!176))))

(declare-fun lt!236618 () Unit!16016)

(assert (=> b!516868 (= lt!236618 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236616 j!176))))

(assert (=> b!516868 (arrayContainsKey!0 a!3235 lt!236616 #b00000000000000000000000000000000)))

(declare-fun lt!236617 () Unit!16016)

(assert (=> b!516868 (= lt!236617 lt!236618)))

(declare-fun res!316354 () Bool)

(assert (=> b!516868 (= res!316354 (= (seekEntryOrOpen!0 (select (arr!15912 a!3235) j!176) a!3235 mask!3524) (Found!4379 j!176)))))

(assert (=> b!516868 (=> (not res!316354) (not e!301619))))

(assert (= (and d!79613 (not res!316353)) b!516866))

(assert (= (and b!516866 c!60546) b!516868))

(assert (= (and b!516866 (not c!60546)) b!516865))

(assert (= (and b!516868 res!316354) b!516867))

(assert (= (or b!516867 b!516865) bm!31647))

(assert (=> b!516866 m!498191))

(assert (=> b!516866 m!498191))

(assert (=> b!516866 m!498195))

(declare-fun m!498377 () Bool)

(assert (=> bm!31647 m!498377))

(assert (=> b!516868 m!498191))

(declare-fun m!498379 () Bool)

(assert (=> b!516868 m!498379))

(declare-fun m!498381 () Bool)

(assert (=> b!516868 m!498381))

(assert (=> b!516868 m!498191))

(assert (=> b!516868 m!498193))

(assert (=> b!516672 d!79613))

(declare-fun d!79617 () Bool)

(assert (=> d!79617 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236621 () Unit!16016)

(declare-fun choose!38 (array!33088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16016)

(assert (=> d!79617 (= lt!236621 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79617 (validMask!0 mask!3524)))

(assert (=> d!79617 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236621)))

(declare-fun bs!16328 () Bool)

(assert (= bs!16328 d!79617))

(assert (=> bs!16328 m!498215))

(declare-fun m!498389 () Bool)

(assert (=> bs!16328 m!498389))

(assert (=> bs!16328 m!498199))

(assert (=> b!516672 d!79617))

(declare-fun d!79621 () Bool)

(declare-fun lt!236623 () (_ BitVec 32))

(declare-fun lt!236622 () (_ BitVec 32))

(assert (=> d!79621 (= lt!236623 (bvmul (bvxor lt!236622 (bvlshr lt!236622 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79621 (= lt!236622 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79621 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316342 (let ((h!10968 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48667 (bvmul (bvxor h!10968 (bvlshr h!10968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48667 (bvlshr x!48667 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316342 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316342 #b00000000000000000000000000000000))))))

(assert (=> d!79621 (= (toIndex!0 (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!236623 (bvlshr lt!236623 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516672 d!79621))

(declare-fun lt!236646 () SeekEntryResult!4379)

(declare-fun b!516947 () Bool)

(assert (=> b!516947 (and (bvsge (index!19706 lt!236646) #b00000000000000000000000000000000) (bvslt (index!19706 lt!236646) (size!16276 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235)))))))

(declare-fun e!301676 () Bool)

(assert (=> b!516947 (= e!301676 (= (select (arr!15912 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235))) (index!19706 lt!236646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!516948 () Bool)

(declare-fun e!301679 () SeekEntryResult!4379)

(declare-fun e!301675 () SeekEntryResult!4379)

(assert (=> b!516948 (= e!301679 e!301675)))

(declare-fun lt!236647 () (_ BitVec 64))

(declare-fun c!60570 () Bool)

(assert (=> b!516948 (= c!60570 (or (= lt!236647 (select (store (arr!15912 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!236647 lt!236647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516949 () Bool)

(declare-fun e!301677 () Bool)

(assert (=> b!516949 (= e!301677 (bvsge (x!48662 lt!236646) #b01111111111111111111111111111110))))

(declare-fun b!516950 () Bool)

(assert (=> b!516950 (= e!301675 (Intermediate!4379 false lt!236521 #b00000000000000000000000000000000))))

(declare-fun b!516951 () Bool)

(assert (=> b!516951 (= e!301679 (Intermediate!4379 true lt!236521 #b00000000000000000000000000000000))))

(declare-fun b!516952 () Bool)

(assert (=> b!516952 (and (bvsge (index!19706 lt!236646) #b00000000000000000000000000000000) (bvslt (index!19706 lt!236646) (size!16276 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235)))))))

(declare-fun res!316392 () Bool)

(assert (=> b!516952 (= res!316392 (= (select (arr!15912 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235))) (index!19706 lt!236646)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516952 (=> res!316392 e!301676)))

(declare-fun d!79623 () Bool)

(assert (=> d!79623 e!301677))

(declare-fun c!60571 () Bool)

(assert (=> d!79623 (= c!60571 (and (is-Intermediate!4379 lt!236646) (undefined!5191 lt!236646)))))

(assert (=> d!79623 (= lt!236646 e!301679)))

(declare-fun c!60569 () Bool)

(assert (=> d!79623 (= c!60569 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79623 (= lt!236647 (select (arr!15912 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235))) lt!236521))))

(assert (=> d!79623 (validMask!0 mask!3524)))

(assert (=> d!79623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236521 (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235)) mask!3524) lt!236646)))

(declare-fun b!516953 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516953 (= e!301675 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236521 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15912 a!3235) i!1204 k!2280) j!176) (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235)) mask!3524))))

(declare-fun b!516954 () Bool)

(assert (=> b!516954 (and (bvsge (index!19706 lt!236646) #b00000000000000000000000000000000) (bvslt (index!19706 lt!236646) (size!16276 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235)))))))

(declare-fun res!316390 () Bool)

(assert (=> b!516954 (= res!316390 (= (select (arr!15912 (array!33089 (store (arr!15912 a!3235) i!1204 k!2280) (size!16276 a!3235))) (index!19706 lt!236646)) (select (store (arr!15912 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!516954 (=> res!316390 e!301676)))

(declare-fun e!301678 () Bool)

(assert (=> b!516954 (= e!301678 e!301676)))

(declare-fun b!516955 () Bool)

(assert (=> b!516955 (= e!301677 e!301678)))

(declare-fun res!316391 () Bool)

(assert (=> b!516955 (= res!316391 (and (is-Intermediate!4379 lt!236646) (not (undefined!5191 lt!236646)) (bvslt (x!48662 lt!236646) #b01111111111111111111111111111110) (bvsge (x!48662 lt!236646) #b00000000000000000000000000000000) (bvsge (x!48662 lt!236646) #b00000000000000000000000000000000)))))

(assert (=> b!516955 (=> (not res!316391) (not e!301678))))

(assert (= (and d!79623 c!60569) b!516951))

(assert (= (and d!79623 (not c!60569)) b!516948))

(assert (= (and b!516948 c!60570) b!516950))

(assert (= (and b!516948 (not c!60570)) b!516953))

(assert (= (and d!79623 c!60571) b!516949))

(assert (= (and d!79623 (not c!60571)) b!516955))

(assert (= (and b!516955 res!316391) b!516954))

(assert (= (and b!516954 (not res!316390)) b!516952))

(assert (= (and b!516952 (not res!316392)) b!516947))

(declare-fun m!498439 () Bool)

(assert (=> b!516954 m!498439))

(declare-fun m!498441 () Bool)

(assert (=> b!516953 m!498441))

(assert (=> b!516953 m!498441))

(assert (=> b!516953 m!498209))

(declare-fun m!498443 () Bool)

(assert (=> b!516953 m!498443))

(assert (=> b!516952 m!498439))

(declare-fun m!498445 () Bool)

(assert (=> d!79623 m!498445))

(assert (=> d!79623 m!498199))

(assert (=> b!516947 m!498439))

(assert (=> b!516672 d!79623))

(declare-fun b!516956 () Bool)

(declare-fun lt!236648 () SeekEntryResult!4379)

(assert (=> b!516956 (and (bvsge (index!19706 lt!236648) #b00000000000000000000000000000000) (bvslt (index!19706 lt!236648) (size!16276 a!3235)))))

(declare-fun e!301681 () Bool)

(assert (=> b!516956 (= e!301681 (= (select (arr!15912 a!3235) (index!19706 lt!236648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!516957 () Bool)

(declare-fun e!301684 () SeekEntryResult!4379)

(declare-fun e!301680 () SeekEntryResult!4379)

(assert (=> b!516957 (= e!301684 e!301680)))

(declare-fun lt!236649 () (_ BitVec 64))

(declare-fun c!60573 () Bool)

(assert (=> b!516957 (= c!60573 (or (= lt!236649 (select (arr!15912 a!3235) j!176)) (= (bvadd lt!236649 lt!236649) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516958 () Bool)

(declare-fun e!301682 () Bool)

(assert (=> b!516958 (= e!301682 (bvsge (x!48662 lt!236648) #b01111111111111111111111111111110))))

(declare-fun b!516959 () Bool)

(assert (=> b!516959 (= e!301680 (Intermediate!4379 false lt!236522 #b00000000000000000000000000000000))))

(declare-fun b!516960 () Bool)

(assert (=> b!516960 (= e!301684 (Intermediate!4379 true lt!236522 #b00000000000000000000000000000000))))

(declare-fun b!516961 () Bool)

(assert (=> b!516961 (and (bvsge (index!19706 lt!236648) #b00000000000000000000000000000000) (bvslt (index!19706 lt!236648) (size!16276 a!3235)))))

(declare-fun res!316395 () Bool)

(assert (=> b!516961 (= res!316395 (= (select (arr!15912 a!3235) (index!19706 lt!236648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516961 (=> res!316395 e!301681)))

(declare-fun d!79647 () Bool)

(assert (=> d!79647 e!301682))

(declare-fun c!60574 () Bool)

(assert (=> d!79647 (= c!60574 (and (is-Intermediate!4379 lt!236648) (undefined!5191 lt!236648)))))

(assert (=> d!79647 (= lt!236648 e!301684)))

(declare-fun c!60572 () Bool)

(assert (=> d!79647 (= c!60572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79647 (= lt!236649 (select (arr!15912 a!3235) lt!236522))))

(assert (=> d!79647 (validMask!0 mask!3524)))

(assert (=> d!79647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236522 (select (arr!15912 a!3235) j!176) a!3235 mask!3524) lt!236648)))

(declare-fun b!516962 () Bool)

(assert (=> b!516962 (= e!301680 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236522 #b00000000000000000000000000000000 mask!3524) (select (arr!15912 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516963 () Bool)

(assert (=> b!516963 (and (bvsge (index!19706 lt!236648) #b00000000000000000000000000000000) (bvslt (index!19706 lt!236648) (size!16276 a!3235)))))

(declare-fun res!316393 () Bool)

(assert (=> b!516963 (= res!316393 (= (select (arr!15912 a!3235) (index!19706 lt!236648)) (select (arr!15912 a!3235) j!176)))))

(assert (=> b!516963 (=> res!316393 e!301681)))

(declare-fun e!301683 () Bool)

(assert (=> b!516963 (= e!301683 e!301681)))

(declare-fun b!516964 () Bool)

(assert (=> b!516964 (= e!301682 e!301683)))

(declare-fun res!316394 () Bool)

(assert (=> b!516964 (= res!316394 (and (is-Intermediate!4379 lt!236648) (not (undefined!5191 lt!236648)) (bvslt (x!48662 lt!236648) #b01111111111111111111111111111110) (bvsge (x!48662 lt!236648) #b00000000000000000000000000000000) (bvsge (x!48662 lt!236648) #b00000000000000000000000000000000)))))

(assert (=> b!516964 (=> (not res!316394) (not e!301683))))

(assert (= (and d!79647 c!60572) b!516960))

(assert (= (and d!79647 (not c!60572)) b!516957))

(assert (= (and b!516957 c!60573) b!516959))

(assert (= (and b!516957 (not c!60573)) b!516962))

(assert (= (and d!79647 c!60574) b!516958))

(assert (= (and d!79647 (not c!60574)) b!516964))

(assert (= (and b!516964 res!316394) b!516963))

(assert (= (and b!516963 (not res!316393)) b!516961))

(assert (= (and b!516961 (not res!316395)) b!516956))

(declare-fun m!498447 () Bool)

(assert (=> b!516963 m!498447))

(declare-fun m!498449 () Bool)

(assert (=> b!516962 m!498449))

(assert (=> b!516962 m!498449))

(assert (=> b!516962 m!498191))

(declare-fun m!498451 () Bool)

(assert (=> b!516962 m!498451))

(assert (=> b!516961 m!498447))

(declare-fun m!498453 () Bool)

(assert (=> d!79647 m!498453))

(assert (=> d!79647 m!498199))

(assert (=> b!516956 m!498447))

(assert (=> b!516672 d!79647))

(declare-fun b!517008 () Bool)

(declare-fun e!301711 () SeekEntryResult!4379)

(declare-fun lt!236673 () SeekEntryResult!4379)

(assert (=> b!517008 (= e!301711 (Found!4379 (index!19706 lt!236673)))))

(declare-fun b!517009 () Bool)

(declare-fun e!301709 () SeekEntryResult!4379)

