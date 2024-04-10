; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60200 () Bool)

(assert start!60200)

(declare-fun b!673432 () Bool)

(declare-fun res!439999 () Bool)

(declare-fun e!384564 () Bool)

(assert (=> b!673432 (=> (not res!439999) (not e!384564))))

(declare-datatypes ((List!12857 0))(
  ( (Nil!12854) (Cons!12853 (h!13898 (_ BitVec 64)) (t!19085 List!12857)) )
))
(declare-fun acc!681 () List!12857)

(declare-fun contains!3434 (List!12857 (_ BitVec 64)) Bool)

(assert (=> b!673432 (= res!439999 (not (contains!3434 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673433 () Bool)

(declare-fun res!439988 () Bool)

(declare-fun e!384566 () Bool)

(assert (=> b!673433 (=> (not res!439988) (not e!384566))))

(declare-fun e!384561 () Bool)

(assert (=> b!673433 (= res!439988 e!384561)))

(declare-fun res!439993 () Bool)

(assert (=> b!673433 (=> res!439993 e!384561)))

(declare-fun e!384560 () Bool)

(assert (=> b!673433 (= res!439993 e!384560)))

(declare-fun res!440001 () Bool)

(assert (=> b!673433 (=> (not res!440001) (not e!384560))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673433 (= res!440001 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673434 () Bool)

(declare-fun res!439991 () Bool)

(assert (=> b!673434 (=> (not res!439991) (not e!384564))))

(declare-fun e!384562 () Bool)

(assert (=> b!673434 (= res!439991 e!384562)))

(declare-fun res!439982 () Bool)

(assert (=> b!673434 (=> res!439982 e!384562)))

(declare-fun e!384563 () Bool)

(assert (=> b!673434 (= res!439982 e!384563)))

(declare-fun res!439998 () Bool)

(assert (=> b!673434 (=> (not res!439998) (not e!384563))))

(assert (=> b!673434 (= res!439998 (bvsgt from!3004 i!1382))))

(declare-fun b!673435 () Bool)

(declare-fun res!439995 () Bool)

(assert (=> b!673435 (=> (not res!439995) (not e!384564))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673435 (= res!439995 (validKeyInArray!0 k!2843))))

(declare-fun b!673436 () Bool)

(declare-fun res!439997 () Bool)

(assert (=> b!673436 (=> (not res!439997) (not e!384564))))

(assert (=> b!673436 (= res!439997 (not (contains!3434 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673437 () Bool)

(declare-fun res!439987 () Bool)

(assert (=> b!673437 (=> (not res!439987) (not e!384566))))

(declare-fun lt!312465 () List!12857)

(declare-fun noDuplicate!681 (List!12857) Bool)

(assert (=> b!673437 (= res!439987 (noDuplicate!681 lt!312465))))

(declare-fun b!673438 () Bool)

(declare-fun e!384565 () Bool)

(assert (=> b!673438 (= e!384564 e!384565)))

(declare-fun res!439989 () Bool)

(assert (=> b!673438 (=> (not res!439989) (not e!384565))))

(declare-datatypes ((array!39247 0))(
  ( (array!39248 (arr!18816 (Array (_ BitVec 32) (_ BitVec 64))) (size!19180 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39247)

(assert (=> b!673438 (= res!439989 (not (= (select (arr!18816 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23676 0))(
  ( (Unit!23677) )
))
(declare-fun lt!312466 () Unit!23676)

(declare-fun e!384567 () Unit!23676)

(assert (=> b!673438 (= lt!312466 e!384567)))

(declare-fun c!77093 () Bool)

(assert (=> b!673438 (= c!77093 (= (select (arr!18816 a!3626) from!3004) k!2843))))

(declare-fun b!673439 () Bool)

(declare-fun Unit!23678 () Unit!23676)

(assert (=> b!673439 (= e!384567 Unit!23678)))

(declare-fun b!673440 () Bool)

(declare-fun res!439986 () Bool)

(assert (=> b!673440 (=> (not res!439986) (not e!384564))))

(assert (=> b!673440 (= res!439986 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19180 a!3626))))))

(declare-fun b!673441 () Bool)

(declare-fun e!384570 () Bool)

(assert (=> b!673441 (= e!384561 e!384570)))

(declare-fun res!439994 () Bool)

(assert (=> b!673441 (=> (not res!439994) (not e!384570))))

(assert (=> b!673441 (= res!439994 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673442 () Bool)

(declare-fun Unit!23679 () Unit!23676)

(assert (=> b!673442 (= e!384567 Unit!23679)))

(declare-fun arrayContainsKey!0 (array!39247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673442 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312463 () Unit!23676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39247 (_ BitVec 64) (_ BitVec 32)) Unit!23676)

(assert (=> b!673442 (= lt!312463 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673442 false))

(declare-fun b!673443 () Bool)

(assert (=> b!673443 (= e!384563 (contains!3434 acc!681 k!2843))))

(declare-fun b!673444 () Bool)

(declare-fun e!384568 () Bool)

(assert (=> b!673444 (= e!384562 e!384568)))

(declare-fun res!439980 () Bool)

(assert (=> b!673444 (=> (not res!439980) (not e!384568))))

(assert (=> b!673444 (= res!439980 (bvsle from!3004 i!1382))))

(declare-fun b!673445 () Bool)

(declare-fun res!439984 () Bool)

(assert (=> b!673445 (=> (not res!439984) (not e!384564))))

(assert (=> b!673445 (= res!439984 (validKeyInArray!0 (select (arr!18816 a!3626) from!3004)))))

(declare-fun b!673447 () Bool)

(declare-fun res!439990 () Bool)

(assert (=> b!673447 (=> (not res!439990) (not e!384564))))

(declare-fun arrayNoDuplicates!0 (array!39247 (_ BitVec 32) List!12857) Bool)

(assert (=> b!673447 (= res!439990 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673448 () Bool)

(assert (=> b!673448 (= e!384570 (not (contains!3434 lt!312465 k!2843)))))

(declare-fun b!673449 () Bool)

(declare-fun res!440003 () Bool)

(assert (=> b!673449 (=> (not res!440003) (not e!384566))))

(assert (=> b!673449 (= res!440003 (not (contains!3434 lt!312465 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673450 () Bool)

(declare-fun res!439983 () Bool)

(assert (=> b!673450 (=> (not res!439983) (not e!384566))))

(assert (=> b!673450 (= res!439983 (not (contains!3434 lt!312465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673451 () Bool)

(declare-fun res!439985 () Bool)

(assert (=> b!673451 (=> (not res!439985) (not e!384564))))

(assert (=> b!673451 (= res!439985 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19180 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673452 () Bool)

(declare-fun res!439996 () Bool)

(assert (=> b!673452 (=> (not res!439996) (not e!384564))))

(assert (=> b!673452 (= res!439996 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12854))))

(declare-fun b!673453 () Bool)

(assert (=> b!673453 (= e!384565 e!384566)))

(declare-fun res!440002 () Bool)

(assert (=> b!673453 (=> (not res!440002) (not e!384566))))

(assert (=> b!673453 (= res!440002 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!284 (List!12857 (_ BitVec 64)) List!12857)

(assert (=> b!673453 (= lt!312465 ($colon$colon!284 acc!681 (select (arr!18816 a!3626) from!3004)))))

(declare-fun b!673454 () Bool)

(declare-fun res!440000 () Bool)

(assert (=> b!673454 (=> (not res!440000) (not e!384564))))

(assert (=> b!673454 (= res!440000 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673446 () Bool)

(assert (=> b!673446 (= e!384560 (contains!3434 lt!312465 k!2843))))

(declare-fun res!439992 () Bool)

(assert (=> start!60200 (=> (not res!439992) (not e!384564))))

(assert (=> start!60200 (= res!439992 (and (bvslt (size!19180 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19180 a!3626))))))

(assert (=> start!60200 e!384564))

(assert (=> start!60200 true))

(declare-fun array_inv!14612 (array!39247) Bool)

(assert (=> start!60200 (array_inv!14612 a!3626)))

(declare-fun b!673455 () Bool)

(declare-fun res!439981 () Bool)

(assert (=> b!673455 (=> (not res!439981) (not e!384564))))

(assert (=> b!673455 (= res!439981 (noDuplicate!681 acc!681))))

(declare-fun b!673456 () Bool)

(assert (=> b!673456 (= e!384568 (not (contains!3434 acc!681 k!2843)))))

(declare-fun b!673457 () Bool)

(assert (=> b!673457 (= e!384566 false)))

(declare-fun lt!312464 () Bool)

(assert (=> b!673457 (= lt!312464 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312465))))

(assert (= (and start!60200 res!439992) b!673455))

(assert (= (and b!673455 res!439981) b!673436))

(assert (= (and b!673436 res!439997) b!673432))

(assert (= (and b!673432 res!439999) b!673434))

(assert (= (and b!673434 res!439998) b!673443))

(assert (= (and b!673434 (not res!439982)) b!673444))

(assert (= (and b!673444 res!439980) b!673456))

(assert (= (and b!673434 res!439991) b!673452))

(assert (= (and b!673452 res!439996) b!673447))

(assert (= (and b!673447 res!439990) b!673440))

(assert (= (and b!673440 res!439986) b!673435))

(assert (= (and b!673435 res!439995) b!673454))

(assert (= (and b!673454 res!440000) b!673451))

(assert (= (and b!673451 res!439985) b!673445))

(assert (= (and b!673445 res!439984) b!673438))

(assert (= (and b!673438 c!77093) b!673442))

(assert (= (and b!673438 (not c!77093)) b!673439))

(assert (= (and b!673438 res!439989) b!673453))

(assert (= (and b!673453 res!440002) b!673437))

(assert (= (and b!673437 res!439987) b!673450))

(assert (= (and b!673450 res!439983) b!673449))

(assert (= (and b!673449 res!440003) b!673433))

(assert (= (and b!673433 res!440001) b!673446))

(assert (= (and b!673433 (not res!439993)) b!673441))

(assert (= (and b!673441 res!439994) b!673448))

(assert (= (and b!673433 res!439988) b!673457))

(declare-fun m!641885 () Bool)

(assert (=> b!673447 m!641885))

(declare-fun m!641887 () Bool)

(assert (=> b!673437 m!641887))

(declare-fun m!641889 () Bool)

(assert (=> b!673432 m!641889))

(declare-fun m!641891 () Bool)

(assert (=> b!673455 m!641891))

(declare-fun m!641893 () Bool)

(assert (=> b!673449 m!641893))

(declare-fun m!641895 () Bool)

(assert (=> b!673445 m!641895))

(assert (=> b!673445 m!641895))

(declare-fun m!641897 () Bool)

(assert (=> b!673445 m!641897))

(declare-fun m!641899 () Bool)

(assert (=> b!673452 m!641899))

(assert (=> b!673438 m!641895))

(declare-fun m!641901 () Bool)

(assert (=> b!673436 m!641901))

(declare-fun m!641903 () Bool)

(assert (=> b!673456 m!641903))

(declare-fun m!641905 () Bool)

(assert (=> b!673450 m!641905))

(assert (=> b!673443 m!641903))

(declare-fun m!641907 () Bool)

(assert (=> b!673435 m!641907))

(declare-fun m!641909 () Bool)

(assert (=> b!673442 m!641909))

(declare-fun m!641911 () Bool)

(assert (=> b!673442 m!641911))

(declare-fun m!641913 () Bool)

(assert (=> b!673457 m!641913))

(declare-fun m!641915 () Bool)

(assert (=> start!60200 m!641915))

(declare-fun m!641917 () Bool)

(assert (=> b!673448 m!641917))

(assert (=> b!673453 m!641895))

(assert (=> b!673453 m!641895))

(declare-fun m!641919 () Bool)

(assert (=> b!673453 m!641919))

(declare-fun m!641921 () Bool)

(assert (=> b!673454 m!641921))

(assert (=> b!673446 m!641917))

(push 1)

