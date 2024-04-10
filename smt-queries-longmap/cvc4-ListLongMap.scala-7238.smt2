; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92494 () Bool)

(assert start!92494)

(declare-fun b!1051833 () Bool)

(declare-fun e!597125 () Bool)

(declare-fun e!597123 () Bool)

(assert (=> b!1051833 (= e!597125 e!597123)))

(declare-fun res!700968 () Bool)

(assert (=> b!1051833 (=> (not res!700968) (not e!597123))))

(declare-datatypes ((array!66295 0))(
  ( (array!66296 (arr!31887 (Array (_ BitVec 32) (_ BitVec 64))) (size!32423 (_ BitVec 32))) )
))
(declare-fun lt!464455 () array!66295)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051833 (= res!700968 (arrayContainsKey!0 lt!464455 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66295)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051833 (= lt!464455 (array!66296 (store (arr!31887 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32423 a!3488)))))

(declare-fun e!597121 () Bool)

(declare-fun b!1051835 () Bool)

(assert (=> b!1051835 (= e!597121 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051836 () Bool)

(declare-fun res!700962 () Bool)

(assert (=> b!1051836 (=> (not res!700962) (not e!597125))))

(assert (=> b!1051836 (= res!700962 (= (select (arr!31887 a!3488) i!1381) k!2747))))

(declare-fun b!1051837 () Bool)

(declare-fun e!597127 () Bool)

(declare-fun e!597120 () Bool)

(assert (=> b!1051837 (= e!597127 e!597120)))

(declare-fun res!700967 () Bool)

(assert (=> b!1051837 (=> res!700967 e!597120)))

(declare-fun lt!464458 () (_ BitVec 32))

(declare-fun lt!464456 () (_ BitVec 32))

(assert (=> b!1051837 (= res!700967 (or (bvslt lt!464458 #b00000000000000000000000000000000) (bvsge lt!464456 (size!32423 a!3488)) (bvsge lt!464458 (size!32423 a!3488))))))

(assert (=> b!1051837 (arrayContainsKey!0 a!3488 k!2747 lt!464456)))

(declare-datatypes ((Unit!34446 0))(
  ( (Unit!34447) )
))
(declare-fun lt!464459 () Unit!34446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34446)

(assert (=> b!1051837 (= lt!464459 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464456))))

(assert (=> b!1051837 (= lt!464456 (bvadd #b00000000000000000000000000000001 lt!464458))))

(declare-datatypes ((List!22199 0))(
  ( (Nil!22196) (Cons!22195 (h!23404 (_ BitVec 64)) (t!31506 List!22199)) )
))
(declare-fun arrayNoDuplicates!0 (array!66295 (_ BitVec 32) List!22199) Bool)

(assert (=> b!1051837 (arrayNoDuplicates!0 a!3488 lt!464458 Nil!22196)))

(declare-fun lt!464457 () Unit!34446)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66295 (_ BitVec 32) (_ BitVec 32)) Unit!34446)

(assert (=> b!1051837 (= lt!464457 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464458))))

(declare-fun b!1051838 () Bool)

(declare-fun e!597122 () Bool)

(assert (=> b!1051838 (= e!597123 e!597122)))

(declare-fun res!700965 () Bool)

(assert (=> b!1051838 (=> (not res!700965) (not e!597122))))

(assert (=> b!1051838 (= res!700965 (not (= lt!464458 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66295 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051838 (= lt!464458 (arrayScanForKey!0 lt!464455 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051839 () Bool)

(declare-fun res!700959 () Bool)

(assert (=> b!1051839 (=> res!700959 e!597120)))

(declare-fun contains!6141 (List!22199 (_ BitVec 64)) Bool)

(assert (=> b!1051839 (= res!700959 (contains!6141 Nil!22196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051840 () Bool)

(declare-fun e!597126 () Bool)

(assert (=> b!1051840 (= e!597126 e!597121)))

(declare-fun res!700969 () Bool)

(assert (=> b!1051840 (=> res!700969 e!597121)))

(assert (=> b!1051840 (= res!700969 (or (bvsgt lt!464458 i!1381) (bvsle i!1381 lt!464458)))))

(declare-fun b!1051841 () Bool)

(assert (=> b!1051841 (= e!597120 true)))

(declare-fun lt!464460 () Bool)

(assert (=> b!1051841 (= lt!464460 (contains!6141 Nil!22196 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051842 () Bool)

(declare-fun res!700961 () Bool)

(assert (=> b!1051842 (=> (not res!700961) (not e!597125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051842 (= res!700961 (validKeyInArray!0 k!2747))))

(declare-fun res!700966 () Bool)

(assert (=> start!92494 (=> (not res!700966) (not e!597125))))

(assert (=> start!92494 (= res!700966 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32423 a!3488)) (bvslt (size!32423 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92494 e!597125))

(assert (=> start!92494 true))

(declare-fun array_inv!24667 (array!66295) Bool)

(assert (=> start!92494 (array_inv!24667 a!3488)))

(declare-fun b!1051834 () Bool)

(assert (=> b!1051834 (= e!597122 (not e!597127))))

(declare-fun res!700960 () Bool)

(assert (=> b!1051834 (=> res!700960 e!597127)))

(assert (=> b!1051834 (= res!700960 (or (bvsgt lt!464458 i!1381) (bvsle i!1381 lt!464458)))))

(assert (=> b!1051834 e!597126))

(declare-fun res!700964 () Bool)

(assert (=> b!1051834 (=> (not res!700964) (not e!597126))))

(assert (=> b!1051834 (= res!700964 (= (select (store (arr!31887 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464458) k!2747))))

(declare-fun b!1051843 () Bool)

(declare-fun res!700970 () Bool)

(assert (=> b!1051843 (=> (not res!700970) (not e!597125))))

(assert (=> b!1051843 (= res!700970 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22196))))

(declare-fun b!1051844 () Bool)

(declare-fun res!700963 () Bool)

(assert (=> b!1051844 (=> res!700963 e!597120)))

(declare-fun noDuplicate!1526 (List!22199) Bool)

(assert (=> b!1051844 (= res!700963 (not (noDuplicate!1526 Nil!22196)))))

(assert (= (and start!92494 res!700966) b!1051843))

(assert (= (and b!1051843 res!700970) b!1051842))

(assert (= (and b!1051842 res!700961) b!1051836))

(assert (= (and b!1051836 res!700962) b!1051833))

(assert (= (and b!1051833 res!700968) b!1051838))

(assert (= (and b!1051838 res!700965) b!1051834))

(assert (= (and b!1051834 res!700964) b!1051840))

(assert (= (and b!1051840 (not res!700969)) b!1051835))

(assert (= (and b!1051834 (not res!700960)) b!1051837))

(assert (= (and b!1051837 (not res!700967)) b!1051844))

(assert (= (and b!1051844 (not res!700963)) b!1051839))

(assert (= (and b!1051839 (not res!700959)) b!1051841))

(declare-fun m!972279 () Bool)

(assert (=> b!1051838 m!972279))

(declare-fun m!972281 () Bool)

(assert (=> b!1051834 m!972281))

(declare-fun m!972283 () Bool)

(assert (=> b!1051834 m!972283))

(declare-fun m!972285 () Bool)

(assert (=> b!1051843 m!972285))

(declare-fun m!972287 () Bool)

(assert (=> b!1051839 m!972287))

(declare-fun m!972289 () Bool)

(assert (=> b!1051837 m!972289))

(declare-fun m!972291 () Bool)

(assert (=> b!1051837 m!972291))

(declare-fun m!972293 () Bool)

(assert (=> b!1051837 m!972293))

(declare-fun m!972295 () Bool)

(assert (=> b!1051837 m!972295))

(declare-fun m!972297 () Bool)

(assert (=> b!1051836 m!972297))

(declare-fun m!972299 () Bool)

(assert (=> b!1051833 m!972299))

(assert (=> b!1051833 m!972281))

(declare-fun m!972301 () Bool)

(assert (=> b!1051835 m!972301))

(declare-fun m!972303 () Bool)

(assert (=> b!1051842 m!972303))

(declare-fun m!972305 () Bool)

(assert (=> b!1051844 m!972305))

(declare-fun m!972307 () Bool)

(assert (=> start!92494 m!972307))

(declare-fun m!972309 () Bool)

(assert (=> b!1051841 m!972309))

(push 1)

(assert (not b!1051833))

(assert (not b!1051838))

