; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93224 () Bool)

(assert start!93224)

(declare-fun b!1056942 () Bool)

(declare-fun res!705644 () Bool)

(declare-fun e!600990 () Bool)

(assert (=> b!1056942 (=> (not res!705644) (not e!600990))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056942 (= res!705644 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056943 () Bool)

(declare-fun res!705648 () Bool)

(assert (=> b!1056943 (=> (not res!705648) (not e!600990))))

(declare-datatypes ((array!66662 0))(
  ( (array!66663 (arr!32054 (Array (_ BitVec 32) (_ BitVec 64))) (size!32590 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66662)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056943 (= res!705648 (= (select (arr!32054 a!3488) i!1381) k0!2747))))

(declare-fun b!1056944 () Bool)

(declare-fun e!600989 () Bool)

(declare-fun e!600985 () Bool)

(assert (=> b!1056944 (= e!600989 e!600985)))

(declare-fun res!705650 () Bool)

(assert (=> b!1056944 (=> res!705650 e!600985)))

(declare-fun lt!466243 () (_ BitVec 32))

(assert (=> b!1056944 (= res!705650 (or (bvsgt lt!466243 i!1381) (bvsle i!1381 lt!466243)))))

(declare-fun b!1056945 () Bool)

(declare-fun e!600987 () Bool)

(declare-fun e!600988 () Bool)

(assert (=> b!1056945 (= e!600987 (not e!600988))))

(declare-fun res!705649 () Bool)

(assert (=> b!1056945 (=> res!705649 e!600988)))

(assert (=> b!1056945 (= res!705649 (or (bvsgt lt!466243 i!1381) (bvsle i!1381 lt!466243)))))

(assert (=> b!1056945 e!600989))

(declare-fun res!705642 () Bool)

(assert (=> b!1056945 (=> (not res!705642) (not e!600989))))

(assert (=> b!1056945 (= res!705642 (= (select (store (arr!32054 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466243) k0!2747))))

(declare-fun b!1056946 () Bool)

(assert (=> b!1056946 (= e!600988 true)))

(declare-datatypes ((List!22366 0))(
  ( (Nil!22363) (Cons!22362 (h!23571 (_ BitVec 64)) (t!31673 List!22366)) )
))
(declare-fun arrayNoDuplicates!0 (array!66662 (_ BitVec 32) List!22366) Bool)

(assert (=> b!1056946 (arrayNoDuplicates!0 a!3488 lt!466243 Nil!22363)))

(declare-datatypes ((Unit!34630 0))(
  ( (Unit!34631) )
))
(declare-fun lt!466244 () Unit!34630)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66662 (_ BitVec 32) (_ BitVec 32)) Unit!34630)

(assert (=> b!1056946 (= lt!466244 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466243))))

(declare-fun res!705646 () Bool)

(assert (=> start!93224 (=> (not res!705646) (not e!600990))))

(assert (=> start!93224 (= res!705646 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32590 a!3488)) (bvslt (size!32590 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93224 e!600990))

(assert (=> start!93224 true))

(declare-fun array_inv!24834 (array!66662) Bool)

(assert (=> start!93224 (array_inv!24834 a!3488)))

(declare-fun b!1056947 () Bool)

(declare-fun res!705643 () Bool)

(assert (=> b!1056947 (=> (not res!705643) (not e!600990))))

(assert (=> b!1056947 (= res!705643 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22363))))

(declare-fun b!1056948 () Bool)

(declare-fun e!600986 () Bool)

(assert (=> b!1056948 (= e!600986 e!600987)))

(declare-fun res!705647 () Bool)

(assert (=> b!1056948 (=> (not res!705647) (not e!600987))))

(assert (=> b!1056948 (= res!705647 (not (= lt!466243 i!1381)))))

(declare-fun lt!466245 () array!66662)

(declare-fun arrayScanForKey!0 (array!66662 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056948 (= lt!466243 (arrayScanForKey!0 lt!466245 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056949 () Bool)

(assert (=> b!1056949 (= e!600990 e!600986)))

(declare-fun res!705645 () Bool)

(assert (=> b!1056949 (=> (not res!705645) (not e!600986))))

(declare-fun arrayContainsKey!0 (array!66662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056949 (= res!705645 (arrayContainsKey!0 lt!466245 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056949 (= lt!466245 (array!66663 (store (arr!32054 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32590 a!3488)))))

(declare-fun b!1056950 () Bool)

(assert (=> b!1056950 (= e!600985 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93224 res!705646) b!1056947))

(assert (= (and b!1056947 res!705643) b!1056942))

(assert (= (and b!1056942 res!705644) b!1056943))

(assert (= (and b!1056943 res!705648) b!1056949))

(assert (= (and b!1056949 res!705645) b!1056948))

(assert (= (and b!1056948 res!705647) b!1056945))

(assert (= (and b!1056945 res!705642) b!1056944))

(assert (= (and b!1056944 (not res!705650)) b!1056950))

(assert (= (and b!1056945 (not res!705649)) b!1056946))

(declare-fun m!976689 () Bool)

(assert (=> start!93224 m!976689))

(declare-fun m!976691 () Bool)

(assert (=> b!1056945 m!976691))

(declare-fun m!976693 () Bool)

(assert (=> b!1056945 m!976693))

(declare-fun m!976695 () Bool)

(assert (=> b!1056942 m!976695))

(declare-fun m!976697 () Bool)

(assert (=> b!1056946 m!976697))

(declare-fun m!976699 () Bool)

(assert (=> b!1056946 m!976699))

(declare-fun m!976701 () Bool)

(assert (=> b!1056948 m!976701))

(declare-fun m!976703 () Bool)

(assert (=> b!1056943 m!976703))

(declare-fun m!976705 () Bool)

(assert (=> b!1056949 m!976705))

(assert (=> b!1056949 m!976691))

(declare-fun m!976707 () Bool)

(assert (=> b!1056950 m!976707))

(declare-fun m!976709 () Bool)

(assert (=> b!1056947 m!976709))

(check-sat (not b!1056948) (not b!1056942) (not b!1056947) (not b!1056949) (not b!1056950) (not b!1056946) (not start!93224))
(check-sat)
