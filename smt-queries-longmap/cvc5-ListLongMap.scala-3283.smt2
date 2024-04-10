; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45642 () Bool)

(assert start!45642)

(declare-fun b!503299 () Bool)

(declare-fun e!294754 () Bool)

(declare-fun e!294749 () Bool)

(assert (=> b!503299 (= e!294754 (not e!294749))))

(declare-fun res!304623 () Bool)

(assert (=> b!503299 (=> res!304623 e!294749)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4046 0))(
  ( (MissingZero!4046 (index!18372 (_ BitVec 32))) (Found!4046 (index!18373 (_ BitVec 32))) (Intermediate!4046 (undefined!4858 Bool) (index!18374 (_ BitVec 32)) (x!47399 (_ BitVec 32))) (Undefined!4046) (MissingVacant!4046 (index!18375 (_ BitVec 32))) )
))
(declare-fun lt!228938 () SeekEntryResult!4046)

(declare-fun lt!228943 () (_ BitVec 64))

(declare-fun lt!228939 () (_ BitVec 32))

(declare-datatypes ((array!32398 0))(
  ( (array!32399 (arr!15579 (Array (_ BitVec 32) (_ BitVec 64))) (size!15943 (_ BitVec 32))) )
))
(declare-fun lt!228933 () array!32398)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32398 (_ BitVec 32)) SeekEntryResult!4046)

(assert (=> b!503299 (= res!304623 (= lt!228938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228939 lt!228943 lt!228933 mask!3524)))))

(declare-fun lt!228942 () (_ BitVec 32))

