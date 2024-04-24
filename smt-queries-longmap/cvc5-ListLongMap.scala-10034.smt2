; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118524 () Bool)

(assert start!118524)

(declare-fun b!1385046 () Bool)

(declare-fun res!925849 () Bool)

(declare-fun e!785034 () Bool)

(assert (=> b!1385046 (=> (not res!925849) (not e!785034))))

(declare-datatypes ((array!94725 0))(
  ( (array!94726 (arr!45738 (Array (_ BitVec 32) (_ BitVec 64))) (size!46289 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94725)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385046 (= res!925849 (validKeyInArray!0 (select (arr!45738 a!2938) i!1065)))))

(declare-fun b!1385048 () Bool)

(declare-fun res!925855 () Bool)

(assert (=> b!1385048 (=> (not res!925855) (not e!785034))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94725 (_ BitVec 32)) Bool)

(assert (=> b!1385048 (= res!925855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385049 () Bool)

(declare-fun res!925852 () Bool)

(assert (=> b!1385049 (=> (not res!925852) (not e!785034))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385049 (= res!925852 (and (= (size!46289 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46289 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46289 a!2938))))))

(declare-fun b!1385050 () Bool)

(declare-fun res!925853 () Bool)

(assert (=> b!1385050 (=> (not res!925853) (not e!785034))))

(assert (=> b!1385050 (= res!925853 (and (not (= (select (arr!45738 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45738 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385051 () Bool)

(declare-fun res!925850 () Bool)

(assert (=> b!1385051 (=> (not res!925850) (not e!785034))))

(declare-datatypes ((List!32253 0))(
  ( (Nil!32250) (Cons!32249 (h!33467 (_ BitVec 64)) (t!46939 List!32253)) )
))
(declare-fun arrayNoDuplicates!0 (array!94725 (_ BitVec 32) List!32253) Bool)

(assert (=> b!1385051 (= res!925850 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32250))))

(declare-fun b!1385052 () Bool)

(declare-fun res!925851 () Bool)

(assert (=> b!1385052 (=> (not res!925851) (not e!785034))))

(assert (=> b!1385052 (= res!925851 (validKeyInArray!0 (select (arr!45738 a!2938) startIndex!16)))))

(declare-fun b!1385047 () Bool)

(assert (=> b!1385047 (= e!785034 (not true))))

(declare-datatypes ((SeekEntryResult!10034 0))(
  ( (MissingZero!10034 (index!42507 (_ BitVec 32))) (Found!10034 (index!42508 (_ BitVec 32))) (Intermediate!10034 (undefined!10846 Bool) (index!42509 (_ BitVec 32)) (x!124169 (_ BitVec 32))) (Undefined!10034) (MissingVacant!10034 (index!42510 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94725 (_ BitVec 32)) SeekEntryResult!10034)

(assert (=> b!1385047 (= (seekEntryOrOpen!0 (select (arr!45738 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45738 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94726 (store (arr!45738 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46289 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46032 0))(
  ( (Unit!46033) )
))
(declare-fun lt!609138 () Unit!46032)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46032)

(assert (=> b!1385047 (= lt!609138 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun res!925854 () Bool)

(assert (=> start!118524 (=> (not res!925854) (not e!785034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118524 (= res!925854 (validMask!0 mask!2987))))

(assert (=> start!118524 e!785034))

(assert (=> start!118524 true))

(declare-fun array_inv!35019 (array!94725) Bool)

(assert (=> start!118524 (array_inv!35019 a!2938)))

(assert (= (and start!118524 res!925854) b!1385049))

(assert (= (and b!1385049 res!925852) b!1385046))

(assert (= (and b!1385046 res!925849) b!1385051))

(assert (= (and b!1385051 res!925850) b!1385048))

(assert (= (and b!1385048 res!925855) b!1385050))

(assert (= (and b!1385050 res!925853) b!1385052))

(assert (= (and b!1385052 res!925851) b!1385047))

(declare-fun m!1270537 () Bool)

(assert (=> b!1385046 m!1270537))

(assert (=> b!1385046 m!1270537))

(declare-fun m!1270539 () Bool)

(assert (=> b!1385046 m!1270539))

(declare-fun m!1270541 () Bool)

(assert (=> b!1385047 m!1270541))

(assert (=> b!1385047 m!1270541))

(declare-fun m!1270543 () Bool)

(assert (=> b!1385047 m!1270543))

(declare-fun m!1270545 () Bool)

(assert (=> b!1385047 m!1270545))

(declare-fun m!1270547 () Bool)

(assert (=> b!1385047 m!1270547))

(declare-fun m!1270549 () Bool)

(assert (=> b!1385047 m!1270549))

(assert (=> b!1385047 m!1270549))

(declare-fun m!1270551 () Bool)

(assert (=> b!1385047 m!1270551))

(declare-fun m!1270553 () Bool)

(assert (=> b!1385048 m!1270553))

(assert (=> b!1385052 m!1270549))

(assert (=> b!1385052 m!1270549))

(declare-fun m!1270555 () Bool)

(assert (=> b!1385052 m!1270555))

(assert (=> b!1385050 m!1270537))

(declare-fun m!1270557 () Bool)

(assert (=> b!1385051 m!1270557))

(declare-fun m!1270559 () Bool)

(assert (=> start!118524 m!1270559))

(declare-fun m!1270561 () Bool)

(assert (=> start!118524 m!1270561))

(push 1)

(assert (not b!1385052))

(assert (not b!1385047))

(assert (not b!1385051))

(assert (not b!1385046))

(assert (not b!1385048))

(assert (not start!118524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

