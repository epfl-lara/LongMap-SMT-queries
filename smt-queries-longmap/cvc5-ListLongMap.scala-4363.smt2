; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60206 () Bool)

(assert start!60206)

(declare-fun b!673666 () Bool)

(declare-fun e!384659 () Bool)

(declare-fun e!384668 () Bool)

(assert (=> b!673666 (= e!384659 e!384668)))

(declare-fun res!440199 () Bool)

(assert (=> b!673666 (=> (not res!440199) (not e!384668))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673666 (= res!440199 (bvsle from!3004 i!1382))))

(declare-fun b!673667 () Bool)

(declare-fun e!384666 () Bool)

(declare-datatypes ((List!12860 0))(
  ( (Nil!12857) (Cons!12856 (h!13901 (_ BitVec 64)) (t!19088 List!12860)) )
))
(declare-fun lt!312500 () List!12860)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3437 (List!12860 (_ BitVec 64)) Bool)

(assert (=> b!673667 (= e!384666 (not (contains!3437 lt!312500 k!2843)))))

(declare-fun b!673668 () Bool)

(declare-fun res!440203 () Bool)

(declare-fun e!384667 () Bool)

(assert (=> b!673668 (=> (not res!440203) (not e!384667))))

(declare-datatypes ((array!39253 0))(
  ( (array!39254 (arr!18819 (Array (_ BitVec 32) (_ BitVec 64))) (size!19183 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39253)

(assert (=> b!673668 (= res!440203 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19183 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673669 () Bool)

(declare-fun res!440206 () Bool)

(assert (=> b!673669 (=> (not res!440206) (not e!384667))))

(declare-fun arrayNoDuplicates!0 (array!39253 (_ BitVec 32) List!12860) Bool)

(assert (=> b!673669 (= res!440206 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12857))))

(declare-fun b!673670 () Bool)

(declare-fun e!384669 () Bool)

(assert (=> b!673670 (= e!384669 false)))

(declare-fun lt!312501 () Bool)

(assert (=> b!673670 (= lt!312501 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312500))))

(declare-fun b!673671 () Bool)

(declare-datatypes ((Unit!23688 0))(
  ( (Unit!23689) )
))
(declare-fun e!384661 () Unit!23688)

(declare-fun Unit!23690 () Unit!23688)

(assert (=> b!673671 (= e!384661 Unit!23690)))

(declare-fun b!673672 () Bool)

(declare-fun res!440212 () Bool)

(assert (=> b!673672 (=> (not res!440212) (not e!384669))))

(assert (=> b!673672 (= res!440212 (not (contains!3437 lt!312500 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673673 () Bool)

(declare-fun e!384665 () Bool)

(assert (=> b!673673 (= e!384665 (contains!3437 lt!312500 k!2843))))

(declare-fun b!673674 () Bool)

(declare-fun e!384660 () Bool)

(declare-fun acc!681 () List!12860)

(assert (=> b!673674 (= e!384660 (contains!3437 acc!681 k!2843))))

(declare-fun b!673675 () Bool)

(declare-fun res!440217 () Bool)

(assert (=> b!673675 (=> (not res!440217) (not e!384669))))

(assert (=> b!673675 (= res!440217 (not (contains!3437 lt!312500 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673676 () Bool)

(declare-fun res!440196 () Bool)

(assert (=> b!673676 (=> (not res!440196) (not e!384667))))

(assert (=> b!673676 (= res!440196 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673677 () Bool)

(declare-fun res!440207 () Bool)

(assert (=> b!673677 (=> (not res!440207) (not e!384667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673677 (= res!440207 (validKeyInArray!0 (select (arr!18819 a!3626) from!3004)))))

(declare-fun b!673679 () Bool)

(declare-fun res!440211 () Bool)

(assert (=> b!673679 (=> (not res!440211) (not e!384667))))

(assert (=> b!673679 (= res!440211 (validKeyInArray!0 k!2843))))

(declare-fun b!673680 () Bool)

(assert (=> b!673680 (= e!384668 (not (contains!3437 acc!681 k!2843)))))

(declare-fun b!673681 () Bool)

(declare-fun res!440197 () Bool)

(assert (=> b!673681 (=> (not res!440197) (not e!384669))))

(declare-fun e!384663 () Bool)

(assert (=> b!673681 (= res!440197 e!384663)))

(declare-fun res!440214 () Bool)

(assert (=> b!673681 (=> res!440214 e!384663)))

(assert (=> b!673681 (= res!440214 e!384665)))

(declare-fun res!440205 () Bool)

(assert (=> b!673681 (=> (not res!440205) (not e!384665))))

(assert (=> b!673681 (= res!440205 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673682 () Bool)

(declare-fun e!384662 () Bool)

(assert (=> b!673682 (= e!384667 e!384662)))

(declare-fun res!440219 () Bool)

(assert (=> b!673682 (=> (not res!440219) (not e!384662))))

(assert (=> b!673682 (= res!440219 (not (= (select (arr!18819 a!3626) from!3004) k!2843)))))

(declare-fun lt!312499 () Unit!23688)

(assert (=> b!673682 (= lt!312499 e!384661)))

(declare-fun c!77102 () Bool)

(assert (=> b!673682 (= c!77102 (= (select (arr!18819 a!3626) from!3004) k!2843))))

(declare-fun b!673683 () Bool)

(assert (=> b!673683 (= e!384662 e!384669)))

(declare-fun res!440208 () Bool)

(assert (=> b!673683 (=> (not res!440208) (not e!384669))))

(assert (=> b!673683 (= res!440208 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!287 (List!12860 (_ BitVec 64)) List!12860)

(assert (=> b!673683 (= lt!312500 ($colon$colon!287 acc!681 (select (arr!18819 a!3626) from!3004)))))

(declare-fun b!673684 () Bool)

(declare-fun res!440213 () Bool)

(assert (=> b!673684 (=> (not res!440213) (not e!384667))))

(declare-fun noDuplicate!684 (List!12860) Bool)

(assert (=> b!673684 (= res!440213 (noDuplicate!684 acc!681))))

(declare-fun b!673685 () Bool)

(declare-fun res!440202 () Bool)

(assert (=> b!673685 (=> (not res!440202) (not e!384669))))

(assert (=> b!673685 (= res!440202 (noDuplicate!684 lt!312500))))

(declare-fun b!673686 () Bool)

(assert (=> b!673686 (= e!384663 e!384666)))

(declare-fun res!440209 () Bool)

(assert (=> b!673686 (=> (not res!440209) (not e!384666))))

(assert (=> b!673686 (= res!440209 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673687 () Bool)

(declare-fun res!440215 () Bool)

(assert (=> b!673687 (=> (not res!440215) (not e!384667))))

(assert (=> b!673687 (= res!440215 (not (contains!3437 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673688 () Bool)

(declare-fun res!440198 () Bool)

(assert (=> b!673688 (=> (not res!440198) (not e!384667))))

(assert (=> b!673688 (= res!440198 e!384659)))

(declare-fun res!440200 () Bool)

(assert (=> b!673688 (=> res!440200 e!384659)))

(assert (=> b!673688 (= res!440200 e!384660)))

(declare-fun res!440204 () Bool)

(assert (=> b!673688 (=> (not res!440204) (not e!384660))))

(assert (=> b!673688 (= res!440204 (bvsgt from!3004 i!1382))))

(declare-fun b!673689 () Bool)

(declare-fun res!440218 () Bool)

(assert (=> b!673689 (=> (not res!440218) (not e!384667))))

(assert (=> b!673689 (= res!440218 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19183 a!3626))))))

(declare-fun b!673690 () Bool)

(declare-fun res!440201 () Bool)

(assert (=> b!673690 (=> (not res!440201) (not e!384667))))

(declare-fun arrayContainsKey!0 (array!39253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673690 (= res!440201 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673691 () Bool)

(declare-fun Unit!23691 () Unit!23688)

(assert (=> b!673691 (= e!384661 Unit!23691)))

(assert (=> b!673691 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312502 () Unit!23688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39253 (_ BitVec 64) (_ BitVec 32)) Unit!23688)

(assert (=> b!673691 (= lt!312502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673691 false))

(declare-fun res!440210 () Bool)

(assert (=> start!60206 (=> (not res!440210) (not e!384667))))

(assert (=> start!60206 (= res!440210 (and (bvslt (size!19183 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19183 a!3626))))))

(assert (=> start!60206 e!384667))

(assert (=> start!60206 true))

(declare-fun array_inv!14615 (array!39253) Bool)

(assert (=> start!60206 (array_inv!14615 a!3626)))

(declare-fun b!673678 () Bool)

(declare-fun res!440216 () Bool)

(assert (=> b!673678 (=> (not res!440216) (not e!384667))))

(assert (=> b!673678 (= res!440216 (not (contains!3437 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60206 res!440210) b!673684))

(assert (= (and b!673684 res!440213) b!673678))

(assert (= (and b!673678 res!440216) b!673687))

(assert (= (and b!673687 res!440215) b!673688))

(assert (= (and b!673688 res!440204) b!673674))

(assert (= (and b!673688 (not res!440200)) b!673666))

(assert (= (and b!673666 res!440199) b!673680))

(assert (= (and b!673688 res!440198) b!673669))

(assert (= (and b!673669 res!440206) b!673676))

(assert (= (and b!673676 res!440196) b!673689))

(assert (= (and b!673689 res!440218) b!673679))

(assert (= (and b!673679 res!440211) b!673690))

(assert (= (and b!673690 res!440201) b!673668))

(assert (= (and b!673668 res!440203) b!673677))

(assert (= (and b!673677 res!440207) b!673682))

(assert (= (and b!673682 c!77102) b!673691))

(assert (= (and b!673682 (not c!77102)) b!673671))

(assert (= (and b!673682 res!440219) b!673683))

(assert (= (and b!673683 res!440208) b!673685))

(assert (= (and b!673685 res!440202) b!673672))

(assert (= (and b!673672 res!440212) b!673675))

(assert (= (and b!673675 res!440217) b!673681))

(assert (= (and b!673681 res!440205) b!673673))

(assert (= (and b!673681 (not res!440214)) b!673686))

(assert (= (and b!673686 res!440209) b!673667))

(assert (= (and b!673681 res!440197) b!673670))

(declare-fun m!641999 () Bool)

(assert (=> b!673691 m!641999))

(declare-fun m!642001 () Bool)

(assert (=> b!673691 m!642001))

(declare-fun m!642003 () Bool)

(assert (=> b!673675 m!642003))

(declare-fun m!642005 () Bool)

(assert (=> b!673685 m!642005))

(declare-fun m!642007 () Bool)

(assert (=> b!673682 m!642007))

(declare-fun m!642009 () Bool)

(assert (=> b!673680 m!642009))

(declare-fun m!642011 () Bool)

(assert (=> b!673690 m!642011))

(assert (=> b!673674 m!642009))

(declare-fun m!642013 () Bool)

(assert (=> b!673673 m!642013))

(assert (=> b!673667 m!642013))

(declare-fun m!642015 () Bool)

(assert (=> b!673676 m!642015))

(declare-fun m!642017 () Bool)

(assert (=> b!673687 m!642017))

(declare-fun m!642019 () Bool)

(assert (=> b!673670 m!642019))

(declare-fun m!642021 () Bool)

(assert (=> b!673684 m!642021))

(declare-fun m!642023 () Bool)

(assert (=> start!60206 m!642023))

(assert (=> b!673677 m!642007))

(assert (=> b!673677 m!642007))

(declare-fun m!642025 () Bool)

(assert (=> b!673677 m!642025))

(declare-fun m!642027 () Bool)

(assert (=> b!673672 m!642027))

(declare-fun m!642029 () Bool)

(assert (=> b!673678 m!642029))

(declare-fun m!642031 () Bool)

(assert (=> b!673679 m!642031))

(declare-fun m!642033 () Bool)

(assert (=> b!673669 m!642033))

(assert (=> b!673683 m!642007))

(assert (=> b!673683 m!642007))

(declare-fun m!642035 () Bool)

(assert (=> b!673683 m!642035))

(push 1)

