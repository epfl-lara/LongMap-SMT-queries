; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92416 () Bool)

(assert start!92416)

(declare-fun b!1050612 () Bool)

(declare-fun e!596242 () Bool)

(declare-fun e!596240 () Bool)

(assert (=> b!1050612 (= e!596242 e!596240)))

(declare-fun res!699822 () Bool)

(assert (=> b!1050612 (=> (not res!699822) (not e!596240))))

(declare-fun lt!463870 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050612 (= res!699822 (not (= lt!463870 i!1381)))))

(declare-datatypes ((array!66158 0))(
  ( (array!66159 (arr!31818 (Array (_ BitVec 32) (_ BitVec 64))) (size!32356 (_ BitVec 32))) )
))
(declare-fun lt!463869 () array!66158)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66158 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050612 (= lt!463870 (arrayScanForKey!0 lt!463869 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050613 () Bool)

(assert (=> b!1050613 (= e!596240 (not true))))

(declare-fun e!596239 () Bool)

(assert (=> b!1050613 e!596239))

(declare-fun res!699824 () Bool)

(assert (=> b!1050613 (=> (not res!699824) (not e!596239))))

(declare-fun a!3488 () array!66158)

(assert (=> b!1050613 (= res!699824 (= (select (store (arr!31818 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463870) k0!2747))))

(declare-fun b!1050614 () Bool)

(declare-fun res!699828 () Bool)

(declare-fun e!596241 () Bool)

(assert (=> b!1050614 (=> (not res!699828) (not e!596241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050614 (= res!699828 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050615 () Bool)

(assert (=> b!1050615 (= e!596241 e!596242)))

(declare-fun res!699827 () Bool)

(assert (=> b!1050615 (=> (not res!699827) (not e!596242))))

(declare-fun arrayContainsKey!0 (array!66158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050615 (= res!699827 (arrayContainsKey!0 lt!463869 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050615 (= lt!463869 (array!66159 (store (arr!31818 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32356 a!3488)))))

(declare-fun b!1050616 () Bool)

(declare-fun res!699829 () Bool)

(assert (=> b!1050616 (=> (not res!699829) (not e!596241))))

(assert (=> b!1050616 (= res!699829 (= (select (arr!31818 a!3488) i!1381) k0!2747))))

(declare-fun b!1050618 () Bool)

(declare-fun res!699825 () Bool)

(assert (=> b!1050618 (=> (not res!699825) (not e!596241))))

(declare-datatypes ((List!22189 0))(
  ( (Nil!22186) (Cons!22185 (h!23394 (_ BitVec 64)) (t!31487 List!22189)) )
))
(declare-fun arrayNoDuplicates!0 (array!66158 (_ BitVec 32) List!22189) Bool)

(assert (=> b!1050618 (= res!699825 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22186))))

(declare-fun b!1050619 () Bool)

(declare-fun e!596243 () Bool)

(assert (=> b!1050619 (= e!596243 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050617 () Bool)

(assert (=> b!1050617 (= e!596239 e!596243)))

(declare-fun res!699826 () Bool)

(assert (=> b!1050617 (=> res!699826 e!596243)))

(assert (=> b!1050617 (= res!699826 (or (bvsgt lt!463870 i!1381) (bvsle i!1381 lt!463870)))))

(declare-fun res!699823 () Bool)

(assert (=> start!92416 (=> (not res!699823) (not e!596241))))

(assert (=> start!92416 (= res!699823 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32356 a!3488)) (bvslt (size!32356 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92416 e!596241))

(assert (=> start!92416 true))

(declare-fun array_inv!24601 (array!66158) Bool)

(assert (=> start!92416 (array_inv!24601 a!3488)))

(assert (= (and start!92416 res!699823) b!1050618))

(assert (= (and b!1050618 res!699825) b!1050614))

(assert (= (and b!1050614 res!699828) b!1050616))

(assert (= (and b!1050616 res!699829) b!1050615))

(assert (= (and b!1050615 res!699827) b!1050612))

(assert (= (and b!1050612 res!699822) b!1050613))

(assert (= (and b!1050613 res!699824) b!1050617))

(assert (= (and b!1050617 (not res!699826)) b!1050619))

(declare-fun m!970795 () Bool)

(assert (=> b!1050612 m!970795))

(declare-fun m!970797 () Bool)

(assert (=> b!1050615 m!970797))

(declare-fun m!970799 () Bool)

(assert (=> b!1050615 m!970799))

(declare-fun m!970801 () Bool)

(assert (=> b!1050614 m!970801))

(assert (=> b!1050613 m!970799))

(declare-fun m!970803 () Bool)

(assert (=> b!1050613 m!970803))

(declare-fun m!970805 () Bool)

(assert (=> start!92416 m!970805))

(declare-fun m!970807 () Bool)

(assert (=> b!1050619 m!970807))

(declare-fun m!970809 () Bool)

(assert (=> b!1050616 m!970809))

(declare-fun m!970811 () Bool)

(assert (=> b!1050618 m!970811))

(check-sat (not b!1050612) (not b!1050615) (not b!1050614) (not start!92416) (not b!1050618) (not b!1050619))
(check-sat)
