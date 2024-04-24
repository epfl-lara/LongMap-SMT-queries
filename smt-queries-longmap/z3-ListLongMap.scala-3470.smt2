; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48140 () Bool)

(assert start!48140)

(declare-fun b!530362 () Bool)

(declare-fun e!309011 () Bool)

(declare-datatypes ((array!33577 0))(
  ( (array!33578 (arr!16135 (Array (_ BitVec 32) (_ BitVec 64))) (size!16499 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33577)

(assert (=> b!530362 (= e!309011 (bvsge #b00000000000000000000000000000000 (size!16499 a!3154)))))

(declare-fun b!530359 () Bool)

(declare-fun res!326122 () Bool)

(assert (=> b!530359 (=> (not res!326122) (not e!309011))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530359 (= res!326122 (and (= (size!16499 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16499 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16499 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530361 () Bool)

(declare-fun res!326119 () Bool)

(assert (=> b!530361 (=> (not res!326119) (not e!309011))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530361 (= res!326119 (validKeyInArray!0 k0!1998))))

(declare-fun res!326121 () Bool)

(assert (=> start!48140 (=> (not res!326121) (not e!309011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48140 (= res!326121 (validMask!0 mask!3216))))

(assert (=> start!48140 e!309011))

(assert (=> start!48140 true))

(declare-fun array_inv!11994 (array!33577) Bool)

(assert (=> start!48140 (array_inv!11994 a!3154)))

(declare-fun b!530360 () Bool)

(declare-fun res!326120 () Bool)

(assert (=> b!530360 (=> (not res!326120) (not e!309011))))

(assert (=> b!530360 (= res!326120 (validKeyInArray!0 (select (arr!16135 a!3154) j!147)))))

(assert (= (and start!48140 res!326121) b!530359))

(assert (= (and b!530359 res!326122) b!530360))

(assert (= (and b!530360 res!326120) b!530361))

(assert (= (and b!530361 res!326119) b!530362))

(declare-fun m!511201 () Bool)

(assert (=> b!530361 m!511201))

(declare-fun m!511203 () Bool)

(assert (=> start!48140 m!511203))

(declare-fun m!511205 () Bool)

(assert (=> start!48140 m!511205))

(declare-fun m!511207 () Bool)

(assert (=> b!530360 m!511207))

(assert (=> b!530360 m!511207))

(declare-fun m!511209 () Bool)

(assert (=> b!530360 m!511209))

(check-sat (not b!530361) (not b!530360) (not start!48140))
(check-sat)
