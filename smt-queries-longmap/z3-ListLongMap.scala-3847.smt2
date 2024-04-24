; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52998 () Bool)

(assert start!52998)

(declare-fun res!365059 () Bool)

(declare-fun e!332045 () Bool)

(assert (=> start!52998 (=> (not res!365059) (not e!332045))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52998 (= res!365059 (validMask!0 mask!3053))))

(assert (=> start!52998 e!332045))

(assert (=> start!52998 true))

(declare-datatypes ((array!35976 0))(
  ( (array!35977 (arr!17266 (Array (_ BitVec 32) (_ BitVec 64))) (size!17630 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35976)

(declare-fun array_inv!13125 (array!35976) Bool)

(assert (=> start!52998 (array_inv!13125 a!2986)))

(declare-fun b!577130 () Bool)

(declare-fun res!365058 () Bool)

(assert (=> b!577130 (=> (not res!365058) (not e!332045))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577130 (= res!365058 (validKeyInArray!0 (select (arr!17266 a!2986) j!136)))))

(declare-fun b!577132 () Bool)

(assert (=> b!577132 (= e!332045 (bvsge #b00000000000000000000000000000000 (size!17630 a!2986)))))

(declare-fun b!577129 () Bool)

(declare-fun res!365056 () Bool)

(assert (=> b!577129 (=> (not res!365056) (not e!332045))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577129 (= res!365056 (and (= (size!17630 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17630 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17630 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577131 () Bool)

(declare-fun res!365057 () Bool)

(assert (=> b!577131 (=> (not res!365057) (not e!332045))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!577131 (= res!365057 (validKeyInArray!0 k0!1786))))

(assert (= (and start!52998 res!365059) b!577129))

(assert (= (and b!577129 res!365056) b!577130))

(assert (= (and b!577130 res!365058) b!577131))

(assert (= (and b!577131 res!365057) b!577132))

(declare-fun m!556217 () Bool)

(assert (=> start!52998 m!556217))

(declare-fun m!556219 () Bool)

(assert (=> start!52998 m!556219))

(declare-fun m!556221 () Bool)

(assert (=> b!577130 m!556221))

(assert (=> b!577130 m!556221))

(declare-fun m!556223 () Bool)

(assert (=> b!577130 m!556223))

(declare-fun m!556225 () Bool)

(assert (=> b!577131 m!556225))

(check-sat (not start!52998) (not b!577130) (not b!577131))
(check-sat)
