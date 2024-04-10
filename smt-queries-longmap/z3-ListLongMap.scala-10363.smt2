; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121994 () Bool)

(assert start!121994)

(declare-fun res!951944 () Bool)

(declare-fun e!801385 () Bool)

(assert (=> start!121994 (=> (not res!951944) (not e!801385))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121994 (= res!951944 (validMask!0 mask!2840))))

(assert (=> start!121994 e!801385))

(assert (=> start!121994 true))

(declare-datatypes ((array!96680 0))(
  ( (array!96681 (arr!46671 (Array (_ BitVec 32) (_ BitVec 64))) (size!47221 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96680)

(declare-fun array_inv!35699 (array!96680) Bool)

(assert (=> start!121994 (array_inv!35699 a!2901)))

(declare-fun b!1415897 () Bool)

(declare-fun res!951943 () Bool)

(assert (=> b!1415897 (=> (not res!951943) (not e!801385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96680 (_ BitVec 32)) Bool)

(assert (=> b!1415897 (= res!951943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415898 () Bool)

(declare-fun e!801386 () Bool)

(assert (=> b!1415898 (= e!801385 (not e!801386))))

(declare-fun res!951939 () Bool)

(assert (=> b!1415898 (=> res!951939 e!801386)))

(declare-datatypes ((SeekEntryResult!10982 0))(
  ( (MissingZero!10982 (index!46320 (_ BitVec 32))) (Found!10982 (index!46321 (_ BitVec 32))) (Intermediate!10982 (undefined!11794 Bool) (index!46322 (_ BitVec 32)) (x!127925 (_ BitVec 32))) (Undefined!10982) (MissingVacant!10982 (index!46323 (_ BitVec 32))) )
))
(declare-fun lt!624465 () SeekEntryResult!10982)

(get-info :version)

(assert (=> b!1415898 (= res!951939 (or (not ((_ is Intermediate!10982) lt!624465)) (undefined!11794 lt!624465)))))

(declare-fun e!801380 () Bool)

(assert (=> b!1415898 e!801380))

(declare-fun res!951947 () Bool)

(assert (=> b!1415898 (=> (not res!951947) (not e!801380))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415898 (= res!951947 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47938 0))(
  ( (Unit!47939) )
))
(declare-fun lt!624467 () Unit!47938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47938)

(assert (=> b!1415898 (= lt!624467 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624468 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96680 (_ BitVec 32)) SeekEntryResult!10982)

(assert (=> b!1415898 (= lt!624465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624468 (select (arr!46671 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415898 (= lt!624468 (toIndex!0 (select (arr!46671 a!2901) j!112) mask!2840))))

(declare-fun b!1415899 () Bool)

(declare-fun e!801383 () Bool)

(assert (=> b!1415899 (= e!801386 e!801383)))

(declare-fun res!951941 () Bool)

(assert (=> b!1415899 (=> res!951941 e!801383)))

(declare-fun lt!624461 () SeekEntryResult!10982)

(assert (=> b!1415899 (= res!951941 (or (= lt!624465 lt!624461) (not ((_ is Intermediate!10982) lt!624461))))))

(declare-fun lt!624464 () array!96680)

(declare-fun lt!624466 () (_ BitVec 64))

(assert (=> b!1415899 (= lt!624461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624466 mask!2840) lt!624466 lt!624464 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415899 (= lt!624466 (select (store (arr!46671 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415899 (= lt!624464 (array!96681 (store (arr!46671 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47221 a!2901)))))

(declare-fun b!1415900 () Bool)

(declare-fun res!951940 () Bool)

(assert (=> b!1415900 (=> (not res!951940) (not e!801385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415900 (= res!951940 (validKeyInArray!0 (select (arr!46671 a!2901) j!112)))))

(declare-fun b!1415901 () Bool)

(declare-fun res!951949 () Bool)

(assert (=> b!1415901 (=> (not res!951949) (not e!801385))))

(assert (=> b!1415901 (= res!951949 (validKeyInArray!0 (select (arr!46671 a!2901) i!1037)))))

(declare-fun b!1415902 () Bool)

(declare-fun res!951946 () Bool)

(assert (=> b!1415902 (=> (not res!951946) (not e!801385))))

(declare-datatypes ((List!33190 0))(
  ( (Nil!33187) (Cons!33186 (h!34473 (_ BitVec 64)) (t!47884 List!33190)) )
))
(declare-fun arrayNoDuplicates!0 (array!96680 (_ BitVec 32) List!33190) Bool)

(assert (=> b!1415902 (= res!951946 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33187))))

(declare-fun b!1415903 () Bool)

(declare-fun e!801384 () Bool)

(assert (=> b!1415903 (= e!801383 e!801384)))

(declare-fun res!951948 () Bool)

(assert (=> b!1415903 (=> res!951948 e!801384)))

(assert (=> b!1415903 (= res!951948 (or (bvslt (x!127925 lt!624465) #b00000000000000000000000000000000) (bvsgt (x!127925 lt!624465) #b01111111111111111111111111111110) (bvslt (x!127925 lt!624461) #b00000000000000000000000000000000) (bvsgt (x!127925 lt!624461) #b01111111111111111111111111111110) (bvslt lt!624468 #b00000000000000000000000000000000) (bvsge lt!624468 (size!47221 a!2901)) (bvslt (index!46322 lt!624465) #b00000000000000000000000000000000) (bvsge (index!46322 lt!624465) (size!47221 a!2901)) (bvslt (index!46322 lt!624461) #b00000000000000000000000000000000) (bvsge (index!46322 lt!624461) (size!47221 a!2901)) (not (= lt!624465 (Intermediate!10982 false (index!46322 lt!624465) (x!127925 lt!624465)))) (not (= lt!624461 (Intermediate!10982 false (index!46322 lt!624461) (x!127925 lt!624461))))))))

(declare-fun e!801382 () Bool)

(assert (=> b!1415903 e!801382))

(declare-fun res!951945 () Bool)

(assert (=> b!1415903 (=> (not res!951945) (not e!801382))))

(assert (=> b!1415903 (= res!951945 (and (not (undefined!11794 lt!624461)) (= (index!46322 lt!624461) i!1037) (bvslt (x!127925 lt!624461) (x!127925 lt!624465)) (= (select (store (arr!46671 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46322 lt!624461)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624462 () Unit!47938)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47938)

(assert (=> b!1415903 (= lt!624462 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624468 (x!127925 lt!624465) (index!46322 lt!624465) (x!127925 lt!624461) (index!46322 lt!624461) (undefined!11794 lt!624461) mask!2840))))

(declare-fun b!1415904 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96680 (_ BitVec 32)) SeekEntryResult!10982)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96680 (_ BitVec 32)) SeekEntryResult!10982)

(assert (=> b!1415904 (= e!801382 (= (seekEntryOrOpen!0 lt!624466 lt!624464 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127925 lt!624461) (index!46322 lt!624461) (index!46322 lt!624461) (select (arr!46671 a!2901) j!112) lt!624464 mask!2840)))))

(declare-fun b!1415905 () Bool)

(assert (=> b!1415905 (= e!801380 (= (seekEntryOrOpen!0 (select (arr!46671 a!2901) j!112) a!2901 mask!2840) (Found!10982 j!112)))))

(declare-fun b!1415906 () Bool)

(declare-fun res!951942 () Bool)

(assert (=> b!1415906 (=> (not res!951942) (not e!801385))))

(assert (=> b!1415906 (= res!951942 (and (= (size!47221 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47221 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47221 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415907 () Bool)

(assert (=> b!1415907 (= e!801384 true)))

(declare-fun lt!624463 () SeekEntryResult!10982)

(assert (=> b!1415907 (= lt!624463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624468 lt!624466 lt!624464 mask!2840))))

(assert (= (and start!121994 res!951944) b!1415906))

(assert (= (and b!1415906 res!951942) b!1415901))

(assert (= (and b!1415901 res!951949) b!1415900))

(assert (= (and b!1415900 res!951940) b!1415897))

(assert (= (and b!1415897 res!951943) b!1415902))

(assert (= (and b!1415902 res!951946) b!1415898))

(assert (= (and b!1415898 res!951947) b!1415905))

(assert (= (and b!1415898 (not res!951939)) b!1415899))

(assert (= (and b!1415899 (not res!951941)) b!1415903))

(assert (= (and b!1415903 res!951945) b!1415904))

(assert (= (and b!1415903 (not res!951948)) b!1415907))

(declare-fun m!1306343 () Bool)

(assert (=> b!1415902 m!1306343))

(declare-fun m!1306345 () Bool)

(assert (=> b!1415900 m!1306345))

(assert (=> b!1415900 m!1306345))

(declare-fun m!1306347 () Bool)

(assert (=> b!1415900 m!1306347))

(declare-fun m!1306349 () Bool)

(assert (=> b!1415901 m!1306349))

(assert (=> b!1415901 m!1306349))

(declare-fun m!1306351 () Bool)

(assert (=> b!1415901 m!1306351))

(declare-fun m!1306353 () Bool)

(assert (=> b!1415903 m!1306353))

(declare-fun m!1306355 () Bool)

(assert (=> b!1415903 m!1306355))

(declare-fun m!1306357 () Bool)

(assert (=> b!1415903 m!1306357))

(declare-fun m!1306359 () Bool)

(assert (=> start!121994 m!1306359))

(declare-fun m!1306361 () Bool)

(assert (=> start!121994 m!1306361))

(declare-fun m!1306363 () Bool)

(assert (=> b!1415907 m!1306363))

(declare-fun m!1306365 () Bool)

(assert (=> b!1415904 m!1306365))

(assert (=> b!1415904 m!1306345))

(assert (=> b!1415904 m!1306345))

(declare-fun m!1306367 () Bool)

(assert (=> b!1415904 m!1306367))

(assert (=> b!1415898 m!1306345))

(declare-fun m!1306369 () Bool)

(assert (=> b!1415898 m!1306369))

(assert (=> b!1415898 m!1306345))

(assert (=> b!1415898 m!1306345))

(declare-fun m!1306371 () Bool)

(assert (=> b!1415898 m!1306371))

(declare-fun m!1306373 () Bool)

(assert (=> b!1415898 m!1306373))

(declare-fun m!1306375 () Bool)

(assert (=> b!1415898 m!1306375))

(assert (=> b!1415905 m!1306345))

(assert (=> b!1415905 m!1306345))

(declare-fun m!1306377 () Bool)

(assert (=> b!1415905 m!1306377))

(declare-fun m!1306379 () Bool)

(assert (=> b!1415897 m!1306379))

(declare-fun m!1306381 () Bool)

(assert (=> b!1415899 m!1306381))

(assert (=> b!1415899 m!1306381))

(declare-fun m!1306383 () Bool)

(assert (=> b!1415899 m!1306383))

(assert (=> b!1415899 m!1306353))

(declare-fun m!1306385 () Bool)

(assert (=> b!1415899 m!1306385))

(check-sat (not b!1415897) (not b!1415904) (not b!1415898) (not start!121994) (not b!1415899) (not b!1415903) (not b!1415905) (not b!1415901) (not b!1415902) (not b!1415907) (not b!1415900))
(check-sat)
