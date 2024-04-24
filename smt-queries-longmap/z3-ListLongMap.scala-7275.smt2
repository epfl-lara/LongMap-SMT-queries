; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93102 () Bool)

(assert start!93102)

(declare-fun res!704144 () Bool)

(declare-fun e!600091 () Bool)

(assert (=> start!93102 (=> (not res!704144) (not e!600091))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66577 0))(
  ( (array!66578 (arr!32014 (Array (_ BitVec 32) (_ BitVec 64))) (size!32551 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66577)

(assert (=> start!93102 (= res!704144 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32551 a!3488)) (bvslt (size!32551 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93102 e!600091))

(assert (=> start!93102 true))

(declare-fun array_inv!24796 (array!66577) Bool)

(assert (=> start!93102 (array_inv!24796 a!3488)))

(declare-fun e!600093 () Bool)

(declare-fun b!1056004 () Bool)

(declare-fun lt!466029 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056004 (= e!600093 (arrayContainsKey!0 a!3488 k0!2747 lt!466029))))

(declare-fun b!1056005 () Bool)

(declare-fun res!704143 () Bool)

(assert (=> b!1056005 (=> (not res!704143) (not e!600091))))

(assert (=> b!1056005 (= res!704143 (= (select (arr!32014 a!3488) i!1381) k0!2747))))

(declare-fun b!1056006 () Bool)

(declare-fun res!704140 () Bool)

(assert (=> b!1056006 (=> (not res!704140) (not e!600091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056006 (= res!704140 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056007 () Bool)

(declare-fun e!600092 () Bool)

(declare-fun e!600088 () Bool)

(assert (=> b!1056007 (= e!600092 (not e!600088))))

(declare-fun res!704142 () Bool)

(assert (=> b!1056007 (=> res!704142 e!600088)))

(assert (=> b!1056007 (= res!704142 (bvsle lt!466029 i!1381))))

(declare-fun e!600094 () Bool)

(assert (=> b!1056007 e!600094))

(declare-fun res!704146 () Bool)

(assert (=> b!1056007 (=> (not res!704146) (not e!600094))))

(assert (=> b!1056007 (= res!704146 (= (select (store (arr!32014 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466029) k0!2747))))

(declare-fun b!1056008 () Bool)

(declare-fun e!600090 () Bool)

(assert (=> b!1056008 (= e!600090 e!600092)))

(declare-fun res!704141 () Bool)

(assert (=> b!1056008 (=> (not res!704141) (not e!600092))))

(assert (=> b!1056008 (= res!704141 (not (= lt!466029 i!1381)))))

(declare-fun lt!466030 () array!66577)

(declare-fun arrayScanForKey!0 (array!66577 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056008 (= lt!466029 (arrayScanForKey!0 lt!466030 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056009 () Bool)

(assert (=> b!1056009 (= e!600091 e!600090)))

(declare-fun res!704139 () Bool)

(assert (=> b!1056009 (=> (not res!704139) (not e!600090))))

(assert (=> b!1056009 (= res!704139 (arrayContainsKey!0 lt!466030 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056009 (= lt!466030 (array!66578 (store (arr!32014 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32551 a!3488)))))

(declare-fun b!1056010 () Bool)

(assert (=> b!1056010 (= e!600094 e!600093)))

(declare-fun res!704145 () Bool)

(assert (=> b!1056010 (=> res!704145 e!600093)))

(assert (=> b!1056010 (= res!704145 (bvsle lt!466029 i!1381))))

(declare-fun b!1056011 () Bool)

(assert (=> b!1056011 (= e!600088 true)))

(assert (=> b!1056011 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34555 0))(
  ( (Unit!34556) )
))
(declare-fun lt!466028 () Unit!34555)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34555)

(assert (=> b!1056011 (= lt!466028 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466029 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22296 0))(
  ( (Nil!22293) (Cons!22292 (h!23510 (_ BitVec 64)) (t!31595 List!22296)) )
))
(declare-fun arrayNoDuplicates!0 (array!66577 (_ BitVec 32) List!22296) Bool)

(assert (=> b!1056011 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22293)))

(declare-fun lt!466031 () Unit!34555)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66577 (_ BitVec 32) (_ BitVec 32)) Unit!34555)

(assert (=> b!1056011 (= lt!466031 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056012 () Bool)

(declare-fun res!704147 () Bool)

(assert (=> b!1056012 (=> (not res!704147) (not e!600091))))

(assert (=> b!1056012 (= res!704147 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22293))))

(assert (= (and start!93102 res!704144) b!1056012))

(assert (= (and b!1056012 res!704147) b!1056006))

(assert (= (and b!1056006 res!704140) b!1056005))

(assert (= (and b!1056005 res!704143) b!1056009))

(assert (= (and b!1056009 res!704139) b!1056008))

(assert (= (and b!1056008 res!704141) b!1056007))

(assert (= (and b!1056007 res!704146) b!1056010))

(assert (= (and b!1056010 (not res!704145)) b!1056004))

(assert (= (and b!1056007 (not res!704142)) b!1056011))

(declare-fun m!976403 () Bool)

(assert (=> b!1056006 m!976403))

(declare-fun m!976405 () Bool)

(assert (=> b!1056004 m!976405))

(declare-fun m!976407 () Bool)

(assert (=> b!1056009 m!976407))

(declare-fun m!976409 () Bool)

(assert (=> b!1056009 m!976409))

(declare-fun m!976411 () Bool)

(assert (=> start!93102 m!976411))

(declare-fun m!976413 () Bool)

(assert (=> b!1056011 m!976413))

(declare-fun m!976415 () Bool)

(assert (=> b!1056011 m!976415))

(declare-fun m!976417 () Bool)

(assert (=> b!1056011 m!976417))

(declare-fun m!976419 () Bool)

(assert (=> b!1056011 m!976419))

(declare-fun m!976421 () Bool)

(assert (=> b!1056005 m!976421))

(declare-fun m!976423 () Bool)

(assert (=> b!1056008 m!976423))

(declare-fun m!976425 () Bool)

(assert (=> b!1056012 m!976425))

(assert (=> b!1056007 m!976409))

(declare-fun m!976427 () Bool)

(assert (=> b!1056007 m!976427))

(check-sat (not start!93102) (not b!1056006) (not b!1056008) (not b!1056004) (not b!1056011) (not b!1056009) (not b!1056012))
(check-sat)