(declare-fun a!3235 () array!32398)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503299 (= lt!228938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228942 (select (arr!15579 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503299 (= lt!228939 (toIndex!0 lt!228943 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503299 (= lt!228943 (select (store (arr!15579 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503299 (= lt!228942 (toIndex!0 (select (arr!15579 a!3235) j!176) mask!3524))))

(assert (=> b!503299 (= lt!228933 (array!32399 (store (arr!15579 a!3235) i!1204 k!2280) (size!15943 a!3235)))))

(declare-fun e!294755 () Bool)

(assert (=> b!503299 e!294755))

(declare-fun res!304627 () Bool)

(assert (=> b!503299 (=> (not res!304627) (not e!294755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32398 (_ BitVec 32)) Bool)

(assert (=> b!503299 (= res!304627 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15260 0))(
  ( (Unit!15261) )
))
(declare-fun lt!228935 () Unit!15260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15260)

(assert (=> b!503299 (= lt!228935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!304614 () Bool)

(declare-fun e!294750 () Bool)

(assert (=> start!45642 (=> (not res!304614) (not e!294750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45642 (= res!304614 (validMask!0 mask!3524))))

(assert (=> start!45642 e!294750))

(assert (=> start!45642 true))

(declare-fun array_inv!11375 (array!32398) Bool)

(assert (=> start!45642 (array_inv!11375 a!3235)))

(declare-fun b!503300 () Bool)

(declare-fun e!294751 () Bool)

(assert (=> b!503300 (= e!294751 false)))

(declare-fun b!503301 () Bool)

(declare-fun res!304624 () Bool)

(assert (=> b!503301 (=> (not res!304624) (not e!294754))))

(assert (=> b!503301 (= res!304624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503302 () Bool)

(declare-fun res!304621 () Bool)

(assert (=> b!503302 (=> (not res!304621) (not e!294750))))

(assert (=> b!503302 (= res!304621 (and (= (size!15943 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15943 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15943 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503303 () Bool)

(declare-fun e!294753 () Unit!15260)

(declare-fun Unit!15262 () Unit!15260)

(assert (=> b!503303 (= e!294753 Unit!15262)))

(declare-fun lt!228936 () Unit!15260)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32398 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15260)

(assert (=> b!503303 (= lt!228936 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228942 #b00000000000000000000000000000000 (index!18374 lt!228938) (x!47399 lt!228938) mask!3524))))

(declare-fun res!304628 () Bool)

(assert (=> b!503303 (= res!304628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228942 lt!228943 lt!228933 mask!3524) (Intermediate!4046 false (index!18374 lt!228938) (x!47399 lt!228938))))))

(assert (=> b!503303 (=> (not res!304628) (not e!294751))))

(assert (=> b!503303 e!294751))

(declare-fun b!503304 () Bool)

(declare-fun e!294752 () Bool)

(assert (=> b!503304 (= e!294752 true)))

(declare-fun lt!228934 () SeekEntryResult!4046)

(assert (=> b!503304 (= lt!228934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228942 lt!228943 lt!228933 mask!3524))))

(declare-fun b!503305 () Bool)

(declare-fun res!304617 () Bool)

(assert (=> b!503305 (=> (not res!304617) (not e!294750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503305 (= res!304617 (validKeyInArray!0 k!2280))))

(declare-fun b!503306 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32398 (_ BitVec 32)) SeekEntryResult!4046)

(assert (=> b!503306 (= e!294755 (= (seekEntryOrOpen!0 (select (arr!15579 a!3235) j!176) a!3235 mask!3524) (Found!4046 j!176)))))

(declare-fun b!503307 () Bool)

(assert (=> b!503307 (= e!294750 e!294754)))

(declare-fun res!304616 () Bool)

(assert (=> b!503307 (=> (not res!304616) (not e!294754))))

(declare-fun lt!228941 () SeekEntryResult!4046)

(assert (=> b!503307 (= res!304616 (or (= lt!228941 (MissingZero!4046 i!1204)) (= lt!228941 (MissingVacant!4046 i!1204))))))

(assert (=> b!503307 (= lt!228941 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503308 () Bool)

(declare-fun res!304626 () Bool)

(assert (=> b!503308 (=> res!304626 e!294749)))

(assert (=> b!503308 (= res!304626 (or (undefined!4858 lt!228938) (not (is-Intermediate!4046 lt!228938))))))

(declare-fun b!503309 () Bool)

(declare-fun res!304618 () Bool)

(assert (=> b!503309 (=> (not res!304618) (not e!294750))))

(assert (=> b!503309 (= res!304618 (validKeyInArray!0 (select (arr!15579 a!3235) j!176)))))

(declare-fun b!503310 () Bool)

(declare-fun e!294756 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32398 (_ BitVec 32)) SeekEntryResult!4046)

(assert (=> b!503310 (= e!294756 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228942 (index!18374 lt!228938) (select (arr!15579 a!3235) j!176) a!3235 mask!3524) (Found!4046 j!176))))))

(declare-fun b!503311 () Bool)

(assert (=> b!503311 (= e!294749 e!294752)))

(declare-fun res!304615 () Bool)

(assert (=> b!503311 (=> res!304615 e!294752)))

(assert (=> b!503311 (= res!304615 (or (bvsgt (x!47399 lt!228938) #b01111111111111111111111111111110) (bvslt lt!228942 #b00000000000000000000000000000000) (bvsge lt!228942 (size!15943 a!3235)) (bvslt (index!18374 lt!228938) #b00000000000000000000000000000000) (bvsge (index!18374 lt!228938) (size!15943 a!3235)) (not (= lt!228938 (Intermediate!4046 false (index!18374 lt!228938) (x!47399 lt!228938))))))))

(assert (=> b!503311 (= (index!18374 lt!228938) i!1204)))

(declare-fun lt!228940 () Unit!15260)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32398 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15260)

(assert (=> b!503311 (= lt!228940 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228942 #b00000000000000000000000000000000 (index!18374 lt!228938) (x!47399 lt!228938) mask!3524))))

(assert (=> b!503311 (and (or (= (select (arr!15579 a!3235) (index!18374 lt!228938)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15579 a!3235) (index!18374 lt!228938)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15579 a!3235) (index!18374 lt!228938)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15579 a!3235) (index!18374 lt!228938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228937 () Unit!15260)

(assert (=> b!503311 (= lt!228937 e!294753)))

(declare-fun c!59621 () Bool)

(assert (=> b!503311 (= c!59621 (= (select (arr!15579 a!3235) (index!18374 lt!228938)) (select (arr!15579 a!3235) j!176)))))

(assert (=> b!503311 (and (bvslt (x!47399 lt!228938) #b01111111111111111111111111111110) (or (= (select (arr!15579 a!3235) (index!18374 lt!228938)) (select (arr!15579 a!3235) j!176)) (= (select (arr!15579 a!3235) (index!18374 lt!228938)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15579 a!3235) (index!18374 lt!228938)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503312 () Bool)

(declare-fun res!304619 () Bool)

(assert (=> b!503312 (=> (not res!304619) (not e!294754))))

(declare-datatypes ((List!9737 0))(
  ( (Nil!9734) (Cons!9733 (h!10610 (_ BitVec 64)) (t!15965 List!9737)) )
))
(declare-fun arrayNoDuplicates!0 (array!32398 (_ BitVec 32) List!9737) Bool)

(assert (=> b!503312 (= res!304619 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9734))))

(declare-fun b!503313 () Bool)

(declare-fun res!304622 () Bool)

(assert (=> b!503313 (=> res!304622 e!294752)))

(assert (=> b!503313 (= res!304622 e!294756)))

(declare-fun res!304625 () Bool)

(assert (=> b!503313 (=> (not res!304625) (not e!294756))))

(assert (=> b!503313 (= res!304625 (bvsgt #b00000000000000000000000000000000 (x!47399 lt!228938)))))

(declare-fun b!503314 () Bool)

(declare-fun res!304620 () Bool)

(assert (=> b!503314 (=> (not res!304620) (not e!294750))))

(declare-fun arrayContainsKey!0 (array!32398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503314 (= res!304620 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503315 () Bool)

(declare-fun Unit!15263 () Unit!15260)

(assert (=> b!503315 (= e!294753 Unit!15263)))

(assert (= (and start!45642 res!304614) b!503302))

(assert (= (and b!503302 res!304621) b!503309))

(assert (= (and b!503309 res!304618) b!503305))

(assert (= (and b!503305 res!304617) b!503314))

(assert (= (and b!503314 res!304620) b!503307))

(assert (= (and b!503307 res!304616) b!503301))

(assert (= (and b!503301 res!304624) b!503312))

(assert (= (and b!503312 res!304619) b!503299))

(assert (= (and b!503299 res!304627) b!503306))

(assert (= (and b!503299 (not res!304623)) b!503308))

(assert (= (and b!503308 (not res!304626)) b!503311))

(assert (= (and b!503311 c!59621) b!503303))

(assert (= (and b!503311 (not c!59621)) b!503315))

(assert (= (and b!503303 res!304628) b!503300))

(assert (= (and b!503311 (not res!304615)) b!503313))

(assert (= (and b!503313 res!304625) b!503310))

(assert (= (and b!503313 (not res!304622)) b!503304))

(declare-fun m!484149 () Bool)

(assert (=> b!503305 m!484149))

(declare-fun m!484151 () Bool)

(assert (=> b!503304 m!484151))

(declare-fun m!484153 () Bool)

(assert (=> b!503312 m!484153))

(declare-fun m!484155 () Bool)

(assert (=> b!503309 m!484155))

(assert (=> b!503309 m!484155))

(declare-fun m!484157 () Bool)

(assert (=> b!503309 m!484157))

(declare-fun m!484159 () Bool)

(assert (=> b!503307 m!484159))

(declare-fun m!484161 () Bool)

(assert (=> b!503301 m!484161))

(declare-fun m!484163 () Bool)

(assert (=> b!503314 m!484163))

(assert (=> b!503310 m!484155))

(assert (=> b!503310 m!484155))

(declare-fun m!484165 () Bool)

(assert (=> b!503310 m!484165))

(declare-fun m!484167 () Bool)

(assert (=> start!45642 m!484167))

(declare-fun m!484169 () Bool)

(assert (=> start!45642 m!484169))

(declare-fun m!484171 () Bool)

(assert (=> b!503311 m!484171))

(declare-fun m!484173 () Bool)

(assert (=> b!503311 m!484173))

(assert (=> b!503311 m!484155))

(declare-fun m!484175 () Bool)

(assert (=> b!503303 m!484175))

(assert (=> b!503303 m!484151))

(assert (=> b!503299 m!484155))

(declare-fun m!484177 () Bool)

(assert (=> b!503299 m!484177))

(declare-fun m!484179 () Bool)

(assert (=> b!503299 m!484179))

(declare-fun m!484181 () Bool)

(assert (=> b!503299 m!484181))

(declare-fun m!484183 () Bool)

(assert (=> b!503299 m!484183))

(assert (=> b!503299 m!484155))

(declare-fun m!484185 () Bool)

(assert (=> b!503299 m!484185))

(assert (=> b!503299 m!484155))

(declare-fun m!484187 () Bool)

(assert (=> b!503299 m!484187))

(declare-fun m!484189 () Bool)

(assert (=> b!503299 m!484189))

(declare-fun m!484191 () Bool)

(assert (=> b!503299 m!484191))

(assert (=> b!503306 m!484155))

(assert (=> b!503306 m!484155))

(declare-fun m!484193 () Bool)

(assert (=> b!503306 m!484193))

(push 1)

