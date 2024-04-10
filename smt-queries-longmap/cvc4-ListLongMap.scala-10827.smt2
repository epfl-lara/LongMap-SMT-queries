; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126746 () Bool)

(assert start!126746)

(declare-fun b!1487937 () Bool)

(declare-fun res!1011896 () Bool)

(declare-fun e!834046 () Bool)

(assert (=> b!1487937 (=> (not res!1011896) (not e!834046))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99582 0))(
  ( (array!99583 (arr!48064 (Array (_ BitVec 32) (_ BitVec 64))) (size!48614 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99582)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1487937 (= res!1011896 (or (= (select (arr!48064 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48064 a!2862) intermediateBeforeIndex!19) (select (arr!48064 a!2862) j!93))))))

(declare-fun b!1487938 () Bool)

(declare-fun res!1011901 () Bool)

(declare-fun e!834047 () Bool)

(assert (=> b!1487938 (=> (not res!1011901) (not e!834047))))

(declare-datatypes ((List!34565 0))(
  ( (Nil!34562) (Cons!34561 (h!35941 (_ BitVec 64)) (t!49259 List!34565)) )
))
(declare-fun arrayNoDuplicates!0 (array!99582 (_ BitVec 32) List!34565) Bool)

(assert (=> b!1487938 (= res!1011901 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34562))))

(declare-fun res!1011912 () Bool)

(assert (=> start!126746 (=> (not res!1011912) (not e!834047))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126746 (= res!1011912 (validMask!0 mask!2687))))

(assert (=> start!126746 e!834047))

(assert (=> start!126746 true))

(declare-fun array_inv!37092 (array!99582) Bool)

(assert (=> start!126746 (array_inv!37092 a!2862)))

(declare-fun b!1487939 () Bool)

(declare-fun e!834041 () Bool)

(declare-fun e!834045 () Bool)

(assert (=> b!1487939 (= e!834041 e!834045)))

(declare-fun res!1011905 () Bool)

(assert (=> b!1487939 (=> (not res!1011905) (not e!834045))))

