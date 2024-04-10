; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92286 () Bool)

(assert start!92286)

(declare-fun b!1048830 () Bool)

(declare-fun res!697962 () Bool)

(declare-fun e!594961 () Bool)

(assert (=> b!1048830 (=> (not res!697962) (not e!594961))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048830 (= res!697962 (validKeyInArray!0 k!2747))))

(declare-fun b!1048831 () Bool)

(declare-fun e!594957 () Bool)

(declare-fun e!594960 () Bool)

(assert (=> b!1048831 (= e!594957 (not e!594960))))

(declare-fun res!697964 () Bool)

(assert (=> b!1048831 (=> res!697964 e!594960)))

(declare-fun lt!463298 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048831 (= res!697964 (bvsle lt!463298 i!1381))))

(declare-fun e!594959 () Bool)

(assert (=> b!1048831 e!594959))

(declare-fun res!697963 () Bool)

(assert (=> b!1048831 (=> (not res!697963) (not e!594959))))

(declare-datatypes ((array!66087 0))(
  ( (array!66088 (arr!31783 (Array (_ BitVec 32) (_ BitVec 64))) (size!32319 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66087)

(assert (=> b!1048831 (= res!697963 (= (select (store (arr!31783 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463298) k!2747))))

(declare-fun b!1048832 () Bool)

(assert (=> b!1048832 (= e!594960 true)))

(declare-datatypes ((List!22095 0))(
  ( (Nil!22092) (Cons!22091 (h!23300 (_ BitVec 64)) (t!31402 List!22095)) )
))
(declare-fun arrayNoDuplicates!0 (array!66087 (_ BitVec 32) List!22095) Bool)

(assert (=> b!1048832 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22092)))

(declare-datatypes ((Unit!34286 0))(
  ( (Unit!34287) )
))
(declare-fun lt!463297 () Unit!34286)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66087 (_ BitVec 32) (_ BitVec 32)) Unit!34286)

(assert (=> b!1048832 (= lt!463297 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048833 () Bool)

(declare-fun res!697956 () Bool)

(assert (=> b!1048833 (=> (not res!697956) (not e!594961))))

(assert (=> b!1048833 (= res!697956 (= (select (arr!31783 a!3488) i!1381) k!2747))))

(declare-fun e!594955 () Bool)

(declare-fun b!1048834 () Bool)

(declare-fun arrayContainsKey!0 (array!66087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048834 (= e!594955 (arrayContainsKey!0 a!3488 k!2747 lt!463298))))

(declare-fun res!697957 () Bool)

(assert (=> start!92286 (=> (not res!697957) (not e!594961))))

(assert (=> start!92286 (= res!697957 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32319 a!3488)) (bvslt (size!32319 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92286 e!594961))

(assert (=> start!92286 true))

(declare-fun array_inv!24563 (array!66087) Bool)

(assert (=> start!92286 (array_inv!24563 a!3488)))

(declare-fun b!1048835 () Bool)

(assert (=> b!1048835 (= e!594959 e!594955)))

(declare-fun res!697961 () Bool)

(assert (=> b!1048835 (=> res!697961 e!594955)))

(assert (=> b!1048835 (= res!697961 (bvsle lt!463298 i!1381))))

(declare-fun b!1048836 () Bool)

(declare-fun e!594958 () Bool)

(assert (=> b!1048836 (= e!594958 e!594957)))

(declare-fun res!697960 () Bool)

(assert (=> b!1048836 (=> (not res!697960) (not e!594957))))

(assert (=> b!1048836 (= res!697960 (not (= lt!463298 i!1381)))))

(declare-fun lt!463299 () array!66087)

(declare-fun arrayScanForKey!0 (array!66087 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048836 (= lt!463298 (arrayScanForKey!0 lt!463299 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048837 () Bool)

(declare-fun res!697959 () Bool)

(assert (=> b!1048837 (=> (not res!697959) (not e!594961))))

(assert (=> b!1048837 (= res!697959 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22092))))

(declare-fun b!1048838 () Bool)

(assert (=> b!1048838 (= e!594961 e!594958)))

(declare-fun res!697958 () Bool)

(assert (=> b!1048838 (=> (not res!697958) (not e!594958))))

(assert (=> b!1048838 (= res!697958 (arrayContainsKey!0 lt!463299 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048838 (= lt!463299 (array!66088 (store (arr!31783 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32319 a!3488)))))

(assert (= (and start!92286 res!697957) b!1048837))

(assert (= (and b!1048837 res!697959) b!1048830))

(assert (= (and b!1048830 res!697962) b!1048833))

(assert (= (and b!1048833 res!697956) b!1048838))

(assert (= (and b!1048838 res!697958) b!1048836))

(assert (= (and b!1048836 res!697960) b!1048831))

(assert (= (and b!1048831 res!697963) b!1048835))

(assert (= (and b!1048835 (not res!697961)) b!1048834))

(assert (= (and b!1048831 (not res!697964)) b!1048832))

(declare-fun m!969701 () Bool)

(assert (=> b!1048833 m!969701))

(declare-fun m!969703 () Bool)

(assert (=> b!1048832 m!969703))

(declare-fun m!969705 () Bool)

(assert (=> b!1048832 m!969705))

(declare-fun m!969707 () Bool)

(assert (=> b!1048834 m!969707))

(declare-fun m!969709 () Bool)

(assert (=> b!1048838 m!969709))

(declare-fun m!969711 () Bool)

(assert (=> b!1048838 m!969711))

(declare-fun m!969713 () Bool)

(assert (=> b!1048836 m!969713))

(declare-fun m!969715 () Bool)

(assert (=> b!1048830 m!969715))

(declare-fun m!969717 () Bool)

(assert (=> start!92286 m!969717))

(assert (=> b!1048831 m!969711))

(declare-fun m!969719 () Bool)

(assert (=> b!1048831 m!969719))

(declare-fun m!969721 () Bool)

(assert (=> b!1048837 m!969721))

(push 1)

