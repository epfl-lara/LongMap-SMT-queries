; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62324 () Bool)

(assert start!62324)

(declare-fun b!697971 () Bool)

(declare-fun e!396802 () Bool)

(assert (=> b!697971 (= e!396802 false)))

(declare-fun lt!316989 () Bool)

(declare-datatypes ((List!13243 0))(
  ( (Nil!13240) (Cons!13239 (h!14284 (_ BitVec 64)) (t!19516 List!13243)) )
))
(declare-fun acc!652 () List!13243)

(declare-fun contains!3765 (List!13243 (_ BitVec 64)) Bool)

(assert (=> b!697971 (= lt!316989 (contains!3765 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697970 () Bool)

(declare-fun res!461938 () Bool)

(assert (=> b!697970 (=> (not res!461938) (not e!396802))))

(assert (=> b!697970 (= res!461938 (not (contains!3765 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697969 () Bool)

(declare-fun res!461940 () Bool)

(assert (=> b!697969 (=> (not res!461940) (not e!396802))))

(declare-fun newAcc!49 () List!13243)

(declare-fun noDuplicate!1034 (List!13243) Bool)

(assert (=> b!697969 (= res!461940 (noDuplicate!1034 newAcc!49))))

(declare-fun b!697968 () Bool)

(declare-fun res!461939 () Bool)

(assert (=> b!697968 (=> (not res!461939) (not e!396802))))

(assert (=> b!697968 (= res!461939 (noDuplicate!1034 acc!652))))

(declare-fun res!461941 () Bool)

(assert (=> start!62324 (=> (not res!461941) (not e!396802))))

(declare-datatypes ((array!40014 0))(
  ( (array!40015 (arr!19163 (Array (_ BitVec 32) (_ BitVec 64))) (size!19545 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40014)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62324 (= res!461941 (and (bvslt (size!19545 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19545 a!3591))))))

(assert (=> start!62324 e!396802))

(declare-fun array_inv!15046 (array!40014) Bool)

(assert (=> start!62324 (array_inv!15046 a!3591)))

(assert (=> start!62324 true))

(assert (= (and start!62324 res!461941) b!697968))

(assert (= (and b!697968 res!461939) b!697969))

(assert (= (and b!697969 res!461940) b!697970))

(assert (= (and b!697970 res!461938) b!697971))

(declare-fun m!657801 () Bool)

(assert (=> b!697969 m!657801))

(declare-fun m!657803 () Bool)

(assert (=> b!697971 m!657803))

(declare-fun m!657805 () Bool)

(assert (=> start!62324 m!657805))

(declare-fun m!657807 () Bool)

(assert (=> b!697970 m!657807))

(declare-fun m!657809 () Bool)

(assert (=> b!697968 m!657809))

(check-sat (not b!697970) (not b!697969) (not b!697968) (not b!697971) (not start!62324))
(check-sat)
