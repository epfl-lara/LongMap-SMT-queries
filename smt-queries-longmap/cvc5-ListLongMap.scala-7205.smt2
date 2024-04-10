; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92292 () Bool)

(assert start!92292)

(declare-fun res!698040 () Bool)

(declare-fun e!595022 () Bool)

(assert (=> start!92292 (=> (not res!698040) (not e!595022))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66093 0))(
  ( (array!66094 (arr!31786 (Array (_ BitVec 32) (_ BitVec 64))) (size!32322 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66093)

(assert (=> start!92292 (= res!698040 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32322 a!3488)) (bvslt (size!32322 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92292 e!595022))

(assert (=> start!92292 true))

(declare-fun array_inv!24566 (array!66093) Bool)

(assert (=> start!92292 (array_inv!24566 a!3488)))

(declare-fun b!1048911 () Bool)

(declare-fun e!595019 () Bool)

(assert (=> b!1048911 (= e!595022 e!595019)))

(declare-fun res!698045 () Bool)

(assert (=> b!1048911 (=> (not res!698045) (not e!595019))))

(declare-fun lt!463325 () array!66093)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048911 (= res!698045 (arrayContainsKey!0 lt!463325 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048911 (= lt!463325 (array!66094 (store (arr!31786 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32322 a!3488)))))

(declare-fun lt!463324 () (_ BitVec 32))

(declare-fun e!595018 () Bool)

(declare-fun b!1048912 () Bool)

(assert (=> b!1048912 (= e!595018 (arrayContainsKey!0 a!3488 k!2747 lt!463324))))

(declare-fun b!1048913 () Bool)

(declare-fun res!698037 () Bool)

(assert (=> b!1048913 (=> (not res!698037) (not e!595022))))

(assert (=> b!1048913 (= res!698037 (= (select (arr!31786 a!3488) i!1381) k!2747))))

(declare-fun b!1048914 () Bool)

(declare-fun res!698041 () Bool)

(assert (=> b!1048914 (=> (not res!698041) (not e!595022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048914 (= res!698041 (validKeyInArray!0 k!2747))))

(declare-fun b!1048915 () Bool)

(declare-fun e!595023 () Bool)

(declare-fun e!595024 () Bool)

(assert (=> b!1048915 (= e!595023 (not e!595024))))

(declare-fun res!698038 () Bool)

(assert (=> b!1048915 (=> res!698038 e!595024)))

(assert (=> b!1048915 (= res!698038 (bvsle lt!463324 i!1381))))

(declare-fun e!595020 () Bool)

(assert (=> b!1048915 e!595020))

(declare-fun res!698043 () Bool)

(assert (=> b!1048915 (=> (not res!698043) (not e!595020))))

(assert (=> b!1048915 (= res!698043 (= (select (store (arr!31786 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463324) k!2747))))

(declare-fun b!1048916 () Bool)

(assert (=> b!1048916 (= e!595019 e!595023)))

(declare-fun res!698039 () Bool)

(assert (=> b!1048916 (=> (not res!698039) (not e!595023))))

(assert (=> b!1048916 (= res!698039 (not (= lt!463324 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66093 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048916 (= lt!463324 (arrayScanForKey!0 lt!463325 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048917 () Bool)

(assert (=> b!1048917 (= e!595020 e!595018)))

(declare-fun res!698042 () Bool)

(assert (=> b!1048917 (=> res!698042 e!595018)))

(assert (=> b!1048917 (= res!698042 (bvsle lt!463324 i!1381))))

(declare-fun b!1048918 () Bool)

(declare-fun res!698044 () Bool)

(assert (=> b!1048918 (=> (not res!698044) (not e!595022))))

(declare-datatypes ((List!22098 0))(
  ( (Nil!22095) (Cons!22094 (h!23303 (_ BitVec 64)) (t!31405 List!22098)) )
))
(declare-fun arrayNoDuplicates!0 (array!66093 (_ BitVec 32) List!22098) Bool)

(assert (=> b!1048918 (= res!698044 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22095))))

(declare-fun b!1048919 () Bool)

(assert (=> b!1048919 (= e!595024 true)))

(assert (=> b!1048919 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22095)))

(declare-datatypes ((Unit!34292 0))(
  ( (Unit!34293) )
))
(declare-fun lt!463326 () Unit!34292)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66093 (_ BitVec 32) (_ BitVec 32)) Unit!34292)

(assert (=> b!1048919 (= lt!463326 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92292 res!698040) b!1048918))

(assert (= (and b!1048918 res!698044) b!1048914))

(assert (= (and b!1048914 res!698041) b!1048913))

(assert (= (and b!1048913 res!698037) b!1048911))

(assert (= (and b!1048911 res!698045) b!1048916))

(assert (= (and b!1048916 res!698039) b!1048915))

(assert (= (and b!1048915 res!698043) b!1048917))

(assert (= (and b!1048917 (not res!698042)) b!1048912))

(assert (= (and b!1048915 (not res!698038)) b!1048919))

(declare-fun m!969767 () Bool)

(assert (=> b!1048912 m!969767))

(declare-fun m!969769 () Bool)

(assert (=> b!1048919 m!969769))

(declare-fun m!969771 () Bool)

(assert (=> b!1048919 m!969771))

(declare-fun m!969773 () Bool)

(assert (=> b!1048918 m!969773))

(declare-fun m!969775 () Bool)

(assert (=> b!1048913 m!969775))

(declare-fun m!969777 () Bool)

(assert (=> b!1048911 m!969777))

(declare-fun m!969779 () Bool)

(assert (=> b!1048911 m!969779))

(declare-fun m!969781 () Bool)

(assert (=> b!1048914 m!969781))

(assert (=> b!1048915 m!969779))

(declare-fun m!969783 () Bool)

(assert (=> b!1048915 m!969783))

(declare-fun m!969785 () Bool)

(assert (=> b!1048916 m!969785))

(declare-fun m!969787 () Bool)

(assert (=> start!92292 m!969787))

(push 1)

(assert (not start!92292))

(assert (not b!1048916))

(assert (not b!1048919))

(assert (not b!1048918))

