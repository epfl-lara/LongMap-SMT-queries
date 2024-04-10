; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60310 () Bool)

(assert start!60310)

(declare-fun b!677139 () Bool)

(declare-fun res!443578 () Bool)

(declare-fun e!386063 () Bool)

(assert (=> b!677139 (=> (not res!443578) (not e!386063))))

(declare-datatypes ((List!12912 0))(
  ( (Nil!12909) (Cons!12908 (h!13953 (_ BitVec 64)) (t!19140 List!12912)) )
))
(declare-fun acc!681 () List!12912)

(declare-fun contains!3489 (List!12912 (_ BitVec 64)) Bool)

(assert (=> b!677139 (= res!443578 (not (contains!3489 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677140 () Bool)

(declare-fun res!443565 () Bool)

(assert (=> b!677140 (=> (not res!443565) (not e!386063))))

(declare-datatypes ((array!39357 0))(
  ( (array!39358 (arr!18871 (Array (_ BitVec 32) (_ BitVec 64))) (size!19235 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39357)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677140 (= res!443565 (not (validKeyInArray!0 (select (arr!18871 a!3626) from!3004))))))

(declare-fun b!677141 () Bool)

(declare-fun res!443579 () Bool)

(assert (=> b!677141 (=> (not res!443579) (not e!386063))))

(declare-fun arrayNoDuplicates!0 (array!39357 (_ BitVec 32) List!12912) Bool)

(assert (=> b!677141 (= res!443579 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677142 () Bool)

(declare-fun res!443582 () Bool)

(assert (=> b!677142 (=> (not res!443582) (not e!386063))))

(declare-fun e!386070 () Bool)

(assert (=> b!677142 (= res!443582 e!386070)))

(declare-fun res!443584 () Bool)

(assert (=> b!677142 (=> res!443584 e!386070)))

(declare-fun e!386064 () Bool)

(assert (=> b!677142 (= res!443584 e!386064)))

(declare-fun res!443570 () Bool)

(assert (=> b!677142 (=> (not res!443570) (not e!386064))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677142 (= res!443570 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677143 () Bool)

(declare-fun res!443571 () Bool)

(assert (=> b!677143 (=> (not res!443571) (not e!386063))))

(assert (=> b!677143 (= res!443571 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19235 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677144 () Bool)

(declare-fun e!386066 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!677144 (= e!386066 (not (contains!3489 acc!681 k0!2843)))))

(declare-fun b!677145 () Bool)

(declare-fun res!443583 () Bool)

(assert (=> b!677145 (=> (not res!443583) (not e!386063))))

(assert (=> b!677145 (= res!443583 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!443573 () Bool)

(assert (=> start!60310 (=> (not res!443573) (not e!386063))))

(assert (=> start!60310 (= res!443573 (and (bvslt (size!19235 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19235 a!3626))))))

(assert (=> start!60310 e!386063))

(assert (=> start!60310 true))

(declare-fun array_inv!14667 (array!39357) Bool)

(assert (=> start!60310 (array_inv!14667 a!3626)))

(declare-fun b!677146 () Bool)

(declare-fun res!443569 () Bool)

(assert (=> b!677146 (=> (not res!443569) (not e!386063))))

(declare-fun arrayContainsKey!0 (array!39357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677146 (= res!443569 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677147 () Bool)

(declare-fun e!386065 () Bool)

(assert (=> b!677147 (= e!386065 (contains!3489 acc!681 k0!2843))))

(declare-fun b!677148 () Bool)

(declare-fun e!386067 () Bool)

(assert (=> b!677148 (= e!386067 e!386066)))

(declare-fun res!443566 () Bool)

(assert (=> b!677148 (=> (not res!443566) (not e!386066))))

(assert (=> b!677148 (= res!443566 (bvsle from!3004 i!1382))))

(declare-fun b!677149 () Bool)

(declare-fun res!443568 () Bool)

(assert (=> b!677149 (=> (not res!443568) (not e!386063))))

(assert (=> b!677149 (= res!443568 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12909))))

(declare-fun b!677150 () Bool)

(declare-fun res!443580 () Bool)

(assert (=> b!677150 (=> (not res!443580) (not e!386063))))

(assert (=> b!677150 (= res!443580 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19235 a!3626))))))

(declare-fun b!677151 () Bool)

(declare-fun res!443575 () Bool)

(assert (=> b!677151 (=> (not res!443575) (not e!386063))))

(assert (=> b!677151 (= res!443575 e!386067)))

(declare-fun res!443577 () Bool)

(assert (=> b!677151 (=> res!443577 e!386067)))

(assert (=> b!677151 (= res!443577 e!386065)))

(declare-fun res!443567 () Bool)

(assert (=> b!677151 (=> (not res!443567) (not e!386065))))

(assert (=> b!677151 (= res!443567 (bvsgt from!3004 i!1382))))

(declare-fun b!677152 () Bool)

(declare-fun res!443576 () Bool)

(assert (=> b!677152 (=> (not res!443576) (not e!386063))))

(declare-fun noDuplicate!736 (List!12912) Bool)

(assert (=> b!677152 (= res!443576 (noDuplicate!736 acc!681))))

(declare-fun b!677153 () Bool)

(declare-fun res!443574 () Bool)

(assert (=> b!677153 (=> (not res!443574) (not e!386063))))

(assert (=> b!677153 (= res!443574 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677154 () Bool)

(declare-fun res!443585 () Bool)

(assert (=> b!677154 (=> (not res!443585) (not e!386063))))

(assert (=> b!677154 (= res!443585 (not (contains!3489 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677155 () Bool)

(assert (=> b!677155 (= e!386063 (not (bvsle from!3004 (size!19235 a!3626))))))

(assert (=> b!677155 (arrayNoDuplicates!0 (array!39358 (store (arr!18871 a!3626) i!1382 k0!2843) (size!19235 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23762 0))(
  ( (Unit!23763) )
))
(declare-fun lt!312811 () Unit!23762)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12912) Unit!23762)

(assert (=> b!677155 (= lt!312811 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677156 () Bool)

(declare-fun e!386069 () Bool)

(assert (=> b!677156 (= e!386069 (not (contains!3489 acc!681 k0!2843)))))

(declare-fun b!677157 () Bool)

(assert (=> b!677157 (= e!386064 (contains!3489 acc!681 k0!2843))))

(declare-fun b!677158 () Bool)

(declare-fun res!443572 () Bool)

(assert (=> b!677158 (=> (not res!443572) (not e!386063))))

(assert (=> b!677158 (= res!443572 (validKeyInArray!0 k0!2843))))

(declare-fun b!677159 () Bool)

(assert (=> b!677159 (= e!386070 e!386069)))

(declare-fun res!443581 () Bool)

(assert (=> b!677159 (=> (not res!443581) (not e!386069))))

(assert (=> b!677159 (= res!443581 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60310 res!443573) b!677152))

(assert (= (and b!677152 res!443576) b!677139))

(assert (= (and b!677139 res!443578) b!677154))

(assert (= (and b!677154 res!443585) b!677151))

(assert (= (and b!677151 res!443567) b!677147))

(assert (= (and b!677151 (not res!443577)) b!677148))

(assert (= (and b!677148 res!443566) b!677144))

(assert (= (and b!677151 res!443575) b!677149))

(assert (= (and b!677149 res!443568) b!677145))

(assert (= (and b!677145 res!443583) b!677150))

(assert (= (and b!677150 res!443580) b!677158))

(assert (= (and b!677158 res!443572) b!677146))

(assert (= (and b!677146 res!443569) b!677143))

(assert (= (and b!677143 res!443571) b!677140))

(assert (= (and b!677140 res!443565) b!677153))

(assert (= (and b!677153 res!443574) b!677142))

(assert (= (and b!677142 res!443570) b!677157))

(assert (= (and b!677142 (not res!443584)) b!677159))

(assert (= (and b!677159 res!443581) b!677156))

(assert (= (and b!677142 res!443582) b!677141))

(assert (= (and b!677141 res!443579) b!677155))

(declare-fun m!643577 () Bool)

(assert (=> b!677139 m!643577))

(declare-fun m!643579 () Bool)

(assert (=> b!677147 m!643579))

(declare-fun m!643581 () Bool)

(assert (=> b!677140 m!643581))

(assert (=> b!677140 m!643581))

(declare-fun m!643583 () Bool)

(assert (=> b!677140 m!643583))

(declare-fun m!643585 () Bool)

(assert (=> b!677158 m!643585))

(assert (=> b!677144 m!643579))

(declare-fun m!643587 () Bool)

(assert (=> b!677149 m!643587))

(declare-fun m!643589 () Bool)

(assert (=> b!677155 m!643589))

(declare-fun m!643591 () Bool)

(assert (=> b!677155 m!643591))

(declare-fun m!643593 () Bool)

(assert (=> b!677155 m!643593))

(declare-fun m!643595 () Bool)

(assert (=> b!677141 m!643595))

(declare-fun m!643597 () Bool)

(assert (=> b!677145 m!643597))

(declare-fun m!643599 () Bool)

(assert (=> b!677154 m!643599))

(assert (=> b!677157 m!643579))

(declare-fun m!643601 () Bool)

(assert (=> start!60310 m!643601))

(declare-fun m!643603 () Bool)

(assert (=> b!677146 m!643603))

(assert (=> b!677156 m!643579))

(declare-fun m!643605 () Bool)

(assert (=> b!677152 m!643605))

(check-sat (not b!677157) (not b!677139) (not b!677154) (not b!677156) (not b!677146) (not b!677158) (not b!677155) (not b!677141) (not b!677145) (not b!677144) (not b!677147) (not b!677149) (not b!677140) (not b!677152) (not start!60310))
(check-sat)
