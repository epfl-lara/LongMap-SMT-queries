; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92454 () Bool)

(assert start!92454)

(declare-fun b!1051215 () Bool)

(declare-fun e!596677 () Bool)

(assert (=> b!1051215 (= e!596677 true)))

(declare-datatypes ((array!66255 0))(
  ( (array!66256 (arr!31867 (Array (_ BitVec 32) (_ BitVec 64))) (size!32403 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66255)

(declare-fun lt!464197 () (_ BitVec 32))

(declare-datatypes ((List!22179 0))(
  ( (Nil!22176) (Cons!22175 (h!23384 (_ BitVec 64)) (t!31486 List!22179)) )
))
(declare-fun arrayNoDuplicates!0 (array!66255 (_ BitVec 32) List!22179) Bool)

(assert (=> b!1051215 (arrayNoDuplicates!0 a!3488 lt!464197 Nil!22176)))

(declare-datatypes ((Unit!34406 0))(
  ( (Unit!34407) )
))
(declare-fun lt!464198 () Unit!34406)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66255 (_ BitVec 32) (_ BitVec 32)) Unit!34406)

(assert (=> b!1051215 (= lt!464198 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464197))))

(declare-fun b!1051216 () Bool)

(declare-fun res!700349 () Bool)

(declare-fun e!596674 () Bool)

(assert (=> b!1051216 (=> (not res!700349) (not e!596674))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051216 (= res!700349 (validKeyInArray!0 k!2747))))

(declare-fun b!1051217 () Bool)

(declare-fun e!596678 () Bool)

(declare-fun e!596675 () Bool)

(assert (=> b!1051217 (= e!596678 e!596675)))

(declare-fun res!700344 () Bool)

(assert (=> b!1051217 (=> (not res!700344) (not e!596675))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051217 (= res!700344 (not (= lt!464197 i!1381)))))

(declare-fun lt!464199 () array!66255)

(declare-fun arrayScanForKey!0 (array!66255 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051217 (= lt!464197 (arrayScanForKey!0 lt!464199 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051218 () Bool)

(declare-fun res!700343 () Bool)

(assert (=> b!1051218 (=> (not res!700343) (not e!596674))))

(assert (=> b!1051218 (= res!700343 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22176))))

(declare-fun b!1051219 () Bool)

(declare-fun res!700342 () Bool)

(assert (=> b!1051219 (=> (not res!700342) (not e!596674))))

(assert (=> b!1051219 (= res!700342 (= (select (arr!31867 a!3488) i!1381) k!2747))))

(declare-fun b!1051221 () Bool)

(assert (=> b!1051221 (= e!596675 (not e!596677))))

(declare-fun res!700347 () Bool)

(assert (=> b!1051221 (=> res!700347 e!596677)))

(assert (=> b!1051221 (= res!700347 (or (bvsgt lt!464197 i!1381) (bvsle i!1381 lt!464197)))))

(declare-fun e!596680 () Bool)

(assert (=> b!1051221 e!596680))

(declare-fun res!700341 () Bool)

(assert (=> b!1051221 (=> (not res!700341) (not e!596680))))

(assert (=> b!1051221 (= res!700341 (= (select (store (arr!31867 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464197) k!2747))))

(declare-fun b!1051222 () Bool)

(assert (=> b!1051222 (= e!596674 e!596678)))

(declare-fun res!700348 () Bool)

(assert (=> b!1051222 (=> (not res!700348) (not e!596678))))

(declare-fun arrayContainsKey!0 (array!66255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051222 (= res!700348 (arrayContainsKey!0 lt!464199 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051222 (= lt!464199 (array!66256 (store (arr!31867 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32403 a!3488)))))

(declare-fun b!1051223 () Bool)

(declare-fun e!596676 () Bool)

(assert (=> b!1051223 (= e!596680 e!596676)))

(declare-fun res!700346 () Bool)

(assert (=> b!1051223 (=> res!700346 e!596676)))

(assert (=> b!1051223 (= res!700346 (or (bvsgt lt!464197 i!1381) (bvsle i!1381 lt!464197)))))

(declare-fun b!1051220 () Bool)

(assert (=> b!1051220 (= e!596676 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!700345 () Bool)

(assert (=> start!92454 (=> (not res!700345) (not e!596674))))

(assert (=> start!92454 (= res!700345 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32403 a!3488)) (bvslt (size!32403 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92454 e!596674))

(assert (=> start!92454 true))

(declare-fun array_inv!24647 (array!66255) Bool)

(assert (=> start!92454 (array_inv!24647 a!3488)))

(assert (= (and start!92454 res!700345) b!1051218))

(assert (= (and b!1051218 res!700343) b!1051216))

(assert (= (and b!1051216 res!700349) b!1051219))

(assert (= (and b!1051219 res!700342) b!1051222))

(assert (= (and b!1051222 res!700348) b!1051217))

(assert (= (and b!1051217 res!700344) b!1051221))

(assert (= (and b!1051221 res!700341) b!1051223))

(assert (= (and b!1051223 (not res!700346)) b!1051220))

(assert (= (and b!1051221 (not res!700347)) b!1051215))

(declare-fun m!971759 () Bool)

(assert (=> b!1051220 m!971759))

(declare-fun m!971761 () Bool)

(assert (=> start!92454 m!971761))

(declare-fun m!971763 () Bool)

(assert (=> b!1051216 m!971763))

(declare-fun m!971765 () Bool)

(assert (=> b!1051221 m!971765))

(declare-fun m!971767 () Bool)

(assert (=> b!1051221 m!971767))

(declare-fun m!971769 () Bool)

(assert (=> b!1051219 m!971769))

(declare-fun m!971771 () Bool)

(assert (=> b!1051217 m!971771))

(declare-fun m!971773 () Bool)

(assert (=> b!1051222 m!971773))

(assert (=> b!1051222 m!971765))

(declare-fun m!971775 () Bool)

(assert (=> b!1051218 m!971775))

(declare-fun m!971777 () Bool)

(assert (=> b!1051215 m!971777))

(declare-fun m!971779 () Bool)

(assert (=> b!1051215 m!971779))

(push 1)

