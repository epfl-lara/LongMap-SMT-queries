; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60158 () Bool)

(assert start!60158)

(declare-fun b!671966 () Bool)

(declare-fun res!438769 () Bool)

(declare-fun e!383880 () Bool)

(assert (=> b!671966 (=> (not res!438769) (not e!383880))))

(declare-datatypes ((array!39216 0))(
  ( (array!39217 (arr!18800 (Array (_ BitVec 32) (_ BitVec 64))) (size!19165 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39216)

(declare-datatypes ((List!12880 0))(
  ( (Nil!12877) (Cons!12876 (h!13921 (_ BitVec 64)) (t!19099 List!12880)) )
))
(declare-fun acc!681 () List!12880)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39216 (_ BitVec 32) List!12880) Bool)

(assert (=> b!671966 (= res!438769 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671967 () Bool)

(declare-fun res!438770 () Bool)

(assert (=> b!671967 (=> (not res!438770) (not e!383880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671967 (= res!438770 (validKeyInArray!0 (select (arr!18800 a!3626) from!3004)))))

(declare-fun b!671968 () Bool)

(declare-fun res!438782 () Bool)

(assert (=> b!671968 (=> (not res!438782) (not e!383880))))

(declare-fun contains!3402 (List!12880 (_ BitVec 64)) Bool)

(assert (=> b!671968 (= res!438782 (not (contains!3402 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671969 () Bool)

(declare-fun e!383881 () Bool)

(assert (=> b!671969 (= e!383881 false)))

(declare-fun lt!312030 () Bool)

(declare-fun lt!312029 () List!12880)

(assert (=> b!671969 (= lt!312030 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312029))))

(declare-fun b!671970 () Bool)

(declare-fun e!383885 () Bool)

(assert (=> b!671970 (= e!383880 e!383885)))

(declare-fun res!438765 () Bool)

(assert (=> b!671970 (=> (not res!438765) (not e!383885))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!671970 (= res!438765 (not (= (select (arr!18800 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23594 0))(
  ( (Unit!23595) )
))
(declare-fun lt!312027 () Unit!23594)

(declare-fun e!383883 () Unit!23594)

(assert (=> b!671970 (= lt!312027 e!383883)))

(declare-fun c!76968 () Bool)

(assert (=> b!671970 (= c!76968 (= (select (arr!18800 a!3626) from!3004) k0!2843))))

(declare-fun b!671971 () Bool)

(declare-fun Unit!23596 () Unit!23594)

(assert (=> b!671971 (= e!383883 Unit!23596)))

(declare-fun b!671972 () Bool)

(declare-fun res!438783 () Bool)

(assert (=> b!671972 (=> (not res!438783) (not e!383880))))

(assert (=> b!671972 (= res!438783 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12877))))

(declare-fun b!671973 () Bool)

(declare-fun res!438787 () Bool)

(assert (=> b!671973 (=> (not res!438787) (not e!383880))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671973 (= res!438787 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19165 a!3626))))))

(declare-fun b!671974 () Bool)

(declare-fun e!383877 () Bool)

(assert (=> b!671974 (= e!383877 (not (contains!3402 lt!312029 k0!2843)))))

(declare-fun res!438774 () Bool)

(assert (=> start!60158 (=> (not res!438774) (not e!383880))))

(assert (=> start!60158 (= res!438774 (and (bvslt (size!19165 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19165 a!3626))))))

(assert (=> start!60158 e!383880))

(assert (=> start!60158 true))

(declare-fun array_inv!14683 (array!39216) Bool)

(assert (=> start!60158 (array_inv!14683 a!3626)))

(declare-fun b!671975 () Bool)

(declare-fun res!438780 () Bool)

(assert (=> b!671975 (=> (not res!438780) (not e!383880))))

(declare-fun e!383878 () Bool)

(assert (=> b!671975 (= res!438780 e!383878)))

(declare-fun res!438768 () Bool)

(assert (=> b!671975 (=> res!438768 e!383878)))

(declare-fun e!383875 () Bool)

(assert (=> b!671975 (= res!438768 e!383875)))

(declare-fun res!438766 () Bool)

(assert (=> b!671975 (=> (not res!438766) (not e!383875))))

(assert (=> b!671975 (= res!438766 (bvsgt from!3004 i!1382))))

(declare-fun b!671976 () Bool)

(declare-fun res!438779 () Bool)

(assert (=> b!671976 (=> (not res!438779) (not e!383880))))

(assert (=> b!671976 (= res!438779 (validKeyInArray!0 k0!2843))))

(declare-fun b!671977 () Bool)

(declare-fun e!383882 () Bool)

(assert (=> b!671977 (= e!383882 e!383877)))

(declare-fun res!438776 () Bool)

(assert (=> b!671977 (=> (not res!438776) (not e!383877))))

(assert (=> b!671977 (= res!438776 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671978 () Bool)

(assert (=> b!671978 (= e!383885 e!383881)))

(declare-fun res!438773 () Bool)

(assert (=> b!671978 (=> (not res!438773) (not e!383881))))

(assert (=> b!671978 (= res!438773 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!268 (List!12880 (_ BitVec 64)) List!12880)

(assert (=> b!671978 (= lt!312029 ($colon$colon!268 acc!681 (select (arr!18800 a!3626) from!3004)))))

(declare-fun b!671979 () Bool)

(assert (=> b!671979 (= e!383875 (contains!3402 acc!681 k0!2843))))

(declare-fun b!671980 () Bool)

(declare-fun res!438781 () Bool)

(assert (=> b!671980 (=> (not res!438781) (not e!383880))))

(assert (=> b!671980 (= res!438781 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19165 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671981 () Bool)

(declare-fun res!438777 () Bool)

(assert (=> b!671981 (=> (not res!438777) (not e!383880))))

(declare-fun noDuplicate!671 (List!12880) Bool)

(assert (=> b!671981 (= res!438777 (noDuplicate!671 acc!681))))

(declare-fun b!671982 () Bool)

(declare-fun e!383884 () Bool)

(assert (=> b!671982 (= e!383884 (not (contains!3402 acc!681 k0!2843)))))

(declare-fun b!671983 () Bool)

(declare-fun res!438785 () Bool)

(assert (=> b!671983 (=> (not res!438785) (not e!383880))))

(declare-fun arrayContainsKey!0 (array!39216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671983 (= res!438785 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671984 () Bool)

(declare-fun Unit!23597 () Unit!23594)

(assert (=> b!671984 (= e!383883 Unit!23597)))

(assert (=> b!671984 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312028 () Unit!23594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39216 (_ BitVec 64) (_ BitVec 32)) Unit!23594)

(assert (=> b!671984 (= lt!312028 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671984 false))

(declare-fun b!671985 () Bool)

(declare-fun res!438772 () Bool)

(assert (=> b!671985 (=> (not res!438772) (not e!383880))))

(assert (=> b!671985 (= res!438772 (not (contains!3402 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671986 () Bool)

(declare-fun e!383876 () Bool)

(assert (=> b!671986 (= e!383876 (contains!3402 lt!312029 k0!2843))))

(declare-fun b!671987 () Bool)

(declare-fun res!438778 () Bool)

(assert (=> b!671987 (=> (not res!438778) (not e!383881))))

(assert (=> b!671987 (= res!438778 e!383882)))

(declare-fun res!438784 () Bool)

(assert (=> b!671987 (=> res!438784 e!383882)))

(assert (=> b!671987 (= res!438784 e!383876)))

(declare-fun res!438764 () Bool)

(assert (=> b!671987 (=> (not res!438764) (not e!383876))))

(assert (=> b!671987 (= res!438764 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671988 () Bool)

(declare-fun res!438767 () Bool)

(assert (=> b!671988 (=> (not res!438767) (not e!383881))))

(assert (=> b!671988 (= res!438767 (not (contains!3402 lt!312029 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671989 () Bool)

(declare-fun res!438771 () Bool)

(assert (=> b!671989 (=> (not res!438771) (not e!383881))))

(assert (=> b!671989 (= res!438771 (noDuplicate!671 lt!312029))))

(declare-fun b!671990 () Bool)

(assert (=> b!671990 (= e!383878 e!383884)))

(declare-fun res!438786 () Bool)

(assert (=> b!671990 (=> (not res!438786) (not e!383884))))

(assert (=> b!671990 (= res!438786 (bvsle from!3004 i!1382))))

(declare-fun b!671991 () Bool)

(declare-fun res!438775 () Bool)

(assert (=> b!671991 (=> (not res!438775) (not e!383881))))

(assert (=> b!671991 (= res!438775 (not (contains!3402 lt!312029 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60158 res!438774) b!671981))

(assert (= (and b!671981 res!438777) b!671985))

(assert (= (and b!671985 res!438772) b!671968))

(assert (= (and b!671968 res!438782) b!671975))

(assert (= (and b!671975 res!438766) b!671979))

(assert (= (and b!671975 (not res!438768)) b!671990))

(assert (= (and b!671990 res!438786) b!671982))

(assert (= (and b!671975 res!438780) b!671972))

(assert (= (and b!671972 res!438783) b!671966))

(assert (= (and b!671966 res!438769) b!671973))

(assert (= (and b!671973 res!438787) b!671976))

(assert (= (and b!671976 res!438779) b!671983))

(assert (= (and b!671983 res!438785) b!671980))

(assert (= (and b!671980 res!438781) b!671967))

(assert (= (and b!671967 res!438770) b!671970))

(assert (= (and b!671970 c!76968) b!671984))

(assert (= (and b!671970 (not c!76968)) b!671971))

(assert (= (and b!671970 res!438765) b!671978))

(assert (= (and b!671978 res!438773) b!671989))

(assert (= (and b!671989 res!438771) b!671991))

(assert (= (and b!671991 res!438775) b!671988))

(assert (= (and b!671988 res!438767) b!671987))

(assert (= (and b!671987 res!438764) b!671986))

(assert (= (and b!671987 (not res!438784)) b!671977))

(assert (= (and b!671977 res!438776) b!671974))

(assert (= (and b!671987 res!438778) b!671969))

(declare-fun m!640533 () Bool)

(assert (=> b!671983 m!640533))

(declare-fun m!640535 () Bool)

(assert (=> b!671976 m!640535))

(declare-fun m!640537 () Bool)

(assert (=> b!671982 m!640537))

(declare-fun m!640539 () Bool)

(assert (=> b!671974 m!640539))

(declare-fun m!640541 () Bool)

(assert (=> b!671984 m!640541))

(declare-fun m!640543 () Bool)

(assert (=> b!671984 m!640543))

(assert (=> b!671986 m!640539))

(declare-fun m!640545 () Bool)

(assert (=> b!671991 m!640545))

(declare-fun m!640547 () Bool)

(assert (=> b!671989 m!640547))

(assert (=> b!671979 m!640537))

(declare-fun m!640549 () Bool)

(assert (=> b!671988 m!640549))

(declare-fun m!640551 () Bool)

(assert (=> start!60158 m!640551))

(declare-fun m!640553 () Bool)

(assert (=> b!671969 m!640553))

(declare-fun m!640555 () Bool)

(assert (=> b!671981 m!640555))

(declare-fun m!640557 () Bool)

(assert (=> b!671970 m!640557))

(declare-fun m!640559 () Bool)

(assert (=> b!671968 m!640559))

(assert (=> b!671967 m!640557))

(assert (=> b!671967 m!640557))

(declare-fun m!640561 () Bool)

(assert (=> b!671967 m!640561))

(declare-fun m!640563 () Bool)

(assert (=> b!671966 m!640563))

(assert (=> b!671978 m!640557))

(assert (=> b!671978 m!640557))

(declare-fun m!640565 () Bool)

(assert (=> b!671978 m!640565))

(declare-fun m!640567 () Bool)

(assert (=> b!671985 m!640567))

(declare-fun m!640569 () Bool)

(assert (=> b!671972 m!640569))

(check-sat (not b!671968) (not b!671986) (not b!671976) (not b!671983) (not b!671985) (not b!671972) (not b!671991) (not b!671969) (not b!671967) (not b!671982) (not b!671974) (not b!671978) (not b!671984) (not start!60158) (not b!671981) (not b!671979) (not b!671966) (not b!671989) (not b!671988))
(check-sat)
