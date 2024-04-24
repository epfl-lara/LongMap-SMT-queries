; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121326 () Bool)

(assert start!121326)

(declare-fun b!1409642 () Bool)

(declare-fun res!946687 () Bool)

(declare-fun e!797864 () Bool)

(assert (=> b!1409642 (=> (not res!946687) (not e!797864))))

(declare-datatypes ((array!96402 0))(
  ( (array!96403 (arr!46542 (Array (_ BitVec 32) (_ BitVec 64))) (size!47093 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96402)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96402 (_ BitVec 32)) Bool)

(assert (=> b!1409642 (= res!946687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409644 () Bool)

(declare-fun e!797865 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10756 0))(
  ( (MissingZero!10756 (index!45401 (_ BitVec 32))) (Found!10756 (index!45402 (_ BitVec 32))) (Intermediate!10756 (undefined!11568 Bool) (index!45403 (_ BitVec 32)) (x!127152 (_ BitVec 32))) (Undefined!10756) (MissingVacant!10756 (index!45404 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96402 (_ BitVec 32)) SeekEntryResult!10756)

(assert (=> b!1409644 (= e!797865 (= (seekEntryOrOpen!0 (select (arr!46542 a!2901) j!112) a!2901 mask!2840) (Found!10756 j!112)))))

(declare-fun b!1409645 () Bool)

(declare-fun e!797866 () Bool)

(assert (=> b!1409645 (= e!797864 (not e!797866))))

(declare-fun res!946681 () Bool)

(assert (=> b!1409645 (=> res!946681 e!797866)))

(declare-fun lt!620769 () SeekEntryResult!10756)

(assert (=> b!1409645 (= res!946681 (or (not (is-Intermediate!10756 lt!620769)) (undefined!11568 lt!620769)))))

(assert (=> b!1409645 e!797865))

(declare-fun res!946686 () Bool)

(assert (=> b!1409645 (=> (not res!946686) (not e!797865))))

(assert (=> b!1409645 (= res!946686 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47513 0))(
  ( (Unit!47514) )
))
(declare-fun lt!620770 () Unit!47513)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47513)

(assert (=> b!1409645 (= lt!620770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96402 (_ BitVec 32)) SeekEntryResult!10756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409645 (= lt!620769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46542 a!2901) j!112) mask!2840) (select (arr!46542 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409646 () Bool)

(declare-fun res!946685 () Bool)

(assert (=> b!1409646 (=> (not res!946685) (not e!797864))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409646 (= res!946685 (validKeyInArray!0 (select (arr!46542 a!2901) i!1037)))))

(declare-fun b!1409647 () Bool)

(assert (=> b!1409647 (= e!797866 true)))

(declare-fun lt!620771 () SeekEntryResult!10756)

(assert (=> b!1409647 (= lt!620771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96403 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)) mask!2840))))

(declare-fun res!946682 () Bool)

(assert (=> start!121326 (=> (not res!946682) (not e!797864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121326 (= res!946682 (validMask!0 mask!2840))))

(assert (=> start!121326 e!797864))

(assert (=> start!121326 true))

(declare-fun array_inv!35823 (array!96402) Bool)

(assert (=> start!121326 (array_inv!35823 a!2901)))

(declare-fun b!1409643 () Bool)

(declare-fun res!946680 () Bool)

(assert (=> b!1409643 (=> (not res!946680) (not e!797864))))

(declare-datatypes ((List!33048 0))(
  ( (Nil!33045) (Cons!33044 (h!34315 (_ BitVec 64)) (t!47734 List!33048)) )
))
(declare-fun arrayNoDuplicates!0 (array!96402 (_ BitVec 32) List!33048) Bool)

(assert (=> b!1409643 (= res!946680 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33045))))

(declare-fun b!1409648 () Bool)

(declare-fun res!946683 () Bool)

(assert (=> b!1409648 (=> (not res!946683) (not e!797864))))

(assert (=> b!1409648 (= res!946683 (and (= (size!47093 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47093 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47093 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409649 () Bool)

(declare-fun res!946684 () Bool)

(assert (=> b!1409649 (=> (not res!946684) (not e!797864))))

(assert (=> b!1409649 (= res!946684 (validKeyInArray!0 (select (arr!46542 a!2901) j!112)))))

(assert (= (and start!121326 res!946682) b!1409648))

(assert (= (and b!1409648 res!946683) b!1409646))

(assert (= (and b!1409646 res!946685) b!1409649))

(assert (= (and b!1409649 res!946684) b!1409642))

(assert (= (and b!1409642 res!946687) b!1409643))

(assert (= (and b!1409643 res!946680) b!1409645))

(assert (= (and b!1409645 res!946686) b!1409644))

(assert (= (and b!1409645 (not res!946681)) b!1409647))

(declare-fun m!1299201 () Bool)

(assert (=> b!1409644 m!1299201))

(assert (=> b!1409644 m!1299201))

(declare-fun m!1299203 () Bool)

(assert (=> b!1409644 m!1299203))

(declare-fun m!1299205 () Bool)

(assert (=> b!1409646 m!1299205))

(assert (=> b!1409646 m!1299205))

(declare-fun m!1299207 () Bool)

(assert (=> b!1409646 m!1299207))

(declare-fun m!1299209 () Bool)

(assert (=> start!121326 m!1299209))

(declare-fun m!1299211 () Bool)

(assert (=> start!121326 m!1299211))

(declare-fun m!1299213 () Bool)

(assert (=> b!1409642 m!1299213))

(declare-fun m!1299215 () Bool)

(assert (=> b!1409643 m!1299215))

(assert (=> b!1409645 m!1299201))

(declare-fun m!1299217 () Bool)

(assert (=> b!1409645 m!1299217))

(assert (=> b!1409645 m!1299201))

(declare-fun m!1299219 () Bool)

(assert (=> b!1409645 m!1299219))

(assert (=> b!1409645 m!1299217))

(assert (=> b!1409645 m!1299201))

(declare-fun m!1299221 () Bool)

(assert (=> b!1409645 m!1299221))

(declare-fun m!1299223 () Bool)

(assert (=> b!1409645 m!1299223))

(declare-fun m!1299225 () Bool)

(assert (=> b!1409647 m!1299225))

(declare-fun m!1299227 () Bool)

(assert (=> b!1409647 m!1299227))

(assert (=> b!1409647 m!1299227))

(declare-fun m!1299229 () Bool)

(assert (=> b!1409647 m!1299229))

(assert (=> b!1409647 m!1299229))

(assert (=> b!1409647 m!1299227))

(declare-fun m!1299231 () Bool)

(assert (=> b!1409647 m!1299231))

(assert (=> b!1409649 m!1299201))

(assert (=> b!1409649 m!1299201))

(declare-fun m!1299233 () Bool)

(assert (=> b!1409649 m!1299233))

(push 1)

(assert (not b!1409642))

(assert (not b!1409646))

(assert (not b!1409643))

(assert (not b!1409645))

(assert (not start!121326))

(assert (not b!1409647))

(assert (not b!1409644))

(assert (not b!1409649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

