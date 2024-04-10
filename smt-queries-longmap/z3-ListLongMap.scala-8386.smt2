; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101994 () Bool)

(assert start!101994)

(declare-fun b!1228066 () Bool)

(declare-fun e!697130 () Bool)

(assert (=> b!1228066 (= e!697130 true)))

(declare-datatypes ((Unit!40678 0))(
  ( (Unit!40679) )
))
(declare-fun lt!558963 () Unit!40678)

(declare-datatypes ((List!27029 0))(
  ( (Nil!27026) (Cons!27025 (h!28234 (_ BitVec 64)) (t!40492 List!27029)) )
))
(declare-fun acc!823 () List!27029)

(declare-fun noDuplicateSubseq!48 (List!27029 List!27029) Unit!40678)

(assert (=> b!1228066 (= lt!558963 (noDuplicateSubseq!48 Nil!27026 acc!823))))

(declare-fun b!1228067 () Bool)

(declare-fun res!816689 () Bool)

(declare-fun e!697128 () Bool)

(assert (=> b!1228067 (=> (not res!816689) (not e!697128))))

(declare-datatypes ((array!79267 0))(
  ( (array!79268 (arr!38256 (Array (_ BitVec 32) (_ BitVec 64))) (size!38792 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79267)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79267 (_ BitVec 32) List!27029) Bool)

(assert (=> b!1228067 (= res!816689 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228068 () Bool)

(declare-fun res!816681 () Bool)

(assert (=> b!1228068 (=> (not res!816681) (not e!697128))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228068 (= res!816681 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228069 () Bool)

(declare-fun res!816685 () Bool)

(assert (=> b!1228069 (=> res!816685 e!697130)))

(declare-fun subseq!495 (List!27029 List!27029) Bool)

(assert (=> b!1228069 (= res!816685 (not (subseq!495 Nil!27026 acc!823)))))

(declare-fun b!1228070 () Bool)

(declare-fun res!816682 () Bool)

(assert (=> b!1228070 (=> res!816682 e!697130)))

(declare-fun contains!7091 (List!27029 (_ BitVec 64)) Bool)

(assert (=> b!1228070 (= res!816682 (contains!7091 Nil!27026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228071 () Bool)

(declare-fun res!816679 () Bool)

(assert (=> b!1228071 (=> (not res!816679) (not e!697128))))

(declare-fun noDuplicate!1688 (List!27029) Bool)

(assert (=> b!1228071 (= res!816679 (noDuplicate!1688 acc!823))))

(declare-fun b!1228072 () Bool)

(declare-fun res!816683 () Bool)

(assert (=> b!1228072 (=> (not res!816683) (not e!697128))))

(assert (=> b!1228072 (= res!816683 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38792 a!3806)) (bvslt from!3184 (size!38792 a!3806))))))

(declare-fun b!1228073 () Bool)

(declare-fun res!816687 () Bool)

(assert (=> b!1228073 (=> (not res!816687) (not e!697128))))

(assert (=> b!1228073 (= res!816687 (not (contains!7091 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228074 () Bool)

(declare-fun res!816688 () Bool)

(assert (=> b!1228074 (=> (not res!816688) (not e!697128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228074 (= res!816688 (validKeyInArray!0 k0!2913))))

(declare-fun res!816684 () Bool)

(assert (=> start!101994 (=> (not res!816684) (not e!697128))))

(assert (=> start!101994 (= res!816684 (bvslt (size!38792 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101994 e!697128))

(declare-fun array_inv!29104 (array!79267) Bool)

(assert (=> start!101994 (array_inv!29104 a!3806)))

(assert (=> start!101994 true))

(declare-fun b!1228075 () Bool)

(assert (=> b!1228075 (= e!697128 (not e!697130))))

(declare-fun res!816690 () Bool)

(assert (=> b!1228075 (=> res!816690 e!697130)))

(assert (=> b!1228075 (= res!816690 (bvsgt from!3184 (size!38792 a!3806)))))

(assert (=> b!1228075 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27025 (select (arr!38256 a!3806) from!3184) acc!823))))

(declare-fun b!1228076 () Bool)

(declare-fun res!816678 () Bool)

(assert (=> b!1228076 (=> res!816678 e!697130)))

(assert (=> b!1228076 (= res!816678 (contains!7091 Nil!27026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228077 () Bool)

(declare-fun res!816686 () Bool)

(assert (=> b!1228077 (=> (not res!816686) (not e!697128))))

(assert (=> b!1228077 (= res!816686 (not (contains!7091 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228078 () Bool)

(declare-fun res!816680 () Bool)

(assert (=> b!1228078 (=> (not res!816680) (not e!697128))))

(assert (=> b!1228078 (= res!816680 (validKeyInArray!0 (select (arr!38256 a!3806) from!3184)))))

(assert (= (and start!101994 res!816684) b!1228074))

(assert (= (and b!1228074 res!816688) b!1228072))

(assert (= (and b!1228072 res!816683) b!1228071))

(assert (= (and b!1228071 res!816679) b!1228073))

(assert (= (and b!1228073 res!816687) b!1228077))

(assert (= (and b!1228077 res!816686) b!1228068))

(assert (= (and b!1228068 res!816681) b!1228067))

(assert (= (and b!1228067 res!816689) b!1228078))

(assert (= (and b!1228078 res!816680) b!1228075))

(assert (= (and b!1228075 (not res!816690)) b!1228070))

(assert (= (and b!1228070 (not res!816682)) b!1228076))

(assert (= (and b!1228076 (not res!816678)) b!1228069))

(assert (= (and b!1228069 (not res!816685)) b!1228066))

(declare-fun m!1132675 () Bool)

(assert (=> b!1228070 m!1132675))

(declare-fun m!1132677 () Bool)

(assert (=> b!1228067 m!1132677))

(declare-fun m!1132679 () Bool)

(assert (=> b!1228074 m!1132679))

(declare-fun m!1132681 () Bool)

(assert (=> start!101994 m!1132681))

(declare-fun m!1132683 () Bool)

(assert (=> b!1228071 m!1132683))

(declare-fun m!1132685 () Bool)

(assert (=> b!1228066 m!1132685))

(declare-fun m!1132687 () Bool)

(assert (=> b!1228068 m!1132687))

(declare-fun m!1132689 () Bool)

(assert (=> b!1228069 m!1132689))

(declare-fun m!1132691 () Bool)

(assert (=> b!1228073 m!1132691))

(declare-fun m!1132693 () Bool)

(assert (=> b!1228076 m!1132693))

(declare-fun m!1132695 () Bool)

(assert (=> b!1228075 m!1132695))

(declare-fun m!1132697 () Bool)

(assert (=> b!1228075 m!1132697))

(assert (=> b!1228078 m!1132695))

(assert (=> b!1228078 m!1132695))

(declare-fun m!1132699 () Bool)

(assert (=> b!1228078 m!1132699))

(declare-fun m!1132701 () Bool)

(assert (=> b!1228077 m!1132701))

(check-sat (not b!1228075) (not b!1228066) (not b!1228073) (not b!1228076) (not b!1228071) (not b!1228070) (not b!1228077) (not b!1228078) (not b!1228068) (not b!1228069) (not b!1228074) (not b!1228067) (not start!101994))
(check-sat)
