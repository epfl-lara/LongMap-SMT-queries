; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126094 () Bool)

(assert start!126094)

(declare-fun b!1476133 () Bool)

(declare-fun e!828175 () Bool)

(declare-fun e!828177 () Bool)

(assert (=> b!1476133 (= e!828175 e!828177)))

(declare-fun res!1002509 () Bool)

(assert (=> b!1476133 (=> (not res!1002509) (not e!828177))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99178 0))(
  ( (array!99179 (arr!47869 (Array (_ BitVec 32) (_ BitVec 64))) (size!48421 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99178)

(assert (=> b!1476133 (= res!1002509 (= (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644746 () array!99178)

(assert (=> b!1476133 (= lt!644746 (array!99179 (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48421 a!2862)))))

(declare-fun b!1476134 () Bool)

(declare-fun e!828172 () Bool)

(declare-fun e!828178 () Bool)

(assert (=> b!1476134 (= e!828172 e!828178)))

(declare-fun res!1002501 () Bool)

(assert (=> b!1476134 (=> (not res!1002501) (not e!828178))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12134 0))(
  ( (MissingZero!12134 (index!50928 (_ BitVec 32))) (Found!12134 (index!50929 (_ BitVec 32))) (Intermediate!12134 (undefined!12946 Bool) (index!50930 (_ BitVec 32)) (x!132528 (_ BitVec 32))) (Undefined!12134) (MissingVacant!12134 (index!50931 (_ BitVec 32))) )
))
(declare-fun lt!644745 () SeekEntryResult!12134)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99178 (_ BitVec 32)) SeekEntryResult!12134)

(assert (=> b!1476134 (= res!1002501 (= lt!644745 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47869 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476135 () Bool)

(declare-fun res!1002510 () Bool)

(assert (=> b!1476135 (=> (not res!1002510) (not e!828175))))

(declare-datatypes ((List!34448 0))(
  ( (Nil!34445) (Cons!34444 (h!35812 (_ BitVec 64)) (t!49134 List!34448)) )
))
(declare-fun arrayNoDuplicates!0 (array!99178 (_ BitVec 32) List!34448) Bool)

(assert (=> b!1476135 (= res!1002510 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34445))))

(declare-fun b!1476136 () Bool)

(declare-fun e!828174 () Bool)

(assert (=> b!1476136 (= e!828174 e!828172)))

(declare-fun res!1002502 () Bool)

(assert (=> b!1476136 (=> res!1002502 e!828172)))

(assert (=> b!1476136 (= res!1002502 (or (and (= (select (arr!47869 a!2862) index!646) (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47869 a!2862) index!646) (select (arr!47869 a!2862) j!93))) (not (= (select (arr!47869 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476137 () Bool)

(declare-fun res!1002504 () Bool)

(declare-fun e!828179 () Bool)

(assert (=> b!1476137 (=> (not res!1002504) (not e!828179))))

(declare-fun lt!644743 () SeekEntryResult!12134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99178 (_ BitVec 32)) SeekEntryResult!12134)

(assert (=> b!1476137 (= res!1002504 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!644743))))

(declare-fun b!1476138 () Bool)

(declare-fun res!1002511 () Bool)

(declare-fun e!828173 () Bool)

(assert (=> b!1476138 (=> (not res!1002511) (not e!828173))))

(declare-fun e!828176 () Bool)

(assert (=> b!1476138 (= res!1002511 e!828176)))

(declare-fun c!136339 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476138 (= c!136339 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1002508 () Bool)

(assert (=> start!126094 (=> (not res!1002508) (not e!828175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126094 (= res!1002508 (validMask!0 mask!2687))))

(assert (=> start!126094 e!828175))

(assert (=> start!126094 true))

(declare-fun array_inv!37102 (array!99178) Bool)

(assert (=> start!126094 (array_inv!37102 a!2862)))

(declare-fun b!1476139 () Bool)

(assert (=> b!1476139 (= e!828179 e!828173)))

(declare-fun res!1002512 () Bool)

(assert (=> b!1476139 (=> (not res!1002512) (not e!828173))))

(declare-fun lt!644748 () SeekEntryResult!12134)

(assert (=> b!1476139 (= res!1002512 (= lt!644748 (Intermediate!12134 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644744 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476139 (= lt!644748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644744 mask!2687) lt!644744 lt!644746 mask!2687))))

(assert (=> b!1476139 (= lt!644744 (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476140 () Bool)

(declare-fun res!1002507 () Bool)

(assert (=> b!1476140 (=> (not res!1002507) (not e!828175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476140 (= res!1002507 (validKeyInArray!0 (select (arr!47869 a!2862) j!93)))))

(declare-fun b!1476141 () Bool)

(assert (=> b!1476141 (= e!828177 e!828179)))

(declare-fun res!1002513 () Bool)

(assert (=> b!1476141 (=> (not res!1002513) (not e!828179))))

(assert (=> b!1476141 (= res!1002513 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!644743))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476141 (= lt!644743 (Intermediate!12134 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476142 () Bool)

(assert (=> b!1476142 (= e!828176 (= lt!644748 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644744 lt!644746 mask!2687)))))

(declare-fun b!1476143 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99178 (_ BitVec 32)) SeekEntryResult!12134)

(assert (=> b!1476143 (= e!828176 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644744 lt!644746 mask!2687) (seekEntryOrOpen!0 lt!644744 lt!644746 mask!2687)))))

(declare-fun b!1476144 () Bool)

(declare-fun res!1002499 () Bool)

(assert (=> b!1476144 (=> (not res!1002499) (not e!828175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99178 (_ BitVec 32)) Bool)

(assert (=> b!1476144 (= res!1002499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476145 () Bool)

(declare-fun res!1002505 () Bool)

(assert (=> b!1476145 (=> (not res!1002505) (not e!828173))))

(assert (=> b!1476145 (= res!1002505 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476146 () Bool)

(declare-fun res!1002503 () Bool)

(assert (=> b!1476146 (=> (not res!1002503) (not e!828175))))

(assert (=> b!1476146 (= res!1002503 (validKeyInArray!0 (select (arr!47869 a!2862) i!1006)))))

(declare-fun b!1476147 () Bool)

(declare-fun res!1002500 () Bool)

(assert (=> b!1476147 (=> (not res!1002500) (not e!828175))))

(assert (=> b!1476147 (= res!1002500 (and (= (size!48421 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48421 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48421 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476148 () Bool)

(assert (=> b!1476148 (= e!828173 (not true))))

(assert (=> b!1476148 e!828174))

(declare-fun res!1002506 () Bool)

(assert (=> b!1476148 (=> (not res!1002506) (not e!828174))))

(assert (=> b!1476148 (= res!1002506 (and (= lt!644745 (Found!12134 j!93)) (or (= (select (arr!47869 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47869 a!2862) intermediateBeforeIndex!19) (select (arr!47869 a!2862) j!93)))))))

(assert (=> b!1476148 (= lt!644745 (seekEntryOrOpen!0 (select (arr!47869 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476148 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49449 0))(
  ( (Unit!49450) )
))
(declare-fun lt!644747 () Unit!49449)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49449)

(assert (=> b!1476148 (= lt!644747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476149 () Bool)

(assert (=> b!1476149 (= e!828178 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476150 () Bool)

(declare-fun res!1002514 () Bool)

(assert (=> b!1476150 (=> (not res!1002514) (not e!828175))))

(assert (=> b!1476150 (= res!1002514 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48421 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48421 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48421 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126094 res!1002508) b!1476147))

(assert (= (and b!1476147 res!1002500) b!1476146))

(assert (= (and b!1476146 res!1002503) b!1476140))

(assert (= (and b!1476140 res!1002507) b!1476144))

(assert (= (and b!1476144 res!1002499) b!1476135))

(assert (= (and b!1476135 res!1002510) b!1476150))

(assert (= (and b!1476150 res!1002514) b!1476133))

(assert (= (and b!1476133 res!1002509) b!1476141))

(assert (= (and b!1476141 res!1002513) b!1476137))

(assert (= (and b!1476137 res!1002504) b!1476139))

(assert (= (and b!1476139 res!1002512) b!1476138))

(assert (= (and b!1476138 c!136339) b!1476142))

(assert (= (and b!1476138 (not c!136339)) b!1476143))

(assert (= (and b!1476138 res!1002511) b!1476145))

(assert (= (and b!1476145 res!1002505) b!1476148))

(assert (= (and b!1476148 res!1002506) b!1476136))

(assert (= (and b!1476136 (not res!1002502)) b!1476134))

(assert (= (and b!1476134 res!1002501) b!1476149))

(declare-fun m!1361643 () Bool)

(assert (=> b!1476142 m!1361643))

(declare-fun m!1361645 () Bool)

(assert (=> b!1476148 m!1361645))

(declare-fun m!1361647 () Bool)

(assert (=> b!1476148 m!1361647))

(declare-fun m!1361649 () Bool)

(assert (=> b!1476148 m!1361649))

(declare-fun m!1361651 () Bool)

(assert (=> b!1476148 m!1361651))

(declare-fun m!1361653 () Bool)

(assert (=> b!1476148 m!1361653))

(assert (=> b!1476148 m!1361649))

(declare-fun m!1361655 () Bool)

(assert (=> b!1476135 m!1361655))

(assert (=> b!1476140 m!1361649))

(assert (=> b!1476140 m!1361649))

(declare-fun m!1361657 () Bool)

(assert (=> b!1476140 m!1361657))

(assert (=> b!1476137 m!1361649))

(assert (=> b!1476137 m!1361649))

(declare-fun m!1361659 () Bool)

(assert (=> b!1476137 m!1361659))

(declare-fun m!1361661 () Bool)

(assert (=> b!1476143 m!1361661))

(declare-fun m!1361663 () Bool)

(assert (=> b!1476143 m!1361663))

(assert (=> b!1476141 m!1361649))

(assert (=> b!1476141 m!1361649))

(declare-fun m!1361665 () Bool)

(assert (=> b!1476141 m!1361665))

(assert (=> b!1476141 m!1361665))

(assert (=> b!1476141 m!1361649))

(declare-fun m!1361667 () Bool)

(assert (=> b!1476141 m!1361667))

(declare-fun m!1361669 () Bool)

(assert (=> b!1476146 m!1361669))

(assert (=> b!1476146 m!1361669))

(declare-fun m!1361671 () Bool)

(assert (=> b!1476146 m!1361671))

(assert (=> b!1476134 m!1361649))

(assert (=> b!1476134 m!1361649))

(declare-fun m!1361673 () Bool)

(assert (=> b!1476134 m!1361673))

(declare-fun m!1361675 () Bool)

(assert (=> b!1476136 m!1361675))

(declare-fun m!1361677 () Bool)

(assert (=> b!1476136 m!1361677))

(declare-fun m!1361679 () Bool)

(assert (=> b!1476136 m!1361679))

(assert (=> b!1476136 m!1361649))

(declare-fun m!1361681 () Bool)

(assert (=> b!1476139 m!1361681))

(assert (=> b!1476139 m!1361681))

(declare-fun m!1361683 () Bool)

(assert (=> b!1476139 m!1361683))

(assert (=> b!1476139 m!1361677))

(declare-fun m!1361685 () Bool)

(assert (=> b!1476139 m!1361685))

(assert (=> b!1476133 m!1361677))

(declare-fun m!1361687 () Bool)

(assert (=> b!1476133 m!1361687))

(declare-fun m!1361689 () Bool)

(assert (=> b!1476144 m!1361689))

(declare-fun m!1361691 () Bool)

(assert (=> start!126094 m!1361691))

(declare-fun m!1361693 () Bool)

(assert (=> start!126094 m!1361693))

(check-sat (not b!1476137) (not start!126094) (not b!1476140) (not b!1476143) (not b!1476135) (not b!1476148) (not b!1476141) (not b!1476134) (not b!1476146) (not b!1476142) (not b!1476144) (not b!1476139))
(check-sat)
