; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116278 () Bool)

(assert start!116278)

(declare-fun res!916099 () Bool)

(declare-fun e!777678 () Bool)

(assert (=> start!116278 (=> (not res!916099) (not e!777678))))

(declare-datatypes ((array!93054 0))(
  ( (array!93055 (arr!44938 (Array (_ BitVec 32) (_ BitVec 64))) (size!45490 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93054)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116278 (= res!916099 (and (bvslt (size!45490 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45490 a!3861))))))

(assert (=> start!116278 e!777678))

(declare-fun array_inv!34171 (array!93054) Bool)

(assert (=> start!116278 (array_inv!34171 a!3861)))

(assert (=> start!116278 true))

(declare-fun b!1372786 () Bool)

(declare-fun res!916103 () Bool)

(assert (=> b!1372786 (=> (not res!916103) (not e!777678))))

(declare-datatypes ((List!32084 0))(
  ( (Nil!32081) (Cons!32080 (h!33289 (_ BitVec 64)) (t!46770 List!32084)) )
))
(declare-fun newAcc!98 () List!32084)

(declare-fun contains!9677 (List!32084 (_ BitVec 64)) Bool)

(assert (=> b!1372786 (= res!916103 (not (contains!9677 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372787 () Bool)

(declare-fun res!916102 () Bool)

(assert (=> b!1372787 (=> (not res!916102) (not e!777678))))

(declare-fun acc!866 () List!32084)

(declare-fun subseq!1115 (List!32084 List!32084) Bool)

(assert (=> b!1372787 (= res!916102 (subseq!1115 newAcc!98 acc!866))))

(declare-fun b!1372788 () Bool)

(declare-fun res!916101 () Bool)

(assert (=> b!1372788 (=> (not res!916101) (not e!777678))))

(assert (=> b!1372788 (= res!916101 (not (contains!9677 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372789 () Bool)

(declare-fun res!916097 () Bool)

(assert (=> b!1372789 (=> (not res!916097) (not e!777678))))

(assert (=> b!1372789 (= res!916097 (not (contains!9677 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372790 () Bool)

(declare-fun res!916098 () Bool)

(assert (=> b!1372790 (=> (not res!916098) (not e!777678))))

(declare-fun noDuplicate!2592 (List!32084) Bool)

(assert (=> b!1372790 (= res!916098 (noDuplicate!2592 acc!866))))

(declare-fun b!1372791 () Bool)

(assert (=> b!1372791 (= e!777678 false)))

(declare-fun lt!602771 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93054 (_ BitVec 32) List!32084) Bool)

(assert (=> b!1372791 (= lt!602771 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45204 0))(
  ( (Unit!45205) )
))
(declare-fun lt!602772 () Unit!45204)

(declare-fun noDuplicateSubseq!302 (List!32084 List!32084) Unit!45204)

(assert (=> b!1372791 (= lt!602772 (noDuplicateSubseq!302 newAcc!98 acc!866))))

(declare-fun b!1372792 () Bool)

(declare-fun res!916100 () Bool)

(assert (=> b!1372792 (=> (not res!916100) (not e!777678))))

(assert (=> b!1372792 (= res!916100 (not (contains!9677 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116278 res!916099) b!1372790))

(assert (= (and b!1372790 res!916098) b!1372792))

(assert (= (and b!1372792 res!916100) b!1372789))

(assert (= (and b!1372789 res!916097) b!1372786))

(assert (= (and b!1372786 res!916103) b!1372788))

(assert (= (and b!1372788 res!916101) b!1372787))

(assert (= (and b!1372787 res!916102) b!1372791))

(declare-fun m!1255707 () Bool)

(assert (=> b!1372791 m!1255707))

(declare-fun m!1255709 () Bool)

(assert (=> b!1372791 m!1255709))

(declare-fun m!1255711 () Bool)

(assert (=> start!116278 m!1255711))

(declare-fun m!1255713 () Bool)

(assert (=> b!1372788 m!1255713))

(declare-fun m!1255715 () Bool)

(assert (=> b!1372790 m!1255715))

(declare-fun m!1255717 () Bool)

(assert (=> b!1372787 m!1255717))

(declare-fun m!1255719 () Bool)

(assert (=> b!1372789 m!1255719))

(declare-fun m!1255721 () Bool)

(assert (=> b!1372792 m!1255721))

(declare-fun m!1255723 () Bool)

(assert (=> b!1372786 m!1255723))

(check-sat (not b!1372791) (not b!1372790) (not b!1372789) (not start!116278) (not b!1372792) (not b!1372788) (not b!1372786) (not b!1372787))
(check-sat)
