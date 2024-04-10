; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130708 () Bool)

(assert start!130708)

(declare-fun b!1533000 () Bool)

(declare-fun res!1050090 () Bool)

(declare-fun e!854104 () Bool)

(assert (=> b!1533000 (=> (not res!1050090) (not e!854104))))

(declare-datatypes ((array!101806 0))(
  ( (array!101807 (arr!49119 (Array (_ BitVec 32) (_ BitVec 64))) (size!49669 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101806)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533000 (= res!1050090 (validKeyInArray!0 (select (arr!49119 a!2792) i!951)))))

(declare-fun b!1533001 () Bool)

(declare-fun res!1050086 () Bool)

(assert (=> b!1533001 (=> (not res!1050086) (not e!854104))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533001 (= res!1050086 (validKeyInArray!0 (select (arr!49119 a!2792) j!64)))))

(declare-fun b!1533002 () Bool)

(declare-fun res!1050089 () Bool)

(assert (=> b!1533002 (=> (not res!1050089) (not e!854104))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101806 (_ BitVec 32)) Bool)

(assert (=> b!1533002 (= res!1050089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533003 () Bool)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533003 (= e!854104 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49669 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49669 a!2792)) (= (select (arr!49119 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1050088 () Bool)

(assert (=> start!130708 (=> (not res!1050088) (not e!854104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130708 (= res!1050088 (validMask!0 mask!2480))))

(assert (=> start!130708 e!854104))

(assert (=> start!130708 true))

(declare-fun array_inv!38147 (array!101806) Bool)

(assert (=> start!130708 (array_inv!38147 a!2792)))

(declare-fun b!1533004 () Bool)

(declare-fun res!1050091 () Bool)

(assert (=> b!1533004 (=> (not res!1050091) (not e!854104))))

(declare-datatypes ((List!35593 0))(
  ( (Nil!35590) (Cons!35589 (h!37034 (_ BitVec 64)) (t!50287 List!35593)) )
))
(declare-fun arrayNoDuplicates!0 (array!101806 (_ BitVec 32) List!35593) Bool)

(assert (=> b!1533004 (= res!1050091 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35590))))

(declare-fun b!1533005 () Bool)

(declare-fun res!1050087 () Bool)

(assert (=> b!1533005 (=> (not res!1050087) (not e!854104))))

(assert (=> b!1533005 (= res!1050087 (and (= (size!49669 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49669 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49669 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130708 res!1050088) b!1533005))

(assert (= (and b!1533005 res!1050087) b!1533000))

(assert (= (and b!1533000 res!1050090) b!1533001))

(assert (= (and b!1533001 res!1050086) b!1533002))

(assert (= (and b!1533002 res!1050089) b!1533004))

(assert (= (and b!1533004 res!1050091) b!1533003))

(declare-fun m!1415709 () Bool)

(assert (=> b!1533003 m!1415709))

(declare-fun m!1415711 () Bool)

(assert (=> b!1533004 m!1415711))

(declare-fun m!1415713 () Bool)

(assert (=> b!1533001 m!1415713))

(assert (=> b!1533001 m!1415713))

(declare-fun m!1415715 () Bool)

(assert (=> b!1533001 m!1415715))

(declare-fun m!1415717 () Bool)

(assert (=> b!1533000 m!1415717))

(assert (=> b!1533000 m!1415717))

(declare-fun m!1415719 () Bool)

(assert (=> b!1533000 m!1415719))

(declare-fun m!1415721 () Bool)

(assert (=> start!130708 m!1415721))

(declare-fun m!1415723 () Bool)

(assert (=> start!130708 m!1415723))

(declare-fun m!1415725 () Bool)

(assert (=> b!1533002 m!1415725))

(check-sat (not b!1533004) (not b!1533001) (not b!1533000) (not start!130708) (not b!1533002))
(check-sat)
