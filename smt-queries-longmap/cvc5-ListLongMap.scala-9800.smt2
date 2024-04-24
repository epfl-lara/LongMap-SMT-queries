; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116678 () Bool)

(assert start!116678)

(declare-fun b!1375204 () Bool)

(declare-fun res!917609 () Bool)

(declare-fun e!779175 () Bool)

(assert (=> b!1375204 (=> (not res!917609) (not e!779175))))

(declare-datatypes ((array!93269 0))(
  ( (array!93270 (arr!45036 (Array (_ BitVec 32) (_ BitVec 64))) (size!45587 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93269)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375204 (= res!917609 (validKeyInArray!0 (select (arr!45036 a!4142) i!1457)))))

(declare-fun b!1375207 () Bool)

(assert (=> b!1375207 (= e!779175 false)))

(declare-fun lt!603617 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375207 (= lt!603617 (arrayCountValidKeys!0 (array!93270 (store (arr!45036 a!4142) i!1457 k!2959) (size!45587 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603618 () (_ BitVec 32))

(assert (=> b!1375207 (= lt!603618 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375206 () Bool)

(declare-fun res!917607 () Bool)

(assert (=> b!1375206 (=> (not res!917607) (not e!779175))))

(assert (=> b!1375206 (= res!917607 (and (bvslt (size!45587 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45587 a!4142))))))

(declare-fun res!917610 () Bool)

(assert (=> start!116678 (=> (not res!917610) (not e!779175))))

(assert (=> start!116678 (= res!917610 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45587 a!4142))))))

(assert (=> start!116678 e!779175))

(assert (=> start!116678 true))

(declare-fun array_inv!34317 (array!93269) Bool)

(assert (=> start!116678 (array_inv!34317 a!4142)))

(declare-fun b!1375205 () Bool)

(declare-fun res!917608 () Bool)

(assert (=> b!1375205 (=> (not res!917608) (not e!779175))))

(assert (=> b!1375205 (= res!917608 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116678 res!917610) b!1375204))

(assert (= (and b!1375204 res!917609) b!1375205))

(assert (= (and b!1375205 res!917608) b!1375206))

(assert (= (and b!1375206 res!917607) b!1375207))

(declare-fun m!1258685 () Bool)

(assert (=> b!1375204 m!1258685))

(assert (=> b!1375204 m!1258685))

(declare-fun m!1258687 () Bool)

(assert (=> b!1375204 m!1258687))

(declare-fun m!1258689 () Bool)

(assert (=> b!1375207 m!1258689))

(declare-fun m!1258691 () Bool)

(assert (=> b!1375207 m!1258691))

(declare-fun m!1258693 () Bool)

(assert (=> b!1375207 m!1258693))

(declare-fun m!1258695 () Bool)

(assert (=> start!116678 m!1258695))

(declare-fun m!1258697 () Bool)

(assert (=> b!1375205 m!1258697))

(push 1)

(assert (not b!1375207))

(assert (not b!1375205))

(assert (not b!1375204))

(assert (not start!116678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

