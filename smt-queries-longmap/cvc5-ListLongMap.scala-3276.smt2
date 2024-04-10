; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45600 () Bool)

(assert start!45600)

(declare-fun b!502228 () Bool)

(declare-fun res!303676 () Bool)

(declare-fun e!294187 () Bool)

(assert (=> b!502228 (=> (not res!303676) (not e!294187))))

(declare-datatypes ((array!32356 0))(
  ( (array!32357 (arr!15558 (Array (_ BitVec 32) (_ BitVec 64))) (size!15922 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32356)

(declare-datatypes ((List!9716 0))(
  ( (Nil!9713) (Cons!9712 (h!10589 (_ BitVec 64)) (t!15944 List!9716)) )
))
(declare-fun arrayNoDuplicates!0 (array!32356 (_ BitVec 32) List!9716) Bool)

(assert (=> b!502228 (= res!303676 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9713))))

(declare-fun b!502229 () Bool)

(declare-fun res!303674 () Bool)

(declare-fun e!294189 () Bool)

(assert (=> b!502229 (=> res!303674 e!294189)))

(declare-datatypes ((SeekEntryResult!4025 0))(
  ( (MissingZero!4025 (index!18288 (_ BitVec 32))) (Found!4025 (index!18289 (_ BitVec 32))) (Intermediate!4025 (undefined!4837 Bool) (index!18290 (_ BitVec 32)) (x!47322 (_ BitVec 32))) (Undefined!4025) (MissingVacant!4025 (index!18291 (_ BitVec 32))) )
))
(declare-fun lt!228248 () SeekEntryResult!4025)

(assert (=> b!502229 (= res!303674 (or (undefined!4837 lt!228248) (not (is-Intermediate!4025 lt!228248))))))

(declare-fun b!502231 () Bool)

(declare-datatypes ((Unit!15176 0))(
  ( (Unit!15177) )
))
(declare-fun e!294188 () Unit!15176)

(declare-fun Unit!15178 () Unit!15176)

(assert (=> b!502231 (= e!294188 Unit!15178)))

(declare-fun b!502232 () Bool)

(declare-fun res!303671 () Bool)

(declare-fun e!294184 () Bool)

(assert (=> b!502232 (=> (not res!303671) (not e!294184))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502232 (= res!303671 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502233 () Bool)

(declare-fun e!294186 () Bool)

(assert (=> b!502233 (= e!294186 false)))

(declare-fun b!502234 () Bool)

(declare-fun Unit!15179 () Unit!15176)

(assert (=> b!502234 (= e!294188 Unit!15179)))

(declare-fun lt!228242 () Unit!15176)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!228243 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32356 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15176)

(assert (=> b!502234 (= lt!228242 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228243 #b00000000000000000000000000000000 (index!18290 lt!228248) (x!47322 lt!228248) mask!3524))))

(declare-fun lt!228241 () array!32356)

(declare-fun res!303673 () Bool)

(declare-fun lt!228245 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32356 (_ BitVec 32)) SeekEntryResult!4025)

(assert (=> b!502234 (= res!303673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228243 lt!228245 lt!228241 mask!3524) (Intermediate!4025 false (index!18290 lt!228248) (x!47322 lt!228248))))))

(assert (=> b!502234 (=> (not res!303673) (not e!294186))))

(assert (=> b!502234 e!294186))

(declare-fun b!502235 () Bool)

(assert (=> b!502235 (= e!294187 (not e!294189))))

(declare-fun res!303681 () Bool)

(assert (=> b!502235 (=> res!303681 e!294189)))

(declare-fun lt!228249 () (_ BitVec 32))

(assert (=> b!502235 (= res!303681 (= lt!228248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228249 lt!228245 lt!228241 mask!3524)))))

(assert (=> b!502235 (= lt!228248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228243 (select (arr!15558 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502235 (= lt!228249 (toIndex!0 lt!228245 mask!3524))))

(assert (=> b!502235 (= lt!228245 (select (store (arr!15558 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502235 (= lt!228243 (toIndex!0 (select (arr!15558 a!3235) j!176) mask!3524))))

(assert (=> b!502235 (= lt!228241 (array!32357 (store (arr!15558 a!3235) i!1204 k!2280) (size!15922 a!3235)))))

(declare-fun e!294181 () Bool)

(assert (=> b!502235 e!294181))

(declare-fun res!303678 () Bool)

(assert (=> b!502235 (=> (not res!303678) (not e!294181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32356 (_ BitVec 32)) Bool)

(assert (=> b!502235 (= res!303678 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228247 () Unit!15176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15176)

(assert (=> b!502235 (= lt!228247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502236 () Bool)

(declare-fun res!303679 () Bool)

(assert (=> b!502236 (=> (not res!303679) (not e!294184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502236 (= res!303679 (validKeyInArray!0 (select (arr!15558 a!3235) j!176)))))

(declare-fun b!502237 () Bool)

(assert (=> b!502237 (= e!294184 e!294187)))

(declare-fun res!303675 () Bool)

(assert (=> b!502237 (=> (not res!303675) (not e!294187))))

(declare-fun lt!228244 () SeekEntryResult!4025)

(assert (=> b!502237 (= res!303675 (or (= lt!228244 (MissingZero!4025 i!1204)) (= lt!228244 (MissingVacant!4025 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32356 (_ BitVec 32)) SeekEntryResult!4025)

(assert (=> b!502237 (= lt!228244 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!294182 () Bool)

(declare-fun b!502238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32356 (_ BitVec 32)) SeekEntryResult!4025)

(assert (=> b!502238 (= e!294182 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228243 (index!18290 lt!228248) (select (arr!15558 a!3235) j!176) a!3235 mask!3524) (Found!4025 j!176))))))

(declare-fun b!502239 () Bool)

(declare-fun e!294183 () Bool)

(assert (=> b!502239 (= e!294183 true)))

(declare-fun lt!228250 () SeekEntryResult!4025)

(assert (=> b!502239 (= lt!228250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228243 lt!228245 lt!228241 mask!3524))))

(declare-fun b!502230 () Bool)

(declare-fun res!303682 () Bool)

(assert (=> b!502230 (=> (not res!303682) (not e!294187))))

(assert (=> b!502230 (= res!303682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!303670 () Bool)

(assert (=> start!45600 (=> (not res!303670) (not e!294184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45600 (= res!303670 (validMask!0 mask!3524))))

(assert (=> start!45600 e!294184))

(assert (=> start!45600 true))

(declare-fun array_inv!11354 (array!32356) Bool)

(assert (=> start!45600 (array_inv!11354 a!3235)))

(declare-fun b!502240 () Bool)

(declare-fun res!303677 () Bool)

(assert (=> b!502240 (=> (not res!303677) (not e!294184))))

(assert (=> b!502240 (= res!303677 (validKeyInArray!0 k!2280))))

(declare-fun b!502241 () Bool)

(assert (=> b!502241 (= e!294181 (= (seekEntryOrOpen!0 (select (arr!15558 a!3235) j!176) a!3235 mask!3524) (Found!4025 j!176)))))

(declare-fun b!502242 () Bool)

(assert (=> b!502242 (= e!294189 e!294183)))

(declare-fun res!303672 () Bool)

(assert (=> b!502242 (=> res!303672 e!294183)))

(assert (=> b!502242 (= res!303672 (or (bvsgt (x!47322 lt!228248) #b01111111111111111111111111111110) (bvslt lt!228243 #b00000000000000000000000000000000) (bvsge lt!228243 (size!15922 a!3235)) (bvslt (index!18290 lt!228248) #b00000000000000000000000000000000) (bvsge (index!18290 lt!228248) (size!15922 a!3235)) (not (= lt!228248 (Intermediate!4025 false (index!18290 lt!228248) (x!47322 lt!228248))))))))

(assert (=> b!502242 (= (index!18290 lt!228248) i!1204)))

(declare-fun lt!228246 () Unit!15176)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32356 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15176)

(assert (=> b!502242 (= lt!228246 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228243 #b00000000000000000000000000000000 (index!18290 lt!228248) (x!47322 lt!228248) mask!3524))))

(assert (=> b!502242 (and (or (= (select (arr!15558 a!3235) (index!18290 lt!228248)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15558 a!3235) (index!18290 lt!228248)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15558 a!3235) (index!18290 lt!228248)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15558 a!3235) (index!18290 lt!228248)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228240 () Unit!15176)

(assert (=> b!502242 (= lt!228240 e!294188)))

(declare-fun c!59558 () Bool)

(assert (=> b!502242 (= c!59558 (= (select (arr!15558 a!3235) (index!18290 lt!228248)) (select (arr!15558 a!3235) j!176)))))

(assert (=> b!502242 (and (bvslt (x!47322 lt!228248) #b01111111111111111111111111111110) (or (= (select (arr!15558 a!3235) (index!18290 lt!228248)) (select (arr!15558 a!3235) j!176)) (= (select (arr!15558 a!3235) (index!18290 lt!228248)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15558 a!3235) (index!18290 lt!228248)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502243 () Bool)

(declare-fun res!303669 () Bool)

(assert (=> b!502243 (=> (not res!303669) (not e!294184))))

(assert (=> b!502243 (= res!303669 (and (= (size!15922 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15922 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15922 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502244 () Bool)

(declare-fun res!303680 () Bool)

(assert (=> b!502244 (=> res!303680 e!294183)))

(assert (=> b!502244 (= res!303680 e!294182)))

(declare-fun res!303683 () Bool)

(assert (=> b!502244 (=> (not res!303683) (not e!294182))))

(assert (=> b!502244 (= res!303683 (bvsgt #b00000000000000000000000000000000 (x!47322 lt!228248)))))

(assert (= (and start!45600 res!303670) b!502243))

(assert (= (and b!502243 res!303669) b!502236))

(assert (= (and b!502236 res!303679) b!502240))

(assert (= (and b!502240 res!303677) b!502232))

(assert (= (and b!502232 res!303671) b!502237))

(assert (= (and b!502237 res!303675) b!502230))

(assert (= (and b!502230 res!303682) b!502228))

(assert (= (and b!502228 res!303676) b!502235))

(assert (= (and b!502235 res!303678) b!502241))

(assert (= (and b!502235 (not res!303681)) b!502229))

(assert (= (and b!502229 (not res!303674)) b!502242))

(assert (= (and b!502242 c!59558) b!502234))

(assert (= (and b!502242 (not c!59558)) b!502231))

(assert (= (and b!502234 res!303673) b!502233))

(assert (= (and b!502242 (not res!303672)) b!502244))

(assert (= (and b!502244 res!303683) b!502238))

(assert (= (and b!502244 (not res!303680)) b!502239))

(declare-fun m!483183 () Bool)

(assert (=> b!502240 m!483183))

(declare-fun m!483185 () Bool)

(assert (=> b!502238 m!483185))

(assert (=> b!502238 m!483185))

(declare-fun m!483187 () Bool)

(assert (=> b!502238 m!483187))

(declare-fun m!483189 () Bool)

(assert (=> b!502242 m!483189))

(declare-fun m!483191 () Bool)

(assert (=> b!502242 m!483191))

(assert (=> b!502242 m!483185))

(declare-fun m!483193 () Bool)

(assert (=> b!502234 m!483193))

(declare-fun m!483195 () Bool)

(assert (=> b!502234 m!483195))

(declare-fun m!483197 () Bool)

(assert (=> start!45600 m!483197))

(declare-fun m!483199 () Bool)

(assert (=> start!45600 m!483199))

(declare-fun m!483201 () Bool)

(assert (=> b!502237 m!483201))

(assert (=> b!502241 m!483185))

(assert (=> b!502241 m!483185))

(declare-fun m!483203 () Bool)

(assert (=> b!502241 m!483203))

(declare-fun m!483205 () Bool)

(assert (=> b!502235 m!483205))

(assert (=> b!502235 m!483185))

(declare-fun m!483207 () Bool)

(assert (=> b!502235 m!483207))

(declare-fun m!483209 () Bool)

(assert (=> b!502235 m!483209))

(assert (=> b!502235 m!483185))

(declare-fun m!483211 () Bool)

(assert (=> b!502235 m!483211))

(assert (=> b!502235 m!483185))

(declare-fun m!483213 () Bool)

(assert (=> b!502235 m!483213))

(declare-fun m!483215 () Bool)

(assert (=> b!502235 m!483215))

(declare-fun m!483217 () Bool)

(assert (=> b!502235 m!483217))

(declare-fun m!483219 () Bool)

(assert (=> b!502235 m!483219))

(declare-fun m!483221 () Bool)

(assert (=> b!502228 m!483221))

(assert (=> b!502239 m!483195))

(declare-fun m!483223 () Bool)

(assert (=> b!502232 m!483223))

(assert (=> b!502236 m!483185))

(assert (=> b!502236 m!483185))

(declare-fun m!483225 () Bool)

(assert (=> b!502236 m!483225))

(declare-fun m!483227 () Bool)

(assert (=> b!502230 m!483227))

(push 1)

