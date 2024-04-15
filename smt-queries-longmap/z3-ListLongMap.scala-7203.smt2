; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92278 () Bool)

(assert start!92278)

(declare-fun res!697815 () Bool)

(declare-fun e!594809 () Bool)

(assert (=> start!92278 (=> (not res!697815) (not e!594809))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66020 0))(
  ( (array!66021 (arr!31749 (Array (_ BitVec 32) (_ BitVec 64))) (size!32287 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66020)

(assert (=> start!92278 (= res!697815 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32287 a!3488)) (bvslt (size!32287 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92278 e!594809))

(assert (=> start!92278 true))

(declare-fun array_inv!24532 (array!66020) Bool)

(assert (=> start!92278 (array_inv!24532 a!3488)))

(declare-fun b!1048605 () Bool)

(declare-fun e!594808 () Bool)

(declare-fun e!594812 () Bool)

(assert (=> b!1048605 (= e!594808 e!594812)))

(declare-fun res!697817 () Bool)

(assert (=> b!1048605 (=> (not res!697817) (not e!594812))))

(declare-fun lt!463077 () (_ BitVec 32))

(assert (=> b!1048605 (= res!697817 (not (= lt!463077 i!1381)))))

(declare-fun lt!463078 () array!66020)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66020 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048605 (= lt!463077 (arrayScanForKey!0 lt!463078 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048606 () Bool)

(declare-fun res!697819 () Bool)

(assert (=> b!1048606 (=> (not res!697819) (not e!594809))))

(declare-datatypes ((List!22120 0))(
  ( (Nil!22117) (Cons!22116 (h!23325 (_ BitVec 64)) (t!31418 List!22120)) )
))
(declare-fun arrayNoDuplicates!0 (array!66020 (_ BitVec 32) List!22120) Bool)

(assert (=> b!1048606 (= res!697819 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22117))))

(declare-fun b!1048607 () Bool)

(declare-fun res!697818 () Bool)

(assert (=> b!1048607 (=> (not res!697818) (not e!594809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048607 (= res!697818 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048608 () Bool)

(declare-fun e!594810 () Bool)

(declare-fun e!594813 () Bool)

(assert (=> b!1048608 (= e!594810 e!594813)))

(declare-fun res!697820 () Bool)

(assert (=> b!1048608 (=> res!697820 e!594813)))

(assert (=> b!1048608 (= res!697820 (bvsle lt!463077 i!1381))))

(declare-fun b!1048609 () Bool)

(assert (=> b!1048609 (= e!594809 e!594808)))

(declare-fun res!697822 () Bool)

(assert (=> b!1048609 (=> (not res!697822) (not e!594808))))

(declare-fun arrayContainsKey!0 (array!66020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048609 (= res!697822 (arrayContainsKey!0 lt!463078 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048609 (= lt!463078 (array!66021 (store (arr!31749 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32287 a!3488)))))

(declare-fun b!1048610 () Bool)

(assert (=> b!1048610 (= e!594812 (not true))))

(assert (=> b!1048610 e!594810))

(declare-fun res!697821 () Bool)

(assert (=> b!1048610 (=> (not res!697821) (not e!594810))))

(assert (=> b!1048610 (= res!697821 (= (select (store (arr!31749 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463077) k0!2747))))

(declare-fun b!1048611 () Bool)

(declare-fun res!697816 () Bool)

(assert (=> b!1048611 (=> (not res!697816) (not e!594809))))

(assert (=> b!1048611 (= res!697816 (= (select (arr!31749 a!3488) i!1381) k0!2747))))

(declare-fun b!1048612 () Bool)

(assert (=> b!1048612 (= e!594813 (arrayContainsKey!0 a!3488 k0!2747 lt!463077))))

(assert (= (and start!92278 res!697815) b!1048606))

(assert (= (and b!1048606 res!697819) b!1048607))

(assert (= (and b!1048607 res!697818) b!1048611))

(assert (= (and b!1048611 res!697816) b!1048609))

(assert (= (and b!1048609 res!697822) b!1048605))

(assert (= (and b!1048605 res!697817) b!1048610))

(assert (= (and b!1048610 res!697821) b!1048608))

(assert (= (and b!1048608 (not res!697820)) b!1048612))

(declare-fun m!969031 () Bool)

(assert (=> b!1048611 m!969031))

(declare-fun m!969033 () Bool)

(assert (=> start!92278 m!969033))

(declare-fun m!969035 () Bool)

(assert (=> b!1048606 m!969035))

(declare-fun m!969037 () Bool)

(assert (=> b!1048605 m!969037))

(declare-fun m!969039 () Bool)

(assert (=> b!1048612 m!969039))

(declare-fun m!969041 () Bool)

(assert (=> b!1048610 m!969041))

(declare-fun m!969043 () Bool)

(assert (=> b!1048610 m!969043))

(declare-fun m!969045 () Bool)

(assert (=> b!1048607 m!969045))

(declare-fun m!969047 () Bool)

(assert (=> b!1048609 m!969047))

(assert (=> b!1048609 m!969041))

(check-sat (not b!1048612) (not b!1048606) (not b!1048607) (not start!92278) (not b!1048609) (not b!1048605))
(check-sat)
