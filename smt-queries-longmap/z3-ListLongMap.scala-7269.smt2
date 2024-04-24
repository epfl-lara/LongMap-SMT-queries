; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93066 () Bool)

(assert start!93066)

(declare-fun b!1055519 () Bool)

(declare-fun res!703661 () Bool)

(declare-fun e!599711 () Bool)

(assert (=> b!1055519 (=> (not res!703661) (not e!599711))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055519 (= res!703661 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055520 () Bool)

(declare-fun e!599710 () Bool)

(assert (=> b!1055520 (= e!599711 e!599710)))

(declare-fun res!703653 () Bool)

(assert (=> b!1055520 (=> (not res!703653) (not e!599710))))

(declare-datatypes ((array!66541 0))(
  ( (array!66542 (arr!31996 (Array (_ BitVec 32) (_ BitVec 64))) (size!32533 (_ BitVec 32))) )
))
(declare-fun lt!465847 () array!66541)

(declare-fun arrayContainsKey!0 (array!66541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055520 (= res!703653 (arrayContainsKey!0 lt!465847 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66541)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055520 (= lt!465847 (array!66542 (store (arr!31996 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32533 a!3488)))))

(declare-fun lt!465848 () (_ BitVec 32))

(declare-fun e!599716 () Bool)

(declare-fun b!1055521 () Bool)

(assert (=> b!1055521 (= e!599716 (or (bvslt lt!465848 #b00000000000000000000000000000000) (bvsge lt!465848 (size!32533 a!3488)) (bvsge (bvadd #b00000000000000000000000000000001 i!1381) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!22278 0))(
  ( (Nil!22275) (Cons!22274 (h!23492 (_ BitVec 64)) (t!31577 List!22278)) )
))
(declare-fun arrayNoDuplicates!0 (array!66541 (_ BitVec 32) List!22278) Bool)

(assert (=> b!1055521 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22275)))

(declare-datatypes ((Unit!34519 0))(
  ( (Unit!34520) )
))
(declare-fun lt!465846 () Unit!34519)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66541 (_ BitVec 32) (_ BitVec 32)) Unit!34519)

(assert (=> b!1055521 (= lt!465846 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055522 () Bool)

(declare-fun e!599712 () Bool)

(assert (=> b!1055522 (= e!599712 (arrayContainsKey!0 a!3488 k0!2747 lt!465848))))

(declare-fun b!1055523 () Bool)

(declare-fun e!599713 () Bool)

(assert (=> b!1055523 (= e!599713 e!599712)))

(declare-fun res!703660 () Bool)

(assert (=> b!1055523 (=> res!703660 e!599712)))

(assert (=> b!1055523 (= res!703660 (bvsle lt!465848 i!1381))))

(declare-fun b!1055524 () Bool)

(declare-fun res!703657 () Bool)

(assert (=> b!1055524 (=> (not res!703657) (not e!599711))))

(assert (=> b!1055524 (= res!703657 (= (select (arr!31996 a!3488) i!1381) k0!2747))))

(declare-fun b!1055518 () Bool)

(declare-fun e!599715 () Bool)

(assert (=> b!1055518 (= e!599710 e!599715)))

(declare-fun res!703659 () Bool)

(assert (=> b!1055518 (=> (not res!703659) (not e!599715))))

(assert (=> b!1055518 (= res!703659 (not (= lt!465848 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66541 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055518 (= lt!465848 (arrayScanForKey!0 lt!465847 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703658 () Bool)

(assert (=> start!93066 (=> (not res!703658) (not e!599711))))

(assert (=> start!93066 (= res!703658 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32533 a!3488)) (bvslt (size!32533 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93066 e!599711))

(assert (=> start!93066 true))

(declare-fun array_inv!24778 (array!66541) Bool)

(assert (=> start!93066 (array_inv!24778 a!3488)))

(declare-fun b!1055525 () Bool)

(assert (=> b!1055525 (= e!599715 (not e!599716))))

(declare-fun res!703656 () Bool)

(assert (=> b!1055525 (=> res!703656 e!599716)))

(assert (=> b!1055525 (= res!703656 (bvsle lt!465848 i!1381))))

(assert (=> b!1055525 e!599713))

(declare-fun res!703655 () Bool)

(assert (=> b!1055525 (=> (not res!703655) (not e!599713))))

(assert (=> b!1055525 (= res!703655 (= (select (store (arr!31996 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465848) k0!2747))))

(declare-fun b!1055526 () Bool)

(declare-fun res!703654 () Bool)

(assert (=> b!1055526 (=> (not res!703654) (not e!599711))))

(assert (=> b!1055526 (= res!703654 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22275))))

(assert (= (and start!93066 res!703658) b!1055526))

(assert (= (and b!1055526 res!703654) b!1055519))

(assert (= (and b!1055519 res!703661) b!1055524))

(assert (= (and b!1055524 res!703657) b!1055520))

(assert (= (and b!1055520 res!703653) b!1055518))

(assert (= (and b!1055518 res!703659) b!1055525))

(assert (= (and b!1055525 res!703655) b!1055523))

(assert (= (and b!1055523 (not res!703660)) b!1055522))

(assert (= (and b!1055525 (not res!703656)) b!1055521))

(declare-fun m!975983 () Bool)

(assert (=> b!1055518 m!975983))

(declare-fun m!975985 () Bool)

(assert (=> b!1055526 m!975985))

(declare-fun m!975987 () Bool)

(assert (=> start!93066 m!975987))

(declare-fun m!975989 () Bool)

(assert (=> b!1055519 m!975989))

(declare-fun m!975991 () Bool)

(assert (=> b!1055521 m!975991))

(declare-fun m!975993 () Bool)

(assert (=> b!1055521 m!975993))

(declare-fun m!975995 () Bool)

(assert (=> b!1055525 m!975995))

(declare-fun m!975997 () Bool)

(assert (=> b!1055525 m!975997))

(declare-fun m!975999 () Bool)

(assert (=> b!1055522 m!975999))

(declare-fun m!976001 () Bool)

(assert (=> b!1055524 m!976001))

(declare-fun m!976003 () Bool)

(assert (=> b!1055520 m!976003))

(assert (=> b!1055520 m!975995))

(check-sat (not b!1055521) (not b!1055520) (not b!1055519) (not b!1055522) (not start!93066) (not b!1055518) (not b!1055526))
(check-sat)
