; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118036 () Bool)

(assert start!118036)

(declare-fun b!1382281 () Bool)

(declare-fun res!923873 () Bool)

(declare-fun e!783494 () Bool)

(assert (=> b!1382281 (=> (not res!923873) (not e!783494))))

(declare-datatypes ((array!94400 0))(
  ( (array!94401 (arr!45581 (Array (_ BitVec 32) (_ BitVec 64))) (size!46131 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94400)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382281 (= res!923873 (validKeyInArray!0 (select (arr!45581 a!2971) i!1094)))))

(declare-fun b!1382280 () Bool)

(declare-fun res!923872 () Bool)

(assert (=> b!1382280 (=> (not res!923872) (not e!783494))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1382280 (= res!923872 (and (= (size!46131 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46131 a!2971))))))

(declare-fun b!1382283 () Bool)

(assert (=> b!1382283 (= e!783494 false)))

(declare-fun lt!608388 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94400 (_ BitVec 32)) Bool)

(assert (=> b!1382283 (= lt!608388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923874 () Bool)

(assert (=> start!118036 (=> (not res!923874) (not e!783494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118036 (= res!923874 (validMask!0 mask!3034))))

(assert (=> start!118036 e!783494))

(assert (=> start!118036 true))

(declare-fun array_inv!34609 (array!94400) Bool)

(assert (=> start!118036 (array_inv!34609 a!2971)))

(declare-fun b!1382282 () Bool)

(declare-fun res!923875 () Bool)

(assert (=> b!1382282 (=> (not res!923875) (not e!783494))))

(declare-datatypes ((List!32115 0))(
  ( (Nil!32112) (Cons!32111 (h!33320 (_ BitVec 64)) (t!46809 List!32115)) )
))
(declare-fun arrayNoDuplicates!0 (array!94400 (_ BitVec 32) List!32115) Bool)

(assert (=> b!1382282 (= res!923875 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32112))))

(assert (= (and start!118036 res!923874) b!1382280))

(assert (= (and b!1382280 res!923872) b!1382281))

(assert (= (and b!1382281 res!923873) b!1382282))

(assert (= (and b!1382282 res!923875) b!1382283))

(declare-fun m!1267419 () Bool)

(assert (=> b!1382281 m!1267419))

(assert (=> b!1382281 m!1267419))

(declare-fun m!1267421 () Bool)

(assert (=> b!1382281 m!1267421))

(declare-fun m!1267423 () Bool)

(assert (=> b!1382283 m!1267423))

(declare-fun m!1267425 () Bool)

(assert (=> start!118036 m!1267425))

(declare-fun m!1267427 () Bool)

(assert (=> start!118036 m!1267427))

(declare-fun m!1267429 () Bool)

(assert (=> b!1382282 m!1267429))

(push 1)

(assert (not b!1382281))

(assert (not start!118036))

(assert (not b!1382282))

(assert (not b!1382283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

