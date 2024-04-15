; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93226 () Bool)

(assert start!93226)

(declare-fun b!1056845 () Bool)

(declare-datatypes ((array!66605 0))(
  ( (array!66606 (arr!32025 (Array (_ BitVec 32) (_ BitVec 64))) (size!32563 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66605)

(declare-fun e!600939 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056845 (= e!600939 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056846 () Bool)

(declare-fun res!705630 () Bool)

(declare-fun e!600937 () Bool)

(assert (=> b!1056846 (=> (not res!705630) (not e!600937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056846 (= res!705630 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056847 () Bool)

(declare-fun e!600936 () Bool)

(declare-fun e!600938 () Bool)

(assert (=> b!1056847 (= e!600936 e!600938)))

(declare-fun res!705633 () Bool)

(assert (=> b!1056847 (=> (not res!705633) (not e!600938))))

(declare-fun lt!466061 () (_ BitVec 32))

(assert (=> b!1056847 (= res!705633 (not (= lt!466061 i!1381)))))

(declare-fun lt!466063 () array!66605)

(declare-fun arrayScanForKey!0 (array!66605 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056847 (= lt!466061 (arrayScanForKey!0 lt!466063 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056848 () Bool)

(declare-fun e!600942 () Bool)

(assert (=> b!1056848 (= e!600938 (not e!600942))))

(declare-fun res!705637 () Bool)

(assert (=> b!1056848 (=> res!705637 e!600942)))

(assert (=> b!1056848 (= res!705637 (or (bvsgt lt!466061 i!1381) (bvsle i!1381 lt!466061)))))

(declare-fun e!600940 () Bool)

(assert (=> b!1056848 e!600940))

(declare-fun res!705634 () Bool)

(assert (=> b!1056848 (=> (not res!705634) (not e!600940))))

(assert (=> b!1056848 (= res!705634 (= (select (store (arr!32025 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466061) k0!2747))))

(declare-fun res!705636 () Bool)

(assert (=> start!93226 (=> (not res!705636) (not e!600937))))

(assert (=> start!93226 (= res!705636 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32563 a!3488)) (bvslt (size!32563 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93226 e!600937))

(assert (=> start!93226 true))

(declare-fun array_inv!24808 (array!66605) Bool)

(assert (=> start!93226 (array_inv!24808 a!3488)))

(declare-fun b!1056849 () Bool)

(assert (=> b!1056849 (= e!600937 e!600936)))

(declare-fun res!705631 () Bool)

(assert (=> b!1056849 (=> (not res!705631) (not e!600936))))

(assert (=> b!1056849 (= res!705631 (arrayContainsKey!0 lt!466063 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056849 (= lt!466063 (array!66606 (store (arr!32025 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32563 a!3488)))))

(declare-fun b!1056850 () Bool)

(declare-fun res!705632 () Bool)

(assert (=> b!1056850 (=> (not res!705632) (not e!600937))))

(declare-datatypes ((List!22396 0))(
  ( (Nil!22393) (Cons!22392 (h!23601 (_ BitVec 64)) (t!31694 List!22396)) )
))
(declare-fun arrayNoDuplicates!0 (array!66605 (_ BitVec 32) List!22396) Bool)

(assert (=> b!1056850 (= res!705632 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22393))))

(declare-fun b!1056851 () Bool)

(assert (=> b!1056851 (= e!600940 e!600939)))

(declare-fun res!705629 () Bool)

(assert (=> b!1056851 (=> res!705629 e!600939)))

(assert (=> b!1056851 (= res!705629 (or (bvsgt lt!466061 i!1381) (bvsle i!1381 lt!466061)))))

(declare-fun b!1056852 () Bool)

(assert (=> b!1056852 (= e!600942 true)))

(assert (=> b!1056852 (arrayNoDuplicates!0 a!3488 lt!466061 Nil!22393)))

(declare-datatypes ((Unit!34505 0))(
  ( (Unit!34506) )
))
(declare-fun lt!466062 () Unit!34505)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66605 (_ BitVec 32) (_ BitVec 32)) Unit!34505)

(assert (=> b!1056852 (= lt!466062 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466061))))

(declare-fun b!1056853 () Bool)

(declare-fun res!705635 () Bool)

(assert (=> b!1056853 (=> (not res!705635) (not e!600937))))

(assert (=> b!1056853 (= res!705635 (= (select (arr!32025 a!3488) i!1381) k0!2747))))

(assert (= (and start!93226 res!705636) b!1056850))

(assert (= (and b!1056850 res!705632) b!1056846))

(assert (= (and b!1056846 res!705630) b!1056853))

(assert (= (and b!1056853 res!705635) b!1056849))

(assert (= (and b!1056849 res!705631) b!1056847))

(assert (= (and b!1056847 res!705633) b!1056848))

(assert (= (and b!1056848 res!705634) b!1056851))

(assert (= (and b!1056851 (not res!705629)) b!1056845))

(assert (= (and b!1056848 (not res!705637)) b!1056852))

(declare-fun m!976109 () Bool)

(assert (=> b!1056852 m!976109))

(declare-fun m!976111 () Bool)

(assert (=> b!1056852 m!976111))

(declare-fun m!976113 () Bool)

(assert (=> b!1056848 m!976113))

(declare-fun m!976115 () Bool)

(assert (=> b!1056848 m!976115))

(declare-fun m!976117 () Bool)

(assert (=> start!93226 m!976117))

(declare-fun m!976119 () Bool)

(assert (=> b!1056847 m!976119))

(declare-fun m!976121 () Bool)

(assert (=> b!1056846 m!976121))

(declare-fun m!976123 () Bool)

(assert (=> b!1056845 m!976123))

(declare-fun m!976125 () Bool)

(assert (=> b!1056853 m!976125))

(declare-fun m!976127 () Bool)

(assert (=> b!1056849 m!976127))

(assert (=> b!1056849 m!976113))

(declare-fun m!976129 () Bool)

(assert (=> b!1056850 m!976129))

(check-sat (not b!1056845) (not b!1056847) (not b!1056849) (not start!93226) (not b!1056852) (not b!1056846) (not b!1056850))
(check-sat)
