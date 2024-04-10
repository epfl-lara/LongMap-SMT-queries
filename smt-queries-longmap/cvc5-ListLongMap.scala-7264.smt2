; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92766 () Bool)

(assert start!92766)

(declare-fun b!1053721 () Bool)

(declare-fun e!598499 () Bool)

(declare-fun e!598496 () Bool)

(assert (=> b!1053721 (= e!598499 e!598496)))

(declare-fun res!702707 () Bool)

(assert (=> b!1053721 (=> res!702707 e!598496)))

(declare-fun lt!465203 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053721 (= res!702707 (bvsle lt!465203 i!1381))))

(declare-fun b!1053722 () Bool)

(declare-fun e!598497 () Bool)

(declare-fun e!598498 () Bool)

(assert (=> b!1053722 (= e!598497 e!598498)))

(declare-fun res!702705 () Bool)

(assert (=> b!1053722 (=> (not res!702705) (not e!598498))))

(declare-datatypes ((array!66459 0))(
  ( (array!66460 (arr!31963 (Array (_ BitVec 32) (_ BitVec 64))) (size!32499 (_ BitVec 32))) )
))
(declare-fun lt!465204 () array!66459)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053722 (= res!702705 (arrayContainsKey!0 lt!465204 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66459)

(assert (=> b!1053722 (= lt!465204 (array!66460 (store (arr!31963 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32499 a!3488)))))

(declare-fun res!702710 () Bool)

(assert (=> start!92766 (=> (not res!702710) (not e!598497))))

(assert (=> start!92766 (= res!702710 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32499 a!3488)) (bvslt (size!32499 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92766 e!598497))

(assert (=> start!92766 true))

(declare-fun array_inv!24743 (array!66459) Bool)

(assert (=> start!92766 (array_inv!24743 a!3488)))

(declare-fun b!1053723 () Bool)

(assert (=> b!1053723 (= e!598496 (arrayContainsKey!0 a!3488 k!2747 lt!465203))))

(declare-fun b!1053724 () Bool)

(declare-fun res!702709 () Bool)

(assert (=> b!1053724 (=> (not res!702709) (not e!598497))))

(assert (=> b!1053724 (= res!702709 (= (select (arr!31963 a!3488) i!1381) k!2747))))

(declare-fun b!1053725 () Bool)

(declare-fun res!702706 () Bool)

(assert (=> b!1053725 (=> (not res!702706) (not e!598497))))

(declare-datatypes ((List!22275 0))(
  ( (Nil!22272) (Cons!22271 (h!23480 (_ BitVec 64)) (t!31582 List!22275)) )
))
(declare-fun arrayNoDuplicates!0 (array!66459 (_ BitVec 32) List!22275) Bool)

(assert (=> b!1053725 (= res!702706 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22272))))

(declare-fun b!1053726 () Bool)

(declare-fun e!598501 () Bool)

(assert (=> b!1053726 (= e!598498 e!598501)))

(declare-fun res!702708 () Bool)

(assert (=> b!1053726 (=> (not res!702708) (not e!598501))))

(assert (=> b!1053726 (= res!702708 (not (= lt!465203 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66459 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053726 (= lt!465203 (arrayScanForKey!0 lt!465204 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053727 () Bool)

(declare-fun res!702703 () Bool)

(assert (=> b!1053727 (=> (not res!702703) (not e!598497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053727 (= res!702703 (validKeyInArray!0 k!2747))))

(declare-fun b!1053728 () Bool)

(assert (=> b!1053728 (= e!598501 (not (or (bvsle lt!465203 i!1381) (bvsle #b00000000000000000000000000000000 (size!32499 a!3488)))))))

(assert (=> b!1053728 e!598499))

(declare-fun res!702704 () Bool)

(assert (=> b!1053728 (=> (not res!702704) (not e!598499))))

(assert (=> b!1053728 (= res!702704 (= (select (store (arr!31963 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465203) k!2747))))

(assert (= (and start!92766 res!702710) b!1053725))

(assert (= (and b!1053725 res!702706) b!1053727))

(assert (= (and b!1053727 res!702703) b!1053724))

(assert (= (and b!1053724 res!702709) b!1053722))

(assert (= (and b!1053722 res!702705) b!1053726))

(assert (= (and b!1053726 res!702708) b!1053728))

(assert (= (and b!1053728 res!702704) b!1053721))

(assert (= (and b!1053721 (not res!702707)) b!1053723))

(declare-fun m!973937 () Bool)

(assert (=> b!1053722 m!973937))

(declare-fun m!973939 () Bool)

(assert (=> b!1053722 m!973939))

(declare-fun m!973941 () Bool)

(assert (=> b!1053723 m!973941))

(declare-fun m!973943 () Bool)

(assert (=> b!1053725 m!973943))

(declare-fun m!973945 () Bool)

(assert (=> b!1053727 m!973945))

(assert (=> b!1053728 m!973939))

(declare-fun m!973947 () Bool)

(assert (=> b!1053728 m!973947))

(declare-fun m!973949 () Bool)

(assert (=> b!1053726 m!973949))

(declare-fun m!973951 () Bool)

(assert (=> b!1053724 m!973951))

(declare-fun m!973953 () Bool)

(assert (=> start!92766 m!973953))

(push 1)

