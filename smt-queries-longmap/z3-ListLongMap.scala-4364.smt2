; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60214 () Bool)

(assert start!60214)

(declare-fun b!673978 () Bool)

(declare-fun e!384793 () Bool)

(declare-datatypes ((List!12864 0))(
  ( (Nil!12861) (Cons!12860 (h!13905 (_ BitVec 64)) (t!19092 List!12864)) )
))
(declare-fun lt!312548 () List!12864)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3441 (List!12864 (_ BitVec 64)) Bool)

(assert (=> b!673978 (= e!384793 (not (contains!3441 lt!312548 k0!2843)))))

(declare-fun b!673979 () Bool)

(declare-fun res!440498 () Bool)

(declare-fun e!384794 () Bool)

(assert (=> b!673979 (=> (not res!440498) (not e!384794))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39261 0))(
  ( (array!39262 (arr!18823 (Array (_ BitVec 32) (_ BitVec 64))) (size!19187 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39261)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!673979 (= res!440498 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19187 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673980 () Bool)

(declare-fun res!440492 () Bool)

(assert (=> b!673980 (=> (not res!440492) (not e!384794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673980 (= res!440492 (validKeyInArray!0 (select (arr!18823 a!3626) from!3004)))))

(declare-fun b!673981 () Bool)

(declare-fun e!384800 () Bool)

(assert (=> b!673981 (= e!384800 false)))

(declare-fun lt!312547 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39261 (_ BitVec 32) List!12864) Bool)

(assert (=> b!673981 (= lt!312547 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312548))))

(declare-fun b!673982 () Bool)

(declare-fun res!440506 () Bool)

(assert (=> b!673982 (=> (not res!440506) (not e!384794))))

(assert (=> b!673982 (= res!440506 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12861))))

(declare-fun res!440502 () Bool)

(assert (=> start!60214 (=> (not res!440502) (not e!384794))))

(assert (=> start!60214 (= res!440502 (and (bvslt (size!19187 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19187 a!3626))))))

(assert (=> start!60214 e!384794))

(assert (=> start!60214 true))

(declare-fun array_inv!14619 (array!39261) Bool)

(assert (=> start!60214 (array_inv!14619 a!3626)))

(declare-fun b!673983 () Bool)

(declare-fun e!384795 () Bool)

(declare-fun e!384799 () Bool)

(assert (=> b!673983 (= e!384795 e!384799)))

(declare-fun res!440501 () Bool)

(assert (=> b!673983 (=> (not res!440501) (not e!384799))))

(assert (=> b!673983 (= res!440501 (bvsle from!3004 i!1382))))

(declare-fun b!673984 () Bool)

(declare-fun res!440496 () Bool)

(assert (=> b!673984 (=> (not res!440496) (not e!384800))))

(assert (=> b!673984 (= res!440496 (not (contains!3441 lt!312548 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673985 () Bool)

(declare-fun res!440500 () Bool)

(assert (=> b!673985 (=> (not res!440500) (not e!384794))))

(assert (=> b!673985 (= res!440500 (validKeyInArray!0 k0!2843))))

(declare-fun b!673986 () Bool)

(declare-fun res!440488 () Bool)

(assert (=> b!673986 (=> (not res!440488) (not e!384794))))

(declare-fun acc!681 () List!12864)

(declare-fun noDuplicate!688 (List!12864) Bool)

(assert (=> b!673986 (= res!440488 (noDuplicate!688 acc!681))))

(declare-fun b!673987 () Bool)

(declare-fun res!440507 () Bool)

(assert (=> b!673987 (=> (not res!440507) (not e!384794))))

(assert (=> b!673987 (= res!440507 (not (contains!3441 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673988 () Bool)

(declare-fun res!440490 () Bool)

(assert (=> b!673988 (=> (not res!440490) (not e!384794))))

(assert (=> b!673988 (= res!440490 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673989 () Bool)

(declare-fun e!384791 () Bool)

(assert (=> b!673989 (= e!384794 e!384791)))

(declare-fun res!440484 () Bool)

(assert (=> b!673989 (=> (not res!440484) (not e!384791))))

(assert (=> b!673989 (= res!440484 (not (= (select (arr!18823 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23704 0))(
  ( (Unit!23705) )
))
(declare-fun lt!312549 () Unit!23704)

(declare-fun e!384792 () Unit!23704)

(assert (=> b!673989 (= lt!312549 e!384792)))

(declare-fun c!77114 () Bool)

(assert (=> b!673989 (= c!77114 (= (select (arr!18823 a!3626) from!3004) k0!2843))))

(declare-fun b!673990 () Bool)

(declare-fun res!440505 () Bool)

(assert (=> b!673990 (=> (not res!440505) (not e!384800))))

(assert (=> b!673990 (= res!440505 (noDuplicate!688 lt!312548))))

(declare-fun b!673991 () Bool)

(declare-fun e!384801 () Bool)

(assert (=> b!673991 (= e!384801 (contains!3441 acc!681 k0!2843))))

(declare-fun b!673992 () Bool)

(declare-fun Unit!23706 () Unit!23704)

(assert (=> b!673992 (= e!384792 Unit!23706)))

(declare-fun arrayContainsKey!0 (array!39261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673992 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312550 () Unit!23704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39261 (_ BitVec 64) (_ BitVec 32)) Unit!23704)

(assert (=> b!673992 (= lt!312550 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673992 false))

(declare-fun b!673993 () Bool)

(assert (=> b!673993 (= e!384791 e!384800)))

(declare-fun res!440497 () Bool)

(assert (=> b!673993 (=> (not res!440497) (not e!384800))))

(assert (=> b!673993 (= res!440497 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!291 (List!12864 (_ BitVec 64)) List!12864)

(assert (=> b!673993 (= lt!312548 ($colon$colon!291 acc!681 (select (arr!18823 a!3626) from!3004)))))

(declare-fun b!673994 () Bool)

(declare-fun Unit!23707 () Unit!23704)

(assert (=> b!673994 (= e!384792 Unit!23707)))

(declare-fun b!673995 () Bool)

(declare-fun res!440503 () Bool)

(assert (=> b!673995 (=> (not res!440503) (not e!384794))))

(assert (=> b!673995 (= res!440503 e!384795)))

(declare-fun res!440504 () Bool)

(assert (=> b!673995 (=> res!440504 e!384795)))

(assert (=> b!673995 (= res!440504 e!384801)))

(declare-fun res!440486 () Bool)

(assert (=> b!673995 (=> (not res!440486) (not e!384801))))

(assert (=> b!673995 (= res!440486 (bvsgt from!3004 i!1382))))

(declare-fun b!673996 () Bool)

(declare-fun e!384798 () Bool)

(assert (=> b!673996 (= e!384798 e!384793)))

(declare-fun res!440499 () Bool)

(assert (=> b!673996 (=> (not res!440499) (not e!384793))))

(assert (=> b!673996 (= res!440499 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673997 () Bool)

(declare-fun res!440485 () Bool)

(assert (=> b!673997 (=> (not res!440485) (not e!384800))))

(assert (=> b!673997 (= res!440485 e!384798)))

(declare-fun res!440487 () Bool)

(assert (=> b!673997 (=> res!440487 e!384798)))

(declare-fun e!384797 () Bool)

(assert (=> b!673997 (= res!440487 e!384797)))

(declare-fun res!440489 () Bool)

(assert (=> b!673997 (=> (not res!440489) (not e!384797))))

(assert (=> b!673997 (= res!440489 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673998 () Bool)

(declare-fun res!440491 () Bool)

(assert (=> b!673998 (=> (not res!440491) (not e!384794))))

(assert (=> b!673998 (= res!440491 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19187 a!3626))))))

(declare-fun b!673999 () Bool)

(assert (=> b!673999 (= e!384799 (not (contains!3441 acc!681 k0!2843)))))

(declare-fun b!674000 () Bool)

(declare-fun res!440495 () Bool)

(assert (=> b!674000 (=> (not res!440495) (not e!384794))))

(assert (=> b!674000 (= res!440495 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674001 () Bool)

(assert (=> b!674001 (= e!384797 (contains!3441 lt!312548 k0!2843))))

(declare-fun b!674002 () Bool)

(declare-fun res!440494 () Bool)

(assert (=> b!674002 (=> (not res!440494) (not e!384800))))

(assert (=> b!674002 (= res!440494 (not (contains!3441 lt!312548 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674003 () Bool)

(declare-fun res!440493 () Bool)

(assert (=> b!674003 (=> (not res!440493) (not e!384794))))

(assert (=> b!674003 (= res!440493 (not (contains!3441 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60214 res!440502) b!673986))

(assert (= (and b!673986 res!440488) b!674003))

(assert (= (and b!674003 res!440493) b!673987))

(assert (= (and b!673987 res!440507) b!673995))

(assert (= (and b!673995 res!440486) b!673991))

(assert (= (and b!673995 (not res!440504)) b!673983))

(assert (= (and b!673983 res!440501) b!673999))

(assert (= (and b!673995 res!440503) b!673982))

(assert (= (and b!673982 res!440506) b!673988))

(assert (= (and b!673988 res!440490) b!673998))

(assert (= (and b!673998 res!440491) b!673985))

(assert (= (and b!673985 res!440500) b!674000))

(assert (= (and b!674000 res!440495) b!673979))

(assert (= (and b!673979 res!440498) b!673980))

(assert (= (and b!673980 res!440492) b!673989))

(assert (= (and b!673989 c!77114) b!673992))

(assert (= (and b!673989 (not c!77114)) b!673994))

(assert (= (and b!673989 res!440484) b!673993))

(assert (= (and b!673993 res!440497) b!673990))

(assert (= (and b!673990 res!440505) b!674002))

(assert (= (and b!674002 res!440494) b!673984))

(assert (= (and b!673984 res!440496) b!673997))

(assert (= (and b!673997 res!440489) b!674001))

(assert (= (and b!673997 (not res!440487)) b!673996))

(assert (= (and b!673996 res!440499) b!673978))

(assert (= (and b!673997 res!440485) b!673981))

(declare-fun m!642151 () Bool)

(assert (=> b!673991 m!642151))

(declare-fun m!642153 () Bool)

(assert (=> b!673986 m!642153))

(declare-fun m!642155 () Bool)

(assert (=> b!673984 m!642155))

(declare-fun m!642157 () Bool)

(assert (=> b!673992 m!642157))

(declare-fun m!642159 () Bool)

(assert (=> b!673992 m!642159))

(declare-fun m!642161 () Bool)

(assert (=> start!60214 m!642161))

(declare-fun m!642163 () Bool)

(assert (=> b!674003 m!642163))

(declare-fun m!642165 () Bool)

(assert (=> b!673989 m!642165))

(declare-fun m!642167 () Bool)

(assert (=> b!673982 m!642167))

(assert (=> b!673980 m!642165))

(assert (=> b!673980 m!642165))

(declare-fun m!642169 () Bool)

(assert (=> b!673980 m!642169))

(declare-fun m!642171 () Bool)

(assert (=> b!673978 m!642171))

(declare-fun m!642173 () Bool)

(assert (=> b!674002 m!642173))

(assert (=> b!673993 m!642165))

(assert (=> b!673993 m!642165))

(declare-fun m!642175 () Bool)

(assert (=> b!673993 m!642175))

(declare-fun m!642177 () Bool)

(assert (=> b!674000 m!642177))

(assert (=> b!673999 m!642151))

(declare-fun m!642179 () Bool)

(assert (=> b!673988 m!642179))

(assert (=> b!674001 m!642171))

(declare-fun m!642181 () Bool)

(assert (=> b!673981 m!642181))

(declare-fun m!642183 () Bool)

(assert (=> b!673987 m!642183))

(declare-fun m!642185 () Bool)

(assert (=> b!673985 m!642185))

(declare-fun m!642187 () Bool)

(assert (=> b!673990 m!642187))

(check-sat (not b!673993) (not b!673984) (not b!674003) (not b!673980) (not b!673982) (not b!673987) (not b!673985) (not start!60214) (not b!673988) (not b!673978) (not b!674001) (not b!674000) (not b!673992) (not b!673999) (not b!673990) (not b!673991) (not b!673981) (not b!673986) (not b!674002))
(check-sat)
