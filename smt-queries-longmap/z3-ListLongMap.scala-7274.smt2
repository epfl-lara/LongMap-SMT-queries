; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93096 () Bool)

(assert start!93096)

(declare-fun res!704058 () Bool)

(declare-fun e!600025 () Bool)

(assert (=> start!93096 (=> (not res!704058) (not e!600025))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66571 0))(
  ( (array!66572 (arr!32011 (Array (_ BitVec 32) (_ BitVec 64))) (size!32548 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66571)

(assert (=> start!93096 (= res!704058 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32548 a!3488)) (bvslt (size!32548 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93096 e!600025))

(assert (=> start!93096 true))

(declare-fun array_inv!24793 (array!66571) Bool)

(assert (=> start!93096 (array_inv!24793 a!3488)))

(declare-fun b!1055923 () Bool)

(declare-fun e!600029 () Bool)

(declare-fun e!600030 () Bool)

(assert (=> b!1055923 (= e!600029 e!600030)))

(declare-fun res!704063 () Bool)

(assert (=> b!1055923 (=> res!704063 e!600030)))

(declare-fun lt!465994 () (_ BitVec 32))

(assert (=> b!1055923 (= res!704063 (bvsle lt!465994 i!1381))))

(declare-fun b!1055924 () Bool)

(declare-fun e!600027 () Bool)

(assert (=> b!1055924 (= e!600025 e!600027)))

(declare-fun res!704060 () Bool)

(assert (=> b!1055924 (=> (not res!704060) (not e!600027))))

(declare-fun lt!465993 () array!66571)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055924 (= res!704060 (arrayContainsKey!0 lt!465993 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055924 (= lt!465993 (array!66572 (store (arr!32011 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32548 a!3488)))))

(declare-fun b!1055925 () Bool)

(declare-fun res!704059 () Bool)

(assert (=> b!1055925 (=> (not res!704059) (not e!600025))))

(assert (=> b!1055925 (= res!704059 (= (select (arr!32011 a!3488) i!1381) k0!2747))))

(declare-fun b!1055926 () Bool)

(declare-fun e!600031 () Bool)

(declare-fun e!600028 () Bool)

(assert (=> b!1055926 (= e!600031 (not e!600028))))

(declare-fun res!704065 () Bool)

(assert (=> b!1055926 (=> res!704065 e!600028)))

(assert (=> b!1055926 (= res!704065 (bvsle lt!465994 i!1381))))

(assert (=> b!1055926 e!600029))

(declare-fun res!704066 () Bool)

(assert (=> b!1055926 (=> (not res!704066) (not e!600029))))

(assert (=> b!1055926 (= res!704066 (= (select (store (arr!32011 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465994) k0!2747))))

(declare-fun b!1055927 () Bool)

(declare-fun res!704062 () Bool)

(assert (=> b!1055927 (=> (not res!704062) (not e!600025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055927 (= res!704062 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055928 () Bool)

(assert (=> b!1055928 (= e!600027 e!600031)))

(declare-fun res!704061 () Bool)

(assert (=> b!1055928 (=> (not res!704061) (not e!600031))))

(assert (=> b!1055928 (= res!704061 (not (= lt!465994 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66571 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055928 (= lt!465994 (arrayScanForKey!0 lt!465993 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055929 () Bool)

(assert (=> b!1055929 (= e!600028 true)))

(assert (=> b!1055929 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34549 0))(
  ( (Unit!34550) )
))
(declare-fun lt!465992 () Unit!34549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34549)

(assert (=> b!1055929 (= lt!465992 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465994 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22293 0))(
  ( (Nil!22290) (Cons!22289 (h!23507 (_ BitVec 64)) (t!31592 List!22293)) )
))
(declare-fun arrayNoDuplicates!0 (array!66571 (_ BitVec 32) List!22293) Bool)

(assert (=> b!1055929 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22290)))

(declare-fun lt!465995 () Unit!34549)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66571 (_ BitVec 32) (_ BitVec 32)) Unit!34549)

(assert (=> b!1055929 (= lt!465995 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055930 () Bool)

(assert (=> b!1055930 (= e!600030 (arrayContainsKey!0 a!3488 k0!2747 lt!465994))))

(declare-fun b!1055931 () Bool)

(declare-fun res!704064 () Bool)

(assert (=> b!1055931 (=> (not res!704064) (not e!600025))))

(assert (=> b!1055931 (= res!704064 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22290))))

(assert (= (and start!93096 res!704058) b!1055931))

(assert (= (and b!1055931 res!704064) b!1055927))

(assert (= (and b!1055927 res!704062) b!1055925))

(assert (= (and b!1055925 res!704059) b!1055924))

(assert (= (and b!1055924 res!704060) b!1055928))

(assert (= (and b!1055928 res!704061) b!1055926))

(assert (= (and b!1055926 res!704066) b!1055923))

(assert (= (and b!1055923 (not res!704063)) b!1055930))

(assert (= (and b!1055926 (not res!704065)) b!1055929))

(declare-fun m!976325 () Bool)

(assert (=> b!1055930 m!976325))

(declare-fun m!976327 () Bool)

(assert (=> b!1055927 m!976327))

(declare-fun m!976329 () Bool)

(assert (=> start!93096 m!976329))

(declare-fun m!976331 () Bool)

(assert (=> b!1055925 m!976331))

(declare-fun m!976333 () Bool)

(assert (=> b!1055929 m!976333))

(declare-fun m!976335 () Bool)

(assert (=> b!1055929 m!976335))

(declare-fun m!976337 () Bool)

(assert (=> b!1055929 m!976337))

(declare-fun m!976339 () Bool)

(assert (=> b!1055929 m!976339))

(declare-fun m!976341 () Bool)

(assert (=> b!1055928 m!976341))

(declare-fun m!976343 () Bool)

(assert (=> b!1055926 m!976343))

(declare-fun m!976345 () Bool)

(assert (=> b!1055926 m!976345))

(declare-fun m!976347 () Bool)

(assert (=> b!1055924 m!976347))

(assert (=> b!1055924 m!976343))

(declare-fun m!976349 () Bool)

(assert (=> b!1055931 m!976349))

(check-sat (not b!1055931) (not b!1055927) (not b!1055928) (not b!1055929) (not b!1055924) (not start!93096) (not b!1055930))
(check-sat)
