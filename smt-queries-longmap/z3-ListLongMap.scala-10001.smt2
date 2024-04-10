; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118044 () Bool)

(assert start!118044)

(declare-fun res!923922 () Bool)

(declare-fun e!783517 () Bool)

(assert (=> start!118044 (=> (not res!923922) (not e!783517))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118044 (= res!923922 (validMask!0 mask!3034))))

(assert (=> start!118044 e!783517))

(assert (=> start!118044 true))

(declare-datatypes ((array!94408 0))(
  ( (array!94409 (arr!45585 (Array (_ BitVec 32) (_ BitVec 64))) (size!46135 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94408)

(declare-fun array_inv!34613 (array!94408) Bool)

(assert (=> start!118044 (array_inv!34613 a!2971)))

(declare-fun b!1382330 () Bool)

(declare-fun res!923923 () Bool)

(assert (=> b!1382330 (=> (not res!923923) (not e!783517))))

(declare-datatypes ((List!32119 0))(
  ( (Nil!32116) (Cons!32115 (h!33324 (_ BitVec 64)) (t!46813 List!32119)) )
))
(declare-fun arrayNoDuplicates!0 (array!94408 (_ BitVec 32) List!32119) Bool)

(assert (=> b!1382330 (= res!923923 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32116))))

(declare-fun b!1382329 () Bool)

(declare-fun res!923921 () Bool)

(assert (=> b!1382329 (=> (not res!923921) (not e!783517))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382329 (= res!923921 (validKeyInArray!0 (select (arr!45585 a!2971) i!1094)))))

(declare-fun b!1382328 () Bool)

(declare-fun res!923920 () Bool)

(assert (=> b!1382328 (=> (not res!923920) (not e!783517))))

(assert (=> b!1382328 (= res!923920 (and (= (size!46135 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46135 a!2971))))))

(declare-fun b!1382331 () Bool)

(assert (=> b!1382331 (= e!783517 false)))

(declare-fun lt!608400 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94408 (_ BitVec 32)) Bool)

(assert (=> b!1382331 (= lt!608400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118044 res!923922) b!1382328))

(assert (= (and b!1382328 res!923920) b!1382329))

(assert (= (and b!1382329 res!923921) b!1382330))

(assert (= (and b!1382330 res!923923) b!1382331))

(declare-fun m!1267467 () Bool)

(assert (=> start!118044 m!1267467))

(declare-fun m!1267469 () Bool)

(assert (=> start!118044 m!1267469))

(declare-fun m!1267471 () Bool)

(assert (=> b!1382330 m!1267471))

(declare-fun m!1267473 () Bool)

(assert (=> b!1382329 m!1267473))

(assert (=> b!1382329 m!1267473))

(declare-fun m!1267475 () Bool)

(assert (=> b!1382329 m!1267475))

(declare-fun m!1267477 () Bool)

(assert (=> b!1382331 m!1267477))

(check-sat (not b!1382329) (not start!118044) (not b!1382330) (not b!1382331))
(check-sat)
