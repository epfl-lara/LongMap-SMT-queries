; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92290 () Bool)

(assert start!92290)

(declare-fun e!595003 () Bool)

(declare-datatypes ((array!66091 0))(
  ( (array!66092 (arr!31785 (Array (_ BitVec 32) (_ BitVec 64))) (size!32321 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66091)

(declare-fun lt!463317 () (_ BitVec 32))

(declare-fun b!1048884 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048884 (= e!595003 (arrayContainsKey!0 a!3488 k!2747 lt!463317))))

(declare-fun b!1048885 () Bool)

(declare-fun e!594998 () Bool)

(declare-fun e!594997 () Bool)

(assert (=> b!1048885 (= e!594998 e!594997)))

(declare-fun res!698012 () Bool)

(assert (=> b!1048885 (=> (not res!698012) (not e!594997))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048885 (= res!698012 (not (= lt!463317 i!1381)))))

(declare-fun lt!463316 () array!66091)

(declare-fun arrayScanForKey!0 (array!66091 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048885 (= lt!463317 (arrayScanForKey!0 lt!463316 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048886 () Bool)

(declare-fun e!594999 () Bool)

(assert (=> b!1048886 (= e!594997 (not e!594999))))

(declare-fun res!698015 () Bool)

(assert (=> b!1048886 (=> res!698015 e!594999)))

(assert (=> b!1048886 (= res!698015 (bvsle lt!463317 i!1381))))

(declare-fun e!595001 () Bool)

(assert (=> b!1048886 e!595001))

(declare-fun res!698011 () Bool)

(assert (=> b!1048886 (=> (not res!698011) (not e!595001))))

(assert (=> b!1048886 (= res!698011 (= (select (store (arr!31785 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463317) k!2747))))

(declare-fun b!1048887 () Bool)

(declare-fun res!698014 () Bool)

(declare-fun e!595002 () Bool)

(assert (=> b!1048887 (=> (not res!698014) (not e!595002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048887 (= res!698014 (validKeyInArray!0 k!2747))))

(declare-fun b!1048888 () Bool)

(assert (=> b!1048888 (= e!594999 true)))

(declare-datatypes ((List!22097 0))(
  ( (Nil!22094) (Cons!22093 (h!23302 (_ BitVec 64)) (t!31404 List!22097)) )
))
(declare-fun arrayNoDuplicates!0 (array!66091 (_ BitVec 32) List!22097) Bool)

(assert (=> b!1048888 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22094)))

(declare-datatypes ((Unit!34290 0))(
  ( (Unit!34291) )
))
(declare-fun lt!463315 () Unit!34290)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66091 (_ BitVec 32) (_ BitVec 32)) Unit!34290)

(assert (=> b!1048888 (= lt!463315 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048889 () Bool)

(assert (=> b!1048889 (= e!595002 e!594998)))

(declare-fun res!698010 () Bool)

(assert (=> b!1048889 (=> (not res!698010) (not e!594998))))

(assert (=> b!1048889 (= res!698010 (arrayContainsKey!0 lt!463316 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048889 (= lt!463316 (array!66092 (store (arr!31785 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32321 a!3488)))))

(declare-fun b!1048890 () Bool)

(assert (=> b!1048890 (= e!595001 e!595003)))

(declare-fun res!698013 () Bool)

(assert (=> b!1048890 (=> res!698013 e!595003)))

(assert (=> b!1048890 (= res!698013 (bvsle lt!463317 i!1381))))

(declare-fun b!1048891 () Bool)

(declare-fun res!698018 () Bool)

(assert (=> b!1048891 (=> (not res!698018) (not e!595002))))

(assert (=> b!1048891 (= res!698018 (= (select (arr!31785 a!3488) i!1381) k!2747))))

(declare-fun b!1048892 () Bool)

(declare-fun res!698016 () Bool)

(assert (=> b!1048892 (=> (not res!698016) (not e!595002))))

(assert (=> b!1048892 (= res!698016 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22094))))

(declare-fun res!698017 () Bool)

(assert (=> start!92290 (=> (not res!698017) (not e!595002))))

(assert (=> start!92290 (= res!698017 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32321 a!3488)) (bvslt (size!32321 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92290 e!595002))

(assert (=> start!92290 true))

(declare-fun array_inv!24565 (array!66091) Bool)

(assert (=> start!92290 (array_inv!24565 a!3488)))

(assert (= (and start!92290 res!698017) b!1048892))

(assert (= (and b!1048892 res!698016) b!1048887))

(assert (= (and b!1048887 res!698014) b!1048891))

(assert (= (and b!1048891 res!698018) b!1048889))

(assert (= (and b!1048889 res!698010) b!1048885))

(assert (= (and b!1048885 res!698012) b!1048886))

(assert (= (and b!1048886 res!698011) b!1048890))

(assert (= (and b!1048890 (not res!698013)) b!1048884))

(assert (= (and b!1048886 (not res!698015)) b!1048888))

(declare-fun m!969745 () Bool)

(assert (=> start!92290 m!969745))

(declare-fun m!969747 () Bool)

(assert (=> b!1048887 m!969747))

(declare-fun m!969749 () Bool)

(assert (=> b!1048891 m!969749))

(declare-fun m!969751 () Bool)

(assert (=> b!1048886 m!969751))

(declare-fun m!969753 () Bool)

(assert (=> b!1048886 m!969753))

(declare-fun m!969755 () Bool)

(assert (=> b!1048885 m!969755))

(declare-fun m!969757 () Bool)

(assert (=> b!1048884 m!969757))

(declare-fun m!969759 () Bool)

(assert (=> b!1048888 m!969759))

(declare-fun m!969761 () Bool)

(assert (=> b!1048888 m!969761))

(declare-fun m!969763 () Bool)

(assert (=> b!1048889 m!969763))

(assert (=> b!1048889 m!969751))

(declare-fun m!969765 () Bool)

(assert (=> b!1048892 m!969765))

(push 1)

(assert (not b!1048884))

(assert (not b!1048892))

(assert (not b!1048885))

(assert (not b!1048889))

(assert (not start!92290))

(assert (not b!1048887))

(assert (not b!1048888))

(check-sat)

