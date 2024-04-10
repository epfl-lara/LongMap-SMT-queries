; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63370 () Bool)

(assert start!63370)

(declare-fun res!476982 () Bool)

(declare-fun e!401320 () Bool)

(assert (=> start!63370 (=> (not res!476982) (not e!401320))))

(declare-datatypes ((array!40474 0))(
  ( (array!40475 (arr!19377 (Array (_ BitVec 32) (_ BitVec 64))) (size!19788 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40474)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63370 (= res!476982 (and (bvslt (size!19788 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19788 a!3591))))))

(assert (=> start!63370 e!401320))

(assert (=> start!63370 true))

(declare-fun array_inv!15173 (array!40474) Bool)

(assert (=> start!63370 (array_inv!15173 a!3591)))

(declare-fun b!713893 () Bool)

(declare-fun res!476986 () Bool)

(assert (=> b!713893 (=> (not res!476986) (not e!401320))))

(declare-datatypes ((List!13418 0))(
  ( (Nil!13415) (Cons!13414 (h!14459 (_ BitVec 64)) (t!19733 List!13418)) )
))
(declare-fun newAcc!49 () List!13418)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13418)

(declare-fun -!405 (List!13418 (_ BitVec 64)) List!13418)

(assert (=> b!713893 (= res!476986 (= (-!405 newAcc!49 k!2824) acc!652))))

(declare-fun b!713894 () Bool)

(declare-fun res!476983 () Bool)

(assert (=> b!713894 (=> (not res!476983) (not e!401320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713894 (= res!476983 (validKeyInArray!0 k!2824))))

(declare-fun b!713895 () Bool)

(assert (=> b!713895 (= e!401320 false)))

(declare-fun lt!318725 () Bool)

(declare-fun contains!3995 (List!13418 (_ BitVec 64)) Bool)

(assert (=> b!713895 (= lt!318725 (contains!3995 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713896 () Bool)

(declare-fun res!476980 () Bool)

(assert (=> b!713896 (=> (not res!476980) (not e!401320))))

(declare-fun noDuplicate!1242 (List!13418) Bool)

(assert (=> b!713896 (= res!476980 (noDuplicate!1242 acc!652))))

(declare-fun b!713897 () Bool)

(declare-fun res!476987 () Bool)

(assert (=> b!713897 (=> (not res!476987) (not e!401320))))

(assert (=> b!713897 (= res!476987 (noDuplicate!1242 newAcc!49))))

(declare-fun b!713898 () Bool)

(declare-fun res!476989 () Bool)

(assert (=> b!713898 (=> (not res!476989) (not e!401320))))

(assert (=> b!713898 (= res!476989 (not (contains!3995 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713899 () Bool)

(declare-fun res!476984 () Bool)

(assert (=> b!713899 (=> (not res!476984) (not e!401320))))

(assert (=> b!713899 (= res!476984 (not (contains!3995 acc!652 k!2824)))))

(declare-fun b!713900 () Bool)

(declare-fun res!476978 () Bool)

(assert (=> b!713900 (=> (not res!476978) (not e!401320))))

(declare-fun arrayNoDuplicates!0 (array!40474 (_ BitVec 32) List!13418) Bool)

(assert (=> b!713900 (= res!476978 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713901 () Bool)

(declare-fun res!476981 () Bool)

(assert (=> b!713901 (=> (not res!476981) (not e!401320))))

(assert (=> b!713901 (= res!476981 (contains!3995 newAcc!49 k!2824))))

(declare-fun b!713902 () Bool)

(declare-fun res!476979 () Bool)

(assert (=> b!713902 (=> (not res!476979) (not e!401320))))

(declare-fun arrayContainsKey!0 (array!40474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713902 (= res!476979 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713903 () Bool)

(declare-fun res!476985 () Bool)

(assert (=> b!713903 (=> (not res!476985) (not e!401320))))

(assert (=> b!713903 (= res!476985 (not (contains!3995 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713904 () Bool)

(declare-fun res!476988 () Bool)

(assert (=> b!713904 (=> (not res!476988) (not e!401320))))

(assert (=> b!713904 (= res!476988 (not (contains!3995 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713905 () Bool)

(declare-fun res!476977 () Bool)

(assert (=> b!713905 (=> (not res!476977) (not e!401320))))

(declare-fun subseq!440 (List!13418 List!13418) Bool)

(assert (=> b!713905 (= res!476977 (subseq!440 acc!652 newAcc!49))))

(assert (= (and start!63370 res!476982) b!713896))

(assert (= (and b!713896 res!476980) b!713897))

(assert (= (and b!713897 res!476987) b!713903))

(assert (= (and b!713903 res!476985) b!713904))

(assert (= (and b!713904 res!476988) b!713902))

(assert (= (and b!713902 res!476979) b!713899))

(assert (= (and b!713899 res!476984) b!713894))

(assert (= (and b!713894 res!476983) b!713900))

(assert (= (and b!713900 res!476978) b!713905))

(assert (= (and b!713905 res!476977) b!713901))

(assert (= (and b!713901 res!476981) b!713893))

(assert (= (and b!713893 res!476986) b!713898))

(assert (= (and b!713898 res!476989) b!713895))

(declare-fun m!670567 () Bool)

(assert (=> b!713902 m!670567))

(declare-fun m!670569 () Bool)

(assert (=> b!713894 m!670569))

(declare-fun m!670571 () Bool)

(assert (=> b!713901 m!670571))

(declare-fun m!670573 () Bool)

(assert (=> b!713899 m!670573))

(declare-fun m!670575 () Bool)

(assert (=> b!713903 m!670575))

(declare-fun m!670577 () Bool)

(assert (=> b!713900 m!670577))

(declare-fun m!670579 () Bool)

(assert (=> b!713905 m!670579))

(declare-fun m!670581 () Bool)

(assert (=> start!63370 m!670581))

(declare-fun m!670583 () Bool)

(assert (=> b!713898 m!670583))

(declare-fun m!670585 () Bool)

(assert (=> b!713893 m!670585))

(declare-fun m!670587 () Bool)

(assert (=> b!713897 m!670587))

(declare-fun m!670589 () Bool)

(assert (=> b!713895 m!670589))

(declare-fun m!670591 () Bool)

(assert (=> b!713904 m!670591))

(declare-fun m!670593 () Bool)

(assert (=> b!713896 m!670593))

(push 1)

(assert (not b!713899))

(assert (not b!713900))

(assert (not b!713903))

(assert (not b!713898))

(assert (not b!713902))

(assert (not b!713897))

(assert (not b!713901))

(assert (not start!63370))

(assert (not b!713905))

(assert (not b!713894))

(assert (not b!713895))

(assert (not b!713904))

(assert (not b!713893))

(assert (not b!713896))

(check-sat)

