; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101990 () Bool)

(assert start!101990)

(declare-fun b!1227988 () Bool)

(declare-fun e!697110 () Bool)

(assert (=> b!1227988 (= e!697110 true)))

(declare-datatypes ((Unit!40674 0))(
  ( (Unit!40675) )
))
(declare-fun lt!558957 () Unit!40674)

(declare-datatypes ((List!27027 0))(
  ( (Nil!27024) (Cons!27023 (h!28232 (_ BitVec 64)) (t!40490 List!27027)) )
))
(declare-fun acc!823 () List!27027)

(declare-fun noDuplicateSubseq!46 (List!27027 List!27027) Unit!40674)

(assert (=> b!1227988 (= lt!558957 (noDuplicateSubseq!46 Nil!27024 acc!823))))

(declare-fun b!1227989 () Bool)

(declare-fun res!816611 () Bool)

(declare-fun e!697112 () Bool)

(assert (=> b!1227989 (=> (not res!816611) (not e!697112))))

(declare-datatypes ((array!79263 0))(
  ( (array!79264 (arr!38254 (Array (_ BitVec 32) (_ BitVec 64))) (size!38790 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79263)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227989 (= res!816611 (validKeyInArray!0 (select (arr!38254 a!3806) from!3184)))))

(declare-fun b!1227990 () Bool)

(declare-fun res!816605 () Bool)

(assert (=> b!1227990 (=> (not res!816605) (not e!697112))))

(declare-fun arrayNoDuplicates!0 (array!79263 (_ BitVec 32) List!27027) Bool)

(assert (=> b!1227990 (= res!816605 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227991 () Bool)

(declare-fun res!816609 () Bool)

(assert (=> b!1227991 (=> (not res!816609) (not e!697112))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227991 (= res!816609 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227992 () Bool)

(declare-fun res!816608 () Bool)

(assert (=> b!1227992 (=> (not res!816608) (not e!697112))))

(declare-fun contains!7089 (List!27027 (_ BitVec 64)) Bool)

(assert (=> b!1227992 (= res!816608 (not (contains!7089 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227993 () Bool)

(declare-fun res!816603 () Bool)

(assert (=> b!1227993 (=> (not res!816603) (not e!697112))))

(assert (=> b!1227993 (= res!816603 (validKeyInArray!0 k!2913))))

(declare-fun b!1227994 () Bool)

(declare-fun res!816602 () Bool)

(assert (=> b!1227994 (=> (not res!816602) (not e!697112))))

(assert (=> b!1227994 (= res!816602 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38790 a!3806)) (bvslt from!3184 (size!38790 a!3806))))))

(declare-fun b!1227995 () Bool)

(declare-fun res!816606 () Bool)

(assert (=> b!1227995 (=> res!816606 e!697110)))

(assert (=> b!1227995 (= res!816606 (contains!7089 Nil!27024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227996 () Bool)

(declare-fun res!816604 () Bool)

(assert (=> b!1227996 (=> (not res!816604) (not e!697112))))

(assert (=> b!1227996 (= res!816604 (not (contains!7089 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227997 () Bool)

(declare-fun res!816610 () Bool)

(assert (=> b!1227997 (=> res!816610 e!697110)))

(assert (=> b!1227997 (= res!816610 (contains!7089 Nil!27024 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227998 () Bool)

(declare-fun res!816601 () Bool)

(assert (=> b!1227998 (=> res!816601 e!697110)))

(declare-fun subseq!493 (List!27027 List!27027) Bool)

(assert (=> b!1227998 (= res!816601 (not (subseq!493 Nil!27024 acc!823)))))

(declare-fun b!1228000 () Bool)

(declare-fun res!816612 () Bool)

(assert (=> b!1228000 (=> (not res!816612) (not e!697112))))

(declare-fun noDuplicate!1686 (List!27027) Bool)

(assert (=> b!1228000 (= res!816612 (noDuplicate!1686 acc!823))))

(declare-fun res!816600 () Bool)

(assert (=> start!101990 (=> (not res!816600) (not e!697112))))

(assert (=> start!101990 (= res!816600 (bvslt (size!38790 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101990 e!697112))

(declare-fun array_inv!29102 (array!79263) Bool)

(assert (=> start!101990 (array_inv!29102 a!3806)))

(assert (=> start!101990 true))

(declare-fun b!1227999 () Bool)

(assert (=> b!1227999 (= e!697112 (not e!697110))))

(declare-fun res!816607 () Bool)

(assert (=> b!1227999 (=> res!816607 e!697110)))

(assert (=> b!1227999 (= res!816607 (bvsgt from!3184 (size!38790 a!3806)))))

(assert (=> b!1227999 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27023 (select (arr!38254 a!3806) from!3184) acc!823))))

(assert (= (and start!101990 res!816600) b!1227993))

(assert (= (and b!1227993 res!816603) b!1227994))

(assert (= (and b!1227994 res!816602) b!1228000))

(assert (= (and b!1228000 res!816612) b!1227996))

(assert (= (and b!1227996 res!816604) b!1227992))

(assert (= (and b!1227992 res!816608) b!1227991))

(assert (= (and b!1227991 res!816609) b!1227990))

(assert (= (and b!1227990 res!816605) b!1227989))

(assert (= (and b!1227989 res!816611) b!1227999))

(assert (= (and b!1227999 (not res!816607)) b!1227995))

(assert (= (and b!1227995 (not res!816606)) b!1227997))

(assert (= (and b!1227997 (not res!816610)) b!1227998))

(assert (= (and b!1227998 (not res!816601)) b!1227988))

(declare-fun m!1132619 () Bool)

(assert (=> b!1227992 m!1132619))

(declare-fun m!1132621 () Bool)

(assert (=> b!1227989 m!1132621))

(assert (=> b!1227989 m!1132621))

(declare-fun m!1132623 () Bool)

(assert (=> b!1227989 m!1132623))

(assert (=> b!1227999 m!1132621))

(declare-fun m!1132625 () Bool)

(assert (=> b!1227999 m!1132625))

(declare-fun m!1132627 () Bool)

(assert (=> b!1227996 m!1132627))

(declare-fun m!1132629 () Bool)

(assert (=> b!1227988 m!1132629))

(declare-fun m!1132631 () Bool)

(assert (=> b!1227991 m!1132631))

(declare-fun m!1132633 () Bool)

(assert (=> b!1228000 m!1132633))

(declare-fun m!1132635 () Bool)

(assert (=> b!1227998 m!1132635))

(declare-fun m!1132637 () Bool)

(assert (=> start!101990 m!1132637))

(declare-fun m!1132639 () Bool)

(assert (=> b!1227997 m!1132639))

(declare-fun m!1132641 () Bool)

(assert (=> b!1227990 m!1132641))

(declare-fun m!1132643 () Bool)

(assert (=> b!1227995 m!1132643))

(declare-fun m!1132645 () Bool)

(assert (=> b!1227993 m!1132645))

(push 1)

(assert (not b!1228000))

(assert (not b!1227997))

(assert (not start!101990))

(assert (not b!1227996))

(assert (not b!1227995))

(assert (not b!1227998))

(assert (not b!1227988))

(assert (not b!1227993))

(assert (not b!1227992))

(assert (not b!1227999))

(assert (not b!1227989))

(assert (not b!1227991))

(assert (not b!1227990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

