; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118500 () Bool)

(assert start!118500)

(declare-fun b!1384794 () Bool)

(declare-fun e!784962 () Bool)

(assert (=> b!1384794 (= e!784962 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94701 0))(
  ( (array!94702 (arr!45726 (Array (_ BitVec 32) (_ BitVec 64))) (size!46277 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94701)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10022 0))(
  ( (MissingZero!10022 (index!42459 (_ BitVec 32))) (Found!10022 (index!42460 (_ BitVec 32))) (Intermediate!10022 (undefined!10834 Bool) (index!42461 (_ BitVec 32)) (x!124125 (_ BitVec 32))) (Undefined!10022) (MissingVacant!10022 (index!42462 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94701 (_ BitVec 32)) SeekEntryResult!10022)

(assert (=> b!1384794 (= (seekEntryOrOpen!0 (select (arr!45726 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45726 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94702 (store (arr!45726 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46277 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46008 0))(
  ( (Unit!46009) )
))
(declare-fun lt!609102 () Unit!46008)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46008)

(assert (=> b!1384794 (= lt!609102 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1384795 () Bool)

(declare-fun res!925600 () Bool)

(assert (=> b!1384795 (=> (not res!925600) (not e!784962))))

(assert (=> b!1384795 (= res!925600 (and (= (size!46277 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46277 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46277 a!2938))))))

(declare-fun b!1384796 () Bool)

(declare-fun res!925597 () Bool)

(assert (=> b!1384796 (=> (not res!925597) (not e!784962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384796 (= res!925597 (validKeyInArray!0 (select (arr!45726 a!2938) i!1065)))))

(declare-fun res!925598 () Bool)

(assert (=> start!118500 (=> (not res!925598) (not e!784962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118500 (= res!925598 (validMask!0 mask!2987))))

(assert (=> start!118500 e!784962))

(assert (=> start!118500 true))

(declare-fun array_inv!35007 (array!94701) Bool)

(assert (=> start!118500 (array_inv!35007 a!2938)))

(declare-fun b!1384797 () Bool)

(declare-fun res!925601 () Bool)

(assert (=> b!1384797 (=> (not res!925601) (not e!784962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94701 (_ BitVec 32)) Bool)

(assert (=> b!1384797 (= res!925601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384798 () Bool)

(declare-fun res!925602 () Bool)

(assert (=> b!1384798 (=> (not res!925602) (not e!784962))))

(assert (=> b!1384798 (= res!925602 (and (not (= (select (arr!45726 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45726 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1384799 () Bool)

(declare-fun res!925603 () Bool)

(assert (=> b!1384799 (=> (not res!925603) (not e!784962))))

(declare-datatypes ((List!32241 0))(
  ( (Nil!32238) (Cons!32237 (h!33455 (_ BitVec 64)) (t!46927 List!32241)) )
))
(declare-fun arrayNoDuplicates!0 (array!94701 (_ BitVec 32) List!32241) Bool)

(assert (=> b!1384799 (= res!925603 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32238))))

(declare-fun b!1384800 () Bool)

(declare-fun res!925599 () Bool)

(assert (=> b!1384800 (=> (not res!925599) (not e!784962))))

(assert (=> b!1384800 (= res!925599 (validKeyInArray!0 (select (arr!45726 a!2938) startIndex!16)))))

(assert (= (and start!118500 res!925598) b!1384795))

(assert (= (and b!1384795 res!925600) b!1384796))

(assert (= (and b!1384796 res!925597) b!1384799))

(assert (= (and b!1384799 res!925603) b!1384797))

(assert (= (and b!1384797 res!925601) b!1384798))

(assert (= (and b!1384798 res!925602) b!1384800))

(assert (= (and b!1384800 res!925599) b!1384794))

(declare-fun m!1270225 () Bool)

(assert (=> b!1384800 m!1270225))

(assert (=> b!1384800 m!1270225))

(declare-fun m!1270227 () Bool)

(assert (=> b!1384800 m!1270227))

(declare-fun m!1270229 () Bool)

(assert (=> b!1384798 m!1270229))

(assert (=> b!1384796 m!1270229))

(assert (=> b!1384796 m!1270229))

(declare-fun m!1270231 () Bool)

(assert (=> b!1384796 m!1270231))

(declare-fun m!1270233 () Bool)

(assert (=> start!118500 m!1270233))

(declare-fun m!1270235 () Bool)

(assert (=> start!118500 m!1270235))

(declare-fun m!1270237 () Bool)

(assert (=> b!1384797 m!1270237))

(declare-fun m!1270239 () Bool)

(assert (=> b!1384794 m!1270239))

(assert (=> b!1384794 m!1270239))

(declare-fun m!1270241 () Bool)

(assert (=> b!1384794 m!1270241))

(declare-fun m!1270243 () Bool)

(assert (=> b!1384794 m!1270243))

(declare-fun m!1270245 () Bool)

(assert (=> b!1384794 m!1270245))

(assert (=> b!1384794 m!1270225))

(assert (=> b!1384794 m!1270225))

(declare-fun m!1270247 () Bool)

(assert (=> b!1384794 m!1270247))

(declare-fun m!1270249 () Bool)

(assert (=> b!1384799 m!1270249))

(push 1)

(assert (not b!1384794))

(assert (not b!1384799))

(assert (not start!118500))

(assert (not b!1384796))

(assert (not b!1384797))

(assert (not b!1384800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

