; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92610 () Bool)

(assert start!92610)

(declare-fun b!1051603 () Bool)

(declare-fun e!596827 () Bool)

(declare-fun e!596828 () Bool)

(assert (=> b!1051603 (= e!596827 e!596828)))

(declare-fun res!699930 () Bool)

(assert (=> b!1051603 (=> (not res!699930) (not e!596828))))

(declare-fun lt!464386 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051603 (= res!699930 (not (= lt!464386 i!1381)))))

(declare-datatypes ((array!66226 0))(
  ( (array!66227 (arr!31846 (Array (_ BitVec 32) (_ BitVec 64))) (size!32383 (_ BitVec 32))) )
))
(declare-fun lt!464384 () array!66226)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66226 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051603 (= lt!464386 (arrayScanForKey!0 lt!464384 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051604 () Bool)

(declare-fun e!596829 () Bool)

(assert (=> b!1051604 (= e!596829 e!596827)))

(declare-fun res!699926 () Bool)

(assert (=> b!1051604 (=> (not res!699926) (not e!596827))))

(declare-fun arrayContainsKey!0 (array!66226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051604 (= res!699926 (arrayContainsKey!0 lt!464384 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66226)

(assert (=> b!1051604 (= lt!464384 (array!66227 (store (arr!31846 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32383 a!3488)))))

(declare-fun b!1051605 () Bool)

(declare-fun res!699929 () Bool)

(assert (=> b!1051605 (=> (not res!699929) (not e!596829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051605 (= res!699929 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051606 () Bool)

(declare-fun res!699928 () Bool)

(assert (=> b!1051606 (=> (not res!699928) (not e!596829))))

(declare-datatypes ((List!22128 0))(
  ( (Nil!22125) (Cons!22124 (h!23342 (_ BitVec 64)) (t!31427 List!22128)) )
))
(declare-fun arrayNoDuplicates!0 (array!66226 (_ BitVec 32) List!22128) Bool)

(assert (=> b!1051606 (= res!699928 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22125))))

(declare-fun b!1051607 () Bool)

(declare-fun res!699924 () Bool)

(assert (=> b!1051607 (=> (not res!699924) (not e!596829))))

(assert (=> b!1051607 (= res!699924 (= (select (arr!31846 a!3488) i!1381) k0!2747))))

(declare-fun e!596830 () Bool)

(declare-fun b!1051608 () Bool)

(assert (=> b!1051608 (= e!596830 (arrayContainsKey!0 a!3488 k0!2747 lt!464386))))

(declare-fun res!699925 () Bool)

(assert (=> start!92610 (=> (not res!699925) (not e!596829))))

(assert (=> start!92610 (= res!699925 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32383 a!3488)) (bvslt (size!32383 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92610 e!596829))

(assert (=> start!92610 true))

(declare-fun array_inv!24628 (array!66226) Bool)

(assert (=> start!92610 (array_inv!24628 a!3488)))

(declare-fun b!1051609 () Bool)

(declare-fun e!596824 () Bool)

(assert (=> b!1051609 (= e!596824 true)))

(assert (=> b!1051609 false))

(declare-datatypes ((Unit!34381 0))(
  ( (Unit!34382) )
))
(declare-fun lt!464385 () Unit!34381)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66226 (_ BitVec 64) (_ BitVec 32) List!22128) Unit!34381)

(assert (=> b!1051609 (= lt!464385 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22125))))

(assert (=> b!1051609 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!464387 () Unit!34381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34381)

(assert (=> b!1051609 (= lt!464387 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464386 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1051609 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22125)))

(declare-fun lt!464383 () Unit!34381)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66226 (_ BitVec 32) (_ BitVec 32)) Unit!34381)

(assert (=> b!1051609 (= lt!464383 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1051610 () Bool)

(declare-fun e!596825 () Bool)

(assert (=> b!1051610 (= e!596825 e!596830)))

(declare-fun res!699931 () Bool)

(assert (=> b!1051610 (=> res!699931 e!596830)))

(assert (=> b!1051610 (= res!699931 (bvsle lt!464386 i!1381))))

(declare-fun b!1051611 () Bool)

(assert (=> b!1051611 (= e!596828 (not e!596824))))

(declare-fun res!699932 () Bool)

(assert (=> b!1051611 (=> res!699932 e!596824)))

(assert (=> b!1051611 (= res!699932 (bvsle lt!464386 i!1381))))

(assert (=> b!1051611 e!596825))

(declare-fun res!699927 () Bool)

(assert (=> b!1051611 (=> (not res!699927) (not e!596825))))

(assert (=> b!1051611 (= res!699927 (= (select (store (arr!31846 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464386) k0!2747))))

(assert (= (and start!92610 res!699925) b!1051606))

(assert (= (and b!1051606 res!699928) b!1051605))

(assert (= (and b!1051605 res!699929) b!1051607))

(assert (= (and b!1051607 res!699924) b!1051604))

(assert (= (and b!1051604 res!699926) b!1051603))

(assert (= (and b!1051603 res!699930) b!1051611))

(assert (= (and b!1051611 res!699927) b!1051610))

(assert (= (and b!1051610 (not res!699931)) b!1051608))

(assert (= (and b!1051611 (not res!699932)) b!1051609))

(declare-fun m!972629 () Bool)

(assert (=> b!1051609 m!972629))

(declare-fun m!972631 () Bool)

(assert (=> b!1051609 m!972631))

(declare-fun m!972633 () Bool)

(assert (=> b!1051609 m!972633))

(declare-fun m!972635 () Bool)

(assert (=> b!1051609 m!972635))

(declare-fun m!972637 () Bool)

(assert (=> b!1051609 m!972637))

(declare-fun m!972639 () Bool)

(assert (=> b!1051606 m!972639))

(declare-fun m!972641 () Bool)

(assert (=> b!1051608 m!972641))

(declare-fun m!972643 () Bool)

(assert (=> start!92610 m!972643))

(declare-fun m!972645 () Bool)

(assert (=> b!1051604 m!972645))

(declare-fun m!972647 () Bool)

(assert (=> b!1051604 m!972647))

(declare-fun m!972649 () Bool)

(assert (=> b!1051603 m!972649))

(assert (=> b!1051611 m!972647))

(declare-fun m!972651 () Bool)

(assert (=> b!1051611 m!972651))

(declare-fun m!972653 () Bool)

(assert (=> b!1051605 m!972653))

(declare-fun m!972655 () Bool)

(assert (=> b!1051607 m!972655))

(check-sat (not b!1051605) (not b!1051603) (not b!1051608) (not b!1051606) (not b!1051609) (not start!92610) (not b!1051604))
(check-sat)
