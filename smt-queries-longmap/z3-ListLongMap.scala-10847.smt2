; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127206 () Bool)

(assert start!127206)

(declare-fun b!1493576 () Bool)

(declare-fun res!1015611 () Bool)

(declare-fun e!836881 () Bool)

(assert (=> b!1493576 (=> (not res!1015611) (not e!836881))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493576 (= res!1015611 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493577 () Bool)

(declare-fun res!1015606 () Bool)

(declare-fun e!836880 () Bool)

(assert (=> b!1493577 (=> (not res!1015606) (not e!836880))))

(declare-datatypes ((array!99817 0))(
  ( (array!99818 (arr!48175 (Array (_ BitVec 32) (_ BitVec 64))) (size!48726 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99817)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12312 0))(
  ( (MissingZero!12312 (index!51640 (_ BitVec 32))) (Found!12312 (index!51641 (_ BitVec 32))) (Intermediate!12312 (undefined!13124 Bool) (index!51642 (_ BitVec 32)) (x!133409 (_ BitVec 32))) (Undefined!12312) (MissingVacant!12312 (index!51643 (_ BitVec 32))) )
))
(declare-fun lt!651056 () SeekEntryResult!12312)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99817 (_ BitVec 32)) SeekEntryResult!12312)

(assert (=> b!1493577 (= res!1015606 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48175 a!2862) j!93) a!2862 mask!2687) lt!651056))))

(declare-fun b!1493578 () Bool)

(declare-fun res!1015599 () Bool)

(declare-fun e!836883 () Bool)

(assert (=> b!1493578 (=> (not res!1015599) (not e!836883))))

