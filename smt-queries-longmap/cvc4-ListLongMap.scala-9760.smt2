; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115686 () Bool)

(assert start!115686)

(declare-fun b!1367850 () Bool)

(declare-fun e!775173 () Bool)

(assert (=> b!1367850 (= e!775173 false)))

(declare-datatypes ((array!92878 0))(
  ( (array!92879 (arr!44863 (Array (_ BitVec 32) (_ BitVec 64))) (size!45413 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92878)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!601959 () Bool)

(declare-datatypes ((List!31931 0))(
  ( (Nil!31928) (Cons!31927 (h!33136 (_ BitVec 64)) (t!46625 List!31931)) )
))
(declare-fun acc!866 () List!31931)

(declare-fun arrayNoDuplicates!0 (array!92878 (_ BitVec 32) List!31931) Bool)

(assert (=> b!1367850 (= lt!601959 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367851 () Bool)

(declare-fun res!911367 () Bool)

(declare-fun e!775174 () Bool)

(assert (=> b!1367851 (=> (not res!911367) (not e!775174))))

(declare-fun contains!9613 (List!31931 (_ BitVec 64)) Bool)

(assert (=> b!1367851 (= res!911367 (not (contains!9613 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367852 () Bool)

(assert (=> b!1367852 (= e!775174 e!775173)))

(declare-fun res!911362 () Bool)

(assert (=> b!1367852 (=> (not res!911362) (not e!775173))))

(assert (=> b!1367852 (= res!911362 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45163 0))(
  ( (Unit!45164) )
))
(declare-fun lt!601960 () Unit!45163)

(declare-fun newAcc!98 () List!31931)

(declare-fun noDuplicateSubseq!202 (List!31931 List!31931) Unit!45163)

(assert (=> b!1367852 (= lt!601960 (noDuplicateSubseq!202 newAcc!98 acc!866))))

(declare-fun b!1367853 () Bool)

(declare-fun res!911365 () Bool)

(assert (=> b!1367853 (=> (not res!911365) (not e!775174))))

(assert (=> b!1367853 (= res!911365 (not (contains!9613 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367854 () Bool)

(declare-fun res!911366 () Bool)

(assert (=> b!1367854 (=> (not res!911366) (not e!775174))))

(assert (=> b!1367854 (= res!911366 (not (contains!9613 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911360 () Bool)

(assert (=> start!115686 (=> (not res!911360) (not e!775174))))

(assert (=> start!115686 (= res!911360 (and (bvslt (size!45413 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45413 a!3861))))))

(assert (=> start!115686 e!775174))

(declare-fun array_inv!33891 (array!92878) Bool)

(assert (=> start!115686 (array_inv!33891 a!3861)))

(assert (=> start!115686 true))

(declare-fun b!1367855 () Bool)

(declare-fun res!911368 () Bool)

(assert (=> b!1367855 (=> (not res!911368) (not e!775174))))

(declare-fun subseq!1015 (List!31931 List!31931) Bool)

(assert (=> b!1367855 (= res!911368 (subseq!1015 newAcc!98 acc!866))))

(declare-fun b!1367856 () Bool)

(declare-fun res!911359 () Bool)

(assert (=> b!1367856 (=> (not res!911359) (not e!775173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367856 (= res!911359 (not (validKeyInArray!0 (select (arr!44863 a!3861) from!3239))))))

(declare-fun b!1367857 () Bool)

(declare-fun res!911358 () Bool)

(assert (=> b!1367857 (=> (not res!911358) (not e!775173))))

(assert (=> b!1367857 (= res!911358 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367858 () Bool)

(declare-fun res!911364 () Bool)

(assert (=> b!1367858 (=> (not res!911364) (not e!775174))))

(assert (=> b!1367858 (= res!911364 (not (contains!9613 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367859 () Bool)

(declare-fun res!911363 () Bool)

(assert (=> b!1367859 (=> (not res!911363) (not e!775173))))

(assert (=> b!1367859 (= res!911363 (bvslt from!3239 (size!45413 a!3861)))))

(declare-fun b!1367860 () Bool)

(declare-fun res!911361 () Bool)

(assert (=> b!1367860 (=> (not res!911361) (not e!775174))))

(declare-fun noDuplicate!2470 (List!31931) Bool)

(assert (=> b!1367860 (= res!911361 (noDuplicate!2470 acc!866))))

(assert (= (and start!115686 res!911360) b!1367860))

(assert (= (and b!1367860 res!911361) b!1367851))

(assert (= (and b!1367851 res!911367) b!1367858))

(assert (= (and b!1367858 res!911364) b!1367853))

(assert (= (and b!1367853 res!911365) b!1367854))

(assert (= (and b!1367854 res!911366) b!1367855))

(assert (= (and b!1367855 res!911368) b!1367852))

(assert (= (and b!1367852 res!911362) b!1367859))

(assert (= (and b!1367859 res!911363) b!1367856))

(assert (= (and b!1367856 res!911359) b!1367857))

(assert (= (and b!1367857 res!911358) b!1367850))

(declare-fun m!1251979 () Bool)

(assert (=> b!1367853 m!1251979))

(declare-fun m!1251981 () Bool)

(assert (=> start!115686 m!1251981))

(declare-fun m!1251983 () Bool)

(assert (=> b!1367852 m!1251983))

(declare-fun m!1251985 () Bool)

(assert (=> b!1367852 m!1251985))

(declare-fun m!1251987 () Bool)

(assert (=> b!1367858 m!1251987))

(declare-fun m!1251989 () Bool)

(assert (=> b!1367854 m!1251989))

(declare-fun m!1251991 () Bool)

(assert (=> b!1367860 m!1251991))

(declare-fun m!1251993 () Bool)

(assert (=> b!1367855 m!1251993))

(declare-fun m!1251995 () Bool)

(assert (=> b!1367851 m!1251995))

(declare-fun m!1251997 () Bool)

(assert (=> b!1367850 m!1251997))

(declare-fun m!1251999 () Bool)

(assert (=> b!1367856 m!1251999))

(assert (=> b!1367856 m!1251999))

(declare-fun m!1252001 () Bool)

(assert (=> b!1367856 m!1252001))

(push 1)

(assert (not start!115686))

(assert (not b!1367858))

(assert (not b!1367854))

