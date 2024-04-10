; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127718 () Bool)

(assert start!127718)

(declare-fun b!1500731 () Bool)

(declare-fun res!1021811 () Bool)

(declare-fun e!839681 () Bool)

(assert (=> b!1500731 (=> (not res!1021811) (not e!839681))))

(declare-datatypes ((array!100099 0))(
  ( (array!100100 (arr!48309 (Array (_ BitVec 32) (_ BitVec 64))) (size!48859 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100099)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500731 (= res!1021811 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48859 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48859 a!2850)) (= (select (arr!48309 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48309 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48859 a!2850))))))

(declare-fun b!1500732 () Bool)

(declare-fun res!1021814 () Bool)

(assert (=> b!1500732 (=> (not res!1021814) (not e!839681))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500732 (= res!1021814 (not (= (select (arr!48309 a!2850) index!625) (select (arr!48309 a!2850) j!87))))))

(declare-fun b!1500733 () Bool)

(declare-fun res!1021810 () Bool)

(assert (=> b!1500733 (=> (not res!1021810) (not e!839681))))

(declare-datatypes ((List!34801 0))(
  ( (Nil!34798) (Cons!34797 (h!36194 (_ BitVec 64)) (t!49495 List!34801)) )
))
(declare-fun arrayNoDuplicates!0 (array!100099 (_ BitVec 32) List!34801) Bool)

(assert (=> b!1500733 (= res!1021810 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34798))))

(declare-fun b!1500734 () Bool)

(declare-fun res!1021816 () Bool)

(assert (=> b!1500734 (=> (not res!1021816) (not e!839681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500734 (= res!1021816 (validKeyInArray!0 (select (arr!48309 a!2850) i!996)))))

(declare-fun b!1500735 () Bool)

(declare-fun res!1021809 () Bool)

(assert (=> b!1500735 (=> (not res!1021809) (not e!839681))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100099 (_ BitVec 32)) Bool)

(assert (=> b!1500735 (= res!1021809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500736 () Bool)

(declare-fun e!839682 () Bool)

(assert (=> b!1500736 (= e!839681 e!839682)))

(declare-fun res!1021815 () Bool)

(assert (=> b!1500736 (=> (not res!1021815) (not e!839682))))

(declare-fun lt!652995 () (_ BitVec 32))

(assert (=> b!1500736 (= res!1021815 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652995 #b00000000000000000000000000000000) (bvslt lt!652995 (size!48859 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500736 (= lt!652995 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500737 () Bool)

(declare-fun res!1021812 () Bool)

(assert (=> b!1500737 (=> (not res!1021812) (not e!839681))))

(declare-datatypes ((SeekEntryResult!12519 0))(
  ( (MissingZero!12519 (index!52468 (_ BitVec 32))) (Found!12519 (index!52469 (_ BitVec 32))) (Intermediate!12519 (undefined!13331 Bool) (index!52470 (_ BitVec 32)) (x!134137 (_ BitVec 32))) (Undefined!12519) (MissingVacant!12519 (index!52471 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100099 (_ BitVec 32)) SeekEntryResult!12519)

(assert (=> b!1500737 (= res!1021812 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48309 a!2850) j!87) a!2850 mask!2661) (Found!12519 j!87)))))

(declare-fun res!1021813 () Bool)

(assert (=> start!127718 (=> (not res!1021813) (not e!839681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127718 (= res!1021813 (validMask!0 mask!2661))))

(assert (=> start!127718 e!839681))

(assert (=> start!127718 true))

(declare-fun array_inv!37337 (array!100099) Bool)

(assert (=> start!127718 (array_inv!37337 a!2850)))

(declare-fun b!1500738 () Bool)

(declare-fun res!1021808 () Bool)

(assert (=> b!1500738 (=> (not res!1021808) (not e!839681))))

(assert (=> b!1500738 (= res!1021808 (validKeyInArray!0 (select (arr!48309 a!2850) j!87)))))

(declare-fun b!1500739 () Bool)

(assert (=> b!1500739 (= e!839682 false)))

(declare-fun lt!652996 () SeekEntryResult!12519)

(assert (=> b!1500739 (= lt!652996 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652995 vacantBefore!10 (select (arr!48309 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500740 () Bool)

(declare-fun res!1021807 () Bool)

(assert (=> b!1500740 (=> (not res!1021807) (not e!839681))))

(assert (=> b!1500740 (= res!1021807 (and (= (size!48859 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48859 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48859 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127718 res!1021813) b!1500740))

(assert (= (and b!1500740 res!1021807) b!1500734))

(assert (= (and b!1500734 res!1021816) b!1500738))

(assert (= (and b!1500738 res!1021808) b!1500735))

(assert (= (and b!1500735 res!1021809) b!1500733))

(assert (= (and b!1500733 res!1021810) b!1500731))

(assert (= (and b!1500731 res!1021811) b!1500737))

(assert (= (and b!1500737 res!1021812) b!1500732))

(assert (= (and b!1500732 res!1021814) b!1500736))

(assert (= (and b!1500736 res!1021815) b!1500739))

(declare-fun m!1383925 () Bool)

(assert (=> b!1500731 m!1383925))

(declare-fun m!1383927 () Bool)

(assert (=> b!1500731 m!1383927))

(declare-fun m!1383929 () Bool)

(assert (=> b!1500731 m!1383929))

(declare-fun m!1383931 () Bool)

(assert (=> b!1500738 m!1383931))

(assert (=> b!1500738 m!1383931))

(declare-fun m!1383933 () Bool)

(assert (=> b!1500738 m!1383933))

(declare-fun m!1383935 () Bool)

(assert (=> b!1500732 m!1383935))

(assert (=> b!1500732 m!1383931))

(declare-fun m!1383937 () Bool)

(assert (=> b!1500736 m!1383937))

(declare-fun m!1383939 () Bool)

(assert (=> b!1500734 m!1383939))

(assert (=> b!1500734 m!1383939))

(declare-fun m!1383941 () Bool)

(assert (=> b!1500734 m!1383941))

(declare-fun m!1383943 () Bool)

(assert (=> start!127718 m!1383943))

(declare-fun m!1383945 () Bool)

(assert (=> start!127718 m!1383945))

(assert (=> b!1500737 m!1383931))

(assert (=> b!1500737 m!1383931))

(declare-fun m!1383947 () Bool)

(assert (=> b!1500737 m!1383947))

(assert (=> b!1500739 m!1383931))

(assert (=> b!1500739 m!1383931))

(declare-fun m!1383949 () Bool)

(assert (=> b!1500739 m!1383949))

(declare-fun m!1383951 () Bool)

(assert (=> b!1500733 m!1383951))

(declare-fun m!1383953 () Bool)

(assert (=> b!1500735 m!1383953))

(check-sat (not b!1500735) (not b!1500733) (not b!1500738) (not b!1500737) (not b!1500736) (not start!127718) (not b!1500734) (not b!1500739))
(check-sat)
