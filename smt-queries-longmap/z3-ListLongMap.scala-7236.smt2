; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92480 () Bool)

(assert start!92480)

(declare-fun b!1051581 () Bool)

(declare-fun res!700713 () Bool)

(declare-fun e!596953 () Bool)

(assert (=> b!1051581 (=> (not res!700713) (not e!596953))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051581 (= res!700713 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051582 () Bool)

(declare-fun e!596958 () Bool)

(declare-fun e!596957 () Bool)

(assert (=> b!1051582 (= e!596958 e!596957)))

(declare-fun res!700708 () Bool)

(assert (=> b!1051582 (=> res!700708 e!596957)))

(declare-fun lt!464333 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051582 (= res!700708 (or (bvsgt lt!464333 i!1381) (bvsle i!1381 lt!464333)))))

(declare-fun b!1051583 () Bool)

(declare-fun e!596952 () Bool)

(assert (=> b!1051583 (= e!596953 e!596952)))

(declare-fun res!700710 () Bool)

(assert (=> b!1051583 (=> (not res!700710) (not e!596952))))

(declare-datatypes ((array!66281 0))(
  ( (array!66282 (arr!31880 (Array (_ BitVec 32) (_ BitVec 64))) (size!32416 (_ BitVec 32))) )
))
(declare-fun lt!464329 () array!66281)

(declare-fun arrayContainsKey!0 (array!66281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051583 (= res!700710 (arrayContainsKey!0 lt!464329 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66281)

(assert (=> b!1051583 (= lt!464329 (array!66282 (store (arr!31880 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32416 a!3488)))))

(declare-fun b!1051584 () Bool)

(declare-fun e!596959 () Bool)

(declare-fun e!596955 () Bool)

(assert (=> b!1051584 (= e!596959 (not e!596955))))

(declare-fun res!700712 () Bool)

(assert (=> b!1051584 (=> res!700712 e!596955)))

(assert (=> b!1051584 (= res!700712 (or (bvsgt lt!464333 i!1381) (bvsle i!1381 lt!464333)))))

(assert (=> b!1051584 e!596958))

(declare-fun res!700715 () Bool)

(assert (=> b!1051584 (=> (not res!700715) (not e!596958))))

(assert (=> b!1051584 (= res!700715 (= (select (store (arr!31880 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464333) k0!2747))))

(declare-fun b!1051585 () Bool)

(declare-fun res!700716 () Bool)

(assert (=> b!1051585 (=> (not res!700716) (not e!596953))))

(assert (=> b!1051585 (= res!700716 (= (select (arr!31880 a!3488) i!1381) k0!2747))))

(declare-fun b!1051586 () Bool)

(declare-fun res!700718 () Bool)

(declare-fun e!596954 () Bool)

(assert (=> b!1051586 (=> res!700718 e!596954)))

(declare-datatypes ((List!22192 0))(
  ( (Nil!22189) (Cons!22188 (h!23397 (_ BitVec 64)) (t!31499 List!22192)) )
))
(declare-fun noDuplicate!1519 (List!22192) Bool)

(assert (=> b!1051586 (= res!700718 (not (noDuplicate!1519 Nil!22189)))))

(declare-fun b!1051587 () Bool)

(assert (=> b!1051587 (= e!596952 e!596959)))

(declare-fun res!700707 () Bool)

(assert (=> b!1051587 (=> (not res!700707) (not e!596959))))

(assert (=> b!1051587 (= res!700707 (not (= lt!464333 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66281 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051587 (= lt!464333 (arrayScanForKey!0 lt!464329 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700709 () Bool)

(assert (=> start!92480 (=> (not res!700709) (not e!596953))))

(assert (=> start!92480 (= res!700709 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32416 a!3488)) (bvslt (size!32416 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92480 e!596953))

(assert (=> start!92480 true))

(declare-fun array_inv!24660 (array!66281) Bool)

(assert (=> start!92480 (array_inv!24660 a!3488)))

(declare-fun b!1051588 () Bool)

(assert (=> b!1051588 (= e!596957 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051589 () Bool)

(declare-fun res!700711 () Bool)

(assert (=> b!1051589 (=> (not res!700711) (not e!596953))))

(declare-fun arrayNoDuplicates!0 (array!66281 (_ BitVec 32) List!22192) Bool)

(assert (=> b!1051589 (= res!700711 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22189))))

(declare-fun b!1051590 () Bool)

(assert (=> b!1051590 (= e!596955 e!596954)))

(declare-fun res!700717 () Bool)

(assert (=> b!1051590 (=> res!700717 e!596954)))

(declare-fun lt!464331 () (_ BitVec 32))

(assert (=> b!1051590 (= res!700717 (or (bvslt lt!464333 #b00000000000000000000000000000000) (bvsge lt!464331 (size!32416 a!3488)) (bvsge lt!464333 (size!32416 a!3488))))))

(assert (=> b!1051590 (arrayContainsKey!0 a!3488 k0!2747 lt!464331)))

(declare-datatypes ((Unit!34432 0))(
  ( (Unit!34433) )
))
(declare-fun lt!464332 () Unit!34432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34432)

(assert (=> b!1051590 (= lt!464332 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464331))))

(assert (=> b!1051590 (= lt!464331 (bvadd #b00000000000000000000000000000001 lt!464333))))

(assert (=> b!1051590 (arrayNoDuplicates!0 a!3488 lt!464333 Nil!22189)))

(declare-fun lt!464330 () Unit!34432)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66281 (_ BitVec 32) (_ BitVec 32)) Unit!34432)

(assert (=> b!1051590 (= lt!464330 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464333))))

(declare-fun b!1051591 () Bool)

(declare-fun res!700714 () Bool)

(assert (=> b!1051591 (=> res!700714 e!596954)))

(declare-fun contains!6134 (List!22192 (_ BitVec 64)) Bool)

(assert (=> b!1051591 (= res!700714 (contains!6134 Nil!22189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051592 () Bool)

(assert (=> b!1051592 (= e!596954 true)))

(declare-fun lt!464334 () Bool)

(assert (=> b!1051592 (= lt!464334 (contains!6134 Nil!22189 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92480 res!700709) b!1051589))

(assert (= (and b!1051589 res!700711) b!1051581))

(assert (= (and b!1051581 res!700713) b!1051585))

(assert (= (and b!1051585 res!700716) b!1051583))

(assert (= (and b!1051583 res!700710) b!1051587))

(assert (= (and b!1051587 res!700707) b!1051584))

(assert (= (and b!1051584 res!700715) b!1051582))

(assert (= (and b!1051582 (not res!700708)) b!1051588))

(assert (= (and b!1051584 (not res!700712)) b!1051590))

(assert (= (and b!1051590 (not res!700717)) b!1051586))

(assert (= (and b!1051586 (not res!700718)) b!1051591))

(assert (= (and b!1051591 (not res!700714)) b!1051592))

(declare-fun m!972055 () Bool)

(assert (=> b!1051587 m!972055))

(declare-fun m!972057 () Bool)

(assert (=> b!1051585 m!972057))

(declare-fun m!972059 () Bool)

(assert (=> b!1051583 m!972059))

(declare-fun m!972061 () Bool)

(assert (=> b!1051583 m!972061))

(assert (=> b!1051584 m!972061))

(declare-fun m!972063 () Bool)

(assert (=> b!1051584 m!972063))

(declare-fun m!972065 () Bool)

(assert (=> b!1051590 m!972065))

(declare-fun m!972067 () Bool)

(assert (=> b!1051590 m!972067))

(declare-fun m!972069 () Bool)

(assert (=> b!1051590 m!972069))

(declare-fun m!972071 () Bool)

(assert (=> b!1051590 m!972071))

(declare-fun m!972073 () Bool)

(assert (=> b!1051589 m!972073))

(declare-fun m!972075 () Bool)

(assert (=> start!92480 m!972075))

(declare-fun m!972077 () Bool)

(assert (=> b!1051581 m!972077))

(declare-fun m!972079 () Bool)

(assert (=> b!1051588 m!972079))

(declare-fun m!972081 () Bool)

(assert (=> b!1051586 m!972081))

(declare-fun m!972083 () Bool)

(assert (=> b!1051592 m!972083))

(declare-fun m!972085 () Bool)

(assert (=> b!1051591 m!972085))

(check-sat (not start!92480) (not b!1051590) (not b!1051591) (not b!1051587) (not b!1051581) (not b!1051592) (not b!1051583) (not b!1051588) (not b!1051586) (not b!1051589))
(check-sat)
