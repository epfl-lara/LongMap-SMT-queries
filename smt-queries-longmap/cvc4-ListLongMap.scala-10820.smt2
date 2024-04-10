; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126572 () Bool)

(assert start!126572)

(declare-fun b!1485808 () Bool)

(declare-fun e!832935 () Bool)

(declare-fun e!832929 () Bool)

(assert (=> b!1485808 (= e!832935 e!832929)))

(declare-fun res!1010467 () Bool)

(assert (=> b!1485808 (=> (not res!1010467) (not e!832929))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99534 0))(
  ( (array!99535 (arr!48043 (Array (_ BitVec 32) (_ BitVec 64))) (size!48593 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99534)

(assert (=> b!1485808 (= res!1010467 (= (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648219 () array!99534)

(assert (=> b!1485808 (= lt!648219 (array!99535 (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48593 a!2862)))))

(declare-fun b!1485809 () Bool)

(declare-fun res!1010463 () Bool)

(assert (=> b!1485809 (=> (not res!1010463) (not e!832935))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485809 (= res!1010463 (and (= (size!48593 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48593 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48593 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485810 () Bool)

(declare-fun e!832937 () Bool)

(declare-fun e!832933 () Bool)

(assert (=> b!1485810 (= e!832937 (not e!832933))))

(declare-fun res!1010456 () Bool)

(assert (=> b!1485810 (=> res!1010456 e!832933)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1485810 (= res!1010456 (or (and (= (select (arr!48043 a!2862) index!646) (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48043 a!2862) index!646) (select (arr!48043 a!2862) j!93))) (= (select (arr!48043 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832936 () Bool)

(assert (=> b!1485810 e!832936))

(declare-fun res!1010458 () Bool)

(assert (=> b!1485810 (=> (not res!1010458) (not e!832936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99534 (_ BitVec 32)) Bool)

(assert (=> b!1485810 (= res!1010458 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49906 0))(
  ( (Unit!49907) )
))
(declare-fun lt!648220 () Unit!49906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49906)

(assert (=> b!1485810 (= lt!648220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!832928 () Bool)

(declare-fun lt!648217 () (_ BitVec 64))

(declare-fun b!1485811 () Bool)

(declare-datatypes ((SeekEntryResult!12283 0))(
  ( (MissingZero!12283 (index!51524 (_ BitVec 32))) (Found!12283 (index!51525 (_ BitVec 32))) (Intermediate!12283 (undefined!13095 Bool) (index!51526 (_ BitVec 32)) (x!133095 (_ BitVec 32))) (Undefined!12283) (MissingVacant!12283 (index!51527 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99534 (_ BitVec 32)) SeekEntryResult!12283)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99534 (_ BitVec 32)) SeekEntryResult!12283)

(assert (=> b!1485811 (= e!832928 (= (seekEntryOrOpen!0 lt!648217 lt!648219 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648217 lt!648219 mask!2687)))))

(declare-fun b!1485812 () Bool)

(declare-fun res!1010461 () Bool)

(assert (=> b!1485812 (=> (not res!1010461) (not e!832935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485812 (= res!1010461 (validKeyInArray!0 (select (arr!48043 a!2862) j!93)))))

(declare-fun b!1485814 () Bool)

(declare-fun e!832932 () Bool)

(assert (=> b!1485814 (= e!832929 e!832932)))

(declare-fun res!1010473 () Bool)

(assert (=> b!1485814 (=> (not res!1010473) (not e!832932))))

(declare-fun lt!648222 () SeekEntryResult!12283)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99534 (_ BitVec 32)) SeekEntryResult!12283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485814 (= res!1010473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648222))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485814 (= lt!648222 (Intermediate!12283 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485815 () Bool)

(declare-fun res!1010472 () Bool)

(assert (=> b!1485815 (=> (not res!1010472) (not e!832936))))

(assert (=> b!1485815 (= res!1010472 (= (seekEntryOrOpen!0 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) (Found!12283 j!93)))))

(declare-fun b!1485816 () Bool)

(declare-fun e!832930 () Bool)

(assert (=> b!1485816 (= e!832930 e!832928)))

(declare-fun res!1010471 () Bool)

(assert (=> b!1485816 (=> (not res!1010471) (not e!832928))))

(declare-fun lt!648216 () (_ BitVec 64))

(assert (=> b!1485816 (= res!1010471 (and (= index!646 intermediateAfterIndex!19) (= lt!648216 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485817 () Bool)

(declare-fun res!1010469 () Bool)

(assert (=> b!1485817 (=> (not res!1010469) (not e!832935))))

(assert (=> b!1485817 (= res!1010469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485818 () Bool)

(declare-fun res!1010462 () Bool)

(assert (=> b!1485818 (=> (not res!1010462) (not e!832935))))

(assert (=> b!1485818 (= res!1010462 (validKeyInArray!0 (select (arr!48043 a!2862) i!1006)))))

(declare-fun e!832931 () Bool)

(declare-fun b!1485819 () Bool)

(assert (=> b!1485819 (= e!832931 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648217 lt!648219 mask!2687) (seekEntryOrOpen!0 lt!648217 lt!648219 mask!2687)))))

(declare-fun b!1485820 () Bool)

(declare-fun res!1010464 () Bool)

(assert (=> b!1485820 (=> (not res!1010464) (not e!832932))))

(assert (=> b!1485820 (= res!1010464 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648222))))

(declare-fun lt!648218 () (_ BitVec 32))

(declare-fun b!1485813 () Bool)

(assert (=> b!1485813 (= e!832933 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!648218 #b00000000000000000000000000000000) (bvslt lt!648218 (size!48593 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485813 (= lt!648218 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1010460 () Bool)

(assert (=> start!126572 (=> (not res!1010460) (not e!832935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126572 (= res!1010460 (validMask!0 mask!2687))))

(assert (=> start!126572 e!832935))

(assert (=> start!126572 true))

(declare-fun array_inv!37071 (array!99534) Bool)

(assert (=> start!126572 (array_inv!37071 a!2862)))

(declare-fun b!1485821 () Bool)

(assert (=> b!1485821 (= e!832932 e!832937)))

(declare-fun res!1010459 () Bool)

(assert (=> b!1485821 (=> (not res!1010459) (not e!832937))))

(declare-fun lt!648221 () SeekEntryResult!12283)

(assert (=> b!1485821 (= res!1010459 (= lt!648221 (Intermediate!12283 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485821 (= lt!648221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648217 mask!2687) lt!648217 lt!648219 mask!2687))))

(assert (=> b!1485821 (= lt!648217 (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485822 () Bool)

(declare-fun res!1010470 () Bool)

(assert (=> b!1485822 (=> (not res!1010470) (not e!832935))))

(declare-datatypes ((List!34544 0))(
  ( (Nil!34541) (Cons!34540 (h!35914 (_ BitVec 64)) (t!49238 List!34544)) )
))
(declare-fun arrayNoDuplicates!0 (array!99534 (_ BitVec 32) List!34544) Bool)

(assert (=> b!1485822 (= res!1010470 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34541))))

(declare-fun b!1485823 () Bool)

(assert (=> b!1485823 (= e!832931 (= lt!648221 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648217 lt!648219 mask!2687)))))

(declare-fun b!1485824 () Bool)

(assert (=> b!1485824 (= e!832936 e!832930)))

(declare-fun res!1010457 () Bool)

(assert (=> b!1485824 (=> res!1010457 e!832930)))

(assert (=> b!1485824 (= res!1010457 (or (and (= (select (arr!48043 a!2862) index!646) lt!648216) (= (select (arr!48043 a!2862) index!646) (select (arr!48043 a!2862) j!93))) (= (select (arr!48043 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485824 (= lt!648216 (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485825 () Bool)

(declare-fun res!1010468 () Bool)

(assert (=> b!1485825 (=> (not res!1010468) (not e!832936))))

(assert (=> b!1485825 (= res!1010468 (or (= (select (arr!48043 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48043 a!2862) intermediateBeforeIndex!19) (select (arr!48043 a!2862) j!93))))))

(declare-fun b!1485826 () Bool)

(declare-fun res!1010466 () Bool)

(assert (=> b!1485826 (=> (not res!1010466) (not e!832935))))

(assert (=> b!1485826 (= res!1010466 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48593 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48593 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48593 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485827 () Bool)

(declare-fun res!1010455 () Bool)

(assert (=> b!1485827 (=> (not res!1010455) (not e!832937))))

(assert (=> b!1485827 (= res!1010455 e!832931)))

(declare-fun c!137199 () Bool)

(assert (=> b!1485827 (= c!137199 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485828 () Bool)

(declare-fun res!1010465 () Bool)

(assert (=> b!1485828 (=> (not res!1010465) (not e!832937))))

(assert (=> b!1485828 (= res!1010465 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126572 res!1010460) b!1485809))

(assert (= (and b!1485809 res!1010463) b!1485818))

(assert (= (and b!1485818 res!1010462) b!1485812))

(assert (= (and b!1485812 res!1010461) b!1485817))

(assert (= (and b!1485817 res!1010469) b!1485822))

(assert (= (and b!1485822 res!1010470) b!1485826))

(assert (= (and b!1485826 res!1010466) b!1485808))

(assert (= (and b!1485808 res!1010467) b!1485814))

(assert (= (and b!1485814 res!1010473) b!1485820))

(assert (= (and b!1485820 res!1010464) b!1485821))

(assert (= (and b!1485821 res!1010459) b!1485827))

(assert (= (and b!1485827 c!137199) b!1485823))

(assert (= (and b!1485827 (not c!137199)) b!1485819))

(assert (= (and b!1485827 res!1010455) b!1485828))

(assert (= (and b!1485828 res!1010465) b!1485810))

(assert (= (and b!1485810 res!1010458) b!1485815))

(assert (= (and b!1485815 res!1010472) b!1485825))

(assert (= (and b!1485825 res!1010468) b!1485824))

(assert (= (and b!1485824 (not res!1010457)) b!1485816))

(assert (= (and b!1485816 res!1010471) b!1485811))

(assert (= (and b!1485810 (not res!1010456)) b!1485813))

(declare-fun m!1370877 () Bool)

(assert (=> b!1485817 m!1370877))

(declare-fun m!1370879 () Bool)

(assert (=> b!1485808 m!1370879))

(declare-fun m!1370881 () Bool)

(assert (=> b!1485808 m!1370881))

(declare-fun m!1370883 () Bool)

(assert (=> b!1485815 m!1370883))

(assert (=> b!1485815 m!1370883))

(declare-fun m!1370885 () Bool)

(assert (=> b!1485815 m!1370885))

(declare-fun m!1370887 () Bool)

(assert (=> b!1485818 m!1370887))

(assert (=> b!1485818 m!1370887))

(declare-fun m!1370889 () Bool)

(assert (=> b!1485818 m!1370889))

(declare-fun m!1370891 () Bool)

(assert (=> b!1485810 m!1370891))

(assert (=> b!1485810 m!1370879))

(declare-fun m!1370893 () Bool)

(assert (=> b!1485810 m!1370893))

(declare-fun m!1370895 () Bool)

(assert (=> b!1485810 m!1370895))

(declare-fun m!1370897 () Bool)

(assert (=> b!1485810 m!1370897))

(assert (=> b!1485810 m!1370883))

(declare-fun m!1370899 () Bool)

(assert (=> b!1485825 m!1370899))

(assert (=> b!1485825 m!1370883))

(assert (=> b!1485814 m!1370883))

(assert (=> b!1485814 m!1370883))

(declare-fun m!1370901 () Bool)

(assert (=> b!1485814 m!1370901))

(assert (=> b!1485814 m!1370901))

(assert (=> b!1485814 m!1370883))

(declare-fun m!1370903 () Bool)

(assert (=> b!1485814 m!1370903))

(declare-fun m!1370905 () Bool)

(assert (=> b!1485822 m!1370905))

(declare-fun m!1370907 () Bool)

(assert (=> b!1485813 m!1370907))

(declare-fun m!1370909 () Bool)

(assert (=> start!126572 m!1370909))

(declare-fun m!1370911 () Bool)

(assert (=> start!126572 m!1370911))

(declare-fun m!1370913 () Bool)

(assert (=> b!1485821 m!1370913))

(assert (=> b!1485821 m!1370913))

(declare-fun m!1370915 () Bool)

(assert (=> b!1485821 m!1370915))

(assert (=> b!1485821 m!1370879))

(declare-fun m!1370917 () Bool)

(assert (=> b!1485821 m!1370917))

(declare-fun m!1370919 () Bool)

(assert (=> b!1485811 m!1370919))

(declare-fun m!1370921 () Bool)

(assert (=> b!1485811 m!1370921))

(declare-fun m!1370923 () Bool)

(assert (=> b!1485823 m!1370923))

(assert (=> b!1485820 m!1370883))

(assert (=> b!1485820 m!1370883))

(declare-fun m!1370925 () Bool)

(assert (=> b!1485820 m!1370925))

(assert (=> b!1485824 m!1370895))

(assert (=> b!1485824 m!1370883))

(assert (=> b!1485824 m!1370879))

(assert (=> b!1485824 m!1370893))

(assert (=> b!1485812 m!1370883))

(assert (=> b!1485812 m!1370883))

(declare-fun m!1370927 () Bool)

(assert (=> b!1485812 m!1370927))

(assert (=> b!1485819 m!1370921))

(assert (=> b!1485819 m!1370919))

(push 1)

(assert (not b!1485810))

(assert (not b!1485811))

(assert (not b!1485817))

(assert (not b!1485820))

(assert (not start!126572))

(assert (not b!1485823))

(assert (not b!1485822))

(assert (not b!1485813))

(assert (not b!1485812))

(assert (not b!1485818))

(assert (not b!1485815))

(assert (not b!1485821))

(assert (not b!1485814))

(assert (not b!1485819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156441 () Bool)

(declare-fun lt!648253 () (_ BitVec 32))

(assert (=> d!156441 (and (bvsge lt!648253 #b00000000000000000000000000000000) (bvslt lt!648253 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156441 (= lt!648253 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156441 (validMask!0 mask!2687)))

(assert (=> d!156441 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648253)))

(declare-fun bs!42759 () Bool)

(assert (= bs!42759 d!156441))

(declare-fun m!1370953 () Bool)

(assert (=> bs!42759 m!1370953))

(assert (=> bs!42759 m!1370909))

(assert (=> b!1485813 d!156441))

(declare-fun d!156445 () Bool)

(assert (=> d!156445 (= (validKeyInArray!0 (select (arr!48043 a!2862) j!93)) (and (not (= (select (arr!48043 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48043 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1485812 d!156445))

(declare-fun b!1485926 () Bool)

(declare-fun e!833003 () SeekEntryResult!12283)

(assert (=> b!1485926 (= e!833003 (Intermediate!12283 false index!646 x!665))))

(declare-fun b!1485927 () Bool)

(declare-fun lt!648273 () SeekEntryResult!12283)

(assert (=> b!1485927 (and (bvsge (index!51526 lt!648273) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648273) (size!48593 lt!648219)))))

(declare-fun res!1010518 () Bool)

(assert (=> b!1485927 (= res!1010518 (= (select (arr!48043 lt!648219) (index!51526 lt!648273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833005 () Bool)

(assert (=> b!1485927 (=> res!1010518 e!833005)))

(declare-fun b!1485928 () Bool)

(declare-fun e!833001 () Bool)

(declare-fun e!833004 () Bool)

(assert (=> b!1485928 (= e!833001 e!833004)))

(declare-fun res!1010516 () Bool)

(assert (=> b!1485928 (= res!1010516 (and (is-Intermediate!12283 lt!648273) (not (undefined!13095 lt!648273)) (bvslt (x!133095 lt!648273) #b01111111111111111111111111111110) (bvsge (x!133095 lt!648273) #b00000000000000000000000000000000) (bvsge (x!133095 lt!648273) x!665)))))

(assert (=> b!1485928 (=> (not res!1010516) (not e!833004))))

(declare-fun b!1485929 () Bool)

(assert (=> b!1485929 (= e!833003 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648217 lt!648219 mask!2687))))

(declare-fun b!1485930 () Bool)

(declare-fun e!833002 () SeekEntryResult!12283)

(assert (=> b!1485930 (= e!833002 (Intermediate!12283 true index!646 x!665))))

(declare-fun b!1485931 () Bool)

(assert (=> b!1485931 (= e!833001 (bvsge (x!133095 lt!648273) #b01111111111111111111111111111110))))

(declare-fun b!1485932 () Bool)

(assert (=> b!1485932 (and (bvsge (index!51526 lt!648273) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648273) (size!48593 lt!648219)))))

(assert (=> b!1485932 (= e!833005 (= (select (arr!48043 lt!648219) (index!51526 lt!648273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156447 () Bool)

(assert (=> d!156447 e!833001))

(declare-fun c!137230 () Bool)

(assert (=> d!156447 (= c!137230 (and (is-Intermediate!12283 lt!648273) (undefined!13095 lt!648273)))))

(assert (=> d!156447 (= lt!648273 e!833002)))

(declare-fun c!137229 () Bool)

(assert (=> d!156447 (= c!137229 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648274 () (_ BitVec 64))

(assert (=> d!156447 (= lt!648274 (select (arr!48043 lt!648219) index!646))))

(assert (=> d!156447 (validMask!0 mask!2687)))

(assert (=> d!156447 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648217 lt!648219 mask!2687) lt!648273)))

(declare-fun b!1485933 () Bool)

(assert (=> b!1485933 (and (bvsge (index!51526 lt!648273) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648273) (size!48593 lt!648219)))))

(declare-fun res!1010517 () Bool)

(assert (=> b!1485933 (= res!1010517 (= (select (arr!48043 lt!648219) (index!51526 lt!648273)) lt!648217))))

(assert (=> b!1485933 (=> res!1010517 e!833005)))

(assert (=> b!1485933 (= e!833004 e!833005)))

(declare-fun b!1485934 () Bool)

(assert (=> b!1485934 (= e!833002 e!833003)))

(declare-fun c!137228 () Bool)

(assert (=> b!1485934 (= c!137228 (or (= lt!648274 lt!648217) (= (bvadd lt!648274 lt!648274) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156447 c!137229) b!1485930))

(assert (= (and d!156447 (not c!137229)) b!1485934))

(assert (= (and b!1485934 c!137228) b!1485926))

(assert (= (and b!1485934 (not c!137228)) b!1485929))

(assert (= (and d!156447 c!137230) b!1485931))

(assert (= (and d!156447 (not c!137230)) b!1485928))

(assert (= (and b!1485928 res!1010516) b!1485933))

(assert (= (and b!1485933 (not res!1010517)) b!1485927))

(assert (= (and b!1485927 (not res!1010518)) b!1485932))

(declare-fun m!1370985 () Bool)

(assert (=> b!1485933 m!1370985))

(assert (=> b!1485932 m!1370985))

(assert (=> b!1485929 m!1370907))

(assert (=> b!1485929 m!1370907))

(declare-fun m!1370987 () Bool)

(assert (=> b!1485929 m!1370987))

(assert (=> b!1485927 m!1370985))

(declare-fun m!1370989 () Bool)

(assert (=> d!156447 m!1370989))

(assert (=> d!156447 m!1370909))

(assert (=> b!1485823 d!156447))

(declare-fun b!1485963 () Bool)

(declare-fun e!833023 () Bool)

(declare-fun call!67886 () Bool)

(assert (=> b!1485963 (= e!833023 call!67886)))

(declare-fun b!1485964 () Bool)

(assert (=> b!1485964 (= e!833023 call!67886)))

(declare-fun b!1485965 () Bool)

(declare-fun e!833026 () Bool)

(declare-fun e!833024 () Bool)

(assert (=> b!1485965 (= e!833026 e!833024)))

(declare-fun res!1010526 () Bool)

(assert (=> b!1485965 (=> (not res!1010526) (not e!833024))))

(declare-fun e!833025 () Bool)

(assert (=> b!1485965 (= res!1010526 (not e!833025))))

(declare-fun res!1010525 () Bool)

(assert (=> b!1485965 (=> (not res!1010525) (not e!833025))))

(assert (=> b!1485965 (= res!1010525 (validKeyInArray!0 (select (arr!48043 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67883 () Bool)

(declare-fun c!137242 () Bool)

(assert (=> bm!67883 (= call!67886 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137242 (Cons!34540 (select (arr!48043 a!2862) #b00000000000000000000000000000000) Nil!34541) Nil!34541)))))

(declare-fun b!1485967 () Bool)

(declare-fun contains!9917 (List!34544 (_ BitVec 64)) Bool)

(assert (=> b!1485967 (= e!833025 (contains!9917 Nil!34541 (select (arr!48043 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156463 () Bool)

(declare-fun res!1010527 () Bool)

(assert (=> d!156463 (=> res!1010527 e!833026)))

(assert (=> d!156463 (= res!1010527 (bvsge #b00000000000000000000000000000000 (size!48593 a!2862)))))

(assert (=> d!156463 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34541) e!833026)))

(declare-fun b!1485966 () Bool)

(assert (=> b!1485966 (= e!833024 e!833023)))

(assert (=> b!1485966 (= c!137242 (validKeyInArray!0 (select (arr!48043 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156463 (not res!1010527)) b!1485965))

(assert (= (and b!1485965 res!1010525) b!1485967))

(assert (= (and b!1485965 res!1010526) b!1485966))

(assert (= (and b!1485966 c!137242) b!1485964))

(assert (= (and b!1485966 (not c!137242)) b!1485963))

(assert (= (or b!1485964 b!1485963) bm!67883))

(declare-fun m!1370999 () Bool)

(assert (=> b!1485965 m!1370999))

(assert (=> b!1485965 m!1370999))

(declare-fun m!1371001 () Bool)

(assert (=> b!1485965 m!1371001))

(assert (=> bm!67883 m!1370999))

(declare-fun m!1371003 () Bool)

(assert (=> bm!67883 m!1371003))

(assert (=> b!1485967 m!1370999))

(assert (=> b!1485967 m!1370999))

(declare-fun m!1371005 () Bool)

(assert (=> b!1485967 m!1371005))

(assert (=> b!1485966 m!1370999))

(assert (=> b!1485966 m!1370999))

(assert (=> b!1485966 m!1371001))

(assert (=> b!1485822 d!156463))

(declare-fun d!156467 () Bool)

(assert (=> d!156467 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126572 d!156467))

(declare-fun d!156471 () Bool)

(assert (=> d!156471 (= (array_inv!37071 a!2862) (bvsge (size!48593 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126572 d!156471))

(declare-fun b!1486058 () Bool)

(declare-fun e!833073 () SeekEntryResult!12283)

(declare-fun lt!648320 () SeekEntryResult!12283)

(assert (=> b!1486058 (= e!833073 (Found!12283 (index!51526 lt!648320)))))

(declare-fun b!1486059 () Bool)

(declare-fun e!833074 () SeekEntryResult!12283)

(assert (=> b!1486059 (= e!833074 e!833073)))

(declare-fun lt!648318 () (_ BitVec 64))

(assert (=> b!1486059 (= lt!648318 (select (arr!48043 lt!648219) (index!51526 lt!648320)))))

(declare-fun c!137287 () Bool)

(assert (=> b!1486059 (= c!137287 (= lt!648318 lt!648217))))

(declare-fun b!1486060 () Bool)

(declare-fun e!833075 () SeekEntryResult!12283)

(assert (=> b!1486060 (= e!833075 (seekKeyOrZeroReturnVacant!0 (x!133095 lt!648320) (index!51526 lt!648320) (index!51526 lt!648320) lt!648217 lt!648219 mask!2687))))

(declare-fun b!1486061 () Bool)

(declare-fun c!137285 () Bool)

(assert (=> b!1486061 (= c!137285 (= lt!648318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486061 (= e!833073 e!833075)))

(declare-fun d!156473 () Bool)

(declare-fun lt!648319 () SeekEntryResult!12283)

(assert (=> d!156473 (and (or (is-Undefined!12283 lt!648319) (not (is-Found!12283 lt!648319)) (and (bvsge (index!51525 lt!648319) #b00000000000000000000000000000000) (bvslt (index!51525 lt!648319) (size!48593 lt!648219)))) (or (is-Undefined!12283 lt!648319) (is-Found!12283 lt!648319) (not (is-MissingZero!12283 lt!648319)) (and (bvsge (index!51524 lt!648319) #b00000000000000000000000000000000) (bvslt (index!51524 lt!648319) (size!48593 lt!648219)))) (or (is-Undefined!12283 lt!648319) (is-Found!12283 lt!648319) (is-MissingZero!12283 lt!648319) (not (is-MissingVacant!12283 lt!648319)) (and (bvsge (index!51527 lt!648319) #b00000000000000000000000000000000) (bvslt (index!51527 lt!648319) (size!48593 lt!648219)))) (or (is-Undefined!12283 lt!648319) (ite (is-Found!12283 lt!648319) (= (select (arr!48043 lt!648219) (index!51525 lt!648319)) lt!648217) (ite (is-MissingZero!12283 lt!648319) (= (select (arr!48043 lt!648219) (index!51524 lt!648319)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12283 lt!648319) (= (select (arr!48043 lt!648219) (index!51527 lt!648319)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156473 (= lt!648319 e!833074)))

(declare-fun c!137286 () Bool)

(assert (=> d!156473 (= c!137286 (and (is-Intermediate!12283 lt!648320) (undefined!13095 lt!648320)))))

(assert (=> d!156473 (= lt!648320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648217 mask!2687) lt!648217 lt!648219 mask!2687))))

(assert (=> d!156473 (validMask!0 mask!2687)))

(assert (=> d!156473 (= (seekEntryOrOpen!0 lt!648217 lt!648219 mask!2687) lt!648319)))

(declare-fun b!1486062 () Bool)

(assert (=> b!1486062 (= e!833074 Undefined!12283)))

(declare-fun b!1486063 () Bool)

(assert (=> b!1486063 (= e!833075 (MissingZero!12283 (index!51526 lt!648320)))))

(assert (= (and d!156473 c!137286) b!1486062))

(assert (= (and d!156473 (not c!137286)) b!1486059))

(assert (= (and b!1486059 c!137287) b!1486058))

(assert (= (and b!1486059 (not c!137287)) b!1486061))

(assert (= (and b!1486061 c!137285) b!1486063))

(assert (= (and b!1486061 (not c!137285)) b!1486060))

(declare-fun m!1371053 () Bool)

(assert (=> b!1486059 m!1371053))

(declare-fun m!1371055 () Bool)

(assert (=> b!1486060 m!1371055))

(declare-fun m!1371057 () Bool)

(assert (=> d!156473 m!1371057))

(declare-fun m!1371059 () Bool)

(assert (=> d!156473 m!1371059))

(assert (=> d!156473 m!1370913))

(assert (=> d!156473 m!1370915))

(declare-fun m!1371061 () Bool)

(assert (=> d!156473 m!1371061))

(assert (=> d!156473 m!1370913))

(assert (=> d!156473 m!1370909))

(assert (=> b!1485811 d!156473))

(declare-fun b!1486103 () Bool)

(declare-fun c!137303 () Bool)

(declare-fun lt!648332 () (_ BitVec 64))

(assert (=> b!1486103 (= c!137303 (= lt!648332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833097 () SeekEntryResult!12283)

(declare-fun e!833098 () SeekEntryResult!12283)

(assert (=> b!1486103 (= e!833097 e!833098)))

(declare-fun b!1486104 () Bool)

(assert (=> b!1486104 (= e!833097 (Found!12283 index!646))))

(declare-fun b!1486105 () Bool)

(declare-fun e!833099 () SeekEntryResult!12283)

(assert (=> b!1486105 (= e!833099 e!833097)))

(declare-fun c!137304 () Bool)

(assert (=> b!1486105 (= c!137304 (= lt!648332 lt!648217))))

(declare-fun b!1486106 () Bool)

(assert (=> b!1486106 (= e!833099 Undefined!12283)))

(declare-fun b!1486107 () Bool)

(assert (=> b!1486107 (= e!833098 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648217 lt!648219 mask!2687))))

(declare-fun d!156483 () Bool)

(declare-fun lt!648331 () SeekEntryResult!12283)

(assert (=> d!156483 (and (or (is-Undefined!12283 lt!648331) (not (is-Found!12283 lt!648331)) (and (bvsge (index!51525 lt!648331) #b00000000000000000000000000000000) (bvslt (index!51525 lt!648331) (size!48593 lt!648219)))) (or (is-Undefined!12283 lt!648331) (is-Found!12283 lt!648331) (not (is-MissingVacant!12283 lt!648331)) (not (= (index!51527 lt!648331) intermediateAfterIndex!19)) (and (bvsge (index!51527 lt!648331) #b00000000000000000000000000000000) (bvslt (index!51527 lt!648331) (size!48593 lt!648219)))) (or (is-Undefined!12283 lt!648331) (ite (is-Found!12283 lt!648331) (= (select (arr!48043 lt!648219) (index!51525 lt!648331)) lt!648217) (and (is-MissingVacant!12283 lt!648331) (= (index!51527 lt!648331) intermediateAfterIndex!19) (= (select (arr!48043 lt!648219) (index!51527 lt!648331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156483 (= lt!648331 e!833099)))

(declare-fun c!137305 () Bool)

(assert (=> d!156483 (= c!137305 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156483 (= lt!648332 (select (arr!48043 lt!648219) index!646))))

(assert (=> d!156483 (validMask!0 mask!2687)))

(assert (=> d!156483 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648217 lt!648219 mask!2687) lt!648331)))

(declare-fun b!1486108 () Bool)

(assert (=> b!1486108 (= e!833098 (MissingVacant!12283 intermediateAfterIndex!19))))

(assert (= (and d!156483 c!137305) b!1486106))

(assert (= (and d!156483 (not c!137305)) b!1486105))

(assert (= (and b!1486105 c!137304) b!1486104))

(assert (= (and b!1486105 (not c!137304)) b!1486103))

(assert (= (and b!1486103 c!137303) b!1486108))

(assert (= (and b!1486103 (not c!137303)) b!1486107))

(assert (=> b!1486107 m!1370907))

(assert (=> b!1486107 m!1370907))

(declare-fun m!1371067 () Bool)

(assert (=> b!1486107 m!1371067))

(declare-fun m!1371069 () Bool)

(assert (=> d!156483 m!1371069))

(declare-fun m!1371071 () Bool)

(assert (=> d!156483 m!1371071))

(assert (=> d!156483 m!1370989))

(assert (=> d!156483 m!1370909))

(assert (=> b!1485811 d!156483))

(declare-fun d!156487 () Bool)

(declare-fun res!1010555 () Bool)

(declare-fun e!833119 () Bool)

(assert (=> d!156487 (=> res!1010555 e!833119)))

(assert (=> d!156487 (= res!1010555 (bvsge j!93 (size!48593 a!2862)))))

(assert (=> d!156487 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833119)))

(declare-fun b!1486141 () Bool)

(declare-fun e!833121 () Bool)

(declare-fun call!67889 () Bool)

(assert (=> b!1486141 (= e!833121 call!67889)))

(declare-fun b!1486142 () Bool)

(declare-fun e!833120 () Bool)

(assert (=> b!1486142 (= e!833121 e!833120)))

(declare-fun lt!648358 () (_ BitVec 64))

(assert (=> b!1486142 (= lt!648358 (select (arr!48043 a!2862) j!93))))

(declare-fun lt!648359 () Unit!49906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99534 (_ BitVec 64) (_ BitVec 32)) Unit!49906)

(assert (=> b!1486142 (= lt!648359 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648358 j!93))))

(declare-fun arrayContainsKey!0 (array!99534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1486142 (arrayContainsKey!0 a!2862 lt!648358 #b00000000000000000000000000000000)))

(declare-fun lt!648357 () Unit!49906)

(assert (=> b!1486142 (= lt!648357 lt!648359)))

(declare-fun res!1010554 () Bool)

(assert (=> b!1486142 (= res!1010554 (= (seekEntryOrOpen!0 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) (Found!12283 j!93)))))

(assert (=> b!1486142 (=> (not res!1010554) (not e!833120))))

(declare-fun b!1486143 () Bool)

(assert (=> b!1486143 (= e!833120 call!67889)))

(declare-fun bm!67886 () Bool)

(assert (=> bm!67886 (= call!67889 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1486144 () Bool)

(assert (=> b!1486144 (= e!833119 e!833121)))

(declare-fun c!137317 () Bool)

(assert (=> b!1486144 (= c!137317 (validKeyInArray!0 (select (arr!48043 a!2862) j!93)))))

(assert (= (and d!156487 (not res!1010555)) b!1486144))

(assert (= (and b!1486144 c!137317) b!1486142))

(assert (= (and b!1486144 (not c!137317)) b!1486141))

(assert (= (and b!1486142 res!1010554) b!1486143))

(assert (= (or b!1486143 b!1486141) bm!67886))

(assert (=> b!1486142 m!1370883))

(declare-fun m!1371095 () Bool)

(assert (=> b!1486142 m!1371095))

(declare-fun m!1371097 () Bool)

(assert (=> b!1486142 m!1371097))

(assert (=> b!1486142 m!1370883))

(assert (=> b!1486142 m!1370885))

(declare-fun m!1371103 () Bool)

(assert (=> bm!67886 m!1371103))

(assert (=> b!1486144 m!1370883))

(assert (=> b!1486144 m!1370883))

(assert (=> b!1486144 m!1370927))

(assert (=> b!1485810 d!156487))

(declare-fun d!156501 () Bool)

(assert (=> d!156501 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648367 () Unit!49906)

(declare-fun choose!38 (array!99534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49906)

(assert (=> d!156501 (= lt!648367 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156501 (validMask!0 mask!2687)))

(assert (=> d!156501 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648367)))

(declare-fun bs!42762 () Bool)

(assert (= bs!42762 d!156501))

(assert (=> bs!42762 m!1370897))

(declare-fun m!1371117 () Bool)

(assert (=> bs!42762 m!1371117))

(assert (=> bs!42762 m!1370909))

(assert (=> b!1485810 d!156501))

(declare-fun b!1486158 () Bool)

(declare-fun e!833132 () SeekEntryResult!12283)

(assert (=> b!1486158 (= e!833132 (Intermediate!12283 false (toIndex!0 lt!648217 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1486159 () Bool)

(declare-fun lt!648368 () SeekEntryResult!12283)

(assert (=> b!1486159 (and (bvsge (index!51526 lt!648368) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648368) (size!48593 lt!648219)))))

(declare-fun res!1010563 () Bool)

(assert (=> b!1486159 (= res!1010563 (= (select (arr!48043 lt!648219) (index!51526 lt!648368)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833134 () Bool)

(assert (=> b!1486159 (=> res!1010563 e!833134)))

(declare-fun b!1486160 () Bool)

(declare-fun e!833130 () Bool)

(declare-fun e!833133 () Bool)

(assert (=> b!1486160 (= e!833130 e!833133)))

(declare-fun res!1010561 () Bool)

(assert (=> b!1486160 (= res!1010561 (and (is-Intermediate!12283 lt!648368) (not (undefined!13095 lt!648368)) (bvslt (x!133095 lt!648368) #b01111111111111111111111111111110) (bvsge (x!133095 lt!648368) #b00000000000000000000000000000000) (bvsge (x!133095 lt!648368) #b00000000000000000000000000000000)))))

(assert (=> b!1486160 (=> (not res!1010561) (not e!833133))))

(declare-fun b!1486161 () Bool)

(assert (=> b!1486161 (= e!833132 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648217 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648217 lt!648219 mask!2687))))

(declare-fun b!1486162 () Bool)

(declare-fun e!833131 () SeekEntryResult!12283)

(assert (=> b!1486162 (= e!833131 (Intermediate!12283 true (toIndex!0 lt!648217 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1486163 () Bool)

(assert (=> b!1486163 (= e!833130 (bvsge (x!133095 lt!648368) #b01111111111111111111111111111110))))

(declare-fun b!1486164 () Bool)

(assert (=> b!1486164 (and (bvsge (index!51526 lt!648368) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648368) (size!48593 lt!648219)))))

(assert (=> b!1486164 (= e!833134 (= (select (arr!48043 lt!648219) (index!51526 lt!648368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156507 () Bool)

(assert (=> d!156507 e!833130))

(declare-fun c!137324 () Bool)

(assert (=> d!156507 (= c!137324 (and (is-Intermediate!12283 lt!648368) (undefined!13095 lt!648368)))))

(assert (=> d!156507 (= lt!648368 e!833131)))

(declare-fun c!137323 () Bool)

(assert (=> d!156507 (= c!137323 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648369 () (_ BitVec 64))

(assert (=> d!156507 (= lt!648369 (select (arr!48043 lt!648219) (toIndex!0 lt!648217 mask!2687)))))

(assert (=> d!156507 (validMask!0 mask!2687)))

(assert (=> d!156507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648217 mask!2687) lt!648217 lt!648219 mask!2687) lt!648368)))

(declare-fun b!1486165 () Bool)

(assert (=> b!1486165 (and (bvsge (index!51526 lt!648368) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648368) (size!48593 lt!648219)))))

(declare-fun res!1010562 () Bool)

(assert (=> b!1486165 (= res!1010562 (= (select (arr!48043 lt!648219) (index!51526 lt!648368)) lt!648217))))

(assert (=> b!1486165 (=> res!1010562 e!833134)))

(assert (=> b!1486165 (= e!833133 e!833134)))

(declare-fun b!1486166 () Bool)

(assert (=> b!1486166 (= e!833131 e!833132)))

(declare-fun c!137322 () Bool)

(assert (=> b!1486166 (= c!137322 (or (= lt!648369 lt!648217) (= (bvadd lt!648369 lt!648369) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156507 c!137323) b!1486162))

(assert (= (and d!156507 (not c!137323)) b!1486166))

(assert (= (and b!1486166 c!137322) b!1486158))

(assert (= (and b!1486166 (not c!137322)) b!1486161))

(assert (= (and d!156507 c!137324) b!1486163))

(assert (= (and d!156507 (not c!137324)) b!1486160))

(assert (= (and b!1486160 res!1010561) b!1486165))

(assert (= (and b!1486165 (not res!1010562)) b!1486159))

(assert (= (and b!1486159 (not res!1010563)) b!1486164))

(declare-fun m!1371119 () Bool)

(assert (=> b!1486165 m!1371119))

(assert (=> b!1486164 m!1371119))

(assert (=> b!1486161 m!1370913))

(declare-fun m!1371121 () Bool)

(assert (=> b!1486161 m!1371121))

(assert (=> b!1486161 m!1371121))

(declare-fun m!1371123 () Bool)

(assert (=> b!1486161 m!1371123))

(assert (=> b!1486159 m!1371119))

(assert (=> d!156507 m!1370913))

(declare-fun m!1371125 () Bool)

(assert (=> d!156507 m!1371125))

(assert (=> d!156507 m!1370909))

(assert (=> b!1485821 d!156507))

(declare-fun d!156509 () Bool)

(declare-fun lt!648378 () (_ BitVec 32))

(declare-fun lt!648377 () (_ BitVec 32))

(assert (=> d!156509 (= lt!648378 (bvmul (bvxor lt!648377 (bvlshr lt!648377 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156509 (= lt!648377 ((_ extract 31 0) (bvand (bvxor lt!648217 (bvlshr lt!648217 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156509 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1010564 (let ((h!35917 ((_ extract 31 0) (bvand (bvxor lt!648217 (bvlshr lt!648217 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133107 (bvmul (bvxor h!35917 (bvlshr h!35917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133107 (bvlshr x!133107 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1010564 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1010564 #b00000000000000000000000000000000))))))

(assert (=> d!156509 (= (toIndex!0 lt!648217 mask!2687) (bvand (bvxor lt!648378 (bvlshr lt!648378 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1485821 d!156509))

(declare-fun b!1486177 () Bool)

(declare-fun e!833145 () SeekEntryResult!12283)

(assert (=> b!1486177 (= e!833145 (Intermediate!12283 false index!646 x!665))))

(declare-fun b!1486178 () Bool)

(declare-fun lt!648379 () SeekEntryResult!12283)

(assert (=> b!1486178 (and (bvsge (index!51526 lt!648379) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648379) (size!48593 a!2862)))))

(declare-fun res!1010573 () Bool)

(assert (=> b!1486178 (= res!1010573 (= (select (arr!48043 a!2862) (index!51526 lt!648379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833147 () Bool)

(assert (=> b!1486178 (=> res!1010573 e!833147)))

(declare-fun b!1486179 () Bool)

(declare-fun e!833143 () Bool)

(declare-fun e!833146 () Bool)

(assert (=> b!1486179 (= e!833143 e!833146)))

(declare-fun res!1010571 () Bool)

(assert (=> b!1486179 (= res!1010571 (and (is-Intermediate!12283 lt!648379) (not (undefined!13095 lt!648379)) (bvslt (x!133095 lt!648379) #b01111111111111111111111111111110) (bvsge (x!133095 lt!648379) #b00000000000000000000000000000000) (bvsge (x!133095 lt!648379) x!665)))))

(assert (=> b!1486179 (=> (not res!1010571) (not e!833146))))

(declare-fun b!1486180 () Bool)

(assert (=> b!1486180 (= e!833145 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1486181 () Bool)

(declare-fun e!833144 () SeekEntryResult!12283)

(assert (=> b!1486181 (= e!833144 (Intermediate!12283 true index!646 x!665))))

(declare-fun b!1486182 () Bool)

(assert (=> b!1486182 (= e!833143 (bvsge (x!133095 lt!648379) #b01111111111111111111111111111110))))

(declare-fun b!1486183 () Bool)

(assert (=> b!1486183 (and (bvsge (index!51526 lt!648379) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648379) (size!48593 a!2862)))))

(assert (=> b!1486183 (= e!833147 (= (select (arr!48043 a!2862) (index!51526 lt!648379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156513 () Bool)

(assert (=> d!156513 e!833143))

(declare-fun c!137329 () Bool)

(assert (=> d!156513 (= c!137329 (and (is-Intermediate!12283 lt!648379) (undefined!13095 lt!648379)))))

(assert (=> d!156513 (= lt!648379 e!833144)))

(declare-fun c!137328 () Bool)

(assert (=> d!156513 (= c!137328 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648380 () (_ BitVec 64))

(assert (=> d!156513 (= lt!648380 (select (arr!48043 a!2862) index!646))))

(assert (=> d!156513 (validMask!0 mask!2687)))

(assert (=> d!156513 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648379)))

(declare-fun b!1486184 () Bool)

(assert (=> b!1486184 (and (bvsge (index!51526 lt!648379) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648379) (size!48593 a!2862)))))

(declare-fun res!1010572 () Bool)

(assert (=> b!1486184 (= res!1010572 (= (select (arr!48043 a!2862) (index!51526 lt!648379)) (select (arr!48043 a!2862) j!93)))))

(assert (=> b!1486184 (=> res!1010572 e!833147)))

(assert (=> b!1486184 (= e!833146 e!833147)))

(declare-fun b!1486185 () Bool)

(assert (=> b!1486185 (= e!833144 e!833145)))

(declare-fun c!137327 () Bool)

(assert (=> b!1486185 (= c!137327 (or (= lt!648380 (select (arr!48043 a!2862) j!93)) (= (bvadd lt!648380 lt!648380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156513 c!137328) b!1486181))

(assert (= (and d!156513 (not c!137328)) b!1486185))

(assert (= (and b!1486185 c!137327) b!1486177))

(assert (= (and b!1486185 (not c!137327)) b!1486180))

(assert (= (and d!156513 c!137329) b!1486182))

(assert (= (and d!156513 (not c!137329)) b!1486179))

(assert (= (and b!1486179 res!1010571) b!1486184))

(assert (= (and b!1486184 (not res!1010572)) b!1486178))

(assert (= (and b!1486178 (not res!1010573)) b!1486183))

(declare-fun m!1371129 () Bool)

(assert (=> b!1486184 m!1371129))

(assert (=> b!1486183 m!1371129))

(assert (=> b!1486180 m!1370907))

(assert (=> b!1486180 m!1370907))

(assert (=> b!1486180 m!1370883))

(declare-fun m!1371131 () Bool)

(assert (=> b!1486180 m!1371131))

(assert (=> b!1486178 m!1371129))

(assert (=> d!156513 m!1370895))

(assert (=> d!156513 m!1370909))

(assert (=> b!1485820 d!156513))

(assert (=> b!1485819 d!156483))

(assert (=> b!1485819 d!156473))

(declare-fun d!156515 () Bool)

(assert (=> d!156515 (= (validKeyInArray!0 (select (arr!48043 a!2862) i!1006)) (and (not (= (select (arr!48043 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48043 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1485818 d!156515))

(declare-fun d!156517 () Bool)

(declare-fun res!1010575 () Bool)

(declare-fun e!833148 () Bool)

(assert (=> d!156517 (=> res!1010575 e!833148)))

(assert (=> d!156517 (= res!1010575 (bvsge #b00000000000000000000000000000000 (size!48593 a!2862)))))

(assert (=> d!156517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!833148)))

(declare-fun b!1486186 () Bool)

(declare-fun e!833150 () Bool)

(declare-fun call!67893 () Bool)

(assert (=> b!1486186 (= e!833150 call!67893)))

(declare-fun b!1486187 () Bool)

(declare-fun e!833149 () Bool)

(assert (=> b!1486187 (= e!833150 e!833149)))

(declare-fun lt!648382 () (_ BitVec 64))

(assert (=> b!1486187 (= lt!648382 (select (arr!48043 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648383 () Unit!49906)

(assert (=> b!1486187 (= lt!648383 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648382 #b00000000000000000000000000000000))))

(assert (=> b!1486187 (arrayContainsKey!0 a!2862 lt!648382 #b00000000000000000000000000000000)))

(declare-fun lt!648381 () Unit!49906)

(assert (=> b!1486187 (= lt!648381 lt!648383)))

(declare-fun res!1010574 () Bool)

(assert (=> b!1486187 (= res!1010574 (= (seekEntryOrOpen!0 (select (arr!48043 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12283 #b00000000000000000000000000000000)))))

(assert (=> b!1486187 (=> (not res!1010574) (not e!833149))))

(declare-fun b!1486188 () Bool)

(assert (=> b!1486188 (= e!833149 call!67893)))

(declare-fun bm!67890 () Bool)

(assert (=> bm!67890 (= call!67893 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1486189 () Bool)

(assert (=> b!1486189 (= e!833148 e!833150)))

(declare-fun c!137330 () Bool)

(assert (=> b!1486189 (= c!137330 (validKeyInArray!0 (select (arr!48043 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156517 (not res!1010575)) b!1486189))

(assert (= (and b!1486189 c!137330) b!1486187))

(assert (= (and b!1486189 (not c!137330)) b!1486186))

(assert (= (and b!1486187 res!1010574) b!1486188))

(assert (= (or b!1486188 b!1486186) bm!67890))

(assert (=> b!1486187 m!1370999))

(declare-fun m!1371133 () Bool)

(assert (=> b!1486187 m!1371133))

(declare-fun m!1371135 () Bool)

(assert (=> b!1486187 m!1371135))

(assert (=> b!1486187 m!1370999))

(declare-fun m!1371137 () Bool)

(assert (=> b!1486187 m!1371137))

(declare-fun m!1371139 () Bool)

(assert (=> bm!67890 m!1371139))

(assert (=> b!1486189 m!1370999))

(assert (=> b!1486189 m!1370999))

(assert (=> b!1486189 m!1371001))

(assert (=> b!1485817 d!156517))

(declare-fun b!1486195 () Bool)

(declare-fun e!833155 () SeekEntryResult!12283)

(declare-fun lt!648386 () SeekEntryResult!12283)

(assert (=> b!1486195 (= e!833155 (Found!12283 (index!51526 lt!648386)))))

(declare-fun b!1486196 () Bool)

(declare-fun e!833156 () SeekEntryResult!12283)

(assert (=> b!1486196 (= e!833156 e!833155)))

(declare-fun lt!648384 () (_ BitVec 64))

(assert (=> b!1486196 (= lt!648384 (select (arr!48043 a!2862) (index!51526 lt!648386)))))

(declare-fun c!137334 () Bool)

(assert (=> b!1486196 (= c!137334 (= lt!648384 (select (arr!48043 a!2862) j!93)))))

(declare-fun e!833157 () SeekEntryResult!12283)

(declare-fun b!1486197 () Bool)

(assert (=> b!1486197 (= e!833157 (seekKeyOrZeroReturnVacant!0 (x!133095 lt!648386) (index!51526 lt!648386) (index!51526 lt!648386) (select (arr!48043 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1486198 () Bool)

(declare-fun c!137332 () Bool)

(assert (=> b!1486198 (= c!137332 (= lt!648384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486198 (= e!833155 e!833157)))

(declare-fun d!156519 () Bool)

(declare-fun lt!648385 () SeekEntryResult!12283)

(assert (=> d!156519 (and (or (is-Undefined!12283 lt!648385) (not (is-Found!12283 lt!648385)) (and (bvsge (index!51525 lt!648385) #b00000000000000000000000000000000) (bvslt (index!51525 lt!648385) (size!48593 a!2862)))) (or (is-Undefined!12283 lt!648385) (is-Found!12283 lt!648385) (not (is-MissingZero!12283 lt!648385)) (and (bvsge (index!51524 lt!648385) #b00000000000000000000000000000000) (bvslt (index!51524 lt!648385) (size!48593 a!2862)))) (or (is-Undefined!12283 lt!648385) (is-Found!12283 lt!648385) (is-MissingZero!12283 lt!648385) (not (is-MissingVacant!12283 lt!648385)) (and (bvsge (index!51527 lt!648385) #b00000000000000000000000000000000) (bvslt (index!51527 lt!648385) (size!48593 a!2862)))) (or (is-Undefined!12283 lt!648385) (ite (is-Found!12283 lt!648385) (= (select (arr!48043 a!2862) (index!51525 lt!648385)) (select (arr!48043 a!2862) j!93)) (ite (is-MissingZero!12283 lt!648385) (= (select (arr!48043 a!2862) (index!51524 lt!648385)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12283 lt!648385) (= (select (arr!48043 a!2862) (index!51527 lt!648385)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156519 (= lt!648385 e!833156)))

(declare-fun c!137333 () Bool)

(assert (=> d!156519 (= c!137333 (and (is-Intermediate!12283 lt!648386) (undefined!13095 lt!648386)))))

(assert (=> d!156519 (= lt!648386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156519 (validMask!0 mask!2687)))

(assert (=> d!156519 (= (seekEntryOrOpen!0 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648385)))

(declare-fun b!1486199 () Bool)

(assert (=> b!1486199 (= e!833156 Undefined!12283)))

(declare-fun b!1486200 () Bool)

(assert (=> b!1486200 (= e!833157 (MissingZero!12283 (index!51526 lt!648386)))))

(assert (= (and d!156519 c!137333) b!1486199))

(assert (= (and d!156519 (not c!137333)) b!1486196))

(assert (= (and b!1486196 c!137334) b!1486195))

(assert (= (and b!1486196 (not c!137334)) b!1486198))

(assert (= (and b!1486198 c!137332) b!1486200))

(assert (= (and b!1486198 (not c!137332)) b!1486197))

(declare-fun m!1371145 () Bool)

(assert (=> b!1486196 m!1371145))

(assert (=> b!1486197 m!1370883))

(declare-fun m!1371147 () Bool)

(assert (=> b!1486197 m!1371147))

(declare-fun m!1371149 () Bool)

(assert (=> d!156519 m!1371149))

(declare-fun m!1371151 () Bool)

(assert (=> d!156519 m!1371151))

(assert (=> d!156519 m!1370901))

(assert (=> d!156519 m!1370883))

(assert (=> d!156519 m!1370903))

(declare-fun m!1371153 () Bool)

(assert (=> d!156519 m!1371153))

(assert (=> d!156519 m!1370883))

(assert (=> d!156519 m!1370901))

(assert (=> d!156519 m!1370909))

(assert (=> b!1485815 d!156519))

(declare-fun e!833160 () SeekEntryResult!12283)

(declare-fun b!1486201 () Bool)

(assert (=> b!1486201 (= e!833160 (Intermediate!12283 false (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1486202 () Bool)

(declare-fun lt!648387 () SeekEntryResult!12283)

(assert (=> b!1486202 (and (bvsge (index!51526 lt!648387) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648387) (size!48593 a!2862)))))

(declare-fun res!1010581 () Bool)

(assert (=> b!1486202 (= res!1010581 (= (select (arr!48043 a!2862) (index!51526 lt!648387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833162 () Bool)

(assert (=> b!1486202 (=> res!1010581 e!833162)))

(declare-fun b!1486203 () Bool)

(declare-fun e!833158 () Bool)

(declare-fun e!833161 () Bool)

(assert (=> b!1486203 (= e!833158 e!833161)))

(declare-fun res!1010579 () Bool)

(assert (=> b!1486203 (= res!1010579 (and (is-Intermediate!12283 lt!648387) (not (undefined!13095 lt!648387)) (bvslt (x!133095 lt!648387) #b01111111111111111111111111111110) (bvsge (x!133095 lt!648387) #b00000000000000000000000000000000) (bvsge (x!133095 lt!648387) #b00000000000000000000000000000000)))))

(assert (=> b!1486203 (=> (not res!1010579) (not e!833161))))

(declare-fun b!1486204 () Bool)

(assert (=> b!1486204 (= e!833160 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687))))

(declare-fun e!833159 () SeekEntryResult!12283)

(declare-fun b!1486205 () Bool)

(assert (=> b!1486205 (= e!833159 (Intermediate!12283 true (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1486206 () Bool)

(assert (=> b!1486206 (= e!833158 (bvsge (x!133095 lt!648387) #b01111111111111111111111111111110))))

(declare-fun b!1486207 () Bool)

(assert (=> b!1486207 (and (bvsge (index!51526 lt!648387) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648387) (size!48593 a!2862)))))

(assert (=> b!1486207 (= e!833162 (= (select (arr!48043 a!2862) (index!51526 lt!648387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!156523 () Bool)

(assert (=> d!156523 e!833158))

(declare-fun c!137337 () Bool)

(assert (=> d!156523 (= c!137337 (and (is-Intermediate!12283 lt!648387) (undefined!13095 lt!648387)))))

(assert (=> d!156523 (= lt!648387 e!833159)))

(declare-fun c!137336 () Bool)

(assert (=> d!156523 (= c!137336 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648388 () (_ BitVec 64))

(assert (=> d!156523 (= lt!648388 (select (arr!48043 a!2862) (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687)))))

(assert (=> d!156523 (validMask!0 mask!2687)))

(assert (=> d!156523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!648387)))

(declare-fun b!1486208 () Bool)

(assert (=> b!1486208 (and (bvsge (index!51526 lt!648387) #b00000000000000000000000000000000) (bvslt (index!51526 lt!648387) (size!48593 a!2862)))))

(declare-fun res!1010580 () Bool)

(assert (=> b!1486208 (= res!1010580 (= (select (arr!48043 a!2862) (index!51526 lt!648387)) (select (arr!48043 a!2862) j!93)))))

(assert (=> b!1486208 (=> res!1010580 e!833162)))

(assert (=> b!1486208 (= e!833161 e!833162)))

(declare-fun b!1486209 () Bool)

(assert (=> b!1486209 (= e!833159 e!833160)))

(declare-fun c!137335 () Bool)

(assert (=> b!1486209 (= c!137335 (or (= lt!648388 (select (arr!48043 a!2862) j!93)) (= (bvadd lt!648388 lt!648388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156523 c!137336) b!1486205))

(assert (= (and d!156523 (not c!137336)) b!1486209))

(assert (= (and b!1486209 c!137335) b!1486201))

(assert (= (and b!1486209 (not c!137335)) b!1486204))

(assert (= (and d!156523 c!137337) b!1486206))

(assert (= (and d!156523 (not c!137337)) b!1486203))

(assert (= (and b!1486203 res!1010579) b!1486208))

(assert (= (and b!1486208 (not res!1010580)) b!1486202))

