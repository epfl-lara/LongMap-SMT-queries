; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93084 () Bool)

(assert start!93084)

(declare-fun res!703897 () Bool)

(declare-fun e!599904 () Bool)

(assert (=> start!93084 (=> (not res!703897) (not e!599904))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66559 0))(
  ( (array!66560 (arr!32005 (Array (_ BitVec 32) (_ BitVec 64))) (size!32542 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66559)

(assert (=> start!93084 (= res!703897 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32542 a!3488)) (bvslt (size!32542 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93084 e!599904))

(assert (=> start!93084 true))

(declare-fun array_inv!24787 (array!66559) Bool)

(assert (=> start!93084 (array_inv!24787 a!3488)))

(declare-fun e!599899 () Bool)

(declare-fun b!1055761 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!465928 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055761 (= e!599899 (arrayContainsKey!0 a!3488 k0!2747 lt!465928))))

(declare-fun b!1055762 () Bool)

(declare-fun e!599903 () Bool)

(assert (=> b!1055762 (= e!599903 true)))

(declare-datatypes ((List!22287 0))(
  ( (Nil!22284) (Cons!22283 (h!23501 (_ BitVec 64)) (t!31586 List!22287)) )
))
(declare-fun arrayNoDuplicates!0 (array!66559 (_ BitVec 32) List!22287) Bool)

(assert (=> b!1055762 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22284)))

(declare-datatypes ((Unit!34537 0))(
  ( (Unit!34538) )
))
(declare-fun lt!465929 () Unit!34537)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66559 (_ BitVec 32) (_ BitVec 32)) Unit!34537)

(assert (=> b!1055762 (= lt!465929 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055763 () Bool)

(declare-fun e!599905 () Bool)

(declare-fun e!599900 () Bool)

(assert (=> b!1055763 (= e!599905 e!599900)))

(declare-fun res!703903 () Bool)

(assert (=> b!1055763 (=> (not res!703903) (not e!599900))))

(assert (=> b!1055763 (= res!703903 (not (= lt!465928 i!1381)))))

(declare-fun lt!465927 () array!66559)

(declare-fun arrayScanForKey!0 (array!66559 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055763 (= lt!465928 (arrayScanForKey!0 lt!465927 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055764 () Bool)

(assert (=> b!1055764 (= e!599904 e!599905)))

(declare-fun res!703899 () Bool)

(assert (=> b!1055764 (=> (not res!703899) (not e!599905))))

(assert (=> b!1055764 (= res!703899 (arrayContainsKey!0 lt!465927 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055764 (= lt!465927 (array!66560 (store (arr!32005 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32542 a!3488)))))

(declare-fun b!1055765 () Bool)

(declare-fun res!703904 () Bool)

(assert (=> b!1055765 (=> (not res!703904) (not e!599904))))

(assert (=> b!1055765 (= res!703904 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22284))))

(declare-fun b!1055766 () Bool)

(assert (=> b!1055766 (= e!599900 (not e!599903))))

(declare-fun res!703898 () Bool)

(assert (=> b!1055766 (=> res!703898 e!599903)))

(assert (=> b!1055766 (= res!703898 (bvsle lt!465928 i!1381))))

(declare-fun e!599902 () Bool)

(assert (=> b!1055766 e!599902))

(declare-fun res!703901 () Bool)

(assert (=> b!1055766 (=> (not res!703901) (not e!599902))))

(assert (=> b!1055766 (= res!703901 (= (select (store (arr!32005 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465928) k0!2747))))

(declare-fun b!1055767 () Bool)

(declare-fun res!703896 () Bool)

(assert (=> b!1055767 (=> (not res!703896) (not e!599904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055767 (= res!703896 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055768 () Bool)

(assert (=> b!1055768 (= e!599902 e!599899)))

(declare-fun res!703900 () Bool)

(assert (=> b!1055768 (=> res!703900 e!599899)))

(assert (=> b!1055768 (= res!703900 (bvsle lt!465928 i!1381))))

(declare-fun b!1055769 () Bool)

(declare-fun res!703902 () Bool)

(assert (=> b!1055769 (=> (not res!703902) (not e!599904))))

(assert (=> b!1055769 (= res!703902 (= (select (arr!32005 a!3488) i!1381) k0!2747))))

(assert (= (and start!93084 res!703897) b!1055765))

(assert (= (and b!1055765 res!703904) b!1055767))

(assert (= (and b!1055767 res!703896) b!1055769))

(assert (= (and b!1055769 res!703902) b!1055764))

(assert (= (and b!1055764 res!703899) b!1055763))

(assert (= (and b!1055763 res!703903) b!1055766))

(assert (= (and b!1055766 res!703901) b!1055768))

(assert (= (and b!1055768 (not res!703900)) b!1055761))

(assert (= (and b!1055766 (not res!703898)) b!1055762))

(declare-fun m!976181 () Bool)

(assert (=> b!1055764 m!976181))

(declare-fun m!976183 () Bool)

(assert (=> b!1055764 m!976183))

(declare-fun m!976185 () Bool)

(assert (=> start!93084 m!976185))

(declare-fun m!976187 () Bool)

(assert (=> b!1055762 m!976187))

(declare-fun m!976189 () Bool)

(assert (=> b!1055762 m!976189))

(declare-fun m!976191 () Bool)

(assert (=> b!1055767 m!976191))

(declare-fun m!976193 () Bool)

(assert (=> b!1055763 m!976193))

(assert (=> b!1055766 m!976183))

(declare-fun m!976195 () Bool)

(assert (=> b!1055766 m!976195))

(declare-fun m!976197 () Bool)

(assert (=> b!1055765 m!976197))

(declare-fun m!976199 () Bool)

(assert (=> b!1055761 m!976199))

(declare-fun m!976201 () Bool)

(assert (=> b!1055769 m!976201))

(check-sat (not b!1055767) (not b!1055762) (not b!1055761) (not b!1055765) (not start!93084) (not b!1055763) (not b!1055764))
(check-sat)
