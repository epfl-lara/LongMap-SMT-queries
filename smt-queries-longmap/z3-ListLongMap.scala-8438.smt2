; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103000 () Bool)

(assert start!103000)

(declare-fun res!823520 () Bool)

(declare-fun e!701137 () Bool)

(assert (=> start!103000 (=> (not res!823520) (not e!701137))))

(declare-datatypes ((array!79643 0))(
  ( (array!79644 (arr!38423 (Array (_ BitVec 32) (_ BitVec 64))) (size!38960 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79643)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103000 (= res!823520 (and (bvslt (size!38960 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38960 a!3835))))))

(assert (=> start!103000 e!701137))

(declare-fun array_inv!29361 (array!79643) Bool)

(assert (=> start!103000 (array_inv!29361 a!3835)))

(assert (=> start!103000 true))

(declare-fun b!1236139 () Bool)

(declare-fun res!823516 () Bool)

(assert (=> b!1236139 (=> (not res!823516) (not e!701137))))

(declare-datatypes ((List!27209 0))(
  ( (Nil!27206) (Cons!27205 (h!28423 (_ BitVec 64)) (t!40664 List!27209)) )
))
(declare-fun acc!846 () List!27209)

(declare-fun noDuplicate!1861 (List!27209) Bool)

(assert (=> b!1236139 (= res!823516 (noDuplicate!1861 acc!846))))

(declare-fun b!1236140 () Bool)

(declare-fun res!823512 () Bool)

(assert (=> b!1236140 (=> (not res!823512) (not e!701137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236140 (= res!823512 (validKeyInArray!0 (select (arr!38423 a!3835) from!3213)))))

(declare-fun b!1236141 () Bool)

(declare-fun res!823517 () Bool)

(assert (=> b!1236141 (=> (not res!823517) (not e!701137))))

(assert (=> b!1236141 (= res!823517 (not (= from!3213 (bvsub (size!38960 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236142 () Bool)

(declare-fun e!701138 () Bool)

(assert (=> b!1236142 (= e!701138 true)))

(declare-fun lt!560497 () List!27209)

(declare-fun lt!560499 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79643 (_ BitVec 32) List!27209) Bool)

(assert (=> b!1236142 (= lt!560499 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560497))))

(declare-datatypes ((Unit!40865 0))(
  ( (Unit!40866) )
))
(declare-fun lt!560500 () Unit!40865)

(declare-fun noDuplicateSubseq!65 (List!27209 List!27209) Unit!40865)

(assert (=> b!1236142 (= lt!560500 (noDuplicateSubseq!65 acc!846 lt!560497))))

(declare-fun b!1236143 () Bool)

(declare-fun res!823511 () Bool)

(assert (=> b!1236143 (=> (not res!823511) (not e!701137))))

(declare-fun contains!7280 (List!27209 (_ BitVec 64)) Bool)

(assert (=> b!1236143 (= res!823511 (not (contains!7280 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236144 () Bool)

(declare-fun res!823514 () Bool)

(assert (=> b!1236144 (=> res!823514 e!701138)))

(assert (=> b!1236144 (= res!823514 (not (noDuplicate!1861 lt!560497)))))

(declare-fun b!1236145 () Bool)

(declare-fun res!823519 () Bool)

(assert (=> b!1236145 (=> (not res!823519) (not e!701137))))

(assert (=> b!1236145 (= res!823519 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236146 () Bool)

(declare-fun res!823513 () Bool)

(assert (=> b!1236146 (=> res!823513 e!701138)))

(assert (=> b!1236146 (= res!823513 (contains!7280 lt!560497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236147 () Bool)

(assert (=> b!1236147 (= e!701137 (not e!701138))))

(declare-fun res!823510 () Bool)

(assert (=> b!1236147 (=> res!823510 e!701138)))

(assert (=> b!1236147 (= res!823510 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!518 (List!27209 List!27209) Bool)

(assert (=> b!1236147 (subseq!518 acc!846 lt!560497)))

(declare-fun lt!560498 () Unit!40865)

(declare-fun subseqTail!11 (List!27209 List!27209) Unit!40865)

(assert (=> b!1236147 (= lt!560498 (subseqTail!11 lt!560497 lt!560497))))

(assert (=> b!1236147 (subseq!518 lt!560497 lt!560497)))

(declare-fun lt!560501 () Unit!40865)

(declare-fun lemmaListSubSeqRefl!0 (List!27209) Unit!40865)

(assert (=> b!1236147 (= lt!560501 (lemmaListSubSeqRefl!0 lt!560497))))

(assert (=> b!1236147 (= lt!560497 (Cons!27205 (select (arr!38423 a!3835) from!3213) acc!846))))

(declare-fun b!1236148 () Bool)

(declare-fun res!823515 () Bool)

(assert (=> b!1236148 (=> res!823515 e!701138)))

(assert (=> b!1236148 (= res!823515 (contains!7280 lt!560497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236149 () Bool)

(declare-fun res!823518 () Bool)

(assert (=> b!1236149 (=> (not res!823518) (not e!701137))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236149 (= res!823518 (contains!7280 acc!846 k0!2925))))

(declare-fun b!1236150 () Bool)

(declare-fun res!823521 () Bool)

(assert (=> b!1236150 (=> (not res!823521) (not e!701137))))

(assert (=> b!1236150 (= res!823521 (not (contains!7280 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103000 res!823520) b!1236139))

(assert (= (and b!1236139 res!823516) b!1236143))

(assert (= (and b!1236143 res!823511) b!1236150))

(assert (= (and b!1236150 res!823521) b!1236145))

(assert (= (and b!1236145 res!823519) b!1236149))

(assert (= (and b!1236149 res!823518) b!1236141))

(assert (= (and b!1236141 res!823517) b!1236140))

(assert (= (and b!1236140 res!823512) b!1236147))

(assert (= (and b!1236147 (not res!823510)) b!1236144))

(assert (= (and b!1236144 (not res!823514)) b!1236146))

(assert (= (and b!1236146 (not res!823513)) b!1236148))

(assert (= (and b!1236148 (not res!823515)) b!1236142))

(declare-fun m!1140377 () Bool)

(assert (=> b!1236146 m!1140377))

(declare-fun m!1140379 () Bool)

(assert (=> start!103000 m!1140379))

(declare-fun m!1140381 () Bool)

(assert (=> b!1236149 m!1140381))

(declare-fun m!1140383 () Bool)

(assert (=> b!1236144 m!1140383))

(declare-fun m!1140385 () Bool)

(assert (=> b!1236139 m!1140385))

(declare-fun m!1140387 () Bool)

(assert (=> b!1236140 m!1140387))

(assert (=> b!1236140 m!1140387))

(declare-fun m!1140389 () Bool)

(assert (=> b!1236140 m!1140389))

(declare-fun m!1140391 () Bool)

(assert (=> b!1236143 m!1140391))

(declare-fun m!1140393 () Bool)

(assert (=> b!1236150 m!1140393))

(declare-fun m!1140395 () Bool)

(assert (=> b!1236147 m!1140395))

(declare-fun m!1140397 () Bool)

(assert (=> b!1236147 m!1140397))

(declare-fun m!1140399 () Bool)

(assert (=> b!1236147 m!1140399))

(assert (=> b!1236147 m!1140387))

(declare-fun m!1140401 () Bool)

(assert (=> b!1236147 m!1140401))

(declare-fun m!1140403 () Bool)

(assert (=> b!1236145 m!1140403))

(declare-fun m!1140405 () Bool)

(assert (=> b!1236142 m!1140405))

(declare-fun m!1140407 () Bool)

(assert (=> b!1236142 m!1140407))

(declare-fun m!1140409 () Bool)

(assert (=> b!1236148 m!1140409))

(check-sat (not b!1236140) (not b!1236143) (not b!1236150) (not b!1236147) (not b!1236145) (not b!1236142) (not b!1236144) (not b!1236148) (not b!1236139) (not start!103000) (not b!1236146) (not b!1236149))
(check-sat)
