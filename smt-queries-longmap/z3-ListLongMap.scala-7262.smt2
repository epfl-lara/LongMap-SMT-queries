; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92988 () Bool)

(assert start!92988)

(declare-fun b!1054892 () Bool)

(declare-fun res!703075 () Bool)

(declare-fun e!599231 () Bool)

(assert (=> b!1054892 (=> (not res!703075) (not e!599231))))

(declare-datatypes ((array!66496 0))(
  ( (array!66497 (arr!31975 (Array (_ BitVec 32) (_ BitVec 64))) (size!32512 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66496)

(declare-datatypes ((List!22257 0))(
  ( (Nil!22254) (Cons!22253 (h!23471 (_ BitVec 64)) (t!31556 List!22257)) )
))
(declare-fun arrayNoDuplicates!0 (array!66496 (_ BitVec 32) List!22257) Bool)

(assert (=> b!1054892 (= res!703075 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22254))))

(declare-fun b!1054893 () Bool)

(declare-fun e!599235 () Bool)

(assert (=> b!1054893 (= e!599235 (not true))))

(declare-fun e!599233 () Bool)

(assert (=> b!1054893 e!599233))

(declare-fun res!703073 () Bool)

(assert (=> b!1054893 (=> (not res!703073) (not e!599233))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!465683 () (_ BitVec 32))

(assert (=> b!1054893 (= res!703073 (= (select (store (arr!31975 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465683) k0!2747))))

(declare-fun res!703069 () Bool)

(assert (=> start!92988 (=> (not res!703069) (not e!599231))))

(assert (=> start!92988 (= res!703069 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32512 a!3488)) (bvslt (size!32512 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92988 e!599231))

(assert (=> start!92988 true))

(declare-fun array_inv!24757 (array!66496) Bool)

(assert (=> start!92988 (array_inv!24757 a!3488)))

(declare-fun b!1054894 () Bool)

(declare-fun e!599232 () Bool)

(assert (=> b!1054894 (= e!599231 e!599232)))

(declare-fun res!703071 () Bool)

(assert (=> b!1054894 (=> (not res!703071) (not e!599232))))

(declare-fun lt!465682 () array!66496)

(declare-fun arrayContainsKey!0 (array!66496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054894 (= res!703071 (arrayContainsKey!0 lt!465682 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054894 (= lt!465682 (array!66497 (store (arr!31975 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32512 a!3488)))))

(declare-fun b!1054895 () Bool)

(declare-fun e!599236 () Bool)

(assert (=> b!1054895 (= e!599233 e!599236)))

(declare-fun res!703070 () Bool)

(assert (=> b!1054895 (=> res!703070 e!599236)))

(assert (=> b!1054895 (= res!703070 (bvsle lt!465683 i!1381))))

(declare-fun b!1054896 () Bool)

(assert (=> b!1054896 (= e!599236 (arrayContainsKey!0 a!3488 k0!2747 lt!465683))))

(declare-fun b!1054897 () Bool)

(assert (=> b!1054897 (= e!599232 e!599235)))

(declare-fun res!703076 () Bool)

(assert (=> b!1054897 (=> (not res!703076) (not e!599235))))

(assert (=> b!1054897 (= res!703076 (not (= lt!465683 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66496 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054897 (= lt!465683 (arrayScanForKey!0 lt!465682 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054898 () Bool)

(declare-fun res!703072 () Bool)

(assert (=> b!1054898 (=> (not res!703072) (not e!599231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054898 (= res!703072 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054899 () Bool)

(declare-fun res!703074 () Bool)

(assert (=> b!1054899 (=> (not res!703074) (not e!599231))))

(assert (=> b!1054899 (= res!703074 (= (select (arr!31975 a!3488) i!1381) k0!2747))))

(assert (= (and start!92988 res!703069) b!1054892))

(assert (= (and b!1054892 res!703075) b!1054898))

(assert (= (and b!1054898 res!703072) b!1054899))

(assert (= (and b!1054899 res!703074) b!1054894))

(assert (= (and b!1054894 res!703071) b!1054897))

(assert (= (and b!1054897 res!703076) b!1054893))

(assert (= (and b!1054893 res!703073) b!1054895))

(assert (= (and b!1054895 (not res!703070)) b!1054896))

(declare-fun m!975497 () Bool)

(assert (=> b!1054896 m!975497))

(declare-fun m!975499 () Bool)

(assert (=> b!1054892 m!975499))

(declare-fun m!975501 () Bool)

(assert (=> b!1054893 m!975501))

(declare-fun m!975503 () Bool)

(assert (=> b!1054893 m!975503))

(declare-fun m!975505 () Bool)

(assert (=> start!92988 m!975505))

(declare-fun m!975507 () Bool)

(assert (=> b!1054897 m!975507))

(declare-fun m!975509 () Bool)

(assert (=> b!1054894 m!975509))

(assert (=> b!1054894 m!975501))

(declare-fun m!975511 () Bool)

(assert (=> b!1054899 m!975511))

(declare-fun m!975513 () Bool)

(assert (=> b!1054898 m!975513))

(check-sat (not b!1054897) (not start!92988) (not b!1054898) (not b!1054892) (not b!1054894) (not b!1054896))
(check-sat)
