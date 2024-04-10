; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92866 () Bool)

(assert start!92866)

(declare-fun res!703608 () Bool)

(declare-fun e!599228 () Bool)

(assert (=> start!92866 (=> (not res!703608) (not e!599228))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66526 0))(
  ( (array!66527 (arr!31995 (Array (_ BitVec 32) (_ BitVec 64))) (size!32531 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66526)

(assert (=> start!92866 (= res!703608 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32531 a!3488)) (bvslt (size!32531 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92866 e!599228))

(assert (=> start!92866 true))

(declare-fun array_inv!24775 (array!66526) Bool)

(assert (=> start!92866 (array_inv!24775 a!3488)))

(declare-fun b!1054662 () Bool)

(declare-fun e!599226 () Bool)

(declare-fun e!599229 () Bool)

(assert (=> b!1054662 (= e!599226 e!599229)))

(declare-fun res!703602 () Bool)

(assert (=> b!1054662 (=> (not res!703602) (not e!599229))))

(declare-fun lt!465504 () (_ BitVec 32))

(assert (=> b!1054662 (= res!703602 (not (= lt!465504 i!1381)))))

(declare-fun lt!465503 () array!66526)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66526 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054662 (= lt!465504 (arrayScanForKey!0 lt!465503 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054663 () Bool)

(declare-fun e!599230 () Bool)

(declare-fun arrayContainsKey!0 (array!66526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054663 (= e!599230 (arrayContainsKey!0 a!3488 k!2747 lt!465504))))

(declare-fun b!1054664 () Bool)

(declare-fun e!599224 () Bool)

(assert (=> b!1054664 (= e!599229 (not e!599224))))

(declare-fun res!703603 () Bool)

(assert (=> b!1054664 (=> res!703603 e!599224)))

(assert (=> b!1054664 (= res!703603 (bvsle lt!465504 i!1381))))

(declare-fun e!599227 () Bool)

(assert (=> b!1054664 e!599227))

(declare-fun res!703607 () Bool)

(assert (=> b!1054664 (=> (not res!703607) (not e!599227))))

(assert (=> b!1054664 (= res!703607 (= (select (store (arr!31995 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465504) k!2747))))

(declare-fun b!1054665 () Bool)

(assert (=> b!1054665 (= e!599227 e!599230)))

(declare-fun res!703604 () Bool)

(assert (=> b!1054665 (=> res!703604 e!599230)))

(assert (=> b!1054665 (= res!703604 (bvsle lt!465504 i!1381))))

(declare-fun b!1054666 () Bool)

(declare-fun res!703606 () Bool)

(assert (=> b!1054666 (=> (not res!703606) (not e!599228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054666 (= res!703606 (validKeyInArray!0 k!2747))))

(declare-fun b!1054667 () Bool)

(assert (=> b!1054667 (= e!599224 true)))

(assert (=> b!1054667 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34548 0))(
  ( (Unit!34549) )
))
(declare-fun lt!465502 () Unit!34548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34548)

(assert (=> b!1054667 (= lt!465502 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465504 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22307 0))(
  ( (Nil!22304) (Cons!22303 (h!23512 (_ BitVec 64)) (t!31614 List!22307)) )
))
(declare-fun arrayNoDuplicates!0 (array!66526 (_ BitVec 32) List!22307) Bool)

(assert (=> b!1054667 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22304)))

(declare-fun lt!465501 () Unit!34548)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66526 (_ BitVec 32) (_ BitVec 32)) Unit!34548)

(assert (=> b!1054667 (= lt!465501 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054668 () Bool)

(declare-fun res!703609 () Bool)

(assert (=> b!1054668 (=> (not res!703609) (not e!599228))))

(assert (=> b!1054668 (= res!703609 (= (select (arr!31995 a!3488) i!1381) k!2747))))

(declare-fun b!1054669 () Bool)

(declare-fun res!703610 () Bool)

(assert (=> b!1054669 (=> (not res!703610) (not e!599228))))

(assert (=> b!1054669 (= res!703610 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22304))))

(declare-fun b!1054670 () Bool)

(assert (=> b!1054670 (= e!599228 e!599226)))

(declare-fun res!703605 () Bool)

(assert (=> b!1054670 (=> (not res!703605) (not e!599226))))

(assert (=> b!1054670 (= res!703605 (arrayContainsKey!0 lt!465503 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054670 (= lt!465503 (array!66527 (store (arr!31995 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32531 a!3488)))))

(assert (= (and start!92866 res!703608) b!1054669))

(assert (= (and b!1054669 res!703610) b!1054666))

(assert (= (and b!1054666 res!703606) b!1054668))

(assert (= (and b!1054668 res!703609) b!1054670))

(assert (= (and b!1054670 res!703605) b!1054662))

(assert (= (and b!1054662 res!703602) b!1054664))

(assert (= (and b!1054664 res!703607) b!1054665))

(assert (= (and b!1054665 (not res!703604)) b!1054663))

(assert (= (and b!1054664 (not res!703603)) b!1054667))

(declare-fun m!974709 () Bool)

(assert (=> b!1054666 m!974709))

(declare-fun m!974711 () Bool)

(assert (=> start!92866 m!974711))

(declare-fun m!974713 () Bool)

(assert (=> b!1054663 m!974713))

(declare-fun m!974715 () Bool)

(assert (=> b!1054667 m!974715))

(declare-fun m!974717 () Bool)

(assert (=> b!1054667 m!974717))

(declare-fun m!974719 () Bool)

(assert (=> b!1054667 m!974719))

(declare-fun m!974721 () Bool)

(assert (=> b!1054667 m!974721))

(declare-fun m!974723 () Bool)

(assert (=> b!1054670 m!974723))

(declare-fun m!974725 () Bool)

(assert (=> b!1054670 m!974725))

(declare-fun m!974727 () Bool)

(assert (=> b!1054662 m!974727))

(assert (=> b!1054664 m!974725))

(declare-fun m!974729 () Bool)

(assert (=> b!1054664 m!974729))

(declare-fun m!974731 () Bool)

(assert (=> b!1054668 m!974731))

(declare-fun m!974733 () Bool)

(assert (=> b!1054669 m!974733))

(push 1)