(assert (=> b!1493578 (= res!1015599 (and (= (size!48726 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48726 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48726 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493579 () Bool)

(declare-fun e!836884 () Bool)

(assert (=> b!1493579 (= e!836883 e!836884)))

(declare-fun res!1015605 () Bool)

(assert (=> b!1493579 (=> (not res!1015605) (not e!836884))))

(assert (=> b!1493579 (= res!1015605 (= (select (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651061 () array!99817)

(assert (=> b!1493579 (= lt!651061 (array!99818 (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48726 a!2862)))))

(declare-fun b!1493580 () Bool)

(declare-fun e!836879 () Bool)

(assert (=> b!1493580 (= e!836881 (not e!836879))))

(declare-fun res!1015610 () Bool)

(assert (=> b!1493580 (=> res!1015610 e!836879)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493580 (= res!1015610 (or (and (= (select (arr!48175 a!2862) index!646) (select (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48175 a!2862) index!646) (select (arr!48175 a!2862) j!93))) (= (select (arr!48175 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836885 () Bool)

(assert (=> b!1493580 e!836885))

(declare-fun res!1015604 () Bool)

(assert (=> b!1493580 (=> (not res!1015604) (not e!836885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99817 (_ BitVec 32)) Bool)

(assert (=> b!1493580 (= res!1015604 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49997 0))(
  ( (Unit!49998) )
))
(declare-fun lt!651060 () Unit!49997)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49997)

(assert (=> b!1493580 (= lt!651060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493581 () Bool)

(declare-fun res!1015609 () Bool)

(assert (=> b!1493581 (=> (not res!1015609) (not e!836885))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99817 (_ BitVec 32)) SeekEntryResult!12312)

(assert (=> b!1493581 (= res!1015609 (= (seekEntryOrOpen!0 (select (arr!48175 a!2862) j!93) a!2862 mask!2687) (Found!12312 j!93)))))

(declare-fun b!1493583 () Bool)

(declare-fun res!1015603 () Bool)

(assert (=> b!1493583 (=> (not res!1015603) (not e!836883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493583 (= res!1015603 (validKeyInArray!0 (select (arr!48175 a!2862) j!93)))))

(declare-fun b!1493584 () Bool)

(declare-fun res!1015613 () Bool)

(assert (=> b!1493584 (=> (not res!1015613) (not e!836883))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1493584 (= res!1015613 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48726 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48726 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48726 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493585 () Bool)

(declare-fun res!1015600 () Bool)

(assert (=> b!1493585 (=> (not res!1015600) (not e!836881))))

(declare-fun e!836882 () Bool)

(assert (=> b!1493585 (= res!1015600 e!836882)))

(declare-fun c!138526 () Bool)

(assert (=> b!1493585 (= c!138526 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493586 () Bool)

(declare-fun lt!651059 () SeekEntryResult!12312)

(declare-fun lt!651057 () (_ BitVec 64))

(assert (=> b!1493586 (= e!836882 (= lt!651059 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651057 lt!651061 mask!2687)))))

(declare-fun b!1493587 () Bool)

(assert (=> b!1493587 (= e!836880 e!836881)))

(declare-fun res!1015601 () Bool)

(assert (=> b!1493587 (=> (not res!1015601) (not e!836881))))

(assert (=> b!1493587 (= res!1015601 (= lt!651059 (Intermediate!12312 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493587 (= lt!651059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651057 mask!2687) lt!651057 lt!651061 mask!2687))))

(assert (=> b!1493587 (= lt!651057 (select (store (arr!48175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493588 () Bool)

(assert (=> b!1493588 (= e!836879 true)))

(declare-fun lt!651058 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493588 (= lt!651058 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1493589 () Bool)

(assert (=> b!1493589 (= e!836885 (or (= (select (arr!48175 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48175 a!2862) intermediateBeforeIndex!19) (select (arr!48175 a!2862) j!93))))))

(declare-fun b!1493590 () Bool)

(declare-fun res!1015612 () Bool)

(assert (=> b!1493590 (=> (not res!1015612) (not e!836883))))

(assert (=> b!1493590 (= res!1015612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493591 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99817 (_ BitVec 32)) SeekEntryResult!12312)

(assert (=> b!1493591 (= e!836882 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651057 lt!651061 mask!2687) (seekEntryOrOpen!0 lt!651057 lt!651061 mask!2687)))))

(declare-fun b!1493582 () Bool)

(declare-fun res!1015607 () Bool)

(assert (=> b!1493582 (=> (not res!1015607) (not e!836883))))

(assert (=> b!1493582 (= res!1015607 (validKeyInArray!0 (select (arr!48175 a!2862) i!1006)))))

(declare-fun res!1015608 () Bool)

(assert (=> start!127206 (=> (not res!1015608) (not e!836883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127206 (= res!1015608 (validMask!0 mask!2687))))

(assert (=> start!127206 e!836883))

(assert (=> start!127206 true))

(declare-fun array_inv!37456 (array!99817) Bool)

(assert (=> start!127206 (array_inv!37456 a!2862)))

(declare-fun b!1493592 () Bool)

(declare-fun res!1015602 () Bool)

(assert (=> b!1493592 (=> (not res!1015602) (not e!836883))))

(declare-datatypes ((List!34663 0))(
  ( (Nil!34660) (Cons!34659 (h!36056 (_ BitVec 64)) (t!49349 List!34663)) )
))
(declare-fun arrayNoDuplicates!0 (array!99817 (_ BitVec 32) List!34663) Bool)

(assert (=> b!1493592 (= res!1015602 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34660))))

(declare-fun b!1493593 () Bool)

(assert (=> b!1493593 (= e!836884 e!836880)))

(declare-fun res!1015598 () Bool)

(assert (=> b!1493593 (=> (not res!1015598) (not e!836880))))

(assert (=> b!1493593 (= res!1015598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48175 a!2862) j!93) mask!2687) (select (arr!48175 a!2862) j!93) a!2862 mask!2687) lt!651056))))

(assert (=> b!1493593 (= lt!651056 (Intermediate!12312 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!127206 res!1015608) b!1493578))

(assert (= (and b!1493578 res!1015599) b!1493582))

(assert (= (and b!1493582 res!1015607) b!1493583))

(assert (= (and b!1493583 res!1015603) b!1493590))

(assert (= (and b!1493590 res!1015612) b!1493592))

(assert (= (and b!1493592 res!1015602) b!1493584))

(assert (= (and b!1493584 res!1015613) b!1493579))

(assert (= (and b!1493579 res!1015605) b!1493593))

(assert (= (and b!1493593 res!1015598) b!1493577))

(assert (= (and b!1493577 res!1015606) b!1493587))

(assert (= (and b!1493587 res!1015601) b!1493585))

(assert (= (and b!1493585 c!138526) b!1493586))

(assert (= (and b!1493585 (not c!138526)) b!1493591))

(assert (= (and b!1493585 res!1015600) b!1493576))

(assert (= (and b!1493576 res!1015611) b!1493580))

(assert (= (and b!1493580 res!1015604) b!1493581))

(assert (= (and b!1493581 res!1015609) b!1493589))

(assert (= (and b!1493580 (not res!1015610)) b!1493588))

(declare-fun m!1377679 () Bool)

(assert (=> b!1493591 m!1377679))

(declare-fun m!1377681 () Bool)

(assert (=> b!1493591 m!1377681))

(declare-fun m!1377683 () Bool)

(assert (=> b!1493589 m!1377683))

(declare-fun m!1377685 () Bool)

(assert (=> b!1493589 m!1377685))

(assert (=> b!1493583 m!1377685))

(assert (=> b!1493583 m!1377685))

(declare-fun m!1377687 () Bool)

(assert (=> b!1493583 m!1377687))

(assert (=> b!1493593 m!1377685))

(assert (=> b!1493593 m!1377685))

(declare-fun m!1377689 () Bool)

(assert (=> b!1493593 m!1377689))

(assert (=> b!1493593 m!1377689))

(assert (=> b!1493593 m!1377685))

(declare-fun m!1377691 () Bool)

(assert (=> b!1493593 m!1377691))

(declare-fun m!1377693 () Bool)

(assert (=> b!1493586 m!1377693))

(declare-fun m!1377695 () Bool)

(assert (=> b!1493587 m!1377695))

(assert (=> b!1493587 m!1377695))

(declare-fun m!1377697 () Bool)

(assert (=> b!1493587 m!1377697))

(declare-fun m!1377699 () Bool)

(assert (=> b!1493587 m!1377699))

(declare-fun m!1377701 () Bool)

(assert (=> b!1493587 m!1377701))

(declare-fun m!1377703 () Bool)

(assert (=> b!1493588 m!1377703))

(assert (=> b!1493581 m!1377685))

(assert (=> b!1493581 m!1377685))

(declare-fun m!1377705 () Bool)

(assert (=> b!1493581 m!1377705))

(declare-fun m!1377707 () Bool)

(assert (=> b!1493580 m!1377707))

(assert (=> b!1493580 m!1377699))

(declare-fun m!1377709 () Bool)

(assert (=> b!1493580 m!1377709))

(declare-fun m!1377711 () Bool)

(assert (=> b!1493580 m!1377711))

(declare-fun m!1377713 () Bool)

(assert (=> b!1493580 m!1377713))

(assert (=> b!1493580 m!1377685))

(declare-fun m!1377715 () Bool)

(assert (=> b!1493592 m!1377715))

(assert (=> b!1493577 m!1377685))

(assert (=> b!1493577 m!1377685))

(declare-fun m!1377717 () Bool)

(assert (=> b!1493577 m!1377717))

(assert (=> b!1493579 m!1377699))

(declare-fun m!1377719 () Bool)

(assert (=> b!1493579 m!1377719))

(declare-fun m!1377721 () Bool)

(assert (=> b!1493582 m!1377721))

(assert (=> b!1493582 m!1377721))

(declare-fun m!1377723 () Bool)

(assert (=> b!1493582 m!1377723))

(declare-fun m!1377725 () Bool)

(assert (=> start!127206 m!1377725))

(declare-fun m!1377727 () Bool)

(assert (=> start!127206 m!1377727))

(declare-fun m!1377729 () Bool)

(assert (=> b!1493590 m!1377729))

(check-sat (not b!1493580) (not b!1493581) (not b!1493590) (not b!1493582) (not b!1493586) (not b!1493577) (not start!127206) (not b!1493583) (not b!1493593) (not b!1493587) (not b!1493591) (not b!1493592) (not b!1493588))
(check-sat)
