; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131914 () Bool)

(assert start!131914)

(declare-fun res!1058574 () Bool)

(declare-fun e!858634 () Bool)

(assert (=> start!131914 (=> (not res!1058574) (not e!858634))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131914 (= res!1058574 (validMask!0 mask!4052))))

(assert (=> start!131914 e!858634))

(assert (=> start!131914 true))

(declare-datatypes ((array!102525 0))(
  ( (array!102526 (arr!49464 (Array (_ BitVec 32) (_ BitVec 64))) (size!50015 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102525)

(declare-fun array_inv!38745 (array!102525) Bool)

(assert (=> start!131914 (array_inv!38745 a!3920)))

(declare-fun b!1543603 () Bool)

(declare-fun res!1058573 () Bool)

(assert (=> b!1543603 (=> (not res!1058573) (not e!858634))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543603 (= res!1058573 (and (= (size!50015 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50015 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50015 a!3920))))))

(declare-fun b!1543604 () Bool)

(assert (=> b!1543604 (= e!858634 false)))

(declare-fun lt!666513 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102525 (_ BitVec 32)) Bool)

(assert (=> b!1543604 (= lt!666513 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131914 res!1058574) b!1543603))

(assert (= (and b!1543603 res!1058573) b!1543604))

(declare-fun m!1425443 () Bool)

(assert (=> start!131914 m!1425443))

(declare-fun m!1425445 () Bool)

(assert (=> start!131914 m!1425445))

(declare-fun m!1425447 () Bool)

(assert (=> b!1543604 m!1425447))

(push 1)

(assert (not start!131914))

(assert (not b!1543604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

