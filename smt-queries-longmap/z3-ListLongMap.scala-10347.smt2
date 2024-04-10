; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121634 () Bool)

(assert start!121634)

(declare-fun b!1413126 () Bool)

(declare-fun e!799715 () Bool)

(declare-fun e!799713 () Bool)

(assert (=> b!1413126 (= e!799715 e!799713)))

(declare-fun res!950118 () Bool)

(assert (=> b!1413126 (=> res!950118 e!799713)))

(declare-datatypes ((SeekEntryResult!10934 0))(
  ( (MissingZero!10934 (index!46116 (_ BitVec 32))) (Found!10934 (index!46117 (_ BitVec 32))) (Intermediate!10934 (undefined!11746 Bool) (index!46118 (_ BitVec 32)) (x!127701 (_ BitVec 32))) (Undefined!10934) (MissingVacant!10934 (index!46119 (_ BitVec 32))) )
))
(declare-fun lt!622819 () SeekEntryResult!10934)

(declare-fun lt!622816 () SeekEntryResult!10934)

(get-info :version)

(assert (=> b!1413126 (= res!950118 (or (= lt!622819 lt!622816) (not ((_ is Intermediate!10934) lt!622816))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96572 0))(
  ( (array!96573 (arr!46623 (Array (_ BitVec 32) (_ BitVec 64))) (size!47173 (_ BitVec 32))) )
))
(declare-fun lt!622818 () array!96572)

(declare-fun lt!622817 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96572 (_ BitVec 32)) SeekEntryResult!10934)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413126 (= lt!622816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622817 mask!2840) lt!622817 lt!622818 mask!2840))))

