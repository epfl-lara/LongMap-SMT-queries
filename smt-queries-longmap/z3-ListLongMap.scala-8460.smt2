; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103132 () Bool)

(assert start!103132)

(declare-fun b!1237949 () Bool)

(declare-fun res!825142 () Bool)

(declare-fun e!701755 () Bool)

(assert (=> b!1237949 (=> (not res!825142) (not e!701755))))

(declare-datatypes ((List!27275 0))(
  ( (Nil!27272) (Cons!27271 (h!28489 (_ BitVec 64)) (t!40730 List!27275)) )
))
(declare-fun acc!846 () List!27275)

(declare-fun contains!7346 (List!27275 (_ BitVec 64)) Bool)

(assert (=> b!1237949 (= res!825142 (not (contains!7346 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237950 () Bool)

(declare-fun res!825146 () Bool)

(assert (=> b!1237950 (=> (not res!825146) (not e!701755))))

(declare-datatypes ((array!79775 0))(
  ( (array!79776 (arr!38489 (Array (_ BitVec 32) (_ BitVec 64))) (size!39026 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79775)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237950 (= res!825146 (validKeyInArray!0 (select (arr!38489 a!3835) from!3213)))))

(declare-fun b!1237951 () Bool)

(declare-fun res!825145 () Bool)

(assert (=> b!1237951 (=> (not res!825145) (not e!701755))))

(declare-fun arrayNoDuplicates!0 (array!79775 (_ BitVec 32) List!27275) Bool)

(assert (=> b!1237951 (= res!825145 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237952 () Bool)

(declare-fun res!825143 () Bool)

(assert (=> b!1237952 (=> (not res!825143) (not e!701755))))

(assert (=> b!1237952 (= res!825143 (not (contains!7346 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825147 () Bool)

(assert (=> start!103132 (=> (not res!825147) (not e!701755))))

(assert (=> start!103132 (= res!825147 (and (bvslt (size!39026 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39026 a!3835))))))

(assert (=> start!103132 e!701755))

(declare-fun array_inv!29427 (array!79775) Bool)

(assert (=> start!103132 (array_inv!29427 a!3835)))

(assert (=> start!103132 true))

(declare-fun b!1237953 () Bool)

(declare-fun res!825141 () Bool)

(assert (=> b!1237953 (=> (not res!825141) (not e!701755))))

(assert (=> b!1237953 (= res!825141 (not (= from!3213 (bvsub (size!39026 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237954 () Bool)

(declare-fun res!825144 () Bool)

(assert (=> b!1237954 (=> (not res!825144) (not e!701755))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237954 (= res!825144 (contains!7346 acc!846 k0!2925))))

(declare-fun b!1237955 () Bool)

(declare-fun res!825140 () Bool)

(assert (=> b!1237955 (=> (not res!825140) (not e!701755))))

(declare-fun noDuplicate!1927 (List!27275) Bool)

(assert (=> b!1237955 (= res!825140 (noDuplicate!1927 acc!846))))

(declare-fun b!1237956 () Bool)

(assert (=> b!1237956 (= e!701755 (not true))))

(declare-fun lt!561319 () List!27275)

(declare-fun subseq!566 (List!27275 List!27275) Bool)

(assert (=> b!1237956 (subseq!566 lt!561319 lt!561319)))

(declare-datatypes ((Unit!40991 0))(
  ( (Unit!40992) )
))
(declare-fun lt!561320 () Unit!40991)

(declare-fun lemmaListSubSeqRefl!0 (List!27275) Unit!40991)

(assert (=> b!1237956 (= lt!561320 (lemmaListSubSeqRefl!0 lt!561319))))

(assert (=> b!1237956 (= lt!561319 (Cons!27271 (select (arr!38489 a!3835) from!3213) acc!846))))

(assert (= (and start!103132 res!825147) b!1237955))

(assert (= (and b!1237955 res!825140) b!1237952))

(assert (= (and b!1237952 res!825143) b!1237949))

(assert (= (and b!1237949 res!825142) b!1237951))

(assert (= (and b!1237951 res!825145) b!1237954))

(assert (= (and b!1237954 res!825144) b!1237953))

(assert (= (and b!1237953 res!825141) b!1237950))

(assert (= (and b!1237950 res!825146) b!1237956))

(declare-fun m!1142039 () Bool)

(assert (=> b!1237954 m!1142039))

(declare-fun m!1142041 () Bool)

(assert (=> b!1237951 m!1142041))

(declare-fun m!1142043 () Bool)

(assert (=> b!1237955 m!1142043))

(declare-fun m!1142045 () Bool)

(assert (=> start!103132 m!1142045))

(declare-fun m!1142047 () Bool)

(assert (=> b!1237952 m!1142047))

(declare-fun m!1142049 () Bool)

(assert (=> b!1237950 m!1142049))

(assert (=> b!1237950 m!1142049))

(declare-fun m!1142051 () Bool)

(assert (=> b!1237950 m!1142051))

(declare-fun m!1142053 () Bool)

(assert (=> b!1237949 m!1142053))

(declare-fun m!1142055 () Bool)

(assert (=> b!1237956 m!1142055))

(declare-fun m!1142057 () Bool)

(assert (=> b!1237956 m!1142057))

(assert (=> b!1237956 m!1142049))

(check-sat (not b!1237949) (not b!1237950) (not b!1237955) (not b!1237951) (not b!1237956) (not b!1237952) (not b!1237954) (not start!103132))
(check-sat)
