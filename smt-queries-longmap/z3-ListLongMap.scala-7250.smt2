; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92560 () Bool)

(assert start!92560)

(declare-fun b!1052706 () Bool)

(declare-fun res!701919 () Bool)

(declare-fun e!597741 () Bool)

(assert (=> b!1052706 (=> (not res!701919) (not e!597741))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052706 (= res!701919 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052707 () Bool)

(declare-fun res!701915 () Bool)

(assert (=> b!1052707 (=> (not res!701915) (not e!597741))))

(declare-datatypes ((array!66302 0))(
  ( (array!66303 (arr!31890 (Array (_ BitVec 32) (_ BitVec 64))) (size!32428 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66302)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052707 (= res!701915 (= (select (arr!31890 a!3488) i!1381) k0!2747))))

(declare-fun b!1052708 () Bool)

(declare-fun e!597739 () Bool)

(assert (=> b!1052708 (= e!597739 (not true))))

(declare-fun lt!464787 () (_ BitVec 32))

(assert (=> b!1052708 (= (select (store (arr!31890 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464787) k0!2747)))

(declare-fun b!1052705 () Bool)

(declare-fun e!597740 () Bool)

(assert (=> b!1052705 (= e!597740 e!597739)))

(declare-fun res!701920 () Bool)

(assert (=> b!1052705 (=> (not res!701920) (not e!597739))))

(assert (=> b!1052705 (= res!701920 (not (= lt!464787 i!1381)))))

(declare-fun lt!464788 () array!66302)

(declare-fun arrayScanForKey!0 (array!66302 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052705 (= lt!464787 (arrayScanForKey!0 lt!464788 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!701917 () Bool)

(assert (=> start!92560 (=> (not res!701917) (not e!597741))))

(assert (=> start!92560 (= res!701917 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32428 a!3488)) (bvslt (size!32428 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92560 e!597741))

(assert (=> start!92560 true))

(declare-fun array_inv!24673 (array!66302) Bool)

(assert (=> start!92560 (array_inv!24673 a!3488)))

(declare-fun b!1052709 () Bool)

(declare-fun res!701916 () Bool)

(assert (=> b!1052709 (=> (not res!701916) (not e!597741))))

(declare-datatypes ((List!22261 0))(
  ( (Nil!22258) (Cons!22257 (h!23466 (_ BitVec 64)) (t!31559 List!22261)) )
))
(declare-fun arrayNoDuplicates!0 (array!66302 (_ BitVec 32) List!22261) Bool)

(assert (=> b!1052709 (= res!701916 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22258))))

(declare-fun b!1052710 () Bool)

(assert (=> b!1052710 (= e!597741 e!597740)))

(declare-fun res!701918 () Bool)

(assert (=> b!1052710 (=> (not res!701918) (not e!597740))))

(declare-fun arrayContainsKey!0 (array!66302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052710 (= res!701918 (arrayContainsKey!0 lt!464788 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052710 (= lt!464788 (array!66303 (store (arr!31890 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32428 a!3488)))))

(assert (= (and start!92560 res!701917) b!1052709))

(assert (= (and b!1052709 res!701916) b!1052706))

(assert (= (and b!1052706 res!701919) b!1052707))

(assert (= (and b!1052707 res!701915) b!1052710))

(assert (= (and b!1052710 res!701918) b!1052705))

(assert (= (and b!1052705 res!701920) b!1052708))

(declare-fun m!972637 () Bool)

(assert (=> b!1052708 m!972637))

(declare-fun m!972639 () Bool)

(assert (=> b!1052708 m!972639))

(declare-fun m!972641 () Bool)

(assert (=> b!1052707 m!972641))

(declare-fun m!972643 () Bool)

(assert (=> b!1052705 m!972643))

(declare-fun m!972645 () Bool)

(assert (=> b!1052709 m!972645))

(declare-fun m!972647 () Bool)

(assert (=> b!1052706 m!972647))

(declare-fun m!972649 () Bool)

(assert (=> start!92560 m!972649))

(declare-fun m!972651 () Bool)

(assert (=> b!1052710 m!972651))

(assert (=> b!1052710 m!972637))

(check-sat (not b!1052710) (not b!1052706) (not b!1052705) (not b!1052709) (not start!92560))
(check-sat)
