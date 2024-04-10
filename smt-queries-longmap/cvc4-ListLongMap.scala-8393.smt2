; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102142 () Bool)

(assert start!102142)

(declare-fun b!1229350 () Bool)

(declare-fun res!817846 () Bool)

(declare-fun e!697791 () Bool)

(assert (=> b!1229350 (=> res!817846 e!697791)))

(declare-datatypes ((List!27051 0))(
  ( (Nil!27048) (Cons!27047 (h!28256 (_ BitVec 64)) (t!40514 List!27051)) )
))
(declare-fun lt!559163 () List!27051)

(declare-fun contains!7113 (List!27051 (_ BitVec 64)) Bool)

(assert (=> b!1229350 (= res!817846 (contains!7113 lt!559163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229351 () Bool)

(declare-fun res!817841 () Bool)

(declare-fun e!697789 () Bool)

(assert (=> b!1229351 (=> (not res!817841) (not e!697789))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79317 0))(
  ( (array!79318 (arr!38278 (Array (_ BitVec 32) (_ BitVec 64))) (size!38814 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79317)

(assert (=> b!1229351 (= res!817841 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38814 a!3806)) (bvslt from!3184 (size!38814 a!3806))))))

(declare-fun b!1229352 () Bool)

(declare-fun res!817839 () Bool)

(assert (=> b!1229352 (=> (not res!817839) (not e!697789))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229352 (= res!817839 (validKeyInArray!0 k!2913))))

(declare-fun res!817842 () Bool)

(assert (=> start!102142 (=> (not res!817842) (not e!697789))))

(assert (=> start!102142 (= res!817842 (bvslt (size!38814 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102142 e!697789))

(declare-fun array_inv!29126 (array!79317) Bool)

(assert (=> start!102142 (array_inv!29126 a!3806)))

(assert (=> start!102142 true))

(declare-fun b!1229353 () Bool)

(declare-fun res!817844 () Bool)

(assert (=> b!1229353 (=> (not res!817844) (not e!697789))))

(declare-fun acc!823 () List!27051)

(assert (=> b!1229353 (= res!817844 (not (contains!7113 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229354 () Bool)

(assert (=> b!1229354 (= e!697789 (not e!697791))))

(declare-fun res!817836 () Bool)

(assert (=> b!1229354 (=> res!817836 e!697791)))

(assert (=> b!1229354 (= res!817836 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229354 (= lt!559163 (Cons!27047 (select (arr!38278 a!3806) from!3184) Nil!27048))))

(declare-fun e!697790 () Bool)

(assert (=> b!1229354 e!697790))

(declare-fun res!817845 () Bool)

(assert (=> b!1229354 (=> (not res!817845) (not e!697790))))

(declare-fun arrayNoDuplicates!0 (array!79317 (_ BitVec 32) List!27051) Bool)

(assert (=> b!1229354 (= res!817845 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27048))))

(declare-datatypes ((Unit!40722 0))(
  ( (Unit!40723) )
))
(declare-fun lt!559162 () Unit!40722)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79317 List!27051 List!27051 (_ BitVec 32)) Unit!40722)

(assert (=> b!1229354 (= lt!559162 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27048 from!3184))))

(assert (=> b!1229354 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27047 (select (arr!38278 a!3806) from!3184) acc!823))))

(declare-fun b!1229355 () Bool)

(declare-fun res!817849 () Bool)

(assert (=> b!1229355 (=> (not res!817849) (not e!697789))))

(assert (=> b!1229355 (= res!817849 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229356 () Bool)

(declare-fun res!817840 () Bool)

(assert (=> b!1229356 (=> (not res!817840) (not e!697789))))

(declare-fun arrayContainsKey!0 (array!79317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229356 (= res!817840 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229357 () Bool)

(assert (=> b!1229357 (= e!697790 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27047 (select (arr!38278 a!3806) from!3184) Nil!27048)))))

(declare-fun b!1229358 () Bool)

(declare-fun res!817847 () Bool)

(assert (=> b!1229358 (=> res!817847 e!697791)))

(assert (=> b!1229358 (= res!817847 (contains!7113 lt!559163 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229359 () Bool)

(declare-fun res!817848 () Bool)

(assert (=> b!1229359 (=> res!817848 e!697791)))

(declare-fun noDuplicate!1710 (List!27051) Bool)

(assert (=> b!1229359 (= res!817848 (not (noDuplicate!1710 lt!559163)))))

(declare-fun b!1229360 () Bool)

(assert (=> b!1229360 (= e!697791 true)))

(declare-fun lt!559161 () Bool)

(assert (=> b!1229360 (= lt!559161 (contains!7113 lt!559163 (select (arr!38278 a!3806) from!3184)))))

(declare-fun b!1229361 () Bool)

(declare-fun res!817837 () Bool)

(assert (=> b!1229361 (=> (not res!817837) (not e!697789))))

(assert (=> b!1229361 (= res!817837 (not (contains!7113 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229362 () Bool)

(declare-fun res!817838 () Bool)

(assert (=> b!1229362 (=> (not res!817838) (not e!697789))))

(assert (=> b!1229362 (= res!817838 (validKeyInArray!0 (select (arr!38278 a!3806) from!3184)))))

(declare-fun b!1229363 () Bool)

(declare-fun res!817843 () Bool)

(assert (=> b!1229363 (=> (not res!817843) (not e!697789))))

(assert (=> b!1229363 (= res!817843 (noDuplicate!1710 acc!823))))

(assert (= (and start!102142 res!817842) b!1229352))

(assert (= (and b!1229352 res!817839) b!1229351))

(assert (= (and b!1229351 res!817841) b!1229363))

(assert (= (and b!1229363 res!817843) b!1229361))

(assert (= (and b!1229361 res!817837) b!1229353))

(assert (= (and b!1229353 res!817844) b!1229356))

(assert (= (and b!1229356 res!817840) b!1229355))

(assert (= (and b!1229355 res!817849) b!1229362))

(assert (= (and b!1229362 res!817838) b!1229354))

(assert (= (and b!1229354 res!817845) b!1229357))

(assert (= (and b!1229354 (not res!817836)) b!1229359))

(assert (= (and b!1229359 (not res!817848)) b!1229350))

(assert (= (and b!1229350 (not res!817846)) b!1229358))

(assert (= (and b!1229358 (not res!817847)) b!1229360))

(declare-fun m!1133925 () Bool)

(assert (=> b!1229361 m!1133925))

(declare-fun m!1133927 () Bool)

(assert (=> b!1229363 m!1133927))

(declare-fun m!1133929 () Bool)

(assert (=> b!1229356 m!1133929))

(declare-fun m!1133931 () Bool)

(assert (=> b!1229355 m!1133931))

(declare-fun m!1133933 () Bool)

(assert (=> b!1229362 m!1133933))

(assert (=> b!1229362 m!1133933))

(declare-fun m!1133935 () Bool)

(assert (=> b!1229362 m!1133935))

(declare-fun m!1133937 () Bool)

(assert (=> b!1229359 m!1133937))

(declare-fun m!1133939 () Bool)

(assert (=> b!1229358 m!1133939))

(declare-fun m!1133941 () Bool)

(assert (=> b!1229353 m!1133941))

(assert (=> b!1229360 m!1133933))

(assert (=> b!1229360 m!1133933))

(declare-fun m!1133943 () Bool)

(assert (=> b!1229360 m!1133943))

(declare-fun m!1133945 () Bool)

(assert (=> b!1229350 m!1133945))

(assert (=> b!1229357 m!1133933))

(declare-fun m!1133947 () Bool)

(assert (=> b!1229357 m!1133947))

(declare-fun m!1133949 () Bool)

(assert (=> b!1229352 m!1133949))

(declare-fun m!1133951 () Bool)

(assert (=> start!102142 m!1133951))

(assert (=> b!1229354 m!1133933))

(declare-fun m!1133953 () Bool)

(assert (=> b!1229354 m!1133953))

(declare-fun m!1133955 () Bool)

(assert (=> b!1229354 m!1133955))

(declare-fun m!1133957 () Bool)

(assert (=> b!1229354 m!1133957))

(push 1)

(assert (not b!1229353))

(assert (not b!1229363))

(assert (not start!102142))

(assert (not b!1229359))

(assert (not b!1229357))

(assert (not b!1229352))

(assert (not b!1229361))

(assert (not b!1229360))

(assert (not b!1229354))

(assert (not b!1229362))

(assert (not b!1229350))

(assert (not b!1229358))

(assert (not b!1229355))

