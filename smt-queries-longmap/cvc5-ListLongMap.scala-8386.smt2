; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101992 () Bool)

(assert start!101992)

(declare-fun b!1228027 () Bool)

(declare-fun res!816642 () Bool)

(declare-fun e!697120 () Bool)

(assert (=> b!1228027 (=> (not res!816642) (not e!697120))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79265 0))(
  ( (array!79266 (arr!38255 (Array (_ BitVec 32) (_ BitVec 64))) (size!38791 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79265)

(assert (=> b!1228027 (= res!816642 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38791 a!3806)) (bvslt from!3184 (size!38791 a!3806))))))

(declare-fun b!1228028 () Bool)

(declare-fun res!816649 () Bool)

(assert (=> b!1228028 (=> (not res!816649) (not e!697120))))

(declare-datatypes ((List!27028 0))(
  ( (Nil!27025) (Cons!27024 (h!28233 (_ BitVec 64)) (t!40491 List!27028)) )
))
(declare-fun acc!823 () List!27028)

(declare-fun contains!7090 (List!27028 (_ BitVec 64)) Bool)

(assert (=> b!1228028 (= res!816649 (not (contains!7090 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228029 () Bool)

(declare-fun res!816641 () Bool)

(assert (=> b!1228029 (=> (not res!816641) (not e!697120))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228029 (= res!816641 (validKeyInArray!0 k!2913))))

(declare-fun b!1228030 () Bool)

(declare-fun res!816650 () Bool)

(assert (=> b!1228030 (=> (not res!816650) (not e!697120))))

(assert (=> b!1228030 (= res!816650 (not (contains!7090 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228031 () Bool)

(declare-fun res!816645 () Bool)

(declare-fun e!697121 () Bool)

(assert (=> b!1228031 (=> res!816645 e!697121)))

(assert (=> b!1228031 (= res!816645 (contains!7090 Nil!27025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228033 () Bool)

(declare-fun res!816643 () Bool)

(assert (=> b!1228033 (=> (not res!816643) (not e!697120))))

(declare-fun arrayContainsKey!0 (array!79265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228033 (= res!816643 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228034 () Bool)

(assert (=> b!1228034 (= e!697121 true)))

(declare-datatypes ((Unit!40676 0))(
  ( (Unit!40677) )
))
(declare-fun lt!558960 () Unit!40676)

(declare-fun noDuplicateSubseq!47 (List!27028 List!27028) Unit!40676)

(assert (=> b!1228034 (= lt!558960 (noDuplicateSubseq!47 Nil!27025 acc!823))))

(declare-fun b!1228035 () Bool)

(assert (=> b!1228035 (= e!697120 (not e!697121))))

(declare-fun res!816639 () Bool)

(assert (=> b!1228035 (=> res!816639 e!697121)))

(assert (=> b!1228035 (= res!816639 (bvsgt from!3184 (size!38791 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79265 (_ BitVec 32) List!27028) Bool)

(assert (=> b!1228035 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27024 (select (arr!38255 a!3806) from!3184) acc!823))))

(declare-fun b!1228036 () Bool)

(declare-fun res!816651 () Bool)

(assert (=> b!1228036 (=> res!816651 e!697121)))

(assert (=> b!1228036 (= res!816651 (contains!7090 Nil!27025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228037 () Bool)

(declare-fun res!816646 () Bool)

(assert (=> b!1228037 (=> res!816646 e!697121)))

(declare-fun subseq!494 (List!27028 List!27028) Bool)

(assert (=> b!1228037 (= res!816646 (not (subseq!494 Nil!27025 acc!823)))))

(declare-fun b!1228038 () Bool)

(declare-fun res!816640 () Bool)

(assert (=> b!1228038 (=> (not res!816640) (not e!697120))))

(assert (=> b!1228038 (= res!816640 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228039 () Bool)

(declare-fun res!816647 () Bool)

(assert (=> b!1228039 (=> (not res!816647) (not e!697120))))

(declare-fun noDuplicate!1687 (List!27028) Bool)

(assert (=> b!1228039 (= res!816647 (noDuplicate!1687 acc!823))))

(declare-fun b!1228032 () Bool)

(declare-fun res!816648 () Bool)

(assert (=> b!1228032 (=> (not res!816648) (not e!697120))))

(assert (=> b!1228032 (= res!816648 (validKeyInArray!0 (select (arr!38255 a!3806) from!3184)))))

(declare-fun res!816644 () Bool)

(assert (=> start!101992 (=> (not res!816644) (not e!697120))))

(assert (=> start!101992 (= res!816644 (bvslt (size!38791 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101992 e!697120))

(declare-fun array_inv!29103 (array!79265) Bool)

(assert (=> start!101992 (array_inv!29103 a!3806)))

(assert (=> start!101992 true))

(assert (= (and start!101992 res!816644) b!1228029))

(assert (= (and b!1228029 res!816641) b!1228027))

(assert (= (and b!1228027 res!816642) b!1228039))

(assert (= (and b!1228039 res!816647) b!1228028))

(assert (= (and b!1228028 res!816649) b!1228030))

(assert (= (and b!1228030 res!816650) b!1228033))

(assert (= (and b!1228033 res!816643) b!1228038))

(assert (= (and b!1228038 res!816640) b!1228032))

(assert (= (and b!1228032 res!816648) b!1228035))

(assert (= (and b!1228035 (not res!816639)) b!1228031))

(assert (= (and b!1228031 (not res!816645)) b!1228036))

(assert (= (and b!1228036 (not res!816651)) b!1228037))

(assert (= (and b!1228037 (not res!816646)) b!1228034))

(declare-fun m!1132647 () Bool)

(assert (=> b!1228028 m!1132647))

(declare-fun m!1132649 () Bool)

(assert (=> b!1228036 m!1132649))

(declare-fun m!1132651 () Bool)

(assert (=> b!1228033 m!1132651))

(declare-fun m!1132653 () Bool)

(assert (=> b!1228039 m!1132653))

(declare-fun m!1132655 () Bool)

(assert (=> b!1228035 m!1132655))

(declare-fun m!1132657 () Bool)

(assert (=> b!1228035 m!1132657))

(declare-fun m!1132659 () Bool)

(assert (=> b!1228037 m!1132659))

(assert (=> b!1228032 m!1132655))

(assert (=> b!1228032 m!1132655))

(declare-fun m!1132661 () Bool)

(assert (=> b!1228032 m!1132661))

(declare-fun m!1132663 () Bool)

(assert (=> b!1228031 m!1132663))

(declare-fun m!1132665 () Bool)

(assert (=> b!1228038 m!1132665))

(declare-fun m!1132667 () Bool)

(assert (=> b!1228034 m!1132667))

(declare-fun m!1132669 () Bool)

(assert (=> start!101992 m!1132669))

(declare-fun m!1132671 () Bool)

(assert (=> b!1228029 m!1132671))

(declare-fun m!1132673 () Bool)

(assert (=> b!1228030 m!1132673))

(push 1)

(assert (not b!1228036))

(assert (not start!101992))

(assert (not b!1228034))

(assert (not b!1228029))

(assert (not b!1228038))

(assert (not b!1228035))

(assert (not b!1228033))

(assert (not b!1228031))

(assert (not b!1228028))

(assert (not b!1228037))

(assert (not b!1228032))

(assert (not b!1228030))

(assert (not b!1228039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

