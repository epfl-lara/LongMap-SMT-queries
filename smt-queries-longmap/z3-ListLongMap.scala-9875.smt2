; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117166 () Bool)

(assert start!117166)

(declare-fun res!920900 () Bool)

(declare-fun e!781245 () Bool)

(assert (=> start!117166 (=> (not res!920900) (not e!781245))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93721 0))(
  ( (array!93722 (arr!45259 (Array (_ BitVec 32) (_ BitVec 64))) (size!45810 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93721)

(assert (=> start!117166 (= res!920900 (and (bvslt (size!45810 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45810 a!4212))))))

(assert (=> start!117166 e!781245))

(declare-fun array_inv!34540 (array!93721) Bool)

(assert (=> start!117166 (array_inv!34540 a!4212)))

(assert (=> start!117166 true))

(declare-fun b!1378971 () Bool)

(declare-fun res!920901 () Bool)

(assert (=> b!1378971 (=> (not res!920901) (not e!781245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378971 (= res!920901 (not (validKeyInArray!0 (select (arr!45259 a!4212) to!375))))))

(declare-fun b!1378972 () Bool)

(assert (=> b!1378972 (= e!781245 (or (bvslt (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsgt to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(assert (= (and start!117166 res!920900) b!1378971))

(assert (= (and b!1378971 res!920901) b!1378972))

(declare-fun m!1263687 () Bool)

(assert (=> start!117166 m!1263687))

(declare-fun m!1263689 () Bool)

(assert (=> b!1378971 m!1263689))

(assert (=> b!1378971 m!1263689))

(declare-fun m!1263691 () Bool)

(assert (=> b!1378971 m!1263691))

(check-sat (not start!117166) (not b!1378971))
(check-sat)
