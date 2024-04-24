; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36316 () Bool)

(assert start!36316)

(declare-fun res!202715 () Bool)

(declare-fun e!222572 () Bool)

(assert (=> start!36316 (=> (not res!202715) (not e!222572))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20591 0))(
  ( (array!20592 (arr!9774 (Array (_ BitVec 32) (_ BitVec 64))) (size!10126 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20591)

(assert (=> start!36316 (= res!202715 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10126 a!4289))))))

(assert (=> start!36316 e!222572))

(assert (=> start!36316 true))

(declare-fun array_inv!7246 (array!20591) Bool)

(assert (=> start!36316 (array_inv!7246 a!4289)))

(declare-fun b!363508 () Bool)

(declare-fun res!202716 () Bool)

(assert (=> b!363508 (=> (not res!202716) (not e!222572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363508 (= res!202716 (not (validKeyInArray!0 (select (arr!9774 a!4289) i!1472))))))

(declare-fun b!363509 () Bool)

(declare-fun res!202717 () Bool)

(assert (=> b!363509 (=> (not res!202717) (not e!222572))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363509 (= res!202717 (validKeyInArray!0 k0!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363510 () Bool)

(assert (=> b!363510 (= e!222572 (and (bvslt (size!10126 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10126 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36316 res!202715) b!363508))

(assert (= (and b!363508 res!202716) b!363509))

(assert (= (and b!363509 res!202717) b!363510))

(declare-fun m!360913 () Bool)

(assert (=> start!36316 m!360913))

(declare-fun m!360915 () Bool)

(assert (=> b!363508 m!360915))

(assert (=> b!363508 m!360915))

(declare-fun m!360917 () Bool)

(assert (=> b!363508 m!360917))

(declare-fun m!360919 () Bool)

(assert (=> b!363509 m!360919))

(check-sat (not b!363509) (not b!363508) (not start!36316))
(check-sat)
