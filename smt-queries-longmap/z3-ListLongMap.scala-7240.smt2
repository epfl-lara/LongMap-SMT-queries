; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92500 () Bool)

(assert start!92500)

(declare-fun b!1051826 () Bool)

(declare-fun res!701043 () Bool)

(declare-fun e!597130 () Bool)

(assert (=> b!1051826 (=> (not res!701043) (not e!597130))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051826 (= res!701043 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051827 () Bool)

(declare-datatypes ((array!66242 0))(
  ( (array!66243 (arr!31860 (Array (_ BitVec 32) (_ BitVec 64))) (size!32398 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66242)

(declare-fun e!597127 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051827 (= e!597127 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051828 () Bool)

(declare-fun res!701037 () Bool)

(assert (=> b!1051828 (=> (not res!701037) (not e!597130))))

(declare-datatypes ((List!22231 0))(
  ( (Nil!22228) (Cons!22227 (h!23436 (_ BitVec 64)) (t!31529 List!22231)) )
))
(declare-fun arrayNoDuplicates!0 (array!66242 (_ BitVec 32) List!22231) Bool)

(assert (=> b!1051828 (= res!701037 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22228))))

(declare-fun b!1051829 () Bool)

(declare-fun res!701046 () Bool)

(declare-fun e!597125 () Bool)

(assert (=> b!1051829 (=> res!701046 e!597125)))

(declare-fun noDuplicate!1543 (List!22231) Bool)

(assert (=> b!1051829 (= res!701046 (not (noDuplicate!1543 Nil!22228)))))

(declare-fun b!1051830 () Bool)

(declare-fun res!701039 () Bool)

(assert (=> b!1051830 (=> (not res!701039) (not e!597130))))

(assert (=> b!1051830 (= res!701039 (= (select (arr!31860 a!3488) i!1381) k0!2747))))

(declare-fun b!1051831 () Bool)

(assert (=> b!1051831 (= e!597125 true)))

(declare-fun lt!464328 () Bool)

(declare-fun contains!6118 (List!22231 (_ BitVec 64)) Bool)

(assert (=> b!1051831 (= lt!464328 (contains!6118 Nil!22228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!701047 () Bool)

(assert (=> start!92500 (=> (not res!701047) (not e!597130))))

(assert (=> start!92500 (= res!701047 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32398 a!3488)) (bvslt (size!32398 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92500 e!597130))

(assert (=> start!92500 true))

(declare-fun array_inv!24643 (array!66242) Bool)

(assert (=> start!92500 (array_inv!24643 a!3488)))

(declare-fun b!1051832 () Bool)

(declare-fun e!597131 () Bool)

(assert (=> b!1051832 (= e!597131 e!597125)))

(declare-fun res!701044 () Bool)

(assert (=> b!1051832 (=> res!701044 e!597125)))

(declare-fun lt!464332 () (_ BitVec 32))

(declare-fun lt!464330 () (_ BitVec 32))

(assert (=> b!1051832 (= res!701044 (or (bvslt lt!464332 #b00000000000000000000000000000000) (bvsge lt!464330 (size!32398 a!3488)) (bvsge lt!464332 (size!32398 a!3488))))))

(assert (=> b!1051832 (arrayContainsKey!0 a!3488 k0!2747 lt!464330)))

(declare-datatypes ((Unit!34325 0))(
  ( (Unit!34326) )
))
(declare-fun lt!464327 () Unit!34325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34325)

(assert (=> b!1051832 (= lt!464327 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464330))))

(assert (=> b!1051832 (= lt!464330 (bvadd #b00000000000000000000000000000001 lt!464332))))

(assert (=> b!1051832 (arrayNoDuplicates!0 a!3488 lt!464332 Nil!22228)))

(declare-fun lt!464331 () Unit!34325)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66242 (_ BitVec 32) (_ BitVec 32)) Unit!34325)

(assert (=> b!1051832 (= lt!464331 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464332))))

(declare-fun b!1051833 () Bool)

(declare-fun e!597129 () Bool)

(assert (=> b!1051833 (= e!597129 (not e!597131))))

(declare-fun res!701040 () Bool)

(assert (=> b!1051833 (=> res!701040 e!597131)))

(assert (=> b!1051833 (= res!701040 (or (bvsgt lt!464332 i!1381) (bvsle i!1381 lt!464332)))))

(declare-fun e!597128 () Bool)

(assert (=> b!1051833 e!597128))

(declare-fun res!701041 () Bool)

(assert (=> b!1051833 (=> (not res!701041) (not e!597128))))

(assert (=> b!1051833 (= res!701041 (= (select (store (arr!31860 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464332) k0!2747))))

(declare-fun b!1051834 () Bool)

(assert (=> b!1051834 (= e!597128 e!597127)))

(declare-fun res!701045 () Bool)

(assert (=> b!1051834 (=> res!701045 e!597127)))

(assert (=> b!1051834 (= res!701045 (or (bvsgt lt!464332 i!1381) (bvsle i!1381 lt!464332)))))

(declare-fun b!1051835 () Bool)

(declare-fun e!597126 () Bool)

(assert (=> b!1051835 (= e!597126 e!597129)))

(declare-fun res!701038 () Bool)

(assert (=> b!1051835 (=> (not res!701038) (not e!597129))))

(assert (=> b!1051835 (= res!701038 (not (= lt!464332 i!1381)))))

(declare-fun lt!464329 () array!66242)

(declare-fun arrayScanForKey!0 (array!66242 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051835 (= lt!464332 (arrayScanForKey!0 lt!464329 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051836 () Bool)

(declare-fun res!701042 () Bool)

(assert (=> b!1051836 (=> res!701042 e!597125)))

(assert (=> b!1051836 (= res!701042 (contains!6118 Nil!22228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051837 () Bool)

(assert (=> b!1051837 (= e!597130 e!597126)))

(declare-fun res!701036 () Bool)

(assert (=> b!1051837 (=> (not res!701036) (not e!597126))))

(assert (=> b!1051837 (= res!701036 (arrayContainsKey!0 lt!464329 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051837 (= lt!464329 (array!66243 (store (arr!31860 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32398 a!3488)))))

(assert (= (and start!92500 res!701047) b!1051828))

(assert (= (and b!1051828 res!701037) b!1051826))

(assert (= (and b!1051826 res!701043) b!1051830))

(assert (= (and b!1051830 res!701039) b!1051837))

(assert (= (and b!1051837 res!701036) b!1051835))

(assert (= (and b!1051835 res!701038) b!1051833))

(assert (= (and b!1051833 res!701041) b!1051834))

(assert (= (and b!1051834 (not res!701045)) b!1051827))

(assert (= (and b!1051833 (not res!701040)) b!1051832))

(assert (= (and b!1051832 (not res!701044)) b!1051829))

(assert (= (and b!1051829 (not res!701046)) b!1051836))

(assert (= (and b!1051836 (not res!701042)) b!1051831))

(declare-fun m!971791 () Bool)

(assert (=> b!1051831 m!971791))

(declare-fun m!971793 () Bool)

(assert (=> b!1051833 m!971793))

(declare-fun m!971795 () Bool)

(assert (=> b!1051833 m!971795))

(declare-fun m!971797 () Bool)

(assert (=> b!1051827 m!971797))

(declare-fun m!971799 () Bool)

(assert (=> b!1051837 m!971799))

(assert (=> b!1051837 m!971793))

(declare-fun m!971801 () Bool)

(assert (=> b!1051828 m!971801))

(declare-fun m!971803 () Bool)

(assert (=> b!1051829 m!971803))

(declare-fun m!971805 () Bool)

(assert (=> b!1051830 m!971805))

(declare-fun m!971807 () Bool)

(assert (=> b!1051836 m!971807))

(declare-fun m!971809 () Bool)

(assert (=> b!1051826 m!971809))

(declare-fun m!971811 () Bool)

(assert (=> b!1051835 m!971811))

(declare-fun m!971813 () Bool)

(assert (=> b!1051832 m!971813))

(declare-fun m!971815 () Bool)

(assert (=> b!1051832 m!971815))

(declare-fun m!971817 () Bool)

(assert (=> b!1051832 m!971817))

(declare-fun m!971819 () Bool)

(assert (=> b!1051832 m!971819))

(declare-fun m!971821 () Bool)

(assert (=> start!92500 m!971821))

(check-sat (not b!1051832) (not b!1051827) (not start!92500) (not b!1051836) (not b!1051826) (not b!1051835) (not b!1051829) (not b!1051837) (not b!1051831) (not b!1051828))
(check-sat)
