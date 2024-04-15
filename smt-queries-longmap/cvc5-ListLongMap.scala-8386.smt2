; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101990 () Bool)

(assert start!101990)

(declare-fun b!1227996 () Bool)

(declare-fun res!816657 () Bool)

(declare-fun e!697068 () Bool)

(assert (=> b!1227996 (=> (not res!816657) (not e!697068))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79190 0))(
  ( (array!79191 (arr!38218 (Array (_ BitVec 32) (_ BitVec 64))) (size!38756 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79190)

(assert (=> b!1227996 (= res!816657 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38756 a!3806)) (bvslt from!3184 (size!38756 a!3806))))))

(declare-fun b!1227997 () Bool)

(declare-fun res!816660 () Bool)

(assert (=> b!1227997 (=> (not res!816660) (not e!697068))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227997 (= res!816660 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227998 () Bool)

(declare-fun res!816665 () Bool)

(assert (=> b!1227998 (=> (not res!816665) (not e!697068))))

(declare-datatypes ((List!27092 0))(
  ( (Nil!27089) (Cons!27088 (h!28297 (_ BitVec 64)) (t!40546 List!27092)) )
))
(declare-fun acc!823 () List!27092)

(declare-fun noDuplicate!1707 (List!27092) Bool)

(assert (=> b!1227998 (= res!816665 (noDuplicate!1707 acc!823))))

(declare-fun b!1227999 () Bool)

(declare-fun res!816666 () Bool)

(declare-fun e!697069 () Bool)

(assert (=> b!1227999 (=> res!816666 e!697069)))

(declare-fun contains!7064 (List!27092 (_ BitVec 64)) Bool)

(assert (=> b!1227999 (= res!816666 (contains!7064 Nil!27089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!816664 () Bool)

(assert (=> start!101990 (=> (not res!816664) (not e!697068))))

(assert (=> start!101990 (= res!816664 (bvslt (size!38756 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101990 e!697068))

(declare-fun array_inv!29201 (array!79190) Bool)

(assert (=> start!101990 (array_inv!29201 a!3806)))

(assert (=> start!101990 true))

(declare-fun b!1228000 () Bool)

(declare-fun res!816658 () Bool)

(assert (=> b!1228000 (=> (not res!816658) (not e!697068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228000 (= res!816658 (validKeyInArray!0 k!2913))))

(declare-fun b!1228001 () Bool)

(declare-fun res!816661 () Bool)

(assert (=> b!1228001 (=> res!816661 e!697069)))

(assert (=> b!1228001 (= res!816661 (contains!7064 Nil!27089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228002 () Bool)

(declare-fun res!816663 () Bool)

(assert (=> b!1228002 (=> (not res!816663) (not e!697068))))

(assert (=> b!1228002 (= res!816663 (not (contains!7064 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228003 () Bool)

(declare-fun res!816659 () Bool)

(assert (=> b!1228003 (=> (not res!816659) (not e!697068))))

(assert (=> b!1228003 (= res!816659 (not (contains!7064 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228004 () Bool)

(declare-fun res!816668 () Bool)

(assert (=> b!1228004 (=> (not res!816668) (not e!697068))))

(assert (=> b!1228004 (= res!816668 (validKeyInArray!0 (select (arr!38218 a!3806) from!3184)))))

(declare-fun b!1228005 () Bool)

(assert (=> b!1228005 (= e!697068 (not e!697069))))

(declare-fun res!816667 () Bool)

(assert (=> b!1228005 (=> res!816667 e!697069)))

(assert (=> b!1228005 (= res!816667 (bvsgt from!3184 (size!38756 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79190 (_ BitVec 32) List!27092) Bool)

(assert (=> b!1228005 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27088 (select (arr!38218 a!3806) from!3184) acc!823))))

(declare-fun b!1228006 () Bool)

(declare-fun res!816656 () Bool)

(assert (=> b!1228006 (=> (not res!816656) (not e!697068))))

(assert (=> b!1228006 (= res!816656 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228007 () Bool)

(declare-fun res!816662 () Bool)

(assert (=> b!1228007 (=> res!816662 e!697069)))

(declare-fun subseq!496 (List!27092 List!27092) Bool)

(assert (=> b!1228007 (= res!816662 (not (subseq!496 Nil!27089 acc!823)))))

(declare-fun b!1228008 () Bool)

(assert (=> b!1228008 (= e!697069 true)))

(declare-datatypes ((Unit!40527 0))(
  ( (Unit!40528) )
))
(declare-fun lt!558785 () Unit!40527)

(declare-fun noDuplicateSubseq!49 (List!27092 List!27092) Unit!40527)

(assert (=> b!1228008 (= lt!558785 (noDuplicateSubseq!49 Nil!27089 acc!823))))

(assert (= (and start!101990 res!816664) b!1228000))

(assert (= (and b!1228000 res!816658) b!1227996))

(assert (= (and b!1227996 res!816657) b!1227998))

(assert (= (and b!1227998 res!816665) b!1228002))

(assert (= (and b!1228002 res!816663) b!1228003))

(assert (= (and b!1228003 res!816659) b!1227997))

(assert (= (and b!1227997 res!816660) b!1228006))

(assert (= (and b!1228006 res!816656) b!1228004))

(assert (= (and b!1228004 res!816668) b!1228005))

(assert (= (and b!1228005 (not res!816667)) b!1227999))

(assert (= (and b!1227999 (not res!816666)) b!1228001))

(assert (= (and b!1228001 (not res!816661)) b!1228007))

(assert (= (and b!1228007 (not res!816662)) b!1228008))

(declare-fun m!1132139 () Bool)

(assert (=> b!1228000 m!1132139))

(declare-fun m!1132141 () Bool)

(assert (=> b!1228004 m!1132141))

(assert (=> b!1228004 m!1132141))

(declare-fun m!1132143 () Bool)

(assert (=> b!1228004 m!1132143))

(declare-fun m!1132145 () Bool)

(assert (=> b!1228008 m!1132145))

(assert (=> b!1228005 m!1132141))

(declare-fun m!1132147 () Bool)

(assert (=> b!1228005 m!1132147))

(declare-fun m!1132149 () Bool)

(assert (=> b!1228002 m!1132149))

(declare-fun m!1132151 () Bool)

(assert (=> b!1227997 m!1132151))

(declare-fun m!1132153 () Bool)

(assert (=> b!1227998 m!1132153))

(declare-fun m!1132155 () Bool)

(assert (=> b!1227999 m!1132155))

(declare-fun m!1132157 () Bool)

(assert (=> b!1228001 m!1132157))

(declare-fun m!1132159 () Bool)

(assert (=> b!1228007 m!1132159))

(declare-fun m!1132161 () Bool)

(assert (=> start!101990 m!1132161))

(declare-fun m!1132163 () Bool)

(assert (=> b!1228006 m!1132163))

(declare-fun m!1132165 () Bool)

(assert (=> b!1228003 m!1132165))

(push 1)

(assert (not b!1228001))

(assert (not b!1228003))

(assert (not b!1228000))

(assert (not b!1227997))

(assert (not b!1227998))

(assert (not b!1228008))

(assert (not b!1228002))

(assert (not b!1228005))

(assert (not b!1227999))

(assert (not b!1228006))

(assert (not b!1228004))

(assert (not b!1228007))

(assert (not start!101990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