(declare-datatypes ((SeekEntryResult!12304 0))(
  ( (MissingZero!12304 (index!51608 (_ BitVec 32))) (Found!12304 (index!51609 (_ BitVec 32))) (Intermediate!12304 (undefined!13116 Bool) (index!51610 (_ BitVec 32)) (x!133196 (_ BitVec 32))) (Undefined!12304) (MissingVacant!12304 (index!51611 (_ BitVec 32))) )
))
(declare-fun lt!649007 () SeekEntryResult!12304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99582 (_ BitVec 32)) SeekEntryResult!12304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487939 (= res!1011905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48064 a!2862) j!93) mask!2687) (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!649007))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487939 (= lt!649007 (Intermediate!12304 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487940 () Bool)

(declare-fun res!1011911 () Bool)

(declare-fun e!834048 () Bool)

(assert (=> b!1487940 (=> (not res!1011911) (not e!834048))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487940 (= res!1011911 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487941 () Bool)

(declare-fun e!834050 () Bool)

(assert (=> b!1487941 (= e!834050 true)))

(declare-fun lt!649009 () SeekEntryResult!12304)

(declare-fun lt!649011 () (_ BitVec 32))

(assert (=> b!1487941 (= lt!649009 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649011 (select (arr!48064 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487942 () Bool)

(declare-fun res!1011909 () Bool)

(assert (=> b!1487942 (=> (not res!1011909) (not e!834047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99582 (_ BitVec 32)) Bool)

(assert (=> b!1487942 (= res!1011909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!649012 () (_ BitVec 64))

(declare-fun b!1487943 () Bool)

(declare-fun lt!649013 () array!99582)

(declare-fun e!834042 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649014 () SeekEntryResult!12304)

(assert (=> b!1487943 (= e!834042 (= lt!649014 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649012 lt!649013 mask!2687)))))

(declare-fun b!1487944 () Bool)

(declare-fun res!1011907 () Bool)

(assert (=> b!1487944 (=> (not res!1011907) (not e!834047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487944 (= res!1011907 (validKeyInArray!0 (select (arr!48064 a!2862) j!93)))))

(declare-fun b!1487945 () Bool)

(declare-fun res!1011894 () Bool)

(assert (=> b!1487945 (=> (not res!1011894) (not e!834048))))

(assert (=> b!1487945 (= res!1011894 e!834042)))

(declare-fun c!137547 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1487945 (= c!137547 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487946 () Bool)

(declare-fun res!1011900 () Bool)

(assert (=> b!1487946 (=> (not res!1011900) (not e!834046))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99582 (_ BitVec 32)) SeekEntryResult!12304)

(assert (=> b!1487946 (= res!1011900 (= (seekEntryOrOpen!0 (select (arr!48064 a!2862) j!93) a!2862 mask!2687) (Found!12304 j!93)))))

(declare-fun b!1487947 () Bool)

(declare-fun res!1011895 () Bool)

(assert (=> b!1487947 (=> (not res!1011895) (not e!834047))))

(assert (=> b!1487947 (= res!1011895 (and (= (size!48614 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48614 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48614 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487948 () Bool)

(declare-fun e!834040 () Bool)

(assert (=> b!1487948 (= e!834048 (not e!834040))))

(declare-fun res!1011902 () Bool)

(assert (=> b!1487948 (=> res!1011902 e!834040)))

(assert (=> b!1487948 (= res!1011902 (or (and (= (select (arr!48064 a!2862) index!646) (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48064 a!2862) index!646) (select (arr!48064 a!2862) j!93))) (= (select (arr!48064 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487948 e!834046))

(declare-fun res!1011904 () Bool)

(assert (=> b!1487948 (=> (not res!1011904) (not e!834046))))

(assert (=> b!1487948 (= res!1011904 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49948 0))(
  ( (Unit!49949) )
))
(declare-fun lt!649008 () Unit!49948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49948)

(assert (=> b!1487948 (= lt!649008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487949 () Bool)

(declare-fun res!1011906 () Bool)

(assert (=> b!1487949 (=> (not res!1011906) (not e!834047))))

(assert (=> b!1487949 (= res!1011906 (validKeyInArray!0 (select (arr!48064 a!2862) i!1006)))))

(declare-fun b!1487950 () Bool)

(assert (=> b!1487950 (= e!834047 e!834041)))

(declare-fun res!1011908 () Bool)

(assert (=> b!1487950 (=> (not res!1011908) (not e!834041))))

(assert (=> b!1487950 (= res!1011908 (= (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487950 (= lt!649013 (array!99583 (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48614 a!2862)))))

(declare-fun b!1487951 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99582 (_ BitVec 32)) SeekEntryResult!12304)

(assert (=> b!1487951 (= e!834042 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649012 lt!649013 mask!2687) (seekEntryOrOpen!0 lt!649012 lt!649013 mask!2687)))))

(declare-fun b!1487952 () Bool)

(assert (=> b!1487952 (= e!834040 e!834050)))

(declare-fun res!1011898 () Bool)

(assert (=> b!1487952 (=> res!1011898 e!834050)))

(assert (=> b!1487952 (= res!1011898 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649011 #b00000000000000000000000000000000) (bvsge lt!649011 (size!48614 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487952 (= lt!649011 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487953 () Bool)

(declare-fun e!834049 () Bool)

(declare-fun e!834044 () Bool)

(assert (=> b!1487953 (= e!834049 e!834044)))

(declare-fun res!1011903 () Bool)

(assert (=> b!1487953 (=> (not res!1011903) (not e!834044))))

(declare-fun lt!649010 () (_ BitVec 64))

(assert (=> b!1487953 (= res!1011903 (and (= index!646 intermediateAfterIndex!19) (= lt!649010 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487954 () Bool)

(assert (=> b!1487954 (= e!834046 e!834049)))

(declare-fun res!1011910 () Bool)

(assert (=> b!1487954 (=> res!1011910 e!834049)))

(assert (=> b!1487954 (= res!1011910 (or (and (= (select (arr!48064 a!2862) index!646) lt!649010) (= (select (arr!48064 a!2862) index!646) (select (arr!48064 a!2862) j!93))) (= (select (arr!48064 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487954 (= lt!649010 (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487955 () Bool)

(assert (=> b!1487955 (= e!834044 (= (seekEntryOrOpen!0 lt!649012 lt!649013 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649012 lt!649013 mask!2687)))))

(declare-fun b!1487956 () Bool)

(assert (=> b!1487956 (= e!834045 e!834048)))

(declare-fun res!1011899 () Bool)

(assert (=> b!1487956 (=> (not res!1011899) (not e!834048))))

(assert (=> b!1487956 (= res!1011899 (= lt!649014 (Intermediate!12304 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1487956 (= lt!649014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649012 mask!2687) lt!649012 lt!649013 mask!2687))))

(assert (=> b!1487956 (= lt!649012 (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487957 () Bool)

(declare-fun res!1011913 () Bool)

(assert (=> b!1487957 (=> (not res!1011913) (not e!834045))))

(assert (=> b!1487957 (= res!1011913 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!649007))))

(declare-fun b!1487958 () Bool)

(declare-fun res!1011897 () Bool)

(assert (=> b!1487958 (=> (not res!1011897) (not e!834047))))

(assert (=> b!1487958 (= res!1011897 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48614 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48614 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48614 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126746 res!1011912) b!1487947))

(assert (= (and b!1487947 res!1011895) b!1487949))

(assert (= (and b!1487949 res!1011906) b!1487944))

(assert (= (and b!1487944 res!1011907) b!1487942))

(assert (= (and b!1487942 res!1011909) b!1487938))

(assert (= (and b!1487938 res!1011901) b!1487958))

(assert (= (and b!1487958 res!1011897) b!1487950))

(assert (= (and b!1487950 res!1011908) b!1487939))

(assert (= (and b!1487939 res!1011905) b!1487957))

(assert (= (and b!1487957 res!1011913) b!1487956))

(assert (= (and b!1487956 res!1011899) b!1487945))

(assert (= (and b!1487945 c!137547) b!1487943))

(assert (= (and b!1487945 (not c!137547)) b!1487951))

(assert (= (and b!1487945 res!1011894) b!1487940))

(assert (= (and b!1487940 res!1011911) b!1487948))

(assert (= (and b!1487948 res!1011904) b!1487946))

(assert (= (and b!1487946 res!1011900) b!1487937))

(assert (= (and b!1487937 res!1011896) b!1487954))

(assert (= (and b!1487954 (not res!1011910)) b!1487953))

(assert (= (and b!1487953 res!1011903) b!1487955))

(assert (= (and b!1487948 (not res!1011902)) b!1487952))

(assert (= (and b!1487952 (not res!1011898)) b!1487941))

(declare-fun m!1372471 () Bool)

(assert (=> b!1487942 m!1372471))

(declare-fun m!1372473 () Bool)

(assert (=> b!1487957 m!1372473))

(assert (=> b!1487957 m!1372473))

(declare-fun m!1372475 () Bool)

(assert (=> b!1487957 m!1372475))

(assert (=> b!1487944 m!1372473))

(assert (=> b!1487944 m!1372473))

(declare-fun m!1372477 () Bool)

(assert (=> b!1487944 m!1372477))

(assert (=> b!1487939 m!1372473))

(assert (=> b!1487939 m!1372473))

(declare-fun m!1372479 () Bool)

(assert (=> b!1487939 m!1372479))

(assert (=> b!1487939 m!1372479))

(assert (=> b!1487939 m!1372473))

(declare-fun m!1372481 () Bool)

(assert (=> b!1487939 m!1372481))

(declare-fun m!1372483 () Bool)

(assert (=> start!126746 m!1372483))

(declare-fun m!1372485 () Bool)

(assert (=> start!126746 m!1372485))

(assert (=> b!1487946 m!1372473))

(assert (=> b!1487946 m!1372473))

(declare-fun m!1372487 () Bool)

(assert (=> b!1487946 m!1372487))

(declare-fun m!1372489 () Bool)

(assert (=> b!1487937 m!1372489))

(assert (=> b!1487937 m!1372473))

(declare-fun m!1372491 () Bool)

(assert (=> b!1487949 m!1372491))

(assert (=> b!1487949 m!1372491))

(declare-fun m!1372493 () Bool)

(assert (=> b!1487949 m!1372493))

(declare-fun m!1372495 () Bool)

(assert (=> b!1487952 m!1372495))

(declare-fun m!1372497 () Bool)

(assert (=> b!1487956 m!1372497))

(assert (=> b!1487956 m!1372497))

(declare-fun m!1372499 () Bool)

(assert (=> b!1487956 m!1372499))

(declare-fun m!1372501 () Bool)

(assert (=> b!1487956 m!1372501))

(declare-fun m!1372503 () Bool)

(assert (=> b!1487956 m!1372503))

(declare-fun m!1372505 () Bool)

(assert (=> b!1487948 m!1372505))

(assert (=> b!1487948 m!1372501))

(declare-fun m!1372507 () Bool)

(assert (=> b!1487948 m!1372507))

(declare-fun m!1372509 () Bool)

(assert (=> b!1487948 m!1372509))

(declare-fun m!1372511 () Bool)

(assert (=> b!1487948 m!1372511))

(assert (=> b!1487948 m!1372473))

(declare-fun m!1372513 () Bool)

(assert (=> b!1487951 m!1372513))

(declare-fun m!1372515 () Bool)

(assert (=> b!1487951 m!1372515))

(assert (=> b!1487955 m!1372515))

(assert (=> b!1487955 m!1372513))

(assert (=> b!1487950 m!1372501))

(declare-fun m!1372517 () Bool)

(assert (=> b!1487950 m!1372517))

(assert (=> b!1487941 m!1372473))

(assert (=> b!1487941 m!1372473))

(declare-fun m!1372519 () Bool)

(assert (=> b!1487941 m!1372519))

(declare-fun m!1372521 () Bool)

(assert (=> b!1487943 m!1372521))

(assert (=> b!1487954 m!1372509))

(assert (=> b!1487954 m!1372473))

(assert (=> b!1487954 m!1372501))

(assert (=> b!1487954 m!1372507))

(declare-fun m!1372523 () Bool)

(assert (=> b!1487938 m!1372523))

(push 1)

