; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45478 () Bool)

(assert start!45478)

(declare-fun b!500718 () Bool)

(declare-fun e!293356 () Bool)

(declare-fun e!293355 () Bool)

(assert (=> b!500718 (= e!293356 (not e!293355))))

(declare-fun res!302521 () Bool)

(assert (=> b!500718 (=> res!302521 e!293355)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4000 0))(
  ( (MissingZero!4000 (index!18182 (_ BitVec 32))) (Found!4000 (index!18183 (_ BitVec 32))) (Intermediate!4000 (undefined!4812 Bool) (index!18184 (_ BitVec 32)) (x!47213 (_ BitVec 32))) (Undefined!4000) (MissingVacant!4000 (index!18185 (_ BitVec 32))) )
))
(declare-fun lt!227304 () SeekEntryResult!4000)

(declare-datatypes ((array!32303 0))(
  ( (array!32304 (arr!15533 (Array (_ BitVec 32) (_ BitVec 64))) (size!15897 (_ BitVec 32))) )
))
(declare-fun lt!227302 () array!32303)

(declare-fun lt!227300 () (_ BitVec 32))

(declare-fun lt!227301 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32303 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!500718 (= res!302521 (= lt!227304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227300 lt!227301 lt!227302 mask!3524)))))

(declare-fun a!3235 () array!32303)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!227299 () (_ BitVec 32))

