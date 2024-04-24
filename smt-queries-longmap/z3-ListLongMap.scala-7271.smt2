; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93078 () Bool)

(assert start!93078)

(declare-fun b!1055680 () Bool)

(declare-fun e!599838 () Bool)

(declare-fun e!599839 () Bool)

(assert (=> b!1055680 (= e!599838 e!599839)))

(declare-fun res!703820 () Bool)

(assert (=> b!1055680 (=> res!703820 e!599839)))

(declare-fun lt!465900 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055680 (= res!703820 (bvsle lt!465900 i!1381))))

(declare-fun b!1055681 () Bool)

(declare-fun e!599837 () Bool)

(assert (=> b!1055681 (= e!599837 true)))

(declare-datatypes ((array!66553 0))(
  ( (array!66554 (arr!32002 (Array (_ BitVec 32) (_ BitVec 64))) (size!32539 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66553)

(declare-datatypes ((List!22284 0))(
  ( (Nil!22281) (Cons!22280 (h!23498 (_ BitVec 64)) (t!31583 List!22284)) )
))
(declare-fun arrayNoDuplicates!0 (array!66553 (_ BitVec 32) List!22284) Bool)

(assert (=> b!1055681 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22281)))

(declare-datatypes ((Unit!34531 0))(
  ( (Unit!34532) )
))
(declare-fun lt!465902 () Unit!34531)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66553 (_ BitVec 32) (_ BitVec 32)) Unit!34531)

(assert (=> b!1055681 (= lt!465902 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055682 () Bool)

(declare-fun res!703822 () Bool)

(declare-fun e!599842 () Bool)

(assert (=> b!1055682 (=> (not res!703822) (not e!599842))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055682 (= res!703822 (validKeyInArray!0 k0!2747))))

(declare-fun res!703816 () Bool)

(assert (=> start!93078 (=> (not res!703816) (not e!599842))))

(assert (=> start!93078 (= res!703816 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32539 a!3488)) (bvslt (size!32539 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93078 e!599842))

(assert (=> start!93078 true))

(declare-fun array_inv!24784 (array!66553) Bool)

(assert (=> start!93078 (array_inv!24784 a!3488)))

(declare-fun b!1055683 () Bool)

(declare-fun e!599836 () Bool)

(declare-fun e!599840 () Bool)

(assert (=> b!1055683 (= e!599836 e!599840)))

(declare-fun res!703823 () Bool)

(assert (=> b!1055683 (=> (not res!703823) (not e!599840))))

(assert (=> b!1055683 (= res!703823 (not (= lt!465900 i!1381)))))

(declare-fun lt!465901 () array!66553)

(declare-fun arrayScanForKey!0 (array!66553 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055683 (= lt!465900 (arrayScanForKey!0 lt!465901 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055684 () Bool)

(assert (=> b!1055684 (= e!599840 (not e!599837))))

(declare-fun res!703818 () Bool)

(assert (=> b!1055684 (=> res!703818 e!599837)))

(assert (=> b!1055684 (= res!703818 (bvsle lt!465900 i!1381))))

(assert (=> b!1055684 e!599838))

(declare-fun res!703821 () Bool)

(assert (=> b!1055684 (=> (not res!703821) (not e!599838))))

(assert (=> b!1055684 (= res!703821 (= (select (store (arr!32002 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465900) k0!2747))))

(declare-fun b!1055685 () Bool)

(declare-fun arrayContainsKey!0 (array!66553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055685 (= e!599839 (arrayContainsKey!0 a!3488 k0!2747 lt!465900))))

(declare-fun b!1055686 () Bool)

(declare-fun res!703819 () Bool)

(assert (=> b!1055686 (=> (not res!703819) (not e!599842))))

(assert (=> b!1055686 (= res!703819 (= (select (arr!32002 a!3488) i!1381) k0!2747))))

(declare-fun b!1055687 () Bool)

(assert (=> b!1055687 (= e!599842 e!599836)))

(declare-fun res!703815 () Bool)

(assert (=> b!1055687 (=> (not res!703815) (not e!599836))))

(assert (=> b!1055687 (= res!703815 (arrayContainsKey!0 lt!465901 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055687 (= lt!465901 (array!66554 (store (arr!32002 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32539 a!3488)))))

(declare-fun b!1055688 () Bool)

(declare-fun res!703817 () Bool)

(assert (=> b!1055688 (=> (not res!703817) (not e!599842))))

(assert (=> b!1055688 (= res!703817 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22281))))

(assert (= (and start!93078 res!703816) b!1055688))

(assert (= (and b!1055688 res!703817) b!1055682))

(assert (= (and b!1055682 res!703822) b!1055686))

(assert (= (and b!1055686 res!703819) b!1055687))

(assert (= (and b!1055687 res!703815) b!1055683))

(assert (= (and b!1055683 res!703823) b!1055684))

(assert (= (and b!1055684 res!703821) b!1055680))

(assert (= (and b!1055680 (not res!703820)) b!1055685))

(assert (= (and b!1055684 (not res!703818)) b!1055681))

(declare-fun m!976115 () Bool)

(assert (=> b!1055685 m!976115))

(declare-fun m!976117 () Bool)

(assert (=> b!1055682 m!976117))

(declare-fun m!976119 () Bool)

(assert (=> b!1055681 m!976119))

(declare-fun m!976121 () Bool)

(assert (=> b!1055681 m!976121))

(declare-fun m!976123 () Bool)

(assert (=> b!1055683 m!976123))

(declare-fun m!976125 () Bool)

(assert (=> start!93078 m!976125))

(declare-fun m!976127 () Bool)

(assert (=> b!1055684 m!976127))

(declare-fun m!976129 () Bool)

(assert (=> b!1055684 m!976129))

(declare-fun m!976131 () Bool)

(assert (=> b!1055686 m!976131))

(declare-fun m!976133 () Bool)

(assert (=> b!1055687 m!976133))

(assert (=> b!1055687 m!976127))

(declare-fun m!976135 () Bool)

(assert (=> b!1055688 m!976135))

(check-sat (not b!1055682) (not b!1055687) (not b!1055688) (not b!1055681) (not start!93078) (not b!1055683) (not b!1055685))
(check-sat)
