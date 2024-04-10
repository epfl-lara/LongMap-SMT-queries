; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92548 () Bool)

(assert start!92548)

(declare-fun b!1052727 () Bool)

(declare-fun e!597747 () Bool)

(declare-fun e!597744 () Bool)

(assert (=> b!1052727 (= e!597747 e!597744)))

(declare-fun res!701853 () Bool)

(assert (=> b!1052727 (=> (not res!701853) (not e!597744))))

(declare-datatypes ((array!66349 0))(
  ( (array!66350 (arr!31914 (Array (_ BitVec 32) (_ BitVec 64))) (size!32450 (_ BitVec 32))) )
))
(declare-fun lt!464942 () array!66349)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052727 (= res!701853 (arrayContainsKey!0 lt!464942 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66349)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052727 (= lt!464942 (array!66350 (store (arr!31914 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32450 a!3488)))))

(declare-fun b!1052728 () Bool)

(declare-fun e!597743 () Bool)

(assert (=> b!1052728 (= e!597744 e!597743)))

(declare-fun res!701860 () Bool)

(assert (=> b!1052728 (=> (not res!701860) (not e!597743))))

(declare-fun lt!464941 () (_ BitVec 32))

(assert (=> b!1052728 (= res!701860 (not (= lt!464941 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66349 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052728 (= lt!464941 (arrayScanForKey!0 lt!464942 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052729 () Bool)

(declare-fun e!597745 () Bool)

(assert (=> b!1052729 (= e!597745 true)))

(assert (=> b!1052729 (not (= (select (arr!31914 a!3488) lt!464941) k!2747))))

(declare-datatypes ((Unit!34500 0))(
  ( (Unit!34501) )
))
(declare-fun lt!464946 () Unit!34500)

(declare-datatypes ((List!22226 0))(
  ( (Nil!22223) (Cons!22222 (h!23431 (_ BitVec 64)) (t!31533 List!22226)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66349 (_ BitVec 64) (_ BitVec 32) List!22226) Unit!34500)

(assert (=> b!1052729 (= lt!464946 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!464941 Nil!22223))))

(declare-fun lt!464944 () (_ BitVec 32))

(assert (=> b!1052729 (arrayContainsKey!0 a!3488 k!2747 lt!464944)))

(declare-fun lt!464945 () Unit!34500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34500)

(assert (=> b!1052729 (= lt!464945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464944))))

(assert (=> b!1052729 (= lt!464944 (bvadd #b00000000000000000000000000000001 lt!464941))))

(declare-fun arrayNoDuplicates!0 (array!66349 (_ BitVec 32) List!22226) Bool)

(assert (=> b!1052729 (arrayNoDuplicates!0 a!3488 lt!464941 Nil!22223)))

(declare-fun lt!464943 () Unit!34500)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66349 (_ BitVec 32) (_ BitVec 32)) Unit!34500)

(assert (=> b!1052729 (= lt!464943 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464941))))

(declare-fun res!701856 () Bool)

(assert (=> start!92548 (=> (not res!701856) (not e!597747))))

(assert (=> start!92548 (= res!701856 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32450 a!3488)) (bvslt (size!32450 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92548 e!597747))

(assert (=> start!92548 true))

(declare-fun array_inv!24694 (array!66349) Bool)

(assert (=> start!92548 (array_inv!24694 a!3488)))

(declare-fun b!1052730 () Bool)

(declare-fun res!701858 () Bool)

(assert (=> b!1052730 (=> (not res!701858) (not e!597747))))

(assert (=> b!1052730 (= res!701858 (= (select (arr!31914 a!3488) i!1381) k!2747))))

(declare-fun b!1052731 () Bool)

(declare-fun res!701859 () Bool)

(assert (=> b!1052731 (=> (not res!701859) (not e!597747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052731 (= res!701859 (validKeyInArray!0 k!2747))))

(declare-fun b!1052732 () Bool)

(assert (=> b!1052732 (= e!597743 (not e!597745))))

(declare-fun res!701861 () Bool)

(assert (=> b!1052732 (=> res!701861 e!597745)))

(assert (=> b!1052732 (= res!701861 (or (bvsgt lt!464941 i!1381) (bvsle i!1381 lt!464941)))))

(declare-fun e!597748 () Bool)

(assert (=> b!1052732 e!597748))

(declare-fun res!701854 () Bool)

(assert (=> b!1052732 (=> (not res!701854) (not e!597748))))

(assert (=> b!1052732 (= res!701854 (= (select (store (arr!31914 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464941) k!2747))))

(declare-fun e!597746 () Bool)

(declare-fun b!1052733 () Bool)

(assert (=> b!1052733 (= e!597746 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052734 () Bool)

(declare-fun res!701857 () Bool)

(assert (=> b!1052734 (=> (not res!701857) (not e!597747))))

(assert (=> b!1052734 (= res!701857 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22223))))

(declare-fun b!1052735 () Bool)

(assert (=> b!1052735 (= e!597748 e!597746)))

(declare-fun res!701855 () Bool)

(assert (=> b!1052735 (=> res!701855 e!597746)))

(assert (=> b!1052735 (= res!701855 (or (bvsgt lt!464941 i!1381) (bvsle i!1381 lt!464941)))))

(assert (= (and start!92548 res!701856) b!1052734))

(assert (= (and b!1052734 res!701857) b!1052731))

(assert (= (and b!1052731 res!701859) b!1052730))

(assert (= (and b!1052730 res!701858) b!1052727))

(assert (= (and b!1052727 res!701853) b!1052728))

(assert (= (and b!1052728 res!701860) b!1052732))

(assert (= (and b!1052732 res!701854) b!1052735))

(assert (= (and b!1052735 (not res!701855)) b!1052733))

(assert (= (and b!1052732 (not res!701861)) b!1052729))

(declare-fun m!973127 () Bool)

(assert (=> b!1052729 m!973127))

(declare-fun m!973129 () Bool)

(assert (=> b!1052729 m!973129))

(declare-fun m!973131 () Bool)

(assert (=> b!1052729 m!973131))

(declare-fun m!973133 () Bool)

(assert (=> b!1052729 m!973133))

(declare-fun m!973135 () Bool)

(assert (=> b!1052729 m!973135))

(declare-fun m!973137 () Bool)

(assert (=> b!1052729 m!973137))

(declare-fun m!973139 () Bool)

(assert (=> start!92548 m!973139))

(declare-fun m!973141 () Bool)

(assert (=> b!1052734 m!973141))

(declare-fun m!973143 () Bool)

(assert (=> b!1052728 m!973143))

(declare-fun m!973145 () Bool)

(assert (=> b!1052732 m!973145))

(declare-fun m!973147 () Bool)

(assert (=> b!1052732 m!973147))

(declare-fun m!973149 () Bool)

(assert (=> b!1052727 m!973149))

(assert (=> b!1052727 m!973145))

(declare-fun m!973151 () Bool)

(assert (=> b!1052731 m!973151))

(declare-fun m!973153 () Bool)

(assert (=> b!1052733 m!973153))

(declare-fun m!973155 () Bool)

(assert (=> b!1052730 m!973155))

(push 1)

(assert (not b!1052731))

(assert (not b!1052729))