(declare-fun a!2901 () array!96572)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413126 (= lt!622817 (select (store (arr!46623 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413126 (= lt!622818 (array!96573 (store (arr!46623 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47173 a!2901)))))

(declare-fun e!799718 () Bool)

(declare-fun b!1413127 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96572 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1413127 (= e!799718 (= (seekEntryOrOpen!0 (select (arr!46623 a!2901) j!112) a!2901 mask!2840) (Found!10934 j!112)))))

(declare-fun b!1413128 () Bool)

(declare-fun e!799717 () Bool)

(assert (=> b!1413128 (= e!799717 (not e!799715))))

(declare-fun res!950117 () Bool)

(assert (=> b!1413128 (=> res!950117 e!799715)))

(assert (=> b!1413128 (= res!950117 (or (not ((_ is Intermediate!10934) lt!622819)) (undefined!11746 lt!622819)))))

(assert (=> b!1413128 e!799718))

(declare-fun res!950120 () Bool)

(assert (=> b!1413128 (=> (not res!950120) (not e!799718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96572 (_ BitVec 32)) Bool)

(assert (=> b!1413128 (= res!950120 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47842 0))(
  ( (Unit!47843) )
))
(declare-fun lt!622821 () Unit!47842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47842)

(assert (=> b!1413128 (= lt!622821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622815 () (_ BitVec 32))

(assert (=> b!1413128 (= lt!622819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622815 (select (arr!46623 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413128 (= lt!622815 (toIndex!0 (select (arr!46623 a!2901) j!112) mask!2840))))

(declare-fun e!799714 () Bool)

(declare-fun b!1413129 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96572 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1413129 (= e!799714 (= (seekEntryOrOpen!0 lt!622817 lt!622818 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127701 lt!622816) (index!46118 lt!622816) (index!46118 lt!622816) (select (arr!46623 a!2901) j!112) lt!622818 mask!2840)))))

(declare-fun b!1413130 () Bool)

(declare-fun res!950125 () Bool)

(assert (=> b!1413130 (=> (not res!950125) (not e!799717))))

(assert (=> b!1413130 (= res!950125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413131 () Bool)

(declare-fun res!950123 () Bool)

(assert (=> b!1413131 (=> (not res!950123) (not e!799717))))

(assert (=> b!1413131 (= res!950123 (and (= (size!47173 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47173 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47173 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413132 () Bool)

(declare-fun res!950121 () Bool)

(assert (=> b!1413132 (=> (not res!950121) (not e!799717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413132 (= res!950121 (validKeyInArray!0 (select (arr!46623 a!2901) i!1037)))))

(declare-fun b!1413133 () Bool)

(assert (=> b!1413133 (= e!799713 true)))

(assert (=> b!1413133 e!799714))

(declare-fun res!950124 () Bool)

(assert (=> b!1413133 (=> (not res!950124) (not e!799714))))

(assert (=> b!1413133 (= res!950124 (and (not (undefined!11746 lt!622816)) (= (index!46118 lt!622816) i!1037) (bvslt (x!127701 lt!622816) (x!127701 lt!622819)) (= (select (store (arr!46623 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46118 lt!622816)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622820 () Unit!47842)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47842)

(assert (=> b!1413133 (= lt!622820 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622815 (x!127701 lt!622819) (index!46118 lt!622819) (x!127701 lt!622816) (index!46118 lt!622816) (undefined!11746 lt!622816) mask!2840))))

(declare-fun b!1413134 () Bool)

(declare-fun res!950122 () Bool)

(assert (=> b!1413134 (=> (not res!950122) (not e!799717))))

(assert (=> b!1413134 (= res!950122 (validKeyInArray!0 (select (arr!46623 a!2901) j!112)))))

(declare-fun b!1413135 () Bool)

(declare-fun res!950116 () Bool)

(assert (=> b!1413135 (=> (not res!950116) (not e!799717))))

(declare-datatypes ((List!33142 0))(
  ( (Nil!33139) (Cons!33138 (h!34413 (_ BitVec 64)) (t!47836 List!33142)) )
))
(declare-fun arrayNoDuplicates!0 (array!96572 (_ BitVec 32) List!33142) Bool)

(assert (=> b!1413135 (= res!950116 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33139))))

(declare-fun res!950119 () Bool)

(assert (=> start!121634 (=> (not res!950119) (not e!799717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121634 (= res!950119 (validMask!0 mask!2840))))

(assert (=> start!121634 e!799717))

(assert (=> start!121634 true))

(declare-fun array_inv!35651 (array!96572) Bool)

(assert (=> start!121634 (array_inv!35651 a!2901)))

(assert (= (and start!121634 res!950119) b!1413131))

(assert (= (and b!1413131 res!950123) b!1413132))

(assert (= (and b!1413132 res!950121) b!1413134))

(assert (= (and b!1413134 res!950122) b!1413130))

(assert (= (and b!1413130 res!950125) b!1413135))

(assert (= (and b!1413135 res!950116) b!1413128))

(assert (= (and b!1413128 res!950120) b!1413127))

(assert (= (and b!1413128 (not res!950117)) b!1413126))

(assert (= (and b!1413126 (not res!950118)) b!1413133))

(assert (= (and b!1413133 res!950124) b!1413129))

(declare-fun m!1303425 () Bool)

(assert (=> b!1413129 m!1303425))

(declare-fun m!1303427 () Bool)

(assert (=> b!1413129 m!1303427))

(assert (=> b!1413129 m!1303427))

(declare-fun m!1303429 () Bool)

(assert (=> b!1413129 m!1303429))

(assert (=> b!1413134 m!1303427))

(assert (=> b!1413134 m!1303427))

(declare-fun m!1303431 () Bool)

(assert (=> b!1413134 m!1303431))

(assert (=> b!1413128 m!1303427))

(declare-fun m!1303433 () Bool)

(assert (=> b!1413128 m!1303433))

(assert (=> b!1413128 m!1303427))

(declare-fun m!1303435 () Bool)

(assert (=> b!1413128 m!1303435))

(assert (=> b!1413128 m!1303427))

(declare-fun m!1303437 () Bool)

(assert (=> b!1413128 m!1303437))

(declare-fun m!1303439 () Bool)

(assert (=> b!1413128 m!1303439))

(declare-fun m!1303441 () Bool)

(assert (=> b!1413130 m!1303441))

(declare-fun m!1303443 () Bool)

(assert (=> b!1413132 m!1303443))

(assert (=> b!1413132 m!1303443))

(declare-fun m!1303445 () Bool)

(assert (=> b!1413132 m!1303445))

(declare-fun m!1303447 () Bool)

(assert (=> start!121634 m!1303447))

(declare-fun m!1303449 () Bool)

(assert (=> start!121634 m!1303449))

(declare-fun m!1303451 () Bool)

(assert (=> b!1413126 m!1303451))

(assert (=> b!1413126 m!1303451))

(declare-fun m!1303453 () Bool)

(assert (=> b!1413126 m!1303453))

(declare-fun m!1303455 () Bool)

(assert (=> b!1413126 m!1303455))

(declare-fun m!1303457 () Bool)

(assert (=> b!1413126 m!1303457))

(assert (=> b!1413127 m!1303427))

(assert (=> b!1413127 m!1303427))

(declare-fun m!1303459 () Bool)

(assert (=> b!1413127 m!1303459))

(assert (=> b!1413133 m!1303455))

(declare-fun m!1303461 () Bool)

(assert (=> b!1413133 m!1303461))

(declare-fun m!1303463 () Bool)

(assert (=> b!1413133 m!1303463))

(declare-fun m!1303465 () Bool)

(assert (=> b!1413135 m!1303465))

(check-sat (not b!1413128) (not b!1413130) (not b!1413134) (not b!1413127) (not b!1413132) (not b!1413126) (not b!1413135) (not start!121634) (not b!1413133) (not b!1413129))
(check-sat)
