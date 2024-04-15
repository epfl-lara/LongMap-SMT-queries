; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118242 () Bool)

(assert start!118242)

(declare-fun b!1383142 () Bool)

(declare-fun res!924778 () Bool)

(declare-fun e!783957 () Bool)

(assert (=> b!1383142 (=> (not res!924778) (not e!783957))))

(declare-datatypes ((array!94498 0))(
  ( (array!94499 (arr!45627 (Array (_ BitVec 32) (_ BitVec 64))) (size!46179 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94498)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383142 (= res!924778 (validKeyInArray!0 (select (arr!45627 a!2938) i!1065)))))

(declare-fun res!924777 () Bool)

(assert (=> start!118242 (=> (not res!924777) (not e!783957))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118242 (= res!924777 (validMask!0 mask!2987))))

(assert (=> start!118242 e!783957))

(assert (=> start!118242 true))

(declare-fun array_inv!34860 (array!94498) Bool)

(assert (=> start!118242 (array_inv!34860 a!2938)))

(declare-fun b!1383144 () Bool)

(assert (=> b!1383144 (= e!783957 false)))

(declare-fun lt!608375 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94498 (_ BitVec 32)) Bool)

(assert (=> b!1383144 (= lt!608375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383143 () Bool)

(declare-fun res!924779 () Bool)

(assert (=> b!1383143 (=> (not res!924779) (not e!783957))))

(declare-datatypes ((List!32233 0))(
  ( (Nil!32230) (Cons!32229 (h!33438 (_ BitVec 64)) (t!46919 List!32233)) )
))
(declare-fun arrayNoDuplicates!0 (array!94498 (_ BitVec 32) List!32233) Bool)

(assert (=> b!1383143 (= res!924779 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32230))))

(declare-fun b!1383141 () Bool)

(declare-fun res!924776 () Bool)

(assert (=> b!1383141 (=> (not res!924776) (not e!783957))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383141 (= res!924776 (and (= (size!46179 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46179 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46179 a!2938))))))

(assert (= (and start!118242 res!924777) b!1383141))

(assert (= (and b!1383141 res!924776) b!1383142))

(assert (= (and b!1383142 res!924778) b!1383143))

(assert (= (and b!1383143 res!924779) b!1383144))

(declare-fun m!1267809 () Bool)

(assert (=> b!1383142 m!1267809))

(assert (=> b!1383142 m!1267809))

(declare-fun m!1267811 () Bool)

(assert (=> b!1383142 m!1267811))

(declare-fun m!1267813 () Bool)

(assert (=> start!118242 m!1267813))

(declare-fun m!1267815 () Bool)

(assert (=> start!118242 m!1267815))

(declare-fun m!1267817 () Bool)

(assert (=> b!1383144 m!1267817))

(declare-fun m!1267819 () Bool)

(assert (=> b!1383143 m!1267819))

(push 1)

(assert (not b!1383142))

(assert (not start!118242))

(assert (not b!1383143))

(assert (not b!1383144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

