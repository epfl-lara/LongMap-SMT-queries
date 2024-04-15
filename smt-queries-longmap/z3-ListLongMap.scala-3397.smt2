; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46902 () Bool)

(assert start!46902)

(declare-fun b!517275 () Bool)

(declare-fun res!316620 () Bool)

(declare-fun e!301841 () Bool)

(assert (=> b!517275 (=> (not res!316620) (not e!301841))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517275 (= res!316620 (validKeyInArray!0 k0!2280))))

(declare-fun b!517276 () Bool)

(declare-fun res!316622 () Bool)

(assert (=> b!517276 (=> (not res!316622) (not e!301841))))

(declare-datatypes ((array!33110 0))(
  ( (array!33111 (arr!15920 (Array (_ BitVec 32) (_ BitVec 64))) (size!16285 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33110)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517276 (= res!316622 (validKeyInArray!0 (select (arr!15920 a!3235) j!176)))))

(declare-fun b!517277 () Bool)

(declare-fun res!316621 () Bool)

(declare-fun e!301840 () Bool)

(assert (=> b!517277 (=> (not res!316621) (not e!301840))))

(declare-datatypes ((List!10117 0))(
  ( (Nil!10114) (Cons!10113 (h!11017 (_ BitVec 64)) (t!16336 List!10117)) )
))
(declare-fun arrayNoDuplicates!0 (array!33110 (_ BitVec 32) List!10117) Bool)

(assert (=> b!517277 (= res!316621 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10114))))

(declare-fun b!517278 () Bool)

(assert (=> b!517278 (= e!301841 e!301840)))

(declare-fun res!316618 () Bool)

(assert (=> b!517278 (=> (not res!316618) (not e!301840))))

(declare-datatypes ((SeekEntryResult!4384 0))(
  ( (MissingZero!4384 (index!19724 (_ BitVec 32))) (Found!4384 (index!19725 (_ BitVec 32))) (Intermediate!4384 (undefined!5196 Bool) (index!19726 (_ BitVec 32)) (x!48698 (_ BitVec 32))) (Undefined!4384) (MissingVacant!4384 (index!19727 (_ BitVec 32))) )
))
(declare-fun lt!236679 () SeekEntryResult!4384)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517278 (= res!316618 (or (= lt!236679 (MissingZero!4384 i!1204)) (= lt!236679 (MissingVacant!4384 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33110 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!517278 (= lt!236679 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517279 () Bool)

(declare-fun res!316617 () Bool)

(assert (=> b!517279 (=> (not res!316617) (not e!301840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33110 (_ BitVec 32)) Bool)

(assert (=> b!517279 (= res!316617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!301838 () Bool)

(declare-fun lt!236683 () SeekEntryResult!4384)

(declare-fun lt!236682 () (_ BitVec 32))

(declare-fun b!517280 () Bool)

(assert (=> b!517280 (= e!301838 (or (not (= (select (arr!15920 a!3235) (index!19726 lt!236683)) (select (arr!15920 a!3235) j!176))) (bvsgt (x!48698 lt!236683) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48698 lt!236683)) (bvslt lt!236682 #b00000000000000000000000000000000) (bvsge lt!236682 (size!16285 a!3235)) (and (bvsge (index!19726 lt!236683) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236683) (size!16285 a!3235)))))))

(assert (=> b!517280 (and (bvslt (x!48698 lt!236683) #b01111111111111111111111111111110) (or (= (select (arr!15920 a!3235) (index!19726 lt!236683)) (select (arr!15920 a!3235) j!176)) (= (select (arr!15920 a!3235) (index!19726 lt!236683)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15920 a!3235) (index!19726 lt!236683)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517281 () Bool)

(assert (=> b!517281 (= e!301840 (not e!301838))))

(declare-fun res!316623 () Bool)

(assert (=> b!517281 (=> res!316623 e!301838)))

(declare-fun lt!236680 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33110 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!517281 (= res!316623 (= lt!236683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236680 (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235)) mask!3524)))))

(assert (=> b!517281 (= lt!236683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236682 (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517281 (= lt!236680 (toIndex!0 (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517281 (= lt!236682 (toIndex!0 (select (arr!15920 a!3235) j!176) mask!3524))))

(declare-fun e!301842 () Bool)

(assert (=> b!517281 e!301842))

(declare-fun res!316616 () Bool)

(assert (=> b!517281 (=> (not res!316616) (not e!301842))))

(assert (=> b!517281 (= res!316616 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16012 0))(
  ( (Unit!16013) )
))
(declare-fun lt!236681 () Unit!16012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16012)

(assert (=> b!517281 (= lt!236681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517282 () Bool)

(declare-fun res!316625 () Bool)

(assert (=> b!517282 (=> (not res!316625) (not e!301841))))

(assert (=> b!517282 (= res!316625 (and (= (size!16285 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16285 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16285 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517284 () Bool)

(declare-fun res!316619 () Bool)

(assert (=> b!517284 (=> (not res!316619) (not e!301841))))

(declare-fun arrayContainsKey!0 (array!33110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517284 (= res!316619 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517285 () Bool)

(assert (=> b!517285 (= e!301842 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) (Found!4384 j!176)))))

(declare-fun b!517283 () Bool)

(declare-fun res!316624 () Bool)

(assert (=> b!517283 (=> res!316624 e!301838)))

(get-info :version)

(assert (=> b!517283 (= res!316624 (or (undefined!5196 lt!236683) (not ((_ is Intermediate!4384) lt!236683))))))

(declare-fun res!316615 () Bool)

(assert (=> start!46902 (=> (not res!316615) (not e!301841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46902 (= res!316615 (validMask!0 mask!3524))))

(assert (=> start!46902 e!301841))

(assert (=> start!46902 true))

(declare-fun array_inv!11803 (array!33110) Bool)

(assert (=> start!46902 (array_inv!11803 a!3235)))

(assert (= (and start!46902 res!316615) b!517282))

(assert (= (and b!517282 res!316625) b!517276))

(assert (= (and b!517276 res!316622) b!517275))

(assert (= (and b!517275 res!316620) b!517284))

(assert (= (and b!517284 res!316619) b!517278))

(assert (= (and b!517278 res!316618) b!517279))

(assert (= (and b!517279 res!316617) b!517277))

(assert (= (and b!517277 res!316621) b!517281))

(assert (= (and b!517281 res!316616) b!517285))

(assert (= (and b!517281 (not res!316623)) b!517283))

(assert (= (and b!517283 (not res!316624)) b!517280))

(declare-fun m!498187 () Bool)

(assert (=> b!517280 m!498187))

(declare-fun m!498189 () Bool)

(assert (=> b!517280 m!498189))

(declare-fun m!498191 () Bool)

(assert (=> b!517275 m!498191))

(declare-fun m!498193 () Bool)

(assert (=> b!517279 m!498193))

(declare-fun m!498195 () Bool)

(assert (=> b!517277 m!498195))

(assert (=> b!517285 m!498189))

(assert (=> b!517285 m!498189))

(declare-fun m!498197 () Bool)

(assert (=> b!517285 m!498197))

(assert (=> b!517281 m!498189))

(declare-fun m!498199 () Bool)

(assert (=> b!517281 m!498199))

(declare-fun m!498201 () Bool)

(assert (=> b!517281 m!498201))

(declare-fun m!498203 () Bool)

(assert (=> b!517281 m!498203))

(declare-fun m!498205 () Bool)

(assert (=> b!517281 m!498205))

(assert (=> b!517281 m!498205))

(declare-fun m!498207 () Bool)

(assert (=> b!517281 m!498207))

(assert (=> b!517281 m!498189))

(declare-fun m!498209 () Bool)

(assert (=> b!517281 m!498209))

(assert (=> b!517281 m!498189))

(declare-fun m!498211 () Bool)

(assert (=> b!517281 m!498211))

(assert (=> b!517281 m!498205))

(declare-fun m!498213 () Bool)

(assert (=> b!517281 m!498213))

(declare-fun m!498215 () Bool)

(assert (=> start!46902 m!498215))

(declare-fun m!498217 () Bool)

(assert (=> start!46902 m!498217))

(assert (=> b!517276 m!498189))

(assert (=> b!517276 m!498189))

(declare-fun m!498219 () Bool)

(assert (=> b!517276 m!498219))

(declare-fun m!498221 () Bool)

(assert (=> b!517278 m!498221))

(declare-fun m!498223 () Bool)

(assert (=> b!517284 m!498223))

(check-sat (not b!517278) (not b!517276) (not b!517275) (not b!517277) (not b!517281) (not b!517279) (not b!517285) (not b!517284) (not start!46902))
(check-sat)
(get-model)

(declare-fun b!517362 () Bool)

(declare-fun e!301884 () Bool)

(declare-fun e!301882 () Bool)

(assert (=> b!517362 (= e!301884 e!301882)))

(declare-fun c!60624 () Bool)

(assert (=> b!517362 (= c!60624 (validKeyInArray!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517363 () Bool)

(declare-fun e!301883 () Bool)

(declare-fun contains!2732 (List!10117 (_ BitVec 64)) Bool)

(assert (=> b!517363 (= e!301883 (contains!2732 Nil!10114 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79557 () Bool)

(declare-fun res!316700 () Bool)

(declare-fun e!301881 () Bool)

(assert (=> d!79557 (=> res!316700 e!301881)))

(assert (=> d!79557 (= res!316700 (bvsge #b00000000000000000000000000000000 (size!16285 a!3235)))))

(assert (=> d!79557 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10114) e!301881)))

(declare-fun bm!31657 () Bool)

(declare-fun call!31660 () Bool)

(assert (=> bm!31657 (= call!31660 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60624 (Cons!10113 (select (arr!15920 a!3235) #b00000000000000000000000000000000) Nil!10114) Nil!10114)))))

(declare-fun b!517364 () Bool)

(assert (=> b!517364 (= e!301882 call!31660)))

(declare-fun b!517365 () Bool)

(assert (=> b!517365 (= e!301882 call!31660)))

(declare-fun b!517366 () Bool)

(assert (=> b!517366 (= e!301881 e!301884)))

(declare-fun res!316699 () Bool)

(assert (=> b!517366 (=> (not res!316699) (not e!301884))))

(assert (=> b!517366 (= res!316699 (not e!301883))))

(declare-fun res!316698 () Bool)

(assert (=> b!517366 (=> (not res!316698) (not e!301883))))

(assert (=> b!517366 (= res!316698 (validKeyInArray!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79557 (not res!316700)) b!517366))

(assert (= (and b!517366 res!316698) b!517363))

(assert (= (and b!517366 res!316699) b!517362))

(assert (= (and b!517362 c!60624) b!517365))

(assert (= (and b!517362 (not c!60624)) b!517364))

(assert (= (or b!517365 b!517364) bm!31657))

(declare-fun m!498301 () Bool)

(assert (=> b!517362 m!498301))

(assert (=> b!517362 m!498301))

(declare-fun m!498303 () Bool)

(assert (=> b!517362 m!498303))

(assert (=> b!517363 m!498301))

(assert (=> b!517363 m!498301))

(declare-fun m!498305 () Bool)

(assert (=> b!517363 m!498305))

(assert (=> bm!31657 m!498301))

(declare-fun m!498307 () Bool)

(assert (=> bm!31657 m!498307))

(assert (=> b!517366 m!498301))

(assert (=> b!517366 m!498301))

(assert (=> b!517366 m!498303))

(assert (=> b!517277 d!79557))

(declare-fun lt!236721 () SeekEntryResult!4384)

(declare-fun e!301893 () SeekEntryResult!4384)

(declare-fun b!517379 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33110 (_ BitVec 32)) SeekEntryResult!4384)

(assert (=> b!517379 (= e!301893 (seekKeyOrZeroReturnVacant!0 (x!48698 lt!236721) (index!19726 lt!236721) (index!19726 lt!236721) k0!2280 a!3235 mask!3524))))

(declare-fun b!517380 () Bool)

(declare-fun e!301892 () SeekEntryResult!4384)

(assert (=> b!517380 (= e!301892 Undefined!4384)))

(declare-fun b!517381 () Bool)

(declare-fun e!301891 () SeekEntryResult!4384)

(assert (=> b!517381 (= e!301891 (Found!4384 (index!19726 lt!236721)))))

(declare-fun b!517382 () Bool)

(assert (=> b!517382 (= e!301893 (MissingZero!4384 (index!19726 lt!236721)))))

(declare-fun b!517383 () Bool)

(declare-fun c!60632 () Bool)

(declare-fun lt!236720 () (_ BitVec 64))

(assert (=> b!517383 (= c!60632 (= lt!236720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517383 (= e!301891 e!301893)))

(declare-fun b!517384 () Bool)

(assert (=> b!517384 (= e!301892 e!301891)))

(assert (=> b!517384 (= lt!236720 (select (arr!15920 a!3235) (index!19726 lt!236721)))))

(declare-fun c!60633 () Bool)

(assert (=> b!517384 (= c!60633 (= lt!236720 k0!2280))))

(declare-fun d!79559 () Bool)

(declare-fun lt!236722 () SeekEntryResult!4384)

(assert (=> d!79559 (and (or ((_ is Undefined!4384) lt!236722) (not ((_ is Found!4384) lt!236722)) (and (bvsge (index!19725 lt!236722) #b00000000000000000000000000000000) (bvslt (index!19725 lt!236722) (size!16285 a!3235)))) (or ((_ is Undefined!4384) lt!236722) ((_ is Found!4384) lt!236722) (not ((_ is MissingZero!4384) lt!236722)) (and (bvsge (index!19724 lt!236722) #b00000000000000000000000000000000) (bvslt (index!19724 lt!236722) (size!16285 a!3235)))) (or ((_ is Undefined!4384) lt!236722) ((_ is Found!4384) lt!236722) ((_ is MissingZero!4384) lt!236722) (not ((_ is MissingVacant!4384) lt!236722)) (and (bvsge (index!19727 lt!236722) #b00000000000000000000000000000000) (bvslt (index!19727 lt!236722) (size!16285 a!3235)))) (or ((_ is Undefined!4384) lt!236722) (ite ((_ is Found!4384) lt!236722) (= (select (arr!15920 a!3235) (index!19725 lt!236722)) k0!2280) (ite ((_ is MissingZero!4384) lt!236722) (= (select (arr!15920 a!3235) (index!19724 lt!236722)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4384) lt!236722) (= (select (arr!15920 a!3235) (index!19727 lt!236722)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79559 (= lt!236722 e!301892)))

(declare-fun c!60631 () Bool)

(assert (=> d!79559 (= c!60631 (and ((_ is Intermediate!4384) lt!236721) (undefined!5196 lt!236721)))))

(assert (=> d!79559 (= lt!236721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79559 (validMask!0 mask!3524)))

(assert (=> d!79559 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236722)))

(assert (= (and d!79559 c!60631) b!517380))

(assert (= (and d!79559 (not c!60631)) b!517384))

(assert (= (and b!517384 c!60633) b!517381))

(assert (= (and b!517384 (not c!60633)) b!517383))

(assert (= (and b!517383 c!60632) b!517382))

(assert (= (and b!517383 (not c!60632)) b!517379))

(declare-fun m!498309 () Bool)

(assert (=> b!517379 m!498309))

(declare-fun m!498311 () Bool)

(assert (=> b!517384 m!498311))

(declare-fun m!498313 () Bool)

(assert (=> d!79559 m!498313))

(assert (=> d!79559 m!498215))

(declare-fun m!498315 () Bool)

(assert (=> d!79559 m!498315))

(assert (=> d!79559 m!498313))

(declare-fun m!498317 () Bool)

(assert (=> d!79559 m!498317))

(declare-fun m!498319 () Bool)

(assert (=> d!79559 m!498319))

(declare-fun m!498321 () Bool)

(assert (=> d!79559 m!498321))

(assert (=> b!517278 d!79559))

(declare-fun d!79561 () Bool)

(declare-fun res!316705 () Bool)

(declare-fun e!301898 () Bool)

(assert (=> d!79561 (=> res!316705 e!301898)))

(assert (=> d!79561 (= res!316705 (= (select (arr!15920 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79561 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301898)))

(declare-fun b!517389 () Bool)

(declare-fun e!301899 () Bool)

(assert (=> b!517389 (= e!301898 e!301899)))

(declare-fun res!316706 () Bool)

(assert (=> b!517389 (=> (not res!316706) (not e!301899))))

(assert (=> b!517389 (= res!316706 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16285 a!3235)))))

(declare-fun b!517390 () Bool)

(assert (=> b!517390 (= e!301899 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79561 (not res!316705)) b!517389))

(assert (= (and b!517389 res!316706) b!517390))

(assert (=> d!79561 m!498301))

(declare-fun m!498323 () Bool)

(assert (=> b!517390 m!498323))

(assert (=> b!517284 d!79561))

(declare-fun b!517399 () Bool)

(declare-fun e!301908 () Bool)

(declare-fun e!301906 () Bool)

(assert (=> b!517399 (= e!301908 e!301906)))

(declare-fun c!60636 () Bool)

(assert (=> b!517399 (= c!60636 (validKeyInArray!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517400 () Bool)

(declare-fun call!31663 () Bool)

(assert (=> b!517400 (= e!301906 call!31663)))

(declare-fun b!517401 () Bool)

(declare-fun e!301907 () Bool)

(assert (=> b!517401 (= e!301907 call!31663)))

(declare-fun b!517402 () Bool)

(assert (=> b!517402 (= e!301906 e!301907)))

(declare-fun lt!236729 () (_ BitVec 64))

(assert (=> b!517402 (= lt!236729 (select (arr!15920 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236730 () Unit!16012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33110 (_ BitVec 64) (_ BitVec 32)) Unit!16012)

(assert (=> b!517402 (= lt!236730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236729 #b00000000000000000000000000000000))))

(assert (=> b!517402 (arrayContainsKey!0 a!3235 lt!236729 #b00000000000000000000000000000000)))

(declare-fun lt!236731 () Unit!16012)

(assert (=> b!517402 (= lt!236731 lt!236730)))

(declare-fun res!316711 () Bool)

(assert (=> b!517402 (= res!316711 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4384 #b00000000000000000000000000000000)))))

(assert (=> b!517402 (=> (not res!316711) (not e!301907))))

(declare-fun d!79563 () Bool)

(declare-fun res!316712 () Bool)

(assert (=> d!79563 (=> res!316712 e!301908)))

(assert (=> d!79563 (= res!316712 (bvsge #b00000000000000000000000000000000 (size!16285 a!3235)))))

(assert (=> d!79563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301908)))

(declare-fun bm!31660 () Bool)

(assert (=> bm!31660 (= call!31663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79563 (not res!316712)) b!517399))

(assert (= (and b!517399 c!60636) b!517402))

(assert (= (and b!517399 (not c!60636)) b!517400))

(assert (= (and b!517402 res!316711) b!517401))

(assert (= (or b!517401 b!517400) bm!31660))

(assert (=> b!517399 m!498301))

(assert (=> b!517399 m!498301))

(assert (=> b!517399 m!498303))

(assert (=> b!517402 m!498301))

(declare-fun m!498325 () Bool)

(assert (=> b!517402 m!498325))

(declare-fun m!498327 () Bool)

(assert (=> b!517402 m!498327))

(assert (=> b!517402 m!498301))

(declare-fun m!498329 () Bool)

(assert (=> b!517402 m!498329))

(declare-fun m!498331 () Bool)

(assert (=> bm!31660 m!498331))

(assert (=> b!517279 d!79563))

(declare-fun e!301911 () SeekEntryResult!4384)

(declare-fun b!517403 () Bool)

(declare-fun lt!236733 () SeekEntryResult!4384)

(assert (=> b!517403 (= e!301911 (seekKeyOrZeroReturnVacant!0 (x!48698 lt!236733) (index!19726 lt!236733) (index!19726 lt!236733) (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517404 () Bool)

(declare-fun e!301910 () SeekEntryResult!4384)

(assert (=> b!517404 (= e!301910 Undefined!4384)))

(declare-fun b!517405 () Bool)

(declare-fun e!301909 () SeekEntryResult!4384)

(assert (=> b!517405 (= e!301909 (Found!4384 (index!19726 lt!236733)))))

(declare-fun b!517406 () Bool)

(assert (=> b!517406 (= e!301911 (MissingZero!4384 (index!19726 lt!236733)))))

(declare-fun b!517407 () Bool)

(declare-fun c!60638 () Bool)

(declare-fun lt!236732 () (_ BitVec 64))

(assert (=> b!517407 (= c!60638 (= lt!236732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517407 (= e!301909 e!301911)))

(declare-fun b!517408 () Bool)

(assert (=> b!517408 (= e!301910 e!301909)))

(assert (=> b!517408 (= lt!236732 (select (arr!15920 a!3235) (index!19726 lt!236733)))))

(declare-fun c!60639 () Bool)

(assert (=> b!517408 (= c!60639 (= lt!236732 (select (arr!15920 a!3235) j!176)))))

(declare-fun d!79567 () Bool)

(declare-fun lt!236734 () SeekEntryResult!4384)

(assert (=> d!79567 (and (or ((_ is Undefined!4384) lt!236734) (not ((_ is Found!4384) lt!236734)) (and (bvsge (index!19725 lt!236734) #b00000000000000000000000000000000) (bvslt (index!19725 lt!236734) (size!16285 a!3235)))) (or ((_ is Undefined!4384) lt!236734) ((_ is Found!4384) lt!236734) (not ((_ is MissingZero!4384) lt!236734)) (and (bvsge (index!19724 lt!236734) #b00000000000000000000000000000000) (bvslt (index!19724 lt!236734) (size!16285 a!3235)))) (or ((_ is Undefined!4384) lt!236734) ((_ is Found!4384) lt!236734) ((_ is MissingZero!4384) lt!236734) (not ((_ is MissingVacant!4384) lt!236734)) (and (bvsge (index!19727 lt!236734) #b00000000000000000000000000000000) (bvslt (index!19727 lt!236734) (size!16285 a!3235)))) (or ((_ is Undefined!4384) lt!236734) (ite ((_ is Found!4384) lt!236734) (= (select (arr!15920 a!3235) (index!19725 lt!236734)) (select (arr!15920 a!3235) j!176)) (ite ((_ is MissingZero!4384) lt!236734) (= (select (arr!15920 a!3235) (index!19724 lt!236734)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4384) lt!236734) (= (select (arr!15920 a!3235) (index!19727 lt!236734)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79567 (= lt!236734 e!301910)))

(declare-fun c!60637 () Bool)

(assert (=> d!79567 (= c!60637 (and ((_ is Intermediate!4384) lt!236733) (undefined!5196 lt!236733)))))

(assert (=> d!79567 (= lt!236733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15920 a!3235) j!176) mask!3524) (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79567 (validMask!0 mask!3524)))

(assert (=> d!79567 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) lt!236734)))

(assert (= (and d!79567 c!60637) b!517404))

(assert (= (and d!79567 (not c!60637)) b!517408))

(assert (= (and b!517408 c!60639) b!517405))

(assert (= (and b!517408 (not c!60639)) b!517407))

(assert (= (and b!517407 c!60638) b!517406))

(assert (= (and b!517407 (not c!60638)) b!517403))

(assert (=> b!517403 m!498189))

(declare-fun m!498333 () Bool)

(assert (=> b!517403 m!498333))

(declare-fun m!498335 () Bool)

(assert (=> b!517408 m!498335))

(assert (=> d!79567 m!498189))

(assert (=> d!79567 m!498209))

(assert (=> d!79567 m!498215))

(declare-fun m!498337 () Bool)

(assert (=> d!79567 m!498337))

(assert (=> d!79567 m!498209))

(assert (=> d!79567 m!498189))

(declare-fun m!498339 () Bool)

(assert (=> d!79567 m!498339))

(declare-fun m!498341 () Bool)

(assert (=> d!79567 m!498341))

(declare-fun m!498343 () Bool)

(assert (=> d!79567 m!498343))

(assert (=> b!517285 d!79567))

(declare-fun d!79569 () Bool)

(assert (=> d!79569 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46902 d!79569))

(declare-fun d!79573 () Bool)

(assert (=> d!79573 (= (array_inv!11803 a!3235) (bvsge (size!16285 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46902 d!79573))

(declare-fun d!79575 () Bool)

(assert (=> d!79575 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517275 d!79575))

(declare-fun d!79577 () Bool)

(assert (=> d!79577 (= (validKeyInArray!0 (select (arr!15920 a!3235) j!176)) (and (not (= (select (arr!15920 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15920 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517276 d!79577))

(declare-fun b!517409 () Bool)

(declare-fun e!301914 () Bool)

(declare-fun e!301912 () Bool)

(assert (=> b!517409 (= e!301914 e!301912)))

(declare-fun c!60640 () Bool)

(assert (=> b!517409 (= c!60640 (validKeyInArray!0 (select (arr!15920 a!3235) j!176)))))

(declare-fun b!517410 () Bool)

(declare-fun call!31664 () Bool)

(assert (=> b!517410 (= e!301912 call!31664)))

(declare-fun b!517411 () Bool)

(declare-fun e!301913 () Bool)

(assert (=> b!517411 (= e!301913 call!31664)))

(declare-fun b!517412 () Bool)

(assert (=> b!517412 (= e!301912 e!301913)))

(declare-fun lt!236735 () (_ BitVec 64))

(assert (=> b!517412 (= lt!236735 (select (arr!15920 a!3235) j!176))))

(declare-fun lt!236736 () Unit!16012)

(assert (=> b!517412 (= lt!236736 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236735 j!176))))

(assert (=> b!517412 (arrayContainsKey!0 a!3235 lt!236735 #b00000000000000000000000000000000)))

(declare-fun lt!236737 () Unit!16012)

(assert (=> b!517412 (= lt!236737 lt!236736)))

(declare-fun res!316713 () Bool)

(assert (=> b!517412 (= res!316713 (= (seekEntryOrOpen!0 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) (Found!4384 j!176)))))

(assert (=> b!517412 (=> (not res!316713) (not e!301913))))

(declare-fun d!79579 () Bool)

(declare-fun res!316714 () Bool)

(assert (=> d!79579 (=> res!316714 e!301914)))

(assert (=> d!79579 (= res!316714 (bvsge j!176 (size!16285 a!3235)))))

(assert (=> d!79579 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301914)))

(declare-fun bm!31661 () Bool)

(assert (=> bm!31661 (= call!31664 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79579 (not res!316714)) b!517409))

(assert (= (and b!517409 c!60640) b!517412))

(assert (= (and b!517409 (not c!60640)) b!517410))

(assert (= (and b!517412 res!316713) b!517411))

(assert (= (or b!517411 b!517410) bm!31661))

(assert (=> b!517409 m!498189))

(assert (=> b!517409 m!498189))

(assert (=> b!517409 m!498219))

(assert (=> b!517412 m!498189))

(declare-fun m!498345 () Bool)

(assert (=> b!517412 m!498345))

(declare-fun m!498347 () Bool)

(assert (=> b!517412 m!498347))

(assert (=> b!517412 m!498189))

(assert (=> b!517412 m!498197))

(declare-fun m!498349 () Bool)

(assert (=> bm!31661 m!498349))

(assert (=> b!517281 d!79579))

(declare-fun b!517479 () Bool)

(declare-fun lt!236779 () SeekEntryResult!4384)

(assert (=> b!517479 (and (bvsge (index!19726 lt!236779) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236779) (size!16285 a!3235)))))

(declare-fun res!316725 () Bool)

(assert (=> b!517479 (= res!316725 (= (select (arr!15920 a!3235) (index!19726 lt!236779)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301953 () Bool)

(assert (=> b!517479 (=> res!316725 e!301953)))

(declare-fun b!517480 () Bool)

(assert (=> b!517480 (and (bvsge (index!19726 lt!236779) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236779) (size!16285 a!3235)))))

(assert (=> b!517480 (= e!301953 (= (select (arr!15920 a!3235) (index!19726 lt!236779)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517481 () Bool)

(declare-fun e!301952 () SeekEntryResult!4384)

(declare-fun e!301949 () SeekEntryResult!4384)

(assert (=> b!517481 (= e!301952 e!301949)))

(declare-fun c!60672 () Bool)

(declare-fun lt!236778 () (_ BitVec 64))

(assert (=> b!517481 (= c!60672 (or (= lt!236778 (select (arr!15920 a!3235) j!176)) (= (bvadd lt!236778 lt!236778) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517482 () Bool)

(assert (=> b!517482 (= e!301952 (Intermediate!4384 true lt!236682 #b00000000000000000000000000000000))))

(declare-fun d!79581 () Bool)

(declare-fun e!301950 () Bool)

(assert (=> d!79581 e!301950))

(declare-fun c!60673 () Bool)

(assert (=> d!79581 (= c!60673 (and ((_ is Intermediate!4384) lt!236779) (undefined!5196 lt!236779)))))

(assert (=> d!79581 (= lt!236779 e!301952)))

(declare-fun c!60671 () Bool)

(assert (=> d!79581 (= c!60671 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79581 (= lt!236778 (select (arr!15920 a!3235) lt!236682))))

(assert (=> d!79581 (validMask!0 mask!3524)))

(assert (=> d!79581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236682 (select (arr!15920 a!3235) j!176) a!3235 mask!3524) lt!236779)))

(declare-fun b!517483 () Bool)

(assert (=> b!517483 (= e!301949 (Intermediate!4384 false lt!236682 #b00000000000000000000000000000000))))

(declare-fun b!517484 () Bool)

(assert (=> b!517484 (and (bvsge (index!19726 lt!236779) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236779) (size!16285 a!3235)))))

(declare-fun res!316724 () Bool)

(assert (=> b!517484 (= res!316724 (= (select (arr!15920 a!3235) (index!19726 lt!236779)) (select (arr!15920 a!3235) j!176)))))

(assert (=> b!517484 (=> res!316724 e!301953)))

(declare-fun e!301951 () Bool)

(assert (=> b!517484 (= e!301951 e!301953)))

(declare-fun b!517485 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517485 (= e!301949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236682 #b00000000000000000000000000000000 mask!3524) (select (arr!15920 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517486 () Bool)

(assert (=> b!517486 (= e!301950 (bvsge (x!48698 lt!236779) #b01111111111111111111111111111110))))

(declare-fun b!517487 () Bool)

(assert (=> b!517487 (= e!301950 e!301951)))

(declare-fun res!316723 () Bool)

(assert (=> b!517487 (= res!316723 (and ((_ is Intermediate!4384) lt!236779) (not (undefined!5196 lt!236779)) (bvslt (x!48698 lt!236779) #b01111111111111111111111111111110) (bvsge (x!48698 lt!236779) #b00000000000000000000000000000000) (bvsge (x!48698 lt!236779) #b00000000000000000000000000000000)))))

(assert (=> b!517487 (=> (not res!316723) (not e!301951))))

(assert (= (and d!79581 c!60671) b!517482))

(assert (= (and d!79581 (not c!60671)) b!517481))

(assert (= (and b!517481 c!60672) b!517483))

(assert (= (and b!517481 (not c!60672)) b!517485))

(assert (= (and d!79581 c!60673) b!517486))

(assert (= (and d!79581 (not c!60673)) b!517487))

(assert (= (and b!517487 res!316723) b!517484))

(assert (= (and b!517484 (not res!316724)) b!517479))

(assert (= (and b!517479 (not res!316725)) b!517480))

(declare-fun m!498403 () Bool)

(assert (=> b!517480 m!498403))

(declare-fun m!498405 () Bool)

(assert (=> d!79581 m!498405))

(assert (=> d!79581 m!498215))

(assert (=> b!517479 m!498403))

(assert (=> b!517484 m!498403))

(declare-fun m!498407 () Bool)

(assert (=> b!517485 m!498407))

(assert (=> b!517485 m!498407))

(assert (=> b!517485 m!498189))

(declare-fun m!498409 () Bool)

(assert (=> b!517485 m!498409))

(assert (=> b!517281 d!79581))

(declare-fun d!79597 () Bool)

(assert (=> d!79597 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236782 () Unit!16012)

(declare-fun choose!38 (array!33110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16012)

(assert (=> d!79597 (= lt!236782 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79597 (validMask!0 mask!3524)))

(assert (=> d!79597 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236782)))

(declare-fun bs!16312 () Bool)

(assert (= bs!16312 d!79597))

(assert (=> bs!16312 m!498211))

(declare-fun m!498411 () Bool)

(assert (=> bs!16312 m!498411))

(assert (=> bs!16312 m!498215))

(assert (=> b!517281 d!79597))

(declare-fun d!79599 () Bool)

(declare-fun lt!236801 () (_ BitVec 32))

(declare-fun lt!236800 () (_ BitVec 32))

(assert (=> d!79599 (= lt!236801 (bvmul (bvxor lt!236800 (bvlshr lt!236800 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79599 (= lt!236800 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79599 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316730 (let ((h!11022 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48705 (bvmul (bvxor h!11022 (bvlshr h!11022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48705 (bvlshr x!48705 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316730 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316730 #b00000000000000000000000000000000))))))

(assert (=> d!79599 (= (toIndex!0 (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236801 (bvlshr lt!236801 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517281 d!79599))

(declare-fun d!79603 () Bool)

(declare-fun lt!236803 () (_ BitVec 32))

(declare-fun lt!236802 () (_ BitVec 32))

(assert (=> d!79603 (= lt!236803 (bvmul (bvxor lt!236802 (bvlshr lt!236802 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79603 (= lt!236802 ((_ extract 31 0) (bvand (bvxor (select (arr!15920 a!3235) j!176) (bvlshr (select (arr!15920 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79603 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316730 (let ((h!11022 ((_ extract 31 0) (bvand (bvxor (select (arr!15920 a!3235) j!176) (bvlshr (select (arr!15920 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48705 (bvmul (bvxor h!11022 (bvlshr h!11022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48705 (bvlshr x!48705 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316730 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316730 #b00000000000000000000000000000000))))))

(assert (=> d!79603 (= (toIndex!0 (select (arr!15920 a!3235) j!176) mask!3524) (bvand (bvxor lt!236803 (bvlshr lt!236803 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517281 d!79603))

(declare-fun b!517518 () Bool)

(declare-fun lt!236805 () SeekEntryResult!4384)

(assert (=> b!517518 (and (bvsge (index!19726 lt!236805) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236805) (size!16285 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235)))))))

(declare-fun res!316741 () Bool)

(assert (=> b!517518 (= res!316741 (= (select (arr!15920 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235))) (index!19726 lt!236805)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301977 () Bool)

(assert (=> b!517518 (=> res!316741 e!301977)))

(declare-fun b!517519 () Bool)

(assert (=> b!517519 (and (bvsge (index!19726 lt!236805) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236805) (size!16285 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235)))))))

(assert (=> b!517519 (= e!301977 (= (select (arr!15920 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235))) (index!19726 lt!236805)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517520 () Bool)

(declare-fun e!301976 () SeekEntryResult!4384)

(declare-fun e!301973 () SeekEntryResult!4384)

(assert (=> b!517520 (= e!301976 e!301973)))

(declare-fun lt!236804 () (_ BitVec 64))

(declare-fun c!60684 () Bool)

(assert (=> b!517520 (= c!60684 (or (= lt!236804 (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236804 lt!236804) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517521 () Bool)

(assert (=> b!517521 (= e!301976 (Intermediate!4384 true lt!236680 #b00000000000000000000000000000000))))

(declare-fun d!79605 () Bool)

(declare-fun e!301974 () Bool)

(assert (=> d!79605 e!301974))

(declare-fun c!60685 () Bool)

(assert (=> d!79605 (= c!60685 (and ((_ is Intermediate!4384) lt!236805) (undefined!5196 lt!236805)))))

(assert (=> d!79605 (= lt!236805 e!301976)))

(declare-fun c!60683 () Bool)

(assert (=> d!79605 (= c!60683 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79605 (= lt!236804 (select (arr!15920 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235))) lt!236680))))

(assert (=> d!79605 (validMask!0 mask!3524)))

(assert (=> d!79605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236680 (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235)) mask!3524) lt!236805)))

(declare-fun b!517522 () Bool)

(assert (=> b!517522 (= e!301973 (Intermediate!4384 false lt!236680 #b00000000000000000000000000000000))))

(declare-fun b!517523 () Bool)

(assert (=> b!517523 (and (bvsge (index!19726 lt!236805) #b00000000000000000000000000000000) (bvslt (index!19726 lt!236805) (size!16285 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235)))))))

(declare-fun res!316740 () Bool)

(assert (=> b!517523 (= res!316740 (= (select (arr!15920 (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235))) (index!19726 lt!236805)) (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!517523 (=> res!316740 e!301977)))

(declare-fun e!301975 () Bool)

(assert (=> b!517523 (= e!301975 e!301977)))

(declare-fun b!517524 () Bool)

(assert (=> b!517524 (= e!301973 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236680 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15920 a!3235) i!1204 k0!2280) j!176) (array!33111 (store (arr!15920 a!3235) i!1204 k0!2280) (size!16285 a!3235)) mask!3524))))

(declare-fun b!517525 () Bool)

(assert (=> b!517525 (= e!301974 (bvsge (x!48698 lt!236805) #b01111111111111111111111111111110))))

(declare-fun b!517526 () Bool)

(assert (=> b!517526 (= e!301974 e!301975)))

(declare-fun res!316739 () Bool)

(assert (=> b!517526 (= res!316739 (and ((_ is Intermediate!4384) lt!236805) (not (undefined!5196 lt!236805)) (bvslt (x!48698 lt!236805) #b01111111111111111111111111111110) (bvsge (x!48698 lt!236805) #b00000000000000000000000000000000) (bvsge (x!48698 lt!236805) #b00000000000000000000000000000000)))))

(assert (=> b!517526 (=> (not res!316739) (not e!301975))))

(assert (= (and d!79605 c!60683) b!517521))

(assert (= (and d!79605 (not c!60683)) b!517520))

(assert (= (and b!517520 c!60684) b!517522))

(assert (= (and b!517520 (not c!60684)) b!517524))

(assert (= (and d!79605 c!60685) b!517525))

(assert (= (and d!79605 (not c!60685)) b!517526))

(assert (= (and b!517526 res!316739) b!517523))

(assert (= (and b!517523 (not res!316740)) b!517518))

(assert (= (and b!517518 (not res!316741)) b!517519))

(declare-fun m!498419 () Bool)

(assert (=> b!517519 m!498419))

(declare-fun m!498421 () Bool)

(assert (=> d!79605 m!498421))

(assert (=> d!79605 m!498215))

(assert (=> b!517518 m!498419))

(assert (=> b!517523 m!498419))

(declare-fun m!498423 () Bool)

(assert (=> b!517524 m!498423))

(assert (=> b!517524 m!498423))

(assert (=> b!517524 m!498205))

(declare-fun m!498425 () Bool)

(assert (=> b!517524 m!498425))

(assert (=> b!517281 d!79605))

(check-sat (not b!517409) (not d!79559) (not b!517399) (not b!517362) (not d!79567) (not bm!31661) (not b!517485) (not b!517363) (not b!517379) (not d!79581) (not b!517402) (not b!517390) (not b!517412) (not b!517366) (not b!517524) (not bm!31660) (not bm!31657) (not d!79597) (not b!517403) (not d!79605))
(check-sat)
