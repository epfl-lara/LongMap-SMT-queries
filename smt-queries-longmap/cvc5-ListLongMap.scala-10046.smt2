; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118380 () Bool)

(assert start!118380)

(declare-fun b!1384674 () Bool)

(declare-fun e!784612 () Bool)

(assert (=> b!1384674 (= e!784612 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94683 0))(
  ( (array!94684 (arr!45719 (Array (_ BitVec 32) (_ BitVec 64))) (size!46269 (_ BitVec 32))) )
))
(declare-fun lt!609006 () array!94683)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94683 (_ BitVec 32)) Bool)

(assert (=> b!1384674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609006 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((Unit!46194 0))(
  ( (Unit!46195) )
))
(declare-fun lt!609004 () Unit!46194)

(declare-fun a!2938 () array!94683)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46194)

(assert (=> b!1384674 (= lt!609004 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384675 () Bool)

(declare-fun e!784616 () Unit!46194)

(declare-fun Unit!46196 () Unit!46194)

(assert (=> b!1384675 (= e!784616 Unit!46196)))

(declare-fun b!1384676 () Bool)

(declare-fun lt!609003 () Unit!46194)

(assert (=> b!1384676 (= e!784616 lt!609003)))

(declare-fun lt!609005 () Unit!46194)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46194)

(assert (=> b!1384676 (= lt!609005 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10112 0))(
  ( (MissingZero!10112 (index!42819 (_ BitVec 32))) (Found!10112 (index!42820 (_ BitVec 32))) (Intermediate!10112 (undefined!10924 Bool) (index!42821 (_ BitVec 32)) (x!124321 (_ BitVec 32))) (Undefined!10112) (MissingVacant!10112 (index!42822 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94683 (_ BitVec 32)) SeekEntryResult!10112)

(assert (=> b!1384676 (= (seekEntryOrOpen!0 (select (arr!45719 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45719 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609006 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46194)

(assert (=> b!1384676 (= lt!609003 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384676 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384677 () Bool)

(declare-fun e!784615 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384677 (= e!784615 (validKeyInArray!0 (select (arr!45719 a!2938) startIndex!16)))))

(declare-fun res!926071 () Bool)

(declare-fun e!784614 () Bool)

(assert (=> start!118380 (=> (not res!926071) (not e!784614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118380 (= res!926071 (validMask!0 mask!2987))))

(assert (=> start!118380 e!784614))

(assert (=> start!118380 true))

(declare-fun array_inv!34747 (array!94683) Bool)

(assert (=> start!118380 (array_inv!34747 a!2938)))

(declare-fun b!1384678 () Bool)

(declare-fun res!926069 () Bool)

(assert (=> b!1384678 (=> (not res!926069) (not e!784614))))

(assert (=> b!1384678 (= res!926069 (and (= (size!46269 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46269 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46269 a!2938))))))

(declare-fun b!1384679 () Bool)

(assert (=> b!1384679 (= e!784614 e!784612)))

(declare-fun res!926064 () Bool)

(assert (=> b!1384679 (=> (not res!926064) (not e!784612))))

(assert (=> b!1384679 (= res!926064 (and (bvslt startIndex!16 (bvsub (size!46269 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609002 () Unit!46194)

(assert (=> b!1384679 (= lt!609002 e!784616)))

(declare-fun c!128745 () Bool)

(assert (=> b!1384679 (= c!128745 e!784615)))

(declare-fun res!926065 () Bool)

(assert (=> b!1384679 (=> (not res!926065) (not e!784615))))

(assert (=> b!1384679 (= res!926065 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384679 (= lt!609006 (array!94684 (store (arr!45719 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46269 a!2938)))))

(declare-fun b!1384680 () Bool)

(declare-fun res!926070 () Bool)

(assert (=> b!1384680 (=> (not res!926070) (not e!784614))))

(assert (=> b!1384680 (= res!926070 (and (not (= (select (arr!45719 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45719 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384681 () Bool)

(declare-fun res!926066 () Bool)

(assert (=> b!1384681 (=> (not res!926066) (not e!784614))))

(assert (=> b!1384681 (= res!926066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384682 () Bool)

(declare-fun res!926068 () Bool)

(assert (=> b!1384682 (=> (not res!926068) (not e!784614))))

(declare-datatypes ((List!32247 0))(
  ( (Nil!32244) (Cons!32243 (h!33452 (_ BitVec 64)) (t!46941 List!32247)) )
))
(declare-fun arrayNoDuplicates!0 (array!94683 (_ BitVec 32) List!32247) Bool)

(assert (=> b!1384682 (= res!926068 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32244))))

(declare-fun b!1384683 () Bool)

(declare-fun res!926067 () Bool)

(assert (=> b!1384683 (=> (not res!926067) (not e!784614))))

(assert (=> b!1384683 (= res!926067 (validKeyInArray!0 (select (arr!45719 a!2938) i!1065)))))

(assert (= (and start!118380 res!926071) b!1384678))

(assert (= (and b!1384678 res!926069) b!1384683))

(assert (= (and b!1384683 res!926067) b!1384682))

(assert (= (and b!1384682 res!926068) b!1384681))

(assert (= (and b!1384681 res!926066) b!1384680))

(assert (= (and b!1384680 res!926070) b!1384679))

(assert (= (and b!1384679 res!926065) b!1384677))

(assert (= (and b!1384679 c!128745) b!1384676))

(assert (= (and b!1384679 (not c!128745)) b!1384675))

(assert (= (and b!1384679 res!926064) b!1384674))

(declare-fun m!1269945 () Bool)

(assert (=> start!118380 m!1269945))

(declare-fun m!1269947 () Bool)

(assert (=> start!118380 m!1269947))

(declare-fun m!1269949 () Bool)

(assert (=> b!1384681 m!1269949))

(declare-fun m!1269951 () Bool)

(assert (=> b!1384683 m!1269951))

(assert (=> b!1384683 m!1269951))

(declare-fun m!1269953 () Bool)

(assert (=> b!1384683 m!1269953))

(declare-fun m!1269955 () Bool)

(assert (=> b!1384677 m!1269955))

(assert (=> b!1384677 m!1269955))

(declare-fun m!1269957 () Bool)

(assert (=> b!1384677 m!1269957))

(declare-fun m!1269959 () Bool)

(assert (=> b!1384682 m!1269959))

(declare-fun m!1269961 () Bool)

(assert (=> b!1384676 m!1269961))

(declare-fun m!1269963 () Bool)

(assert (=> b!1384676 m!1269963))

(declare-fun m!1269965 () Bool)

(assert (=> b!1384676 m!1269965))

(assert (=> b!1384676 m!1269963))

(declare-fun m!1269967 () Bool)

(assert (=> b!1384676 m!1269967))

(declare-fun m!1269969 () Bool)

(assert (=> b!1384676 m!1269969))

(assert (=> b!1384676 m!1269955))

(declare-fun m!1269971 () Bool)

(assert (=> b!1384676 m!1269971))

(assert (=> b!1384676 m!1269955))

(declare-fun m!1269973 () Bool)

(assert (=> b!1384676 m!1269973))

(assert (=> b!1384680 m!1269951))

(declare-fun m!1269975 () Bool)

(assert (=> b!1384674 m!1269975))

(declare-fun m!1269977 () Bool)

(assert (=> b!1384674 m!1269977))

(assert (=> b!1384679 m!1269967))

(push 1)

