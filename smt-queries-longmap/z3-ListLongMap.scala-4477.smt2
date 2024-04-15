; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62318 () Bool)

(assert start!62318)

(declare-fun b!697935 () Bool)

(declare-fun e!396785 () Bool)

(assert (=> b!697935 (= e!396785 false)))

(declare-fun lt!316980 () Bool)

(declare-datatypes ((List!13240 0))(
  ( (Nil!13237) (Cons!13236 (h!14281 (_ BitVec 64)) (t!19513 List!13240)) )
))
(declare-fun acc!652 () List!13240)

(declare-fun contains!3762 (List!13240 (_ BitVec 64)) Bool)

(assert (=> b!697935 (= lt!316980 (contains!3762 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697932 () Bool)

(declare-fun res!461902 () Bool)

(assert (=> b!697932 (=> (not res!461902) (not e!396785))))

(declare-fun noDuplicate!1031 (List!13240) Bool)

(assert (=> b!697932 (= res!461902 (noDuplicate!1031 acc!652))))

(declare-fun res!461904 () Bool)

(assert (=> start!62318 (=> (not res!461904) (not e!396785))))

(declare-datatypes ((array!40008 0))(
  ( (array!40009 (arr!19160 (Array (_ BitVec 32) (_ BitVec 64))) (size!19542 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40008)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62318 (= res!461904 (and (bvslt (size!19542 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19542 a!3591))))))

(assert (=> start!62318 e!396785))

(declare-fun array_inv!15043 (array!40008) Bool)

(assert (=> start!62318 (array_inv!15043 a!3591)))

(assert (=> start!62318 true))

(declare-fun b!697934 () Bool)

(declare-fun res!461903 () Bool)

(assert (=> b!697934 (=> (not res!461903) (not e!396785))))

(assert (=> b!697934 (= res!461903 (not (contains!3762 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697933 () Bool)

(declare-fun res!461905 () Bool)

(assert (=> b!697933 (=> (not res!461905) (not e!396785))))

(declare-fun newAcc!49 () List!13240)

(assert (=> b!697933 (= res!461905 (noDuplicate!1031 newAcc!49))))

(assert (= (and start!62318 res!461904) b!697932))

(assert (= (and b!697932 res!461902) b!697933))

(assert (= (and b!697933 res!461905) b!697934))

(assert (= (and b!697934 res!461903) b!697935))

(declare-fun m!657771 () Bool)

(assert (=> b!697934 m!657771))

(declare-fun m!657773 () Bool)

(assert (=> b!697935 m!657773))

(declare-fun m!657775 () Bool)

(assert (=> b!697933 m!657775))

(declare-fun m!657777 () Bool)

(assert (=> b!697932 m!657777))

(declare-fun m!657779 () Bool)

(assert (=> start!62318 m!657779))

(check-sat (not b!697935) (not b!697932) (not start!62318) (not b!697934) (not b!697933))
(check-sat)
