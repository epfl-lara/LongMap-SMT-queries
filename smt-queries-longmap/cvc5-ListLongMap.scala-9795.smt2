; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116294 () Bool)

(assert start!116294)

(declare-fun b!1372921 () Bool)

(declare-fun res!916193 () Bool)

(declare-fun e!777730 () Bool)

(assert (=> b!1372921 (=> (not res!916193) (not e!777730))))

(declare-datatypes ((List!32034 0))(
  ( (Nil!32031) (Cons!32030 (h!33239 (_ BitVec 64)) (t!46728 List!32034)) )
))
(declare-fun acc!866 () List!32034)

(declare-fun noDuplicate!2573 (List!32034) Bool)

(assert (=> b!1372921 (= res!916193 (noDuplicate!2573 acc!866))))

(declare-fun res!916194 () Bool)

(assert (=> start!116294 (=> (not res!916194) (not e!777730))))

(declare-datatypes ((array!93111 0))(
  ( (array!93112 (arr!44966 (Array (_ BitVec 32) (_ BitVec 64))) (size!45516 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93111)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116294 (= res!916194 (and (bvslt (size!45516 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45516 a!3861))))))

(assert (=> start!116294 e!777730))

(declare-fun array_inv!33994 (array!93111) Bool)

(assert (=> start!116294 (array_inv!33994 a!3861)))

(assert (=> start!116294 true))

(declare-fun b!1372922 () Bool)

(declare-fun res!916191 () Bool)

(assert (=> b!1372922 (=> (not res!916191) (not e!777730))))

(declare-fun newAcc!98 () List!32034)

(declare-fun contains!9716 (List!32034 (_ BitVec 64)) Bool)

(assert (=> b!1372922 (= res!916191 (not (contains!9716 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372923 () Bool)

(declare-fun res!916190 () Bool)

(assert (=> b!1372923 (=> (not res!916190) (not e!777730))))

(assert (=> b!1372923 (= res!916190 (not (contains!9716 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372924 () Bool)

(assert (=> b!1372924 (= e!777730 false)))

(declare-fun lt!602977 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93111 (_ BitVec 32) List!32034) Bool)

(assert (=> b!1372924 (= lt!602977 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45369 0))(
  ( (Unit!45370) )
))
(declare-fun lt!602976 () Unit!45369)

(declare-fun noDuplicateSubseq!305 (List!32034 List!32034) Unit!45369)

(assert (=> b!1372924 (= lt!602976 (noDuplicateSubseq!305 newAcc!98 acc!866))))

(declare-fun b!1372925 () Bool)

(declare-fun res!916189 () Bool)

(assert (=> b!1372925 (=> (not res!916189) (not e!777730))))

(assert (=> b!1372925 (= res!916189 (not (contains!9716 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372926 () Bool)

(declare-fun res!916195 () Bool)

(assert (=> b!1372926 (=> (not res!916195) (not e!777730))))

(declare-fun subseq!1118 (List!32034 List!32034) Bool)

(assert (=> b!1372926 (= res!916195 (subseq!1118 newAcc!98 acc!866))))

(declare-fun b!1372927 () Bool)

(declare-fun res!916192 () Bool)

(assert (=> b!1372927 (=> (not res!916192) (not e!777730))))

(assert (=> b!1372927 (= res!916192 (not (contains!9716 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116294 res!916194) b!1372921))

(assert (= (and b!1372921 res!916193) b!1372925))

(assert (= (and b!1372925 res!916189) b!1372927))

(assert (= (and b!1372927 res!916192) b!1372923))

(assert (= (and b!1372923 res!916190) b!1372922))

(assert (= (and b!1372922 res!916191) b!1372926))

(assert (= (and b!1372926 res!916195) b!1372924))

(declare-fun m!1256287 () Bool)

(assert (=> b!1372924 m!1256287))

(declare-fun m!1256289 () Bool)

(assert (=> b!1372924 m!1256289))

(declare-fun m!1256291 () Bool)

(assert (=> b!1372923 m!1256291))

(declare-fun m!1256293 () Bool)

(assert (=> b!1372922 m!1256293))

(declare-fun m!1256295 () Bool)

(assert (=> start!116294 m!1256295))

(declare-fun m!1256297 () Bool)

(assert (=> b!1372927 m!1256297))

(declare-fun m!1256299 () Bool)

(assert (=> b!1372925 m!1256299))

(declare-fun m!1256301 () Bool)

(assert (=> b!1372926 m!1256301))

(declare-fun m!1256303 () Bool)

(assert (=> b!1372921 m!1256303))

(push 1)

(assert (not b!1372923))

(assert (not b!1372924))

(assert (not b!1372926))

(assert (not b!1372927))

(assert (not b!1372925))

(assert (not b!1372922))

(assert (not b!1372921))

(assert (not start!116294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

