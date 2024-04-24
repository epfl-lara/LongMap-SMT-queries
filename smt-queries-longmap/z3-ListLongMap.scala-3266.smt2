; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45458 () Bool)

(assert start!45458)

(declare-fun b!500432 () Bool)

(declare-fun e!293195 () Bool)

(assert (=> b!500432 (= e!293195 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32284 0))(
  ( (array!32285 (arr!15523 (Array (_ BitVec 32) (_ BitVec 64))) (size!15887 (_ BitVec 32))) )
))
(declare-fun lt!227163 () array!32284)

(declare-fun lt!227170 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3946 0))(
  ( (MissingZero!3946 (index!17966 (_ BitVec 32))) (Found!3946 (index!17967 (_ BitVec 32))) (Intermediate!3946 (undefined!4758 Bool) (index!17968 (_ BitVec 32)) (x!47148 (_ BitVec 32))) (Undefined!3946) (MissingVacant!3946 (index!17969 (_ BitVec 32))) )
))
(declare-fun lt!227165 () SeekEntryResult!3946)

(declare-fun lt!227169 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32284 (_ BitVec 32)) SeekEntryResult!3946)

(assert (=> b!500432 (= lt!227165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227169 lt!227170 lt!227163 mask!3524))))

(declare-fun b!500433 () Bool)

(declare-fun res!302312 () Bool)

(declare-fun e!293198 () Bool)

(assert (=> b!500433 (=> (not res!302312) (not e!293198))))

(declare-fun a!3235 () array!32284)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500433 (= res!302312 (validKeyInArray!0 (select (arr!15523 a!3235) j!176)))))

(declare-fun b!500434 () Bool)

(declare-fun e!293196 () Bool)

(declare-fun e!293192 () Bool)

(assert (=> b!500434 (= e!293196 (not e!293192))))

(declare-fun res!302319 () Bool)

(assert (=> b!500434 (=> res!302319 e!293192)))

(declare-fun lt!227166 () (_ BitVec 32))

(declare-fun lt!227167 () SeekEntryResult!3946)

(assert (=> b!500434 (= res!302319 (= lt!227167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227166 lt!227170 lt!227163 mask!3524)))))

