; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92468 () Bool)

(assert start!92468)

(declare-fun b!1051404 () Bool)

(declare-fun e!596823 () Bool)

(declare-fun e!596825 () Bool)

(assert (=> b!1051404 (= e!596823 (not e!596825))))

(declare-fun res!700538 () Bool)

(assert (=> b!1051404 (=> res!700538 e!596825)))

(declare-fun lt!464260 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051404 (= res!700538 (or (bvsgt lt!464260 i!1381) (bvsle i!1381 lt!464260)))))

(declare-fun e!596822 () Bool)

(assert (=> b!1051404 e!596822))

(declare-fun res!700537 () Bool)

(assert (=> b!1051404 (=> (not res!700537) (not e!596822))))

(declare-datatypes ((array!66269 0))(
  ( (array!66270 (arr!31874 (Array (_ BitVec 32) (_ BitVec 64))) (size!32410 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66269)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1051404 (= res!700537 (= (select (store (arr!31874 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464260) k0!2747))))

(declare-fun res!700534 () Bool)

(declare-fun e!596826 () Bool)

(assert (=> start!92468 (=> (not res!700534) (not e!596826))))

(assert (=> start!92468 (= res!700534 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32410 a!3488)) (bvslt (size!32410 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92468 e!596826))

(assert (=> start!92468 true))

(declare-fun array_inv!24654 (array!66269) Bool)

(assert (=> start!92468 (array_inv!24654 a!3488)))

(declare-fun b!1051405 () Bool)

(declare-fun e!596821 () Bool)

(assert (=> b!1051405 (= e!596821 e!596823)))

(declare-fun res!700535 () Bool)

(assert (=> b!1051405 (=> (not res!700535) (not e!596823))))

(assert (=> b!1051405 (= res!700535 (not (= lt!464260 i!1381)))))

(declare-fun lt!464261 () array!66269)

(declare-fun arrayScanForKey!0 (array!66269 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051405 (= lt!464260 (arrayScanForKey!0 lt!464261 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051406 () Bool)

(assert (=> b!1051406 (= e!596825 true)))

(declare-datatypes ((List!22186 0))(
  ( (Nil!22183) (Cons!22182 (h!23391 (_ BitVec 64)) (t!31493 List!22186)) )
))
(declare-fun arrayNoDuplicates!0 (array!66269 (_ BitVec 32) List!22186) Bool)

(assert (=> b!1051406 (arrayNoDuplicates!0 a!3488 lt!464260 Nil!22183)))

(declare-datatypes ((Unit!34420 0))(
  ( (Unit!34421) )
))
(declare-fun lt!464262 () Unit!34420)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66269 (_ BitVec 32) (_ BitVec 32)) Unit!34420)

(assert (=> b!1051406 (= lt!464262 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464260))))

(declare-fun b!1051407 () Bool)

(declare-fun res!700530 () Bool)

(assert (=> b!1051407 (=> (not res!700530) (not e!596826))))

(assert (=> b!1051407 (= res!700530 (= (select (arr!31874 a!3488) i!1381) k0!2747))))

(declare-fun b!1051408 () Bool)

(declare-fun res!700532 () Bool)

(assert (=> b!1051408 (=> (not res!700532) (not e!596826))))

(assert (=> b!1051408 (= res!700532 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22183))))

(declare-fun b!1051409 () Bool)

(assert (=> b!1051409 (= e!596826 e!596821)))

(declare-fun res!700531 () Bool)

(assert (=> b!1051409 (=> (not res!700531) (not e!596821))))

(declare-fun arrayContainsKey!0 (array!66269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051409 (= res!700531 (arrayContainsKey!0 lt!464261 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051409 (= lt!464261 (array!66270 (store (arr!31874 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32410 a!3488)))))

(declare-fun b!1051410 () Bool)

(declare-fun e!596824 () Bool)

(assert (=> b!1051410 (= e!596824 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051411 () Bool)

(assert (=> b!1051411 (= e!596822 e!596824)))

(declare-fun res!700533 () Bool)

(assert (=> b!1051411 (=> res!700533 e!596824)))

(assert (=> b!1051411 (= res!700533 (or (bvsgt lt!464260 i!1381) (bvsle i!1381 lt!464260)))))

(declare-fun b!1051412 () Bool)

(declare-fun res!700536 () Bool)

(assert (=> b!1051412 (=> (not res!700536) (not e!596826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051412 (= res!700536 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92468 res!700534) b!1051408))

(assert (= (and b!1051408 res!700532) b!1051412))

(assert (= (and b!1051412 res!700536) b!1051407))

(assert (= (and b!1051407 res!700530) b!1051409))

(assert (= (and b!1051409 res!700531) b!1051405))

(assert (= (and b!1051405 res!700535) b!1051404))

(assert (= (and b!1051404 res!700537) b!1051411))

(assert (= (and b!1051411 (not res!700533)) b!1051410))

(assert (= (and b!1051404 (not res!700538)) b!1051406))

(declare-fun m!971913 () Bool)

(assert (=> b!1051404 m!971913))

(declare-fun m!971915 () Bool)

(assert (=> b!1051404 m!971915))

(declare-fun m!971917 () Bool)

(assert (=> b!1051407 m!971917))

(declare-fun m!971919 () Bool)

(assert (=> start!92468 m!971919))

(declare-fun m!971921 () Bool)

(assert (=> b!1051410 m!971921))

(declare-fun m!971923 () Bool)

(assert (=> b!1051408 m!971923))

(declare-fun m!971925 () Bool)

(assert (=> b!1051406 m!971925))

(declare-fun m!971927 () Bool)

(assert (=> b!1051406 m!971927))

(declare-fun m!971929 () Bool)

(assert (=> b!1051409 m!971929))

(assert (=> b!1051409 m!971913))

(declare-fun m!971931 () Bool)

(assert (=> b!1051405 m!971931))

(declare-fun m!971933 () Bool)

(assert (=> b!1051412 m!971933))

(check-sat (not b!1051405) (not b!1051408) (not start!92468) (not b!1051409) (not b!1051412) (not b!1051406) (not b!1051410))
(check-sat)
