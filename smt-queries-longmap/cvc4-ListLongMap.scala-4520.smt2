; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62592 () Bool)

(assert start!62592)

(declare-fun b!706190 () Bool)

(declare-fun res!470008 () Bool)

(declare-fun e!397914 () Bool)

(assert (=> b!706190 (=> (not res!470008) (not e!397914))))

(declare-datatypes ((List!13333 0))(
  ( (Nil!13330) (Cons!13329 (h!14374 (_ BitVec 64)) (t!19615 List!13333)) )
))
(declare-fun acc!652 () List!13333)

(declare-fun noDuplicate!1157 (List!13333) Bool)

(assert (=> b!706190 (= res!470008 (noDuplicate!1157 acc!652))))

(declare-fun b!706191 () Bool)

(declare-fun res!470000 () Bool)

(assert (=> b!706191 (=> (not res!470000) (not e!397914))))

(declare-fun newAcc!49 () List!13333)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3910 (List!13333 (_ BitVec 64)) Bool)

(assert (=> b!706191 (= res!470000 (contains!3910 newAcc!49 k!2824))))

(declare-fun b!706192 () Bool)

(declare-fun res!470006 () Bool)

(assert (=> b!706192 (=> (not res!470006) (not e!397914))))

(assert (=> b!706192 (= res!470006 (not (contains!3910 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706193 () Bool)

(declare-fun res!470009 () Bool)

(assert (=> b!706193 (=> (not res!470009) (not e!397914))))

(declare-fun subseq!355 (List!13333 List!13333) Bool)

(assert (=> b!706193 (= res!470009 (subseq!355 acc!652 newAcc!49))))

(declare-fun b!706194 () Bool)

(declare-fun res!470007 () Bool)

(assert (=> b!706194 (=> (not res!470007) (not e!397914))))

(assert (=> b!706194 (= res!470007 (not (contains!3910 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706195 () Bool)

(declare-fun res!470003 () Bool)

(assert (=> b!706195 (=> (not res!470003) (not e!397914))))

(declare-datatypes ((array!40271 0))(
  ( (array!40272 (arr!19292 (Array (_ BitVec 32) (_ BitVec 64))) (size!19677 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40271)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40271 (_ BitVec 32) List!13333) Bool)

(assert (=> b!706195 (= res!470003 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706196 () Bool)

(declare-fun res!470005 () Bool)

(assert (=> b!706196 (=> (not res!470005) (not e!397914))))

(assert (=> b!706196 (= res!470005 (not (contains!3910 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706197 () Bool)

(declare-fun res!470001 () Bool)

(assert (=> b!706197 (=> (not res!470001) (not e!397914))))

(assert (=> b!706197 (= res!470001 (not (contains!3910 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706198 () Bool)

(declare-fun res!470002 () Bool)

(assert (=> b!706198 (=> (not res!470002) (not e!397914))))

(declare-fun -!320 (List!13333 (_ BitVec 64)) List!13333)

(assert (=> b!706198 (= res!470002 (= (-!320 newAcc!49 k!2824) acc!652))))

(declare-fun b!706199 () Bool)

(declare-fun res!470013 () Bool)

(assert (=> b!706199 (=> (not res!470013) (not e!397914))))

(declare-fun arrayContainsKey!0 (array!40271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706199 (= res!470013 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706200 () Bool)

(declare-fun res!470012 () Bool)

(assert (=> b!706200 (=> (not res!470012) (not e!397914))))

(assert (=> b!706200 (= res!470012 (not (contains!3910 acc!652 k!2824)))))

(declare-fun b!706201 () Bool)

(assert (=> b!706201 (= e!397914 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19677 a!3591)) (bvsgt from!2969 (size!19677 a!3591))))))

(declare-fun b!706202 () Bool)

(declare-fun res!470004 () Bool)

(assert (=> b!706202 (=> (not res!470004) (not e!397914))))

(assert (=> b!706202 (= res!470004 (noDuplicate!1157 newAcc!49))))

(declare-fun b!706203 () Bool)

(declare-fun res!470011 () Bool)

(assert (=> b!706203 (=> (not res!470011) (not e!397914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706203 (= res!470011 (validKeyInArray!0 k!2824))))

(declare-fun res!470010 () Bool)

(assert (=> start!62592 (=> (not res!470010) (not e!397914))))

(assert (=> start!62592 (= res!470010 (and (bvslt (size!19677 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19677 a!3591))))))

(assert (=> start!62592 e!397914))

(assert (=> start!62592 true))

(declare-fun array_inv!15088 (array!40271) Bool)

(assert (=> start!62592 (array_inv!15088 a!3591)))

(assert (= (and start!62592 res!470010) b!706190))

(assert (= (and b!706190 res!470008) b!706202))

(assert (= (and b!706202 res!470004) b!706197))

(assert (= (and b!706197 res!470001) b!706194))

(assert (= (and b!706194 res!470007) b!706199))

(assert (= (and b!706199 res!470013) b!706200))

(assert (= (and b!706200 res!470012) b!706203))

(assert (= (and b!706203 res!470011) b!706195))

(assert (= (and b!706195 res!470003) b!706193))

(assert (= (and b!706193 res!470009) b!706191))

(assert (= (and b!706191 res!470000) b!706198))

(assert (= (and b!706198 res!470002) b!706192))

(assert (= (and b!706192 res!470006) b!706196))

(assert (= (and b!706196 res!470005) b!706201))

(declare-fun m!664131 () Bool)

(assert (=> b!706192 m!664131))

(declare-fun m!664133 () Bool)

(assert (=> b!706202 m!664133))

(declare-fun m!664135 () Bool)

(assert (=> b!706194 m!664135))

(declare-fun m!664137 () Bool)

(assert (=> b!706197 m!664137))

(declare-fun m!664139 () Bool)

(assert (=> b!706203 m!664139))

(declare-fun m!664141 () Bool)

(assert (=> b!706199 m!664141))

(declare-fun m!664143 () Bool)

(assert (=> b!706200 m!664143))

(declare-fun m!664145 () Bool)

(assert (=> b!706190 m!664145))

(declare-fun m!664147 () Bool)

(assert (=> start!62592 m!664147))

(declare-fun m!664149 () Bool)

(assert (=> b!706198 m!664149))

(declare-fun m!664151 () Bool)

(assert (=> b!706195 m!664151))

(declare-fun m!664153 () Bool)

(assert (=> b!706196 m!664153))

(declare-fun m!664155 () Bool)

(assert (=> b!706191 m!664155))

(declare-fun m!664157 () Bool)

(assert (=> b!706193 m!664157))

(push 1)

(assert (not b!706194))

(assert (not b!706202))

(assert (not b!706196))

(assert (not b!706197))

(assert (not b!706192))

(assert (not b!706190))

(assert (not b!706199))

(assert (not b!706200))

(assert (not b!706191))

(assert (not b!706193))

(assert (not b!706195))

(assert (not b!706198))

(assert (not start!62592))

(assert (not b!706203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

