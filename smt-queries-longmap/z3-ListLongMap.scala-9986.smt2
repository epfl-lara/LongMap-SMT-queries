; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117924 () Bool)

(assert start!117924)

(declare-fun res!923254 () Bool)

(declare-fun e!783185 () Bool)

(assert (=> start!117924 (=> (not res!923254) (not e!783185))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117924 (= res!923254 (validMask!0 mask!3034))))

(assert (=> start!117924 e!783185))

(assert (=> start!117924 true))

(declare-datatypes ((array!94315 0))(
  ( (array!94316 (arr!45540 (Array (_ BitVec 32) (_ BitVec 64))) (size!46090 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94315)

(declare-fun array_inv!34568 (array!94315) Bool)

(assert (=> start!117924 (array_inv!34568 a!2971)))

(declare-fun b!1381627 () Bool)

(declare-fun res!923255 () Bool)

(assert (=> b!1381627 (=> (not res!923255) (not e!783185))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381627 (= res!923255 (validKeyInArray!0 (select (arr!45540 a!2971) i!1094)))))

(declare-fun b!1381628 () Bool)

(declare-fun res!923256 () Bool)

(assert (=> b!1381628 (=> (not res!923256) (not e!783185))))

(declare-datatypes ((List!32074 0))(
  ( (Nil!32071) (Cons!32070 (h!33279 (_ BitVec 64)) (t!46768 List!32074)) )
))
(declare-fun arrayNoDuplicates!0 (array!94315 (_ BitVec 32) List!32074) Bool)

(assert (=> b!1381628 (= res!923256 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32071))))

(declare-fun b!1381629 () Bool)

(assert (=> b!1381629 (= e!783185 false)))

(declare-fun lt!608247 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94315 (_ BitVec 32)) Bool)

(assert (=> b!1381629 (= lt!608247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381626 () Bool)

(declare-fun res!923257 () Bool)

(assert (=> b!1381626 (=> (not res!923257) (not e!783185))))

(assert (=> b!1381626 (= res!923257 (and (= (size!46090 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46090 a!2971))))))

(assert (= (and start!117924 res!923254) b!1381626))

(assert (= (and b!1381626 res!923257) b!1381627))

(assert (= (and b!1381627 res!923255) b!1381628))

(assert (= (and b!1381628 res!923256) b!1381629))

(declare-fun m!1266807 () Bool)

(assert (=> start!117924 m!1266807))

(declare-fun m!1266809 () Bool)

(assert (=> start!117924 m!1266809))

(declare-fun m!1266811 () Bool)

(assert (=> b!1381627 m!1266811))

(assert (=> b!1381627 m!1266811))

(declare-fun m!1266813 () Bool)

(assert (=> b!1381627 m!1266813))

(declare-fun m!1266815 () Bool)

(assert (=> b!1381628 m!1266815))

(declare-fun m!1266817 () Bool)

(assert (=> b!1381629 m!1266817))

(check-sat (not b!1381629) (not start!117924) (not b!1381628) (not b!1381627))
(check-sat)
