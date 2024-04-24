; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128666 () Bool)

(assert start!128666)

(declare-fun b!1507688 () Bool)

(declare-fun res!1026907 () Bool)

(declare-fun e!842793 () Bool)

(assert (=> b!1507688 (=> (not res!1026907) (not e!842793))))

(declare-datatypes ((array!100552 0))(
  ( (array!100553 (arr!48517 (Array (_ BitVec 32) (_ BitVec 64))) (size!49068 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100552)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507688 (= res!1026907 (validKeyInArray!0 (select (arr!48517 a!2804) i!961)))))

(declare-fun b!1507689 () Bool)

(declare-fun res!1026905 () Bool)

(assert (=> b!1507689 (=> (not res!1026905) (not e!842793))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507689 (= res!1026905 (validKeyInArray!0 (select (arr!48517 a!2804) j!70)))))

(declare-fun b!1507690 () Bool)

(declare-fun res!1026904 () Bool)

(assert (=> b!1507690 (=> (not res!1026904) (not e!842793))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1507690 (= res!1026904 (and (= (size!49068 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49068 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49068 a!2804)) (not (= i!961 j!70))))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1507691 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507691 (= e!842793 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49068 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49068 a!2804)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun b!1507692 () Bool)

(declare-fun res!1026906 () Bool)

(assert (=> b!1507692 (=> (not res!1026906) (not e!842793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100552 (_ BitVec 32)) Bool)

(assert (=> b!1507692 (= res!1026906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507693 () Bool)

(declare-fun res!1026908 () Bool)

(assert (=> b!1507693 (=> (not res!1026908) (not e!842793))))

(declare-datatypes ((List!34987 0))(
  ( (Nil!34984) (Cons!34983 (h!36395 (_ BitVec 64)) (t!49673 List!34987)) )
))
(declare-fun arrayNoDuplicates!0 (array!100552 (_ BitVec 32) List!34987) Bool)

(assert (=> b!1507693 (= res!1026908 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34984))))

(declare-fun res!1026903 () Bool)

(assert (=> start!128666 (=> (not res!1026903) (not e!842793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128666 (= res!1026903 (validMask!0 mask!2512))))

(assert (=> start!128666 e!842793))

(assert (=> start!128666 true))

(declare-fun array_inv!37798 (array!100552) Bool)

(assert (=> start!128666 (array_inv!37798 a!2804)))

(assert (= (and start!128666 res!1026903) b!1507690))

(assert (= (and b!1507690 res!1026904) b!1507688))

(assert (= (and b!1507688 res!1026907) b!1507689))

(assert (= (and b!1507689 res!1026905) b!1507692))

(assert (= (and b!1507692 res!1026906) b!1507693))

(assert (= (and b!1507693 res!1026908) b!1507691))

(declare-fun m!1390719 () Bool)

(assert (=> start!128666 m!1390719))

(declare-fun m!1390721 () Bool)

(assert (=> start!128666 m!1390721))

(declare-fun m!1390723 () Bool)

(assert (=> b!1507689 m!1390723))

(assert (=> b!1507689 m!1390723))

(declare-fun m!1390725 () Bool)

(assert (=> b!1507689 m!1390725))

(declare-fun m!1390727 () Bool)

(assert (=> b!1507688 m!1390727))

(assert (=> b!1507688 m!1390727))

(declare-fun m!1390729 () Bool)

(assert (=> b!1507688 m!1390729))

(declare-fun m!1390731 () Bool)

(assert (=> b!1507693 m!1390731))

(declare-fun m!1390733 () Bool)

(assert (=> b!1507692 m!1390733))

(check-sat (not b!1507692) (not start!128666) (not b!1507689) (not b!1507693) (not b!1507688))
(check-sat)