(assert (=> b!500718 (= lt!227304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227299 (select (arr!15533 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500718 (= lt!227300 (toIndex!0 lt!227301 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500718 (= lt!227301 (select (store (arr!15533 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500718 (= lt!227299 (toIndex!0 (select (arr!15533 a!3235) j!176) mask!3524))))

(assert (=> b!500718 (= lt!227302 (array!32304 (store (arr!15533 a!3235) i!1204 k!2280) (size!15897 a!3235)))))

(declare-fun e!293352 () Bool)

(assert (=> b!500718 e!293352))

(declare-fun res!302519 () Bool)

(assert (=> b!500718 (=> (not res!302519) (not e!293352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32303 (_ BitVec 32)) Bool)

(assert (=> b!500718 (= res!302519 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15076 0))(
  ( (Unit!15077) )
))
(declare-fun lt!227307 () Unit!15076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15076)

(assert (=> b!500718 (= lt!227307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500719 () Bool)

(declare-fun res!302512 () Bool)

(assert (=> b!500719 (=> (not res!302512) (not e!293356))))

(assert (=> b!500719 (= res!302512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500720 () Bool)

(declare-fun res!302520 () Bool)

(declare-fun e!293354 () Bool)

(assert (=> b!500720 (=> (not res!302520) (not e!293354))))

(assert (=> b!500720 (= res!302520 (and (= (size!15897 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15897 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15897 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500722 () Bool)

(assert (=> b!500722 (= e!293354 e!293356)))

(declare-fun res!302522 () Bool)

(assert (=> b!500722 (=> (not res!302522) (not e!293356))))

(declare-fun lt!227305 () SeekEntryResult!4000)

(assert (=> b!500722 (= res!302522 (or (= lt!227305 (MissingZero!4000 i!1204)) (= lt!227305 (MissingVacant!4000 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32303 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!500722 (= lt!227305 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500723 () Bool)

(declare-fun res!302511 () Bool)

(assert (=> b!500723 (=> (not res!302511) (not e!293354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500723 (= res!302511 (validKeyInArray!0 k!2280))))

(declare-fun b!500724 () Bool)

(declare-fun e!293357 () Unit!15076)

(declare-fun Unit!15078 () Unit!15076)

(assert (=> b!500724 (= e!293357 Unit!15078)))

(declare-fun b!500725 () Bool)

(assert (=> b!500725 (= e!293352 (= (seekEntryOrOpen!0 (select (arr!15533 a!3235) j!176) a!3235 mask!3524) (Found!4000 j!176)))))

(declare-fun b!500726 () Bool)

(declare-fun e!293351 () Bool)

(assert (=> b!500726 (= e!293355 e!293351)))

(declare-fun res!302515 () Bool)

(assert (=> b!500726 (=> res!302515 e!293351)))

(assert (=> b!500726 (= res!302515 (or (bvsgt #b00000000000000000000000000000000 (x!47213 lt!227304)) (bvsgt (x!47213 lt!227304) #b01111111111111111111111111111110) (bvslt lt!227299 #b00000000000000000000000000000000) (bvsge lt!227299 (size!15897 a!3235)) (bvslt (index!18184 lt!227304) #b00000000000000000000000000000000) (bvsge (index!18184 lt!227304) (size!15897 a!3235)) (not (= lt!227304 (Intermediate!4000 false (index!18184 lt!227304) (x!47213 lt!227304))))))))

(assert (=> b!500726 (and (or (= (select (arr!15533 a!3235) (index!18184 lt!227304)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15533 a!3235) (index!18184 lt!227304)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15533 a!3235) (index!18184 lt!227304)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15533 a!3235) (index!18184 lt!227304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227303 () Unit!15076)

(assert (=> b!500726 (= lt!227303 e!293357)))

(declare-fun c!59381 () Bool)

(assert (=> b!500726 (= c!59381 (= (select (arr!15533 a!3235) (index!18184 lt!227304)) (select (arr!15533 a!3235) j!176)))))

(assert (=> b!500726 (and (bvslt (x!47213 lt!227304) #b01111111111111111111111111111110) (or (= (select (arr!15533 a!3235) (index!18184 lt!227304)) (select (arr!15533 a!3235) j!176)) (= (select (arr!15533 a!3235) (index!18184 lt!227304)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15533 a!3235) (index!18184 lt!227304)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500727 () Bool)

(declare-fun res!302510 () Bool)

(assert (=> b!500727 (=> (not res!302510) (not e!293356))))

(declare-datatypes ((List!9691 0))(
  ( (Nil!9688) (Cons!9687 (h!10561 (_ BitVec 64)) (t!15919 List!9691)) )
))
(declare-fun arrayNoDuplicates!0 (array!32303 (_ BitVec 32) List!9691) Bool)

(assert (=> b!500727 (= res!302510 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9688))))

(declare-fun b!500728 () Bool)

(declare-fun res!302518 () Bool)

(assert (=> b!500728 (=> (not res!302518) (not e!293354))))

(assert (=> b!500728 (= res!302518 (validKeyInArray!0 (select (arr!15533 a!3235) j!176)))))

(declare-fun b!500729 () Bool)

(assert (=> b!500729 (= e!293351 true)))

(declare-fun lt!227308 () SeekEntryResult!4000)

(assert (=> b!500729 (= lt!227308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227299 lt!227301 lt!227302 mask!3524))))

(declare-fun b!500730 () Bool)

(declare-fun e!293353 () Bool)

(assert (=> b!500730 (= e!293353 false)))

(declare-fun b!500721 () Bool)

(declare-fun Unit!15079 () Unit!15076)

(assert (=> b!500721 (= e!293357 Unit!15079)))

(declare-fun lt!227306 () Unit!15076)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32303 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15076)

(assert (=> b!500721 (= lt!227306 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227299 #b00000000000000000000000000000000 (index!18184 lt!227304) (x!47213 lt!227304) mask!3524))))

(declare-fun res!302514 () Bool)

(assert (=> b!500721 (= res!302514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227299 lt!227301 lt!227302 mask!3524) (Intermediate!4000 false (index!18184 lt!227304) (x!47213 lt!227304))))))

(assert (=> b!500721 (=> (not res!302514) (not e!293353))))

(assert (=> b!500721 e!293353))

(declare-fun res!302517 () Bool)

(assert (=> start!45478 (=> (not res!302517) (not e!293354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45478 (= res!302517 (validMask!0 mask!3524))))

(assert (=> start!45478 e!293354))

(assert (=> start!45478 true))

(declare-fun array_inv!11329 (array!32303) Bool)

(assert (=> start!45478 (array_inv!11329 a!3235)))

(declare-fun b!500731 () Bool)

(declare-fun res!302516 () Bool)

(assert (=> b!500731 (=> (not res!302516) (not e!293354))))

(declare-fun arrayContainsKey!0 (array!32303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500731 (= res!302516 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500732 () Bool)

(declare-fun res!302513 () Bool)

(assert (=> b!500732 (=> res!302513 e!293355)))

(assert (=> b!500732 (= res!302513 (or (undefined!4812 lt!227304) (not (is-Intermediate!4000 lt!227304))))))

(assert (= (and start!45478 res!302517) b!500720))

(assert (= (and b!500720 res!302520) b!500728))

(assert (= (and b!500728 res!302518) b!500723))

(assert (= (and b!500723 res!302511) b!500731))

(assert (= (and b!500731 res!302516) b!500722))

(assert (= (and b!500722 res!302522) b!500719))

(assert (= (and b!500719 res!302512) b!500727))

(assert (= (and b!500727 res!302510) b!500718))

(assert (= (and b!500718 res!302519) b!500725))

(assert (= (and b!500718 (not res!302521)) b!500732))

(assert (= (and b!500732 (not res!302513)) b!500726))

(assert (= (and b!500726 c!59381) b!500721))

(assert (= (and b!500726 (not c!59381)) b!500724))

(assert (= (and b!500721 res!302514) b!500730))

(assert (= (and b!500726 (not res!302515)) b!500729))

(declare-fun m!481833 () Bool)

(assert (=> b!500722 m!481833))

(declare-fun m!481835 () Bool)

(assert (=> b!500723 m!481835))

(declare-fun m!481837 () Bool)

(assert (=> b!500719 m!481837))

(declare-fun m!481839 () Bool)

(assert (=> b!500726 m!481839))

(declare-fun m!481841 () Bool)

(assert (=> b!500726 m!481841))

(assert (=> b!500725 m!481841))

(assert (=> b!500725 m!481841))

(declare-fun m!481843 () Bool)

(assert (=> b!500725 m!481843))

(assert (=> b!500728 m!481841))

(assert (=> b!500728 m!481841))

(declare-fun m!481845 () Bool)

(assert (=> b!500728 m!481845))

(declare-fun m!481847 () Bool)

(assert (=> b!500721 m!481847))

(declare-fun m!481849 () Bool)

(assert (=> b!500721 m!481849))

(declare-fun m!481851 () Bool)

(assert (=> b!500718 m!481851))

(declare-fun m!481853 () Bool)

(assert (=> b!500718 m!481853))

(declare-fun m!481855 () Bool)

(assert (=> b!500718 m!481855))

(assert (=> b!500718 m!481841))

(declare-fun m!481857 () Bool)

(assert (=> b!500718 m!481857))

(declare-fun m!481859 () Bool)

(assert (=> b!500718 m!481859))

(assert (=> b!500718 m!481841))

(declare-fun m!481861 () Bool)

(assert (=> b!500718 m!481861))

(assert (=> b!500718 m!481841))

(declare-fun m!481863 () Bool)

(assert (=> b!500718 m!481863))

(declare-fun m!481865 () Bool)

(assert (=> b!500718 m!481865))

(declare-fun m!481867 () Bool)

(assert (=> start!45478 m!481867))

(declare-fun m!481869 () Bool)

(assert (=> start!45478 m!481869))

(declare-fun m!481871 () Bool)

(assert (=> b!500731 m!481871))

(assert (=> b!500729 m!481849))

(declare-fun m!481873 () Bool)

(assert (=> b!500727 m!481873))

(push 1)

