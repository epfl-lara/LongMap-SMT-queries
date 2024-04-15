; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121958 () Bool)

(assert start!121958)

(declare-fun b!1415313 () Bool)

(declare-fun res!951415 () Bool)

(declare-fun e!801031 () Bool)

(assert (=> b!1415313 (=> (not res!951415) (not e!801031))))

(declare-datatypes ((array!96597 0))(
  ( (array!96598 (arr!46630 (Array (_ BitVec 32) (_ BitVec 64))) (size!47182 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96597)

(declare-datatypes ((List!33227 0))(
  ( (Nil!33224) (Cons!33223 (h!34510 (_ BitVec 64)) (t!47913 List!33227)) )
))
(declare-fun arrayNoDuplicates!0 (array!96597 (_ BitVec 32) List!33227) Bool)

(assert (=> b!1415313 (= res!951415 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33224))))

(declare-fun b!1415314 () Bool)

(declare-fun res!951412 () Bool)

(assert (=> b!1415314 (=> (not res!951412) (not e!801031))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415314 (= res!951412 (and (= (size!47182 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47182 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47182 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415315 () Bool)

(declare-fun e!801032 () Bool)

(declare-datatypes ((SeekEntryResult!10967 0))(
  ( (MissingZero!10967 (index!46260 (_ BitVec 32))) (Found!10967 (index!46261 (_ BitVec 32))) (Intermediate!10967 (undefined!11779 Bool) (index!46262 (_ BitVec 32)) (x!127867 (_ BitVec 32))) (Undefined!10967) (MissingVacant!10967 (index!46263 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96597 (_ BitVec 32)) SeekEntryResult!10967)

(assert (=> b!1415315 (= e!801032 (= (seekEntryOrOpen!0 (select (arr!46630 a!2901) j!112) a!2901 mask!2840) (Found!10967 j!112)))))

(declare-fun lt!623923 () array!96597)

(declare-fun e!801030 () Bool)

(declare-fun lt!623922 () (_ BitVec 64))

(declare-fun b!1415316 () Bool)

(declare-fun lt!623925 () SeekEntryResult!10967)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96597 (_ BitVec 32)) SeekEntryResult!10967)

(assert (=> b!1415316 (= e!801030 (= (seekEntryOrOpen!0 lt!623922 lt!623923 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127867 lt!623925) (index!46262 lt!623925) (index!46262 lt!623925) (select (arr!46630 a!2901) j!112) lt!623923 mask!2840)))))

(declare-fun res!951410 () Bool)

(assert (=> start!121958 (=> (not res!951410) (not e!801031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121958 (= res!951410 (validMask!0 mask!2840))))

(assert (=> start!121958 e!801031))

(assert (=> start!121958 true))

(declare-fun array_inv!35863 (array!96597) Bool)

(assert (=> start!121958 (array_inv!35863 a!2901)))

(declare-fun b!1415317 () Bool)

(declare-fun res!951414 () Bool)

(assert (=> b!1415317 (=> (not res!951414) (not e!801031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415317 (= res!951414 (validKeyInArray!0 (select (arr!46630 a!2901) i!1037)))))

(declare-fun b!1415318 () Bool)

(declare-fun res!951411 () Bool)

(assert (=> b!1415318 (=> (not res!951411) (not e!801031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96597 (_ BitVec 32)) Bool)

(assert (=> b!1415318 (= res!951411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415319 () Bool)

(declare-fun e!801035 () Bool)

(declare-fun e!801033 () Bool)

(assert (=> b!1415319 (= e!801035 e!801033)))

(declare-fun res!951413 () Bool)

(assert (=> b!1415319 (=> res!951413 e!801033)))

(declare-fun lt!623921 () SeekEntryResult!10967)

(get-info :version)

(assert (=> b!1415319 (= res!951413 (or (= lt!623921 lt!623925) (not ((_ is Intermediate!10967) lt!623925))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96597 (_ BitVec 32)) SeekEntryResult!10967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415319 (= lt!623925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623922 mask!2840) lt!623922 lt!623923 mask!2840))))

(assert (=> b!1415319 (= lt!623922 (select (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415319 (= lt!623923 (array!96598 (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47182 a!2901)))))

(declare-fun b!1415320 () Bool)

(declare-fun res!951409 () Bool)

(assert (=> b!1415320 (=> (not res!951409) (not e!801031))))

(assert (=> b!1415320 (= res!951409 (validKeyInArray!0 (select (arr!46630 a!2901) j!112)))))

(declare-fun b!1415321 () Bool)

(assert (=> b!1415321 (= e!801031 (not e!801035))))

(declare-fun res!951407 () Bool)

(assert (=> b!1415321 (=> res!951407 e!801035)))

(assert (=> b!1415321 (= res!951407 (or (not ((_ is Intermediate!10967) lt!623921)) (undefined!11779 lt!623921)))))

(assert (=> b!1415321 e!801032))

(declare-fun res!951406 () Bool)

(assert (=> b!1415321 (=> (not res!951406) (not e!801032))))

(assert (=> b!1415321 (= res!951406 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47751 0))(
  ( (Unit!47752) )
))
(declare-fun lt!623926 () Unit!47751)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47751)

(assert (=> b!1415321 (= lt!623926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623924 () (_ BitVec 32))

(assert (=> b!1415321 (= lt!623921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623924 (select (arr!46630 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415321 (= lt!623924 (toIndex!0 (select (arr!46630 a!2901) j!112) mask!2840))))

(declare-fun b!1415322 () Bool)

(assert (=> b!1415322 (= e!801033 (or (bvslt (x!127867 lt!623921) #b00000000000000000000000000000000) (bvsgt (x!127867 lt!623921) #b01111111111111111111111111111110) (bvslt (x!127867 lt!623925) #b00000000000000000000000000000000) (bvsgt (x!127867 lt!623925) #b01111111111111111111111111111110) (bvslt lt!623924 #b00000000000000000000000000000000) (bvsge lt!623924 (size!47182 a!2901)) (bvslt (index!46262 lt!623921) #b00000000000000000000000000000000) (bvsge (index!46262 lt!623921) (size!47182 a!2901)) (bvslt (index!46262 lt!623925) #b00000000000000000000000000000000) (bvsge (index!46262 lt!623925) (size!47182 a!2901)) (= lt!623921 (Intermediate!10967 false (index!46262 lt!623921) (x!127867 lt!623921)))))))

(assert (=> b!1415322 e!801030))

(declare-fun res!951408 () Bool)

(assert (=> b!1415322 (=> (not res!951408) (not e!801030))))

(assert (=> b!1415322 (= res!951408 (and (not (undefined!11779 lt!623925)) (= (index!46262 lt!623925) i!1037) (bvslt (x!127867 lt!623925) (x!127867 lt!623921)) (= (select (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46262 lt!623925)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623927 () Unit!47751)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47751)

(assert (=> b!1415322 (= lt!623927 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623924 (x!127867 lt!623921) (index!46262 lt!623921) (x!127867 lt!623925) (index!46262 lt!623925) (undefined!11779 lt!623925) mask!2840))))

(assert (= (and start!121958 res!951410) b!1415314))

(assert (= (and b!1415314 res!951412) b!1415317))

(assert (= (and b!1415317 res!951414) b!1415320))

(assert (= (and b!1415320 res!951409) b!1415318))

(assert (= (and b!1415318 res!951411) b!1415313))

(assert (= (and b!1415313 res!951415) b!1415321))

(assert (= (and b!1415321 res!951406) b!1415315))

(assert (= (and b!1415321 (not res!951407)) b!1415319))

(assert (= (and b!1415319 (not res!951413)) b!1415322))

(assert (= (and b!1415322 res!951408) b!1415316))

(declare-fun m!1305121 () Bool)

(assert (=> b!1415313 m!1305121))

(declare-fun m!1305123 () Bool)

(assert (=> b!1415318 m!1305123))

(declare-fun m!1305125 () Bool)

(assert (=> b!1415322 m!1305125))

(declare-fun m!1305127 () Bool)

(assert (=> b!1415322 m!1305127))

(declare-fun m!1305129 () Bool)

(assert (=> b!1415322 m!1305129))

(declare-fun m!1305131 () Bool)

(assert (=> b!1415320 m!1305131))

(assert (=> b!1415320 m!1305131))

(declare-fun m!1305133 () Bool)

(assert (=> b!1415320 m!1305133))

(declare-fun m!1305135 () Bool)

(assert (=> b!1415316 m!1305135))

(assert (=> b!1415316 m!1305131))

(assert (=> b!1415316 m!1305131))

(declare-fun m!1305137 () Bool)

(assert (=> b!1415316 m!1305137))

(declare-fun m!1305139 () Bool)

(assert (=> b!1415319 m!1305139))

(assert (=> b!1415319 m!1305139))

(declare-fun m!1305141 () Bool)

(assert (=> b!1415319 m!1305141))

(assert (=> b!1415319 m!1305125))

(declare-fun m!1305143 () Bool)

(assert (=> b!1415319 m!1305143))

(declare-fun m!1305145 () Bool)

(assert (=> b!1415317 m!1305145))

(assert (=> b!1415317 m!1305145))

(declare-fun m!1305147 () Bool)

(assert (=> b!1415317 m!1305147))

(declare-fun m!1305149 () Bool)

(assert (=> start!121958 m!1305149))

(declare-fun m!1305151 () Bool)

(assert (=> start!121958 m!1305151))

(assert (=> b!1415315 m!1305131))

(assert (=> b!1415315 m!1305131))

(declare-fun m!1305153 () Bool)

(assert (=> b!1415315 m!1305153))

(assert (=> b!1415321 m!1305131))

(declare-fun m!1305155 () Bool)

(assert (=> b!1415321 m!1305155))

(assert (=> b!1415321 m!1305131))

(declare-fun m!1305157 () Bool)

(assert (=> b!1415321 m!1305157))

(assert (=> b!1415321 m!1305131))

(declare-fun m!1305159 () Bool)

(assert (=> b!1415321 m!1305159))

(declare-fun m!1305161 () Bool)

(assert (=> b!1415321 m!1305161))

(check-sat (not b!1415315) (not b!1415322) (not b!1415319) (not b!1415317) (not start!121958) (not b!1415320) (not b!1415318) (not b!1415313) (not b!1415321) (not b!1415316))
(check-sat)
