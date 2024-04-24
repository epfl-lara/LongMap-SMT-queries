; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85838 () Bool)

(assert start!85838)

(declare-fun b!995306 () Bool)

(declare-fun res!665248 () Bool)

(declare-fun e!561795 () Bool)

(assert (=> b!995306 (=> (not res!665248) (not e!561795))))

(declare-datatypes ((array!62927 0))(
  ( (array!62928 (arr!30298 (Array (_ BitVec 32) (_ BitVec 64))) (size!30801 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62927)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995306 (= res!665248 (validKeyInArray!0 (select (arr!30298 a!3219) j!170)))))

(declare-fun b!995308 () Bool)

(assert (=> b!995308 (= e!561795 (bvsge #b00000000000000000000000000000000 (size!30801 a!3219)))))

(declare-fun b!995307 () Bool)

(declare-fun res!665249 () Bool)

(assert (=> b!995307 (=> (not res!665249) (not e!561795))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!995307 (= res!665249 (validKeyInArray!0 k0!2224))))

(declare-fun res!665246 () Bool)

(assert (=> start!85838 (=> (not res!665246) (not e!561795))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85838 (= res!665246 (validMask!0 mask!3464))))

(assert (=> start!85838 e!561795))

(declare-fun array_inv!23434 (array!62927) Bool)

(assert (=> start!85838 (array_inv!23434 a!3219)))

(assert (=> start!85838 true))

(declare-fun b!995305 () Bool)

(declare-fun res!665247 () Bool)

(assert (=> b!995305 (=> (not res!665247) (not e!561795))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995305 (= res!665247 (and (= (size!30801 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30801 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30801 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85838 res!665246) b!995305))

(assert (= (and b!995305 res!665247) b!995306))

(assert (= (and b!995306 res!665248) b!995307))

(assert (= (and b!995307 res!665249) b!995308))

(declare-fun m!923309 () Bool)

(assert (=> b!995306 m!923309))

(assert (=> b!995306 m!923309))

(declare-fun m!923311 () Bool)

(assert (=> b!995306 m!923311))

(declare-fun m!923313 () Bool)

(assert (=> b!995307 m!923313))

(declare-fun m!923315 () Bool)

(assert (=> start!85838 m!923315))

(declare-fun m!923317 () Bool)

(assert (=> start!85838 m!923317))

(check-sat (not b!995306) (not b!995307) (not start!85838))
(check-sat)
