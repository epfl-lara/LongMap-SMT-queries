; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92924 () Bool)

(assert start!92924)

(declare-fun b!1054986 () Bool)

(declare-fun e!599484 () Bool)

(assert (=> b!1054986 (= e!599484 true)))

(declare-datatypes ((array!66545 0))(
  ( (array!66546 (arr!32003 (Array (_ BitVec 32) (_ BitVec 64))) (size!32539 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66545)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054986 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465624 () (_ BitVec 32))

(declare-datatypes ((Unit!34564 0))(
  ( (Unit!34565) )
))
(declare-fun lt!465627 () Unit!34564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66545 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34564)

(assert (=> b!1054986 (= lt!465627 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465624 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22315 0))(
  ( (Nil!22312) (Cons!22311 (h!23520 (_ BitVec 64)) (t!31622 List!22315)) )
))
(declare-fun arrayNoDuplicates!0 (array!66545 (_ BitVec 32) List!22315) Bool)

(assert (=> b!1054986 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22312)))

(declare-fun lt!465626 () Unit!34564)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66545 (_ BitVec 32) (_ BitVec 32)) Unit!34564)

(assert (=> b!1054986 (= lt!465626 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054987 () Bool)

(declare-fun res!703890 () Bool)

(declare-fun e!599483 () Bool)

(assert (=> b!1054987 (=> (not res!703890) (not e!599483))))

(assert (=> b!1054987 (= res!703890 (= (select (arr!32003 a!3488) i!1381) k0!2747))))

(declare-fun b!1054988 () Bool)

(declare-fun e!599481 () Bool)

(declare-fun e!599480 () Bool)

(assert (=> b!1054988 (= e!599481 e!599480)))

(declare-fun res!703887 () Bool)

(assert (=> b!1054988 (=> res!703887 e!599480)))

(assert (=> b!1054988 (= res!703887 (bvsle lt!465624 i!1381))))

(declare-fun b!1054990 () Bool)

(declare-fun e!599485 () Bool)

(assert (=> b!1054990 (= e!599485 (not e!599484))))

(declare-fun res!703891 () Bool)

(assert (=> b!1054990 (=> res!703891 e!599484)))

(assert (=> b!1054990 (= res!703891 (bvsle lt!465624 i!1381))))

(assert (=> b!1054990 e!599481))

(declare-fun res!703892 () Bool)

(assert (=> b!1054990 (=> (not res!703892) (not e!599481))))

(assert (=> b!1054990 (= res!703892 (= (select (store (arr!32003 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465624) k0!2747))))

(declare-fun b!1054991 () Bool)

(declare-fun e!599482 () Bool)

(assert (=> b!1054991 (= e!599483 e!599482)))

(declare-fun res!703889 () Bool)

(assert (=> b!1054991 (=> (not res!703889) (not e!599482))))

(declare-fun lt!465625 () array!66545)

(assert (=> b!1054991 (= res!703889 (arrayContainsKey!0 lt!465625 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054991 (= lt!465625 (array!66546 (store (arr!32003 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32539 a!3488)))))

(declare-fun b!1054992 () Bool)

(declare-fun res!703888 () Bool)

(assert (=> b!1054992 (=> (not res!703888) (not e!599483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054992 (= res!703888 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054993 () Bool)

(assert (=> b!1054993 (= e!599480 (arrayContainsKey!0 a!3488 k0!2747 lt!465624))))

(declare-fun b!1054994 () Bool)

(declare-fun res!703885 () Bool)

(assert (=> b!1054994 (=> (not res!703885) (not e!599483))))

(assert (=> b!1054994 (= res!703885 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22312))))

(declare-fun res!703886 () Bool)

(assert (=> start!92924 (=> (not res!703886) (not e!599483))))

(assert (=> start!92924 (= res!703886 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32539 a!3488)) (bvslt (size!32539 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92924 e!599483))

(assert (=> start!92924 true))

(declare-fun array_inv!24783 (array!66545) Bool)

(assert (=> start!92924 (array_inv!24783 a!3488)))

(declare-fun b!1054989 () Bool)

(assert (=> b!1054989 (= e!599482 e!599485)))

(declare-fun res!703884 () Bool)

(assert (=> b!1054989 (=> (not res!703884) (not e!599485))))

(assert (=> b!1054989 (= res!703884 (not (= lt!465624 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66545 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054989 (= lt!465624 (arrayScanForKey!0 lt!465625 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92924 res!703886) b!1054994))

(assert (= (and b!1054994 res!703885) b!1054992))

(assert (= (and b!1054992 res!703888) b!1054987))

(assert (= (and b!1054987 res!703890) b!1054991))

(assert (= (and b!1054991 res!703889) b!1054989))

(assert (= (and b!1054989 res!703884) b!1054990))

(assert (= (and b!1054990 res!703892) b!1054988))

(assert (= (and b!1054988 (not res!703887)) b!1054993))

(assert (= (and b!1054990 (not res!703891)) b!1054986))

(declare-fun m!975019 () Bool)

(assert (=> b!1054986 m!975019))

(declare-fun m!975021 () Bool)

(assert (=> b!1054986 m!975021))

(declare-fun m!975023 () Bool)

(assert (=> b!1054986 m!975023))

(declare-fun m!975025 () Bool)

(assert (=> b!1054986 m!975025))

(declare-fun m!975027 () Bool)

(assert (=> b!1054989 m!975027))

(declare-fun m!975029 () Bool)

(assert (=> b!1054992 m!975029))

(declare-fun m!975031 () Bool)

(assert (=> b!1054990 m!975031))

(declare-fun m!975033 () Bool)

(assert (=> b!1054990 m!975033))

(declare-fun m!975035 () Bool)

(assert (=> start!92924 m!975035))

(declare-fun m!975037 () Bool)

(assert (=> b!1054991 m!975037))

(assert (=> b!1054991 m!975031))

(declare-fun m!975039 () Bool)

(assert (=> b!1054994 m!975039))

(declare-fun m!975041 () Bool)

(assert (=> b!1054993 m!975041))

(declare-fun m!975043 () Bool)

(assert (=> b!1054987 m!975043))

(check-sat (not b!1054994) (not b!1054989) (not b!1054993) (not b!1054991) (not b!1054992) (not b!1054986) (not start!92924))
(check-sat)
