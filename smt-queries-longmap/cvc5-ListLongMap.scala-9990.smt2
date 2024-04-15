; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117948 () Bool)

(assert start!117948)

(declare-fun b!1381713 () Bool)

(declare-fun res!923386 () Bool)

(declare-fun e!783231 () Bool)

(assert (=> b!1381713 (=> (not res!923386) (not e!783231))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94291 0))(
  ( (array!94292 (arr!45528 (Array (_ BitVec 32) (_ BitVec 64))) (size!46080 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94291)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381713 (= res!923386 (and (= (size!46080 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46080 a!2971))))))

(declare-fun res!923387 () Bool)

(assert (=> start!117948 (=> (not res!923387) (not e!783231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117948 (= res!923387 (validMask!0 mask!3034))))

(assert (=> start!117948 e!783231))

(assert (=> start!117948 true))

(declare-fun array_inv!34761 (array!94291) Bool)

(assert (=> start!117948 (array_inv!34761 a!2971)))

(declare-fun b!1381715 () Bool)

(declare-fun res!923385 () Bool)

(assert (=> b!1381715 (=> (not res!923385) (not e!783231))))

(declare-datatypes ((List!32140 0))(
  ( (Nil!32137) (Cons!32136 (h!33345 (_ BitVec 64)) (t!46826 List!32140)) )
))
(declare-fun arrayNoDuplicates!0 (array!94291 (_ BitVec 32) List!32140) Bool)

(assert (=> b!1381715 (= res!923385 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32137))))

(declare-fun b!1381714 () Bool)

(declare-fun res!923384 () Bool)

(assert (=> b!1381714 (=> (not res!923384) (not e!783231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381714 (= res!923384 (validKeyInArray!0 (select (arr!45528 a!2971) i!1094)))))

(declare-fun b!1381716 () Bool)

(assert (=> b!1381716 (= e!783231 false)))

(declare-fun lt!608102 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94291 (_ BitVec 32)) Bool)

(assert (=> b!1381716 (= lt!608102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117948 res!923387) b!1381713))

(assert (= (and b!1381713 res!923386) b!1381714))

(assert (= (and b!1381714 res!923384) b!1381715))

(assert (= (and b!1381715 res!923385) b!1381716))

(declare-fun m!1266459 () Bool)

(assert (=> start!117948 m!1266459))

(declare-fun m!1266461 () Bool)

(assert (=> start!117948 m!1266461))

(declare-fun m!1266463 () Bool)

(assert (=> b!1381715 m!1266463))

(declare-fun m!1266465 () Bool)

(assert (=> b!1381714 m!1266465))

(assert (=> b!1381714 m!1266465))

(declare-fun m!1266467 () Bool)

(assert (=> b!1381714 m!1266467))

(declare-fun m!1266469 () Bool)

(assert (=> b!1381716 m!1266469))

(push 1)

(assert (not b!1381714))

(assert (not start!117948))

(assert (not b!1381715))

(assert (not b!1381716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

