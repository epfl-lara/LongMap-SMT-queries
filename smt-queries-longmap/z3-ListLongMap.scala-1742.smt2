; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31958 () Bool)

(assert start!31958)

(declare-fun b!319086 () Bool)

(declare-fun res!173616 () Bool)

(declare-fun e!198188 () Bool)

(assert (=> b!319086 (=> (not res!173616) (not e!198188))))

(declare-datatypes ((array!16269 0))(
  ( (array!16270 (arr!7698 (Array (_ BitVec 32) (_ BitVec 64))) (size!8051 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16269)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319086 (= res!173616 (and (= (size!8051 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8051 a!3305))))))

(declare-fun b!319088 () Bool)

(declare-fun res!173617 () Bool)

(assert (=> b!319088 (=> (not res!173617) (not e!198188))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319088 (= res!173617 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173618 () Bool)

(assert (=> start!31958 (=> (not res!173618) (not e!198188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31958 (= res!173618 (validMask!0 mask!3777))))

(assert (=> start!31958 e!198188))

(assert (=> start!31958 true))

(declare-fun array_inv!5670 (array!16269) Bool)

(assert (=> start!31958 (array_inv!5670 a!3305)))

(declare-fun b!319089 () Bool)

(assert (=> b!319089 (= e!198188 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319087 () Bool)

(declare-fun res!173619 () Bool)

(assert (=> b!319087 (=> (not res!173619) (not e!198188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319087 (= res!173619 (validKeyInArray!0 k0!2497))))

(assert (= (and start!31958 res!173618) b!319086))

(assert (= (and b!319086 res!173616) b!319087))

(assert (= (and b!319087 res!173619) b!319088))

(assert (= (and b!319088 res!173617) b!319089))

(declare-fun m!327253 () Bool)

(assert (=> b!319088 m!327253))

(declare-fun m!327255 () Bool)

(assert (=> start!31958 m!327255))

(declare-fun m!327257 () Bool)

(assert (=> start!31958 m!327257))

(declare-fun m!327259 () Bool)

(assert (=> b!319087 m!327259))

(check-sat (not b!319088) (not b!319087) (not start!31958))
(check-sat)
