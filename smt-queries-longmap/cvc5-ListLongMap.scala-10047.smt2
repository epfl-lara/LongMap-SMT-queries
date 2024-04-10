; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118386 () Bool)

(assert start!118386)

(declare-fun b!1384764 () Bool)

(declare-fun e!784661 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94689 0))(
  ( (array!94690 (arr!45722 (Array (_ BitVec 32) (_ BitVec 64))) (size!46272 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94689)

(assert (=> b!1384764 (= e!784661 (not (bvsle startIndex!16 (size!46272 a!2938))))))

(declare-fun lt!609048 () array!94689)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94689 (_ BitVec 32)) Bool)

(assert (=> b!1384764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609048 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((Unit!46203 0))(
  ( (Unit!46204) )
))
(declare-fun lt!609051 () Unit!46203)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46203)

(assert (=> b!1384764 (= lt!609051 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384765 () Bool)

(declare-fun e!784660 () Unit!46203)

(declare-fun Unit!46205 () Unit!46203)

(assert (=> b!1384765 (= e!784660 Unit!46205)))

(declare-fun b!1384766 () Bool)

(declare-fun e!784658 () Bool)

(assert (=> b!1384766 (= e!784658 e!784661)))

(declare-fun res!926139 () Bool)

(assert (=> b!1384766 (=> (not res!926139) (not e!784661))))

(assert (=> b!1384766 (= res!926139 (and (bvslt startIndex!16 (bvsub (size!46272 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609050 () Unit!46203)

(assert (=> b!1384766 (= lt!609050 e!784660)))

(declare-fun c!128754 () Bool)

(declare-fun e!784659 () Bool)

(assert (=> b!1384766 (= c!128754 e!784659)))

(declare-fun res!926141 () Bool)

(assert (=> b!1384766 (=> (not res!926141) (not e!784659))))

(assert (=> b!1384766 (= res!926141 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384766 (= lt!609048 (array!94690 (store (arr!45722 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46272 a!2938)))))

(declare-fun b!1384767 () Bool)

(declare-fun res!926140 () Bool)

(assert (=> b!1384767 (=> (not res!926140) (not e!784658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384767 (= res!926140 (validKeyInArray!0 (select (arr!45722 a!2938) i!1065)))))

(declare-fun b!1384768 () Bool)

(declare-fun res!926143 () Bool)

(assert (=> b!1384768 (=> (not res!926143) (not e!784658))))

(assert (=> b!1384768 (= res!926143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384769 () Bool)

(assert (=> b!1384769 (= e!784659 (validKeyInArray!0 (select (arr!45722 a!2938) startIndex!16)))))

(declare-fun b!1384770 () Bool)

(declare-fun res!926138 () Bool)

(assert (=> b!1384770 (=> (not res!926138) (not e!784658))))

(declare-datatypes ((List!32250 0))(
  ( (Nil!32247) (Cons!32246 (h!33455 (_ BitVec 64)) (t!46944 List!32250)) )
))
(declare-fun arrayNoDuplicates!0 (array!94689 (_ BitVec 32) List!32250) Bool)

(assert (=> b!1384770 (= res!926138 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32247))))

(declare-fun b!1384771 () Bool)

(declare-fun res!926137 () Bool)

(assert (=> b!1384771 (=> (not res!926137) (not e!784658))))

(assert (=> b!1384771 (= res!926137 (and (= (size!46272 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46272 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46272 a!2938))))))

(declare-fun b!1384772 () Bool)

(declare-fun lt!609049 () Unit!46203)

(assert (=> b!1384772 (= e!784660 lt!609049)))

(declare-fun lt!609047 () Unit!46203)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46203)

(assert (=> b!1384772 (= lt!609047 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10115 0))(
  ( (MissingZero!10115 (index!42831 (_ BitVec 32))) (Found!10115 (index!42832 (_ BitVec 32))) (Intermediate!10115 (undefined!10927 Bool) (index!42833 (_ BitVec 32)) (x!124332 (_ BitVec 32))) (Undefined!10115) (MissingVacant!10115 (index!42834 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94689 (_ BitVec 32)) SeekEntryResult!10115)

(assert (=> b!1384772 (= (seekEntryOrOpen!0 (select (arr!45722 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45722 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609048 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46203)

(assert (=> b!1384772 (= lt!609049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384772 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!926136 () Bool)

(assert (=> start!118386 (=> (not res!926136) (not e!784658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118386 (= res!926136 (validMask!0 mask!2987))))

(assert (=> start!118386 e!784658))

(assert (=> start!118386 true))

(declare-fun array_inv!34750 (array!94689) Bool)

(assert (=> start!118386 (array_inv!34750 a!2938)))

(declare-fun b!1384773 () Bool)

(declare-fun res!926142 () Bool)

(assert (=> b!1384773 (=> (not res!926142) (not e!784658))))

(assert (=> b!1384773 (= res!926142 (and (not (= (select (arr!45722 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45722 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118386 res!926136) b!1384771))

(assert (= (and b!1384771 res!926137) b!1384767))

(assert (= (and b!1384767 res!926140) b!1384770))

(assert (= (and b!1384770 res!926138) b!1384768))

(assert (= (and b!1384768 res!926143) b!1384773))

(assert (= (and b!1384773 res!926142) b!1384766))

(assert (= (and b!1384766 res!926141) b!1384769))

(assert (= (and b!1384766 c!128754) b!1384772))

(assert (= (and b!1384766 (not c!128754)) b!1384765))

(assert (= (and b!1384766 res!926139) b!1384764))

(declare-fun m!1270047 () Bool)

(assert (=> b!1384769 m!1270047))

(assert (=> b!1384769 m!1270047))

(declare-fun m!1270049 () Bool)

(assert (=> b!1384769 m!1270049))

(declare-fun m!1270051 () Bool)

(assert (=> b!1384772 m!1270051))

(declare-fun m!1270053 () Bool)

(assert (=> b!1384772 m!1270053))

(declare-fun m!1270055 () Bool)

(assert (=> b!1384772 m!1270055))

(assert (=> b!1384772 m!1270053))

(declare-fun m!1270057 () Bool)

(assert (=> b!1384772 m!1270057))

(declare-fun m!1270059 () Bool)

(assert (=> b!1384772 m!1270059))

(assert (=> b!1384772 m!1270047))

(declare-fun m!1270061 () Bool)

(assert (=> b!1384772 m!1270061))

(assert (=> b!1384772 m!1270047))

(declare-fun m!1270063 () Bool)

(assert (=> b!1384772 m!1270063))

(declare-fun m!1270065 () Bool)

(assert (=> b!1384773 m!1270065))

(declare-fun m!1270067 () Bool)

(assert (=> b!1384764 m!1270067))

(declare-fun m!1270069 () Bool)

(assert (=> b!1384764 m!1270069))

(declare-fun m!1270071 () Bool)

(assert (=> b!1384770 m!1270071))

(declare-fun m!1270073 () Bool)

(assert (=> start!118386 m!1270073))

(declare-fun m!1270075 () Bool)

(assert (=> start!118386 m!1270075))

(assert (=> b!1384766 m!1270055))

(declare-fun m!1270077 () Bool)

(assert (=> b!1384768 m!1270077))

(assert (=> b!1384767 m!1270065))

(assert (=> b!1384767 m!1270065))

(declare-fun m!1270079 () Bool)

(assert (=> b!1384767 m!1270079))

(push 1)

(assert (not b!1384764))

(assert (not start!118386))

(assert (not b!1384770))

(assert (not b!1384767))

(assert (not b!1384768))

(assert (not b!1384769))

(assert (not b!1384772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

