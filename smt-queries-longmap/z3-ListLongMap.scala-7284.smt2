; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93068 () Bool)

(assert start!93068)

(declare-fun b!1055919 () Bool)

(declare-fun res!704736 () Bool)

(declare-fun e!600202 () Bool)

(assert (=> b!1055919 (=> (not res!704736) (not e!600202))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055919 (= res!704736 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055920 () Bool)

(declare-fun res!704733 () Bool)

(assert (=> b!1055920 (=> (not res!704733) (not e!600202))))

(declare-datatypes ((array!66593 0))(
  ( (array!66594 (arr!32024 (Array (_ BitVec 32) (_ BitVec 64))) (size!32560 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66593)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055920 (= res!704733 (= (select (arr!32024 a!3488) i!1381) k0!2747))))

(declare-fun b!1055921 () Bool)

(declare-fun e!600199 () Bool)

(assert (=> b!1055921 (= e!600202 e!600199)))

(declare-fun res!704740 () Bool)

(assert (=> b!1055921 (=> (not res!704740) (not e!600199))))

(declare-fun lt!465983 () array!66593)

(declare-fun arrayContainsKey!0 (array!66593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055921 (= res!704740 (arrayContainsKey!0 lt!465983 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055921 (= lt!465983 (array!66594 (store (arr!32024 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32560 a!3488)))))

(declare-fun res!704741 () Bool)

(assert (=> start!93068 (=> (not res!704741) (not e!600202))))

(assert (=> start!93068 (= res!704741 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32560 a!3488)) (bvslt (size!32560 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93068 e!600202))

(assert (=> start!93068 true))

(declare-fun array_inv!24804 (array!66593) Bool)

(assert (=> start!93068 (array_inv!24804 a!3488)))

(declare-fun b!1055922 () Bool)

(declare-fun e!600205 () Bool)

(declare-fun e!600203 () Bool)

(assert (=> b!1055922 (= e!600205 (not e!600203))))

(declare-fun res!704739 () Bool)

(assert (=> b!1055922 (=> res!704739 e!600203)))

(declare-fun lt!465987 () (_ BitVec 32))

(assert (=> b!1055922 (= res!704739 (bvsle lt!465987 i!1381))))

(declare-fun e!600201 () Bool)

(assert (=> b!1055922 e!600201))

(declare-fun res!704737 () Bool)

(assert (=> b!1055922 (=> (not res!704737) (not e!600201))))

(assert (=> b!1055922 (= res!704737 (= (select (store (arr!32024 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465987) k0!2747))))

(declare-fun b!1055923 () Bool)

(declare-fun e!600200 () Bool)

(assert (=> b!1055923 (= e!600201 e!600200)))

(declare-fun res!704734 () Bool)

(assert (=> b!1055923 (=> res!704734 e!600200)))

(assert (=> b!1055923 (= res!704734 (bvsle lt!465987 i!1381))))

(declare-fun b!1055924 () Bool)

(assert (=> b!1055924 (= e!600199 e!600205)))

(declare-fun res!704738 () Bool)

(assert (=> b!1055924 (=> (not res!704738) (not e!600205))))

(assert (=> b!1055924 (= res!704738 (not (= lt!465987 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66593 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055924 (= lt!465987 (arrayScanForKey!0 lt!465983 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055925 () Bool)

(assert (=> b!1055925 (= e!600203 true)))

(assert (=> b!1055925 false))

(declare-datatypes ((Unit!34606 0))(
  ( (Unit!34607) )
))
(declare-fun lt!465986 () Unit!34606)

(declare-datatypes ((List!22336 0))(
  ( (Nil!22333) (Cons!22332 (h!23541 (_ BitVec 64)) (t!31643 List!22336)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66593 (_ BitVec 64) (_ BitVec 32) List!22336) Unit!34606)

(assert (=> b!1055925 (= lt!465986 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22333))))

(assert (=> b!1055925 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465984 () Unit!34606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34606)

(assert (=> b!1055925 (= lt!465984 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465987 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66593 (_ BitVec 32) List!22336) Bool)

(assert (=> b!1055925 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22333)))

(declare-fun lt!465985 () Unit!34606)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66593 (_ BitVec 32) (_ BitVec 32)) Unit!34606)

(assert (=> b!1055925 (= lt!465985 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055926 () Bool)

(declare-fun res!704735 () Bool)

(assert (=> b!1055926 (=> (not res!704735) (not e!600202))))

(assert (=> b!1055926 (= res!704735 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22333))))

(declare-fun b!1055927 () Bool)

(assert (=> b!1055927 (= e!600200 (arrayContainsKey!0 a!3488 k0!2747 lt!465987))))

(assert (= (and start!93068 res!704741) b!1055926))

(assert (= (and b!1055926 res!704735) b!1055919))

(assert (= (and b!1055919 res!704736) b!1055920))

(assert (= (and b!1055920 res!704733) b!1055921))

(assert (= (and b!1055921 res!704740) b!1055924))

(assert (= (and b!1055924 res!704738) b!1055922))

(assert (= (and b!1055922 res!704737) b!1055923))

(assert (= (and b!1055923 (not res!704734)) b!1055927))

(assert (= (and b!1055922 (not res!704739)) b!1055925))

(declare-fun m!975897 () Bool)

(assert (=> b!1055922 m!975897))

(declare-fun m!975899 () Bool)

(assert (=> b!1055922 m!975899))

(declare-fun m!975901 () Bool)

(assert (=> b!1055925 m!975901))

(declare-fun m!975903 () Bool)

(assert (=> b!1055925 m!975903))

(declare-fun m!975905 () Bool)

(assert (=> b!1055925 m!975905))

(declare-fun m!975907 () Bool)

(assert (=> b!1055925 m!975907))

(declare-fun m!975909 () Bool)

(assert (=> b!1055925 m!975909))

(declare-fun m!975911 () Bool)

(assert (=> b!1055921 m!975911))

(assert (=> b!1055921 m!975897))

(declare-fun m!975913 () Bool)

(assert (=> b!1055926 m!975913))

(declare-fun m!975915 () Bool)

(assert (=> b!1055924 m!975915))

(declare-fun m!975917 () Bool)

(assert (=> start!93068 m!975917))

(declare-fun m!975919 () Bool)

(assert (=> b!1055927 m!975919))

(declare-fun m!975921 () Bool)

(assert (=> b!1055920 m!975921))

(declare-fun m!975923 () Bool)

(assert (=> b!1055919 m!975923))

(check-sat (not b!1055919) (not b!1055924) (not b!1055927) (not b!1055921) (not b!1055926) (not b!1055925) (not start!93068))
(check-sat)
