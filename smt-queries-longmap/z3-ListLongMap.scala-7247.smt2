; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92546 () Bool)

(assert start!92546)

(declare-fun b!1052700 () Bool)

(declare-fun e!597722 () Bool)

(declare-fun e!597723 () Bool)

(assert (=> b!1052700 (= e!597722 e!597723)))

(declare-fun res!701829 () Bool)

(assert (=> b!1052700 (=> res!701829 e!597723)))

(declare-fun lt!464923 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052700 (= res!701829 (or (bvsgt lt!464923 i!1381) (bvsle i!1381 lt!464923)))))

(declare-fun b!1052701 () Bool)

(declare-fun res!701826 () Bool)

(declare-fun e!597725 () Bool)

(assert (=> b!1052701 (=> (not res!701826) (not e!597725))))

(declare-datatypes ((array!66347 0))(
  ( (array!66348 (arr!31913 (Array (_ BitVec 32) (_ BitVec 64))) (size!32449 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66347)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052701 (= res!701826 (= (select (arr!31913 a!3488) i!1381) k0!2747))))

(declare-fun b!1052702 () Bool)

(declare-fun e!597724 () Bool)

(assert (=> b!1052702 (= e!597725 e!597724)))

(declare-fun res!701832 () Bool)

(assert (=> b!1052702 (=> (not res!701832) (not e!597724))))

(declare-fun lt!464924 () array!66347)

(declare-fun arrayContainsKey!0 (array!66347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052702 (= res!701832 (arrayContainsKey!0 lt!464924 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052702 (= lt!464924 (array!66348 (store (arr!31913 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32449 a!3488)))))

(declare-fun b!1052703 () Bool)

(declare-fun e!597727 () Bool)

(assert (=> b!1052703 (= e!597727 true)))

(assert (=> b!1052703 (not (= (select (arr!31913 a!3488) lt!464923) k0!2747))))

(declare-datatypes ((Unit!34498 0))(
  ( (Unit!34499) )
))
(declare-fun lt!464926 () Unit!34498)

(declare-datatypes ((List!22225 0))(
  ( (Nil!22222) (Cons!22221 (h!23430 (_ BitVec 64)) (t!31532 List!22225)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66347 (_ BitVec 64) (_ BitVec 32) List!22225) Unit!34498)

(assert (=> b!1052703 (= lt!464926 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!464923 Nil!22222))))

(declare-fun lt!464928 () (_ BitVec 32))

(assert (=> b!1052703 (arrayContainsKey!0 a!3488 k0!2747 lt!464928)))

(declare-fun lt!464927 () Unit!34498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34498)

(assert (=> b!1052703 (= lt!464927 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464928))))

(assert (=> b!1052703 (= lt!464928 (bvadd #b00000000000000000000000000000001 lt!464923))))

(declare-fun arrayNoDuplicates!0 (array!66347 (_ BitVec 32) List!22225) Bool)

(assert (=> b!1052703 (arrayNoDuplicates!0 a!3488 lt!464923 Nil!22222)))

(declare-fun lt!464925 () Unit!34498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66347 (_ BitVec 32) (_ BitVec 32)) Unit!34498)

(assert (=> b!1052703 (= lt!464925 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464923))))

(declare-fun b!1052704 () Bool)

(assert (=> b!1052704 (= e!597723 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052705 () Bool)

(declare-fun res!701833 () Bool)

(assert (=> b!1052705 (=> (not res!701833) (not e!597725))))

(assert (=> b!1052705 (= res!701833 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22222))))

(declare-fun b!1052706 () Bool)

(declare-fun e!597726 () Bool)

(assert (=> b!1052706 (= e!597726 (not e!597727))))

(declare-fun res!701827 () Bool)

(assert (=> b!1052706 (=> res!701827 e!597727)))

(assert (=> b!1052706 (= res!701827 (or (bvsgt lt!464923 i!1381) (bvsle i!1381 lt!464923)))))

(assert (=> b!1052706 e!597722))

(declare-fun res!701828 () Bool)

(assert (=> b!1052706 (=> (not res!701828) (not e!597722))))

(assert (=> b!1052706 (= res!701828 (= (select (store (arr!31913 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464923) k0!2747))))

(declare-fun b!1052707 () Bool)

(assert (=> b!1052707 (= e!597724 e!597726)))

(declare-fun res!701834 () Bool)

(assert (=> b!1052707 (=> (not res!701834) (not e!597726))))

(assert (=> b!1052707 (= res!701834 (not (= lt!464923 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66347 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052707 (= lt!464923 (arrayScanForKey!0 lt!464924 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!701830 () Bool)

(assert (=> start!92546 (=> (not res!701830) (not e!597725))))

(assert (=> start!92546 (= res!701830 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32449 a!3488)) (bvslt (size!32449 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92546 e!597725))

(assert (=> start!92546 true))

(declare-fun array_inv!24693 (array!66347) Bool)

(assert (=> start!92546 (array_inv!24693 a!3488)))

(declare-fun b!1052708 () Bool)

(declare-fun res!701831 () Bool)

(assert (=> b!1052708 (=> (not res!701831) (not e!597725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052708 (= res!701831 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92546 res!701830) b!1052705))

(assert (= (and b!1052705 res!701833) b!1052708))

(assert (= (and b!1052708 res!701831) b!1052701))

(assert (= (and b!1052701 res!701826) b!1052702))

(assert (= (and b!1052702 res!701832) b!1052707))

(assert (= (and b!1052707 res!701834) b!1052706))

(assert (= (and b!1052706 res!701828) b!1052700))

(assert (= (and b!1052700 (not res!701829)) b!1052704))

(assert (= (and b!1052706 (not res!701827)) b!1052703))

(declare-fun m!973097 () Bool)

(assert (=> b!1052708 m!973097))

(declare-fun m!973099 () Bool)

(assert (=> b!1052704 m!973099))

(declare-fun m!973101 () Bool)

(assert (=> b!1052703 m!973101))

(declare-fun m!973103 () Bool)

(assert (=> b!1052703 m!973103))

(declare-fun m!973105 () Bool)

(assert (=> b!1052703 m!973105))

(declare-fun m!973107 () Bool)

(assert (=> b!1052703 m!973107))

(declare-fun m!973109 () Bool)

(assert (=> b!1052703 m!973109))

(declare-fun m!973111 () Bool)

(assert (=> b!1052703 m!973111))

(declare-fun m!973113 () Bool)

(assert (=> b!1052705 m!973113))

(declare-fun m!973115 () Bool)

(assert (=> b!1052702 m!973115))

(declare-fun m!973117 () Bool)

(assert (=> b!1052702 m!973117))

(assert (=> b!1052706 m!973117))

(declare-fun m!973119 () Bool)

(assert (=> b!1052706 m!973119))

(declare-fun m!973121 () Bool)

(assert (=> b!1052701 m!973121))

(declare-fun m!973123 () Bool)

(assert (=> b!1052707 m!973123))

(declare-fun m!973125 () Bool)

(assert (=> start!92546 m!973125))

(check-sat (not b!1052708) (not b!1052707) (not b!1052703) (not b!1052705) (not b!1052704) (not start!92546) (not b!1052702))
(check-sat)
