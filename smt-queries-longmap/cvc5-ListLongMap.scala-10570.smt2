; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124558 () Bool)

(assert start!124558)

(declare-fun b!1441672 () Bool)

(declare-fun res!973987 () Bool)

(declare-fun e!812671 () Bool)

(assert (=> b!1441672 (=> (not res!973987) (not e!812671))))

(declare-datatypes ((array!98006 0))(
  ( (array!98007 (arr!47291 (Array (_ BitVec 32) (_ BitVec 64))) (size!47841 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98006)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441672 (= res!973987 (validKeyInArray!0 (select (arr!47291 a!2862) j!93)))))

(declare-fun b!1441673 () Bool)

(declare-fun e!812672 () Bool)

(assert (=> b!1441673 (= e!812671 e!812672)))

(declare-fun res!973989 () Bool)

(assert (=> b!1441673 (=> (not res!973989) (not e!812672))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441673 (= res!973989 (= (select (store (arr!47291 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633324 () array!98006)

(assert (=> b!1441673 (= lt!633324 (array!98007 (store (arr!47291 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47841 a!2862)))))

(declare-fun b!1441674 () Bool)

(declare-fun res!973993 () Bool)

(assert (=> b!1441674 (=> (not res!973993) (not e!812671))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1441674 (= res!973993 (and (= (size!47841 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47841 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47841 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441675 () Bool)

(declare-fun res!973990 () Bool)

(declare-fun e!812667 () Bool)

(assert (=> b!1441675 (=> (not res!973990) (not e!812667))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441675 (= res!973990 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441676 () Bool)

(declare-fun res!973998 () Bool)

(declare-fun e!812670 () Bool)

(assert (=> b!1441676 (=> (not res!973998) (not e!812670))))

(declare-datatypes ((SeekEntryResult!11543 0))(
  ( (MissingZero!11543 (index!48564 (_ BitVec 32))) (Found!11543 (index!48565 (_ BitVec 32))) (Intermediate!11543 (undefined!12355 Bool) (index!48566 (_ BitVec 32)) (x!130280 (_ BitVec 32))) (Undefined!11543) (MissingVacant!11543 (index!48567 (_ BitVec 32))) )
))
(declare-fun lt!633322 () SeekEntryResult!11543)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98006 (_ BitVec 32)) SeekEntryResult!11543)

(assert (=> b!1441676 (= res!973998 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47291 a!2862) j!93) a!2862 mask!2687) lt!633322))))

(declare-fun b!1441677 () Bool)

(assert (=> b!1441677 (= e!812670 e!812667)))

(declare-fun res!973988 () Bool)

(assert (=> b!1441677 (=> (not res!973988) (not e!812667))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!633320 () SeekEntryResult!11543)

(assert (=> b!1441677 (= res!973988 (= lt!633320 (Intermediate!11543 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633323 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441677 (= lt!633320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633323 mask!2687) lt!633323 lt!633324 mask!2687))))

(assert (=> b!1441677 (= lt!633323 (select (store (arr!47291 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441678 () Bool)

(declare-fun res!973997 () Bool)

(assert (=> b!1441678 (=> (not res!973997) (not e!812671))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441678 (= res!973997 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47841 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47841 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47841 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441679 () Bool)

(assert (=> b!1441679 (= e!812672 e!812670)))

(declare-fun res!973992 () Bool)

(assert (=> b!1441679 (=> (not res!973992) (not e!812670))))

(assert (=> b!1441679 (= res!973992 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47291 a!2862) j!93) mask!2687) (select (arr!47291 a!2862) j!93) a!2862 mask!2687) lt!633322))))

(assert (=> b!1441679 (= lt!633322 (Intermediate!11543 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441680 () Bool)

(declare-fun e!812669 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98006 (_ BitVec 32)) SeekEntryResult!11543)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98006 (_ BitVec 32)) SeekEntryResult!11543)

(assert (=> b!1441680 (= e!812669 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633323 lt!633324 mask!2687) (seekEntryOrOpen!0 lt!633323 lt!633324 mask!2687)))))

(declare-fun b!1441681 () Bool)

(declare-fun res!973999 () Bool)

(assert (=> b!1441681 (=> (not res!973999) (not e!812667))))

(assert (=> b!1441681 (= res!973999 e!812669)))

(declare-fun c!133353 () Bool)

(assert (=> b!1441681 (= c!133353 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!973994 () Bool)

(assert (=> start!124558 (=> (not res!973994) (not e!812671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124558 (= res!973994 (validMask!0 mask!2687))))

(assert (=> start!124558 e!812671))

(assert (=> start!124558 true))

(declare-fun array_inv!36319 (array!98006) Bool)

(assert (=> start!124558 (array_inv!36319 a!2862)))

(declare-fun b!1441682 () Bool)

(declare-fun res!973996 () Bool)

(assert (=> b!1441682 (=> (not res!973996) (not e!812671))))

(assert (=> b!1441682 (= res!973996 (validKeyInArray!0 (select (arr!47291 a!2862) i!1006)))))

(declare-fun b!1441683 () Bool)

(assert (=> b!1441683 (= e!812667 (not (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98006 (_ BitVec 32)) Bool)

(assert (=> b!1441683 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48582 0))(
  ( (Unit!48583) )
))
(declare-fun lt!633321 () Unit!48582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48582)

(assert (=> b!1441683 (= lt!633321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441684 () Bool)

(assert (=> b!1441684 (= e!812669 (= lt!633320 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633323 lt!633324 mask!2687)))))

(declare-fun b!1441685 () Bool)

(declare-fun res!973991 () Bool)

(assert (=> b!1441685 (=> (not res!973991) (not e!812671))))

(declare-datatypes ((List!33792 0))(
  ( (Nil!33789) (Cons!33788 (h!35138 (_ BitVec 64)) (t!48486 List!33792)) )
))
(declare-fun arrayNoDuplicates!0 (array!98006 (_ BitVec 32) List!33792) Bool)

(assert (=> b!1441685 (= res!973991 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33789))))

(declare-fun b!1441686 () Bool)

(declare-fun res!973995 () Bool)

(assert (=> b!1441686 (=> (not res!973995) (not e!812671))))

(assert (=> b!1441686 (= res!973995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124558 res!973994) b!1441674))

(assert (= (and b!1441674 res!973993) b!1441682))

(assert (= (and b!1441682 res!973996) b!1441672))

(assert (= (and b!1441672 res!973987) b!1441686))

(assert (= (and b!1441686 res!973995) b!1441685))

(assert (= (and b!1441685 res!973991) b!1441678))

(assert (= (and b!1441678 res!973997) b!1441673))

(assert (= (and b!1441673 res!973989) b!1441679))

(assert (= (and b!1441679 res!973992) b!1441676))

(assert (= (and b!1441676 res!973998) b!1441677))

(assert (= (and b!1441677 res!973988) b!1441681))

(assert (= (and b!1441681 c!133353) b!1441684))

(assert (= (and b!1441681 (not c!133353)) b!1441680))

(assert (= (and b!1441681 res!973999) b!1441675))

(assert (= (and b!1441675 res!973990) b!1441683))

(declare-fun m!1330879 () Bool)

(assert (=> b!1441676 m!1330879))

(assert (=> b!1441676 m!1330879))

(declare-fun m!1330881 () Bool)

(assert (=> b!1441676 m!1330881))

(assert (=> b!1441679 m!1330879))

(assert (=> b!1441679 m!1330879))

(declare-fun m!1330883 () Bool)

(assert (=> b!1441679 m!1330883))

(assert (=> b!1441679 m!1330883))

(assert (=> b!1441679 m!1330879))

(declare-fun m!1330885 () Bool)

(assert (=> b!1441679 m!1330885))

(declare-fun m!1330887 () Bool)

(assert (=> b!1441680 m!1330887))

(declare-fun m!1330889 () Bool)

(assert (=> b!1441680 m!1330889))

(declare-fun m!1330891 () Bool)

(assert (=> b!1441682 m!1330891))

(assert (=> b!1441682 m!1330891))

(declare-fun m!1330893 () Bool)

(assert (=> b!1441682 m!1330893))

(declare-fun m!1330895 () Bool)

(assert (=> b!1441673 m!1330895))

(declare-fun m!1330897 () Bool)

(assert (=> b!1441673 m!1330897))

(assert (=> b!1441672 m!1330879))

(assert (=> b!1441672 m!1330879))

(declare-fun m!1330899 () Bool)

(assert (=> b!1441672 m!1330899))

(declare-fun m!1330901 () Bool)

(assert (=> start!124558 m!1330901))

(declare-fun m!1330903 () Bool)

(assert (=> start!124558 m!1330903))

(declare-fun m!1330905 () Bool)

(assert (=> b!1441677 m!1330905))

(assert (=> b!1441677 m!1330905))

(declare-fun m!1330907 () Bool)

(assert (=> b!1441677 m!1330907))

(assert (=> b!1441677 m!1330895))

(declare-fun m!1330909 () Bool)

(assert (=> b!1441677 m!1330909))

(declare-fun m!1330911 () Bool)

(assert (=> b!1441685 m!1330911))

(declare-fun m!1330913 () Bool)

(assert (=> b!1441686 m!1330913))

(declare-fun m!1330915 () Bool)

(assert (=> b!1441683 m!1330915))

(declare-fun m!1330917 () Bool)

(assert (=> b!1441683 m!1330917))

(declare-fun m!1330919 () Bool)

(assert (=> b!1441684 m!1330919))

(push 1)

