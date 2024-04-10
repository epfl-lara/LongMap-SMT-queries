; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92502 () Bool)

(assert start!92502)

(declare-fun b!1051977 () Bool)

(declare-fun e!597216 () Bool)

(declare-fun e!597222 () Bool)

(assert (=> b!1051977 (= e!597216 e!597222)))

(declare-fun res!701110 () Bool)

(assert (=> b!1051977 (=> (not res!701110) (not e!597222))))

(declare-datatypes ((array!66303 0))(
  ( (array!66304 (arr!31891 (Array (_ BitVec 32) (_ BitVec 64))) (size!32427 (_ BitVec 32))) )
))
(declare-fun lt!464531 () array!66303)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051977 (= res!701110 (arrayContainsKey!0 lt!464531 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66303)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051977 (= lt!464531 (array!66304 (store (arr!31891 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32427 a!3488)))))

(declare-fun b!1051978 () Bool)

(declare-fun res!701107 () Bool)

(assert (=> b!1051978 (=> (not res!701107) (not e!597216))))

(declare-datatypes ((List!22203 0))(
  ( (Nil!22200) (Cons!22199 (h!23408 (_ BitVec 64)) (t!31510 List!22203)) )
))
(declare-fun arrayNoDuplicates!0 (array!66303 (_ BitVec 32) List!22203) Bool)

(assert (=> b!1051978 (= res!701107 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22200))))

(declare-fun b!1051979 () Bool)

(declare-fun e!597219 () Bool)

