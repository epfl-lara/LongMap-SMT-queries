; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60388 () Bool)

(assert start!60388)

(declare-fun b!677993 () Bool)

(declare-fun res!444328 () Bool)

(declare-fun e!386450 () Bool)

(assert (=> b!677993 (=> (not res!444328) (not e!386450))))

(declare-fun e!386444 () Bool)

(assert (=> b!677993 (= res!444328 e!386444)))

(declare-fun res!444318 () Bool)

(assert (=> b!677993 (=> res!444318 e!386444)))

(declare-fun e!386446 () Bool)

(assert (=> b!677993 (= res!444318 e!386446)))

(declare-fun res!444319 () Bool)

(assert (=> b!677993 (=> (not res!444319) (not e!386446))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677993 (= res!444319 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677995 () Bool)

(declare-datatypes ((List!12824 0))(
  ( (Nil!12821) (Cons!12820 (h!13868 (_ BitVec 64)) (t!19044 List!12824)) )
))
(declare-fun acc!681 () List!12824)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3476 (List!12824 (_ BitVec 64)) Bool)

(assert (=> b!677995 (= e!386446 (contains!3476 acc!681 k!2843))))

(declare-fun b!677996 () Bool)

(declare-fun res!444320 () Bool)

(assert (=> b!677996 (=> (not res!444320) (not e!386450))))

(assert (=> b!677996 (= res!444320 (not (contains!3476 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677997 () Bool)

(declare-fun res!444312 () Bool)

(assert (=> b!677997 (=> (not res!444312) (not e!386450))))

(declare-datatypes ((array!39373 0))(
  ( (array!39374 (arr!18876 (Array (_ BitVec 32) (_ BitVec 64))) (size!19240 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39373)

(assert (=> b!677997 (= res!444312 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19240 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677998 () Bool)

(declare-fun res!444308 () Bool)

(assert (=> b!677998 (=> (not res!444308) (not e!386450))))

(assert (=> b!677998 (= res!444308 (not (contains!3476 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677999 () Bool)

(declare-fun res!444326 () Bool)

(assert (=> b!677999 (=> (not res!444326) (not e!386450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677999 (= res!444326 (validKeyInArray!0 k!2843))))

(declare-fun b!678000 () Bool)

(assert (=> b!678000 (= e!386450 (not true))))

(declare-fun arrayNoDuplicates!0 (array!39373 (_ BitVec 32) List!12824) Bool)

(assert (=> b!678000 (arrayNoDuplicates!0 (array!39374 (store (arr!18876 a!3626) i!1382 k!2843) (size!19240 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23761 0))(
  ( (Unit!23762) )
))
(declare-fun lt!312943 () Unit!23761)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12824) Unit!23761)

(assert (=> b!678000 (= lt!312943 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!678001 () Bool)

(declare-fun res!444316 () Bool)

(assert (=> b!678001 (=> (not res!444316) (not e!386450))))

(assert (=> b!678001 (= res!444316 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!678002 () Bool)

(declare-fun e!386445 () Bool)

(assert (=> b!678002 (= e!386445 (contains!3476 acc!681 k!2843))))

(declare-fun b!678003 () Bool)

(declare-fun res!444321 () Bool)

(assert (=> b!678003 (=> (not res!444321) (not e!386450))))

(declare-fun e!386451 () Bool)

(assert (=> b!678003 (= res!444321 e!386451)))

(declare-fun res!444311 () Bool)

(assert (=> b!678003 (=> res!444311 e!386451)))

(assert (=> b!678003 (= res!444311 e!386445)))

(declare-fun res!444323 () Bool)

(assert (=> b!678003 (=> (not res!444323) (not e!386445))))

(assert (=> b!678003 (= res!444323 (bvsgt from!3004 i!1382))))

(declare-fun b!678004 () Bool)

(declare-fun e!386448 () Bool)

(assert (=> b!678004 (= e!386444 e!386448)))

(declare-fun res!444310 () Bool)

(assert (=> b!678004 (=> (not res!444310) (not e!386448))))

(assert (=> b!678004 (= res!444310 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!444325 () Bool)

(assert (=> start!60388 (=> (not res!444325) (not e!386450))))

(assert (=> start!60388 (= res!444325 (and (bvslt (size!19240 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19240 a!3626))))))

(assert (=> start!60388 e!386450))

(assert (=> start!60388 true))

(declare-fun array_inv!14735 (array!39373) Bool)

(assert (=> start!60388 (array_inv!14735 a!3626)))

(declare-fun b!677994 () Bool)

(declare-fun res!444317 () Bool)

(assert (=> b!677994 (=> (not res!444317) (not e!386450))))

(declare-fun noDuplicate!750 (List!12824) Bool)

(assert (=> b!677994 (= res!444317 (noDuplicate!750 acc!681))))

(declare-fun b!678005 () Bool)

(declare-fun res!444314 () Bool)

(assert (=> b!678005 (=> (not res!444314) (not e!386450))))

(assert (=> b!678005 (= res!444314 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19240 a!3626))))))

(declare-fun b!678006 () Bool)

(declare-fun res!444327 () Bool)

(assert (=> b!678006 (=> (not res!444327) (not e!386450))))

(assert (=> b!678006 (= res!444327 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!678007 () Bool)

(declare-fun e!386449 () Bool)

(assert (=> b!678007 (= e!386451 e!386449)))

(declare-fun res!444324 () Bool)

(assert (=> b!678007 (=> (not res!444324) (not e!386449))))

(assert (=> b!678007 (= res!444324 (bvsle from!3004 i!1382))))

(declare-fun b!678008 () Bool)

(declare-fun res!444315 () Bool)

(assert (=> b!678008 (=> (not res!444315) (not e!386450))))

(assert (=> b!678008 (= res!444315 (not (validKeyInArray!0 (select (arr!18876 a!3626) from!3004))))))

(declare-fun b!678009 () Bool)

(declare-fun res!444313 () Bool)

(assert (=> b!678009 (=> (not res!444313) (not e!386450))))

(declare-fun arrayContainsKey!0 (array!39373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678009 (= res!444313 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678010 () Bool)

(declare-fun res!444309 () Bool)

(assert (=> b!678010 (=> (not res!444309) (not e!386450))))

(assert (=> b!678010 (= res!444309 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12821))))

(declare-fun b!678011 () Bool)

(declare-fun res!444322 () Bool)

(assert (=> b!678011 (=> (not res!444322) (not e!386450))))

(assert (=> b!678011 (= res!444322 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678012 () Bool)

(assert (=> b!678012 (= e!386448 (not (contains!3476 acc!681 k!2843)))))

(declare-fun b!678013 () Bool)

(assert (=> b!678013 (= e!386449 (not (contains!3476 acc!681 k!2843)))))

(assert (= (and start!60388 res!444325) b!677994))

(assert (= (and b!677994 res!444317) b!677996))

(assert (= (and b!677996 res!444320) b!677998))

(assert (= (and b!677998 res!444308) b!678003))

(assert (= (and b!678003 res!444323) b!678002))

(assert (= (and b!678003 (not res!444311)) b!678007))

(assert (= (and b!678007 res!444324) b!678013))

(assert (= (and b!678003 res!444321) b!678010))

(assert (= (and b!678010 res!444309) b!678011))

(assert (= (and b!678011 res!444322) b!678005))

(assert (= (and b!678005 res!444314) b!677999))

(assert (= (and b!677999 res!444326) b!678009))

(assert (= (and b!678009 res!444313) b!677997))

(assert (= (and b!677997 res!444312) b!678008))

(assert (= (and b!678008 res!444315) b!678001))

(assert (= (and b!678001 res!444316) b!677993))

(assert (= (and b!677993 res!444319) b!677995))

(assert (= (and b!677993 (not res!444318)) b!678004))

(assert (= (and b!678004 res!444310) b!678012))

(assert (= (and b!677993 res!444328) b!678006))

(assert (= (and b!678006 res!444327) b!678000))

(declare-fun m!644575 () Bool)

(assert (=> b!678011 m!644575))

(declare-fun m!644577 () Bool)

(assert (=> b!677996 m!644577))

(declare-fun m!644579 () Bool)

(assert (=> b!678006 m!644579))

(declare-fun m!644581 () Bool)

(assert (=> b!677999 m!644581))

(declare-fun m!644583 () Bool)

(assert (=> b!678008 m!644583))

(assert (=> b!678008 m!644583))

(declare-fun m!644585 () Bool)

(assert (=> b!678008 m!644585))

(declare-fun m!644587 () Bool)

(assert (=> b!678002 m!644587))

(declare-fun m!644589 () Bool)

(assert (=> b!678010 m!644589))

(assert (=> b!678012 m!644587))

(declare-fun m!644591 () Bool)

(assert (=> b!677994 m!644591))

(declare-fun m!644593 () Bool)

(assert (=> b!678009 m!644593))

(declare-fun m!644595 () Bool)

(assert (=> start!60388 m!644595))

(assert (=> b!678013 m!644587))

(declare-fun m!644597 () Bool)

(assert (=> b!678000 m!644597))

(declare-fun m!644599 () Bool)

(assert (=> b!678000 m!644599))

(declare-fun m!644601 () Bool)

(assert (=> b!678000 m!644601))

(assert (=> b!677995 m!644587))

(declare-fun m!644603 () Bool)

(assert (=> b!677998 m!644603))

(push 1)

(assert (not b!677994))

(assert (not b!678012))

(assert (not b!678000))

(assert (not b!678006))

(assert (not b!677998))

(assert (not b!677999))

(assert (not b!678010))

(assert (not b!678011))

(assert (not b!677995))

(assert (not b!678013))

(assert (not b!678009))

(assert (not b!678008))

(assert (not b!678002))

(assert (not start!60388))

(assert (not b!677996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

