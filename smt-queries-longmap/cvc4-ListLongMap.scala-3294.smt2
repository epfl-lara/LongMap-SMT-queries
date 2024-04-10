; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45712 () Bool)

(assert start!45712)

(declare-fun b!505085 () Bool)

(declare-fun res!306194 () Bool)

(declare-fun e!295699 () Bool)

(assert (=> b!505085 (=> res!306194 e!295699)))

(declare-datatypes ((SeekEntryResult!4081 0))(
  ( (MissingZero!4081 (index!18512 (_ BitVec 32))) (Found!4081 (index!18513 (_ BitVec 32))) (Intermediate!4081 (undefined!4893 Bool) (index!18514 (_ BitVec 32)) (x!47522 (_ BitVec 32))) (Undefined!4081) (MissingVacant!4081 (index!18515 (_ BitVec 32))) )
))
(declare-fun lt!230090 () SeekEntryResult!4081)

(assert (=> b!505085 (= res!306194 (or (undefined!4893 lt!230090) (not (is-Intermediate!4081 lt!230090))))))

(declare-fun b!505086 () Bool)

(declare-fun res!306197 () Bool)

(declare-fun e!295693 () Bool)

(assert (=> b!505086 (=> (not res!306197) (not e!295693))))

(declare-datatypes ((array!32468 0))(
  ( (array!32469 (arr!15614 (Array (_ BitVec 32) (_ BitVec 64))) (size!15978 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32468)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505086 (= res!306197 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505087 () Bool)

(declare-fun res!306200 () Bool)

(assert (=> b!505087 (=> (not res!306200) (not e!295693))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505087 (= res!306200 (validKeyInArray!0 (select (arr!15614 a!3235) j!176)))))

(declare-fun b!505088 () Bool)

(declare-fun res!306195 () Bool)

(declare-fun e!295700 () Bool)

(assert (=> b!505088 (=> res!306195 e!295700)))

(declare-fun e!295697 () Bool)

(assert (=> b!505088 (= res!306195 e!295697)))

(declare-fun res!306189 () Bool)

(assert (=> b!505088 (=> (not res!306189) (not e!295697))))

(assert (=> b!505088 (= res!306189 (bvsgt #b00000000000000000000000000000000 (x!47522 lt!230090)))))

(declare-fun b!505089 () Bool)

(declare-fun res!306201 () Bool)

(declare-fun e!295694 () Bool)

(assert (=> b!505089 (=> (not res!306201) (not e!295694))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32468 (_ BitVec 32)) Bool)

(assert (=> b!505089 (= res!306201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!306198 () Bool)

(assert (=> start!45712 (=> (not res!306198) (not e!295693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45712 (= res!306198 (validMask!0 mask!3524))))

(assert (=> start!45712 e!295693))

(assert (=> start!45712 true))

(declare-fun array_inv!11410 (array!32468) Bool)

(assert (=> start!45712 (array_inv!11410 a!3235)))

(declare-fun b!505084 () Bool)

(assert (=> b!505084 (= e!295700 true)))

(declare-fun lt!230089 () (_ BitVec 64))

(declare-fun lt!230094 () SeekEntryResult!4081)

(declare-fun lt!230088 () (_ BitVec 32))

(declare-fun lt!230097 () array!32468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32468 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!505084 (= lt!230094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230088 lt!230089 lt!230097 mask!3524))))

(declare-fun e!295696 () Bool)

(declare-fun b!505090 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32468 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!505090 (= e!295696 (= (seekEntryOrOpen!0 (select (arr!15614 a!3235) j!176) a!3235 mask!3524) (Found!4081 j!176)))))

(declare-fun b!505091 () Bool)

(declare-fun e!295698 () Bool)

(assert (=> b!505091 (= e!295698 false)))

(declare-fun b!505092 () Bool)

(declare-fun res!306196 () Bool)

(assert (=> b!505092 (=> (not res!306196) (not e!295694))))

(declare-datatypes ((List!9772 0))(
  ( (Nil!9769) (Cons!9768 (h!10645 (_ BitVec 64)) (t!16000 List!9772)) )
))
(declare-fun arrayNoDuplicates!0 (array!32468 (_ BitVec 32) List!9772) Bool)

(assert (=> b!505092 (= res!306196 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9769))))

(declare-fun b!505093 () Bool)

(assert (=> b!505093 (= e!295694 (not e!295699))))

(declare-fun res!306202 () Bool)

(assert (=> b!505093 (=> res!306202 e!295699)))

(declare-fun lt!230098 () (_ BitVec 32))

(assert (=> b!505093 (= res!306202 (= lt!230090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230098 lt!230089 lt!230097 mask!3524)))))

(assert (=> b!505093 (= lt!230090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230088 (select (arr!15614 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505093 (= lt!230098 (toIndex!0 lt!230089 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505093 (= lt!230089 (select (store (arr!15614 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505093 (= lt!230088 (toIndex!0 (select (arr!15614 a!3235) j!176) mask!3524))))

(assert (=> b!505093 (= lt!230097 (array!32469 (store (arr!15614 a!3235) i!1204 k!2280) (size!15978 a!3235)))))

(assert (=> b!505093 e!295696))

(declare-fun res!306191 () Bool)

(assert (=> b!505093 (=> (not res!306191) (not e!295696))))

(assert (=> b!505093 (= res!306191 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15400 0))(
  ( (Unit!15401) )
))
(declare-fun lt!230095 () Unit!15400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15400)

(assert (=> b!505093 (= lt!230095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505094 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32468 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!505094 (= e!295697 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230088 (index!18514 lt!230090) (select (arr!15614 a!3235) j!176) a!3235 mask!3524) (Found!4081 j!176))))))

(declare-fun b!505095 () Bool)

(assert (=> b!505095 (= e!295699 e!295700)))

(declare-fun res!306190 () Bool)

(assert (=> b!505095 (=> res!306190 e!295700)))

(assert (=> b!505095 (= res!306190 (or (bvsgt (x!47522 lt!230090) #b01111111111111111111111111111110) (bvslt lt!230088 #b00000000000000000000000000000000) (bvsge lt!230088 (size!15978 a!3235)) (bvslt (index!18514 lt!230090) #b00000000000000000000000000000000) (bvsge (index!18514 lt!230090) (size!15978 a!3235)) (not (= lt!230090 (Intermediate!4081 false (index!18514 lt!230090) (x!47522 lt!230090))))))))

(assert (=> b!505095 (= (index!18514 lt!230090) i!1204)))

(declare-fun lt!230091 () Unit!15400)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15400)

(assert (=> b!505095 (= lt!230091 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230088 #b00000000000000000000000000000000 (index!18514 lt!230090) (x!47522 lt!230090) mask!3524))))

(assert (=> b!505095 (and (or (= (select (arr!15614 a!3235) (index!18514 lt!230090)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15614 a!3235) (index!18514 lt!230090)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15614 a!3235) (index!18514 lt!230090)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15614 a!3235) (index!18514 lt!230090)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230093 () Unit!15400)

(declare-fun e!295701 () Unit!15400)

(assert (=> b!505095 (= lt!230093 e!295701)))

(declare-fun c!59726 () Bool)

(assert (=> b!505095 (= c!59726 (= (select (arr!15614 a!3235) (index!18514 lt!230090)) (select (arr!15614 a!3235) j!176)))))

(assert (=> b!505095 (and (bvslt (x!47522 lt!230090) #b01111111111111111111111111111110) (or (= (select (arr!15614 a!3235) (index!18514 lt!230090)) (select (arr!15614 a!3235) j!176)) (= (select (arr!15614 a!3235) (index!18514 lt!230090)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15614 a!3235) (index!18514 lt!230090)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505096 () Bool)

(declare-fun res!306192 () Bool)

(assert (=> b!505096 (=> (not res!306192) (not e!295693))))

(assert (=> b!505096 (= res!306192 (and (= (size!15978 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15978 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15978 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505097 () Bool)

(declare-fun res!306203 () Bool)

(assert (=> b!505097 (=> (not res!306203) (not e!295693))))

(assert (=> b!505097 (= res!306203 (validKeyInArray!0 k!2280))))

(declare-fun b!505098 () Bool)

(assert (=> b!505098 (= e!295693 e!295694)))

(declare-fun res!306193 () Bool)

(assert (=> b!505098 (=> (not res!306193) (not e!295694))))

(declare-fun lt!230096 () SeekEntryResult!4081)

(assert (=> b!505098 (= res!306193 (or (= lt!230096 (MissingZero!4081 i!1204)) (= lt!230096 (MissingVacant!4081 i!1204))))))

(assert (=> b!505098 (= lt!230096 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505099 () Bool)

(declare-fun Unit!15402 () Unit!15400)

(assert (=> b!505099 (= e!295701 Unit!15402)))

(declare-fun b!505100 () Bool)

(declare-fun Unit!15403 () Unit!15400)

(assert (=> b!505100 (= e!295701 Unit!15403)))

(declare-fun lt!230092 () Unit!15400)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15400)

(assert (=> b!505100 (= lt!230092 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230088 #b00000000000000000000000000000000 (index!18514 lt!230090) (x!47522 lt!230090) mask!3524))))

(declare-fun res!306199 () Bool)

(assert (=> b!505100 (= res!306199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230088 lt!230089 lt!230097 mask!3524) (Intermediate!4081 false (index!18514 lt!230090) (x!47522 lt!230090))))))

(assert (=> b!505100 (=> (not res!306199) (not e!295698))))

(assert (=> b!505100 e!295698))

(assert (= (and start!45712 res!306198) b!505096))

(assert (= (and b!505096 res!306192) b!505087))

(assert (= (and b!505087 res!306200) b!505097))

(assert (= (and b!505097 res!306203) b!505086))

(assert (= (and b!505086 res!306197) b!505098))

(assert (= (and b!505098 res!306193) b!505089))

(assert (= (and b!505089 res!306201) b!505092))

(assert (= (and b!505092 res!306196) b!505093))

(assert (= (and b!505093 res!306191) b!505090))

(assert (= (and b!505093 (not res!306202)) b!505085))

(assert (= (and b!505085 (not res!306194)) b!505095))

(assert (= (and b!505095 c!59726) b!505100))

(assert (= (and b!505095 (not c!59726)) b!505099))

(assert (= (and b!505100 res!306199) b!505091))

(assert (= (and b!505095 (not res!306190)) b!505088))

(assert (= (and b!505088 res!306189) b!505094))

(assert (= (and b!505088 (not res!306195)) b!505084))

(declare-fun m!485759 () Bool)

(assert (=> b!505093 m!485759))

(declare-fun m!485761 () Bool)

(assert (=> b!505093 m!485761))

(declare-fun m!485763 () Bool)

(assert (=> b!505093 m!485763))

(declare-fun m!485765 () Bool)

(assert (=> b!505093 m!485765))

(declare-fun m!485767 () Bool)

(assert (=> b!505093 m!485767))

(assert (=> b!505093 m!485765))

(declare-fun m!485769 () Bool)

(assert (=> b!505093 m!485769))

(declare-fun m!485771 () Bool)

(assert (=> b!505093 m!485771))

(declare-fun m!485773 () Bool)

(assert (=> b!505093 m!485773))

(assert (=> b!505093 m!485765))

(declare-fun m!485775 () Bool)

(assert (=> b!505093 m!485775))

(assert (=> b!505094 m!485765))

(assert (=> b!505094 m!485765))

(declare-fun m!485777 () Bool)

(assert (=> b!505094 m!485777))

(declare-fun m!485779 () Bool)

(assert (=> b!505098 m!485779))

(declare-fun m!485781 () Bool)

(assert (=> b!505084 m!485781))

(declare-fun m!485783 () Bool)

(assert (=> b!505095 m!485783))

(declare-fun m!485785 () Bool)

(assert (=> b!505095 m!485785))

(assert (=> b!505095 m!485765))

(declare-fun m!485787 () Bool)

(assert (=> b!505092 m!485787))

(assert (=> b!505090 m!485765))

(assert (=> b!505090 m!485765))

(declare-fun m!485789 () Bool)

(assert (=> b!505090 m!485789))

(declare-fun m!485791 () Bool)

(assert (=> b!505089 m!485791))

(declare-fun m!485793 () Bool)

(assert (=> b!505100 m!485793))

(assert (=> b!505100 m!485781))

(declare-fun m!485795 () Bool)

(assert (=> b!505097 m!485795))

(assert (=> b!505087 m!485765))

(assert (=> b!505087 m!485765))

(declare-fun m!485797 () Bool)

(assert (=> b!505087 m!485797))

(declare-fun m!485799 () Bool)

(assert (=> start!45712 m!485799))

(declare-fun m!485801 () Bool)

(assert (=> start!45712 m!485801))

(declare-fun m!485803 () Bool)

(assert (=> b!505086 m!485803))

(push 1)

