; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45394 () Bool)

(assert start!45394)

(declare-fun b!498828 () Bool)

(declare-fun res!300884 () Bool)

(declare-fun e!292348 () Bool)

(assert (=> b!498828 (=> (not res!300884) (not e!292348))))

(declare-datatypes ((array!32219 0))(
  ( (array!32220 (arr!15491 (Array (_ BitVec 32) (_ BitVec 64))) (size!15855 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32219)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498828 (= res!300884 (validKeyInArray!0 (select (arr!15491 a!3235) j!176)))))

(declare-fun b!498829 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!292343 () Bool)

(declare-datatypes ((SeekEntryResult!3958 0))(
  ( (MissingZero!3958 (index!18014 (_ BitVec 32))) (Found!3958 (index!18015 (_ BitVec 32))) (Intermediate!3958 (undefined!4770 Bool) (index!18016 (_ BitVec 32)) (x!47059 (_ BitVec 32))) (Undefined!3958) (MissingVacant!3958 (index!18017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32219 (_ BitVec 32)) SeekEntryResult!3958)

(assert (=> b!498829 (= e!292343 (= (seekEntryOrOpen!0 (select (arr!15491 a!3235) j!176) a!3235 mask!3524) (Found!3958 j!176)))))

(declare-fun b!498830 () Bool)

(declare-fun e!292346 () Bool)

(assert (=> b!498830 (= e!292346 true)))

(declare-fun lt!226039 () array!32219)

(declare-fun lt!226040 () (_ BitVec 32))

(declare-fun lt!226042 () SeekEntryResult!3958)

(declare-fun lt!226048 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32219 (_ BitVec 32)) SeekEntryResult!3958)

(assert (=> b!498830 (= lt!226042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226040 lt!226048 lt!226039 mask!3524))))

(declare-fun b!498831 () Bool)

(declare-fun e!292344 () Bool)

(assert (=> b!498831 (= e!292344 false)))

(declare-fun b!498832 () Bool)

(declare-fun res!300882 () Bool)

(declare-fun e!292345 () Bool)

(assert (=> b!498832 (=> res!300882 e!292345)))

(declare-fun lt!226045 () SeekEntryResult!3958)

(assert (=> b!498832 (= res!300882 (or (undefined!4770 lt!226045) (not (is-Intermediate!3958 lt!226045))))))

(declare-fun b!498833 () Bool)

(declare-fun res!300874 () Bool)

(assert (=> b!498833 (=> (not res!300874) (not e!292348))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!498833 (= res!300874 (validKeyInArray!0 k!2280))))

(declare-fun b!498834 () Bool)

(declare-datatypes ((Unit!14908 0))(
  ( (Unit!14909) )
))
(declare-fun e!292349 () Unit!14908)

(declare-fun Unit!14910 () Unit!14908)

(assert (=> b!498834 (= e!292349 Unit!14910)))

(declare-fun b!498835 () Bool)

(declare-fun res!300875 () Bool)

(declare-fun e!292350 () Bool)

(assert (=> b!498835 (=> (not res!300875) (not e!292350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32219 (_ BitVec 32)) Bool)

(assert (=> b!498835 (= res!300875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498836 () Bool)

(declare-fun res!300881 () Bool)

(assert (=> b!498836 (=> (not res!300881) (not e!292348))))

(declare-fun arrayContainsKey!0 (array!32219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498836 (= res!300881 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!300876 () Bool)

(assert (=> start!45394 (=> (not res!300876) (not e!292348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45394 (= res!300876 (validMask!0 mask!3524))))

(assert (=> start!45394 e!292348))

(assert (=> start!45394 true))

(declare-fun array_inv!11287 (array!32219) Bool)

(assert (=> start!45394 (array_inv!11287 a!3235)))

(declare-fun b!498837 () Bool)

(assert (=> b!498837 (= e!292345 e!292346)))

(declare-fun res!300873 () Bool)

(assert (=> b!498837 (=> res!300873 e!292346)))

(assert (=> b!498837 (= res!300873 (or (bvsgt #b00000000000000000000000000000000 (x!47059 lt!226045)) (bvsgt (x!47059 lt!226045) #b01111111111111111111111111111110) (bvslt lt!226040 #b00000000000000000000000000000000) (bvsge lt!226040 (size!15855 a!3235)) (bvslt (index!18016 lt!226045) #b00000000000000000000000000000000) (bvsge (index!18016 lt!226045) (size!15855 a!3235)) (not (= lt!226045 (Intermediate!3958 false (index!18016 lt!226045) (x!47059 lt!226045))))))))

(assert (=> b!498837 (and (or (= (select (arr!15491 a!3235) (index!18016 lt!226045)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15491 a!3235) (index!18016 lt!226045)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15491 a!3235) (index!18016 lt!226045)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15491 a!3235) (index!18016 lt!226045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226047 () Unit!14908)

(assert (=> b!498837 (= lt!226047 e!292349)))

(declare-fun c!59255 () Bool)

(assert (=> b!498837 (= c!59255 (= (select (arr!15491 a!3235) (index!18016 lt!226045)) (select (arr!15491 a!3235) j!176)))))

(assert (=> b!498837 (and (bvslt (x!47059 lt!226045) #b01111111111111111111111111111110) (or (= (select (arr!15491 a!3235) (index!18016 lt!226045)) (select (arr!15491 a!3235) j!176)) (= (select (arr!15491 a!3235) (index!18016 lt!226045)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15491 a!3235) (index!18016 lt!226045)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498838 () Bool)

(assert (=> b!498838 (= e!292350 (not e!292345))))

(declare-fun res!300879 () Bool)

(assert (=> b!498838 (=> res!300879 e!292345)))

(declare-fun lt!226044 () (_ BitVec 32))

(assert (=> b!498838 (= res!300879 (= lt!226045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226044 lt!226048 lt!226039 mask!3524)))))

(assert (=> b!498838 (= lt!226045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226040 (select (arr!15491 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498838 (= lt!226044 (toIndex!0 lt!226048 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498838 (= lt!226048 (select (store (arr!15491 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498838 (= lt!226040 (toIndex!0 (select (arr!15491 a!3235) j!176) mask!3524))))

(assert (=> b!498838 (= lt!226039 (array!32220 (store (arr!15491 a!3235) i!1204 k!2280) (size!15855 a!3235)))))

(assert (=> b!498838 e!292343))

(declare-fun res!300880 () Bool)

(assert (=> b!498838 (=> (not res!300880) (not e!292343))))

(assert (=> b!498838 (= res!300880 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226043 () Unit!14908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14908)

(assert (=> b!498838 (= lt!226043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498839 () Bool)

(declare-fun res!300883 () Bool)

(assert (=> b!498839 (=> (not res!300883) (not e!292348))))

(assert (=> b!498839 (= res!300883 (and (= (size!15855 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15855 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15855 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498840 () Bool)

(declare-fun Unit!14911 () Unit!14908)

(assert (=> b!498840 (= e!292349 Unit!14911)))

(declare-fun lt!226041 () Unit!14908)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14908)

(assert (=> b!498840 (= lt!226041 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226040 #b00000000000000000000000000000000 (index!18016 lt!226045) (x!47059 lt!226045) mask!3524))))

(declare-fun res!300878 () Bool)

(assert (=> b!498840 (= res!300878 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226040 lt!226048 lt!226039 mask!3524) (Intermediate!3958 false (index!18016 lt!226045) (x!47059 lt!226045))))))

(assert (=> b!498840 (=> (not res!300878) (not e!292344))))

(assert (=> b!498840 e!292344))

(declare-fun b!498841 () Bool)

(assert (=> b!498841 (= e!292348 e!292350)))

(declare-fun res!300877 () Bool)

(assert (=> b!498841 (=> (not res!300877) (not e!292350))))

(declare-fun lt!226046 () SeekEntryResult!3958)

(assert (=> b!498841 (= res!300877 (or (= lt!226046 (MissingZero!3958 i!1204)) (= lt!226046 (MissingVacant!3958 i!1204))))))

(assert (=> b!498841 (= lt!226046 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498842 () Bool)

(declare-fun res!300872 () Bool)

(assert (=> b!498842 (=> (not res!300872) (not e!292350))))

(declare-datatypes ((List!9649 0))(
  ( (Nil!9646) (Cons!9645 (h!10519 (_ BitVec 64)) (t!15877 List!9649)) )
))
(declare-fun arrayNoDuplicates!0 (array!32219 (_ BitVec 32) List!9649) Bool)

(assert (=> b!498842 (= res!300872 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9646))))

(assert (= (and start!45394 res!300876) b!498839))

(assert (= (and b!498839 res!300883) b!498828))

(assert (= (and b!498828 res!300884) b!498833))

(assert (= (and b!498833 res!300874) b!498836))

(assert (= (and b!498836 res!300881) b!498841))

(assert (= (and b!498841 res!300877) b!498835))

(assert (= (and b!498835 res!300875) b!498842))

(assert (= (and b!498842 res!300872) b!498838))

(assert (= (and b!498838 res!300880) b!498829))

(assert (= (and b!498838 (not res!300879)) b!498832))

(assert (= (and b!498832 (not res!300882)) b!498837))

(assert (= (and b!498837 c!59255) b!498840))

(assert (= (and b!498837 (not c!59255)) b!498834))

(assert (= (and b!498840 res!300878) b!498831))

(assert (= (and b!498837 (not res!300873)) b!498830))

(declare-fun m!480069 () Bool)

(assert (=> b!498835 m!480069))

(declare-fun m!480071 () Bool)

(assert (=> b!498840 m!480071))

(declare-fun m!480073 () Bool)

(assert (=> b!498840 m!480073))

(declare-fun m!480075 () Bool)

(assert (=> b!498838 m!480075))

(declare-fun m!480077 () Bool)

(assert (=> b!498838 m!480077))

(declare-fun m!480079 () Bool)

(assert (=> b!498838 m!480079))

(declare-fun m!480081 () Bool)

(assert (=> b!498838 m!480081))

(declare-fun m!480083 () Bool)

(assert (=> b!498838 m!480083))

(assert (=> b!498838 m!480075))

(declare-fun m!480085 () Bool)

(assert (=> b!498838 m!480085))

(assert (=> b!498838 m!480075))

(declare-fun m!480087 () Bool)

(assert (=> b!498838 m!480087))

(declare-fun m!480089 () Bool)

(assert (=> b!498838 m!480089))

(declare-fun m!480091 () Bool)

(assert (=> b!498838 m!480091))

(declare-fun m!480093 () Bool)

(assert (=> b!498833 m!480093))

(declare-fun m!480095 () Bool)

(assert (=> start!45394 m!480095))

(declare-fun m!480097 () Bool)

(assert (=> start!45394 m!480097))

(assert (=> b!498830 m!480073))

(declare-fun m!480099 () Bool)

(assert (=> b!498837 m!480099))

(assert (=> b!498837 m!480075))

(declare-fun m!480101 () Bool)

(assert (=> b!498842 m!480101))

(declare-fun m!480103 () Bool)

(assert (=> b!498836 m!480103))

(declare-fun m!480105 () Bool)

(assert (=> b!498841 m!480105))

(assert (=> b!498828 m!480075))

(assert (=> b!498828 m!480075))

(declare-fun m!480107 () Bool)

(assert (=> b!498828 m!480107))

(assert (=> b!498829 m!480075))

(assert (=> b!498829 m!480075))

(declare-fun m!480109 () Bool)

(assert (=> b!498829 m!480109))

(push 1)

