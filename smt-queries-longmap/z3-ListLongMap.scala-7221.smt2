; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92622 () Bool)

(assert start!92622)

(declare-fun b!1051765 () Bool)

(declare-fun res!700093 () Bool)

(declare-fun e!596954 () Bool)

(assert (=> b!1051765 (=> (not res!700093) (not e!596954))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051765 (= res!700093 (validKeyInArray!0 k0!2747))))

(declare-fun e!596951 () Bool)

(declare-fun lt!464476 () (_ BitVec 32))

(declare-datatypes ((array!66238 0))(
  ( (array!66239 (arr!31852 (Array (_ BitVec 32) (_ BitVec 64))) (size!32389 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66238)

(declare-fun b!1051766 () Bool)

(declare-fun arrayContainsKey!0 (array!66238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051766 (= e!596951 (arrayContainsKey!0 a!3488 k0!2747 lt!464476))))

(declare-fun b!1051767 () Bool)

(declare-fun res!700090 () Bool)

(assert (=> b!1051767 (=> (not res!700090) (not e!596954))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051767 (= res!700090 (= (select (arr!31852 a!3488) i!1381) k0!2747))))

(declare-fun b!1051768 () Bool)

(declare-fun e!596955 () Bool)

(assert (=> b!1051768 (= e!596955 true)))

(assert (=> b!1051768 false))

(declare-datatypes ((Unit!34393 0))(
  ( (Unit!34394) )
))
(declare-fun lt!464473 () Unit!34393)

(declare-datatypes ((List!22134 0))(
  ( (Nil!22131) (Cons!22130 (h!23348 (_ BitVec 64)) (t!31433 List!22134)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66238 (_ BitVec 64) (_ BitVec 32) List!22134) Unit!34393)

(assert (=> b!1051768 (= lt!464473 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22131))))

(assert (=> b!1051768 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!464474 () Unit!34393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34393)

(assert (=> b!1051768 (= lt!464474 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464476 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66238 (_ BitVec 32) List!22134) Bool)

(assert (=> b!1051768 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22131)))

(declare-fun lt!464475 () Unit!34393)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66238 (_ BitVec 32) (_ BitVec 32)) Unit!34393)

(assert (=> b!1051768 (= lt!464475 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!700094 () Bool)

(assert (=> start!92622 (=> (not res!700094) (not e!596954))))

(assert (=> start!92622 (= res!700094 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32389 a!3488)) (bvslt (size!32389 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92622 e!596954))

(assert (=> start!92622 true))

(declare-fun array_inv!24634 (array!66238) Bool)

(assert (=> start!92622 (array_inv!24634 a!3488)))

(declare-fun b!1051769 () Bool)

(declare-fun e!596956 () Bool)

(assert (=> b!1051769 (= e!596954 e!596956)))

(declare-fun res!700088 () Bool)

(assert (=> b!1051769 (=> (not res!700088) (not e!596956))))

(declare-fun lt!464477 () array!66238)

(assert (=> b!1051769 (= res!700088 (arrayContainsKey!0 lt!464477 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051769 (= lt!464477 (array!66239 (store (arr!31852 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32389 a!3488)))))

(declare-fun b!1051770 () Bool)

(declare-fun e!596952 () Bool)

(assert (=> b!1051770 (= e!596952 e!596951)))

(declare-fun res!700089 () Bool)

(assert (=> b!1051770 (=> res!700089 e!596951)))

(assert (=> b!1051770 (= res!700089 (bvsle lt!464476 i!1381))))

(declare-fun b!1051771 () Bool)

(declare-fun e!596953 () Bool)

(assert (=> b!1051771 (= e!596956 e!596953)))

(declare-fun res!700086 () Bool)

(assert (=> b!1051771 (=> (not res!700086) (not e!596953))))

(assert (=> b!1051771 (= res!700086 (not (= lt!464476 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66238 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051771 (= lt!464476 (arrayScanForKey!0 lt!464477 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051772 () Bool)

(declare-fun res!700087 () Bool)

(assert (=> b!1051772 (=> (not res!700087) (not e!596954))))

(assert (=> b!1051772 (= res!700087 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22131))))

(declare-fun b!1051773 () Bool)

(assert (=> b!1051773 (= e!596953 (not e!596955))))

(declare-fun res!700091 () Bool)

(assert (=> b!1051773 (=> res!700091 e!596955)))

(assert (=> b!1051773 (= res!700091 (bvsle lt!464476 i!1381))))

(assert (=> b!1051773 e!596952))

(declare-fun res!700092 () Bool)

(assert (=> b!1051773 (=> (not res!700092) (not e!596952))))

(assert (=> b!1051773 (= res!700092 (= (select (store (arr!31852 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464476) k0!2747))))

(assert (= (and start!92622 res!700094) b!1051772))

(assert (= (and b!1051772 res!700087) b!1051765))

(assert (= (and b!1051765 res!700093) b!1051767))

(assert (= (and b!1051767 res!700090) b!1051769))

(assert (= (and b!1051769 res!700088) b!1051771))

(assert (= (and b!1051771 res!700086) b!1051773))

(assert (= (and b!1051773 res!700092) b!1051770))

(assert (= (and b!1051770 (not res!700089)) b!1051766))

(assert (= (and b!1051773 (not res!700091)) b!1051768))

(declare-fun m!972797 () Bool)

(assert (=> b!1051769 m!972797))

(declare-fun m!972799 () Bool)

(assert (=> b!1051769 m!972799))

(declare-fun m!972801 () Bool)

(assert (=> b!1051768 m!972801))

(declare-fun m!972803 () Bool)

(assert (=> b!1051768 m!972803))

(declare-fun m!972805 () Bool)

(assert (=> b!1051768 m!972805))

(declare-fun m!972807 () Bool)

(assert (=> b!1051768 m!972807))

(declare-fun m!972809 () Bool)

(assert (=> b!1051768 m!972809))

(declare-fun m!972811 () Bool)

(assert (=> b!1051765 m!972811))

(declare-fun m!972813 () Bool)

(assert (=> start!92622 m!972813))

(declare-fun m!972815 () Bool)

(assert (=> b!1051771 m!972815))

(declare-fun m!972817 () Bool)

(assert (=> b!1051767 m!972817))

(declare-fun m!972819 () Bool)

(assert (=> b!1051766 m!972819))

(assert (=> b!1051773 m!972799))

(declare-fun m!972821 () Bool)

(assert (=> b!1051773 m!972821))

(declare-fun m!972823 () Bool)

(assert (=> b!1051772 m!972823))

(check-sat (not b!1051772) (not b!1051771) (not b!1051768) (not b!1051765) (not b!1051769) (not start!92622) (not b!1051766))
(check-sat)
