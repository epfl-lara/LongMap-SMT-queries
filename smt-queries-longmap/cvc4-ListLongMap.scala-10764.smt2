; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125906 () Bool)

(assert start!125906)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1474159 () Bool)

(declare-datatypes ((array!99183 0))(
  ( (array!99184 (arr!47875 (Array (_ BitVec 32) (_ BitVec 64))) (size!48425 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99183)

(declare-fun e!827160 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1474159 (= e!827160 (or (= (select (arr!47875 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47875 a!2862) intermediateBeforeIndex!19) (select (arr!47875 a!2862) j!93))))))

(declare-fun b!1474160 () Bool)

(declare-fun e!827158 () Bool)

(declare-fun e!827156 () Bool)

(assert (=> b!1474160 (= e!827158 e!827156)))

(declare-fun res!1001410 () Bool)

(assert (=> b!1474160 (=> (not res!1001410) (not e!827156))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474160 (= res!1001410 (= (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644168 () array!99183)

(assert (=> b!1474160 (= lt!644168 (array!99184 (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48425 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1474161 () Bool)

(declare-fun lt!644171 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!827159 () Bool)

(declare-datatypes ((SeekEntryResult!12115 0))(
  ( (MissingZero!12115 (index!50852 (_ BitVec 32))) (Found!12115 (index!50853 (_ BitVec 32))) (Intermediate!12115 (undefined!12927 Bool) (index!50854 (_ BitVec 32)) (x!132431 (_ BitVec 32))) (Undefined!12115) (MissingVacant!12115 (index!50855 (_ BitVec 32))) )
))
(declare-fun lt!644170 () SeekEntryResult!12115)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99183 (_ BitVec 32)) SeekEntryResult!12115)

(assert (=> b!1474161 (= e!827159 (= lt!644170 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644171 lt!644168 mask!2687)))))

(declare-fun res!1001401 () Bool)

(assert (=> start!125906 (=> (not res!1001401) (not e!827158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125906 (= res!1001401 (validMask!0 mask!2687))))

(assert (=> start!125906 e!827158))

(assert (=> start!125906 true))

(declare-fun array_inv!36903 (array!99183) Bool)

(assert (=> start!125906 (array_inv!36903 a!2862)))

(declare-fun b!1474162 () Bool)

(declare-fun e!827155 () Bool)

(declare-fun e!827157 () Bool)

(assert (=> b!1474162 (= e!827155 (not e!827157))))

(declare-fun res!1001399 () Bool)

(assert (=> b!1474162 (=> res!1001399 e!827157)))

(assert (=> b!1474162 (= res!1001399 (or (not (= (select (arr!47875 a!2862) index!646) (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47875 a!2862) index!646) (select (arr!47875 a!2862) j!93)))))))

(assert (=> b!1474162 e!827160))

(declare-fun res!1001402 () Bool)

(assert (=> b!1474162 (=> (not res!1001402) (not e!827160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99183 (_ BitVec 32)) Bool)

(assert (=> b!1474162 (= res!1001402 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49570 0))(
  ( (Unit!49571) )
))
(declare-fun lt!644167 () Unit!49570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49570)

(assert (=> b!1474162 (= lt!644167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474163 () Bool)

(declare-fun res!1001404 () Bool)

(assert (=> b!1474163 (=> (not res!1001404) (not e!827155))))

(assert (=> b!1474163 (= res!1001404 e!827159)))

(declare-fun c!135897 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474163 (= c!135897 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474164 () Bool)

(declare-fun res!1001408 () Bool)

(declare-fun e!827161 () Bool)

(assert (=> b!1474164 (=> (not res!1001408) (not e!827161))))

(declare-fun lt!644169 () SeekEntryResult!12115)

(assert (=> b!1474164 (= res!1001408 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47875 a!2862) j!93) a!2862 mask!2687) lt!644169))))

(declare-fun b!1474165 () Bool)

(declare-fun res!1001403 () Bool)

(assert (=> b!1474165 (=> (not res!1001403) (not e!827158))))

(declare-datatypes ((List!34376 0))(
  ( (Nil!34373) (Cons!34372 (h!35731 (_ BitVec 64)) (t!49070 List!34376)) )
))
(declare-fun arrayNoDuplicates!0 (array!99183 (_ BitVec 32) List!34376) Bool)

(assert (=> b!1474165 (= res!1001403 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34373))))

(declare-fun b!1474166 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99183 (_ BitVec 32)) SeekEntryResult!12115)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99183 (_ BitVec 32)) SeekEntryResult!12115)

(assert (=> b!1474166 (= e!827159 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644171 lt!644168 mask!2687) (seekEntryOrOpen!0 lt!644171 lt!644168 mask!2687)))))

(declare-fun b!1474167 () Bool)

(declare-fun res!1001398 () Bool)

(assert (=> b!1474167 (=> (not res!1001398) (not e!827158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474167 (= res!1001398 (validKeyInArray!0 (select (arr!47875 a!2862) i!1006)))))

(declare-fun b!1474168 () Bool)

(declare-fun res!1001405 () Bool)

(assert (=> b!1474168 (=> (not res!1001405) (not e!827158))))

(assert (=> b!1474168 (= res!1001405 (validKeyInArray!0 (select (arr!47875 a!2862) j!93)))))

(declare-fun b!1474169 () Bool)

(declare-fun res!1001407 () Bool)

(assert (=> b!1474169 (=> (not res!1001407) (not e!827158))))

(assert (=> b!1474169 (= res!1001407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474170 () Bool)

(assert (=> b!1474170 (= e!827157 true)))

(declare-fun lt!644172 () SeekEntryResult!12115)

(assert (=> b!1474170 (= lt!644172 (seekEntryOrOpen!0 lt!644171 lt!644168 mask!2687))))

(declare-fun b!1474171 () Bool)

(assert (=> b!1474171 (= e!827161 e!827155)))

(declare-fun res!1001396 () Bool)

(assert (=> b!1474171 (=> (not res!1001396) (not e!827155))))

(assert (=> b!1474171 (= res!1001396 (= lt!644170 (Intermediate!12115 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474171 (= lt!644170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644171 mask!2687) lt!644171 lt!644168 mask!2687))))

(assert (=> b!1474171 (= lt!644171 (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474172 () Bool)

(assert (=> b!1474172 (= e!827156 e!827161)))

(declare-fun res!1001397 () Bool)

(assert (=> b!1474172 (=> (not res!1001397) (not e!827161))))

(assert (=> b!1474172 (= res!1001397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47875 a!2862) j!93) mask!2687) (select (arr!47875 a!2862) j!93) a!2862 mask!2687) lt!644169))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474172 (= lt!644169 (Intermediate!12115 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474173 () Bool)

(declare-fun res!1001400 () Bool)

(assert (=> b!1474173 (=> (not res!1001400) (not e!827158))))

(assert (=> b!1474173 (= res!1001400 (and (= (size!48425 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48425 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48425 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474174 () Bool)

(declare-fun res!1001406 () Bool)

(assert (=> b!1474174 (=> (not res!1001406) (not e!827155))))

(assert (=> b!1474174 (= res!1001406 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474175 () Bool)

(declare-fun res!1001409 () Bool)

(assert (=> b!1474175 (=> (not res!1001409) (not e!827160))))

(assert (=> b!1474175 (= res!1001409 (= (seekEntryOrOpen!0 (select (arr!47875 a!2862) j!93) a!2862 mask!2687) (Found!12115 j!93)))))

(declare-fun b!1474176 () Bool)

(declare-fun res!1001395 () Bool)

(assert (=> b!1474176 (=> (not res!1001395) (not e!827158))))

(assert (=> b!1474176 (= res!1001395 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48425 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48425 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48425 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125906 res!1001401) b!1474173))

(assert (= (and b!1474173 res!1001400) b!1474167))

(assert (= (and b!1474167 res!1001398) b!1474168))

(assert (= (and b!1474168 res!1001405) b!1474169))

(assert (= (and b!1474169 res!1001407) b!1474165))

(assert (= (and b!1474165 res!1001403) b!1474176))

(assert (= (and b!1474176 res!1001395) b!1474160))

(assert (= (and b!1474160 res!1001410) b!1474172))

(assert (= (and b!1474172 res!1001397) b!1474164))

(assert (= (and b!1474164 res!1001408) b!1474171))

(assert (= (and b!1474171 res!1001396) b!1474163))

(assert (= (and b!1474163 c!135897) b!1474161))

(assert (= (and b!1474163 (not c!135897)) b!1474166))

(assert (= (and b!1474163 res!1001404) b!1474174))

(assert (= (and b!1474174 res!1001406) b!1474162))

(assert (= (and b!1474162 res!1001402) b!1474175))

(assert (= (and b!1474175 res!1001409) b!1474159))

(assert (= (and b!1474162 (not res!1001399)) b!1474170))

(declare-fun m!1360631 () Bool)

(assert (=> b!1474175 m!1360631))

(assert (=> b!1474175 m!1360631))

(declare-fun m!1360633 () Bool)

(assert (=> b!1474175 m!1360633))

(assert (=> b!1474168 m!1360631))

(assert (=> b!1474168 m!1360631))

(declare-fun m!1360635 () Bool)

(assert (=> b!1474168 m!1360635))

(declare-fun m!1360637 () Bool)

(assert (=> b!1474162 m!1360637))

(declare-fun m!1360639 () Bool)

(assert (=> b!1474162 m!1360639))

(declare-fun m!1360641 () Bool)

(assert (=> b!1474162 m!1360641))

(declare-fun m!1360643 () Bool)

(assert (=> b!1474162 m!1360643))

(declare-fun m!1360645 () Bool)

(assert (=> b!1474162 m!1360645))

(assert (=> b!1474162 m!1360631))

(declare-fun m!1360647 () Bool)

(assert (=> b!1474170 m!1360647))

(assert (=> b!1474172 m!1360631))

(assert (=> b!1474172 m!1360631))

(declare-fun m!1360649 () Bool)

(assert (=> b!1474172 m!1360649))

(assert (=> b!1474172 m!1360649))

(assert (=> b!1474172 m!1360631))

(declare-fun m!1360651 () Bool)

(assert (=> b!1474172 m!1360651))

(declare-fun m!1360653 () Bool)

(assert (=> b!1474165 m!1360653))

(assert (=> b!1474160 m!1360639))

(declare-fun m!1360655 () Bool)

(assert (=> b!1474160 m!1360655))

(declare-fun m!1360657 () Bool)

(assert (=> b!1474167 m!1360657))

(assert (=> b!1474167 m!1360657))

(declare-fun m!1360659 () Bool)

(assert (=> b!1474167 m!1360659))

(declare-fun m!1360661 () Bool)

(assert (=> start!125906 m!1360661))

(declare-fun m!1360663 () Bool)

(assert (=> start!125906 m!1360663))

(declare-fun m!1360665 () Bool)

(assert (=> b!1474169 m!1360665))

(declare-fun m!1360667 () Bool)

(assert (=> b!1474166 m!1360667))

(assert (=> b!1474166 m!1360647))

(assert (=> b!1474164 m!1360631))

(assert (=> b!1474164 m!1360631))

(declare-fun m!1360669 () Bool)

(assert (=> b!1474164 m!1360669))

(declare-fun m!1360671 () Bool)

(assert (=> b!1474161 m!1360671))

(declare-fun m!1360673 () Bool)

(assert (=> b!1474159 m!1360673))

(assert (=> b!1474159 m!1360631))

(declare-fun m!1360675 () Bool)

(assert (=> b!1474171 m!1360675))

(assert (=> b!1474171 m!1360675))

(declare-fun m!1360677 () Bool)

(assert (=> b!1474171 m!1360677))

(assert (=> b!1474171 m!1360639))

(declare-fun m!1360679 () Bool)

(assert (=> b!1474171 m!1360679))

(push 1)

