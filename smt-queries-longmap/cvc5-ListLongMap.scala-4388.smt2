; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60348 () Bool)

(assert start!60348)

(declare-fun b!677990 () Bool)

(declare-fun res!444574 () Bool)

(declare-fun e!386350 () Bool)

(assert (=> b!677990 (=> (not res!444574) (not e!386350))))

(declare-datatypes ((List!12975 0))(
  ( (Nil!12972) (Cons!12971 (h!14016 (_ BitVec 64)) (t!19194 List!12975)) )
))
(declare-fun acc!681 () List!12975)

(declare-fun contains!3497 (List!12975 (_ BitVec 64)) Bool)

(assert (=> b!677990 (= res!444574 (not (contains!3497 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677991 () Bool)

(declare-fun res!444572 () Bool)

(assert (=> b!677991 (=> (not res!444572) (not e!386350))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677991 (= res!444572 (validKeyInArray!0 k!2843))))

(declare-fun b!677992 () Bool)

(declare-fun e!386349 () Bool)

(assert (=> b!677992 (= e!386349 (contains!3497 acc!681 k!2843))))

(declare-fun b!677993 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39406 0))(
  ( (array!39407 (arr!18895 (Array (_ BitVec 32) (_ BitVec 64))) (size!19260 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39406)

(assert (=> b!677993 (= e!386350 (= (select (arr!18895 a!3626) from!3004) k!2843))))

(declare-datatypes ((Unit!23770 0))(
  ( (Unit!23771) )
))
(declare-fun lt!312629 () Unit!23770)

(declare-fun e!386354 () Unit!23770)

(assert (=> b!677993 (= lt!312629 e!386354)))

(declare-fun c!77082 () Bool)

(assert (=> b!677993 (= c!77082 (= (select (arr!18895 a!3626) from!3004) k!2843))))

(declare-fun b!677994 () Bool)

(declare-fun res!444566 () Bool)

(assert (=> b!677994 (=> (not res!444566) (not e!386350))))

(declare-fun arrayNoDuplicates!0 (array!39406 (_ BitVec 32) List!12975) Bool)

(assert (=> b!677994 (= res!444566 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677995 () Bool)

(declare-fun e!386352 () Bool)

(assert (=> b!677995 (= e!386352 (not (contains!3497 acc!681 k!2843)))))

(declare-fun res!444560 () Bool)

(assert (=> start!60348 (=> (not res!444560) (not e!386350))))

(assert (=> start!60348 (= res!444560 (and (bvslt (size!19260 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19260 a!3626))))))

(assert (=> start!60348 e!386350))

(assert (=> start!60348 true))

(declare-fun array_inv!14778 (array!39406) Bool)

(assert (=> start!60348 (array_inv!14778 a!3626)))

(declare-fun b!677996 () Bool)

(declare-fun res!444573 () Bool)

(assert (=> b!677996 (=> (not res!444573) (not e!386350))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677996 (= res!444573 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19260 a!3626))))))

(declare-fun b!677997 () Bool)

(declare-fun res!444565 () Bool)

(assert (=> b!677997 (=> (not res!444565) (not e!386350))))

(assert (=> b!677997 (= res!444565 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19260 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677998 () Bool)

(declare-fun e!386353 () Bool)

(assert (=> b!677998 (= e!386353 e!386352)))

(declare-fun res!444562 () Bool)

(assert (=> b!677998 (=> (not res!444562) (not e!386352))))

(assert (=> b!677998 (= res!444562 (bvsle from!3004 i!1382))))

(declare-fun b!677999 () Bool)

(declare-fun res!444564 () Bool)

(assert (=> b!677999 (=> (not res!444564) (not e!386350))))

(assert (=> b!677999 (= res!444564 e!386353)))

(declare-fun res!444571 () Bool)

(assert (=> b!677999 (=> res!444571 e!386353)))

(assert (=> b!677999 (= res!444571 e!386349)))

(declare-fun res!444570 () Bool)

(assert (=> b!677999 (=> (not res!444570) (not e!386349))))

(assert (=> b!677999 (= res!444570 (bvsgt from!3004 i!1382))))

(declare-fun b!678000 () Bool)

(declare-fun res!444561 () Bool)

(assert (=> b!678000 (=> (not res!444561) (not e!386350))))

(declare-fun arrayContainsKey!0 (array!39406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678000 (= res!444561 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678001 () Bool)

(declare-fun res!444568 () Bool)

(assert (=> b!678001 (=> (not res!444568) (not e!386350))))

(assert (=> b!678001 (= res!444568 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12972))))

(declare-fun b!678002 () Bool)

(declare-fun Unit!23772 () Unit!23770)

(assert (=> b!678002 (= e!386354 Unit!23772)))

(declare-fun b!678003 () Bool)

(declare-fun res!444563 () Bool)

(assert (=> b!678003 (=> (not res!444563) (not e!386350))))

(declare-fun noDuplicate!766 (List!12975) Bool)

(assert (=> b!678003 (= res!444563 (noDuplicate!766 acc!681))))

(declare-fun b!678004 () Bool)

(declare-fun res!444569 () Bool)

(assert (=> b!678004 (=> (not res!444569) (not e!386350))))

(assert (=> b!678004 (= res!444569 (validKeyInArray!0 (select (arr!18895 a!3626) from!3004)))))

(declare-fun b!678005 () Bool)

(declare-fun res!444567 () Bool)

(assert (=> b!678005 (=> (not res!444567) (not e!386350))))

(assert (=> b!678005 (= res!444567 (not (contains!3497 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678006 () Bool)

(declare-fun Unit!23773 () Unit!23770)

(assert (=> b!678006 (= e!386354 Unit!23773)))

(assert (=> b!678006 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312630 () Unit!23770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39406 (_ BitVec 64) (_ BitVec 32)) Unit!23770)

(assert (=> b!678006 (= lt!312630 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!678006 false))

(assert (= (and start!60348 res!444560) b!678003))

(assert (= (and b!678003 res!444563) b!677990))

(assert (= (and b!677990 res!444574) b!678005))

(assert (= (and b!678005 res!444567) b!677999))

(assert (= (and b!677999 res!444570) b!677992))

(assert (= (and b!677999 (not res!444571)) b!677998))

(assert (= (and b!677998 res!444562) b!677995))

(assert (= (and b!677999 res!444564) b!678001))

(assert (= (and b!678001 res!444568) b!677994))

(assert (= (and b!677994 res!444566) b!677996))

(assert (= (and b!677996 res!444573) b!677991))

(assert (= (and b!677991 res!444572) b!678000))

(assert (= (and b!678000 res!444561) b!677997))

(assert (= (and b!677997 res!444565) b!678004))

(assert (= (and b!678004 res!444569) b!677993))

(assert (= (and b!677993 c!77082) b!678006))

(assert (= (and b!677993 (not c!77082)) b!678002))

(declare-fun m!643357 () Bool)

(assert (=> b!678005 m!643357))

(declare-fun m!643359 () Bool)

(assert (=> b!678000 m!643359))

(declare-fun m!643361 () Bool)

(assert (=> b!678006 m!643361))

(declare-fun m!643363 () Bool)

(assert (=> b!678006 m!643363))

(declare-fun m!643365 () Bool)

(assert (=> b!678004 m!643365))

(assert (=> b!678004 m!643365))

(declare-fun m!643367 () Bool)

(assert (=> b!678004 m!643367))

(declare-fun m!643369 () Bool)

(assert (=> b!678001 m!643369))

(declare-fun m!643371 () Bool)

(assert (=> b!678003 m!643371))

(declare-fun m!643373 () Bool)

(assert (=> b!677990 m!643373))

(declare-fun m!643375 () Bool)

(assert (=> b!677992 m!643375))

(declare-fun m!643377 () Bool)

(assert (=> start!60348 m!643377))

(declare-fun m!643379 () Bool)

(assert (=> b!677994 m!643379))

(assert (=> b!677995 m!643375))

(declare-fun m!643381 () Bool)

(assert (=> b!677991 m!643381))

(assert (=> b!677993 m!643365))

(push 1)

(assert (not b!677992))

(assert (not b!678005))

(assert (not start!60348))

(assert (not b!678000))

(assert (not b!678003))

(assert (not b!677991))

(assert (not b!678004))

(assert (not b!677994))

(assert (not b!678001))

(assert (not b!678006))

(assert (not b!677995))

(assert (not b!677990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

