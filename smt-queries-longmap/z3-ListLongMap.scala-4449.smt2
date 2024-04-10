; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61798 () Bool)

(assert start!61798)

(declare-fun b!691987 () Bool)

(declare-fun res!456286 () Bool)

(declare-fun e!393703 () Bool)

(assert (=> b!691987 (=> (not res!456286) (not e!393703))))

(declare-datatypes ((List!13119 0))(
  ( (Nil!13116) (Cons!13115 (h!14160 (_ BitVec 64)) (t!19386 List!13119)) )
))
(declare-fun acc!681 () List!13119)

(declare-fun contains!3696 (List!13119 (_ BitVec 64)) Bool)

(assert (=> b!691987 (= res!456286 (not (contains!3696 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691988 () Bool)

(declare-fun res!456287 () Bool)

(assert (=> b!691988 (=> (not res!456287) (not e!393703))))

(declare-datatypes ((array!39819 0))(
  ( (array!39820 (arr!19078 (Array (_ BitVec 32) (_ BitVec 64))) (size!19463 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39819)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39819 (_ BitVec 32) List!13119) Bool)

(assert (=> b!691988 (= res!456287 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691989 () Bool)

(declare-fun e!393706 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!691989 (= e!393706 (contains!3696 acc!681 k0!2843))))

(declare-fun res!456297 () Bool)

(assert (=> start!61798 (=> (not res!456297) (not e!393703))))

(assert (=> start!61798 (= res!456297 (and (bvslt (size!19463 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19463 a!3626))))))

(assert (=> start!61798 e!393703))

(assert (=> start!61798 true))

(declare-fun array_inv!14874 (array!39819) Bool)

(assert (=> start!61798 (array_inv!14874 a!3626)))

(declare-fun b!691990 () Bool)

(declare-fun res!456293 () Bool)

(assert (=> b!691990 (=> (not res!456293) (not e!393703))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691990 (= res!456293 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19463 a!3626))))))

(declare-fun b!691991 () Bool)

(declare-fun res!456294 () Bool)

(assert (=> b!691991 (=> (not res!456294) (not e!393703))))

(declare-fun e!393704 () Bool)

(assert (=> b!691991 (= res!456294 e!393704)))

(declare-fun res!456291 () Bool)

(assert (=> b!691991 (=> res!456291 e!393704)))

(assert (=> b!691991 (= res!456291 e!393706)))

(declare-fun res!456299 () Bool)

(assert (=> b!691991 (=> (not res!456299) (not e!393706))))

(assert (=> b!691991 (= res!456299 (bvsgt from!3004 i!1382))))

(declare-fun b!691992 () Bool)

(declare-fun e!393707 () Bool)

(assert (=> b!691992 (= e!393704 e!393707)))

(declare-fun res!456290 () Bool)

(assert (=> b!691992 (=> (not res!456290) (not e!393707))))

(assert (=> b!691992 (= res!456290 (bvsle from!3004 i!1382))))

(declare-fun b!691993 () Bool)

(declare-datatypes ((Unit!24430 0))(
  ( (Unit!24431) )
))
(declare-fun e!393705 () Unit!24430)

(declare-fun Unit!24432 () Unit!24430)

(assert (=> b!691993 (= e!393705 Unit!24432)))

(declare-fun b!691994 () Bool)

(declare-fun res!456289 () Bool)

(assert (=> b!691994 (=> (not res!456289) (not e!393703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691994 (= res!456289 (validKeyInArray!0 (select (arr!19078 a!3626) from!3004)))))

(declare-fun b!691995 () Bool)

(declare-fun res!456292 () Bool)

(assert (=> b!691995 (=> (not res!456292) (not e!393703))))

(assert (=> b!691995 (= res!456292 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13116))))

(declare-fun b!691996 () Bool)

(assert (=> b!691996 (= e!393703 false)))

(declare-fun lt!316530 () Unit!24430)

(assert (=> b!691996 (= lt!316530 e!393705)))

(declare-fun c!78218 () Bool)

(assert (=> b!691996 (= c!78218 (= (select (arr!19078 a!3626) from!3004) k0!2843))))

(declare-fun b!691997 () Bool)

(declare-fun res!456288 () Bool)

(assert (=> b!691997 (=> (not res!456288) (not e!393703))))

(declare-fun noDuplicate!943 (List!13119) Bool)

(assert (=> b!691997 (= res!456288 (noDuplicate!943 acc!681))))

(declare-fun b!691998 () Bool)

(declare-fun res!456285 () Bool)

(assert (=> b!691998 (=> (not res!456285) (not e!393703))))

(assert (=> b!691998 (= res!456285 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19463 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691999 () Bool)

(declare-fun Unit!24433 () Unit!24430)

(assert (=> b!691999 (= e!393705 Unit!24433)))

(declare-fun arrayContainsKey!0 (array!39819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691999 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316531 () Unit!24430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39819 (_ BitVec 64) (_ BitVec 32)) Unit!24430)

(assert (=> b!691999 (= lt!316531 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691999 false))

(declare-fun b!692000 () Bool)

(declare-fun res!456298 () Bool)

(assert (=> b!692000 (=> (not res!456298) (not e!393703))))

(assert (=> b!692000 (= res!456298 (validKeyInArray!0 k0!2843))))

(declare-fun b!692001 () Bool)

(assert (=> b!692001 (= e!393707 (not (contains!3696 acc!681 k0!2843)))))

(declare-fun b!692002 () Bool)

(declare-fun res!456296 () Bool)

(assert (=> b!692002 (=> (not res!456296) (not e!393703))))

(assert (=> b!692002 (= res!456296 (not (contains!3696 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692003 () Bool)

(declare-fun res!456295 () Bool)

(assert (=> b!692003 (=> (not res!456295) (not e!393703))))

(assert (=> b!692003 (= res!456295 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61798 res!456297) b!691997))

(assert (= (and b!691997 res!456288) b!692002))

(assert (= (and b!692002 res!456296) b!691987))

(assert (= (and b!691987 res!456286) b!691991))

(assert (= (and b!691991 res!456299) b!691989))

(assert (= (and b!691991 (not res!456291)) b!691992))

(assert (= (and b!691992 res!456290) b!692001))

(assert (= (and b!691991 res!456294) b!691995))

(assert (= (and b!691995 res!456292) b!691988))

(assert (= (and b!691988 res!456287) b!691990))

(assert (= (and b!691990 res!456293) b!692000))

(assert (= (and b!692000 res!456298) b!692003))

(assert (= (and b!692003 res!456295) b!691998))

(assert (= (and b!691998 res!456285) b!691994))

(assert (= (and b!691994 res!456289) b!691996))

(assert (= (and b!691996 c!78218) b!691999))

(assert (= (and b!691996 (not c!78218)) b!691993))

(declare-fun m!654745 () Bool)

(assert (=> b!691995 m!654745))

(declare-fun m!654747 () Bool)

(assert (=> b!691994 m!654747))

(assert (=> b!691994 m!654747))

(declare-fun m!654749 () Bool)

(assert (=> b!691994 m!654749))

(declare-fun m!654751 () Bool)

(assert (=> b!692002 m!654751))

(declare-fun m!654753 () Bool)

(assert (=> start!61798 m!654753))

(declare-fun m!654755 () Bool)

(assert (=> b!692000 m!654755))

(declare-fun m!654757 () Bool)

(assert (=> b!691997 m!654757))

(declare-fun m!654759 () Bool)

(assert (=> b!691999 m!654759))

(declare-fun m!654761 () Bool)

(assert (=> b!691999 m!654761))

(declare-fun m!654763 () Bool)

(assert (=> b!691989 m!654763))

(assert (=> b!691996 m!654747))

(declare-fun m!654765 () Bool)

(assert (=> b!692003 m!654765))

(declare-fun m!654767 () Bool)

(assert (=> b!691987 m!654767))

(declare-fun m!654769 () Bool)

(assert (=> b!691988 m!654769))

(assert (=> b!692001 m!654763))

(check-sat (not b!691997) (not b!691989) (not b!691987) (not b!692001) (not start!61798) (not b!691988) (not b!692003) (not b!691994) (not b!692000) (not b!691999) (not b!691995) (not b!692002))
