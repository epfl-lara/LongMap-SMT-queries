; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130644 () Bool)

(assert start!130644)

(declare-fun b!1532570 () Bool)

(declare-fun res!1049844 () Bool)

(declare-fun e!853864 () Bool)

(assert (=> b!1532570 (=> (not res!1049844) (not e!853864))))

(declare-datatypes ((array!101740 0))(
  ( (array!101741 (arr!49087 (Array (_ BitVec 32) (_ BitVec 64))) (size!49639 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101740)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101740 (_ BitVec 32)) Bool)

(assert (=> b!1532570 (= res!1049844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1049841 () Bool)

(assert (=> start!130644 (=> (not res!1049841) (not e!853864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130644 (= res!1049841 (validMask!0 mask!2480))))

(assert (=> start!130644 e!853864))

(assert (=> start!130644 true))

(declare-fun array_inv!38320 (array!101740) Bool)

(assert (=> start!130644 (array_inv!38320 a!2792)))

(declare-fun b!1532571 () Bool)

(declare-fun res!1049842 () Bool)

(assert (=> b!1532571 (=> (not res!1049842) (not e!853864))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532571 (= res!1049842 (and (= (size!49639 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49639 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49639 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532572 () Bool)

(declare-fun res!1049845 () Bool)

(assert (=> b!1532572 (=> (not res!1049845) (not e!853864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532572 (= res!1049845 (validKeyInArray!0 (select (arr!49087 a!2792) j!64)))))

(declare-fun b!1532573 () Bool)

(declare-fun res!1049840 () Bool)

(assert (=> b!1532573 (=> (not res!1049840) (not e!853864))))

(declare-datatypes ((List!35639 0))(
  ( (Nil!35636) (Cons!35635 (h!37081 (_ BitVec 64)) (t!50325 List!35639)) )
))
(declare-fun arrayNoDuplicates!0 (array!101740 (_ BitVec 32) List!35639) Bool)

(assert (=> b!1532573 (= res!1049840 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35636))))

(declare-fun b!1532574 () Bool)

(declare-fun res!1049843 () Bool)

(assert (=> b!1532574 (=> (not res!1049843) (not e!853864))))

(assert (=> b!1532574 (= res!1049843 (validKeyInArray!0 (select (arr!49087 a!2792) i!951)))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun b!1532575 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532575 (= e!853864 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49639 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49639 a!2792)) (= (select (arr!49087 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(assert (= (and start!130644 res!1049841) b!1532571))

(assert (= (and b!1532571 res!1049842) b!1532574))

(assert (= (and b!1532574 res!1049843) b!1532572))

(assert (= (and b!1532572 res!1049845) b!1532570))

(assert (= (and b!1532570 res!1049844) b!1532573))

(assert (= (and b!1532573 res!1049840) b!1532575))

(declare-fun m!1414697 () Bool)

(assert (=> b!1532572 m!1414697))

(assert (=> b!1532572 m!1414697))

(declare-fun m!1414699 () Bool)

(assert (=> b!1532572 m!1414699))

(declare-fun m!1414701 () Bool)

(assert (=> b!1532575 m!1414701))

(declare-fun m!1414703 () Bool)

(assert (=> b!1532573 m!1414703))

(declare-fun m!1414705 () Bool)

(assert (=> start!130644 m!1414705))

(declare-fun m!1414707 () Bool)

(assert (=> start!130644 m!1414707))

(declare-fun m!1414709 () Bool)

(assert (=> b!1532570 m!1414709))

(declare-fun m!1414711 () Bool)

(assert (=> b!1532574 m!1414711))

(assert (=> b!1532574 m!1414711))

(declare-fun m!1414713 () Bool)

(assert (=> b!1532574 m!1414713))

(check-sat (not b!1532573) (not b!1532572) (not start!130644) (not b!1532574) (not b!1532570))
(check-sat)
