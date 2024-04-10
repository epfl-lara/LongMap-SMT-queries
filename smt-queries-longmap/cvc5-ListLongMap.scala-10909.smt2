; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127716 () Bool)

(assert start!127716)

(declare-fun b!1500701 () Bool)

(declare-fun res!1021782 () Bool)

(declare-fun e!839672 () Bool)

(assert (=> b!1500701 (=> (not res!1021782) (not e!839672))))

(declare-datatypes ((array!100097 0))(
  ( (array!100098 (arr!48308 (Array (_ BitVec 32) (_ BitVec 64))) (size!48858 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100097)

(declare-datatypes ((List!34800 0))(
  ( (Nil!34797) (Cons!34796 (h!36193 (_ BitVec 64)) (t!49494 List!34800)) )
))
(declare-fun arrayNoDuplicates!0 (array!100097 (_ BitVec 32) List!34800) Bool)

(assert (=> b!1500701 (= res!1021782 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34797))))

(declare-fun b!1500702 () Bool)

(declare-fun res!1021779 () Bool)

(assert (=> b!1500702 (=> (not res!1021779) (not e!839672))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12518 0))(
  ( (MissingZero!12518 (index!52464 (_ BitVec 32))) (Found!12518 (index!52465 (_ BitVec 32))) (Intermediate!12518 (undefined!13330 Bool) (index!52466 (_ BitVec 32)) (x!134136 (_ BitVec 32))) (Undefined!12518) (MissingVacant!12518 (index!52467 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100097 (_ BitVec 32)) SeekEntryResult!12518)

(assert (=> b!1500702 (= res!1021779 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48308 a!2850) j!87) a!2850 mask!2661) (Found!12518 j!87)))))

(declare-fun b!1500703 () Bool)

(declare-fun res!1021784 () Bool)

(assert (=> b!1500703 (=> (not res!1021784) (not e!839672))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500703 (= res!1021784 (and (= (size!48858 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48858 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48858 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500704 () Bool)

(declare-fun e!839673 () Bool)

(assert (=> b!1500704 (= e!839672 e!839673)))

(declare-fun res!1021783 () Bool)

(assert (=> b!1500704 (=> (not res!1021783) (not e!839673))))

(declare-fun lt!652989 () (_ BitVec 32))

(assert (=> b!1500704 (= res!1021783 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652989 #b00000000000000000000000000000000) (bvslt lt!652989 (size!48858 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500704 (= lt!652989 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500705 () Bool)

(declare-fun res!1021781 () Bool)

(assert (=> b!1500705 (=> (not res!1021781) (not e!839672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500705 (= res!1021781 (validKeyInArray!0 (select (arr!48308 a!2850) j!87)))))

(declare-fun b!1500706 () Bool)

(declare-fun res!1021785 () Bool)

(assert (=> b!1500706 (=> (not res!1021785) (not e!839672))))

(assert (=> b!1500706 (= res!1021785 (not (= (select (arr!48308 a!2850) index!625) (select (arr!48308 a!2850) j!87))))))

(declare-fun b!1500707 () Bool)

(declare-fun res!1021786 () Bool)

(assert (=> b!1500707 (=> (not res!1021786) (not e!839672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100097 (_ BitVec 32)) Bool)

(assert (=> b!1500707 (= res!1021786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1021780 () Bool)

(assert (=> start!127716 (=> (not res!1021780) (not e!839672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127716 (= res!1021780 (validMask!0 mask!2661))))

(assert (=> start!127716 e!839672))

(assert (=> start!127716 true))

(declare-fun array_inv!37336 (array!100097) Bool)

(assert (=> start!127716 (array_inv!37336 a!2850)))

(declare-fun b!1500708 () Bool)

(assert (=> b!1500708 (= e!839673 false)))

(declare-fun lt!652990 () SeekEntryResult!12518)

(assert (=> b!1500708 (= lt!652990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652989 vacantBefore!10 (select (arr!48308 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500709 () Bool)

(declare-fun res!1021778 () Bool)

(assert (=> b!1500709 (=> (not res!1021778) (not e!839672))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500709 (= res!1021778 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48858 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48858 a!2850)) (= (select (arr!48308 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48308 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48858 a!2850))))))

(declare-fun b!1500710 () Bool)

(declare-fun res!1021777 () Bool)

(assert (=> b!1500710 (=> (not res!1021777) (not e!839672))))

(assert (=> b!1500710 (= res!1021777 (validKeyInArray!0 (select (arr!48308 a!2850) i!996)))))

(assert (= (and start!127716 res!1021780) b!1500703))

(assert (= (and b!1500703 res!1021784) b!1500710))

(assert (= (and b!1500710 res!1021777) b!1500705))

(assert (= (and b!1500705 res!1021781) b!1500707))

(assert (= (and b!1500707 res!1021786) b!1500701))

(assert (= (and b!1500701 res!1021782) b!1500709))

(assert (= (and b!1500709 res!1021778) b!1500702))

(assert (= (and b!1500702 res!1021779) b!1500706))

(assert (= (and b!1500706 res!1021785) b!1500704))

(assert (= (and b!1500704 res!1021783) b!1500708))

(declare-fun m!1383895 () Bool)

(assert (=> b!1500706 m!1383895))

(declare-fun m!1383897 () Bool)

(assert (=> b!1500706 m!1383897))

(declare-fun m!1383899 () Bool)

(assert (=> b!1500710 m!1383899))

(assert (=> b!1500710 m!1383899))

(declare-fun m!1383901 () Bool)

(assert (=> b!1500710 m!1383901))

(declare-fun m!1383903 () Bool)

(assert (=> b!1500701 m!1383903))

(assert (=> b!1500702 m!1383897))

(assert (=> b!1500702 m!1383897))

(declare-fun m!1383905 () Bool)

(assert (=> b!1500702 m!1383905))

(declare-fun m!1383907 () Bool)

(assert (=> b!1500709 m!1383907))

(declare-fun m!1383909 () Bool)

(assert (=> b!1500709 m!1383909))

(declare-fun m!1383911 () Bool)

(assert (=> b!1500709 m!1383911))

(declare-fun m!1383913 () Bool)

(assert (=> b!1500704 m!1383913))

(assert (=> b!1500705 m!1383897))

(assert (=> b!1500705 m!1383897))

(declare-fun m!1383915 () Bool)

(assert (=> b!1500705 m!1383915))

(declare-fun m!1383917 () Bool)

(assert (=> start!127716 m!1383917))

(declare-fun m!1383919 () Bool)

(assert (=> start!127716 m!1383919))

(declare-fun m!1383921 () Bool)

(assert (=> b!1500707 m!1383921))

(assert (=> b!1500708 m!1383897))

(assert (=> b!1500708 m!1383897))

(declare-fun m!1383923 () Bool)

(assert (=> b!1500708 m!1383923))

(push 1)

