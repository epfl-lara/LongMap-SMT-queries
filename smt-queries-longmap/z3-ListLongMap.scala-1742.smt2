; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31958 () Bool)

(assert start!31958)

(declare-fun b!319310 () Bool)

(declare-fun res!173743 () Bool)

(declare-fun e!198329 () Bool)

(assert (=> b!319310 (=> (not res!173743) (not e!198329))))

(declare-datatypes ((array!16278 0))(
  ( (array!16279 (arr!7702 (Array (_ BitVec 32) (_ BitVec 64))) (size!8054 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16278)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319310 (= res!173743 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173742 () Bool)

(assert (=> start!31958 (=> (not res!173742) (not e!198329))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31958 (= res!173742 (validMask!0 mask!3777))))

(assert (=> start!31958 e!198329))

(assert (=> start!31958 true))

(declare-fun array_inv!5652 (array!16278) Bool)

(assert (=> start!31958 (array_inv!5652 a!3305)))

(declare-fun b!319311 () Bool)

(assert (=> b!319311 (= e!198329 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319308 () Bool)

(declare-fun res!173745 () Bool)

(assert (=> b!319308 (=> (not res!173745) (not e!198329))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319308 (= res!173745 (and (= (size!8054 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8054 a!3305))))))

(declare-fun b!319309 () Bool)

(declare-fun res!173744 () Bool)

(assert (=> b!319309 (=> (not res!173744) (not e!198329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319309 (= res!173744 (validKeyInArray!0 k0!2497))))

(assert (= (and start!31958 res!173742) b!319308))

(assert (= (and b!319308 res!173745) b!319309))

(assert (= (and b!319309 res!173744) b!319310))

(assert (= (and b!319310 res!173743) b!319311))

(declare-fun m!328159 () Bool)

(assert (=> b!319310 m!328159))

(declare-fun m!328161 () Bool)

(assert (=> start!31958 m!328161))

(declare-fun m!328163 () Bool)

(assert (=> start!31958 m!328163))

(declare-fun m!328165 () Bool)

(assert (=> b!319309 m!328165))

(check-sat (not b!319310) (not b!319309) (not start!31958))
(check-sat)
