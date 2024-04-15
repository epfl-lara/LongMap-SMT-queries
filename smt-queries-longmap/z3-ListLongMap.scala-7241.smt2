; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92506 () Bool)

(assert start!92506)

(declare-fun b!1051934 () Bool)

(declare-fun e!597202 () Bool)

(declare-fun e!597204 () Bool)

(assert (=> b!1051934 (= e!597202 (not e!597204))))

(declare-fun res!701154 () Bool)

(assert (=> b!1051934 (=> res!701154 e!597204)))

(declare-fun lt!464386 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051934 (= res!701154 (or (bvsgt lt!464386 i!1381) (bvsle i!1381 lt!464386)))))

(declare-fun e!597201 () Bool)

(assert (=> b!1051934 e!597201))

(declare-fun res!701151 () Bool)

(assert (=> b!1051934 (=> (not res!701151) (not e!597201))))

(declare-datatypes ((array!66248 0))(
  ( (array!66249 (arr!31863 (Array (_ BitVec 32) (_ BitVec 64))) (size!32401 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66248)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1051934 (= res!701151 (= (select (store (arr!31863 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464386) k0!2747))))

(declare-fun b!1051935 () Bool)

(declare-fun e!597199 () Bool)

(declare-fun e!597198 () Bool)

(assert (=> b!1051935 (= e!597199 e!597198)))

(declare-fun res!701149 () Bool)

(assert (=> b!1051935 (=> (not res!701149) (not e!597198))))

(declare-fun lt!464384 () array!66248)

(declare-fun arrayContainsKey!0 (array!66248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051935 (= res!701149 (arrayContainsKey!0 lt!464384 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051935 (= lt!464384 (array!66249 (store (arr!31863 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32401 a!3488)))))

(declare-fun b!1051936 () Bool)

(declare-fun res!701150 () Bool)

(assert (=> b!1051936 (=> (not res!701150) (not e!597199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051936 (= res!701150 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051937 () Bool)

(declare-fun res!701148 () Bool)

(assert (=> b!1051937 (=> (not res!701148) (not e!597199))))

(assert (=> b!1051937 (= res!701148 (= (select (arr!31863 a!3488) i!1381) k0!2747))))

(declare-fun e!597203 () Bool)

(declare-fun b!1051938 () Bool)

(assert (=> b!1051938 (= e!597203 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051939 () Bool)

(declare-fun res!701145 () Bool)

(declare-fun e!597197 () Bool)

(assert (=> b!1051939 (=> res!701145 e!597197)))

(declare-datatypes ((List!22234 0))(
  ( (Nil!22231) (Cons!22230 (h!23439 (_ BitVec 64)) (t!31532 List!22234)) )
))
(declare-fun contains!6121 (List!22234 (_ BitVec 64)) Bool)

(assert (=> b!1051939 (= res!701145 (contains!6121 Nil!22231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051940 () Bool)

(assert (=> b!1051940 (= e!597204 e!597197)))

(declare-fun res!701146 () Bool)

(assert (=> b!1051940 (=> res!701146 e!597197)))

(declare-fun lt!464382 () (_ BitVec 32))

(assert (=> b!1051940 (= res!701146 (or (bvslt lt!464386 #b00000000000000000000000000000000) (bvsge lt!464382 (size!32401 a!3488)) (bvsge lt!464386 (size!32401 a!3488))))))

(assert (=> b!1051940 (arrayContainsKey!0 a!3488 k0!2747 lt!464382)))

(declare-datatypes ((Unit!34331 0))(
  ( (Unit!34332) )
))
(declare-fun lt!464385 () Unit!34331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34331)

(assert (=> b!1051940 (= lt!464385 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464382))))

(assert (=> b!1051940 (= lt!464382 (bvadd #b00000000000000000000000000000001 lt!464386))))

(declare-fun arrayNoDuplicates!0 (array!66248 (_ BitVec 32) List!22234) Bool)

(assert (=> b!1051940 (arrayNoDuplicates!0 a!3488 lt!464386 Nil!22231)))

(declare-fun lt!464383 () Unit!34331)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66248 (_ BitVec 32) (_ BitVec 32)) Unit!34331)

(assert (=> b!1051940 (= lt!464383 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464386))))

(declare-fun b!1051941 () Bool)

(declare-fun res!701153 () Bool)

(assert (=> b!1051941 (=> (not res!701153) (not e!597199))))

(assert (=> b!1051941 (= res!701153 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22231))))

(declare-fun b!1051943 () Bool)

(declare-fun res!701155 () Bool)

(assert (=> b!1051943 (=> res!701155 e!597197)))

(declare-fun noDuplicate!1546 (List!22234) Bool)

(assert (=> b!1051943 (= res!701155 (not (noDuplicate!1546 Nil!22231)))))

(declare-fun b!1051944 () Bool)

(assert (=> b!1051944 (= e!597197 true)))

(declare-fun lt!464381 () Bool)

(assert (=> b!1051944 (= lt!464381 (contains!6121 Nil!22231 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051945 () Bool)

(assert (=> b!1051945 (= e!597201 e!597203)))

(declare-fun res!701144 () Bool)

(assert (=> b!1051945 (=> res!701144 e!597203)))

(assert (=> b!1051945 (= res!701144 (or (bvsgt lt!464386 i!1381) (bvsle i!1381 lt!464386)))))

(declare-fun b!1051942 () Bool)

(assert (=> b!1051942 (= e!597198 e!597202)))

(declare-fun res!701152 () Bool)

(assert (=> b!1051942 (=> (not res!701152) (not e!597202))))

(assert (=> b!1051942 (= res!701152 (not (= lt!464386 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66248 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051942 (= lt!464386 (arrayScanForKey!0 lt!464384 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!701147 () Bool)

(assert (=> start!92506 (=> (not res!701147) (not e!597199))))

(assert (=> start!92506 (= res!701147 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32401 a!3488)) (bvslt (size!32401 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92506 e!597199))

(assert (=> start!92506 true))

(declare-fun array_inv!24646 (array!66248) Bool)

(assert (=> start!92506 (array_inv!24646 a!3488)))

(assert (= (and start!92506 res!701147) b!1051941))

(assert (= (and b!1051941 res!701153) b!1051936))

(assert (= (and b!1051936 res!701150) b!1051937))

(assert (= (and b!1051937 res!701148) b!1051935))

(assert (= (and b!1051935 res!701149) b!1051942))

(assert (= (and b!1051942 res!701152) b!1051934))

(assert (= (and b!1051934 res!701151) b!1051945))

(assert (= (and b!1051945 (not res!701144)) b!1051938))

(assert (= (and b!1051934 (not res!701154)) b!1051940))

(assert (= (and b!1051940 (not res!701146)) b!1051943))

(assert (= (and b!1051943 (not res!701155)) b!1051939))

(assert (= (and b!1051939 (not res!701145)) b!1051944))

(declare-fun m!971887 () Bool)

(assert (=> b!1051943 m!971887))

(declare-fun m!971889 () Bool)

(assert (=> b!1051936 m!971889))

(declare-fun m!971891 () Bool)

(assert (=> b!1051944 m!971891))

(declare-fun m!971893 () Bool)

(assert (=> b!1051937 m!971893))

(declare-fun m!971895 () Bool)

(assert (=> b!1051940 m!971895))

(declare-fun m!971897 () Bool)

(assert (=> b!1051940 m!971897))

(declare-fun m!971899 () Bool)

(assert (=> b!1051940 m!971899))

(declare-fun m!971901 () Bool)

(assert (=> b!1051940 m!971901))

(declare-fun m!971903 () Bool)

(assert (=> b!1051942 m!971903))

(declare-fun m!971905 () Bool)

(assert (=> start!92506 m!971905))

(declare-fun m!971907 () Bool)

(assert (=> b!1051935 m!971907))

(declare-fun m!971909 () Bool)

(assert (=> b!1051935 m!971909))

(declare-fun m!971911 () Bool)

(assert (=> b!1051939 m!971911))

(declare-fun m!971913 () Bool)

(assert (=> b!1051941 m!971913))

(declare-fun m!971915 () Bool)

(assert (=> b!1051938 m!971915))

(assert (=> b!1051934 m!971909))

(declare-fun m!971917 () Bool)

(assert (=> b!1051934 m!971917))

(check-sat (not b!1051943) (not start!92506) (not b!1051941) (not b!1051940) (not b!1051938) (not b!1051944) (not b!1051939) (not b!1051942) (not b!1051936) (not b!1051935))
(check-sat)
