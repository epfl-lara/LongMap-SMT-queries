; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45756 () Bool)

(assert start!45756)

(declare-fun b!506208 () Bool)

(declare-fun e!296294 () Bool)

(declare-fun lt!230953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506208 (= e!296294 (validKeyInArray!0 lt!230953))))

(declare-fun b!506209 () Bool)

(declare-fun e!296295 () Bool)

(declare-fun e!296289 () Bool)

(assert (=> b!506209 (= e!296295 (not e!296289))))

(declare-fun res!307189 () Bool)

(assert (=> b!506209 (=> res!307189 e!296289)))

(declare-datatypes ((SeekEntryResult!4103 0))(
  ( (MissingZero!4103 (index!18600 (_ BitVec 32))) (Found!4103 (index!18601 (_ BitVec 32))) (Intermediate!4103 (undefined!4915 Bool) (index!18602 (_ BitVec 32)) (x!47608 (_ BitVec 32))) (Undefined!4103) (MissingVacant!4103 (index!18603 (_ BitVec 32))) )
))
(declare-fun lt!230947 () SeekEntryResult!4103)

(declare-fun lt!230950 () SeekEntryResult!4103)

(assert (=> b!506209 (= res!307189 (or (= lt!230947 lt!230950) (undefined!4915 lt!230947) (not (is-Intermediate!4103 lt!230947))))))

(declare-fun lt!230956 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32512 0))(
  ( (array!32513 (arr!15636 (Array (_ BitVec 32) (_ BitVec 64))) (size!16000 (_ BitVec 32))) )
))
(declare-fun lt!230954 () array!32512)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32512 (_ BitVec 32)) SeekEntryResult!4103)

(assert (=> b!506209 (= lt!230950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230956 lt!230953 lt!230954 mask!3524))))

(declare-fun lt!230944 () (_ BitVec 32))

