; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62478 () Bool)

(assert start!62478)

(declare-fun b!703144 () Bool)

(declare-fun e!397426 () Bool)

(assert (=> b!703144 (= e!397426 false)))

(declare-datatypes ((array!40168 0))(
  ( (array!40169 (arr!19240 (Array (_ BitVec 32) (_ BitVec 64))) (size!19622 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40168)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13320 0))(
  ( (Nil!13317) (Cons!13316 (h!14361 (_ BitVec 64)) (t!19593 List!13320)) )
))
(declare-fun acc!652 () List!13320)

(declare-fun lt!317535 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40168 (_ BitVec 32) List!13320) Bool)

(assert (=> b!703144 (= lt!317535 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703145 () Bool)

(declare-fun res!467116 () Bool)

(assert (=> b!703145 (=> (not res!467116) (not e!397426))))

(declare-fun contains!3842 (List!13320 (_ BitVec 64)) Bool)

(assert (=> b!703145 (= res!467116 (not (contains!3842 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703146 () Bool)

(declare-fun res!467127 () Bool)

(assert (=> b!703146 (=> (not res!467127) (not e!397426))))

(assert (=> b!703146 (= res!467127 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19622 a!3591)))))

(declare-fun b!703147 () Bool)

(declare-fun res!467130 () Bool)

(assert (=> b!703147 (=> (not res!467130) (not e!397426))))

(declare-fun newAcc!49 () List!13320)

(assert (=> b!703147 (= res!467130 (not (contains!3842 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703148 () Bool)

(declare-fun res!467119 () Bool)

(assert (=> b!703148 (=> (not res!467119) (not e!397426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703148 (= res!467119 (not (validKeyInArray!0 (select (arr!19240 a!3591) from!2969))))))

(declare-fun res!467129 () Bool)

(assert (=> start!62478 (=> (not res!467129) (not e!397426))))

(assert (=> start!62478 (= res!467129 (and (bvslt (size!19622 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19622 a!3591))))))

(assert (=> start!62478 e!397426))

(assert (=> start!62478 true))

(declare-fun array_inv!15123 (array!40168) Bool)

(assert (=> start!62478 (array_inv!15123 a!3591)))

(declare-fun b!703149 () Bool)

(declare-fun res!467118 () Bool)

(assert (=> b!703149 (=> (not res!467118) (not e!397426))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!703149 (= res!467118 (validKeyInArray!0 k!2824))))

(declare-fun b!703150 () Bool)

(declare-fun res!467123 () Bool)

(assert (=> b!703150 (=> (not res!467123) (not e!397426))))

(declare-fun arrayContainsKey!0 (array!40168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703150 (= res!467123 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703151 () Bool)

(declare-fun res!467114 () Bool)

(assert (=> b!703151 (=> (not res!467114) (not e!397426))))

(assert (=> b!703151 (= res!467114 (not (contains!3842 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703152 () Bool)

(declare-fun res!467120 () Bool)

(assert (=> b!703152 (=> (not res!467120) (not e!397426))))

(declare-fun subseq!304 (List!13320 List!13320) Bool)

(assert (=> b!703152 (= res!467120 (subseq!304 acc!652 newAcc!49))))

(declare-fun b!703153 () Bool)

(declare-fun res!467117 () Bool)

(assert (=> b!703153 (=> (not res!467117) (not e!397426))))

(declare-fun noDuplicate!1111 (List!13320) Bool)

(assert (=> b!703153 (= res!467117 (noDuplicate!1111 acc!652))))

(declare-fun b!703154 () Bool)

(declare-fun res!467131 () Bool)

(assert (=> b!703154 (=> (not res!467131) (not e!397426))))

(assert (=> b!703154 (= res!467131 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703155 () Bool)

(declare-fun res!467124 () Bool)

(assert (=> b!703155 (=> (not res!467124) (not e!397426))))

(assert (=> b!703155 (= res!467124 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703156 () Bool)

(declare-fun res!467128 () Bool)

(assert (=> b!703156 (=> (not res!467128) (not e!397426))))

(assert (=> b!703156 (= res!467128 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703157 () Bool)

(declare-fun res!467125 () Bool)

(assert (=> b!703157 (=> (not res!467125) (not e!397426))))

(assert (=> b!703157 (= res!467125 (not (contains!3842 acc!652 k!2824)))))

(declare-fun b!703158 () Bool)

(declare-fun res!467126 () Bool)

(assert (=> b!703158 (=> (not res!467126) (not e!397426))))

(declare-fun -!269 (List!13320 (_ BitVec 64)) List!13320)

(assert (=> b!703158 (= res!467126 (= (-!269 newAcc!49 k!2824) acc!652))))

(declare-fun b!703159 () Bool)

(declare-fun res!467121 () Bool)

(assert (=> b!703159 (=> (not res!467121) (not e!397426))))

(assert (=> b!703159 (= res!467121 (contains!3842 newAcc!49 k!2824))))

(declare-fun b!703160 () Bool)

(declare-fun res!467115 () Bool)

(assert (=> b!703160 (=> (not res!467115) (not e!397426))))

(assert (=> b!703160 (= res!467115 (noDuplicate!1111 newAcc!49))))

(declare-fun b!703161 () Bool)

(declare-fun res!467122 () Bool)

(assert (=> b!703161 (=> (not res!467122) (not e!397426))))

(assert (=> b!703161 (= res!467122 (not (contains!3842 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62478 res!467129) b!703153))

(assert (= (and b!703153 res!467117) b!703160))

(assert (= (and b!703160 res!467115) b!703161))

(assert (= (and b!703161 res!467122) b!703145))

(assert (= (and b!703145 res!467116) b!703150))

(assert (= (and b!703150 res!467123) b!703157))

(assert (= (and b!703157 res!467125) b!703149))

(assert (= (and b!703149 res!467118) b!703155))

(assert (= (and b!703155 res!467124) b!703152))

(assert (= (and b!703152 res!467120) b!703159))

(assert (= (and b!703159 res!467121) b!703158))

(assert (= (and b!703158 res!467126) b!703147))

(assert (= (and b!703147 res!467130) b!703151))

(assert (= (and b!703151 res!467114) b!703146))

(assert (= (and b!703146 res!467127) b!703148))

(assert (= (and b!703148 res!467119) b!703156))

(assert (= (and b!703156 res!467128) b!703154))

(assert (= (and b!703154 res!467131) b!703144))

(declare-fun m!661503 () Bool)

(assert (=> b!703157 m!661503))

(declare-fun m!661505 () Bool)

(assert (=> b!703149 m!661505))

(declare-fun m!661507 () Bool)

(assert (=> b!703154 m!661507))

(declare-fun m!661509 () Bool)

(assert (=> b!703150 m!661509))

(declare-fun m!661511 () Bool)

(assert (=> b!703152 m!661511))

(declare-fun m!661513 () Bool)

(assert (=> b!703151 m!661513))

(declare-fun m!661515 () Bool)

(assert (=> b!703153 m!661515))

(declare-fun m!661517 () Bool)

(assert (=> b!703161 m!661517))

(declare-fun m!661519 () Bool)

(assert (=> b!703159 m!661519))

(declare-fun m!661521 () Bool)

(assert (=> b!703160 m!661521))

(declare-fun m!661523 () Bool)

(assert (=> b!703148 m!661523))

(assert (=> b!703148 m!661523))

(declare-fun m!661525 () Bool)

(assert (=> b!703148 m!661525))

(declare-fun m!661527 () Bool)

(assert (=> b!703155 m!661527))

(declare-fun m!661529 () Bool)

(assert (=> b!703144 m!661529))

(declare-fun m!661531 () Bool)

(assert (=> b!703145 m!661531))

(declare-fun m!661533 () Bool)

(assert (=> b!703147 m!661533))

(declare-fun m!661535 () Bool)

(assert (=> start!62478 m!661535))

(declare-fun m!661537 () Bool)

(assert (=> b!703158 m!661537))

(push 1)

(assert (not b!703159))

(assert (not b!703149))

(assert (not start!62478))

(assert (not b!703161))

(assert (not b!703151))

(assert (not b!703145))

(assert (not b!703148))

(assert (not b!703158))

(assert (not b!703152))

(assert (not b!703160))

(assert (not b!703155))

(assert (not b!703144))

(assert (not b!703153))

(assert (not b!703157))

(assert (not b!703147))

(assert (not b!703150))

(assert (not b!703154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

