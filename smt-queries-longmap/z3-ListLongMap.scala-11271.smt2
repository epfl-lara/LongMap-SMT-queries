; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131470 () Bool)

(assert start!131470)

(declare-fun b!1540978 () Bool)

(declare-fun res!1057526 () Bool)

(declare-fun e!857028 () Bool)

(assert (=> b!1540978 (=> (not res!1057526) (not e!857028))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102373 0))(
  ( (array!102374 (arr!49395 (Array (_ BitVec 32) (_ BitVec 64))) (size!49945 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102373)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540978 (= res!1057526 (and (= (size!49945 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49945 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49945 a!3920))))))

(declare-fun res!1057528 () Bool)

(assert (=> start!131470 (=> (not res!1057528) (not e!857028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131470 (= res!1057528 (validMask!0 mask!4052))))

(assert (=> start!131470 e!857028))

(assert (=> start!131470 true))

(declare-fun array_inv!38423 (array!102373) Bool)

(assert (=> start!131470 (array_inv!38423 a!3920)))

(declare-fun b!1540979 () Bool)

(declare-fun res!1057527 () Bool)

(assert (=> b!1540979 (=> (not res!1057527) (not e!857028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102373 (_ BitVec 32)) Bool)

(assert (=> b!1540979 (= res!1057527 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540980 () Bool)

(declare-fun res!1057525 () Bool)

(assert (=> b!1540980 (=> (not res!1057525) (not e!857028))))

(assert (=> b!1540980 (= res!1057525 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49945 a!3920))))))

(declare-fun b!1540981 () Bool)

(declare-fun res!1057524 () Bool)

(assert (=> b!1540981 (=> (not res!1057524) (not e!857028))))

(assert (=> b!1540981 (= res!1057524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540982 () Bool)

(assert (=> b!1540982 (= e!857028 (not true))))

(assert (=> b!1540982 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51452 0))(
  ( (Unit!51453) )
))
(declare-fun lt!665557 () Unit!51452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51452)

(assert (=> b!1540982 (= lt!665557 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131470 res!1057528) b!1540978))

(assert (= (and b!1540978 res!1057526) b!1540979))

(assert (= (and b!1540979 res!1057527) b!1540980))

(assert (= (and b!1540980 res!1057525) b!1540981))

(assert (= (and b!1540981 res!1057524) b!1540982))

(declare-fun m!1423023 () Bool)

(assert (=> start!131470 m!1423023))

(declare-fun m!1423025 () Bool)

(assert (=> start!131470 m!1423025))

(declare-fun m!1423027 () Bool)

(assert (=> b!1540979 m!1423027))

(declare-fun m!1423029 () Bool)

(assert (=> b!1540981 m!1423029))

(declare-fun m!1423031 () Bool)

(assert (=> b!1540982 m!1423031))

(declare-fun m!1423033 () Bool)

(assert (=> b!1540982 m!1423033))

(check-sat (not start!131470) (not b!1540981) (not b!1540982) (not b!1540979))
