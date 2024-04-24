; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31932 () Bool)

(assert start!31932)

(declare-fun res!173688 () Bool)

(declare-fun e!198293 () Bool)

(assert (=> start!31932 (=> (not res!173688) (not e!198293))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31932 (= res!173688 (validMask!0 mask!3777))))

(assert (=> start!31932 e!198293))

(assert (=> start!31932 true))

(declare-datatypes ((array!16265 0))(
  ( (array!16266 (arr!7696 (Array (_ BitVec 32) (_ BitVec 64))) (size!8048 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16265)

(declare-fun array_inv!5646 (array!16265) Bool)

(assert (=> start!31932 (array_inv!5646 a!3305)))

(declare-fun b!319252 () Bool)

(declare-fun res!173686 () Bool)

(assert (=> b!319252 (=> (not res!173686) (not e!198293))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319252 (= res!173686 (and (= (size!8048 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8048 a!3305))))))

(declare-fun b!319253 () Bool)

(declare-fun res!173687 () Bool)

(assert (=> b!319253 (=> (not res!173687) (not e!198293))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319253 (= res!173687 (validKeyInArray!0 k0!2497))))

(declare-fun b!319254 () Bool)

(assert (=> b!319254 (= e!198293 (bvsge #b00000000000000000000000000000000 (size!8048 a!3305)))))

(assert (= (and start!31932 res!173688) b!319252))

(assert (= (and b!319252 res!173686) b!319253))

(assert (= (and b!319253 res!173687) b!319254))

(declare-fun m!328123 () Bool)

(assert (=> start!31932 m!328123))

(declare-fun m!328125 () Bool)

(assert (=> start!31932 m!328125))

(declare-fun m!328127 () Bool)

(assert (=> b!319253 m!328127))

(check-sat (not b!319253) (not start!31932))
(check-sat)
