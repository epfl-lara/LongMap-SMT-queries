; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118506 () Bool)

(assert start!118506)

(declare-fun b!1385580 () Bool)

(declare-fun res!926873 () Bool)

(declare-fun e!785064 () Bool)

(assert (=> b!1385580 (=> (not res!926873) (not e!785064))))

(declare-datatypes ((array!94735 0))(
  ( (array!94736 (arr!45744 (Array (_ BitVec 32) (_ BitVec 64))) (size!46296 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94735)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385580 (= res!926873 (and (= (size!46296 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46296 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46296 a!2938))))))

(declare-fun b!1385582 () Bool)

(declare-fun res!926876 () Bool)

(assert (=> b!1385582 (=> (not res!926876) (not e!785064))))

(declare-datatypes ((List!32350 0))(
  ( (Nil!32347) (Cons!32346 (h!33555 (_ BitVec 64)) (t!47036 List!32350)) )
))
(declare-fun arrayNoDuplicates!0 (array!94735 (_ BitVec 32) List!32350) Bool)

(assert (=> b!1385582 (= res!926876 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32347))))

(declare-fun b!1385581 () Bool)

(declare-fun res!926874 () Bool)

(assert (=> b!1385581 (=> (not res!926874) (not e!785064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385581 (= res!926874 (validKeyInArray!0 (select (arr!45744 a!2938) i!1065)))))

(declare-fun b!1385583 () Bool)

(assert (=> b!1385583 (= e!785064 false)))

(declare-fun lt!609113 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94735 (_ BitVec 32)) Bool)

(assert (=> b!1385583 (= lt!609113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926875 () Bool)

(assert (=> start!118506 (=> (not res!926875) (not e!785064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118506 (= res!926875 (validMask!0 mask!2987))))

(assert (=> start!118506 e!785064))

(assert (=> start!118506 true))

(declare-fun array_inv!34977 (array!94735) Bool)

(assert (=> start!118506 (array_inv!34977 a!2938)))

(assert (= (and start!118506 res!926875) b!1385580))

(assert (= (and b!1385580 res!926873) b!1385581))

(assert (= (and b!1385581 res!926874) b!1385582))

(assert (= (and b!1385582 res!926876) b!1385583))

(declare-fun m!1270437 () Bool)

(assert (=> b!1385582 m!1270437))

(declare-fun m!1270439 () Bool)

(assert (=> b!1385581 m!1270439))

(assert (=> b!1385581 m!1270439))

(declare-fun m!1270441 () Bool)

(assert (=> b!1385581 m!1270441))

(declare-fun m!1270443 () Bool)

(assert (=> b!1385583 m!1270443))

(declare-fun m!1270445 () Bool)

(assert (=> start!118506 m!1270445))

(declare-fun m!1270447 () Bool)

(assert (=> start!118506 m!1270447))

(push 1)

(assert (not start!118506))

(assert (not b!1385582))

(assert (not b!1385583))

(assert (not b!1385581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

