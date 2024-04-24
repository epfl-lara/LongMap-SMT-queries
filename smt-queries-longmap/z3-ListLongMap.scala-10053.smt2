; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118664 () Bool)

(assert start!118664)

(declare-fun b!1386602 () Bool)

(declare-fun res!927063 () Bool)

(declare-fun e!785770 () Bool)

(assert (=> b!1386602 (=> (not res!927063) (not e!785770))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94838 0))(
  ( (array!94839 (arr!45793 (Array (_ BitVec 32) (_ BitVec 64))) (size!46344 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94838)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386602 (= res!927063 (and (= (size!46344 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46344 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46344 a!2938))))))

(declare-fun b!1386603 () Bool)

(assert (=> b!1386603 (= e!785770 (bvslt (bvsub (size!46344 a!2938) startIndex!16) #b00000000000000000000000000000000))))

(declare-fun b!1386604 () Bool)

(declare-fun res!927067 () Bool)

(assert (=> b!1386604 (=> (not res!927067) (not e!785770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94838 (_ BitVec 32)) Bool)

(assert (=> b!1386604 (= res!927067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386605 () Bool)

(declare-fun res!927066 () Bool)

(assert (=> b!1386605 (=> (not res!927066) (not e!785770))))

(declare-datatypes ((List!32308 0))(
  ( (Nil!32305) (Cons!32304 (h!33522 (_ BitVec 64)) (t!46994 List!32308)) )
))
(declare-fun arrayNoDuplicates!0 (array!94838 (_ BitVec 32) List!32308) Bool)

(assert (=> b!1386605 (= res!927066 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32305))))

(declare-fun b!1386606 () Bool)

(declare-fun res!927065 () Bool)

(assert (=> b!1386606 (=> (not res!927065) (not e!785770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386606 (= res!927065 (validKeyInArray!0 (select (arr!45793 a!2938) i!1065)))))

(declare-fun res!927064 () Bool)

(assert (=> start!118664 (=> (not res!927064) (not e!785770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118664 (= res!927064 (validMask!0 mask!2987))))

(assert (=> start!118664 e!785770))

(assert (=> start!118664 true))

(declare-fun array_inv!35074 (array!94838) Bool)

(assert (=> start!118664 (array_inv!35074 a!2938)))

(assert (= (and start!118664 res!927064) b!1386602))

(assert (= (and b!1386602 res!927063) b!1386606))

(assert (= (and b!1386606 res!927065) b!1386605))

(assert (= (and b!1386605 res!927066) b!1386604))

(assert (= (and b!1386604 res!927067) b!1386603))

(declare-fun m!1272225 () Bool)

(assert (=> b!1386604 m!1272225))

(declare-fun m!1272227 () Bool)

(assert (=> b!1386605 m!1272227))

(declare-fun m!1272229 () Bool)

(assert (=> b!1386606 m!1272229))

(assert (=> b!1386606 m!1272229))

(declare-fun m!1272231 () Bool)

(assert (=> b!1386606 m!1272231))

(declare-fun m!1272233 () Bool)

(assert (=> start!118664 m!1272233))

(declare-fun m!1272235 () Bool)

(assert (=> start!118664 m!1272235))

(check-sat (not b!1386606) (not b!1386605) (not b!1386604) (not start!118664))
(check-sat)
