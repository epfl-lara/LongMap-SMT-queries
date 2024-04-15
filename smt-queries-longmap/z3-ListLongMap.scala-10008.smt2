; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118082 () Bool)

(assert start!118082)

(declare-fun b!1382508 () Bool)

(declare-fun res!924145 () Bool)

(declare-fun e!783607 () Bool)

(assert (=> b!1382508 (=> (not res!924145) (not e!783607))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94398 0))(
  ( (array!94399 (arr!45580 (Array (_ BitVec 32) (_ BitVec 64))) (size!46132 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94398)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382508 (= res!924145 (and (= (size!46132 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46132 a!2971))))))

(declare-fun b!1382510 () Bool)

(declare-fun res!924143 () Bool)

(assert (=> b!1382510 (=> (not res!924143) (not e!783607))))

(declare-datatypes ((List!32192 0))(
  ( (Nil!32189) (Cons!32188 (h!33397 (_ BitVec 64)) (t!46878 List!32192)) )
))
(declare-fun arrayNoDuplicates!0 (array!94398 (_ BitVec 32) List!32192) Bool)

(assert (=> b!1382510 (= res!924143 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32189))))

(declare-fun res!924146 () Bool)

(assert (=> start!118082 (=> (not res!924146) (not e!783607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118082 (= res!924146 (validMask!0 mask!3034))))

(assert (=> start!118082 e!783607))

(assert (=> start!118082 true))

(declare-fun array_inv!34813 (array!94398) Bool)

(assert (=> start!118082 (array_inv!34813 a!2971)))

(declare-fun b!1382509 () Bool)

(declare-fun res!924144 () Bool)

(assert (=> b!1382509 (=> (not res!924144) (not e!783607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382509 (= res!924144 (validKeyInArray!0 (select (arr!45580 a!2971) i!1094)))))

(declare-fun b!1382511 () Bool)

(assert (=> b!1382511 (= e!783607 false)))

(declare-fun lt!608267 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94398 (_ BitVec 32)) Bool)

(assert (=> b!1382511 (= lt!608267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118082 res!924146) b!1382508))

(assert (= (and b!1382508 res!924145) b!1382509))

(assert (= (and b!1382509 res!924144) b!1382510))

(assert (= (and b!1382510 res!924143) b!1382511))

(declare-fun m!1267203 () Bool)

(assert (=> b!1382510 m!1267203))

(declare-fun m!1267205 () Bool)

(assert (=> start!118082 m!1267205))

(declare-fun m!1267207 () Bool)

(assert (=> start!118082 m!1267207))

(declare-fun m!1267209 () Bool)

(assert (=> b!1382509 m!1267209))

(assert (=> b!1382509 m!1267209))

(declare-fun m!1267211 () Bool)

(assert (=> b!1382509 m!1267211))

(declare-fun m!1267213 () Bool)

(assert (=> b!1382511 m!1267213))

(check-sat (not b!1382511) (not start!118082) (not b!1382510) (not b!1382509))
(check-sat)
