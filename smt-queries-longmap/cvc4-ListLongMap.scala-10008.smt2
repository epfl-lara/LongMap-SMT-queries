; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118088 () Bool)

(assert start!118088)

(declare-fun b!1382603 () Bool)

(declare-fun res!924196 () Bool)

(declare-fun e!783650 () Bool)

(assert (=> b!1382603 (=> (not res!924196) (not e!783650))))

(declare-datatypes ((array!94452 0))(
  ( (array!94453 (arr!45607 (Array (_ BitVec 32) (_ BitVec 64))) (size!46157 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94452)

(declare-datatypes ((List!32141 0))(
  ( (Nil!32138) (Cons!32137 (h!33346 (_ BitVec 64)) (t!46835 List!32141)) )
))
(declare-fun arrayNoDuplicates!0 (array!94452 (_ BitVec 32) List!32141) Bool)

(assert (=> b!1382603 (= res!924196 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32138))))

(declare-fun res!924195 () Bool)

(assert (=> start!118088 (=> (not res!924195) (not e!783650))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118088 (= res!924195 (validMask!0 mask!3034))))

(assert (=> start!118088 e!783650))

(assert (=> start!118088 true))

(declare-fun array_inv!34635 (array!94452) Bool)

(assert (=> start!118088 (array_inv!34635 a!2971)))

(declare-fun b!1382602 () Bool)

(declare-fun res!924194 () Bool)

(assert (=> b!1382602 (=> (not res!924194) (not e!783650))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382602 (= res!924194 (validKeyInArray!0 (select (arr!45607 a!2971) i!1094)))))

(declare-fun b!1382601 () Bool)

(declare-fun res!924193 () Bool)

(assert (=> b!1382601 (=> (not res!924193) (not e!783650))))

(assert (=> b!1382601 (= res!924193 (and (= (size!46157 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46157 a!2971))))))

(declare-fun b!1382604 () Bool)

(assert (=> b!1382604 (= e!783650 false)))

(declare-fun lt!608457 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94452 (_ BitVec 32)) Bool)

(assert (=> b!1382604 (= lt!608457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118088 res!924195) b!1382601))

(assert (= (and b!1382601 res!924193) b!1382602))

(assert (= (and b!1382602 res!924194) b!1382603))

(assert (= (and b!1382603 res!924196) b!1382604))

(declare-fun m!1267731 () Bool)

(assert (=> b!1382603 m!1267731))

(declare-fun m!1267733 () Bool)

(assert (=> start!118088 m!1267733))

(declare-fun m!1267735 () Bool)

(assert (=> start!118088 m!1267735))

(declare-fun m!1267737 () Bool)

(assert (=> b!1382602 m!1267737))

(assert (=> b!1382602 m!1267737))

(declare-fun m!1267739 () Bool)

(assert (=> b!1382602 m!1267739))

(declare-fun m!1267741 () Bool)

(assert (=> b!1382604 m!1267741))

(push 1)

(assert (not b!1382604))

(assert (not start!118088))

(assert (not b!1382603))

(assert (not b!1382602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

