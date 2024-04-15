; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117902 () Bool)

(assert start!117902)

(declare-fun res!923109 () Bool)

(declare-fun e!783093 () Bool)

(assert (=> start!117902 (=> (not res!923109) (not e!783093))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117902 (= res!923109 (validMask!0 mask!3034))))

(assert (=> start!117902 e!783093))

(assert (=> start!117902 true))

(declare-datatypes ((array!94245 0))(
  ( (array!94246 (arr!45505 (Array (_ BitVec 32) (_ BitVec 64))) (size!46057 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94245)

(declare-fun array_inv!34738 (array!94245) Bool)

(assert (=> start!117902 (array_inv!34738 a!2971)))

(declare-fun b!1381440 () Bool)

(assert (=> b!1381440 (= e!783093 (bvsgt #b00000000000000000000000000000000 (size!46057 a!2971)))))

(declare-fun b!1381439 () Bool)

(declare-fun res!923108 () Bool)

(assert (=> b!1381439 (=> (not res!923108) (not e!783093))))

(declare-datatypes ((List!32117 0))(
  ( (Nil!32114) (Cons!32113 (h!33322 (_ BitVec 64)) (t!46803 List!32117)) )
))
(declare-fun arrayNoDuplicates!0 (array!94245 (_ BitVec 32) List!32117) Bool)

(assert (=> b!1381439 (= res!923108 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32114))))

(declare-fun b!1381437 () Bool)

(declare-fun res!923110 () Bool)

(assert (=> b!1381437 (=> (not res!923110) (not e!783093))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381437 (= res!923110 (and (= (size!46057 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46057 a!2971))))))

(declare-fun b!1381438 () Bool)

(declare-fun res!923111 () Bool)

(assert (=> b!1381438 (=> (not res!923111) (not e!783093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381438 (= res!923111 (validKeyInArray!0 (select (arr!45505 a!2971) i!1094)))))

(assert (= (and start!117902 res!923109) b!1381437))

(assert (= (and b!1381437 res!923110) b!1381438))

(assert (= (and b!1381438 res!923111) b!1381439))

(assert (= (and b!1381439 res!923108) b!1381440))

(declare-fun m!1266189 () Bool)

(assert (=> start!117902 m!1266189))

(declare-fun m!1266191 () Bool)

(assert (=> start!117902 m!1266191))

(declare-fun m!1266193 () Bool)

(assert (=> b!1381439 m!1266193))

(declare-fun m!1266195 () Bool)

(assert (=> b!1381438 m!1266195))

(assert (=> b!1381438 m!1266195))

(declare-fun m!1266197 () Bool)

(assert (=> b!1381438 m!1266197))

(check-sat (not b!1381439) (not b!1381438) (not start!117902))
(check-sat)
