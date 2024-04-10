; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126180 () Bool)

(assert start!126180)

(declare-fun res!1003928 () Bool)

(declare-fun e!829052 () Bool)

(assert (=> start!126180 (=> (not res!1003928) (not e!829052))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126180 (= res!1003928 (validMask!0 mask!2687))))

(assert (=> start!126180 e!829052))

(assert (=> start!126180 true))

(declare-datatypes ((array!99286 0))(
  ( (array!99287 (arr!47922 (Array (_ BitVec 32) (_ BitVec 64))) (size!48472 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99286)

(declare-fun array_inv!36950 (array!99286) Bool)

(assert (=> start!126180 (array_inv!36950 a!2862)))

(declare-fun b!1477840 () Bool)

(declare-fun e!829048 () Bool)

(declare-fun e!829046 () Bool)

(assert (=> b!1477840 (= e!829048 e!829046)))

(declare-fun res!1003926 () Bool)

(assert (=> b!1477840 (=> (not res!1003926) (not e!829046))))

(declare-datatypes ((SeekEntryResult!12162 0))(
  ( (MissingZero!12162 (index!51040 (_ BitVec 32))) (Found!12162 (index!51041 (_ BitVec 32))) (Intermediate!12162 (undefined!12974 Bool) (index!51042 (_ BitVec 32)) (x!132633 (_ BitVec 32))) (Undefined!12162) (MissingVacant!12162 (index!51043 (_ BitVec 32))) )
))
(declare-fun lt!645486 () SeekEntryResult!12162)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99286 (_ BitVec 32)) SeekEntryResult!12162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477840 (= res!1003926 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47922 a!2862) j!93) mask!2687) (select (arr!47922 a!2862) j!93) a!2862 mask!2687) lt!645486))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477840 (= lt!645486 (Intermediate!12162 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477841 () Bool)

(declare-fun e!829049 () Bool)

(assert (=> b!1477841 (= e!829046 e!829049)))

(declare-fun res!1003921 () Bool)

(assert (=> b!1477841 (=> (not res!1003921) (not e!829049))))

(declare-fun lt!645484 () SeekEntryResult!12162)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477841 (= res!1003921 (= lt!645484 (Intermediate!12162 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645485 () array!99286)

(declare-fun lt!645482 () (_ BitVec 64))

(assert (=> b!1477841 (= lt!645484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645482 mask!2687) lt!645482 lt!645485 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477841 (= lt!645482 (select (store (arr!47922 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!829044 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1477842 () Bool)

(assert (=> b!1477842 (= e!829044 (= lt!645484 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645482 lt!645485 mask!2687)))))

(declare-fun b!1477843 () Bool)

(declare-fun e!829047 () Bool)

(declare-fun e!829051 () Bool)

(assert (=> b!1477843 (= e!829047 e!829051)))

(declare-fun res!1003929 () Bool)

(assert (=> b!1477843 (=> (not res!1003929) (not e!829051))))

(declare-fun lt!645481 () SeekEntryResult!12162)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99286 (_ BitVec 32)) SeekEntryResult!12162)

(assert (=> b!1477843 (= res!1003929 (= lt!645481 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47922 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477844 () Bool)

(assert (=> b!1477844 (= e!829052 e!829048)))

(declare-fun res!1003936 () Bool)

(assert (=> b!1477844 (=> (not res!1003936) (not e!829048))))

(assert (=> b!1477844 (= res!1003936 (= (select (store (arr!47922 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477844 (= lt!645485 (array!99287 (store (arr!47922 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48472 a!2862)))))

(declare-fun b!1477845 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99286 (_ BitVec 32)) SeekEntryResult!12162)

(assert (=> b!1477845 (= e!829044 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645482 lt!645485 mask!2687) (seekEntryOrOpen!0 lt!645482 lt!645485 mask!2687)))))

(declare-fun b!1477846 () Bool)

(declare-fun res!1003923 () Bool)

(assert (=> b!1477846 (=> (not res!1003923) (not e!829049))))

(assert (=> b!1477846 (= res!1003923 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477847 () Bool)

(declare-fun res!1003932 () Bool)

(assert (=> b!1477847 (=> (not res!1003932) (not e!829046))))

(assert (=> b!1477847 (= res!1003932 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47922 a!2862) j!93) a!2862 mask!2687) lt!645486))))

(declare-fun b!1477848 () Bool)

(declare-fun res!1003924 () Bool)

(assert (=> b!1477848 (=> (not res!1003924) (not e!829052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477848 (= res!1003924 (validKeyInArray!0 (select (arr!47922 a!2862) j!93)))))

(declare-fun b!1477849 () Bool)

(declare-fun res!1003934 () Bool)

(assert (=> b!1477849 (=> (not res!1003934) (not e!829052))))

(assert (=> b!1477849 (= res!1003934 (validKeyInArray!0 (select (arr!47922 a!2862) i!1006)))))

(declare-fun b!1477850 () Bool)

(assert (=> b!1477850 (= e!829051 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477851 () Bool)

(declare-fun res!1003927 () Bool)

(assert (=> b!1477851 (=> (not res!1003927) (not e!829052))))

(assert (=> b!1477851 (= res!1003927 (and (= (size!48472 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48472 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48472 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477852 () Bool)

(declare-fun res!1003925 () Bool)

(assert (=> b!1477852 (=> (not res!1003925) (not e!829052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99286 (_ BitVec 32)) Bool)

(assert (=> b!1477852 (= res!1003925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477853 () Bool)

(declare-fun res!1003935 () Bool)

(assert (=> b!1477853 (=> (not res!1003935) (not e!829049))))

(assert (=> b!1477853 (= res!1003935 e!829044)))

(declare-fun c!136479 () Bool)

(assert (=> b!1477853 (= c!136479 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477854 () Bool)

(declare-fun e!829050 () Bool)

(assert (=> b!1477854 (= e!829050 e!829047)))

(declare-fun res!1003922 () Bool)

(assert (=> b!1477854 (=> res!1003922 e!829047)))

(assert (=> b!1477854 (= res!1003922 (or (and (= (select (arr!47922 a!2862) index!646) (select (store (arr!47922 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47922 a!2862) index!646) (select (arr!47922 a!2862) j!93))) (not (= (select (arr!47922 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477855 () Bool)

(declare-fun res!1003930 () Bool)

(assert (=> b!1477855 (=> (not res!1003930) (not e!829052))))

(assert (=> b!1477855 (= res!1003930 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48472 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48472 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48472 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477856 () Bool)

(declare-fun res!1003933 () Bool)

(assert (=> b!1477856 (=> (not res!1003933) (not e!829052))))

(declare-datatypes ((List!34423 0))(
  ( (Nil!34420) (Cons!34419 (h!35787 (_ BitVec 64)) (t!49117 List!34423)) )
))
(declare-fun arrayNoDuplicates!0 (array!99286 (_ BitVec 32) List!34423) Bool)

(assert (=> b!1477856 (= res!1003933 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34420))))

(declare-fun b!1477857 () Bool)

(assert (=> b!1477857 (= e!829049 (not true))))

(assert (=> b!1477857 e!829050))

(declare-fun res!1003931 () Bool)

(assert (=> b!1477857 (=> (not res!1003931) (not e!829050))))

(assert (=> b!1477857 (= res!1003931 (and (= lt!645481 (Found!12162 j!93)) (or (= (select (arr!47922 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47922 a!2862) intermediateBeforeIndex!19) (select (arr!47922 a!2862) j!93)))))))

(assert (=> b!1477857 (= lt!645481 (seekEntryOrOpen!0 (select (arr!47922 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477857 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49664 0))(
  ( (Unit!49665) )
))
(declare-fun lt!645483 () Unit!49664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49664)

(assert (=> b!1477857 (= lt!645483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126180 res!1003928) b!1477851))

(assert (= (and b!1477851 res!1003927) b!1477849))

(assert (= (and b!1477849 res!1003934) b!1477848))

(assert (= (and b!1477848 res!1003924) b!1477852))

(assert (= (and b!1477852 res!1003925) b!1477856))

(assert (= (and b!1477856 res!1003933) b!1477855))

(assert (= (and b!1477855 res!1003930) b!1477844))

(assert (= (and b!1477844 res!1003936) b!1477840))

(assert (= (and b!1477840 res!1003926) b!1477847))

(assert (= (and b!1477847 res!1003932) b!1477841))

(assert (= (and b!1477841 res!1003921) b!1477853))

(assert (= (and b!1477853 c!136479) b!1477842))

(assert (= (and b!1477853 (not c!136479)) b!1477845))

(assert (= (and b!1477853 res!1003935) b!1477846))

(assert (= (and b!1477846 res!1003923) b!1477857))

(assert (= (and b!1477857 res!1003931) b!1477854))

(assert (= (and b!1477854 (not res!1003922)) b!1477843))

(assert (= (and b!1477843 res!1003929) b!1477850))

(declare-fun m!1363775 () Bool)

(assert (=> b!1477844 m!1363775))

(declare-fun m!1363777 () Bool)

(assert (=> b!1477844 m!1363777))

(declare-fun m!1363779 () Bool)

(assert (=> b!1477854 m!1363779))

(assert (=> b!1477854 m!1363775))

(declare-fun m!1363781 () Bool)

(assert (=> b!1477854 m!1363781))

(declare-fun m!1363783 () Bool)

(assert (=> b!1477854 m!1363783))

(assert (=> b!1477847 m!1363783))

(assert (=> b!1477847 m!1363783))

(declare-fun m!1363785 () Bool)

(assert (=> b!1477847 m!1363785))

(declare-fun m!1363787 () Bool)

(assert (=> b!1477856 m!1363787))

(declare-fun m!1363789 () Bool)

(assert (=> b!1477852 m!1363789))

(assert (=> b!1477848 m!1363783))

(assert (=> b!1477848 m!1363783))

(declare-fun m!1363791 () Bool)

(assert (=> b!1477848 m!1363791))

(declare-fun m!1363793 () Bool)

(assert (=> b!1477842 m!1363793))

(assert (=> b!1477840 m!1363783))

(assert (=> b!1477840 m!1363783))

(declare-fun m!1363795 () Bool)

(assert (=> b!1477840 m!1363795))

(assert (=> b!1477840 m!1363795))

(assert (=> b!1477840 m!1363783))

(declare-fun m!1363797 () Bool)

(assert (=> b!1477840 m!1363797))

(declare-fun m!1363799 () Bool)

(assert (=> start!126180 m!1363799))

(declare-fun m!1363801 () Bool)

(assert (=> start!126180 m!1363801))

(assert (=> b!1477843 m!1363783))

(assert (=> b!1477843 m!1363783))

(declare-fun m!1363803 () Bool)

(assert (=> b!1477843 m!1363803))

(declare-fun m!1363805 () Bool)

(assert (=> b!1477841 m!1363805))

(assert (=> b!1477841 m!1363805))

(declare-fun m!1363807 () Bool)

(assert (=> b!1477841 m!1363807))

(assert (=> b!1477841 m!1363775))

(declare-fun m!1363809 () Bool)

(assert (=> b!1477841 m!1363809))

(declare-fun m!1363811 () Bool)

(assert (=> b!1477849 m!1363811))

(assert (=> b!1477849 m!1363811))

(declare-fun m!1363813 () Bool)

(assert (=> b!1477849 m!1363813))

(declare-fun m!1363815 () Bool)

(assert (=> b!1477845 m!1363815))

(declare-fun m!1363817 () Bool)

(assert (=> b!1477845 m!1363817))

(declare-fun m!1363819 () Bool)

(assert (=> b!1477857 m!1363819))

(declare-fun m!1363821 () Bool)

(assert (=> b!1477857 m!1363821))

(assert (=> b!1477857 m!1363783))

(declare-fun m!1363823 () Bool)

(assert (=> b!1477857 m!1363823))

(declare-fun m!1363825 () Bool)

(assert (=> b!1477857 m!1363825))

(assert (=> b!1477857 m!1363783))

(check-sat (not b!1477847) (not b!1477849) (not b!1477841) (not b!1477848) (not b!1477857) (not b!1477840) (not b!1477852) (not b!1477843) (not b!1477842) (not b!1477856) (not start!126180) (not b!1477845))
(check-sat)
