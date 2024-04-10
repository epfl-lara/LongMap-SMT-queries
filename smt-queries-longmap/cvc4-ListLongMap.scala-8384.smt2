; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101984 () Bool)

(assert start!101984)

(declare-fun b!1227871 () Bool)

(declare-fun res!816490 () Bool)

(declare-fun e!697084 () Bool)

(assert (=> b!1227871 (=> res!816490 e!697084)))

(declare-datatypes ((List!27024 0))(
  ( (Nil!27021) (Cons!27020 (h!28229 (_ BitVec 64)) (t!40487 List!27024)) )
))
(declare-fun contains!7086 (List!27024 (_ BitVec 64)) Bool)

(assert (=> b!1227871 (= res!816490 (contains!7086 Nil!27021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227872 () Bool)

(assert (=> b!1227872 (= e!697084 true)))

(declare-datatypes ((Unit!40668 0))(
  ( (Unit!40669) )
))
(declare-fun lt!558948 () Unit!40668)

(declare-fun acc!823 () List!27024)

(declare-fun noDuplicateSubseq!43 (List!27024 List!27024) Unit!40668)

(assert (=> b!1227872 (= lt!558948 (noDuplicateSubseq!43 Nil!27021 acc!823))))

(declare-fun b!1227873 () Bool)

(declare-fun res!816487 () Bool)

(declare-fun e!697085 () Bool)

(assert (=> b!1227873 (=> (not res!816487) (not e!697085))))

(assert (=> b!1227873 (= res!816487 (not (contains!7086 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816492 () Bool)

(assert (=> start!101984 (=> (not res!816492) (not e!697085))))

(declare-datatypes ((array!79257 0))(
  ( (array!79258 (arr!38251 (Array (_ BitVec 32) (_ BitVec 64))) (size!38787 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79257)

(assert (=> start!101984 (= res!816492 (bvslt (size!38787 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101984 e!697085))

(declare-fun array_inv!29099 (array!79257) Bool)

(assert (=> start!101984 (array_inv!29099 a!3806)))

(assert (=> start!101984 true))

(declare-fun b!1227874 () Bool)

(declare-fun res!816488 () Bool)

(assert (=> b!1227874 (=> (not res!816488) (not e!697085))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227874 (= res!816488 (validKeyInArray!0 k!2913))))

(declare-fun b!1227875 () Bool)

(declare-fun res!816484 () Bool)

(assert (=> b!1227875 (=> res!816484 e!697084)))

(declare-fun subseq!490 (List!27024 List!27024) Bool)

(assert (=> b!1227875 (= res!816484 (not (subseq!490 Nil!27021 acc!823)))))

(declare-fun b!1227876 () Bool)

(declare-fun res!816483 () Bool)

(assert (=> b!1227876 (=> (not res!816483) (not e!697085))))

(declare-fun noDuplicate!1683 (List!27024) Bool)

(assert (=> b!1227876 (= res!816483 (noDuplicate!1683 acc!823))))

(declare-fun b!1227877 () Bool)

(declare-fun res!816493 () Bool)

(assert (=> b!1227877 (=> (not res!816493) (not e!697085))))

(assert (=> b!1227877 (= res!816493 (not (contains!7086 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227878 () Bool)

(declare-fun res!816495 () Bool)

(assert (=> b!1227878 (=> (not res!816495) (not e!697085))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227878 (= res!816495 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38787 a!3806)) (bvslt from!3184 (size!38787 a!3806))))))

(declare-fun b!1227879 () Bool)

(assert (=> b!1227879 (= e!697085 (not e!697084))))

(declare-fun res!816486 () Bool)

(assert (=> b!1227879 (=> res!816486 e!697084)))

(assert (=> b!1227879 (= res!816486 (bvsgt from!3184 (size!38787 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79257 (_ BitVec 32) List!27024) Bool)

(assert (=> b!1227879 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27020 (select (arr!38251 a!3806) from!3184) acc!823))))

(declare-fun b!1227880 () Bool)

(declare-fun res!816485 () Bool)

(assert (=> b!1227880 (=> (not res!816485) (not e!697085))))

(declare-fun arrayContainsKey!0 (array!79257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227880 (= res!816485 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227881 () Bool)

(declare-fun res!816494 () Bool)

(assert (=> b!1227881 (=> res!816494 e!697084)))

(assert (=> b!1227881 (= res!816494 (contains!7086 Nil!27021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227882 () Bool)

(declare-fun res!816489 () Bool)

(assert (=> b!1227882 (=> (not res!816489) (not e!697085))))

(assert (=> b!1227882 (= res!816489 (validKeyInArray!0 (select (arr!38251 a!3806) from!3184)))))

(declare-fun b!1227883 () Bool)

(declare-fun res!816491 () Bool)

(assert (=> b!1227883 (=> (not res!816491) (not e!697085))))

(assert (=> b!1227883 (= res!816491 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!101984 res!816492) b!1227874))

(assert (= (and b!1227874 res!816488) b!1227878))

(assert (= (and b!1227878 res!816495) b!1227876))

(assert (= (and b!1227876 res!816483) b!1227877))

(assert (= (and b!1227877 res!816493) b!1227873))

(assert (= (and b!1227873 res!816487) b!1227880))

(assert (= (and b!1227880 res!816485) b!1227883))

(assert (= (and b!1227883 res!816491) b!1227882))

(assert (= (and b!1227882 res!816489) b!1227879))

(assert (= (and b!1227879 (not res!816486)) b!1227881))

(assert (= (and b!1227881 (not res!816494)) b!1227871))

(assert (= (and b!1227871 (not res!816490)) b!1227875))

(assert (= (and b!1227875 (not res!816484)) b!1227872))

(declare-fun m!1132535 () Bool)

(assert (=> b!1227879 m!1132535))

(declare-fun m!1132537 () Bool)

(assert (=> b!1227879 m!1132537))

(declare-fun m!1132539 () Bool)

(assert (=> b!1227872 m!1132539))

(declare-fun m!1132541 () Bool)

(assert (=> b!1227873 m!1132541))

(declare-fun m!1132543 () Bool)

(assert (=> b!1227874 m!1132543))

(assert (=> b!1227882 m!1132535))

(assert (=> b!1227882 m!1132535))

(declare-fun m!1132545 () Bool)

(assert (=> b!1227882 m!1132545))

(declare-fun m!1132547 () Bool)

(assert (=> start!101984 m!1132547))

(declare-fun m!1132549 () Bool)

(assert (=> b!1227876 m!1132549))

(declare-fun m!1132551 () Bool)

(assert (=> b!1227880 m!1132551))

(declare-fun m!1132553 () Bool)

(assert (=> b!1227881 m!1132553))

(declare-fun m!1132555 () Bool)

(assert (=> b!1227877 m!1132555))

(declare-fun m!1132557 () Bool)

(assert (=> b!1227871 m!1132557))

(declare-fun m!1132559 () Bool)

(assert (=> b!1227875 m!1132559))

(declare-fun m!1132561 () Bool)

(assert (=> b!1227883 m!1132561))

(push 1)

(assert (not start!101984))

(assert (not b!1227874))

(assert (not b!1227873))

(assert (not b!1227871))

(assert (not b!1227881))

(assert (not b!1227872))

(assert (not b!1227880))

(assert (not b!1227876))

(assert (not b!1227875))

(assert (not b!1227879))

(assert (not b!1227877))

(assert (not b!1227882))

(assert (not b!1227883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

