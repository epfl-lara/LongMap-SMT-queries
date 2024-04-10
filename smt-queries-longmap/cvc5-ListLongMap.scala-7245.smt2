; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92532 () Bool)

(assert start!92532)

(declare-fun b!1052511 () Bool)

(declare-fun res!701640 () Bool)

(declare-fun e!597578 () Bool)

(assert (=> b!1052511 (=> (not res!701640) (not e!597578))))

(declare-datatypes ((array!66333 0))(
  ( (array!66334 (arr!31906 (Array (_ BitVec 32) (_ BitVec 64))) (size!32442 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66333)

(declare-datatypes ((List!22218 0))(
  ( (Nil!22215) (Cons!22214 (h!23423 (_ BitVec 64)) (t!31525 List!22218)) )
))
(declare-fun arrayNoDuplicates!0 (array!66333 (_ BitVec 32) List!22218) Bool)

(assert (=> b!1052511 (= res!701640 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22215))))

(declare-fun b!1052512 () Bool)

(declare-fun e!597579 () Bool)

(declare-fun e!597575 () Bool)

(assert (=> b!1052512 (= e!597579 (not e!597575))))

(declare-fun res!701643 () Bool)

(assert (=> b!1052512 (=> res!701643 e!597575)))

(declare-fun lt!464798 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052512 (= res!701643 (or (bvsgt lt!464798 i!1381) (bvsle i!1381 lt!464798)))))

(declare-fun e!597576 () Bool)

(assert (=> b!1052512 e!597576))

(declare-fun res!701637 () Bool)

(assert (=> b!1052512 (=> (not res!701637) (not e!597576))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1052512 (= res!701637 (= (select (store (arr!31906 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464798) k!2747))))

(declare-fun b!1052513 () Bool)

(declare-fun res!701639 () Bool)

(assert (=> b!1052513 (=> (not res!701639) (not e!597578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052513 (= res!701639 (validKeyInArray!0 k!2747))))

(declare-fun b!1052514 () Bool)

(declare-fun e!597577 () Bool)

(assert (=> b!1052514 (= e!597577 e!597579)))

(declare-fun res!701638 () Bool)

(assert (=> b!1052514 (=> (not res!701638) (not e!597579))))

(assert (=> b!1052514 (= res!701638 (not (= lt!464798 i!1381)))))

(declare-fun lt!464800 () array!66333)

(declare-fun arrayScanForKey!0 (array!66333 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052514 (= lt!464798 (arrayScanForKey!0 lt!464800 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052515 () Bool)

(assert (=> b!1052515 (= e!597575 true)))

(assert (=> b!1052515 (not (= (select (arr!31906 a!3488) lt!464798) k!2747))))

(declare-datatypes ((Unit!34484 0))(
  ( (Unit!34485) )
))
(declare-fun lt!464802 () Unit!34484)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66333 (_ BitVec 64) (_ BitVec 32) List!22218) Unit!34484)

(assert (=> b!1052515 (= lt!464802 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!464798 Nil!22215))))

(declare-fun lt!464799 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052515 (arrayContainsKey!0 a!3488 k!2747 lt!464799)))

(declare-fun lt!464797 () Unit!34484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34484)

(assert (=> b!1052515 (= lt!464797 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464799))))

(assert (=> b!1052515 (= lt!464799 (bvadd #b00000000000000000000000000000001 lt!464798))))

(assert (=> b!1052515 (arrayNoDuplicates!0 a!3488 lt!464798 Nil!22215)))

(declare-fun lt!464801 () Unit!34484)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66333 (_ BitVec 32) (_ BitVec 32)) Unit!34484)

(assert (=> b!1052515 (= lt!464801 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464798))))

(declare-fun b!1052517 () Bool)

(declare-fun res!701641 () Bool)

(assert (=> b!1052517 (=> (not res!701641) (not e!597578))))

(assert (=> b!1052517 (= res!701641 (= (select (arr!31906 a!3488) i!1381) k!2747))))

(declare-fun b!1052518 () Bool)

(declare-fun e!597580 () Bool)

(assert (=> b!1052518 (= e!597580 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052519 () Bool)

(assert (=> b!1052519 (= e!597576 e!597580)))

(declare-fun res!701642 () Bool)

(assert (=> b!1052519 (=> res!701642 e!597580)))

(assert (=> b!1052519 (= res!701642 (or (bvsgt lt!464798 i!1381) (bvsle i!1381 lt!464798)))))

(declare-fun b!1052516 () Bool)

(assert (=> b!1052516 (= e!597578 e!597577)))

(declare-fun res!701645 () Bool)

(assert (=> b!1052516 (=> (not res!701645) (not e!597577))))

(assert (=> b!1052516 (= res!701645 (arrayContainsKey!0 lt!464800 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052516 (= lt!464800 (array!66334 (store (arr!31906 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32442 a!3488)))))

(declare-fun res!701644 () Bool)

(assert (=> start!92532 (=> (not res!701644) (not e!597578))))

(assert (=> start!92532 (= res!701644 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32442 a!3488)) (bvslt (size!32442 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92532 e!597578))

(assert (=> start!92532 true))

(declare-fun array_inv!24686 (array!66333) Bool)

(assert (=> start!92532 (array_inv!24686 a!3488)))

(assert (= (and start!92532 res!701644) b!1052511))

(assert (= (and b!1052511 res!701640) b!1052513))

(assert (= (and b!1052513 res!701639) b!1052517))

(assert (= (and b!1052517 res!701641) b!1052516))

(assert (= (and b!1052516 res!701645) b!1052514))

(assert (= (and b!1052514 res!701638) b!1052512))

(assert (= (and b!1052512 res!701637) b!1052519))

(assert (= (and b!1052519 (not res!701642)) b!1052518))

(assert (= (and b!1052512 (not res!701643)) b!1052515))

(declare-fun m!972887 () Bool)

(assert (=> b!1052517 m!972887))

(declare-fun m!972889 () Bool)

(assert (=> start!92532 m!972889))

(declare-fun m!972891 () Bool)

(assert (=> b!1052515 m!972891))

(declare-fun m!972893 () Bool)

(assert (=> b!1052515 m!972893))

(declare-fun m!972895 () Bool)

(assert (=> b!1052515 m!972895))

(declare-fun m!972897 () Bool)

(assert (=> b!1052515 m!972897))

(declare-fun m!972899 () Bool)

(assert (=> b!1052515 m!972899))

(declare-fun m!972901 () Bool)

(assert (=> b!1052515 m!972901))

(declare-fun m!972903 () Bool)

(assert (=> b!1052516 m!972903))

(declare-fun m!972905 () Bool)

(assert (=> b!1052516 m!972905))

(declare-fun m!972907 () Bool)

(assert (=> b!1052518 m!972907))

(assert (=> b!1052512 m!972905))

(declare-fun m!972909 () Bool)

(assert (=> b!1052512 m!972909))

(declare-fun m!972911 () Bool)

(assert (=> b!1052514 m!972911))

(declare-fun m!972913 () Bool)

(assert (=> b!1052513 m!972913))

(declare-fun m!972915 () Bool)

(assert (=> b!1052511 m!972915))

(push 1)

