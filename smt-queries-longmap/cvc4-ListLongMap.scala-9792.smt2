; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116280 () Bool)

(assert start!116280)

(declare-fun b!1372774 () Bool)

(declare-fun res!916045 () Bool)

(declare-fun e!777688 () Bool)

(assert (=> b!1372774 (=> (not res!916045) (not e!777688))))

(declare-datatypes ((List!32027 0))(
  ( (Nil!32024) (Cons!32023 (h!33232 (_ BitVec 64)) (t!46721 List!32027)) )
))
(declare-fun newAcc!98 () List!32027)

(declare-fun contains!9709 (List!32027 (_ BitVec 64)) Bool)

(assert (=> b!1372774 (= res!916045 (not (contains!9709 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372775 () Bool)

(declare-fun res!916042 () Bool)

(assert (=> b!1372775 (=> (not res!916042) (not e!777688))))

(declare-fun acc!866 () List!32027)

(declare-fun noDuplicate!2566 (List!32027) Bool)

(assert (=> b!1372775 (= res!916042 (noDuplicate!2566 acc!866))))

(declare-fun res!916048 () Bool)

(assert (=> start!116280 (=> (not res!916048) (not e!777688))))

(declare-datatypes ((array!93097 0))(
  ( (array!93098 (arr!44959 (Array (_ BitVec 32) (_ BitVec 64))) (size!45509 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93097)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116280 (= res!916048 (and (bvslt (size!45509 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45509 a!3861))))))

(assert (=> start!116280 e!777688))

(declare-fun array_inv!33987 (array!93097) Bool)

(assert (=> start!116280 (array_inv!33987 a!3861)))

(assert (=> start!116280 true))

(declare-fun b!1372776 () Bool)

(declare-fun res!916043 () Bool)

(assert (=> b!1372776 (=> (not res!916043) (not e!777688))))

(assert (=> b!1372776 (= res!916043 (not (contains!9709 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372777 () Bool)

(declare-fun res!916047 () Bool)

(assert (=> b!1372777 (=> (not res!916047) (not e!777688))))

(declare-fun subseq!1111 (List!32027 List!32027) Bool)

(assert (=> b!1372777 (= res!916047 (subseq!1111 newAcc!98 acc!866))))

(declare-fun b!1372778 () Bool)

(declare-fun res!916044 () Bool)

(assert (=> b!1372778 (=> (not res!916044) (not e!777688))))

(assert (=> b!1372778 (= res!916044 (not (contains!9709 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372779 () Bool)

(assert (=> b!1372779 (= e!777688 false)))

(declare-fun lt!602934 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93097 (_ BitVec 32) List!32027) Bool)

(assert (=> b!1372779 (= lt!602934 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45355 0))(
  ( (Unit!45356) )
))
(declare-fun lt!602935 () Unit!45355)

(declare-fun noDuplicateSubseq!298 (List!32027 List!32027) Unit!45355)

(assert (=> b!1372779 (= lt!602935 (noDuplicateSubseq!298 newAcc!98 acc!866))))

(declare-fun b!1372780 () Bool)

(declare-fun res!916046 () Bool)

(assert (=> b!1372780 (=> (not res!916046) (not e!777688))))

(assert (=> b!1372780 (= res!916046 (not (contains!9709 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116280 res!916048) b!1372775))

(assert (= (and b!1372775 res!916042) b!1372776))

(assert (= (and b!1372776 res!916043) b!1372780))

(assert (= (and b!1372780 res!916046) b!1372774))

(assert (= (and b!1372774 res!916045) b!1372778))

(assert (= (and b!1372778 res!916044) b!1372777))

(assert (= (and b!1372777 res!916047) b!1372779))

(declare-fun m!1256161 () Bool)

(assert (=> b!1372775 m!1256161))

(declare-fun m!1256163 () Bool)

(assert (=> start!116280 m!1256163))

(declare-fun m!1256165 () Bool)

(assert (=> b!1372777 m!1256165))

(declare-fun m!1256167 () Bool)

(assert (=> b!1372776 m!1256167))

(declare-fun m!1256169 () Bool)

(assert (=> b!1372774 m!1256169))

(declare-fun m!1256171 () Bool)

(assert (=> b!1372779 m!1256171))

(declare-fun m!1256173 () Bool)

(assert (=> b!1372779 m!1256173))

(declare-fun m!1256175 () Bool)

(assert (=> b!1372778 m!1256175))

(declare-fun m!1256177 () Bool)

(assert (=> b!1372780 m!1256177))

(push 1)

(assert (not b!1372779))

(assert (not b!1372780))

(assert (not b!1372778))

(assert (not b!1372774))

(assert (not b!1372777))

(assert (not b!1372775))

(assert (not start!116280))

(assert (not b!1372776))

(check-sat)

(pop 1)

