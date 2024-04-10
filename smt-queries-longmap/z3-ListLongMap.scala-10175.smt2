; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119978 () Bool)

(assert start!119978)

(declare-fun b!1396663 () Bool)

(declare-fun res!935581 () Bool)

(declare-fun e!790702 () Bool)

(assert (=> b!1396663 (=> (not res!935581) (not e!790702))))

(declare-datatypes ((array!95507 0))(
  ( (array!95508 (arr!46107 (Array (_ BitVec 32) (_ BitVec 64))) (size!46657 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95507)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396663 (= res!935581 (validKeyInArray!0 (select (arr!46107 a!2901) i!1037)))))

(declare-fun b!1396664 () Bool)

(declare-fun e!790699 () Bool)

(declare-fun e!790701 () Bool)

(assert (=> b!1396664 (= e!790699 e!790701)))

(declare-fun res!935582 () Bool)

(assert (=> b!1396664 (=> res!935582 e!790701)))

(declare-datatypes ((SeekEntryResult!10424 0))(
  ( (MissingZero!10424 (index!44067 (_ BitVec 32))) (Found!10424 (index!44068 (_ BitVec 32))) (Intermediate!10424 (undefined!11236 Bool) (index!44069 (_ BitVec 32)) (x!125734 (_ BitVec 32))) (Undefined!10424) (MissingVacant!10424 (index!44070 (_ BitVec 32))) )
))
(declare-fun lt!613603 () SeekEntryResult!10424)

(declare-fun lt!613604 () (_ BitVec 32))

(declare-fun lt!613601 () SeekEntryResult!10424)

(get-info :version)

(assert (=> b!1396664 (= res!935582 (or (= lt!613603 lt!613601) (not ((_ is Intermediate!10424) lt!613601)) (bvslt (x!125734 lt!613603) #b00000000000000000000000000000000) (bvsgt (x!125734 lt!613603) #b01111111111111111111111111111110) (bvslt lt!613604 #b00000000000000000000000000000000) (bvsge lt!613604 (size!46657 a!2901)) (bvslt (index!44069 lt!613603) #b00000000000000000000000000000000) (bvsge (index!44069 lt!613603) (size!46657 a!2901)) (not (= lt!613603 (Intermediate!10424 false (index!44069 lt!613603) (x!125734 lt!613603)))) (not (= lt!613601 (Intermediate!10424 (undefined!11236 lt!613601) (index!44069 lt!613601) (x!125734 lt!613601))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613600 () (_ BitVec 64))

(declare-fun lt!613605 () array!95507)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95507 (_ BitVec 32)) SeekEntryResult!10424)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396664 (= lt!613601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613600 mask!2840) lt!613600 lt!613605 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396664 (= lt!613600 (select (store (arr!46107 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396664 (= lt!613605 (array!95508 (store (arr!46107 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46657 a!2901)))))

(declare-fun b!1396665 () Bool)

(declare-fun res!935583 () Bool)

(assert (=> b!1396665 (=> (not res!935583) (not e!790702))))

(assert (=> b!1396665 (= res!935583 (and (= (size!46657 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46657 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46657 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396666 () Bool)

(assert (=> b!1396666 (= e!790702 (not e!790699))))

(declare-fun res!935576 () Bool)

(assert (=> b!1396666 (=> res!935576 e!790699)))

(assert (=> b!1396666 (= res!935576 (or (not ((_ is Intermediate!10424) lt!613603)) (undefined!11236 lt!613603)))))

(declare-fun e!790703 () Bool)

(assert (=> b!1396666 e!790703))

(declare-fun res!935579 () Bool)

(assert (=> b!1396666 (=> (not res!935579) (not e!790703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95507 (_ BitVec 32)) Bool)

(assert (=> b!1396666 (= res!935579 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46852 0))(
  ( (Unit!46853) )
))
(declare-fun lt!613599 () Unit!46852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46852)

(assert (=> b!1396666 (= lt!613599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396666 (= lt!613603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613604 (select (arr!46107 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396666 (= lt!613604 (toIndex!0 (select (arr!46107 a!2901) j!112) mask!2840))))

(declare-fun b!1396667 () Bool)

(assert (=> b!1396667 (= e!790701 true)))

(declare-fun lt!613602 () SeekEntryResult!10424)

(assert (=> b!1396667 (= lt!613602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613604 lt!613600 lt!613605 mask!2840))))

(declare-fun res!935578 () Bool)

(assert (=> start!119978 (=> (not res!935578) (not e!790702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119978 (= res!935578 (validMask!0 mask!2840))))

(assert (=> start!119978 e!790702))

(assert (=> start!119978 true))

(declare-fun array_inv!35135 (array!95507) Bool)

(assert (=> start!119978 (array_inv!35135 a!2901)))

(declare-fun b!1396668 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95507 (_ BitVec 32)) SeekEntryResult!10424)

(assert (=> b!1396668 (= e!790703 (= (seekEntryOrOpen!0 (select (arr!46107 a!2901) j!112) a!2901 mask!2840) (Found!10424 j!112)))))

(declare-fun b!1396669 () Bool)

(declare-fun res!935584 () Bool)

(assert (=> b!1396669 (=> (not res!935584) (not e!790702))))

(declare-datatypes ((List!32626 0))(
  ( (Nil!32623) (Cons!32622 (h!33864 (_ BitVec 64)) (t!47320 List!32626)) )
))
(declare-fun arrayNoDuplicates!0 (array!95507 (_ BitVec 32) List!32626) Bool)

(assert (=> b!1396669 (= res!935584 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32623))))

(declare-fun b!1396670 () Bool)

(declare-fun res!935580 () Bool)

(assert (=> b!1396670 (=> (not res!935580) (not e!790702))))

(assert (=> b!1396670 (= res!935580 (validKeyInArray!0 (select (arr!46107 a!2901) j!112)))))

(declare-fun b!1396671 () Bool)

(declare-fun res!935577 () Bool)

(assert (=> b!1396671 (=> (not res!935577) (not e!790702))))

(assert (=> b!1396671 (= res!935577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119978 res!935578) b!1396665))

(assert (= (and b!1396665 res!935583) b!1396663))

(assert (= (and b!1396663 res!935581) b!1396670))

(assert (= (and b!1396670 res!935580) b!1396671))

(assert (= (and b!1396671 res!935577) b!1396669))

(assert (= (and b!1396669 res!935584) b!1396666))

(assert (= (and b!1396666 res!935579) b!1396668))

(assert (= (and b!1396666 (not res!935576)) b!1396664))

(assert (= (and b!1396664 (not res!935582)) b!1396667))

(declare-fun m!1283175 () Bool)

(assert (=> start!119978 m!1283175))

(declare-fun m!1283177 () Bool)

(assert (=> start!119978 m!1283177))

(declare-fun m!1283179 () Bool)

(assert (=> b!1396671 m!1283179))

(declare-fun m!1283181 () Bool)

(assert (=> b!1396664 m!1283181))

(assert (=> b!1396664 m!1283181))

(declare-fun m!1283183 () Bool)

(assert (=> b!1396664 m!1283183))

(declare-fun m!1283185 () Bool)

(assert (=> b!1396664 m!1283185))

(declare-fun m!1283187 () Bool)

(assert (=> b!1396664 m!1283187))

(declare-fun m!1283189 () Bool)

(assert (=> b!1396667 m!1283189))

(declare-fun m!1283191 () Bool)

(assert (=> b!1396663 m!1283191))

(assert (=> b!1396663 m!1283191))

(declare-fun m!1283193 () Bool)

(assert (=> b!1396663 m!1283193))

(declare-fun m!1283195 () Bool)

(assert (=> b!1396666 m!1283195))

(declare-fun m!1283197 () Bool)

(assert (=> b!1396666 m!1283197))

(assert (=> b!1396666 m!1283195))

(assert (=> b!1396666 m!1283195))

(declare-fun m!1283199 () Bool)

(assert (=> b!1396666 m!1283199))

(declare-fun m!1283201 () Bool)

(assert (=> b!1396666 m!1283201))

(declare-fun m!1283203 () Bool)

(assert (=> b!1396666 m!1283203))

(assert (=> b!1396668 m!1283195))

(assert (=> b!1396668 m!1283195))

(declare-fun m!1283205 () Bool)

(assert (=> b!1396668 m!1283205))

(assert (=> b!1396670 m!1283195))

(assert (=> b!1396670 m!1283195))

(declare-fun m!1283207 () Bool)

(assert (=> b!1396670 m!1283207))

(declare-fun m!1283209 () Bool)

(assert (=> b!1396669 m!1283209))

(check-sat (not b!1396666) (not b!1396670) (not b!1396664) (not b!1396667) (not b!1396663) (not b!1396668) (not start!119978) (not b!1396669) (not b!1396671))
(check-sat)
