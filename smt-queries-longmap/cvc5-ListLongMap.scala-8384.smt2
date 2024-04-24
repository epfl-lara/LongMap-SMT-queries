; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102220 () Bool)

(assert start!102220)

(declare-fun b!1229158 () Bool)

(declare-fun e!697915 () Bool)

(declare-fun e!697914 () Bool)

(assert (=> b!1229158 (= e!697915 (not e!697914))))

(declare-fun res!817000 () Bool)

(assert (=> b!1229158 (=> res!817000 e!697914)))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79293 0))(
  ( (array!79294 (arr!38263 (Array (_ BitVec 32) (_ BitVec 64))) (size!38800 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79293)

(assert (=> b!1229158 (= res!817000 (bvsgt from!3184 (size!38800 a!3806)))))

(declare-datatypes ((List!27049 0))(
  ( (Nil!27046) (Cons!27045 (h!28263 (_ BitVec 64)) (t!40504 List!27049)) )
))
(declare-fun acc!823 () List!27049)

(declare-fun arrayNoDuplicates!0 (array!79293 (_ BitVec 32) List!27049) Bool)

(assert (=> b!1229158 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27045 (select (arr!38263 a!3806) from!3184) acc!823))))

(declare-fun b!1229159 () Bool)

(assert (=> b!1229159 (= e!697914 true)))

(declare-datatypes ((Unit!40641 0))(
  ( (Unit!40642) )
))
(declare-fun lt!559428 () Unit!40641)

(declare-fun noDuplicateSubseq!43 (List!27049 List!27049) Unit!40641)

(assert (=> b!1229159 (= lt!559428 (noDuplicateSubseq!43 Nil!27046 acc!823))))

(declare-fun b!1229160 () Bool)

(declare-fun res!816996 () Bool)

(assert (=> b!1229160 (=> res!816996 e!697914)))

(declare-fun contains!7120 (List!27049 (_ BitVec 64)) Bool)

(assert (=> b!1229160 (= res!816996 (contains!7120 Nil!27046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229161 () Bool)

(declare-fun res!816999 () Bool)

(assert (=> b!1229161 (=> res!816999 e!697914)))

(assert (=> b!1229161 (= res!816999 (contains!7120 Nil!27046 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229162 () Bool)

(declare-fun res!816997 () Bool)

(assert (=> b!1229162 (=> (not res!816997) (not e!697915))))

(assert (=> b!1229162 (= res!816997 (not (contains!7120 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229163 () Bool)

(declare-fun res!816994 () Bool)

(assert (=> b!1229163 (=> res!816994 e!697914)))

(declare-fun subseq!490 (List!27049 List!27049) Bool)

(assert (=> b!1229163 (= res!816994 (not (subseq!490 Nil!27046 acc!823)))))

(declare-fun b!1229164 () Bool)

(declare-fun res!816990 () Bool)

(assert (=> b!1229164 (=> (not res!816990) (not e!697915))))

(assert (=> b!1229164 (= res!816990 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229166 () Bool)

(declare-fun res!816989 () Bool)

(assert (=> b!1229166 (=> (not res!816989) (not e!697915))))

(declare-fun noDuplicate!1701 (List!27049) Bool)

(assert (=> b!1229166 (= res!816989 (noDuplicate!1701 acc!823))))

(declare-fun b!1229167 () Bool)

(declare-fun res!817001 () Bool)

(assert (=> b!1229167 (=> (not res!817001) (not e!697915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229167 (= res!817001 (validKeyInArray!0 (select (arr!38263 a!3806) from!3184)))))

(declare-fun b!1229168 () Bool)

(declare-fun res!816991 () Bool)

(assert (=> b!1229168 (=> (not res!816991) (not e!697915))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1229168 (= res!816991 (validKeyInArray!0 k!2913))))

(declare-fun b!1229165 () Bool)

(declare-fun res!816992 () Bool)

(assert (=> b!1229165 (=> (not res!816992) (not e!697915))))

(assert (=> b!1229165 (= res!816992 (not (contains!7120 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816998 () Bool)

(assert (=> start!102220 (=> (not res!816998) (not e!697915))))

(assert (=> start!102220 (= res!816998 (bvslt (size!38800 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102220 e!697915))

(declare-fun array_inv!29201 (array!79293) Bool)

(assert (=> start!102220 (array_inv!29201 a!3806)))

(assert (=> start!102220 true))

(declare-fun b!1229169 () Bool)

(declare-fun res!816993 () Bool)

(assert (=> b!1229169 (=> (not res!816993) (not e!697915))))

(declare-fun arrayContainsKey!0 (array!79293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229169 (= res!816993 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229170 () Bool)

(declare-fun res!816995 () Bool)

(assert (=> b!1229170 (=> (not res!816995) (not e!697915))))

(assert (=> b!1229170 (= res!816995 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38800 a!3806)) (bvslt from!3184 (size!38800 a!3806))))))

(assert (= (and start!102220 res!816998) b!1229168))

(assert (= (and b!1229168 res!816991) b!1229170))

(assert (= (and b!1229170 res!816995) b!1229166))

(assert (= (and b!1229166 res!816989) b!1229165))

(assert (= (and b!1229165 res!816992) b!1229162))

(assert (= (and b!1229162 res!816997) b!1229169))

(assert (= (and b!1229169 res!816993) b!1229164))

(assert (= (and b!1229164 res!816990) b!1229167))

(assert (= (and b!1229167 res!817001) b!1229158))

(assert (= (and b!1229158 (not res!817000)) b!1229160))

(assert (= (and b!1229160 (not res!816996)) b!1229161))

(assert (= (and b!1229161 (not res!816999)) b!1229163))

(assert (= (and b!1229163 (not res!816994)) b!1229159))

(declare-fun m!1134125 () Bool)

(assert (=> b!1229158 m!1134125))

(declare-fun m!1134127 () Bool)

(assert (=> b!1229158 m!1134127))

(declare-fun m!1134129 () Bool)

(assert (=> b!1229160 m!1134129))

(declare-fun m!1134131 () Bool)

(assert (=> b!1229168 m!1134131))

(declare-fun m!1134133 () Bool)

(assert (=> b!1229166 m!1134133))

(assert (=> b!1229167 m!1134125))

(assert (=> b!1229167 m!1134125))

(declare-fun m!1134135 () Bool)

(assert (=> b!1229167 m!1134135))

(declare-fun m!1134137 () Bool)

(assert (=> b!1229164 m!1134137))

(declare-fun m!1134139 () Bool)

(assert (=> b!1229163 m!1134139))

(declare-fun m!1134141 () Bool)

(assert (=> b!1229162 m!1134141))

(declare-fun m!1134143 () Bool)

(assert (=> b!1229161 m!1134143))

(declare-fun m!1134145 () Bool)

(assert (=> b!1229165 m!1134145))

(declare-fun m!1134147 () Bool)

(assert (=> b!1229169 m!1134147))

(declare-fun m!1134149 () Bool)

(assert (=> start!102220 m!1134149))

(declare-fun m!1134151 () Bool)

(assert (=> b!1229159 m!1134151))

(push 1)

(assert (not b!1229166))

(assert (not b!1229158))

(assert (not b!1229163))

(assert (not start!102220))

(assert (not b!1229165))

(assert (not b!1229164))

(assert (not b!1229162))

(assert (not b!1229160))

(assert (not b!1229161))

(assert (not b!1229168))

(assert (not b!1229167))

(assert (not b!1229169))

(assert (not b!1229159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

