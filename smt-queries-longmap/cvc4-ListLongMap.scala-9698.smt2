; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114582 () Bool)

(assert start!114582)

(declare-fun b!1359607 () Bool)

(declare-fun res!904061 () Bool)

(declare-fun e!771459 () Bool)

(assert (=> b!1359607 (=> (not res!904061) (not e!771459))))

(declare-datatypes ((List!31745 0))(
  ( (Nil!31742) (Cons!31741 (h!32950 (_ BitVec 64)) (t!46418 List!31745)) )
))
(declare-fun acc!759 () List!31745)

(declare-fun contains!9454 (List!31745 (_ BitVec 64)) Bool)

(assert (=> b!1359607 (= res!904061 (not (contains!9454 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359608 () Bool)

(declare-fun res!904054 () Bool)

(assert (=> b!1359608 (=> (not res!904054) (not e!771459))))

(declare-fun noDuplicate!2311 (List!31745) Bool)

(assert (=> b!1359608 (= res!904054 (noDuplicate!2311 acc!759))))

(declare-fun res!904059 () Bool)

(assert (=> start!114582 (=> (not res!904059) (not e!771459))))

(declare-datatypes ((array!92527 0))(
  ( (array!92528 (arr!44704 (Array (_ BitVec 32) (_ BitVec 64))) (size!45254 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92527)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114582 (= res!904059 (and (bvslt (size!45254 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45254 a!3742))))))

(assert (=> start!114582 e!771459))

(assert (=> start!114582 true))

(declare-fun array_inv!33732 (array!92527) Bool)

(assert (=> start!114582 (array_inv!33732 a!3742)))

(declare-fun b!1359609 () Bool)

(declare-fun e!771458 () Bool)

(assert (=> b!1359609 (= e!771459 e!771458)))

(declare-fun res!904056 () Bool)

(assert (=> b!1359609 (=> (not res!904056) (not e!771458))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359609 (= res!904056 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44772 0))(
  ( (Unit!44773) )
))
(declare-fun lt!599653 () Unit!44772)

(declare-fun e!771457 () Unit!44772)

(assert (=> b!1359609 (= lt!599653 e!771457)))

(declare-fun c!127217 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359609 (= c!127217 (validKeyInArray!0 (select (arr!44704 a!3742) from!3120)))))

(declare-fun b!1359610 () Bool)

(declare-fun Unit!44774 () Unit!44772)

(assert (=> b!1359610 (= e!771457 Unit!44774)))

(declare-fun b!1359611 () Bool)

(declare-fun res!904060 () Bool)

(assert (=> b!1359611 (=> (not res!904060) (not e!771459))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359611 (= res!904060 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359612 () Bool)

(declare-fun res!904057 () Bool)

(assert (=> b!1359612 (=> (not res!904057) (not e!771459))))

(assert (=> b!1359612 (= res!904057 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45254 a!3742))))))

(declare-fun b!1359613 () Bool)

(declare-fun res!904058 () Bool)

(assert (=> b!1359613 (=> (not res!904058) (not e!771459))))

(declare-fun arrayNoDuplicates!0 (array!92527 (_ BitVec 32) List!31745) Bool)

(assert (=> b!1359613 (= res!904058 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359614 () Bool)

(declare-fun res!904055 () Bool)

(assert (=> b!1359614 (=> (not res!904055) (not e!771458))))

(assert (=> b!1359614 (= res!904055 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359615 () Bool)

(declare-fun lt!599651 () Unit!44772)

(assert (=> b!1359615 (= e!771457 lt!599651)))

(declare-fun lt!599652 () Unit!44772)

(declare-fun lemmaListSubSeqRefl!0 (List!31745) Unit!44772)

(assert (=> b!1359615 (= lt!599652 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!856 (List!31745 List!31745) Bool)

(assert (=> b!1359615 (subseq!856 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92527 List!31745 List!31745 (_ BitVec 32)) Unit!44772)

(declare-fun $colon$colon!859 (List!31745 (_ BitVec 64)) List!31745)

(assert (=> b!1359615 (= lt!599651 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!859 acc!759 (select (arr!44704 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359615 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359616 () Bool)

(declare-fun res!904063 () Bool)

(assert (=> b!1359616 (=> (not res!904063) (not e!771459))))

(assert (=> b!1359616 (= res!904063 (not (contains!9454 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359617 () Bool)

(declare-fun res!904062 () Bool)

(assert (=> b!1359617 (=> (not res!904062) (not e!771459))))

(assert (=> b!1359617 (= res!904062 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31742))))

(declare-fun b!1359618 () Bool)

(declare-fun res!904053 () Bool)

(assert (=> b!1359618 (=> (not res!904053) (not e!771459))))

(assert (=> b!1359618 (= res!904053 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45254 a!3742)))))

(declare-fun b!1359619 () Bool)

(assert (=> b!1359619 (= e!771458 (bvsge (bvsub (size!45254 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45254 a!3742) from!3120)))))

(assert (= (and start!114582 res!904059) b!1359608))

(assert (= (and b!1359608 res!904054) b!1359616))

(assert (= (and b!1359616 res!904063) b!1359607))

(assert (= (and b!1359607 res!904061) b!1359617))

(assert (= (and b!1359617 res!904062) b!1359613))

(assert (= (and b!1359613 res!904058) b!1359612))

(assert (= (and b!1359612 res!904057) b!1359611))

(assert (= (and b!1359611 res!904060) b!1359618))

(assert (= (and b!1359618 res!904053) b!1359609))

(assert (= (and b!1359609 c!127217) b!1359615))

(assert (= (and b!1359609 (not c!127217)) b!1359610))

(assert (= (and b!1359609 res!904056) b!1359614))

(assert (= (and b!1359614 res!904055) b!1359619))

(declare-fun m!1244973 () Bool)

(assert (=> start!114582 m!1244973))

(declare-fun m!1244975 () Bool)

(assert (=> b!1359609 m!1244975))

(assert (=> b!1359609 m!1244975))

(declare-fun m!1244977 () Bool)

(assert (=> b!1359609 m!1244977))

(declare-fun m!1244979 () Bool)

(assert (=> b!1359608 m!1244979))

(declare-fun m!1244981 () Bool)

(assert (=> b!1359614 m!1244981))

(declare-fun m!1244983 () Bool)

(assert (=> b!1359613 m!1244983))

(declare-fun m!1244985 () Bool)

(assert (=> b!1359615 m!1244985))

(assert (=> b!1359615 m!1244975))

(declare-fun m!1244987 () Bool)

(assert (=> b!1359615 m!1244987))

(declare-fun m!1244989 () Bool)

(assert (=> b!1359615 m!1244989))

(assert (=> b!1359615 m!1244981))

(assert (=> b!1359615 m!1244975))

(assert (=> b!1359615 m!1244987))

(declare-fun m!1244991 () Bool)

(assert (=> b!1359615 m!1244991))

(declare-fun m!1244993 () Bool)

(assert (=> b!1359607 m!1244993))

(declare-fun m!1244995 () Bool)

(assert (=> b!1359617 m!1244995))

(declare-fun m!1244997 () Bool)

(assert (=> b!1359616 m!1244997))

(declare-fun m!1244999 () Bool)

(assert (=> b!1359611 m!1244999))

(push 1)

(assert (not b!1359609))

(assert (not b!1359616))

(assert (not b!1359613))

(assert (not b!1359617))

(assert (not start!114582))

(assert (not b!1359611))

(assert (not b!1359607))

(assert (not b!1359614))

(assert (not b!1359615))

(assert (not b!1359608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

