; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27308 () Bool)

(assert start!27308)

(declare-fun b!282813 () Bool)

(declare-fun e!179446 () Bool)

(declare-fun e!179444 () Bool)

(assert (=> b!282813 (= e!179446 (not e!179444))))

(declare-fun res!145937 () Bool)

(assert (=> b!282813 (=> res!145937 e!179444)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14115 0))(
  ( (array!14116 (arr!6699 (Array (_ BitVec 32) (_ BitVec 64))) (size!7052 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14115)

(assert (=> b!282813 (= res!145937 (or (bvsge startIndex!26 (bvsub (size!7052 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14115 (_ BitVec 32)) Bool)

(assert (=> b!282813 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8958 0))(
  ( (Unit!8959) )
))
(declare-fun lt!139657 () Unit!8958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282813 (= lt!139657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139659 () array!14115)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1856 0))(
  ( (MissingZero!1856 (index!9594 (_ BitVec 32))) (Found!1856 (index!9595 (_ BitVec 32))) (Intermediate!1856 (undefined!2668 Bool) (index!9596 (_ BitVec 32)) (x!27821 (_ BitVec 32))) (Undefined!1856) (MissingVacant!1856 (index!9597 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14115 (_ BitVec 32)) SeekEntryResult!1856)

(assert (=> b!282813 (= (seekEntryOrOpen!0 (select (arr!6699 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6699 a!3325) i!1267 k0!2581) startIndex!26) lt!139659 mask!3868))))

(declare-fun lt!139654 () Unit!8958)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282813 (= lt!139654 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4480 0))(
  ( (Nil!4477) (Cons!4476 (h!5146 (_ BitVec 64)) (t!9553 List!4480)) )
))
(declare-fun arrayNoDuplicates!0 (array!14115 (_ BitVec 32) List!4480) Bool)

(assert (=> b!282813 (arrayNoDuplicates!0 lt!139659 #b00000000000000000000000000000000 Nil!4477)))

(declare-fun lt!139658 () Unit!8958)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4480) Unit!8958)

(assert (=> b!282813 (= lt!139658 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4477))))

(declare-fun b!282814 () Bool)

(declare-fun res!145936 () Bool)

(declare-fun e!179447 () Bool)

(assert (=> b!282814 (=> (not res!145936) (not e!179447))))

(assert (=> b!282814 (= res!145936 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4477))))

(declare-fun b!282815 () Bool)

(declare-fun res!145942 () Bool)

(assert (=> b!282815 (=> (not res!145942) (not e!179446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282815 (= res!145942 (validKeyInArray!0 (select (arr!6699 a!3325) startIndex!26)))))

(declare-fun b!282816 () Bool)

(declare-fun res!145934 () Bool)

(assert (=> b!282816 (=> (not res!145934) (not e!179447))))

(assert (=> b!282816 (= res!145934 (and (= (size!7052 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7052 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7052 a!3325))))))

(declare-fun b!282817 () Bool)

(declare-fun res!145939 () Bool)

(assert (=> b!282817 (=> (not res!145939) (not e!179447))))

(assert (=> b!282817 (= res!145939 (validKeyInArray!0 k0!2581))))

(declare-fun b!282818 () Bool)

(declare-fun e!179448 () Bool)

(assert (=> b!282818 (= e!179447 e!179448)))

(declare-fun res!145940 () Bool)

(assert (=> b!282818 (=> (not res!145940) (not e!179448))))

(declare-fun lt!139656 () SeekEntryResult!1856)

(assert (=> b!282818 (= res!145940 (or (= lt!139656 (MissingZero!1856 i!1267)) (= lt!139656 (MissingVacant!1856 i!1267))))))

(assert (=> b!282818 (= lt!139656 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282819 () Bool)

(declare-fun res!145938 () Bool)

(assert (=> b!282819 (=> (not res!145938) (not e!179448))))

(assert (=> b!282819 (= res!145938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!145935 () Bool)

(assert (=> start!27308 (=> (not res!145935) (not e!179447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27308 (= res!145935 (validMask!0 mask!3868))))

(assert (=> start!27308 e!179447))

(declare-fun array_inv!4671 (array!14115) Bool)

(assert (=> start!27308 (array_inv!4671 a!3325)))

(assert (=> start!27308 true))

(declare-fun b!282812 () Bool)

(assert (=> b!282812 (= e!179448 e!179446)))

(declare-fun res!145941 () Bool)

(assert (=> b!282812 (=> (not res!145941) (not e!179446))))

(assert (=> b!282812 (= res!145941 (not (= startIndex!26 i!1267)))))

(assert (=> b!282812 (= lt!139659 (array!14116 (store (arr!6699 a!3325) i!1267 k0!2581) (size!7052 a!3325)))))

(declare-fun b!282820 () Bool)

(declare-fun res!145933 () Bool)

(assert (=> b!282820 (=> (not res!145933) (not e!179447))))

(declare-fun arrayContainsKey!0 (array!14115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282820 (= res!145933 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282821 () Bool)

(assert (=> b!282821 (= e!179444 true)))

(assert (=> b!282821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139659 mask!3868)))

(declare-fun lt!139655 () Unit!8958)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282821 (= lt!139655 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (= (and start!27308 res!145935) b!282816))

(assert (= (and b!282816 res!145934) b!282817))

(assert (= (and b!282817 res!145939) b!282814))

(assert (= (and b!282814 res!145936) b!282820))

(assert (= (and b!282820 res!145933) b!282818))

(assert (= (and b!282818 res!145940) b!282819))

(assert (= (and b!282819 res!145938) b!282812))

(assert (= (and b!282812 res!145941) b!282815))

(assert (= (and b!282815 res!145942) b!282813))

(assert (= (and b!282813 (not res!145937)) b!282821))

(declare-fun m!297107 () Bool)

(assert (=> b!282821 m!297107))

(declare-fun m!297109 () Bool)

(assert (=> b!282821 m!297109))

(declare-fun m!297111 () Bool)

(assert (=> start!27308 m!297111))

(declare-fun m!297113 () Bool)

(assert (=> start!27308 m!297113))

(declare-fun m!297115 () Bool)

(assert (=> b!282815 m!297115))

(assert (=> b!282815 m!297115))

(declare-fun m!297117 () Bool)

(assert (=> b!282815 m!297117))

(declare-fun m!297119 () Bool)

(assert (=> b!282814 m!297119))

(declare-fun m!297121 () Bool)

(assert (=> b!282820 m!297121))

(declare-fun m!297123 () Bool)

(assert (=> b!282818 m!297123))

(declare-fun m!297125 () Bool)

(assert (=> b!282819 m!297125))

(declare-fun m!297127 () Bool)

(assert (=> b!282812 m!297127))

(declare-fun m!297129 () Bool)

(assert (=> b!282817 m!297129))

(declare-fun m!297131 () Bool)

(assert (=> b!282813 m!297131))

(declare-fun m!297133 () Bool)

(assert (=> b!282813 m!297133))

(assert (=> b!282813 m!297127))

(declare-fun m!297135 () Bool)

(assert (=> b!282813 m!297135))

(assert (=> b!282813 m!297115))

(declare-fun m!297137 () Bool)

(assert (=> b!282813 m!297137))

(declare-fun m!297139 () Bool)

(assert (=> b!282813 m!297139))

(assert (=> b!282813 m!297115))

(declare-fun m!297141 () Bool)

(assert (=> b!282813 m!297141))

(assert (=> b!282813 m!297133))

(declare-fun m!297143 () Bool)

(assert (=> b!282813 m!297143))

(declare-fun m!297145 () Bool)

(assert (=> b!282813 m!297145))

(check-sat (not b!282814) (not b!282815) (not b!282820) (not b!282821) (not b!282813) (not start!27308) (not b!282819) (not b!282817) (not b!282818))
(check-sat)
