; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116270 () Bool)

(assert start!116270)

(declare-fun b!1372669 () Bool)

(declare-fun res!915938 () Bool)

(declare-fun e!777658 () Bool)

(assert (=> b!1372669 (=> (not res!915938) (not e!777658))))

(declare-datatypes ((List!32022 0))(
  ( (Nil!32019) (Cons!32018 (h!33227 (_ BitVec 64)) (t!46716 List!32022)) )
))
(declare-fun acc!866 () List!32022)

(declare-fun noDuplicate!2561 (List!32022) Bool)

(assert (=> b!1372669 (= res!915938 (noDuplicate!2561 acc!866))))

(declare-fun b!1372670 () Bool)

(declare-fun res!915937 () Bool)

(assert (=> b!1372670 (=> (not res!915937) (not e!777658))))

(declare-fun contains!9704 (List!32022 (_ BitVec 64)) Bool)

(assert (=> b!1372670 (= res!915937 (not (contains!9704 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915943 () Bool)

(assert (=> start!116270 (=> (not res!915943) (not e!777658))))

(declare-datatypes ((array!93087 0))(
  ( (array!93088 (arr!44954 (Array (_ BitVec 32) (_ BitVec 64))) (size!45504 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93087)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116270 (= res!915943 (and (bvslt (size!45504 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45504 a!3861))))))

(assert (=> start!116270 e!777658))

(declare-fun array_inv!33982 (array!93087) Bool)

(assert (=> start!116270 (array_inv!33982 a!3861)))

(assert (=> start!116270 true))

(declare-fun b!1372671 () Bool)

(declare-fun res!915940 () Bool)

(assert (=> b!1372671 (=> (not res!915940) (not e!777658))))

(declare-fun newAcc!98 () List!32022)

(assert (=> b!1372671 (= res!915940 (not (contains!9704 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372672 () Bool)

(declare-fun res!915939 () Bool)

(assert (=> b!1372672 (=> (not res!915939) (not e!777658))))

(declare-fun subseq!1106 (List!32022 List!32022) Bool)

(assert (=> b!1372672 (= res!915939 (subseq!1106 newAcc!98 acc!866))))

(declare-fun b!1372673 () Bool)

(declare-fun res!915941 () Bool)

(assert (=> b!1372673 (=> (not res!915941) (not e!777658))))

(assert (=> b!1372673 (= res!915941 (not (contains!9704 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372674 () Bool)

(declare-fun res!915942 () Bool)

(assert (=> b!1372674 (=> (not res!915942) (not e!777658))))

(assert (=> b!1372674 (= res!915942 (not (contains!9704 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372675 () Bool)

(assert (=> b!1372675 (= e!777658 false)))

(declare-fun lt!602905 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93087 (_ BitVec 32) List!32022) Bool)

(assert (=> b!1372675 (= lt!602905 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45345 0))(
  ( (Unit!45346) )
))
(declare-fun lt!602904 () Unit!45345)

(declare-fun noDuplicateSubseq!293 (List!32022 List!32022) Unit!45345)

(assert (=> b!1372675 (= lt!602904 (noDuplicateSubseq!293 newAcc!98 acc!866))))

(assert (= (and start!116270 res!915943) b!1372669))

(assert (= (and b!1372669 res!915938) b!1372670))

(assert (= (and b!1372670 res!915937) b!1372673))

(assert (= (and b!1372673 res!915941) b!1372671))

(assert (= (and b!1372671 res!915940) b!1372674))

(assert (= (and b!1372674 res!915942) b!1372672))

(assert (= (and b!1372672 res!915939) b!1372675))

(declare-fun m!1256071 () Bool)

(assert (=> b!1372672 m!1256071))

(declare-fun m!1256073 () Bool)

(assert (=> start!116270 m!1256073))

(declare-fun m!1256075 () Bool)

(assert (=> b!1372670 m!1256075))

(declare-fun m!1256077 () Bool)

(assert (=> b!1372675 m!1256077))

(declare-fun m!1256079 () Bool)

(assert (=> b!1372675 m!1256079))

(declare-fun m!1256081 () Bool)

(assert (=> b!1372669 m!1256081))

(declare-fun m!1256083 () Bool)

(assert (=> b!1372673 m!1256083))

(declare-fun m!1256085 () Bool)

(assert (=> b!1372671 m!1256085))

(declare-fun m!1256087 () Bool)

(assert (=> b!1372674 m!1256087))

(push 1)

(assert (not b!1372669))

(assert (not b!1372672))

(assert (not b!1372673))

(assert (not b!1372670))

(assert (not start!116270))

(assert (not b!1372671))

(assert (not b!1372675))

(assert (not b!1372674))

(check-sat)

(pop 1)

