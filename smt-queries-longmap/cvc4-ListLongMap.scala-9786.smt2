; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116136 () Bool)

(assert start!116136)

(declare-fun b!1371761 () Bool)

(declare-fun res!915128 () Bool)

(declare-fun e!777076 () Bool)

(assert (=> b!1371761 (=> (not res!915128) (not e!777076))))

(declare-datatypes ((List!32009 0))(
  ( (Nil!32006) (Cons!32005 (h!33214 (_ BitVec 64)) (t!46703 List!32009)) )
))
(declare-fun lt!602720 () List!32009)

(declare-fun contains!9691 (List!32009 (_ BitVec 64)) Bool)

(assert (=> b!1371761 (= res!915128 (not (contains!9691 lt!602720 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371762 () Bool)

(declare-fun e!777074 () Bool)

(declare-fun e!777073 () Bool)

(assert (=> b!1371762 (= e!777074 e!777073)))

(declare-fun res!915130 () Bool)

(assert (=> b!1371762 (=> (not res!915130) (not e!777073))))

(declare-datatypes ((array!93055 0))(
  ( (array!93056 (arr!44941 (Array (_ BitVec 32) (_ BitVec 64))) (size!45491 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93055)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!32009)

(declare-fun arrayNoDuplicates!0 (array!93055 (_ BitVec 32) List!32009) Bool)

(assert (=> b!1371762 (= res!915130 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45319 0))(
  ( (Unit!45320) )
))
(declare-fun lt!602719 () Unit!45319)

(declare-fun newAcc!98 () List!32009)

(declare-fun noDuplicateSubseq!280 (List!32009 List!32009) Unit!45319)

(assert (=> b!1371762 (= lt!602719 (noDuplicateSubseq!280 newAcc!98 acc!866))))

(declare-fun b!1371763 () Bool)

(declare-fun res!915139 () Bool)

(assert (=> b!1371763 (=> (not res!915139) (not e!777073))))

(assert (=> b!1371763 (= res!915139 (not (contains!9691 acc!866 (select (arr!44941 a!3861) from!3239))))))

(declare-fun b!1371764 () Bool)

(declare-fun res!915134 () Bool)

(assert (=> b!1371764 (=> (not res!915134) (not e!777076))))

(declare-fun lt!602722 () List!32009)

(declare-fun subseq!1093 (List!32009 List!32009) Bool)

(assert (=> b!1371764 (= res!915134 (subseq!1093 lt!602722 lt!602720))))

(declare-fun b!1371765 () Bool)

(declare-fun res!915141 () Bool)

(assert (=> b!1371765 (=> (not res!915141) (not e!777073))))

(assert (=> b!1371765 (= res!915141 (bvslt from!3239 (size!45491 a!3861)))))

(declare-fun b!1371766 () Bool)

(declare-fun res!915137 () Bool)

(assert (=> b!1371766 (=> (not res!915137) (not e!777074))))

(declare-fun noDuplicate!2548 (List!32009) Bool)

(assert (=> b!1371766 (= res!915137 (noDuplicate!2548 acc!866))))

(declare-fun b!1371767 () Bool)

(declare-fun res!915131 () Bool)

(assert (=> b!1371767 (=> (not res!915131) (not e!777074))))

(assert (=> b!1371767 (= res!915131 (not (contains!9691 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371768 () Bool)

(declare-fun res!915138 () Bool)

(assert (=> b!1371768 (=> (not res!915138) (not e!777074))))

(assert (=> b!1371768 (= res!915138 (not (contains!9691 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371769 () Bool)

(declare-fun res!915142 () Bool)

(assert (=> b!1371769 (=> (not res!915142) (not e!777074))))

(assert (=> b!1371769 (= res!915142 (not (contains!9691 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371770 () Bool)

(declare-fun res!915133 () Bool)

(assert (=> b!1371770 (=> (not res!915133) (not e!777073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371770 (= res!915133 (validKeyInArray!0 (select (arr!44941 a!3861) from!3239)))))

(declare-fun b!1371771 () Bool)

(declare-fun e!777075 () Bool)

(assert (=> b!1371771 (= e!777076 e!777075)))

(declare-fun res!915132 () Bool)

(assert (=> b!1371771 (=> (not res!915132) (not e!777075))))

(assert (=> b!1371771 (= res!915132 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602720))))

(declare-fun lt!602721 () Unit!45319)

(assert (=> b!1371771 (= lt!602721 (noDuplicateSubseq!280 lt!602722 lt!602720))))

(declare-fun b!1371772 () Bool)

(assert (=> b!1371772 (= e!777073 e!777076)))

(declare-fun res!915136 () Bool)

(assert (=> b!1371772 (=> (not res!915136) (not e!777076))))

(assert (=> b!1371772 (= res!915136 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1371772 (= lt!602722 (Cons!32005 (select (arr!44941 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371772 (= lt!602720 (Cons!32005 (select (arr!44941 a!3861) from!3239) acc!866))))

(declare-fun b!1371760 () Bool)

(declare-fun res!915140 () Bool)

(assert (=> b!1371760 (=> (not res!915140) (not e!777076))))

(assert (=> b!1371760 (= res!915140 (not (contains!9691 lt!602720 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915129 () Bool)

(assert (=> start!116136 (=> (not res!915129) (not e!777074))))

(assert (=> start!116136 (= res!915129 (and (bvslt (size!45491 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45491 a!3861))))))

(assert (=> start!116136 e!777074))

(declare-fun array_inv!33969 (array!93055) Bool)

(assert (=> start!116136 (array_inv!33969 a!3861)))

(assert (=> start!116136 true))

(declare-fun b!1371773 () Bool)

(declare-fun res!915124 () Bool)

(assert (=> b!1371773 (=> (not res!915124) (not e!777074))))

(assert (=> b!1371773 (= res!915124 (not (contains!9691 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371774 () Bool)

(declare-fun res!915135 () Bool)

(assert (=> b!1371774 (=> (not res!915135) (not e!777076))))

(assert (=> b!1371774 (= res!915135 (not (contains!9691 lt!602722 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371775 () Bool)

(declare-fun res!915125 () Bool)

(assert (=> b!1371775 (=> (not res!915125) (not e!777074))))

(assert (=> b!1371775 (= res!915125 (subseq!1093 newAcc!98 acc!866))))

(declare-fun b!1371776 () Bool)

(declare-fun res!915127 () Bool)

(assert (=> b!1371776 (=> (not res!915127) (not e!777076))))

(assert (=> b!1371776 (= res!915127 (noDuplicate!2548 lt!602720))))

(declare-fun b!1371777 () Bool)

(declare-fun res!915126 () Bool)

(assert (=> b!1371777 (=> (not res!915126) (not e!777076))))

(assert (=> b!1371777 (= res!915126 (not (contains!9691 lt!602722 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371778 () Bool)

(assert (=> b!1371778 (= e!777075 (bvsge (bvsub (size!45491 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45491 a!3861) from!3239)))))

(assert (= (and start!116136 res!915129) b!1371766))

(assert (= (and b!1371766 res!915137) b!1371767))

(assert (= (and b!1371767 res!915131) b!1371768))

(assert (= (and b!1371768 res!915138) b!1371773))

(assert (= (and b!1371773 res!915124) b!1371769))

(assert (= (and b!1371769 res!915142) b!1371775))

(assert (= (and b!1371775 res!915125) b!1371762))

(assert (= (and b!1371762 res!915130) b!1371765))

(assert (= (and b!1371765 res!915141) b!1371770))

(assert (= (and b!1371770 res!915133) b!1371763))

(assert (= (and b!1371763 res!915139) b!1371772))

(assert (= (and b!1371772 res!915136) b!1371776))

(assert (= (and b!1371776 res!915127) b!1371761))

(assert (= (and b!1371761 res!915128) b!1371760))

(assert (= (and b!1371760 res!915140) b!1371777))

(assert (= (and b!1371777 res!915126) b!1371774))

(assert (= (and b!1371774 res!915135) b!1371764))

(assert (= (and b!1371764 res!915134) b!1371771))

(assert (= (and b!1371771 res!915132) b!1371778))

(declare-fun m!1255167 () Bool)

(assert (=> b!1371777 m!1255167))

(declare-fun m!1255169 () Bool)

(assert (=> b!1371775 m!1255169))

(declare-fun m!1255171 () Bool)

(assert (=> b!1371771 m!1255171))

(declare-fun m!1255173 () Bool)

(assert (=> b!1371771 m!1255173))

(declare-fun m!1255175 () Bool)

(assert (=> b!1371769 m!1255175))

(declare-fun m!1255177 () Bool)

(assert (=> b!1371761 m!1255177))

(declare-fun m!1255179 () Bool)

(assert (=> b!1371764 m!1255179))

(declare-fun m!1255181 () Bool)

(assert (=> b!1371773 m!1255181))

(declare-fun m!1255183 () Bool)

(assert (=> b!1371762 m!1255183))

(declare-fun m!1255185 () Bool)

(assert (=> b!1371762 m!1255185))

(declare-fun m!1255187 () Bool)

(assert (=> b!1371767 m!1255187))

(declare-fun m!1255189 () Bool)

(assert (=> b!1371774 m!1255189))

(declare-fun m!1255191 () Bool)

(assert (=> b!1371760 m!1255191))

(declare-fun m!1255193 () Bool)

(assert (=> b!1371763 m!1255193))

(assert (=> b!1371763 m!1255193))

(declare-fun m!1255195 () Bool)

(assert (=> b!1371763 m!1255195))

(declare-fun m!1255197 () Bool)

(assert (=> b!1371776 m!1255197))

(declare-fun m!1255199 () Bool)

(assert (=> b!1371766 m!1255199))

(declare-fun m!1255201 () Bool)

(assert (=> b!1371768 m!1255201))

(declare-fun m!1255203 () Bool)

(assert (=> start!116136 m!1255203))

(assert (=> b!1371772 m!1255193))

(assert (=> b!1371770 m!1255193))

(assert (=> b!1371770 m!1255193))

(declare-fun m!1255205 () Bool)

(assert (=> b!1371770 m!1255205))

(push 1)

(assert (not b!1371776))

(assert (not b!1371777))

(assert (not b!1371763))

(assert (not b!1371766))

(assert (not b!1371775))

(assert (not b!1371768))

(assert (not b!1371774))

(assert (not b!1371771))

(assert (not b!1371767))

(assert (not b!1371761))

(assert (not b!1371769))

(assert (not b!1371764))

(assert (not b!1371760))

(assert (not start!116136))

(assert (not b!1371762))

(assert (not b!1371773))

(assert (not b!1371770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

