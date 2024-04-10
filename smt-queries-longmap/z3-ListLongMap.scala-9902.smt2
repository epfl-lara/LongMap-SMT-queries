; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117158 () Bool)

(assert start!117158)

(declare-fun b!1378851 () Bool)

(declare-fun res!921387 () Bool)

(declare-fun e!781106 () Bool)

(assert (=> b!1378851 (=> (not res!921387) (not e!781106))))

(declare-datatypes ((array!93775 0))(
  ( (array!93776 (arr!45288 (Array (_ BitVec 32) (_ BitVec 64))) (size!45838 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93775)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378851 (= res!921387 (validKeyInArray!0 (select (arr!45288 a!4094) i!1451)))))

(declare-fun b!1378853 () Bool)

(declare-fun res!921385 () Bool)

(assert (=> b!1378853 (=> (not res!921385) (not e!781106))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378853 (= res!921385 (and (bvslt (size!45838 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45838 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378854 () Bool)

(assert (=> b!1378854 (= e!781106 false)))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun lt!607007 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378854 (= lt!607007 (arrayCountValidKeys!0 (array!93776 (store (arr!45288 a!4094) i!1451 k0!2953) (size!45838 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607008 () (_ BitVec 32))

(assert (=> b!1378854 (= lt!607008 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378852 () Bool)

(declare-fun res!921388 () Bool)

(assert (=> b!1378852 (=> (not res!921388) (not e!781106))))

(assert (=> b!1378852 (= res!921388 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921386 () Bool)

(assert (=> start!117158 (=> (not res!921386) (not e!781106))))

(assert (=> start!117158 (= res!921386 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45838 a!4094))))))

(assert (=> start!117158 e!781106))

(assert (=> start!117158 true))

(declare-fun array_inv!34316 (array!93775) Bool)

(assert (=> start!117158 (array_inv!34316 a!4094)))

(assert (= (and start!117158 res!921386) b!1378851))

(assert (= (and b!1378851 res!921387) b!1378852))

(assert (= (and b!1378852 res!921388) b!1378853))

(assert (= (and b!1378853 res!921385) b!1378854))

(declare-fun m!1263677 () Bool)

(assert (=> b!1378851 m!1263677))

(assert (=> b!1378851 m!1263677))

(declare-fun m!1263679 () Bool)

(assert (=> b!1378851 m!1263679))

(declare-fun m!1263681 () Bool)

(assert (=> b!1378854 m!1263681))

(declare-fun m!1263683 () Bool)

(assert (=> b!1378854 m!1263683))

(declare-fun m!1263685 () Bool)

(assert (=> b!1378854 m!1263685))

(declare-fun m!1263687 () Bool)

(assert (=> b!1378852 m!1263687))

(declare-fun m!1263689 () Bool)

(assert (=> start!117158 m!1263689))

(check-sat (not b!1378852) (not b!1378851) (not start!117158) (not b!1378854))
