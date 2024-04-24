; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118518 () Bool)

(assert start!118518)

(declare-fun b!1384983 () Bool)

(declare-fun res!925789 () Bool)

(declare-fun e!785016 () Bool)

(assert (=> b!1384983 (=> (not res!925789) (not e!785016))))

(declare-datatypes ((array!94719 0))(
  ( (array!94720 (arr!45735 (Array (_ BitVec 32) (_ BitVec 64))) (size!46286 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94719)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94719 (_ BitVec 32)) Bool)

(assert (=> b!1384983 (= res!925789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384984 () Bool)

(declare-fun res!925791 () Bool)

(assert (=> b!1384984 (=> (not res!925791) (not e!785016))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384984 (= res!925791 (and (= (size!46286 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46286 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46286 a!2938))))))

(declare-fun b!1384986 () Bool)

(declare-fun res!925788 () Bool)

(assert (=> b!1384986 (=> (not res!925788) (not e!785016))))

(declare-datatypes ((List!32250 0))(
  ( (Nil!32247) (Cons!32246 (h!33464 (_ BitVec 64)) (t!46936 List!32250)) )
))
(declare-fun arrayNoDuplicates!0 (array!94719 (_ BitVec 32) List!32250) Bool)

(assert (=> b!1384986 (= res!925788 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32247))))

(declare-fun b!1384987 () Bool)

(declare-fun res!925786 () Bool)

(assert (=> b!1384987 (=> (not res!925786) (not e!785016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384987 (= res!925786 (validKeyInArray!0 (select (arr!45735 a!2938) startIndex!16)))))

(declare-fun b!1384988 () Bool)

(assert (=> b!1384988 (= e!785016 (not true))))

(declare-datatypes ((SeekEntryResult!10031 0))(
  ( (MissingZero!10031 (index!42495 (_ BitVec 32))) (Found!10031 (index!42496 (_ BitVec 32))) (Intermediate!10031 (undefined!10843 Bool) (index!42497 (_ BitVec 32)) (x!124158 (_ BitVec 32))) (Undefined!10031) (MissingVacant!10031 (index!42498 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94719 (_ BitVec 32)) SeekEntryResult!10031)

(assert (=> b!1384988 (= (seekEntryOrOpen!0 (select (arr!45735 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45735 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94720 (store (arr!45735 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46286 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46026 0))(
  ( (Unit!46027) )
))
(declare-fun lt!609129 () Unit!46026)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46026)

(assert (=> b!1384988 (= lt!609129 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1384989 () Bool)

(declare-fun res!925787 () Bool)

(assert (=> b!1384989 (=> (not res!925787) (not e!785016))))

(assert (=> b!1384989 (= res!925787 (validKeyInArray!0 (select (arr!45735 a!2938) i!1065)))))

(declare-fun b!1384985 () Bool)

(declare-fun res!925790 () Bool)

(assert (=> b!1384985 (=> (not res!925790) (not e!785016))))

(assert (=> b!1384985 (= res!925790 (and (not (= (select (arr!45735 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45735 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun res!925792 () Bool)

(assert (=> start!118518 (=> (not res!925792) (not e!785016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118518 (= res!925792 (validMask!0 mask!2987))))

(assert (=> start!118518 e!785016))

(assert (=> start!118518 true))

(declare-fun array_inv!35016 (array!94719) Bool)

(assert (=> start!118518 (array_inv!35016 a!2938)))

(assert (= (and start!118518 res!925792) b!1384984))

(assert (= (and b!1384984 res!925791) b!1384989))

(assert (= (and b!1384989 res!925787) b!1384986))

(assert (= (and b!1384986 res!925788) b!1384983))

(assert (= (and b!1384983 res!925789) b!1384985))

(assert (= (and b!1384985 res!925790) b!1384987))

(assert (= (and b!1384987 res!925786) b!1384988))

(declare-fun m!1270459 () Bool)

(assert (=> start!118518 m!1270459))

(declare-fun m!1270461 () Bool)

(assert (=> start!118518 m!1270461))

(declare-fun m!1270463 () Bool)

(assert (=> b!1384987 m!1270463))

(assert (=> b!1384987 m!1270463))

(declare-fun m!1270465 () Bool)

(assert (=> b!1384987 m!1270465))

(declare-fun m!1270467 () Bool)

(assert (=> b!1384989 m!1270467))

(assert (=> b!1384989 m!1270467))

(declare-fun m!1270469 () Bool)

(assert (=> b!1384989 m!1270469))

(declare-fun m!1270471 () Bool)

(assert (=> b!1384986 m!1270471))

(assert (=> b!1384985 m!1270467))

(declare-fun m!1270473 () Bool)

(assert (=> b!1384983 m!1270473))

(declare-fun m!1270475 () Bool)

(assert (=> b!1384988 m!1270475))

(assert (=> b!1384988 m!1270475))

(declare-fun m!1270477 () Bool)

(assert (=> b!1384988 m!1270477))

(declare-fun m!1270479 () Bool)

(assert (=> b!1384988 m!1270479))

(declare-fun m!1270481 () Bool)

(assert (=> b!1384988 m!1270481))

(assert (=> b!1384988 m!1270463))

(assert (=> b!1384988 m!1270463))

(declare-fun m!1270483 () Bool)

(assert (=> b!1384988 m!1270483))

(push 1)

(assert (not b!1384988))

(assert (not b!1384989))

(assert (not b!1384983))

(assert (not b!1384986))

(assert (not b!1384987))

(assert (not start!118518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