(assert (=> b!1051979 (= e!597219 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051980 () Bool)

(declare-fun e!597223 () Bool)

(assert (=> b!1051980 (= e!597222 e!597223)))

(declare-fun res!701113 () Bool)

(assert (=> b!1051980 (=> (not res!701113) (not e!597223))))

(declare-fun lt!464529 () (_ BitVec 32))

(assert (=> b!1051980 (= res!701113 (not (= lt!464529 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66303 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051980 (= lt!464529 (arrayScanForKey!0 lt!464531 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!701103 () Bool)

(assert (=> start!92502 (=> (not res!701103) (not e!597216))))

(assert (=> start!92502 (= res!701103 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32427 a!3488)) (bvslt (size!32427 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92502 e!597216))

(assert (=> start!92502 true))

(declare-fun array_inv!24671 (array!66303) Bool)

(assert (=> start!92502 (array_inv!24671 a!3488)))

(declare-fun b!1051981 () Bool)

(declare-fun res!701106 () Bool)

(assert (=> b!1051981 (=> (not res!701106) (not e!597216))))

(assert (=> b!1051981 (= res!701106 (= (select (arr!31891 a!3488) i!1381) k!2747))))

(declare-fun b!1051982 () Bool)

(declare-fun res!701112 () Bool)

(declare-fun e!597218 () Bool)

(assert (=> b!1051982 (=> res!701112 e!597218)))

(declare-fun contains!6145 (List!22203 (_ BitVec 64)) Bool)

(assert (=> b!1051982 (= res!701112 (contains!6145 Nil!22200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051983 () Bool)

(declare-fun res!701109 () Bool)

(assert (=> b!1051983 (=> res!701109 e!597218)))

(declare-fun noDuplicate!1530 (List!22203) Bool)

(assert (=> b!1051983 (= res!701109 (not (noDuplicate!1530 Nil!22200)))))

(declare-fun b!1051984 () Bool)

(declare-fun e!597221 () Bool)

(assert (=> b!1051984 (= e!597221 e!597218)))

(declare-fun res!701111 () Bool)

(assert (=> b!1051984 (=> res!701111 e!597218)))

(declare-fun lt!464528 () (_ BitVec 32))

(assert (=> b!1051984 (= res!701111 (or (bvslt lt!464529 #b00000000000000000000000000000000) (bvsge lt!464528 (size!32427 a!3488)) (bvsge lt!464529 (size!32427 a!3488))))))

(assert (=> b!1051984 (arrayContainsKey!0 a!3488 k!2747 lt!464528)))

(declare-datatypes ((Unit!34454 0))(
  ( (Unit!34455) )
))
(declare-fun lt!464527 () Unit!34454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66303 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34454)

(assert (=> b!1051984 (= lt!464527 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464528))))

(assert (=> b!1051984 (= lt!464528 (bvadd #b00000000000000000000000000000001 lt!464529))))

(assert (=> b!1051984 (arrayNoDuplicates!0 a!3488 lt!464529 Nil!22200)))

(declare-fun lt!464532 () Unit!34454)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66303 (_ BitVec 32) (_ BitVec 32)) Unit!34454)

(assert (=> b!1051984 (= lt!464532 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464529))))

(declare-fun b!1051985 () Bool)

(assert (=> b!1051985 (= e!597223 (not e!597221))))

(declare-fun res!701105 () Bool)

(assert (=> b!1051985 (=> res!701105 e!597221)))

(assert (=> b!1051985 (= res!701105 (or (bvsgt lt!464529 i!1381) (bvsle i!1381 lt!464529)))))

(declare-fun e!597220 () Bool)

(assert (=> b!1051985 e!597220))

(declare-fun res!701104 () Bool)

(assert (=> b!1051985 (=> (not res!701104) (not e!597220))))

(assert (=> b!1051985 (= res!701104 (= (select (store (arr!31891 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464529) k!2747))))

(declare-fun b!1051986 () Bool)

(declare-fun res!701114 () Bool)

(assert (=> b!1051986 (=> (not res!701114) (not e!597216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051986 (= res!701114 (validKeyInArray!0 k!2747))))

(declare-fun b!1051987 () Bool)

(assert (=> b!1051987 (= e!597220 e!597219)))

(declare-fun res!701108 () Bool)

(assert (=> b!1051987 (=> res!701108 e!597219)))

(assert (=> b!1051987 (= res!701108 (or (bvsgt lt!464529 i!1381) (bvsle i!1381 lt!464529)))))

(declare-fun b!1051988 () Bool)

(assert (=> b!1051988 (= e!597218 true)))

(declare-fun lt!464530 () Bool)

(assert (=> b!1051988 (= lt!464530 (contains!6145 Nil!22200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92502 res!701103) b!1051978))

(assert (= (and b!1051978 res!701107) b!1051986))

(assert (= (and b!1051986 res!701114) b!1051981))

(assert (= (and b!1051981 res!701106) b!1051977))

(assert (= (and b!1051977 res!701110) b!1051980))

(assert (= (and b!1051980 res!701113) b!1051985))

(assert (= (and b!1051985 res!701104) b!1051987))

(assert (= (and b!1051987 (not res!701108)) b!1051979))

(assert (= (and b!1051985 (not res!701105)) b!1051984))

(assert (= (and b!1051984 (not res!701111)) b!1051983))

(assert (= (and b!1051983 (not res!701109)) b!1051982))

(assert (= (and b!1051982 (not res!701112)) b!1051988))

(declare-fun m!972407 () Bool)

(assert (=> b!1051980 m!972407))

(declare-fun m!972409 () Bool)

(assert (=> b!1051984 m!972409))

(declare-fun m!972411 () Bool)

(assert (=> b!1051984 m!972411))

(declare-fun m!972413 () Bool)

(assert (=> b!1051984 m!972413))

(declare-fun m!972415 () Bool)

(assert (=> b!1051984 m!972415))

(declare-fun m!972417 () Bool)

(assert (=> b!1051978 m!972417))

(declare-fun m!972419 () Bool)

(assert (=> start!92502 m!972419))

(declare-fun m!972421 () Bool)

(assert (=> b!1051986 m!972421))

(declare-fun m!972423 () Bool)

(assert (=> b!1051985 m!972423))

(declare-fun m!972425 () Bool)

(assert (=> b!1051985 m!972425))

(declare-fun m!972427 () Bool)

(assert (=> b!1051982 m!972427))

(declare-fun m!972429 () Bool)

(assert (=> b!1051977 m!972429))

(assert (=> b!1051977 m!972423))

(declare-fun m!972431 () Bool)

(assert (=> b!1051981 m!972431))

(declare-fun m!972433 () Bool)

(assert (=> b!1051983 m!972433))

(declare-fun m!972435 () Bool)

(assert (=> b!1051988 m!972435))

(declare-fun m!972437 () Bool)

(assert (=> b!1051979 m!972437))

(push 1)

