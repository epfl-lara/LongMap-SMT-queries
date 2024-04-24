; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48166 () Bool)

(assert start!48166)

(declare-fun b!530433 () Bool)

(declare-fun res!326193 () Bool)

(declare-fun e!309047 () Bool)

(assert (=> b!530433 (=> (not res!326193) (not e!309047))))

(declare-datatypes ((array!33590 0))(
  ( (array!33591 (arr!16141 (Array (_ BitVec 32) (_ BitVec 64))) (size!16505 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33590)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530433 (= res!326193 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530434 () Bool)

(declare-fun res!326195 () Bool)

(assert (=> b!530434 (=> (not res!326195) (not e!309047))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530434 (= res!326195 (and (= (size!16505 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16505 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16505 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326197 () Bool)

(assert (=> start!48166 (=> (not res!326197) (not e!309047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48166 (= res!326197 (validMask!0 mask!3216))))

(assert (=> start!48166 e!309047))

(assert (=> start!48166 true))

(declare-fun array_inv!12000 (array!33590) Bool)

(assert (=> start!48166 (array_inv!12000 a!3154)))

(declare-fun b!530435 () Bool)

(declare-fun res!326194 () Bool)

(assert (=> b!530435 (=> (not res!326194) (not e!309047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530435 (= res!326194 (validKeyInArray!0 (select (arr!16141 a!3154) j!147)))))

(declare-fun b!530436 () Bool)

(assert (=> b!530436 (= e!309047 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530437 () Bool)

(declare-fun res!326196 () Bool)

(assert (=> b!530437 (=> (not res!326196) (not e!309047))))

(assert (=> b!530437 (= res!326196 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48166 res!326197) b!530434))

(assert (= (and b!530434 res!326195) b!530435))

(assert (= (and b!530435 res!326194) b!530437))

(assert (= (and b!530437 res!326196) b!530433))

(assert (= (and b!530433 res!326193) b!530436))

(declare-fun m!511261 () Bool)

(assert (=> b!530433 m!511261))

(declare-fun m!511263 () Bool)

(assert (=> start!48166 m!511263))

(declare-fun m!511265 () Bool)

(assert (=> start!48166 m!511265))

(declare-fun m!511267 () Bool)

(assert (=> b!530435 m!511267))

(assert (=> b!530435 m!511267))

(declare-fun m!511269 () Bool)

(assert (=> b!530435 m!511269))

(declare-fun m!511271 () Bool)

(assert (=> b!530437 m!511271))

(check-sat (not b!530435) (not b!530433) (not start!48166) (not b!530437))
(check-sat)
