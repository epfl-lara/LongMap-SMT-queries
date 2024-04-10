; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118490 () Bool)

(assert start!118490)

(declare-fun b!1385531 () Bool)

(declare-fun res!926782 () Bool)

(declare-fun e!785036 () Bool)

(assert (=> b!1385531 (=> (not res!926782) (not e!785036))))

(declare-datatypes ((array!94766 0))(
  ( (array!94767 (arr!45759 (Array (_ BitVec 32) (_ BitVec 64))) (size!46309 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94766)

(declare-datatypes ((List!32287 0))(
  ( (Nil!32284) (Cons!32283 (h!33492 (_ BitVec 64)) (t!46981 List!32287)) )
))
(declare-fun arrayNoDuplicates!0 (array!94766 (_ BitVec 32) List!32287) Bool)

(assert (=> b!1385531 (= res!926782 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32284))))

(declare-fun b!1385530 () Bool)

(declare-fun res!926779 () Bool)

(assert (=> b!1385530 (=> (not res!926779) (not e!785036))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385530 (= res!926779 (validKeyInArray!0 (select (arr!45759 a!2938) i!1065)))))

(declare-fun b!1385532 () Bool)

(assert (=> b!1385532 (= e!785036 false)))

(declare-fun lt!609267 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94766 (_ BitVec 32)) Bool)

(assert (=> b!1385532 (= lt!609267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926781 () Bool)

(assert (=> start!118490 (=> (not res!926781) (not e!785036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118490 (= res!926781 (validMask!0 mask!2987))))

(assert (=> start!118490 e!785036))

(assert (=> start!118490 true))

(declare-fun array_inv!34787 (array!94766) Bool)

(assert (=> start!118490 (array_inv!34787 a!2938)))

(declare-fun b!1385529 () Bool)

(declare-fun res!926780 () Bool)

(assert (=> b!1385529 (=> (not res!926780) (not e!785036))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385529 (= res!926780 (and (= (size!46309 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46309 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46309 a!2938))))))

(assert (= (and start!118490 res!926781) b!1385529))

(assert (= (and b!1385529 res!926780) b!1385530))

(assert (= (and b!1385530 res!926779) b!1385531))

(assert (= (and b!1385531 res!926782) b!1385532))

(declare-fun m!1270821 () Bool)

(assert (=> b!1385531 m!1270821))

(declare-fun m!1270823 () Bool)

(assert (=> b!1385530 m!1270823))

(assert (=> b!1385530 m!1270823))

(declare-fun m!1270825 () Bool)

(assert (=> b!1385530 m!1270825))

(declare-fun m!1270827 () Bool)

(assert (=> b!1385532 m!1270827))

(declare-fun m!1270829 () Bool)

(assert (=> start!118490 m!1270829))

(declare-fun m!1270831 () Bool)

(assert (=> start!118490 m!1270831))

(check-sat (not b!1385532) (not b!1385530) (not b!1385531) (not start!118490))