(declare-fun a!3235 () array!32512)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506209 (= lt!230947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230944 (select (arr!15636 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506209 (= lt!230956 (toIndex!0 lt!230953 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506209 (= lt!230953 (select (store (arr!15636 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!506209 (= lt!230944 (toIndex!0 (select (arr!15636 a!3235) j!176) mask!3524))))

(assert (=> b!506209 (= lt!230954 (array!32513 (store (arr!15636 a!3235) i!1204 k!2280) (size!16000 a!3235)))))

(declare-fun lt!230948 () SeekEntryResult!4103)

(assert (=> b!506209 (= lt!230948 (Found!4103 j!176))))

(declare-fun e!296291 () Bool)

(assert (=> b!506209 e!296291))

(declare-fun res!307193 () Bool)

(assert (=> b!506209 (=> (not res!307193) (not e!296291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32512 (_ BitVec 32)) Bool)

(assert (=> b!506209 (= res!307193 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15488 0))(
  ( (Unit!15489) )
))
(declare-fun lt!230949 () Unit!15488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15488)

(assert (=> b!506209 (= lt!230949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506210 () Bool)

(declare-fun e!296297 () Bool)

(assert (=> b!506210 (= e!296297 e!296295)))

(declare-fun res!307183 () Bool)

(assert (=> b!506210 (=> (not res!307183) (not e!296295))))

(declare-fun lt!230946 () SeekEntryResult!4103)

(assert (=> b!506210 (= res!307183 (or (= lt!230946 (MissingZero!4103 i!1204)) (= lt!230946 (MissingVacant!4103 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32512 (_ BitVec 32)) SeekEntryResult!4103)

(assert (=> b!506210 (= lt!230946 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506211 () Bool)

(declare-fun e!296298 () Unit!15488)

(declare-fun Unit!15490 () Unit!15488)

(assert (=> b!506211 (= e!296298 Unit!15490)))

(declare-fun b!506212 () Bool)

(declare-fun e!296292 () Bool)

(assert (=> b!506212 (= e!296289 e!296292)))

(declare-fun res!307190 () Bool)

(assert (=> b!506212 (=> res!307190 e!296292)))

(assert (=> b!506212 (= res!307190 (or (bvsgt (x!47608 lt!230947) #b01111111111111111111111111111110) (bvslt lt!230944 #b00000000000000000000000000000000) (bvsge lt!230944 (size!16000 a!3235)) (bvslt (index!18602 lt!230947) #b00000000000000000000000000000000) (bvsge (index!18602 lt!230947) (size!16000 a!3235)) (not (= lt!230947 (Intermediate!4103 false (index!18602 lt!230947) (x!47608 lt!230947))))))))

(assert (=> b!506212 (= (index!18602 lt!230947) i!1204)))

(declare-fun lt!230952 () Unit!15488)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15488)

(assert (=> b!506212 (= lt!230952 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230944 #b00000000000000000000000000000000 (index!18602 lt!230947) (x!47608 lt!230947) mask!3524))))

(assert (=> b!506212 (and (or (= (select (arr!15636 a!3235) (index!18602 lt!230947)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15636 a!3235) (index!18602 lt!230947)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15636 a!3235) (index!18602 lt!230947)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15636 a!3235) (index!18602 lt!230947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230945 () Unit!15488)

(assert (=> b!506212 (= lt!230945 e!296298)))

(declare-fun c!59792 () Bool)

(assert (=> b!506212 (= c!59792 (= (select (arr!15636 a!3235) (index!18602 lt!230947)) (select (arr!15636 a!3235) j!176)))))

(assert (=> b!506212 (and (bvslt (x!47608 lt!230947) #b01111111111111111111111111111110) (or (= (select (arr!15636 a!3235) (index!18602 lt!230947)) (select (arr!15636 a!3235) j!176)) (= (select (arr!15636 a!3235) (index!18602 lt!230947)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15636 a!3235) (index!18602 lt!230947)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!506213 () Bool)

(declare-fun res!307181 () Bool)

(assert (=> b!506213 (=> (not res!307181) (not e!296297))))

(declare-fun arrayContainsKey!0 (array!32512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506213 (= res!307181 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506215 () Bool)

(declare-fun res!307192 () Bool)

(assert (=> b!506215 (=> res!307192 e!296292)))

(declare-fun e!296290 () Bool)

(assert (=> b!506215 (= res!307192 e!296290)))

(declare-fun res!307184 () Bool)

(assert (=> b!506215 (=> (not res!307184) (not e!296290))))

(assert (=> b!506215 (= res!307184 (bvsgt #b00000000000000000000000000000000 (x!47608 lt!230947)))))

(declare-fun b!506216 () Bool)

(declare-fun Unit!15491 () Unit!15488)

(assert (=> b!506216 (= e!296298 Unit!15491)))

(declare-fun lt!230951 () Unit!15488)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15488)

(assert (=> b!506216 (= lt!230951 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230944 #b00000000000000000000000000000000 (index!18602 lt!230947) (x!47608 lt!230947) mask!3524))))

(declare-fun res!307195 () Bool)

(assert (=> b!506216 (= res!307195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230944 lt!230953 lt!230954 mask!3524) (Intermediate!4103 false (index!18602 lt!230947) (x!47608 lt!230947))))))

(declare-fun e!296293 () Bool)

(assert (=> b!506216 (=> (not res!307195) (not e!296293))))

(assert (=> b!506216 e!296293))

(declare-fun b!506217 () Bool)

(assert (=> b!506217 (= e!296291 (= (seekEntryOrOpen!0 (select (arr!15636 a!3235) j!176) a!3235 mask!3524) (Found!4103 j!176)))))

(declare-fun b!506218 () Bool)

(declare-fun res!307188 () Bool)

(assert (=> b!506218 (=> (not res!307188) (not e!296297))))

(assert (=> b!506218 (= res!307188 (validKeyInArray!0 (select (arr!15636 a!3235) j!176)))))

(declare-fun b!506219 () Bool)

(assert (=> b!506219 (= e!296292 e!296294)))

(declare-fun res!307186 () Bool)

(assert (=> b!506219 (=> res!307186 e!296294)))

(assert (=> b!506219 (= res!307186 (bvslt mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!506219 (= (seekEntryOrOpen!0 lt!230953 lt!230954 mask!3524) lt!230948)))

(declare-fun lt!230955 () Unit!15488)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15488)

(assert (=> b!506219 (= lt!230955 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230944 #b00000000000000000000000000000000 (index!18602 lt!230947) (x!47608 lt!230947) mask!3524))))

(declare-fun b!506220 () Bool)

(declare-fun res!307191 () Bool)

(assert (=> b!506220 (=> res!307191 e!296292)))

(assert (=> b!506220 (= res!307191 (not (= lt!230950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230944 lt!230953 lt!230954 mask!3524))))))

(declare-fun b!506221 () Bool)

(declare-fun res!307185 () Bool)

(assert (=> b!506221 (=> (not res!307185) (not e!296295))))

(assert (=> b!506221 (= res!307185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506222 () Bool)

(declare-fun res!307187 () Bool)

(assert (=> b!506222 (=> (not res!307187) (not e!296297))))

(assert (=> b!506222 (= res!307187 (and (= (size!16000 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16000 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16000 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506223 () Bool)

(declare-fun res!307196 () Bool)

(assert (=> b!506223 (=> (not res!307196) (not e!296297))))

(assert (=> b!506223 (= res!307196 (validKeyInArray!0 k!2280))))

(declare-fun b!506224 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32512 (_ BitVec 32)) SeekEntryResult!4103)

(assert (=> b!506224 (= e!296290 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230944 (index!18602 lt!230947) (select (arr!15636 a!3235) j!176) a!3235 mask!3524) lt!230948)))))

(declare-fun b!506225 () Bool)

(declare-fun res!307182 () Bool)

(assert (=> b!506225 (=> (not res!307182) (not e!296295))))

(declare-datatypes ((List!9794 0))(
  ( (Nil!9791) (Cons!9790 (h!10667 (_ BitVec 64)) (t!16022 List!9794)) )
))
(declare-fun arrayNoDuplicates!0 (array!32512 (_ BitVec 32) List!9794) Bool)

(assert (=> b!506225 (= res!307182 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9791))))

(declare-fun res!307194 () Bool)

(assert (=> start!45756 (=> (not res!307194) (not e!296297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45756 (= res!307194 (validMask!0 mask!3524))))

(assert (=> start!45756 e!296297))

(assert (=> start!45756 true))

(declare-fun array_inv!11432 (array!32512) Bool)

(assert (=> start!45756 (array_inv!11432 a!3235)))

(declare-fun b!506214 () Bool)

(assert (=> b!506214 (= e!296293 false)))

(assert (= (and start!45756 res!307194) b!506222))

(assert (= (and b!506222 res!307187) b!506218))

(assert (= (and b!506218 res!307188) b!506223))

(assert (= (and b!506223 res!307196) b!506213))

(assert (= (and b!506213 res!307181) b!506210))

(assert (= (and b!506210 res!307183) b!506221))

(assert (= (and b!506221 res!307185) b!506225))

(assert (= (and b!506225 res!307182) b!506209))

(assert (= (and b!506209 res!307193) b!506217))

(assert (= (and b!506209 (not res!307189)) b!506212))

(assert (= (and b!506212 c!59792) b!506216))

(assert (= (and b!506212 (not c!59792)) b!506211))

(assert (= (and b!506216 res!307195) b!506214))

(assert (= (and b!506212 (not res!307190)) b!506215))

(assert (= (and b!506215 res!307184) b!506224))

(assert (= (and b!506215 (not res!307192)) b!506220))

(assert (= (and b!506220 (not res!307191)) b!506219))

(assert (= (and b!506219 (not res!307186)) b!506208))

(declare-fun m!486855 () Bool)

(assert (=> b!506224 m!486855))

(assert (=> b!506224 m!486855))

(declare-fun m!486857 () Bool)

(assert (=> b!506224 m!486857))

(declare-fun m!486859 () Bool)

(assert (=> b!506219 m!486859))

(declare-fun m!486861 () Bool)

(assert (=> b!506219 m!486861))

(declare-fun m!486863 () Bool)

(assert (=> b!506220 m!486863))

(declare-fun m!486865 () Bool)

(assert (=> b!506209 m!486865))

(declare-fun m!486867 () Bool)

(assert (=> b!506209 m!486867))

(declare-fun m!486869 () Bool)

(assert (=> b!506209 m!486869))

(declare-fun m!486871 () Bool)

(assert (=> b!506209 m!486871))

(assert (=> b!506209 m!486855))

(declare-fun m!486873 () Bool)

(assert (=> b!506209 m!486873))

(assert (=> b!506209 m!486855))

(assert (=> b!506209 m!486855))

(declare-fun m!486875 () Bool)

(assert (=> b!506209 m!486875))

(declare-fun m!486877 () Bool)

(assert (=> b!506209 m!486877))

(declare-fun m!486879 () Bool)

(assert (=> b!506209 m!486879))

(declare-fun m!486881 () Bool)

(assert (=> start!45756 m!486881))

(declare-fun m!486883 () Bool)

(assert (=> start!45756 m!486883))

(declare-fun m!486885 () Bool)

(assert (=> b!506216 m!486885))

(assert (=> b!506216 m!486863))

(declare-fun m!486887 () Bool)

(assert (=> b!506212 m!486887))

(declare-fun m!486889 () Bool)

(assert (=> b!506212 m!486889))

(assert (=> b!506212 m!486855))

(declare-fun m!486891 () Bool)

(assert (=> b!506208 m!486891))

(assert (=> b!506217 m!486855))

(assert (=> b!506217 m!486855))

(declare-fun m!486893 () Bool)

(assert (=> b!506217 m!486893))

(declare-fun m!486895 () Bool)

(assert (=> b!506225 m!486895))

(assert (=> b!506218 m!486855))

(assert (=> b!506218 m!486855))

(declare-fun m!486897 () Bool)

(assert (=> b!506218 m!486897))

(declare-fun m!486899 () Bool)

(assert (=> b!506221 m!486899))

(declare-fun m!486901 () Bool)

(assert (=> b!506210 m!486901))

(declare-fun m!486903 () Bool)

(assert (=> b!506223 m!486903))

(declare-fun m!486905 () Bool)

(assert (=> b!506213 m!486905))

(push 1)

