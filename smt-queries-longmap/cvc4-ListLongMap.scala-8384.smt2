; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101976 () Bool)

(assert start!101976)

(declare-fun b!1227723 () Bool)

(declare-fun res!816384 () Bool)

(declare-fun e!697005 () Bool)

(assert (=> b!1227723 (=> (not res!816384) (not e!697005))))

(declare-datatypes ((List!27085 0))(
  ( (Nil!27082) (Cons!27081 (h!28290 (_ BitVec 64)) (t!40539 List!27085)) )
))
(declare-fun acc!823 () List!27085)

(declare-fun noDuplicate!1700 (List!27085) Bool)

(assert (=> b!1227723 (= res!816384 (noDuplicate!1700 acc!823))))

(declare-fun res!816392 () Bool)

(assert (=> start!101976 (=> (not res!816392) (not e!697005))))

(declare-datatypes ((array!79176 0))(
  ( (array!79177 (arr!38211 (Array (_ BitVec 32) (_ BitVec 64))) (size!38749 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79176)

(assert (=> start!101976 (= res!816392 (bvslt (size!38749 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101976 e!697005))

(declare-fun array_inv!29194 (array!79176) Bool)

(assert (=> start!101976 (array_inv!29194 a!3806)))

(assert (=> start!101976 true))

(declare-fun b!1227724 () Bool)

(declare-fun res!816391 () Bool)

(assert (=> b!1227724 (=> (not res!816391) (not e!697005))))

(declare-fun contains!7057 (List!27085 (_ BitVec 64)) Bool)

(assert (=> b!1227724 (= res!816391 (not (contains!7057 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227725 () Bool)

(declare-fun res!816394 () Bool)

(declare-fun e!697006 () Bool)

(assert (=> b!1227725 (=> res!816394 e!697006)))

(assert (=> b!1227725 (= res!816394 (contains!7057 Nil!27082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227726 () Bool)

(declare-fun res!816386 () Bool)

(assert (=> b!1227726 (=> (not res!816386) (not e!697005))))

(assert (=> b!1227726 (= res!816386 (not (contains!7057 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227727 () Bool)

(declare-fun res!816388 () Bool)

(assert (=> b!1227727 (=> (not res!816388) (not e!697005))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227727 (= res!816388 (validKeyInArray!0 k!2913))))

(declare-fun b!1227728 () Bool)

(assert (=> b!1227728 (= e!697006 true)))

(declare-datatypes ((Unit!40513 0))(
  ( (Unit!40514) )
))
(declare-fun lt!558764 () Unit!40513)

(declare-fun noDuplicateSubseq!42 (List!27085 List!27085) Unit!40513)

(assert (=> b!1227728 (= lt!558764 (noDuplicateSubseq!42 Nil!27082 acc!823))))

(declare-fun b!1227729 () Bool)

(declare-fun res!816389 () Bool)

(assert (=> b!1227729 (=> res!816389 e!697006)))

(assert (=> b!1227729 (= res!816389 (contains!7057 Nil!27082 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227730 () Bool)

(assert (=> b!1227730 (= e!697005 (not e!697006))))

(declare-fun res!816393 () Bool)

(assert (=> b!1227730 (=> res!816393 e!697006)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227730 (= res!816393 (bvsgt from!3184 (size!38749 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79176 (_ BitVec 32) List!27085) Bool)

(assert (=> b!1227730 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27081 (select (arr!38211 a!3806) from!3184) acc!823))))

(declare-fun b!1227731 () Bool)

(declare-fun res!816385 () Bool)

(assert (=> b!1227731 (=> (not res!816385) (not e!697005))))

(assert (=> b!1227731 (= res!816385 (validKeyInArray!0 (select (arr!38211 a!3806) from!3184)))))

(declare-fun b!1227732 () Bool)

(declare-fun res!816395 () Bool)

(assert (=> b!1227732 (=> (not res!816395) (not e!697005))))

(declare-fun arrayContainsKey!0 (array!79176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227732 (= res!816395 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227733 () Bool)

(declare-fun res!816387 () Bool)

(assert (=> b!1227733 (=> res!816387 e!697006)))

(declare-fun subseq!489 (List!27085 List!27085) Bool)

(assert (=> b!1227733 (= res!816387 (not (subseq!489 Nil!27082 acc!823)))))

(declare-fun b!1227734 () Bool)

(declare-fun res!816383 () Bool)

(assert (=> b!1227734 (=> (not res!816383) (not e!697005))))

(assert (=> b!1227734 (= res!816383 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38749 a!3806)) (bvslt from!3184 (size!38749 a!3806))))))

(declare-fun b!1227735 () Bool)

(declare-fun res!816390 () Bool)

(assert (=> b!1227735 (=> (not res!816390) (not e!697005))))

(assert (=> b!1227735 (= res!816390 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!101976 res!816392) b!1227727))

(assert (= (and b!1227727 res!816388) b!1227734))

(assert (= (and b!1227734 res!816383) b!1227723))

(assert (= (and b!1227723 res!816384) b!1227726))

(assert (= (and b!1227726 res!816386) b!1227724))

(assert (= (and b!1227724 res!816391) b!1227732))

(assert (= (and b!1227732 res!816395) b!1227735))

(assert (= (and b!1227735 res!816390) b!1227731))

(assert (= (and b!1227731 res!816385) b!1227730))

(assert (= (and b!1227730 (not res!816393)) b!1227725))

(assert (= (and b!1227725 (not res!816394)) b!1227729))

(assert (= (and b!1227729 (not res!816389)) b!1227733))

(assert (= (and b!1227733 (not res!816387)) b!1227728))

(declare-fun m!1131943 () Bool)

(assert (=> b!1227732 m!1131943))

(declare-fun m!1131945 () Bool)

(assert (=> b!1227727 m!1131945))

(declare-fun m!1131947 () Bool)

(assert (=> b!1227725 m!1131947))

(declare-fun m!1131949 () Bool)

(assert (=> start!101976 m!1131949))

(declare-fun m!1131951 () Bool)

(assert (=> b!1227733 m!1131951))

(declare-fun m!1131953 () Bool)

(assert (=> b!1227728 m!1131953))

(declare-fun m!1131955 () Bool)

(assert (=> b!1227730 m!1131955))

(declare-fun m!1131957 () Bool)

(assert (=> b!1227730 m!1131957))

(declare-fun m!1131959 () Bool)

(assert (=> b!1227735 m!1131959))

(assert (=> b!1227731 m!1131955))

(assert (=> b!1227731 m!1131955))

(declare-fun m!1131961 () Bool)

(assert (=> b!1227731 m!1131961))

(declare-fun m!1131963 () Bool)

(assert (=> b!1227729 m!1131963))

(declare-fun m!1131965 () Bool)

(assert (=> b!1227723 m!1131965))

(declare-fun m!1131967 () Bool)

(assert (=> b!1227724 m!1131967))

(declare-fun m!1131969 () Bool)

(assert (=> b!1227726 m!1131969))

(push 1)

(assert (not b!1227725))

(assert (not start!101976))

(assert (not b!1227730))

(assert (not b!1227724))

(assert (not b!1227728))

(assert (not b!1227726))

(assert (not b!1227723))

(assert (not b!1227735))

(assert (not b!1227732))

(assert (not b!1227727))

(assert (not b!1227733))

(assert (not b!1227729))

(assert (not b!1227731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