(assert (=> b!500434 (= lt!227167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227169 (select (arr!15523 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500434 (= lt!227166 (toIndex!0 lt!227170 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500434 (= lt!227170 (select (store (arr!15523 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500434 (= lt!227169 (toIndex!0 (select (arr!15523 a!3235) j!176) mask!3524))))

(assert (=> b!500434 (= lt!227163 (array!32285 (store (arr!15523 a!3235) i!1204 k0!2280) (size!15887 a!3235)))))

(declare-fun e!293193 () Bool)

(assert (=> b!500434 e!293193))

(declare-fun res!302314 () Bool)

(assert (=> b!500434 (=> (not res!302314) (not e!293193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32284 (_ BitVec 32)) Bool)

(assert (=> b!500434 (= res!302314 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15019 0))(
  ( (Unit!15020) )
))
(declare-fun lt!227168 () Unit!15019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15019)

(assert (=> b!500434 (= lt!227168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500435 () Bool)

(assert (=> b!500435 (= e!293192 e!293195)))

(declare-fun res!302317 () Bool)

(assert (=> b!500435 (=> res!302317 e!293195)))

(assert (=> b!500435 (= res!302317 (or (bvsgt #b00000000000000000000000000000000 (x!47148 lt!227167)) (bvsgt (x!47148 lt!227167) #b01111111111111111111111111111110) (bvslt lt!227169 #b00000000000000000000000000000000) (bvsge lt!227169 (size!15887 a!3235)) (bvslt (index!17968 lt!227167) #b00000000000000000000000000000000) (bvsge (index!17968 lt!227167) (size!15887 a!3235)) (not (= lt!227167 (Intermediate!3946 false (index!17968 lt!227167) (x!47148 lt!227167))))))))

(assert (=> b!500435 (and (or (= (select (arr!15523 a!3235) (index!17968 lt!227167)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15523 a!3235) (index!17968 lt!227167)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15523 a!3235) (index!17968 lt!227167)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15523 a!3235) (index!17968 lt!227167)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227164 () Unit!15019)

(declare-fun e!293197 () Unit!15019)

(assert (=> b!500435 (= lt!227164 e!293197)))

(declare-fun c!59339 () Bool)

(assert (=> b!500435 (= c!59339 (= (select (arr!15523 a!3235) (index!17968 lt!227167)) (select (arr!15523 a!3235) j!176)))))

(assert (=> b!500435 (and (bvslt (x!47148 lt!227167) #b01111111111111111111111111111110) (or (= (select (arr!15523 a!3235) (index!17968 lt!227167)) (select (arr!15523 a!3235) j!176)) (= (select (arr!15523 a!3235) (index!17968 lt!227167)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15523 a!3235) (index!17968 lt!227167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500437 () Bool)

(declare-fun Unit!15021 () Unit!15019)

(assert (=> b!500437 (= e!293197 Unit!15021)))

(declare-fun lt!227162 () Unit!15019)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32284 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15019)

(assert (=> b!500437 (= lt!227162 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227169 #b00000000000000000000000000000000 (index!17968 lt!227167) (x!47148 lt!227167) mask!3524))))

(declare-fun res!302311 () Bool)

(assert (=> b!500437 (= res!302311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227169 lt!227170 lt!227163 mask!3524) (Intermediate!3946 false (index!17968 lt!227167) (x!47148 lt!227167))))))

(declare-fun e!293194 () Bool)

(assert (=> b!500437 (=> (not res!302311) (not e!293194))))

(assert (=> b!500437 e!293194))

(declare-fun b!500438 () Bool)

(declare-fun res!302309 () Bool)

(assert (=> b!500438 (=> (not res!302309) (not e!293196))))

(assert (=> b!500438 (= res!302309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500439 () Bool)

(assert (=> b!500439 (= e!293198 e!293196)))

(declare-fun res!302313 () Bool)

(assert (=> b!500439 (=> (not res!302313) (not e!293196))))

(declare-fun lt!227161 () SeekEntryResult!3946)

(assert (=> b!500439 (= res!302313 (or (= lt!227161 (MissingZero!3946 i!1204)) (= lt!227161 (MissingVacant!3946 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32284 (_ BitVec 32)) SeekEntryResult!3946)

(assert (=> b!500439 (= lt!227161 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500440 () Bool)

(declare-fun Unit!15022 () Unit!15019)

(assert (=> b!500440 (= e!293197 Unit!15022)))

(declare-fun b!500441 () Bool)

(declare-fun res!302310 () Bool)

(assert (=> b!500441 (=> (not res!302310) (not e!293198))))

(declare-fun arrayContainsKey!0 (array!32284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500441 (= res!302310 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500442 () Bool)

(declare-fun res!302308 () Bool)

(assert (=> b!500442 (=> res!302308 e!293192)))

(get-info :version)

(assert (=> b!500442 (= res!302308 (or (undefined!4758 lt!227167) (not ((_ is Intermediate!3946) lt!227167))))))

(declare-fun b!500443 () Bool)

(declare-fun res!302316 () Bool)

(assert (=> b!500443 (=> (not res!302316) (not e!293198))))

(assert (=> b!500443 (= res!302316 (validKeyInArray!0 k0!2280))))

(declare-fun b!500444 () Bool)

(declare-fun res!302320 () Bool)

(assert (=> b!500444 (=> (not res!302320) (not e!293198))))

(assert (=> b!500444 (= res!302320 (and (= (size!15887 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15887 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15887 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500445 () Bool)

(assert (=> b!500445 (= e!293194 false)))

(declare-fun b!500446 () Bool)

(declare-fun res!302315 () Bool)

(assert (=> b!500446 (=> (not res!302315) (not e!293196))))

(declare-datatypes ((List!9588 0))(
  ( (Nil!9585) (Cons!9584 (h!10458 (_ BitVec 64)) (t!15808 List!9588)) )
))
(declare-fun arrayNoDuplicates!0 (array!32284 (_ BitVec 32) List!9588) Bool)

(assert (=> b!500446 (= res!302315 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9585))))

(declare-fun b!500436 () Bool)

(assert (=> b!500436 (= e!293193 (= (seekEntryOrOpen!0 (select (arr!15523 a!3235) j!176) a!3235 mask!3524) (Found!3946 j!176)))))

(declare-fun res!302318 () Bool)

(assert (=> start!45458 (=> (not res!302318) (not e!293198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45458 (= res!302318 (validMask!0 mask!3524))))

(assert (=> start!45458 e!293198))

(assert (=> start!45458 true))

(declare-fun array_inv!11382 (array!32284) Bool)

(assert (=> start!45458 (array_inv!11382 a!3235)))

(assert (= (and start!45458 res!302318) b!500444))

(assert (= (and b!500444 res!302320) b!500433))

(assert (= (and b!500433 res!302312) b!500443))

(assert (= (and b!500443 res!302316) b!500441))

(assert (= (and b!500441 res!302310) b!500439))

(assert (= (and b!500439 res!302313) b!500438))

(assert (= (and b!500438 res!302309) b!500446))

(assert (= (and b!500446 res!302315) b!500434))

(assert (= (and b!500434 res!302314) b!500436))

(assert (= (and b!500434 (not res!302319)) b!500442))

(assert (= (and b!500442 (not res!302308)) b!500435))

(assert (= (and b!500435 c!59339) b!500437))

(assert (= (and b!500435 (not c!59339)) b!500440))

(assert (= (and b!500437 res!302311) b!500445))

(assert (= (and b!500435 (not res!302317)) b!500432))

(declare-fun m!481807 () Bool)

(assert (=> b!500437 m!481807))

(declare-fun m!481809 () Bool)

(assert (=> b!500437 m!481809))

(declare-fun m!481811 () Bool)

(assert (=> b!500434 m!481811))

(declare-fun m!481813 () Bool)

(assert (=> b!500434 m!481813))

(declare-fun m!481815 () Bool)

(assert (=> b!500434 m!481815))

(declare-fun m!481817 () Bool)

(assert (=> b!500434 m!481817))

(assert (=> b!500434 m!481811))

(declare-fun m!481819 () Bool)

(assert (=> b!500434 m!481819))

(declare-fun m!481821 () Bool)

(assert (=> b!500434 m!481821))

(assert (=> b!500434 m!481811))

(declare-fun m!481823 () Bool)

(assert (=> b!500434 m!481823))

(declare-fun m!481825 () Bool)

(assert (=> b!500434 m!481825))

(declare-fun m!481827 () Bool)

(assert (=> b!500434 m!481827))

(declare-fun m!481829 () Bool)

(assert (=> b!500443 m!481829))

(assert (=> b!500433 m!481811))

(assert (=> b!500433 m!481811))

(declare-fun m!481831 () Bool)

(assert (=> b!500433 m!481831))

(declare-fun m!481833 () Bool)

(assert (=> b!500435 m!481833))

(assert (=> b!500435 m!481811))

(assert (=> b!500432 m!481809))

(declare-fun m!481835 () Bool)

(assert (=> b!500441 m!481835))

(declare-fun m!481837 () Bool)

(assert (=> start!45458 m!481837))

(declare-fun m!481839 () Bool)

(assert (=> start!45458 m!481839))

(declare-fun m!481841 () Bool)

(assert (=> b!500439 m!481841))

(assert (=> b!500436 m!481811))

(assert (=> b!500436 m!481811))

(declare-fun m!481843 () Bool)

(assert (=> b!500436 m!481843))

(declare-fun m!481845 () Bool)

(assert (=> b!500438 m!481845))

(declare-fun m!481847 () Bool)

(assert (=> b!500446 m!481847))

(check-sat (not start!45458) (not b!500434) (not b!500443) (not b!500433) (not b!500441) (not b!500439) (not b!500437) (not b!500446) (not b!500436) (not b!500438) (not b!500432))
(check-sat)
