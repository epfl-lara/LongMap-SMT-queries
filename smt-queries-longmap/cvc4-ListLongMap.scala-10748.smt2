; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125690 () Bool)

(assert start!125690)

(declare-fun b!1470924 () Bool)

(declare-fun e!825653 () Bool)

(declare-fun e!825656 () Bool)

(assert (=> b!1470924 (= e!825653 e!825656)))

(declare-fun res!999001 () Bool)

(assert (=> b!1470924 (=> (not res!999001) (not e!825656))))

(declare-datatypes ((array!99081 0))(
  ( (array!99082 (arr!47827 (Array (_ BitVec 32) (_ BitVec 64))) (size!48377 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99081)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12067 0))(
  ( (MissingZero!12067 (index!50660 (_ BitVec 32))) (Found!12067 (index!50661 (_ BitVec 32))) (Intermediate!12067 (undefined!12879 Bool) (index!50662 (_ BitVec 32)) (x!132237 (_ BitVec 32))) (Undefined!12067) (MissingVacant!12067 (index!50663 (_ BitVec 32))) )
))
(declare-fun lt!643079 () SeekEntryResult!12067)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99081 (_ BitVec 32)) SeekEntryResult!12067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470924 (= res!999001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47827 a!2862) j!93) mask!2687) (select (arr!47827 a!2862) j!93) a!2862 mask!2687) lt!643079))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470924 (= lt!643079 (Intermediate!12067 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1470925 () Bool)

(declare-fun e!825659 () Bool)

(declare-fun lt!643078 () array!99081)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643076 () SeekEntryResult!12067)

(declare-fun lt!643077 () (_ BitVec 64))

(assert (=> b!1470925 (= e!825659 (= lt!643076 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643077 lt!643078 mask!2687)))))

(declare-fun b!1470926 () Bool)

(declare-fun e!825655 () Bool)

(assert (=> b!1470926 (= e!825655 (not true))))

(declare-fun e!825657 () Bool)

(assert (=> b!1470926 e!825657))

(declare-fun res!998996 () Bool)

