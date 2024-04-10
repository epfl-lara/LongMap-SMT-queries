; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103924 () Bool)

(assert start!103924)

(declare-fun b!1243984 () Bool)

(declare-fun res!829769 () Bool)

(declare-fun e!705082 () Bool)

(assert (=> b!1243984 (=> (not res!829769) (not e!705082))))

(declare-datatypes ((List!27404 0))(
  ( (Nil!27401) (Cons!27400 (h!28609 (_ BitVec 64)) (t!40873 List!27404)) )
))
(declare-fun contains!7425 (List!27404 (_ BitVec 64)) Bool)

(assert (=> b!1243984 (= res!829769 (not (contains!7425 Nil!27401 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243985 () Bool)

(declare-fun res!829768 () Bool)

(assert (=> b!1243985 (=> (not res!829768) (not e!705082))))

(declare-fun lt!562538 () List!27404)

(declare-fun noDuplicate!2003 (List!27404) Bool)

(assert (=> b!1243985 (= res!829768 (noDuplicate!2003 lt!562538))))

(declare-fun b!1243986 () Bool)

(declare-fun e!705083 () Bool)

(assert (=> b!1243986 (= e!705083 e!705082)))

(declare-fun res!829762 () Bool)

(assert (=> b!1243986 (=> (not res!829762) (not e!705082))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243986 (= res!829762 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!80016 0))(
  ( (array!80017 (arr!38601 (Array (_ BitVec 32) (_ BitVec 64))) (size!39137 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80016)

(assert (=> b!1243986 (= lt!562538 (Cons!27400 (select (arr!38601 a!3892) from!3270) Nil!27401))))

(declare-fun b!1243988 () Bool)

(declare-fun res!829767 () Bool)

(assert (=> b!1243988 (=> (not res!829767) (not e!705083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243988 (= res!829767 (validKeyInArray!0 (select (arr!38601 a!3892) from!3270)))))

(declare-fun b!1243989 () Bool)

(declare-fun res!829764 () Bool)

(assert (=> b!1243989 (=> (not res!829764) (not e!705082))))

(assert (=> b!1243989 (= res!829764 (not (contains!7425 lt!562538 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243990 () Bool)

(declare-fun res!829770 () Bool)

(assert (=> b!1243990 (=> (not res!829770) (not e!705082))))

(assert (=> b!1243990 (= res!829770 (not (contains!7425 lt!562538 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243991 () Bool)

(declare-fun res!829765 () Bool)

(assert (=> b!1243991 (=> (not res!829765) (not e!705083))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243991 (= res!829765 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39137 a!3892)) (not (= newFrom!287 (size!39137 a!3892)))))))

(declare-fun b!1243992 () Bool)

(declare-fun res!829763 () Bool)

(assert (=> b!1243992 (=> (not res!829763) (not e!705083))))

(declare-fun arrayNoDuplicates!0 (array!80016 (_ BitVec 32) List!27404) Bool)

(assert (=> b!1243992 (= res!829763 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27401))))

(declare-fun b!1243993 () Bool)

(declare-fun res!829766 () Bool)

(assert (=> b!1243993 (=> (not res!829766) (not e!705082))))

(assert (=> b!1243993 (= res!829766 (not (contains!7425 Nil!27401 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243994 () Bool)

(assert (=> b!1243994 (= e!705082 false)))

(declare-fun lt!562537 () Bool)

(assert (=> b!1243994 (= lt!562537 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562538))))

(declare-datatypes ((Unit!41311 0))(
  ( (Unit!41312) )
))
(declare-fun lt!562536 () Unit!41311)

(declare-fun noDuplicateSubseq!105 (List!27404 List!27404) Unit!41311)

(assert (=> b!1243994 (= lt!562536 (noDuplicateSubseq!105 Nil!27401 lt!562538))))

(declare-fun b!1243987 () Bool)

(declare-fun res!829761 () Bool)

(assert (=> b!1243987 (=> (not res!829761) (not e!705082))))

(declare-fun subseq!651 (List!27404 List!27404) Bool)

(assert (=> b!1243987 (= res!829761 (subseq!651 Nil!27401 lt!562538))))

(declare-fun res!829771 () Bool)

(assert (=> start!103924 (=> (not res!829771) (not e!705083))))

(assert (=> start!103924 (= res!829771 (and (bvslt (size!39137 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39137 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39137 a!3892))))))

(assert (=> start!103924 e!705083))

(declare-fun array_inv!29449 (array!80016) Bool)

(assert (=> start!103924 (array_inv!29449 a!3892)))

(assert (=> start!103924 true))

(assert (= (and start!103924 res!829771) b!1243992))

(assert (= (and b!1243992 res!829763) b!1243991))

(assert (= (and b!1243991 res!829765) b!1243988))

(assert (= (and b!1243988 res!829767) b!1243986))

(assert (= (and b!1243986 res!829762) b!1243985))

(assert (= (and b!1243985 res!829768) b!1243989))

(assert (= (and b!1243989 res!829764) b!1243990))

(assert (= (and b!1243990 res!829770) b!1243984))

(assert (= (and b!1243984 res!829769) b!1243993))

(assert (= (and b!1243993 res!829766) b!1243987))

(assert (= (and b!1243987 res!829761) b!1243994))

(declare-fun m!1146395 () Bool)

(assert (=> b!1243988 m!1146395))

(assert (=> b!1243988 m!1146395))

(declare-fun m!1146397 () Bool)

(assert (=> b!1243988 m!1146397))

(declare-fun m!1146399 () Bool)

(assert (=> b!1243985 m!1146399))

(declare-fun m!1146401 () Bool)

(assert (=> b!1243990 m!1146401))

(declare-fun m!1146403 () Bool)

(assert (=> b!1243987 m!1146403))

(declare-fun m!1146405 () Bool)

(assert (=> start!103924 m!1146405))

(declare-fun m!1146407 () Bool)

(assert (=> b!1243992 m!1146407))

(declare-fun m!1146409 () Bool)

(assert (=> b!1243984 m!1146409))

(declare-fun m!1146411 () Bool)

(assert (=> b!1243993 m!1146411))

(assert (=> b!1243986 m!1146395))

(declare-fun m!1146413 () Bool)

(assert (=> b!1243994 m!1146413))

(declare-fun m!1146415 () Bool)

(assert (=> b!1243994 m!1146415))

(declare-fun m!1146417 () Bool)

(assert (=> b!1243989 m!1146417))

(check-sat (not b!1243992) (not b!1243989) (not b!1243988) (not b!1243993) (not b!1243985) (not b!1243990) (not b!1243994) (not start!103924) (not b!1243987) (not b!1243984))
