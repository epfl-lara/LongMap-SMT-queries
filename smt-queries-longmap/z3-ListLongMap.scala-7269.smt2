; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92830 () Bool)

(assert start!92830)

(declare-fun b!1054052 () Bool)

(declare-fun e!598781 () Bool)

(declare-fun e!598780 () Bool)

(assert (=> b!1054052 (= e!598781 e!598780)))

(declare-fun res!703076 () Bool)

(assert (=> b!1054052 (=> (not res!703076) (not e!598780))))

(declare-fun lt!465133 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054052 (= res!703076 (not (= lt!465133 i!1381)))))

(declare-datatypes ((array!66431 0))(
  ( (array!66432 (arr!31947 (Array (_ BitVec 32) (_ BitVec 64))) (size!32485 (_ BitVec 32))) )
))
(declare-fun lt!465131 () array!66431)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66431 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054052 (= lt!465133 (arrayScanForKey!0 lt!465131 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054053 () Bool)

(declare-fun res!703084 () Bool)

(declare-fun e!598777 () Bool)

(assert (=> b!1054053 (=> (not res!703084) (not e!598777))))

(declare-fun a!3488 () array!66431)

(assert (=> b!1054053 (= res!703084 (= (select (arr!31947 a!3488) i!1381) k0!2747))))

(declare-fun b!1054054 () Bool)

(declare-fun e!598782 () Bool)

(assert (=> b!1054054 (= e!598782 (or (bvslt lt!465133 #b00000000000000000000000000000000) (bvsge lt!465133 (size!32485 a!3488)) (bvsge (bvadd #b00000000000000000000000000000001 i!1381) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!22318 0))(
  ( (Nil!22315) (Cons!22314 (h!23523 (_ BitVec 64)) (t!31616 List!22318)) )
))
(declare-fun arrayNoDuplicates!0 (array!66431 (_ BitVec 32) List!22318) Bool)

(assert (=> b!1054054 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22315)))

(declare-datatypes ((Unit!34385 0))(
  ( (Unit!34386) )
))
(declare-fun lt!465132 () Unit!34385)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66431 (_ BitVec 32) (_ BitVec 32)) Unit!34385)

(assert (=> b!1054054 (= lt!465132 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054055 () Bool)

(assert (=> b!1054055 (= e!598780 (not e!598782))))

(declare-fun res!703079 () Bool)

(assert (=> b!1054055 (=> res!703079 e!598782)))

(assert (=> b!1054055 (= res!703079 (bvsle lt!465133 i!1381))))

(declare-fun e!598779 () Bool)

(assert (=> b!1054055 e!598779))

(declare-fun res!703082 () Bool)

(assert (=> b!1054055 (=> (not res!703082) (not e!598779))))

(assert (=> b!1054055 (= res!703082 (= (select (store (arr!31947 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465133) k0!2747))))

(declare-fun b!1054056 () Bool)

(declare-fun res!703080 () Bool)

(assert (=> b!1054056 (=> (not res!703080) (not e!598777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054056 (= res!703080 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054057 () Bool)

(assert (=> b!1054057 (= e!598777 e!598781)))

(declare-fun res!703081 () Bool)

(assert (=> b!1054057 (=> (not res!703081) (not e!598781))))

(declare-fun arrayContainsKey!0 (array!66431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054057 (= res!703081 (arrayContainsKey!0 lt!465131 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054057 (= lt!465131 (array!66432 (store (arr!31947 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32485 a!3488)))))

(declare-fun b!1054059 () Bool)

(declare-fun res!703077 () Bool)

(assert (=> b!1054059 (=> (not res!703077) (not e!598777))))

(assert (=> b!1054059 (= res!703077 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22315))))

(declare-fun b!1054060 () Bool)

(declare-fun e!598776 () Bool)

(assert (=> b!1054060 (= e!598779 e!598776)))

(declare-fun res!703083 () Bool)

(assert (=> b!1054060 (=> res!703083 e!598776)))

(assert (=> b!1054060 (= res!703083 (bvsle lt!465133 i!1381))))

(declare-fun b!1054058 () Bool)

(assert (=> b!1054058 (= e!598776 (arrayContainsKey!0 a!3488 k0!2747 lt!465133))))

(declare-fun res!703078 () Bool)

(assert (=> start!92830 (=> (not res!703078) (not e!598777))))

(assert (=> start!92830 (= res!703078 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32485 a!3488)) (bvslt (size!32485 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92830 e!598777))

(assert (=> start!92830 true))

(declare-fun array_inv!24730 (array!66431) Bool)

(assert (=> start!92830 (array_inv!24730 a!3488)))

(assert (= (and start!92830 res!703078) b!1054059))

(assert (= (and b!1054059 res!703077) b!1054056))

(assert (= (and b!1054056 res!703080) b!1054053))

(assert (= (and b!1054053 res!703084) b!1054057))

(assert (= (and b!1054057 res!703081) b!1054052))

(assert (= (and b!1054052 res!703076) b!1054055))

(assert (= (and b!1054055 res!703082) b!1054060))

(assert (= (and b!1054060 (not res!703083)) b!1054058))

(assert (= (and b!1054055 (not res!703079)) b!1054054))

(declare-fun m!973699 () Bool)

(assert (=> start!92830 m!973699))

(declare-fun m!973701 () Bool)

(assert (=> b!1054058 m!973701))

(declare-fun m!973703 () Bool)

(assert (=> b!1054054 m!973703))

(declare-fun m!973705 () Bool)

(assert (=> b!1054054 m!973705))

(declare-fun m!973707 () Bool)

(assert (=> b!1054059 m!973707))

(declare-fun m!973709 () Bool)

(assert (=> b!1054057 m!973709))

(declare-fun m!973711 () Bool)

(assert (=> b!1054057 m!973711))

(declare-fun m!973713 () Bool)

(assert (=> b!1054053 m!973713))

(assert (=> b!1054055 m!973711))

(declare-fun m!973715 () Bool)

(assert (=> b!1054055 m!973715))

(declare-fun m!973717 () Bool)

(assert (=> b!1054056 m!973717))

(declare-fun m!973719 () Bool)

(assert (=> b!1054052 m!973719))

(check-sat (not b!1054056) (not b!1054052) (not start!92830) (not b!1054054) (not b!1054059) (not b!1054058) (not b!1054057))
(check-sat)
