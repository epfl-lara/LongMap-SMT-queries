; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62330 () Bool)

(assert start!62330)

(declare-fun b!698005 () Bool)

(declare-fun res!461976 () Bool)

(declare-fun e!396821 () Bool)

(assert (=> b!698005 (=> (not res!461976) (not e!396821))))

(declare-datatypes ((List!13246 0))(
  ( (Nil!13243) (Cons!13242 (h!14287 (_ BitVec 64)) (t!19519 List!13246)) )
))
(declare-fun newAcc!49 () List!13246)

(declare-fun noDuplicate!1037 (List!13246) Bool)

(assert (=> b!698005 (= res!461976 (noDuplicate!1037 newAcc!49))))

(declare-fun b!698004 () Bool)

(declare-fun res!461977 () Bool)

(assert (=> b!698004 (=> (not res!461977) (not e!396821))))

(declare-fun acc!652 () List!13246)

(assert (=> b!698004 (= res!461977 (noDuplicate!1037 acc!652))))

(declare-fun b!698007 () Bool)

(assert (=> b!698007 (= e!396821 false)))

(declare-fun lt!316998 () Bool)

(declare-fun contains!3768 (List!13246 (_ BitVec 64)) Bool)

(assert (=> b!698007 (= lt!316998 (contains!3768 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!461975 () Bool)

(assert (=> start!62330 (=> (not res!461975) (not e!396821))))

(declare-datatypes ((array!40020 0))(
  ( (array!40021 (arr!19166 (Array (_ BitVec 32) (_ BitVec 64))) (size!19548 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40020)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62330 (= res!461975 (and (bvslt (size!19548 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19548 a!3591))))))

(assert (=> start!62330 e!396821))

(declare-fun array_inv!15049 (array!40020) Bool)

(assert (=> start!62330 (array_inv!15049 a!3591)))

(assert (=> start!62330 true))

(declare-fun b!698006 () Bool)

(declare-fun res!461974 () Bool)

(assert (=> b!698006 (=> (not res!461974) (not e!396821))))

(assert (=> b!698006 (= res!461974 (not (contains!3768 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62330 res!461975) b!698004))

(assert (= (and b!698004 res!461977) b!698005))

(assert (= (and b!698005 res!461976) b!698006))

(assert (= (and b!698006 res!461974) b!698007))

(declare-fun m!657831 () Bool)

(assert (=> b!698006 m!657831))

(declare-fun m!657833 () Bool)

(assert (=> start!62330 m!657833))

(declare-fun m!657835 () Bool)

(assert (=> b!698005 m!657835))

(declare-fun m!657837 () Bool)

(assert (=> b!698007 m!657837))

(declare-fun m!657839 () Bool)

(assert (=> b!698004 m!657839))

(check-sat (not b!698005) (not b!698006) (not b!698007) (not start!62330) (not b!698004))
(check-sat)
