; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6992 () Bool)

(assert start!6992)

(declare-datatypes ((array!2985 0))(
  ( (array!2986 (arr!1436 (Array (_ BitVec 32) (_ BitVec 64))) (size!1654 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2985)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6992 (and (bvslt (size!1654 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1654 a!4412)) (= (size!1654 a!4412) size!30) (= a!4412 (array!2986 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1436 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1489) (size!1654 a!4412))))))

(declare-fun array_inv!839 (array!2985) Bool)

(assert (=> start!6992 (array_inv!839 a!4412)))

(assert (=> start!6992 true))

(declare-fun bs!2100 () Bool)

(assert (= bs!2100 start!6992))

(declare-fun m!39643 () Bool)

(assert (=> bs!2100 m!39643))

(declare-fun m!39645 () Bool)

(assert (=> bs!2100 m!39645))

(check-sat (not start!6992))
(check-sat)
