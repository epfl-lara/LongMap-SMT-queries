; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128800 () Bool)

(assert start!128800)

(declare-fun b!1509228 () Bool)

(declare-fun res!1029134 () Bool)

(declare-fun e!843034 () Bool)

(assert (=> b!1509228 (=> (not res!1029134) (not e!843034))))

(declare-datatypes ((array!100656 0))(
  ( (array!100657 (arr!48565 (Array (_ BitVec 32) (_ BitVec 64))) (size!49115 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100656)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509228 (= res!1029134 (validKeyInArray!0 (select (arr!48565 a!2804) j!70)))))

(declare-fun b!1509229 () Bool)

(declare-fun e!843033 () Bool)

(assert (=> b!1509229 (= e!843034 e!843033)))

(declare-fun res!1029138 () Bool)

(assert (=> b!1509229 (=> (not res!1029138) (not e!843033))))

(declare-datatypes ((SeekEntryResult!12736 0))(
  ( (MissingZero!12736 (index!53339 (_ BitVec 32))) (Found!12736 (index!53340 (_ BitVec 32))) (Intermediate!12736 (undefined!13548 Bool) (index!53341 (_ BitVec 32)) (x!135094 (_ BitVec 32))) (Undefined!12736) (MissingVacant!12736 (index!53342 (_ BitVec 32))) )
))
(declare-fun lt!654837 () SeekEntryResult!12736)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100656 (_ BitVec 32)) SeekEntryResult!12736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509229 (= res!1029138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48565 a!2804) j!70) mask!2512) (select (arr!48565 a!2804) j!70) a!2804 mask!2512) lt!654837))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509229 (= lt!654837 (Intermediate!12736 false resIndex!21 resX!21))))

(declare-fun res!1029137 () Bool)

(assert (=> start!128800 (=> (not res!1029137) (not e!843034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128800 (= res!1029137 (validMask!0 mask!2512))))

(assert (=> start!128800 e!843034))

(assert (=> start!128800 true))

(declare-fun array_inv!37593 (array!100656) Bool)

(assert (=> start!128800 (array_inv!37593 a!2804)))

(declare-fun b!1509230 () Bool)

(declare-fun res!1029132 () Bool)

(assert (=> b!1509230 (=> (not res!1029132) (not e!843034))))

(declare-datatypes ((List!35048 0))(
  ( (Nil!35045) (Cons!35044 (h!36456 (_ BitVec 64)) (t!49742 List!35048)) )
))
(declare-fun arrayNoDuplicates!0 (array!100656 (_ BitVec 32) List!35048) Bool)

(assert (=> b!1509230 (= res!1029132 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35045))))

(declare-fun b!1509231 () Bool)

(declare-fun res!1029139 () Bool)

(assert (=> b!1509231 (=> (not res!1029139) (not e!843034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100656 (_ BitVec 32)) Bool)

(assert (=> b!1509231 (= res!1029139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509232 () Bool)

(declare-fun res!1029131 () Bool)

(assert (=> b!1509232 (=> (not res!1029131) (not e!843034))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509232 (= res!1029131 (and (= (size!49115 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49115 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49115 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509233 () Bool)

(declare-fun res!1029135 () Bool)

(assert (=> b!1509233 (=> (not res!1029135) (not e!843033))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509233 (= res!1029135 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48565 a!2804) j!70) a!2804 mask!2512) lt!654837))))

(declare-fun b!1509234 () Bool)

(declare-fun res!1029133 () Bool)

(assert (=> b!1509234 (=> (not res!1029133) (not e!843034))))

(assert (=> b!1509234 (= res!1029133 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49115 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49115 a!2804))))))

(declare-fun b!1509235 () Bool)

(assert (=> b!1509235 (= e!843033 false)))

(declare-fun lt!654838 () SeekEntryResult!12736)

(assert (=> b!1509235 (= lt!654838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48565 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48565 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100657 (store (arr!48565 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49115 a!2804)) mask!2512))))

(declare-fun b!1509236 () Bool)

(declare-fun res!1029136 () Bool)

(assert (=> b!1509236 (=> (not res!1029136) (not e!843034))))

(assert (=> b!1509236 (= res!1029136 (validKeyInArray!0 (select (arr!48565 a!2804) i!961)))))

(assert (= (and start!128800 res!1029137) b!1509232))

(assert (= (and b!1509232 res!1029131) b!1509236))

(assert (= (and b!1509236 res!1029136) b!1509228))

(assert (= (and b!1509228 res!1029134) b!1509231))

(assert (= (and b!1509231 res!1029139) b!1509230))

(assert (= (and b!1509230 res!1029132) b!1509234))

(assert (= (and b!1509234 res!1029133) b!1509229))

(assert (= (and b!1509229 res!1029138) b!1509233))

(assert (= (and b!1509233 res!1029135) b!1509235))

(declare-fun m!1391683 () Bool)

(assert (=> b!1509230 m!1391683))

(declare-fun m!1391685 () Bool)

(assert (=> b!1509235 m!1391685))

(declare-fun m!1391687 () Bool)

(assert (=> b!1509235 m!1391687))

(assert (=> b!1509235 m!1391687))

(declare-fun m!1391689 () Bool)

(assert (=> b!1509235 m!1391689))

(assert (=> b!1509235 m!1391689))

(assert (=> b!1509235 m!1391687))

(declare-fun m!1391691 () Bool)

(assert (=> b!1509235 m!1391691))

(declare-fun m!1391693 () Bool)

(assert (=> b!1509229 m!1391693))

(assert (=> b!1509229 m!1391693))

(declare-fun m!1391695 () Bool)

(assert (=> b!1509229 m!1391695))

(assert (=> b!1509229 m!1391695))

(assert (=> b!1509229 m!1391693))

(declare-fun m!1391697 () Bool)

(assert (=> b!1509229 m!1391697))

(declare-fun m!1391699 () Bool)

(assert (=> start!128800 m!1391699))

(declare-fun m!1391701 () Bool)

(assert (=> start!128800 m!1391701))

(assert (=> b!1509233 m!1391693))

(assert (=> b!1509233 m!1391693))

(declare-fun m!1391703 () Bool)

(assert (=> b!1509233 m!1391703))

(assert (=> b!1509228 m!1391693))

(assert (=> b!1509228 m!1391693))

(declare-fun m!1391705 () Bool)

(assert (=> b!1509228 m!1391705))

(declare-fun m!1391707 () Bool)

(assert (=> b!1509231 m!1391707))

(declare-fun m!1391709 () Bool)

(assert (=> b!1509236 m!1391709))

(assert (=> b!1509236 m!1391709))

(declare-fun m!1391711 () Bool)

(assert (=> b!1509236 m!1391711))

(push 1)

(assert (not b!1509235))

(assert (not b!1509230))

(assert (not b!1509233))

(assert (not b!1509229))

(assert (not start!128800))

(assert (not b!1509236))

