; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93112 () Bool)

(assert start!93112)

(declare-fun res!704904 () Bool)

(declare-fun e!600320 () Bool)

(assert (=> start!93112 (=> (not res!704904) (not e!600320))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66551 0))(
  ( (array!66552 (arr!32001 (Array (_ BitVec 32) (_ BitVec 64))) (size!32539 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66551)

(assert (=> start!93112 (= res!704904 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32539 a!3488)) (bvslt (size!32539 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93112 e!600320))

(assert (=> start!93112 true))

(declare-fun array_inv!24784 (array!66551) Bool)

(assert (=> start!93112 (array_inv!24784 a!3488)))

(declare-fun b!1056042 () Bool)

(declare-fun res!704910 () Bool)

(assert (=> b!1056042 (=> (not res!704910) (not e!600320))))

(declare-datatypes ((List!22372 0))(
  ( (Nil!22369) (Cons!22368 (h!23577 (_ BitVec 64)) (t!31670 List!22372)) )
))
(declare-fun arrayNoDuplicates!0 (array!66551 (_ BitVec 32) List!22372) Bool)

(assert (=> b!1056042 (= res!704910 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22369))))

(declare-fun b!1056043 () Bool)

(declare-fun e!600321 () Bool)

(assert (=> b!1056043 (= e!600321 (not true))))

(declare-fun e!600318 () Bool)

(assert (=> b!1056043 e!600318))

(declare-fun res!704906 () Bool)

(assert (=> b!1056043 (=> (not res!704906) (not e!600318))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!465852 () (_ BitVec 32))

(assert (=> b!1056043 (= res!704906 (= (select (store (arr!32001 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465852) k0!2747))))

(declare-fun b!1056044 () Bool)

(declare-fun e!600317 () Bool)

(assert (=> b!1056044 (= e!600320 e!600317)))

(declare-fun res!704909 () Bool)

(assert (=> b!1056044 (=> (not res!704909) (not e!600317))))

(declare-fun lt!465853 () array!66551)

(declare-fun arrayContainsKey!0 (array!66551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056044 (= res!704909 (arrayContainsKey!0 lt!465853 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056044 (= lt!465853 (array!66552 (store (arr!32001 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32539 a!3488)))))

(declare-fun e!600319 () Bool)

(declare-fun b!1056045 () Bool)

(assert (=> b!1056045 (= e!600319 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056046 () Bool)

(assert (=> b!1056046 (= e!600317 e!600321)))

(declare-fun res!704907 () Bool)

(assert (=> b!1056046 (=> (not res!704907) (not e!600321))))

(assert (=> b!1056046 (= res!704907 (not (= lt!465852 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66551 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056046 (= lt!465852 (arrayScanForKey!0 lt!465853 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056047 () Bool)

(assert (=> b!1056047 (= e!600318 e!600319)))

(declare-fun res!704908 () Bool)

(assert (=> b!1056047 (=> res!704908 e!600319)))

(assert (=> b!1056047 (= res!704908 (or (bvsgt lt!465852 i!1381) (bvsle i!1381 lt!465852)))))

(declare-fun b!1056048 () Bool)

(declare-fun res!704905 () Bool)

(assert (=> b!1056048 (=> (not res!704905) (not e!600320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056048 (= res!704905 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056049 () Bool)

(declare-fun res!704911 () Bool)

(assert (=> b!1056049 (=> (not res!704911) (not e!600320))))

(assert (=> b!1056049 (= res!704911 (= (select (arr!32001 a!3488) i!1381) k0!2747))))

(assert (= (and start!93112 res!704904) b!1056042))

(assert (= (and b!1056042 res!704910) b!1056048))

(assert (= (and b!1056048 res!704905) b!1056049))

(assert (= (and b!1056049 res!704911) b!1056044))

(assert (= (and b!1056044 res!704909) b!1056046))

(assert (= (and b!1056046 res!704907) b!1056043))

(assert (= (and b!1056043 res!704906) b!1056047))

(assert (= (and b!1056047 (not res!704908)) b!1056045))

(declare-fun m!975491 () Bool)

(assert (=> b!1056042 m!975491))

(declare-fun m!975493 () Bool)

(assert (=> b!1056045 m!975493))

(declare-fun m!975495 () Bool)

(assert (=> b!1056046 m!975495))

(declare-fun m!975497 () Bool)

(assert (=> start!93112 m!975497))

(declare-fun m!975499 () Bool)

(assert (=> b!1056049 m!975499))

(declare-fun m!975501 () Bool)

(assert (=> b!1056048 m!975501))

(declare-fun m!975503 () Bool)

(assert (=> b!1056043 m!975503))

(declare-fun m!975505 () Bool)

(assert (=> b!1056043 m!975505))

(declare-fun m!975507 () Bool)

(assert (=> b!1056044 m!975507))

(assert (=> b!1056044 m!975503))

(check-sat (not b!1056044) (not b!1056045) (not b!1056042) (not b!1056048) (not b!1056046) (not start!93112))
(check-sat)
