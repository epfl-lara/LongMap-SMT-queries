; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93436 () Bool)

(assert start!93436)

(declare-fun b!1058331 () Bool)

(declare-fun res!706914 () Bool)

(declare-fun e!602066 () Bool)

(assert (=> b!1058331 (=> (not res!706914) (not e!602066))))

(declare-datatypes ((array!66739 0))(
  ( (array!66740 (arr!32088 (Array (_ BitVec 32) (_ BitVec 64))) (size!32624 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66739)

(declare-datatypes ((List!22400 0))(
  ( (Nil!22397) (Cons!22396 (h!23605 (_ BitVec 64)) (t!31707 List!22400)) )
))
(declare-fun arrayNoDuplicates!0 (array!66739 (_ BitVec 32) List!22400) Bool)

(assert (=> b!1058331 (= res!706914 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22397))))

(declare-fun b!1058332 () Bool)

(declare-fun e!602069 () Bool)

(declare-fun e!602065 () Bool)

(assert (=> b!1058332 (= e!602069 e!602065)))

(declare-fun res!706908 () Bool)

(assert (=> b!1058332 (=> (not res!706908) (not e!602065))))

(declare-fun lt!466821 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058332 (= res!706908 (not (= lt!466821 i!1381)))))

(declare-fun lt!466824 () array!66739)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66739 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058332 (= lt!466821 (arrayScanForKey!0 lt!466824 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058333 () Bool)

(declare-fun e!602067 () Bool)

(declare-fun e!602071 () Bool)

(assert (=> b!1058333 (= e!602067 e!602071)))

(declare-fun res!706910 () Bool)

(assert (=> b!1058333 (=> res!706910 e!602071)))

(declare-fun lt!466822 () (_ BitVec 32))

(assert (=> b!1058333 (= res!706910 (or (bvslt lt!466821 #b00000000000000000000000000000000) (bvsge lt!466822 (size!32624 a!3488)) (bvsge lt!466821 (size!32624 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058333 (arrayContainsKey!0 a!3488 k!2747 lt!466822)))

(declare-datatypes ((Unit!34698 0))(
  ( (Unit!34699) )
))
(declare-fun lt!466823 () Unit!34698)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34698)

(assert (=> b!1058333 (= lt!466823 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466822))))

(assert (=> b!1058333 (= lt!466822 (bvadd #b00000000000000000000000000000001 lt!466821))))

(assert (=> b!1058333 (arrayNoDuplicates!0 a!3488 lt!466821 Nil!22397)))

(declare-fun lt!466819 () Unit!34698)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66739 (_ BitVec 32) (_ BitVec 32)) Unit!34698)

(assert (=> b!1058333 (= lt!466819 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466821))))

(declare-fun b!1058334 () Bool)

(declare-fun res!706912 () Bool)

(assert (=> b!1058334 (=> (not res!706912) (not e!602066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058334 (= res!706912 (validKeyInArray!0 k!2747))))

(declare-fun b!1058335 () Bool)

(assert (=> b!1058335 (= e!602065 (not e!602067))))

(declare-fun res!706905 () Bool)

(assert (=> b!1058335 (=> res!706905 e!602067)))

(assert (=> b!1058335 (= res!706905 (or (bvsgt lt!466821 i!1381) (bvsle i!1381 lt!466821)))))

(declare-fun e!602064 () Bool)

(assert (=> b!1058335 e!602064))

(declare-fun res!706916 () Bool)

(assert (=> b!1058335 (=> (not res!706916) (not e!602064))))

(assert (=> b!1058335 (= res!706916 (= (select (store (arr!32088 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466821) k!2747))))

(declare-fun res!706906 () Bool)

(assert (=> start!93436 (=> (not res!706906) (not e!602066))))

(assert (=> start!93436 (= res!706906 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32624 a!3488)) (bvslt (size!32624 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93436 e!602066))

(assert (=> start!93436 true))

(declare-fun array_inv!24868 (array!66739) Bool)

(assert (=> start!93436 (array_inv!24868 a!3488)))

(declare-fun b!1058336 () Bool)

(declare-fun res!706907 () Bool)

(assert (=> b!1058336 (=> res!706907 e!602071)))

(declare-fun contains!6212 (List!22400 (_ BitVec 64)) Bool)

(assert (=> b!1058336 (= res!706907 (contains!6212 Nil!22397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058337 () Bool)

(declare-fun e!602070 () Bool)

(assert (=> b!1058337 (= e!602070 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058338 () Bool)

(assert (=> b!1058338 (= e!602071 true)))

(declare-fun lt!466820 () Bool)

(assert (=> b!1058338 (= lt!466820 (contains!6212 Nil!22397 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058339 () Bool)

(declare-fun res!706911 () Bool)

(assert (=> b!1058339 (=> (not res!706911) (not e!602066))))

(assert (=> b!1058339 (= res!706911 (= (select (arr!32088 a!3488) i!1381) k!2747))))

(declare-fun b!1058340 () Bool)

(assert (=> b!1058340 (= e!602064 e!602070)))

(declare-fun res!706909 () Bool)

(assert (=> b!1058340 (=> res!706909 e!602070)))

(assert (=> b!1058340 (= res!706909 (or (bvsgt lt!466821 i!1381) (bvsle i!1381 lt!466821)))))

(declare-fun b!1058341 () Bool)

(assert (=> b!1058341 (= e!602066 e!602069)))

(declare-fun res!706913 () Bool)

(assert (=> b!1058341 (=> (not res!706913) (not e!602069))))

(assert (=> b!1058341 (= res!706913 (arrayContainsKey!0 lt!466824 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058341 (= lt!466824 (array!66740 (store (arr!32088 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32624 a!3488)))))

(declare-fun b!1058342 () Bool)

(declare-fun res!706915 () Bool)

(assert (=> b!1058342 (=> res!706915 e!602071)))

(declare-fun noDuplicate!1568 (List!22400) Bool)

(assert (=> b!1058342 (= res!706915 (not (noDuplicate!1568 Nil!22397)))))

(assert (= (and start!93436 res!706906) b!1058331))

(assert (= (and b!1058331 res!706914) b!1058334))

(assert (= (and b!1058334 res!706912) b!1058339))

(assert (= (and b!1058339 res!706911) b!1058341))

(assert (= (and b!1058341 res!706913) b!1058332))

(assert (= (and b!1058332 res!706908) b!1058335))

(assert (= (and b!1058335 res!706916) b!1058340))

(assert (= (and b!1058340 (not res!706909)) b!1058337))

(assert (= (and b!1058335 (not res!706905)) b!1058333))

(assert (= (and b!1058333 (not res!706910)) b!1058342))

(assert (= (and b!1058342 (not res!706915)) b!1058336))

(assert (= (and b!1058336 (not res!706907)) b!1058338))

(declare-fun m!977955 () Bool)

(assert (=> b!1058332 m!977955))

(declare-fun m!977957 () Bool)

(assert (=> b!1058331 m!977957))

(declare-fun m!977959 () Bool)

(assert (=> b!1058338 m!977959))

(declare-fun m!977961 () Bool)

(assert (=> b!1058342 m!977961))

(declare-fun m!977963 () Bool)

(assert (=> b!1058337 m!977963))

(declare-fun m!977965 () Bool)

(assert (=> b!1058333 m!977965))

(declare-fun m!977967 () Bool)

(assert (=> b!1058333 m!977967))

(declare-fun m!977969 () Bool)

(assert (=> b!1058333 m!977969))

(declare-fun m!977971 () Bool)

(assert (=> b!1058333 m!977971))

(declare-fun m!977973 () Bool)

(assert (=> b!1058339 m!977973))

(declare-fun m!977975 () Bool)

(assert (=> start!93436 m!977975))

(declare-fun m!977977 () Bool)

(assert (=> b!1058334 m!977977))

(declare-fun m!977979 () Bool)

(assert (=> b!1058341 m!977979))

(declare-fun m!977981 () Bool)

(assert (=> b!1058341 m!977981))

(assert (=> b!1058335 m!977981))

(declare-fun m!977983 () Bool)

(assert (=> b!1058335 m!977983))

(declare-fun m!977985 () Bool)

(assert (=> b!1058336 m!977985))

(push 1)

(assert (not b!1058332))

(assert (not b!1058338))