(assert (=> b!1470926 (=> (not res!998996) (not e!825657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99081 (_ BitVec 32)) Bool)

(assert (=> b!1470926 (= res!998996 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49474 0))(
  ( (Unit!49475) )
))
(declare-fun lt!643080 () Unit!49474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49474)

(assert (=> b!1470926 (= lt!643080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470928 () Bool)

(declare-fun res!999006 () Bool)

(assert (=> b!1470928 (=> (not res!999006) (not e!825655))))

(assert (=> b!1470928 (= res!999006 e!825659)))

(declare-fun c!135477 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470928 (= c!135477 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470929 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99081 (_ BitVec 32)) SeekEntryResult!12067)

(assert (=> b!1470929 (= e!825657 (= (seekEntryOrOpen!0 (select (arr!47827 a!2862) j!93) a!2862 mask!2687) (Found!12067 j!93)))))

(declare-fun b!1470930 () Bool)

(declare-fun res!999004 () Bool)

(declare-fun e!825658 () Bool)

(assert (=> b!1470930 (=> (not res!999004) (not e!825658))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470930 (= res!999004 (validKeyInArray!0 (select (arr!47827 a!2862) i!1006)))))

(declare-fun b!1470931 () Bool)

(declare-fun res!999005 () Bool)

(assert (=> b!1470931 (=> (not res!999005) (not e!825658))))

(assert (=> b!1470931 (= res!999005 (validKeyInArray!0 (select (arr!47827 a!2862) j!93)))))

(declare-fun b!1470932 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99081 (_ BitVec 32)) SeekEntryResult!12067)

(assert (=> b!1470932 (= e!825659 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643077 lt!643078 mask!2687) (seekEntryOrOpen!0 lt!643077 lt!643078 mask!2687)))))

(declare-fun b!1470933 () Bool)

(assert (=> b!1470933 (= e!825656 e!825655)))

(declare-fun res!999007 () Bool)

(assert (=> b!1470933 (=> (not res!999007) (not e!825655))))

(assert (=> b!1470933 (= res!999007 (= lt!643076 (Intermediate!12067 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470933 (= lt!643076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643077 mask!2687) lt!643077 lt!643078 mask!2687))))

(assert (=> b!1470933 (= lt!643077 (select (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470934 () Bool)

(declare-fun res!998995 () Bool)

(assert (=> b!1470934 (=> (not res!998995) (not e!825658))))

(assert (=> b!1470934 (= res!998995 (and (= (size!48377 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48377 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48377 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470935 () Bool)

(assert (=> b!1470935 (= e!825658 e!825653)))

(declare-fun res!998994 () Bool)

(assert (=> b!1470935 (=> (not res!998994) (not e!825653))))

(assert (=> b!1470935 (= res!998994 (= (select (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470935 (= lt!643078 (array!99082 (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48377 a!2862)))))

(declare-fun b!1470936 () Bool)

(declare-fun res!999003 () Bool)

(assert (=> b!1470936 (=> (not res!999003) (not e!825658))))

(assert (=> b!1470936 (= res!999003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470937 () Bool)

(declare-fun res!998997 () Bool)

(assert (=> b!1470937 (=> (not res!998997) (not e!825655))))

(assert (=> b!1470937 (= res!998997 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470938 () Bool)

(declare-fun res!998999 () Bool)

(assert (=> b!1470938 (=> (not res!998999) (not e!825656))))

(assert (=> b!1470938 (= res!998999 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47827 a!2862) j!93) a!2862 mask!2687) lt!643079))))

(declare-fun b!1470939 () Bool)

(declare-fun res!998998 () Bool)

(assert (=> b!1470939 (=> (not res!998998) (not e!825658))))

(assert (=> b!1470939 (= res!998998 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48377 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48377 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48377 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!999002 () Bool)

(assert (=> start!125690 (=> (not res!999002) (not e!825658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125690 (= res!999002 (validMask!0 mask!2687))))

(assert (=> start!125690 e!825658))

(assert (=> start!125690 true))

(declare-fun array_inv!36855 (array!99081) Bool)

(assert (=> start!125690 (array_inv!36855 a!2862)))

(declare-fun b!1470927 () Bool)

(declare-fun res!999000 () Bool)

(assert (=> b!1470927 (=> (not res!999000) (not e!825658))))

(declare-datatypes ((List!34328 0))(
  ( (Nil!34325) (Cons!34324 (h!35677 (_ BitVec 64)) (t!49022 List!34328)) )
))
(declare-fun arrayNoDuplicates!0 (array!99081 (_ BitVec 32) List!34328) Bool)

(assert (=> b!1470927 (= res!999000 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34325))))

(assert (= (and start!125690 res!999002) b!1470934))

(assert (= (and b!1470934 res!998995) b!1470930))

(assert (= (and b!1470930 res!999004) b!1470931))

(assert (= (and b!1470931 res!999005) b!1470936))

(assert (= (and b!1470936 res!999003) b!1470927))

(assert (= (and b!1470927 res!999000) b!1470939))

(assert (= (and b!1470939 res!998998) b!1470935))

(assert (= (and b!1470935 res!998994) b!1470924))

(assert (= (and b!1470924 res!999001) b!1470938))

(assert (= (and b!1470938 res!998999) b!1470933))

(assert (= (and b!1470933 res!999007) b!1470928))

(assert (= (and b!1470928 c!135477) b!1470925))

(assert (= (and b!1470928 (not c!135477)) b!1470932))

(assert (= (and b!1470928 res!999006) b!1470937))

(assert (= (and b!1470937 res!998997) b!1470926))

(assert (= (and b!1470926 res!998996) b!1470929))

(declare-fun m!1357883 () Bool)

(assert (=> b!1470924 m!1357883))

(assert (=> b!1470924 m!1357883))

(declare-fun m!1357885 () Bool)

(assert (=> b!1470924 m!1357885))

(assert (=> b!1470924 m!1357885))

(assert (=> b!1470924 m!1357883))

(declare-fun m!1357887 () Bool)

(assert (=> b!1470924 m!1357887))

(declare-fun m!1357889 () Bool)

(assert (=> b!1470930 m!1357889))

(assert (=> b!1470930 m!1357889))

(declare-fun m!1357891 () Bool)

(assert (=> b!1470930 m!1357891))

(declare-fun m!1357893 () Bool)

(assert (=> b!1470935 m!1357893))

(declare-fun m!1357895 () Bool)

(assert (=> b!1470935 m!1357895))

(declare-fun m!1357897 () Bool)

(assert (=> start!125690 m!1357897))

(declare-fun m!1357899 () Bool)

(assert (=> start!125690 m!1357899))

(declare-fun m!1357901 () Bool)

(assert (=> b!1470927 m!1357901))

(declare-fun m!1357903 () Bool)

(assert (=> b!1470925 m!1357903))

(declare-fun m!1357905 () Bool)

(assert (=> b!1470936 m!1357905))

(assert (=> b!1470931 m!1357883))

(assert (=> b!1470931 m!1357883))

(declare-fun m!1357907 () Bool)

(assert (=> b!1470931 m!1357907))

(declare-fun m!1357909 () Bool)

(assert (=> b!1470933 m!1357909))

(assert (=> b!1470933 m!1357909))

(declare-fun m!1357911 () Bool)

(assert (=> b!1470933 m!1357911))

(assert (=> b!1470933 m!1357893))

(declare-fun m!1357913 () Bool)

(assert (=> b!1470933 m!1357913))

(declare-fun m!1357915 () Bool)

(assert (=> b!1470926 m!1357915))

(declare-fun m!1357917 () Bool)

(assert (=> b!1470926 m!1357917))

(assert (=> b!1470929 m!1357883))

(assert (=> b!1470929 m!1357883))

(declare-fun m!1357919 () Bool)

(assert (=> b!1470929 m!1357919))

(assert (=> b!1470938 m!1357883))

(assert (=> b!1470938 m!1357883))

(declare-fun m!1357921 () Bool)

(assert (=> b!1470938 m!1357921))

(declare-fun m!1357923 () Bool)

(assert (=> b!1470932 m!1357923))

(declare-fun m!1357925 () Bool)

(assert (=> b!1470932 m!1357925))

(push 1)

(assert (not b!1470936))

(assert (not b!1470932))

