; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92474 () Bool)

(assert start!92474)

(declare-datatypes ((array!66275 0))(
  ( (array!66276 (arr!31877 (Array (_ BitVec 32) (_ BitVec 64))) (size!32413 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66275)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun b!1051485 () Bool)

(declare-fun e!596887 () Bool)

(declare-fun arrayContainsKey!0 (array!66275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051485 (= e!596887 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051486 () Bool)

(declare-fun res!700618 () Bool)

(declare-fun e!596889 () Bool)

(assert (=> b!1051486 (=> (not res!700618) (not e!596889))))

(declare-datatypes ((List!22189 0))(
  ( (Nil!22186) (Cons!22185 (h!23394 (_ BitVec 64)) (t!31496 List!22189)) )
))
(declare-fun arrayNoDuplicates!0 (array!66275 (_ BitVec 32) List!22189) Bool)

(assert (=> b!1051486 (= res!700618 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22186))))

(declare-fun b!1051487 () Bool)

(declare-fun e!596884 () Bool)

(declare-fun e!596888 () Bool)

(assert (=> b!1051487 (= e!596884 (not e!596888))))

(declare-fun res!700615 () Bool)

(assert (=> b!1051487 (=> res!700615 e!596888)))

(declare-fun lt!464288 () (_ BitVec 32))

(assert (=> b!1051487 (= res!700615 (or (bvsgt lt!464288 i!1381) (bvsle i!1381 lt!464288)))))

(declare-fun e!596886 () Bool)

(assert (=> b!1051487 e!596886))

(declare-fun res!700617 () Bool)

(assert (=> b!1051487 (=> (not res!700617) (not e!596886))))

(assert (=> b!1051487 (= res!700617 (= (select (store (arr!31877 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464288) k0!2747))))

(declare-fun b!1051488 () Bool)

(assert (=> b!1051488 (= e!596888 true)))

(assert (=> b!1051488 (arrayNoDuplicates!0 a!3488 lt!464288 Nil!22186)))

(declare-datatypes ((Unit!34426 0))(
  ( (Unit!34427) )
))
(declare-fun lt!464287 () Unit!34426)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66275 (_ BitVec 32) (_ BitVec 32)) Unit!34426)

(assert (=> b!1051488 (= lt!464287 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464288))))

(declare-fun b!1051489 () Bool)

(assert (=> b!1051489 (= e!596886 e!596887)))

(declare-fun res!700611 () Bool)

(assert (=> b!1051489 (=> res!700611 e!596887)))

(assert (=> b!1051489 (= res!700611 (or (bvsgt lt!464288 i!1381) (bvsle i!1381 lt!464288)))))

(declare-fun b!1051490 () Bool)

(declare-fun e!596885 () Bool)

(assert (=> b!1051490 (= e!596885 e!596884)))

(declare-fun res!700616 () Bool)

(assert (=> b!1051490 (=> (not res!700616) (not e!596884))))

(assert (=> b!1051490 (= res!700616 (not (= lt!464288 i!1381)))))

(declare-fun lt!464289 () array!66275)

(declare-fun arrayScanForKey!0 (array!66275 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051490 (= lt!464288 (arrayScanForKey!0 lt!464289 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700614 () Bool)

(assert (=> start!92474 (=> (not res!700614) (not e!596889))))

(assert (=> start!92474 (= res!700614 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32413 a!3488)) (bvslt (size!32413 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92474 e!596889))

(assert (=> start!92474 true))

(declare-fun array_inv!24657 (array!66275) Bool)

(assert (=> start!92474 (array_inv!24657 a!3488)))

(declare-fun b!1051491 () Bool)

(declare-fun res!700619 () Bool)

(assert (=> b!1051491 (=> (not res!700619) (not e!596889))))

(assert (=> b!1051491 (= res!700619 (= (select (arr!31877 a!3488) i!1381) k0!2747))))

(declare-fun b!1051492 () Bool)

(assert (=> b!1051492 (= e!596889 e!596885)))

(declare-fun res!700612 () Bool)

(assert (=> b!1051492 (=> (not res!700612) (not e!596885))))

(assert (=> b!1051492 (= res!700612 (arrayContainsKey!0 lt!464289 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051492 (= lt!464289 (array!66276 (store (arr!31877 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32413 a!3488)))))

(declare-fun b!1051493 () Bool)

(declare-fun res!700613 () Bool)

(assert (=> b!1051493 (=> (not res!700613) (not e!596889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051493 (= res!700613 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92474 res!700614) b!1051486))

(assert (= (and b!1051486 res!700618) b!1051493))

(assert (= (and b!1051493 res!700613) b!1051491))

(assert (= (and b!1051491 res!700619) b!1051492))

(assert (= (and b!1051492 res!700612) b!1051490))

(assert (= (and b!1051490 res!700616) b!1051487))

(assert (= (and b!1051487 res!700617) b!1051489))

(assert (= (and b!1051489 (not res!700611)) b!1051485))

(assert (= (and b!1051487 (not res!700615)) b!1051488))

(declare-fun m!971979 () Bool)

(assert (=> b!1051485 m!971979))

(declare-fun m!971981 () Bool)

(assert (=> start!92474 m!971981))

(declare-fun m!971983 () Bool)

(assert (=> b!1051492 m!971983))

(declare-fun m!971985 () Bool)

(assert (=> b!1051492 m!971985))

(declare-fun m!971987 () Bool)

(assert (=> b!1051491 m!971987))

(declare-fun m!971989 () Bool)

(assert (=> b!1051486 m!971989))

(assert (=> b!1051487 m!971985))

(declare-fun m!971991 () Bool)

(assert (=> b!1051487 m!971991))

(declare-fun m!971993 () Bool)

(assert (=> b!1051490 m!971993))

(declare-fun m!971995 () Bool)

(assert (=> b!1051493 m!971995))

(declare-fun m!971997 () Bool)

(assert (=> b!1051488 m!971997))

(declare-fun m!971999 () Bool)

(assert (=> b!1051488 m!971999))

(check-sat (not b!1051490) (not b!1051486) (not b!1051488) (not b!1051492) (not b!1051493) (not b!1051485) (not start!92474))
(check-sat)
