; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118484 () Bool)

(assert start!118484)

(declare-fun b!1385495 () Bool)

(declare-fun res!926743 () Bool)

(declare-fun e!785017 () Bool)

(assert (=> b!1385495 (=> (not res!926743) (not e!785017))))

(declare-datatypes ((array!94760 0))(
  ( (array!94761 (arr!45756 (Array (_ BitVec 32) (_ BitVec 64))) (size!46306 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94760)

(declare-datatypes ((List!32284 0))(
  ( (Nil!32281) (Cons!32280 (h!33489 (_ BitVec 64)) (t!46978 List!32284)) )
))
(declare-fun arrayNoDuplicates!0 (array!94760 (_ BitVec 32) List!32284) Bool)

(assert (=> b!1385495 (= res!926743 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32281))))

(declare-fun b!1385493 () Bool)

(declare-fun res!926745 () Bool)

(assert (=> b!1385493 (=> (not res!926745) (not e!785017))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385493 (= res!926745 (and (= (size!46306 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46306 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46306 a!2938))))))

(declare-fun b!1385496 () Bool)

(assert (=> b!1385496 (= e!785017 false)))

(declare-fun lt!609258 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94760 (_ BitVec 32)) Bool)

(assert (=> b!1385496 (= lt!609258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926746 () Bool)

(assert (=> start!118484 (=> (not res!926746) (not e!785017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118484 (= res!926746 (validMask!0 mask!2987))))

(assert (=> start!118484 e!785017))

(assert (=> start!118484 true))

(declare-fun array_inv!34784 (array!94760) Bool)

(assert (=> start!118484 (array_inv!34784 a!2938)))

(declare-fun b!1385494 () Bool)

(declare-fun res!926744 () Bool)

(assert (=> b!1385494 (=> (not res!926744) (not e!785017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385494 (= res!926744 (validKeyInArray!0 (select (arr!45756 a!2938) i!1065)))))

(assert (= (and start!118484 res!926746) b!1385493))

(assert (= (and b!1385493 res!926745) b!1385494))

(assert (= (and b!1385494 res!926744) b!1385495))

(assert (= (and b!1385495 res!926743) b!1385496))

(declare-fun m!1270785 () Bool)

(assert (=> b!1385495 m!1270785))

(declare-fun m!1270787 () Bool)

(assert (=> b!1385496 m!1270787))

(declare-fun m!1270789 () Bool)

(assert (=> start!118484 m!1270789))

(declare-fun m!1270791 () Bool)

(assert (=> start!118484 m!1270791))

(declare-fun m!1270793 () Bool)

(assert (=> b!1385494 m!1270793))

(assert (=> b!1385494 m!1270793))

(declare-fun m!1270795 () Bool)

(assert (=> b!1385494 m!1270795))

(check-sat (not b!1385494) (not b!1385496) (not start!118484) (not b!1385495))
