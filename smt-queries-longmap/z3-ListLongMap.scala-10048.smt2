; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118394 () Bool)

(assert start!118394)

(declare-fun b!1384879 () Bool)

(declare-fun res!926233 () Bool)

(declare-fun e!784714 () Bool)

(assert (=> b!1384879 (=> (not res!926233) (not e!784714))))

(declare-datatypes ((array!94697 0))(
  ( (array!94698 (arr!45726 (Array (_ BitVec 32) (_ BitVec 64))) (size!46276 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94697)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94697 (_ BitVec 32)) Bool)

(assert (=> b!1384879 (= res!926233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384880 () Bool)

(declare-fun e!784715 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384880 (= e!784715 (validKeyInArray!0 (select (arr!45726 a!2938) startIndex!16)))))

(declare-fun b!1384881 () Bool)

(declare-fun res!926229 () Bool)

(assert (=> b!1384881 (=> (not res!926229) (not e!784714))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384881 (= res!926229 (validKeyInArray!0 (select (arr!45726 a!2938) i!1065)))))

(declare-fun b!1384882 () Bool)

(declare-fun res!926228 () Bool)

(assert (=> b!1384882 (=> (not res!926228) (not e!784714))))

(declare-datatypes ((List!32254 0))(
  ( (Nil!32251) (Cons!32250 (h!33459 (_ BitVec 64)) (t!46948 List!32254)) )
))
(declare-fun arrayNoDuplicates!0 (array!94697 (_ BitVec 32) List!32254) Bool)

(assert (=> b!1384882 (= res!926228 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32251))))

(declare-fun b!1384883 () Bool)

(declare-datatypes ((Unit!46215 0))(
  ( (Unit!46216) )
))
(declare-fun e!784712 () Unit!46215)

(declare-fun lt!609098 () Unit!46215)

(assert (=> b!1384883 (= e!784712 lt!609098)))

(declare-fun lt!609099 () Unit!46215)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46215)

(assert (=> b!1384883 (= lt!609099 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10119 0))(
  ( (MissingZero!10119 (index!42847 (_ BitVec 32))) (Found!10119 (index!42848 (_ BitVec 32))) (Intermediate!10119 (undefined!10931 Bool) (index!42849 (_ BitVec 32)) (x!124344 (_ BitVec 32))) (Undefined!10119) (MissingVacant!10119 (index!42850 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94697 (_ BitVec 32)) SeekEntryResult!10119)

(assert (=> b!1384883 (= (seekEntryOrOpen!0 (select (arr!45726 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45726 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94698 (store (arr!45726 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46276 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46215)

(assert (=> b!1384883 (= lt!609098 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384883 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384884 () Bool)

(assert (=> b!1384884 (= e!784714 false)))

(declare-fun lt!609097 () Unit!46215)

(assert (=> b!1384884 (= lt!609097 e!784712)))

(declare-fun c!128766 () Bool)

(assert (=> b!1384884 (= c!128766 e!784715)))

(declare-fun res!926227 () Bool)

(assert (=> b!1384884 (=> (not res!926227) (not e!784715))))

(assert (=> b!1384884 (= res!926227 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384886 () Bool)

(declare-fun res!926231 () Bool)

(assert (=> b!1384886 (=> (not res!926231) (not e!784714))))

(assert (=> b!1384886 (= res!926231 (and (= (size!46276 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46276 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46276 a!2938))))))

(declare-fun b!1384887 () Bool)

(declare-fun Unit!46217 () Unit!46215)

(assert (=> b!1384887 (= e!784712 Unit!46217)))

(declare-fun res!926230 () Bool)

(assert (=> start!118394 (=> (not res!926230) (not e!784714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118394 (= res!926230 (validMask!0 mask!2987))))

(assert (=> start!118394 e!784714))

(assert (=> start!118394 true))

(declare-fun array_inv!34754 (array!94697) Bool)

(assert (=> start!118394 (array_inv!34754 a!2938)))

(declare-fun b!1384885 () Bool)

(declare-fun res!926232 () Bool)

(assert (=> b!1384885 (=> (not res!926232) (not e!784714))))

(assert (=> b!1384885 (= res!926232 (and (not (= (select (arr!45726 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45726 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118394 res!926230) b!1384886))

(assert (= (and b!1384886 res!926231) b!1384881))

(assert (= (and b!1384881 res!926229) b!1384882))

(assert (= (and b!1384882 res!926228) b!1384879))

(assert (= (and b!1384879 res!926233) b!1384885))

(assert (= (and b!1384885 res!926232) b!1384884))

(assert (= (and b!1384884 res!926227) b!1384880))

(assert (= (and b!1384884 c!128766) b!1384883))

(assert (= (and b!1384884 (not c!128766)) b!1384887))

(declare-fun m!1270179 () Bool)

(assert (=> b!1384885 m!1270179))

(declare-fun m!1270181 () Bool)

(assert (=> b!1384879 m!1270181))

(declare-fun m!1270183 () Bool)

(assert (=> start!118394 m!1270183))

(declare-fun m!1270185 () Bool)

(assert (=> start!118394 m!1270185))

(declare-fun m!1270187 () Bool)

(assert (=> b!1384883 m!1270187))

(declare-fun m!1270189 () Bool)

(assert (=> b!1384883 m!1270189))

(assert (=> b!1384883 m!1270189))

(declare-fun m!1270191 () Bool)

(assert (=> b!1384883 m!1270191))

(declare-fun m!1270193 () Bool)

(assert (=> b!1384883 m!1270193))

(declare-fun m!1270195 () Bool)

(assert (=> b!1384883 m!1270195))

(declare-fun m!1270197 () Bool)

(assert (=> b!1384883 m!1270197))

(declare-fun m!1270199 () Bool)

(assert (=> b!1384883 m!1270199))

(assert (=> b!1384883 m!1270197))

(declare-fun m!1270201 () Bool)

(assert (=> b!1384883 m!1270201))

(assert (=> b!1384881 m!1270179))

(assert (=> b!1384881 m!1270179))

(declare-fun m!1270203 () Bool)

(assert (=> b!1384881 m!1270203))

(declare-fun m!1270205 () Bool)

(assert (=> b!1384882 m!1270205))

(assert (=> b!1384880 m!1270197))

(assert (=> b!1384880 m!1270197))

(declare-fun m!1270207 () Bool)

(assert (=> b!1384880 m!1270207))

(check-sat (not b!1384881) (not b!1384882) (not start!118394) (not b!1384880) (not b!1384879) (not b!1384883))
