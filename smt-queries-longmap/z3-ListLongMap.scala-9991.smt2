; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117954 () Bool)

(assert start!117954)

(declare-fun b!1381806 () Bool)

(declare-fun res!923434 () Bool)

(declare-fun e!783274 () Bool)

(assert (=> b!1381806 (=> (not res!923434) (not e!783274))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94345 0))(
  ( (array!94346 (arr!45555 (Array (_ BitVec 32) (_ BitVec 64))) (size!46105 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94345)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381806 (= res!923434 (and (= (size!46105 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46105 a!2971))))))

(declare-fun b!1381807 () Bool)

(declare-fun res!923437 () Bool)

(assert (=> b!1381807 (=> (not res!923437) (not e!783274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381807 (= res!923437 (validKeyInArray!0 (select (arr!45555 a!2971) i!1094)))))

(declare-fun b!1381809 () Bool)

(assert (=> b!1381809 (= e!783274 false)))

(declare-fun lt!608292 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94345 (_ BitVec 32)) Bool)

(assert (=> b!1381809 (= lt!608292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381808 () Bool)

(declare-fun res!923436 () Bool)

(assert (=> b!1381808 (=> (not res!923436) (not e!783274))))

(declare-datatypes ((List!32089 0))(
  ( (Nil!32086) (Cons!32085 (h!33294 (_ BitVec 64)) (t!46783 List!32089)) )
))
(declare-fun arrayNoDuplicates!0 (array!94345 (_ BitVec 32) List!32089) Bool)

(assert (=> b!1381808 (= res!923436 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32086))))

(declare-fun res!923435 () Bool)

(assert (=> start!117954 (=> (not res!923435) (not e!783274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117954 (= res!923435 (validMask!0 mask!3034))))

(assert (=> start!117954 e!783274))

(assert (=> start!117954 true))

(declare-fun array_inv!34583 (array!94345) Bool)

(assert (=> start!117954 (array_inv!34583 a!2971)))

(assert (= (and start!117954 res!923435) b!1381806))

(assert (= (and b!1381806 res!923434) b!1381807))

(assert (= (and b!1381807 res!923437) b!1381808))

(assert (= (and b!1381808 res!923436) b!1381809))

(declare-fun m!1266987 () Bool)

(assert (=> b!1381807 m!1266987))

(assert (=> b!1381807 m!1266987))

(declare-fun m!1266989 () Bool)

(assert (=> b!1381807 m!1266989))

(declare-fun m!1266991 () Bool)

(assert (=> b!1381809 m!1266991))

(declare-fun m!1266993 () Bool)

(assert (=> b!1381808 m!1266993))

(declare-fun m!1266995 () Bool)

(assert (=> start!117954 m!1266995))

(declare-fun m!1266997 () Bool)

(assert (=> start!117954 m!1266997))

(check-sat (not b!1381807) (not b!1381809) (not b!1381808) (not start!117954))
(check-sat)
