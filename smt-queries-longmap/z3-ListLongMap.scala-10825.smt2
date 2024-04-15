; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126614 () Bool)

(assert start!126614)

(declare-fun b!1486639 () Bool)

(declare-fun e!833321 () Bool)

(assert (=> b!1486639 (= e!833321 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!648354 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486639 (= lt!648354 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486640 () Bool)

(declare-fun res!1011171 () Bool)

(declare-fun e!833324 () Bool)

(assert (=> b!1486640 (=> (not res!1011171) (not e!833324))))

(declare-datatypes ((array!99511 0))(
  ( (array!99512 (arr!48031 (Array (_ BitVec 32) (_ BitVec 64))) (size!48583 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99511)

(declare-datatypes ((List!34610 0))(
  ( (Nil!34607) (Cons!34606 (h!35983 (_ BitVec 64)) (t!49296 List!34610)) )
))
(declare-fun arrayNoDuplicates!0 (array!99511 (_ BitVec 32) List!34610) Bool)

(assert (=> b!1486640 (= res!1011171 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34607))))

(declare-fun b!1486641 () Bool)

(declare-fun res!1011162 () Bool)

(assert (=> b!1486641 (=> (not res!1011162) (not e!833324))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486641 (= res!1011162 (and (= (size!48583 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48583 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48583 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486642 () Bool)

(declare-fun e!833316 () Bool)

(declare-fun e!833322 () Bool)

(assert (=> b!1486642 (= e!833316 e!833322)))

(declare-fun res!1011166 () Bool)

(assert (=> b!1486642 (=> res!1011166 e!833322)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!648356 () (_ BitVec 64))

(assert (=> b!1486642 (= res!1011166 (or (and (= (select (arr!48031 a!2862) index!646) lt!648356) (= (select (arr!48031 a!2862) index!646) (select (arr!48031 a!2862) j!93))) (= (select (arr!48031 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486642 (= lt!648356 (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486643 () Bool)

(declare-fun e!833317 () Bool)

(declare-fun e!833319 () Bool)

(assert (=> b!1486643 (= e!833317 e!833319)))

(declare-fun res!1011177 () Bool)

(assert (=> b!1486643 (=> (not res!1011177) (not e!833319))))

(declare-datatypes ((SeekEntryResult!12296 0))(
  ( (MissingZero!12296 (index!51576 (_ BitVec 32))) (Found!12296 (index!51577 (_ BitVec 32))) (Intermediate!12296 (undefined!13108 Bool) (index!51578 (_ BitVec 32)) (x!133153 (_ BitVec 32))) (Undefined!12296) (MissingVacant!12296 (index!51579 (_ BitVec 32))) )
))
(declare-fun lt!648355 () SeekEntryResult!12296)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99511 (_ BitVec 32)) SeekEntryResult!12296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486643 (= res!1011177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48031 a!2862) j!93) mask!2687) (select (arr!48031 a!2862) j!93) a!2862 mask!2687) lt!648355))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486643 (= lt!648355 (Intermediate!12296 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!833315 () Bool)

(declare-fun b!1486644 () Bool)

(declare-fun lt!648359 () array!99511)

(declare-fun lt!648357 () (_ BitVec 64))

(declare-fun lt!648353 () SeekEntryResult!12296)

(assert (=> b!1486644 (= e!833315 (= lt!648353 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648357 lt!648359 mask!2687)))))

(declare-fun b!1486645 () Bool)

(declare-fun e!833320 () Bool)

(assert (=> b!1486645 (= e!833322 e!833320)))

(declare-fun res!1011175 () Bool)

(assert (=> b!1486645 (=> (not res!1011175) (not e!833320))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486645 (= res!1011175 (and (= index!646 intermediateAfterIndex!19) (= lt!648356 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486646 () Bool)

(declare-fun res!1011167 () Bool)

(declare-fun e!833323 () Bool)

(assert (=> b!1486646 (=> (not res!1011167) (not e!833323))))

(assert (=> b!1486646 (= res!1011167 e!833315)))

(declare-fun c!137266 () Bool)

(assert (=> b!1486646 (= c!137266 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486647 () Bool)

(declare-fun res!1011165 () Bool)

(assert (=> b!1486647 (=> (not res!1011165) (not e!833316))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99511 (_ BitVec 32)) SeekEntryResult!12296)

(assert (=> b!1486647 (= res!1011165 (= (seekEntryOrOpen!0 (select (arr!48031 a!2862) j!93) a!2862 mask!2687) (Found!12296 j!93)))))

(declare-fun res!1011163 () Bool)

(assert (=> start!126614 (=> (not res!1011163) (not e!833324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126614 (= res!1011163 (validMask!0 mask!2687))))

(assert (=> start!126614 e!833324))

(assert (=> start!126614 true))

(declare-fun array_inv!37264 (array!99511) Bool)

(assert (=> start!126614 (array_inv!37264 a!2862)))

(declare-fun b!1486648 () Bool)

(declare-fun res!1011172 () Bool)

(assert (=> b!1486648 (=> (not res!1011172) (not e!833324))))

(assert (=> b!1486648 (= res!1011172 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48583 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48583 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48583 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99511 (_ BitVec 32)) SeekEntryResult!12296)

(assert (=> b!1486649 (= e!833320 (= (seekEntryOrOpen!0 lt!648357 lt!648359 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648357 lt!648359 mask!2687)))))

(declare-fun b!1486650 () Bool)

(declare-fun res!1011178 () Bool)

(assert (=> b!1486650 (=> (not res!1011178) (not e!833324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486650 (= res!1011178 (validKeyInArray!0 (select (arr!48031 a!2862) j!93)))))

(declare-fun b!1486651 () Bool)

(declare-fun res!1011160 () Bool)

(assert (=> b!1486651 (=> (not res!1011160) (not e!833316))))

(assert (=> b!1486651 (= res!1011160 (or (= (select (arr!48031 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48031 a!2862) intermediateBeforeIndex!19) (select (arr!48031 a!2862) j!93))))))

(declare-fun b!1486652 () Bool)

(assert (=> b!1486652 (= e!833315 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648357 lt!648359 mask!2687) (seekEntryOrOpen!0 lt!648357 lt!648359 mask!2687)))))

(declare-fun b!1486653 () Bool)

(declare-fun res!1011173 () Bool)

(assert (=> b!1486653 (=> (not res!1011173) (not e!833324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99511 (_ BitVec 32)) Bool)

(assert (=> b!1486653 (= res!1011173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486654 () Bool)

(assert (=> b!1486654 (= e!833319 e!833323)))

(declare-fun res!1011168 () Bool)

(assert (=> b!1486654 (=> (not res!1011168) (not e!833323))))

(assert (=> b!1486654 (= res!1011168 (= lt!648353 (Intermediate!12296 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486654 (= lt!648353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648357 mask!2687) lt!648357 lt!648359 mask!2687))))

(assert (=> b!1486654 (= lt!648357 (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486655 () Bool)

(declare-fun res!1011176 () Bool)

(assert (=> b!1486655 (=> (not res!1011176) (not e!833323))))

(assert (=> b!1486655 (= res!1011176 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486656 () Bool)

(assert (=> b!1486656 (= e!833323 (not e!833321))))

(declare-fun res!1011169 () Bool)

(assert (=> b!1486656 (=> res!1011169 e!833321)))

(assert (=> b!1486656 (= res!1011169 (or (and (= (select (arr!48031 a!2862) index!646) (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48031 a!2862) index!646) (select (arr!48031 a!2862) j!93))) (= (select (arr!48031 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486656 e!833316))

(declare-fun res!1011174 () Bool)

(assert (=> b!1486656 (=> (not res!1011174) (not e!833316))))

(assert (=> b!1486656 (= res!1011174 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49773 0))(
  ( (Unit!49774) )
))
(declare-fun lt!648358 () Unit!49773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49773)

(assert (=> b!1486656 (= lt!648358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486657 () Bool)

(assert (=> b!1486657 (= e!833324 e!833317)))

(declare-fun res!1011161 () Bool)

(assert (=> b!1486657 (=> (not res!1011161) (not e!833317))))

(assert (=> b!1486657 (= res!1011161 (= (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486657 (= lt!648359 (array!99512 (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48583 a!2862)))))

(declare-fun b!1486658 () Bool)

(declare-fun res!1011170 () Bool)

(assert (=> b!1486658 (=> (not res!1011170) (not e!833324))))

(assert (=> b!1486658 (= res!1011170 (validKeyInArray!0 (select (arr!48031 a!2862) i!1006)))))

(declare-fun b!1486659 () Bool)

(declare-fun res!1011164 () Bool)

(assert (=> b!1486659 (=> (not res!1011164) (not e!833319))))

(assert (=> b!1486659 (= res!1011164 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48031 a!2862) j!93) a!2862 mask!2687) lt!648355))))

(assert (= (and start!126614 res!1011163) b!1486641))

(assert (= (and b!1486641 res!1011162) b!1486658))

(assert (= (and b!1486658 res!1011170) b!1486650))

(assert (= (and b!1486650 res!1011178) b!1486653))

(assert (= (and b!1486653 res!1011173) b!1486640))

(assert (= (and b!1486640 res!1011171) b!1486648))

(assert (= (and b!1486648 res!1011172) b!1486657))

(assert (= (and b!1486657 res!1011161) b!1486643))

(assert (= (and b!1486643 res!1011177) b!1486659))

(assert (= (and b!1486659 res!1011164) b!1486654))

(assert (= (and b!1486654 res!1011168) b!1486646))

(assert (= (and b!1486646 c!137266) b!1486644))

(assert (= (and b!1486646 (not c!137266)) b!1486652))

(assert (= (and b!1486646 res!1011167) b!1486655))

(assert (= (and b!1486655 res!1011176) b!1486656))

(assert (= (and b!1486656 res!1011174) b!1486647))

(assert (= (and b!1486647 res!1011165) b!1486651))

(assert (= (and b!1486651 res!1011160) b!1486642))

(assert (= (and b!1486642 (not res!1011166)) b!1486645))

(assert (= (and b!1486645 res!1011175) b!1486649))

(assert (= (and b!1486656 (not res!1011169)) b!1486639))

(declare-fun m!1370883 () Bool)

(assert (=> b!1486639 m!1370883))

(declare-fun m!1370885 () Bool)

(assert (=> b!1486656 m!1370885))

(declare-fun m!1370887 () Bool)

(assert (=> b!1486656 m!1370887))

(declare-fun m!1370889 () Bool)

(assert (=> b!1486656 m!1370889))

(declare-fun m!1370891 () Bool)

(assert (=> b!1486656 m!1370891))

(declare-fun m!1370893 () Bool)

(assert (=> b!1486656 m!1370893))

(declare-fun m!1370895 () Bool)

(assert (=> b!1486656 m!1370895))

(declare-fun m!1370897 () Bool)

(assert (=> b!1486640 m!1370897))

(declare-fun m!1370899 () Bool)

(assert (=> b!1486649 m!1370899))

(declare-fun m!1370901 () Bool)

(assert (=> b!1486649 m!1370901))

(assert (=> b!1486647 m!1370895))

(assert (=> b!1486647 m!1370895))

(declare-fun m!1370903 () Bool)

(assert (=> b!1486647 m!1370903))

(declare-fun m!1370905 () Bool)

(assert (=> b!1486658 m!1370905))

(assert (=> b!1486658 m!1370905))

(declare-fun m!1370907 () Bool)

(assert (=> b!1486658 m!1370907))

(declare-fun m!1370909 () Bool)

(assert (=> b!1486654 m!1370909))

(assert (=> b!1486654 m!1370909))

(declare-fun m!1370911 () Bool)

(assert (=> b!1486654 m!1370911))

(assert (=> b!1486654 m!1370887))

(declare-fun m!1370913 () Bool)

(assert (=> b!1486654 m!1370913))

(declare-fun m!1370915 () Bool)

(assert (=> b!1486644 m!1370915))

(declare-fun m!1370917 () Bool)

(assert (=> b!1486651 m!1370917))

(assert (=> b!1486651 m!1370895))

(assert (=> b!1486659 m!1370895))

(assert (=> b!1486659 m!1370895))

(declare-fun m!1370919 () Bool)

(assert (=> b!1486659 m!1370919))

(declare-fun m!1370921 () Bool)

(assert (=> b!1486653 m!1370921))

(declare-fun m!1370923 () Bool)

(assert (=> start!126614 m!1370923))

(declare-fun m!1370925 () Bool)

(assert (=> start!126614 m!1370925))

(assert (=> b!1486643 m!1370895))

(assert (=> b!1486643 m!1370895))

(declare-fun m!1370927 () Bool)

(assert (=> b!1486643 m!1370927))

(assert (=> b!1486643 m!1370927))

(assert (=> b!1486643 m!1370895))

(declare-fun m!1370929 () Bool)

(assert (=> b!1486643 m!1370929))

(assert (=> b!1486650 m!1370895))

(assert (=> b!1486650 m!1370895))

(declare-fun m!1370931 () Bool)

(assert (=> b!1486650 m!1370931))

(assert (=> b!1486652 m!1370901))

(assert (=> b!1486652 m!1370899))

(assert (=> b!1486642 m!1370891))

(assert (=> b!1486642 m!1370895))

(assert (=> b!1486642 m!1370887))

(assert (=> b!1486642 m!1370889))

(assert (=> b!1486657 m!1370887))

(declare-fun m!1370933 () Bool)

(assert (=> b!1486657 m!1370933))

(check-sat (not b!1486647) (not b!1486639) (not b!1486658) (not b!1486652) (not b!1486656) (not b!1486640) (not b!1486659) (not start!126614) (not b!1486654) (not b!1486653) (not b!1486649) (not b!1486650) (not b!1486644) (not b!1486643))
(check-sat)
