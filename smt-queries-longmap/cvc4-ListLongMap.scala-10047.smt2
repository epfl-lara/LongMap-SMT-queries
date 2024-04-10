; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118390 () Bool)

(assert start!118390)

(declare-fun res!926188 () Bool)

(declare-fun e!784689 () Bool)

(assert (=> start!118390 (=> (not res!926188) (not e!784689))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118390 (= res!926188 (validMask!0 mask!2987))))

(assert (=> start!118390 e!784689))

(assert (=> start!118390 true))

(declare-datatypes ((array!94693 0))(
  ( (array!94694 (arr!45724 (Array (_ BitVec 32) (_ BitVec 64))) (size!46274 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94693)

(declare-fun array_inv!34752 (array!94693) Bool)

(assert (=> start!118390 (array_inv!34752 a!2938)))

(declare-fun b!1384824 () Bool)

(declare-datatypes ((Unit!46209 0))(
  ( (Unit!46210) )
))
(declare-fun e!784691 () Unit!46209)

(declare-fun lt!609079 () Unit!46209)

(assert (=> b!1384824 (= e!784691 lt!609079)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609081 () Unit!46209)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46209)

(assert (=> b!1384824 (= lt!609081 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun lt!609077 () array!94693)

(declare-datatypes ((SeekEntryResult!10117 0))(
  ( (MissingZero!10117 (index!42839 (_ BitVec 32))) (Found!10117 (index!42840 (_ BitVec 32))) (Intermediate!10117 (undefined!10929 Bool) (index!42841 (_ BitVec 32)) (x!124334 (_ BitVec 32))) (Undefined!10117) (MissingVacant!10117 (index!42842 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94693 (_ BitVec 32)) SeekEntryResult!10117)

(assert (=> b!1384824 (= (seekEntryOrOpen!0 (select (arr!45724 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45724 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609077 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46209)

(assert (=> b!1384824 (= lt!609079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94693 (_ BitVec 32)) Bool)

(assert (=> b!1384824 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384825 () Bool)

(declare-fun res!926191 () Bool)

(assert (=> b!1384825 (=> (not res!926191) (not e!784689))))

(declare-datatypes ((List!32252 0))(
  ( (Nil!32249) (Cons!32248 (h!33457 (_ BitVec 64)) (t!46946 List!32252)) )
))
(declare-fun arrayNoDuplicates!0 (array!94693 (_ BitVec 32) List!32252) Bool)

(assert (=> b!1384825 (= res!926191 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32249))))

(declare-fun b!1384826 () Bool)

(declare-fun Unit!46211 () Unit!46209)

(assert (=> b!1384826 (= e!784691 Unit!46211)))

(declare-fun b!1384827 () Bool)

(declare-fun e!784688 () Bool)

(assert (=> b!1384827 (= e!784688 (not (bvsle startIndex!16 (size!46274 a!2938))))))

(assert (=> b!1384827 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609077 mask!2987)))

(declare-fun lt!609080 () Unit!46209)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46209)

(assert (=> b!1384827 (= lt!609080 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384828 () Bool)

(declare-fun res!926189 () Bool)

(assert (=> b!1384828 (=> (not res!926189) (not e!784689))))

(assert (=> b!1384828 (= res!926189 (and (not (= (select (arr!45724 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45724 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384829 () Bool)

(declare-fun res!926184 () Bool)

(assert (=> b!1384829 (=> (not res!926184) (not e!784689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384829 (= res!926184 (validKeyInArray!0 (select (arr!45724 a!2938) i!1065)))))

(declare-fun b!1384830 () Bool)

(declare-fun res!926190 () Bool)

(assert (=> b!1384830 (=> (not res!926190) (not e!784689))))

(assert (=> b!1384830 (= res!926190 (and (= (size!46274 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46274 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46274 a!2938))))))

(declare-fun b!1384831 () Bool)

(declare-fun res!926186 () Bool)

(assert (=> b!1384831 (=> (not res!926186) (not e!784689))))

(assert (=> b!1384831 (= res!926186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384832 () Bool)

(assert (=> b!1384832 (= e!784689 e!784688)))

(declare-fun res!926187 () Bool)

(assert (=> b!1384832 (=> (not res!926187) (not e!784688))))

(assert (=> b!1384832 (= res!926187 (and (bvslt startIndex!16 (bvsub (size!46274 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609078 () Unit!46209)

(assert (=> b!1384832 (= lt!609078 e!784691)))

(declare-fun c!128760 () Bool)

(declare-fun e!784687 () Bool)

(assert (=> b!1384832 (= c!128760 e!784687)))

(declare-fun res!926185 () Bool)

(assert (=> b!1384832 (=> (not res!926185) (not e!784687))))

(assert (=> b!1384832 (= res!926185 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384832 (= lt!609077 (array!94694 (store (arr!45724 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46274 a!2938)))))

(declare-fun b!1384833 () Bool)

(assert (=> b!1384833 (= e!784687 (validKeyInArray!0 (select (arr!45724 a!2938) startIndex!16)))))

(assert (= (and start!118390 res!926188) b!1384830))

(assert (= (and b!1384830 res!926190) b!1384829))

(assert (= (and b!1384829 res!926184) b!1384825))

(assert (= (and b!1384825 res!926191) b!1384831))

(assert (= (and b!1384831 res!926186) b!1384828))

(assert (= (and b!1384828 res!926189) b!1384832))

(assert (= (and b!1384832 res!926185) b!1384833))

(assert (= (and b!1384832 c!128760) b!1384824))

(assert (= (and b!1384832 (not c!128760)) b!1384826))

(assert (= (and b!1384832 res!926187) b!1384827))

(declare-fun m!1270115 () Bool)

(assert (=> b!1384824 m!1270115))

(declare-fun m!1270117 () Bool)

(assert (=> b!1384824 m!1270117))

(declare-fun m!1270119 () Bool)

(assert (=> b!1384824 m!1270119))

(declare-fun m!1270121 () Bool)

(assert (=> b!1384824 m!1270121))

(assert (=> b!1384824 m!1270117))

(declare-fun m!1270123 () Bool)

(assert (=> b!1384824 m!1270123))

(declare-fun m!1270125 () Bool)

(assert (=> b!1384824 m!1270125))

(declare-fun m!1270127 () Bool)

(assert (=> b!1384824 m!1270127))

(assert (=> b!1384824 m!1270125))

(declare-fun m!1270129 () Bool)

(assert (=> b!1384824 m!1270129))

(declare-fun m!1270131 () Bool)

(assert (=> b!1384829 m!1270131))

(assert (=> b!1384829 m!1270131))

(declare-fun m!1270133 () Bool)

(assert (=> b!1384829 m!1270133))

(assert (=> b!1384832 m!1270119))

(assert (=> b!1384828 m!1270131))

(declare-fun m!1270135 () Bool)

(assert (=> b!1384831 m!1270135))

(declare-fun m!1270137 () Bool)

(assert (=> b!1384825 m!1270137))

(declare-fun m!1270139 () Bool)

(assert (=> b!1384827 m!1270139))

(declare-fun m!1270141 () Bool)

(assert (=> b!1384827 m!1270141))

(assert (=> b!1384833 m!1270125))

(assert (=> b!1384833 m!1270125))

(declare-fun m!1270143 () Bool)

(assert (=> b!1384833 m!1270143))

(declare-fun m!1270145 () Bool)

(assert (=> start!118390 m!1270145))

(declare-fun m!1270147 () Bool)

(assert (=> start!118390 m!1270147))

(push 1)

(assert (not start!118390))

(assert (not b!1384827))

(assert (not b!1384833))

(assert (not b!1384824))

(assert (not b!1384829))

(assert (not b!1384831))

(assert (not b!1384825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

