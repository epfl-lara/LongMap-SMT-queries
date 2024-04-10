; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92476 () Bool)

(assert start!92476)

(declare-fun b!1051512 () Bool)

(declare-fun e!596906 () Bool)

(declare-fun e!596909 () Bool)

(assert (=> b!1051512 (= e!596906 (not e!596909))))

(declare-fun res!700639 () Bool)

(assert (=> b!1051512 (=> res!700639 e!596909)))

(declare-fun lt!464298 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051512 (= res!700639 (or (bvsgt lt!464298 i!1381) (bvsle i!1381 lt!464298)))))

(declare-fun e!596908 () Bool)

(assert (=> b!1051512 e!596908))

(declare-fun res!700638 () Bool)

(assert (=> b!1051512 (=> (not res!700638) (not e!596908))))

(declare-datatypes ((array!66277 0))(
  ( (array!66278 (arr!31878 (Array (_ BitVec 32) (_ BitVec 64))) (size!32414 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66277)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1051512 (= res!700638 (= (select (store (arr!31878 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464298) k!2747))))

(declare-fun b!1051513 () Bool)

(declare-fun res!700641 () Bool)

(declare-fun e!596910 () Bool)

(assert (=> b!1051513 (=> (not res!700641) (not e!596910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051513 (= res!700641 (validKeyInArray!0 k!2747))))

(declare-fun b!1051514 () Bool)

(declare-fun e!596905 () Bool)

(assert (=> b!1051514 (= e!596910 e!596905)))

(declare-fun res!700642 () Bool)

(assert (=> b!1051514 (=> (not res!700642) (not e!596905))))

(declare-fun lt!464297 () array!66277)

(declare-fun arrayContainsKey!0 (array!66277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051514 (= res!700642 (arrayContainsKey!0 lt!464297 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051514 (= lt!464297 (array!66278 (store (arr!31878 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32414 a!3488)))))

(declare-fun b!1051515 () Bool)

(assert (=> b!1051515 (= e!596909 true)))

(declare-datatypes ((List!22190 0))(
  ( (Nil!22187) (Cons!22186 (h!23395 (_ BitVec 64)) (t!31497 List!22190)) )
))
(declare-fun arrayNoDuplicates!0 (array!66277 (_ BitVec 32) List!22190) Bool)

(assert (=> b!1051515 (arrayNoDuplicates!0 a!3488 lt!464298 Nil!22187)))

(declare-datatypes ((Unit!34428 0))(
  ( (Unit!34429) )
))
(declare-fun lt!464296 () Unit!34428)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66277 (_ BitVec 32) (_ BitVec 32)) Unit!34428)

(assert (=> b!1051515 (= lt!464296 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464298))))

(declare-fun b!1051516 () Bool)

(declare-fun e!596907 () Bool)

(assert (=> b!1051516 (= e!596907 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051517 () Bool)

(declare-fun res!700644 () Bool)

(assert (=> b!1051517 (=> (not res!700644) (not e!596910))))

(assert (=> b!1051517 (= res!700644 (= (select (arr!31878 a!3488) i!1381) k!2747))))

(declare-fun b!1051518 () Bool)

(declare-fun res!700643 () Bool)

(assert (=> b!1051518 (=> (not res!700643) (not e!596910))))

(assert (=> b!1051518 (= res!700643 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22187))))

(declare-fun res!700646 () Bool)

(assert (=> start!92476 (=> (not res!700646) (not e!596910))))

(assert (=> start!92476 (= res!700646 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32414 a!3488)) (bvslt (size!32414 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92476 e!596910))

(assert (=> start!92476 true))

(declare-fun array_inv!24658 (array!66277) Bool)

(assert (=> start!92476 (array_inv!24658 a!3488)))

(declare-fun b!1051519 () Bool)

(assert (=> b!1051519 (= e!596905 e!596906)))

(declare-fun res!700645 () Bool)

(assert (=> b!1051519 (=> (not res!700645) (not e!596906))))

(assert (=> b!1051519 (= res!700645 (not (= lt!464298 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66277 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051519 (= lt!464298 (arrayScanForKey!0 lt!464297 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051520 () Bool)

(assert (=> b!1051520 (= e!596908 e!596907)))

(declare-fun res!700640 () Bool)

(assert (=> b!1051520 (=> res!700640 e!596907)))

(assert (=> b!1051520 (= res!700640 (or (bvsgt lt!464298 i!1381) (bvsle i!1381 lt!464298)))))

(assert (= (and start!92476 res!700646) b!1051518))

(assert (= (and b!1051518 res!700643) b!1051513))

(assert (= (and b!1051513 res!700641) b!1051517))

(assert (= (and b!1051517 res!700644) b!1051514))

(assert (= (and b!1051514 res!700642) b!1051519))

(assert (= (and b!1051519 res!700645) b!1051512))

(assert (= (and b!1051512 res!700638) b!1051520))

(assert (= (and b!1051520 (not res!700640)) b!1051516))

(assert (= (and b!1051512 (not res!700639)) b!1051515))

(declare-fun m!972001 () Bool)

(assert (=> b!1051516 m!972001))

(declare-fun m!972003 () Bool)

(assert (=> b!1051515 m!972003))

(declare-fun m!972005 () Bool)

(assert (=> b!1051515 m!972005))

(declare-fun m!972007 () Bool)

(assert (=> b!1051517 m!972007))

(declare-fun m!972009 () Bool)

(assert (=> b!1051512 m!972009))

(declare-fun m!972011 () Bool)

(assert (=> b!1051512 m!972011))

(declare-fun m!972013 () Bool)

(assert (=> b!1051513 m!972013))

(declare-fun m!972015 () Bool)

(assert (=> b!1051518 m!972015))

(declare-fun m!972017 () Bool)

(assert (=> b!1051519 m!972017))

(declare-fun m!972019 () Bool)

(assert (=> start!92476 m!972019))

(declare-fun m!972021 () Bool)

(assert (=> b!1051514 m!972021))

(assert (=> b!1051514 m!972009))

(push 1)

(assert (not b!1051513))

(assert (not start!92476))

