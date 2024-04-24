; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117040 () Bool)

(assert start!117040)

(declare-fun b!1377854 () Bool)

(declare-fun res!919947 () Bool)

(declare-fun e!780619 () Bool)

(assert (=> b!1377854 (=> (not res!919947) (not e!780619))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93595 0))(
  ( (array!93596 (arr!45196 (Array (_ BitVec 32) (_ BitVec 64))) (size!45747 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93595)

(assert (=> b!1377854 (= res!919947 (and (bvslt (size!45747 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45747 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377855 () Bool)

(declare-fun e!780617 () Bool)

(assert (=> b!1377855 (= e!780619 e!780617)))

(declare-fun res!919948 () Bool)

(assert (=> b!1377855 (=> (not res!919948) (not e!780617))))

(declare-fun lt!605774 () (_ BitVec 32))

(declare-fun lt!605773 () (_ BitVec 32))

(assert (=> b!1377855 (= res!919948 (and (= lt!605773 lt!605774) (not (= to!206 (size!45747 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377855 (= lt!605774 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377855 (= lt!605773 (arrayCountValidKeys!0 (array!93596 (store (arr!45196 a!4032) i!1445 k0!2947) (size!45747 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1377856 () Bool)

(assert (=> b!1377856 (= e!780617 (not true))))

(assert (=> b!1377856 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!605774))))

(declare-datatypes ((Unit!45548 0))(
  ( (Unit!45549) )
))
(declare-fun lt!605775 () Unit!45548)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93595 (_ BitVec 32) (_ BitVec 32)) Unit!45548)

(assert (=> b!1377856 (= lt!605775 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!919946 () Bool)

(assert (=> start!117040 (=> (not res!919946) (not e!780619))))

(assert (=> start!117040 (= res!919946 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45747 a!4032))))))

(assert (=> start!117040 e!780619))

(assert (=> start!117040 true))

(declare-fun array_inv!34477 (array!93595) Bool)

(assert (=> start!117040 (array_inv!34477 a!4032)))

(declare-fun b!1377857 () Bool)

(declare-fun res!919949 () Bool)

(assert (=> b!1377857 (=> (not res!919949) (not e!780619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377857 (= res!919949 (validKeyInArray!0 (select (arr!45196 a!4032) i!1445)))))

(declare-fun b!1377858 () Bool)

(declare-fun res!919945 () Bool)

(assert (=> b!1377858 (=> (not res!919945) (not e!780617))))

(assert (=> b!1377858 (= res!919945 (validKeyInArray!0 (select (arr!45196 a!4032) to!206)))))

(declare-fun b!1377859 () Bool)

(declare-fun res!919950 () Bool)

(assert (=> b!1377859 (=> (not res!919950) (not e!780619))))

(assert (=> b!1377859 (= res!919950 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!117040 res!919946) b!1377857))

(assert (= (and b!1377857 res!919949) b!1377859))

(assert (= (and b!1377859 res!919950) b!1377854))

(assert (= (and b!1377854 res!919947) b!1377855))

(assert (= (and b!1377855 res!919948) b!1377858))

(assert (= (and b!1377858 res!919945) b!1377856))

(declare-fun m!1262229 () Bool)

(assert (=> b!1377858 m!1262229))

(assert (=> b!1377858 m!1262229))

(declare-fun m!1262231 () Bool)

(assert (=> b!1377858 m!1262231))

(declare-fun m!1262233 () Bool)

(assert (=> b!1377855 m!1262233))

(declare-fun m!1262235 () Bool)

(assert (=> b!1377855 m!1262235))

(declare-fun m!1262237 () Bool)

(assert (=> b!1377855 m!1262237))

(declare-fun m!1262239 () Bool)

(assert (=> b!1377856 m!1262239))

(declare-fun m!1262241 () Bool)

(assert (=> b!1377856 m!1262241))

(declare-fun m!1262243 () Bool)

(assert (=> start!117040 m!1262243))

(declare-fun m!1262245 () Bool)

(assert (=> b!1377859 m!1262245))

(declare-fun m!1262247 () Bool)

(assert (=> b!1377857 m!1262247))

(assert (=> b!1377857 m!1262247))

(declare-fun m!1262249 () Bool)

(assert (=> b!1377857 m!1262249))

(check-sat (not b!1377858) (not b!1377856) (not b!1377857) (not b!1377859) (not b!1377855) (not start!117040))
(check-sat)
