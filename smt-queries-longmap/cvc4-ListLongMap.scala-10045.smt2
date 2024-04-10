; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118378 () Bool)

(assert start!118378)

(declare-fun b!1384644 () Bool)

(declare-fun e!784600 () Bool)

(declare-datatypes ((array!94681 0))(
  ( (array!94682 (arr!45718 (Array (_ BitVec 32) (_ BitVec 64))) (size!46268 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94681)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384644 (= e!784600 (validKeyInArray!0 (select (arr!45718 a!2938) startIndex!16)))))

(declare-fun b!1384645 () Bool)

(declare-fun res!926044 () Bool)

(declare-fun e!784598 () Bool)

(assert (=> b!1384645 (=> (not res!926044) (not e!784598))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384645 (= res!926044 (and (= (size!46268 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46268 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46268 a!2938))))))

(declare-fun b!1384646 () Bool)

(declare-fun res!926042 () Bool)

(assert (=> b!1384646 (=> (not res!926042) (not e!784598))))

(assert (=> b!1384646 (= res!926042 (validKeyInArray!0 (select (arr!45718 a!2938) i!1065)))))

(declare-fun b!1384647 () Bool)

(declare-fun res!926043 () Bool)

(assert (=> b!1384647 (=> (not res!926043) (not e!784598))))

(declare-datatypes ((List!32246 0))(
  ( (Nil!32243) (Cons!32242 (h!33451 (_ BitVec 64)) (t!46940 List!32246)) )
))
(declare-fun arrayNoDuplicates!0 (array!94681 (_ BitVec 32) List!32246) Bool)

(assert (=> b!1384647 (= res!926043 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32243))))

(declare-fun b!1384648 () Bool)

(declare-fun res!926040 () Bool)

(assert (=> b!1384648 (=> (not res!926040) (not e!784598))))

(assert (=> b!1384648 (= res!926040 (and (not (= (select (arr!45718 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45718 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384649 () Bool)

(declare-fun e!784599 () Bool)

(assert (=> b!1384649 (= e!784599 (not true))))

(declare-fun lt!608989 () array!94681)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94681 (_ BitVec 32)) Bool)

(assert (=> b!1384649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608989 mask!2987)))

(declare-datatypes ((Unit!46191 0))(
  ( (Unit!46192) )
))
(declare-fun lt!608990 () Unit!46191)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46191)

(assert (=> b!1384649 (= lt!608990 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384650 () Bool)

(declare-fun e!784597 () Unit!46191)

(declare-fun lt!608991 () Unit!46191)

(assert (=> b!1384650 (= e!784597 lt!608991)))

(declare-fun lt!608988 () Unit!46191)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46191)

(assert (=> b!1384650 (= lt!608988 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10111 0))(
  ( (MissingZero!10111 (index!42815 (_ BitVec 32))) (Found!10111 (index!42816 (_ BitVec 32))) (Intermediate!10111 (undefined!10923 Bool) (index!42817 (_ BitVec 32)) (x!124312 (_ BitVec 32))) (Undefined!10111) (MissingVacant!10111 (index!42818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94681 (_ BitVec 32)) SeekEntryResult!10111)

(assert (=> b!1384650 (= (seekEntryOrOpen!0 (select (arr!45718 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45718 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608989 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46191)

(assert (=> b!1384650 (= lt!608991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384650 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384651 () Bool)

(declare-fun res!926047 () Bool)

(assert (=> b!1384651 (=> (not res!926047) (not e!784598))))

(assert (=> b!1384651 (= res!926047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926045 () Bool)

(assert (=> start!118378 (=> (not res!926045) (not e!784598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118378 (= res!926045 (validMask!0 mask!2987))))

(assert (=> start!118378 e!784598))

(assert (=> start!118378 true))

(declare-fun array_inv!34746 (array!94681) Bool)

(assert (=> start!118378 (array_inv!34746 a!2938)))

(declare-fun b!1384652 () Bool)

(assert (=> b!1384652 (= e!784598 e!784599)))

(declare-fun res!926046 () Bool)

(assert (=> b!1384652 (=> (not res!926046) (not e!784599))))

(assert (=> b!1384652 (= res!926046 (and (bvslt startIndex!16 (bvsub (size!46268 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608987 () Unit!46191)

(assert (=> b!1384652 (= lt!608987 e!784597)))

(declare-fun c!128742 () Bool)

(assert (=> b!1384652 (= c!128742 e!784600)))

(declare-fun res!926041 () Bool)

(assert (=> b!1384652 (=> (not res!926041) (not e!784600))))

(assert (=> b!1384652 (= res!926041 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384652 (= lt!608989 (array!94682 (store (arr!45718 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46268 a!2938)))))

(declare-fun b!1384653 () Bool)

(declare-fun Unit!46193 () Unit!46191)

(assert (=> b!1384653 (= e!784597 Unit!46193)))

(assert (= (and start!118378 res!926045) b!1384645))

(assert (= (and b!1384645 res!926044) b!1384646))

(assert (= (and b!1384646 res!926042) b!1384647))

(assert (= (and b!1384647 res!926043) b!1384651))

(assert (= (and b!1384651 res!926047) b!1384648))

(assert (= (and b!1384648 res!926040) b!1384652))

(assert (= (and b!1384652 res!926041) b!1384644))

(assert (= (and b!1384652 c!128742) b!1384650))

(assert (= (and b!1384652 (not c!128742)) b!1384653))

(assert (= (and b!1384652 res!926046) b!1384649))

(declare-fun m!1269911 () Bool)

(assert (=> b!1384648 m!1269911))

(declare-fun m!1269913 () Bool)

(assert (=> start!118378 m!1269913))

(declare-fun m!1269915 () Bool)

(assert (=> start!118378 m!1269915))

(assert (=> b!1384646 m!1269911))

(assert (=> b!1384646 m!1269911))

(declare-fun m!1269917 () Bool)

(assert (=> b!1384646 m!1269917))

(declare-fun m!1269919 () Bool)

(assert (=> b!1384651 m!1269919))

(declare-fun m!1269921 () Bool)

(assert (=> b!1384649 m!1269921))

(declare-fun m!1269923 () Bool)

(assert (=> b!1384649 m!1269923))

(declare-fun m!1269925 () Bool)

(assert (=> b!1384644 m!1269925))

(assert (=> b!1384644 m!1269925))

(declare-fun m!1269927 () Bool)

(assert (=> b!1384644 m!1269927))

(declare-fun m!1269929 () Bool)

(assert (=> b!1384652 m!1269929))

(declare-fun m!1269931 () Bool)

(assert (=> b!1384647 m!1269931))

(declare-fun m!1269933 () Bool)

(assert (=> b!1384650 m!1269933))

(declare-fun m!1269935 () Bool)

(assert (=> b!1384650 m!1269935))

(assert (=> b!1384650 m!1269929))

(declare-fun m!1269937 () Bool)

(assert (=> b!1384650 m!1269937))

(assert (=> b!1384650 m!1269935))

(declare-fun m!1269939 () Bool)

(assert (=> b!1384650 m!1269939))

(assert (=> b!1384650 m!1269925))

(declare-fun m!1269941 () Bool)

(assert (=> b!1384650 m!1269941))

(assert (=> b!1384650 m!1269925))

(declare-fun m!1269943 () Bool)

(assert (=> b!1384650 m!1269943))

(push 1)

(assert (not b!1384650))

(assert (not b!1384647))

