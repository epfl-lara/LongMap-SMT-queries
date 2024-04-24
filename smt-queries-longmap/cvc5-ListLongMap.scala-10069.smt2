; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118764 () Bool)

(assert start!118764)

(declare-fun b!1387260 () Bool)

(declare-fun res!927725 () Bool)

(declare-fun e!786070 () Bool)

(assert (=> b!1387260 (=> (not res!927725) (not e!786070))))

(declare-datatypes ((array!94938 0))(
  ( (array!94939 (arr!45843 (Array (_ BitVec 32) (_ BitVec 64))) (size!46394 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94938)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94938 (_ BitVec 32)) Bool)

(assert (=> b!1387260 (= res!927725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387261 () Bool)

(declare-fun res!927723 () Bool)

(assert (=> b!1387261 (=> (not res!927723) (not e!786070))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387261 (= res!927723 (validKeyInArray!0 (select (arr!45843 a!2938) startIndex!16)))))

(declare-fun b!1387262 () Bool)

(declare-fun res!927724 () Bool)

(assert (=> b!1387262 (=> (not res!927724) (not e!786070))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387262 (= res!927724 (validKeyInArray!0 (select (arr!45843 a!2938) i!1065)))))

(declare-fun b!1387263 () Bool)

(declare-fun res!927726 () Bool)

(assert (=> b!1387263 (=> (not res!927726) (not e!786070))))

(declare-datatypes ((List!32358 0))(
  ( (Nil!32355) (Cons!32354 (h!33572 (_ BitVec 64)) (t!47044 List!32358)) )
))
(declare-fun arrayNoDuplicates!0 (array!94938 (_ BitVec 32) List!32358) Bool)

(assert (=> b!1387263 (= res!927726 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32355))))

(declare-fun res!927727 () Bool)

(assert (=> start!118764 (=> (not res!927727) (not e!786070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118764 (= res!927727 (validMask!0 mask!2987))))

(assert (=> start!118764 e!786070))

(assert (=> start!118764 true))

(declare-fun array_inv!35124 (array!94938) Bool)

(assert (=> start!118764 (array_inv!35124 a!2938)))

(declare-fun b!1387264 () Bool)

(declare-fun res!927722 () Bool)

(assert (=> b!1387264 (=> (not res!927722) (not e!786070))))

(assert (=> b!1387264 (= res!927722 (and (not (= (select (arr!45843 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45843 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1387265 () Bool)

(declare-fun res!927721 () Bool)

(assert (=> b!1387265 (=> (not res!927721) (not e!786070))))

(assert (=> b!1387265 (= res!927721 (and (= (size!46394 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46394 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46394 a!2938))))))

(declare-fun b!1387266 () Bool)

(assert (=> b!1387266 (= e!786070 (not true))))

(declare-datatypes ((SeekEntryResult!10090 0))(
  ( (MissingZero!10090 (index!42731 (_ BitVec 32))) (Found!10090 (index!42732 (_ BitVec 32))) (Intermediate!10090 (undefined!10902 Bool) (index!42733 (_ BitVec 32)) (x!124505 (_ BitVec 32))) (Undefined!10090) (MissingVacant!10090 (index!42734 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94938 (_ BitVec 32)) SeekEntryResult!10090)

(assert (=> b!1387266 (= (seekEntryOrOpen!0 (select (arr!45843 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94939 (store (arr!45843 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46195 0))(
  ( (Unit!46196) )
))
(declare-fun lt!609831 () Unit!46195)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46195)

(assert (=> b!1387266 (= lt!609831 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118764 res!927727) b!1387265))

(assert (= (and b!1387265 res!927721) b!1387262))

(assert (= (and b!1387262 res!927724) b!1387263))

(assert (= (and b!1387263 res!927726) b!1387260))

(assert (= (and b!1387260 res!927725) b!1387264))

(assert (= (and b!1387264 res!927722) b!1387261))

(assert (= (and b!1387261 res!927723) b!1387266))

(declare-fun m!1272865 () Bool)

(assert (=> b!1387260 m!1272865))

(declare-fun m!1272867 () Bool)

(assert (=> b!1387264 m!1272867))

(declare-fun m!1272869 () Bool)

(assert (=> start!118764 m!1272869))

(declare-fun m!1272871 () Bool)

(assert (=> start!118764 m!1272871))

(declare-fun m!1272873 () Bool)

(assert (=> b!1387263 m!1272873))

(assert (=> b!1387262 m!1272867))

(assert (=> b!1387262 m!1272867))

(declare-fun m!1272875 () Bool)

(assert (=> b!1387262 m!1272875))

(declare-fun m!1272877 () Bool)

(assert (=> b!1387261 m!1272877))

(assert (=> b!1387261 m!1272877))

(declare-fun m!1272879 () Bool)

(assert (=> b!1387261 m!1272879))

(declare-fun m!1272881 () Bool)

(assert (=> b!1387266 m!1272881))

(assert (=> b!1387266 m!1272881))

(declare-fun m!1272883 () Bool)

(assert (=> b!1387266 m!1272883))

(declare-fun m!1272885 () Bool)

(assert (=> b!1387266 m!1272885))

(declare-fun m!1272887 () Bool)

(assert (=> b!1387266 m!1272887))

(assert (=> b!1387266 m!1272877))

(assert (=> b!1387266 m!1272877))

(declare-fun m!1272889 () Bool)

(assert (=> b!1387266 m!1272889))

(push 1)

(assert (not b!1387263))

(assert (not b!1387262))

(assert (not start!118764))

(assert (not b!1387266))

(assert (not b!1387261))

(assert (not b!1387260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

