; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62590 () Bool)

(assert start!62590)

(declare-fun b!706148 () Bool)

(declare-fun res!469969 () Bool)

(declare-fun e!397908 () Bool)

(assert (=> b!706148 (=> (not res!469969) (not e!397908))))

(declare-datatypes ((List!13332 0))(
  ( (Nil!13329) (Cons!13328 (h!14373 (_ BitVec 64)) (t!19614 List!13332)) )
))
(declare-fun newAcc!49 () List!13332)

(declare-fun contains!3909 (List!13332 (_ BitVec 64)) Bool)

(assert (=> b!706148 (= res!469969 (not (contains!3909 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706149 () Bool)

(declare-fun res!469958 () Bool)

(assert (=> b!706149 (=> (not res!469958) (not e!397908))))

(declare-fun acc!652 () List!13332)

(declare-fun noDuplicate!1156 (List!13332) Bool)

(assert (=> b!706149 (= res!469958 (noDuplicate!1156 acc!652))))

(declare-fun b!706150 () Bool)

(declare-fun res!469965 () Bool)

(assert (=> b!706150 (=> (not res!469965) (not e!397908))))

(assert (=> b!706150 (= res!469965 (not (contains!3909 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706151 () Bool)

(declare-fun res!469963 () Bool)

(assert (=> b!706151 (=> (not res!469963) (not e!397908))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!706151 (= res!469963 (contains!3909 newAcc!49 k0!2824))))

(declare-fun b!706152 () Bool)

(declare-fun res!469959 () Bool)

(assert (=> b!706152 (=> (not res!469959) (not e!397908))))

(assert (=> b!706152 (= res!469959 (not (contains!3909 acc!652 k0!2824)))))

(declare-fun b!706153 () Bool)

(declare-fun res!469966 () Bool)

(assert (=> b!706153 (=> (not res!469966) (not e!397908))))

(declare-fun subseq!354 (List!13332 List!13332) Bool)

(assert (=> b!706153 (= res!469966 (subseq!354 acc!652 newAcc!49))))

(declare-fun b!706155 () Bool)

(declare-fun res!469968 () Bool)

(assert (=> b!706155 (=> (not res!469968) (not e!397908))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40269 0))(
  ( (array!40270 (arr!19291 (Array (_ BitVec 32) (_ BitVec 64))) (size!19676 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40269)

(declare-fun arrayNoDuplicates!0 (array!40269 (_ BitVec 32) List!13332) Bool)

(assert (=> b!706155 (= res!469968 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706156 () Bool)

(assert (=> b!706156 (= e!397908 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19676 a!3591)) (bvsgt from!2969 (size!19676 a!3591))))))

(declare-fun b!706157 () Bool)

(declare-fun res!469971 () Bool)

(assert (=> b!706157 (=> (not res!469971) (not e!397908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706157 (= res!469971 (validKeyInArray!0 k0!2824))))

(declare-fun b!706158 () Bool)

(declare-fun res!469960 () Bool)

(assert (=> b!706158 (=> (not res!469960) (not e!397908))))

(assert (=> b!706158 (= res!469960 (not (contains!3909 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706159 () Bool)

(declare-fun res!469964 () Bool)

(assert (=> b!706159 (=> (not res!469964) (not e!397908))))

(assert (=> b!706159 (= res!469964 (not (contains!3909 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706160 () Bool)

(declare-fun res!469961 () Bool)

(assert (=> b!706160 (=> (not res!469961) (not e!397908))))

(declare-fun -!319 (List!13332 (_ BitVec 64)) List!13332)

(assert (=> b!706160 (= res!469961 (= (-!319 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706161 () Bool)

(declare-fun res!469970 () Bool)

(assert (=> b!706161 (=> (not res!469970) (not e!397908))))

(assert (=> b!706161 (= res!469970 (noDuplicate!1156 newAcc!49))))

(declare-fun res!469962 () Bool)

(assert (=> start!62590 (=> (not res!469962) (not e!397908))))

(assert (=> start!62590 (= res!469962 (and (bvslt (size!19676 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19676 a!3591))))))

(assert (=> start!62590 e!397908))

(assert (=> start!62590 true))

(declare-fun array_inv!15087 (array!40269) Bool)

(assert (=> start!62590 (array_inv!15087 a!3591)))

(declare-fun b!706154 () Bool)

(declare-fun res!469967 () Bool)

(assert (=> b!706154 (=> (not res!469967) (not e!397908))))

(declare-fun arrayContainsKey!0 (array!40269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706154 (= res!469967 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62590 res!469962) b!706149))

(assert (= (and b!706149 res!469958) b!706161))

(assert (= (and b!706161 res!469970) b!706150))

(assert (= (and b!706150 res!469965) b!706159))

(assert (= (and b!706159 res!469964) b!706154))

(assert (= (and b!706154 res!469967) b!706152))

(assert (= (and b!706152 res!469959) b!706157))

(assert (= (and b!706157 res!469971) b!706155))

(assert (= (and b!706155 res!469968) b!706153))

(assert (= (and b!706153 res!469966) b!706151))

(assert (= (and b!706151 res!469963) b!706160))

(assert (= (and b!706160 res!469961) b!706148))

(assert (= (and b!706148 res!469969) b!706158))

(assert (= (and b!706158 res!469960) b!706156))

(declare-fun m!664103 () Bool)

(assert (=> b!706161 m!664103))

(declare-fun m!664105 () Bool)

(assert (=> b!706158 m!664105))

(declare-fun m!664107 () Bool)

(assert (=> b!706151 m!664107))

(declare-fun m!664109 () Bool)

(assert (=> b!706159 m!664109))

(declare-fun m!664111 () Bool)

(assert (=> b!706153 m!664111))

(declare-fun m!664113 () Bool)

(assert (=> b!706152 m!664113))

(declare-fun m!664115 () Bool)

(assert (=> b!706154 m!664115))

(declare-fun m!664117 () Bool)

(assert (=> b!706148 m!664117))

(declare-fun m!664119 () Bool)

(assert (=> b!706155 m!664119))

(declare-fun m!664121 () Bool)

(assert (=> b!706160 m!664121))

(declare-fun m!664123 () Bool)

(assert (=> b!706150 m!664123))

(declare-fun m!664125 () Bool)

(assert (=> b!706149 m!664125))

(declare-fun m!664127 () Bool)

(assert (=> b!706157 m!664127))

(declare-fun m!664129 () Bool)

(assert (=> start!62590 m!664129))

(check-sat (not b!706148) (not b!706150) (not b!706155) (not b!706159) (not b!706158) (not b!706154) (not start!62590) (not b!706153) (not b!706157) (not b!706160) (not b!706152) (not b!706161) (not b!706151) (not b!706149))
(check-sat)
