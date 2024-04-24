; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114884 () Bool)

(assert start!114884)

(declare-fun b!1361433 () Bool)

(declare-fun res!905004 () Bool)

(declare-fun e!772573 () Bool)

(assert (=> b!1361433 (=> (not res!905004) (not e!772573))))

(declare-datatypes ((array!92663 0))(
  ( (array!92664 (arr!44766 (Array (_ BitVec 32) (_ BitVec 64))) (size!45317 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92663)

(declare-datatypes ((List!31794 0))(
  ( (Nil!31791) (Cons!31790 (h!33008 (_ BitVec 64)) (t!46462 List!31794)) )
))
(declare-fun arrayNoDuplicates!0 (array!92663 (_ BitVec 32) List!31794) Bool)

(assert (=> b!1361433 (= res!905004 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31791))))

(declare-fun b!1361434 () Bool)

(declare-fun res!905003 () Bool)

(assert (=> b!1361434 (=> (not res!905003) (not e!772573))))

(declare-fun acc!759 () List!31794)

(declare-fun contains!9506 (List!31794 (_ BitVec 64)) Bool)

(assert (=> b!1361434 (= res!905003 (not (contains!9506 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361435 () Bool)

(declare-datatypes ((Unit!44738 0))(
  ( (Unit!44739) )
))
(declare-fun e!772571 () Unit!44738)

(declare-fun lt!600275 () Unit!44738)

(assert (=> b!1361435 (= e!772571 lt!600275)))

(declare-fun lt!600274 () Unit!44738)

(declare-fun lemmaListSubSeqRefl!0 (List!31794) Unit!44738)

(assert (=> b!1361435 (= lt!600274 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!865 (List!31794 List!31794) Bool)

(assert (=> b!1361435 (subseq!865 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92663 List!31794 List!31794 (_ BitVec 32)) Unit!44738)

(declare-fun $colon$colon!867 (List!31794 (_ BitVec 64)) List!31794)

(assert (=> b!1361435 (= lt!600275 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!867 acc!759 (select (arr!44766 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361435 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361436 () Bool)

(declare-fun Unit!44740 () Unit!44738)

(assert (=> b!1361436 (= e!772571 Unit!44740)))

(declare-fun b!1361437 () Bool)

(declare-fun res!905006 () Bool)

(assert (=> b!1361437 (=> (not res!905006) (not e!772573))))

(assert (=> b!1361437 (= res!905006 (not (contains!9506 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361439 () Bool)

(assert (=> b!1361439 (= e!772573 false)))

(declare-fun lt!600276 () Unit!44738)

(assert (=> b!1361439 (= lt!600276 e!772571)))

(declare-fun c!127663 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361439 (= c!127663 (validKeyInArray!0 (select (arr!44766 a!3742) from!3120)))))

(declare-fun b!1361440 () Bool)

(declare-fun res!905009 () Bool)

(assert (=> b!1361440 (=> (not res!905009) (not e!772573))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361440 (= res!905009 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361441 () Bool)

(declare-fun res!905005 () Bool)

(assert (=> b!1361441 (=> (not res!905005) (not e!772573))))

(assert (=> b!1361441 (= res!905005 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361442 () Bool)

(declare-fun res!905002 () Bool)

(assert (=> b!1361442 (=> (not res!905002) (not e!772573))))

(assert (=> b!1361442 (= res!905002 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45317 a!3742)))))

(declare-fun b!1361443 () Bool)

(declare-fun res!905010 () Bool)

(assert (=> b!1361443 (=> (not res!905010) (not e!772573))))

(declare-fun noDuplicate!2337 (List!31794) Bool)

(assert (=> b!1361443 (= res!905010 (noDuplicate!2337 acc!759))))

(declare-fun b!1361438 () Bool)

(declare-fun res!905007 () Bool)

(assert (=> b!1361438 (=> (not res!905007) (not e!772573))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361438 (= res!905007 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45317 a!3742))))))

(declare-fun res!905008 () Bool)

(assert (=> start!114884 (=> (not res!905008) (not e!772573))))

(assert (=> start!114884 (= res!905008 (and (bvslt (size!45317 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45317 a!3742))))))

(assert (=> start!114884 e!772573))

(assert (=> start!114884 true))

(declare-fun array_inv!34047 (array!92663) Bool)

(assert (=> start!114884 (array_inv!34047 a!3742)))

(assert (= (and start!114884 res!905008) b!1361443))

(assert (= (and b!1361443 res!905010) b!1361434))

(assert (= (and b!1361434 res!905003) b!1361437))

(assert (= (and b!1361437 res!905006) b!1361433))

(assert (= (and b!1361433 res!905004) b!1361441))

(assert (= (and b!1361441 res!905005) b!1361438))

(assert (= (and b!1361438 res!905007) b!1361440))

(assert (= (and b!1361440 res!905009) b!1361442))

(assert (= (and b!1361442 res!905002) b!1361439))

(assert (= (and b!1361439 c!127663) b!1361435))

(assert (= (and b!1361439 (not c!127663)) b!1361436))

(declare-fun m!1247049 () Bool)

(assert (=> b!1361435 m!1247049))

(declare-fun m!1247051 () Bool)

(assert (=> b!1361435 m!1247051))

(declare-fun m!1247053 () Bool)

(assert (=> b!1361435 m!1247053))

(declare-fun m!1247055 () Bool)

(assert (=> b!1361435 m!1247055))

(declare-fun m!1247057 () Bool)

(assert (=> b!1361435 m!1247057))

(assert (=> b!1361435 m!1247051))

(assert (=> b!1361435 m!1247053))

(declare-fun m!1247059 () Bool)

(assert (=> b!1361435 m!1247059))

(declare-fun m!1247061 () Bool)

(assert (=> b!1361440 m!1247061))

(assert (=> b!1361439 m!1247051))

(assert (=> b!1361439 m!1247051))

(declare-fun m!1247063 () Bool)

(assert (=> b!1361439 m!1247063))

(declare-fun m!1247065 () Bool)

(assert (=> b!1361434 m!1247065))

(declare-fun m!1247067 () Bool)

(assert (=> b!1361433 m!1247067))

(declare-fun m!1247069 () Bool)

(assert (=> start!114884 m!1247069))

(declare-fun m!1247071 () Bool)

(assert (=> b!1361437 m!1247071))

(declare-fun m!1247073 () Bool)

(assert (=> b!1361441 m!1247073))

(declare-fun m!1247075 () Bool)

(assert (=> b!1361443 m!1247075))

(push 1)

(assert (not b!1361437))

(assert (not b!1361439))

(assert (not b!1361443))

(assert (not start!114884))

(assert (not b!1361441))

(assert (not b!1361435))

(assert (not b!1361433))

(assert (not b!1361434))

(assert (not b!1361440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

