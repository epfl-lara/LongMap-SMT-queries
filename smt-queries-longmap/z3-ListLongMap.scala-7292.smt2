; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93172 () Bool)

(assert start!93172)

(declare-fun b!1056500 () Bool)

(declare-fun res!705329 () Bool)

(declare-fun e!600669 () Bool)

(assert (=> b!1056500 (=> (not res!705329) (not e!600669))))

(declare-datatypes ((array!66584 0))(
  ( (array!66585 (arr!32016 (Array (_ BitVec 32) (_ BitVec 64))) (size!32554 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66584)

(declare-datatypes ((List!22387 0))(
  ( (Nil!22384) (Cons!22383 (h!23592 (_ BitVec 64)) (t!31685 List!22387)) )
))
(declare-fun arrayNoDuplicates!0 (array!66584 (_ BitVec 32) List!22387) Bool)

(assert (=> b!1056500 (= res!705329 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22384))))

(declare-fun b!1056501 () Bool)

(declare-fun e!600668 () Bool)

(declare-fun e!600670 () Bool)

(assert (=> b!1056501 (= e!600668 e!600670)))

(declare-fun res!705334 () Bool)

(assert (=> b!1056501 (=> (not res!705334) (not e!600670))))

(declare-fun lt!465963 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056501 (= res!705334 (not (= lt!465963 i!1381)))))

(declare-fun lt!465962 () array!66584)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66584 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056501 (= lt!465963 (arrayScanForKey!0 lt!465962 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056502 () Bool)

(declare-fun e!600666 () Bool)

(assert (=> b!1056502 (= e!600666 true)))

(assert (=> b!1056502 (arrayNoDuplicates!0 a!3488 lt!465963 Nil!22384)))

(declare-datatypes ((Unit!34487 0))(
  ( (Unit!34488) )
))
(declare-fun lt!465964 () Unit!34487)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66584 (_ BitVec 32) (_ BitVec 32)) Unit!34487)

(assert (=> b!1056502 (= lt!465964 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465963))))

(declare-fun b!1056503 () Bool)

(declare-fun e!600672 () Bool)

(declare-fun arrayContainsKey!0 (array!66584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056503 (= e!600672 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056504 () Bool)

(declare-fun res!705328 () Bool)

(assert (=> b!1056504 (=> (not res!705328) (not e!600669))))

(assert (=> b!1056504 (= res!705328 (= (select (arr!32016 a!3488) i!1381) k0!2747))))

(declare-fun b!1056505 () Bool)

(assert (=> b!1056505 (= e!600670 (not e!600666))))

(declare-fun res!705326 () Bool)

(assert (=> b!1056505 (=> res!705326 e!600666)))

(assert (=> b!1056505 (= res!705326 (or (bvsgt lt!465963 i!1381) (bvsle i!1381 lt!465963)))))

(declare-fun e!600671 () Bool)

(assert (=> b!1056505 e!600671))

(declare-fun res!705332 () Bool)

(assert (=> b!1056505 (=> (not res!705332) (not e!600671))))

(assert (=> b!1056505 (= res!705332 (= (select (store (arr!32016 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465963) k0!2747))))

(declare-fun b!1056506 () Bool)

(declare-fun res!705327 () Bool)

(assert (=> b!1056506 (=> (not res!705327) (not e!600669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056506 (= res!705327 (validKeyInArray!0 k0!2747))))

(declare-fun res!705330 () Bool)

(assert (=> start!93172 (=> (not res!705330) (not e!600669))))

(assert (=> start!93172 (= res!705330 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32554 a!3488)) (bvslt (size!32554 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93172 e!600669))

(assert (=> start!93172 true))

(declare-fun array_inv!24799 (array!66584) Bool)

(assert (=> start!93172 (array_inv!24799 a!3488)))

(declare-fun b!1056507 () Bool)

(assert (=> b!1056507 (= e!600671 e!600672)))

(declare-fun res!705331 () Bool)

(assert (=> b!1056507 (=> res!705331 e!600672)))

(assert (=> b!1056507 (= res!705331 (or (bvsgt lt!465963 i!1381) (bvsle i!1381 lt!465963)))))

(declare-fun b!1056508 () Bool)

(assert (=> b!1056508 (= e!600669 e!600668)))

(declare-fun res!705333 () Bool)

(assert (=> b!1056508 (=> (not res!705333) (not e!600668))))

(assert (=> b!1056508 (= res!705333 (arrayContainsKey!0 lt!465962 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056508 (= lt!465962 (array!66585 (store (arr!32016 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32554 a!3488)))))

(assert (= (and start!93172 res!705330) b!1056500))

(assert (= (and b!1056500 res!705329) b!1056506))

(assert (= (and b!1056506 res!705327) b!1056504))

(assert (= (and b!1056504 res!705328) b!1056508))

(assert (= (and b!1056508 res!705333) b!1056501))

(assert (= (and b!1056501 res!705334) b!1056505))

(assert (= (and b!1056505 res!705332) b!1056507))

(assert (= (and b!1056507 (not res!705331)) b!1056503))

(assert (= (and b!1056505 (not res!705326)) b!1056502))

(declare-fun m!975827 () Bool)

(assert (=> b!1056500 m!975827))

(declare-fun m!975829 () Bool)

(assert (=> start!93172 m!975829))

(declare-fun m!975831 () Bool)

(assert (=> b!1056508 m!975831))

(declare-fun m!975833 () Bool)

(assert (=> b!1056508 m!975833))

(assert (=> b!1056505 m!975833))

(declare-fun m!975835 () Bool)

(assert (=> b!1056505 m!975835))

(declare-fun m!975837 () Bool)

(assert (=> b!1056504 m!975837))

(declare-fun m!975839 () Bool)

(assert (=> b!1056501 m!975839))

(declare-fun m!975841 () Bool)

(assert (=> b!1056506 m!975841))

(declare-fun m!975843 () Bool)

(assert (=> b!1056503 m!975843))

(declare-fun m!975845 () Bool)

(assert (=> b!1056502 m!975845))

(declare-fun m!975847 () Bool)

(assert (=> b!1056502 m!975847))

(check-sat (not b!1056508) (not b!1056500) (not start!93172) (not b!1056503) (not b!1056502) (not b!1056501) (not b!1056506))
(check-sat)
