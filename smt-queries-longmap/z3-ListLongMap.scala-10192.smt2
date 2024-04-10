; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120080 () Bool)

(assert start!120080)

(declare-fun b!1398040 () Bool)

(declare-fun res!936957 () Bool)

(declare-fun e!791467 () Bool)

(assert (=> b!1398040 (=> (not res!936957) (not e!791467))))

(declare-datatypes ((array!95609 0))(
  ( (array!95610 (arr!46158 (Array (_ BitVec 32) (_ BitVec 64))) (size!46708 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95609)

(declare-datatypes ((List!32677 0))(
  ( (Nil!32674) (Cons!32673 (h!33915 (_ BitVec 64)) (t!47371 List!32677)) )
))
(declare-fun arrayNoDuplicates!0 (array!95609 (_ BitVec 32) List!32677) Bool)

(assert (=> b!1398040 (= res!936957 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32674))))

(declare-fun b!1398041 () Bool)

(declare-fun res!936961 () Bool)

(assert (=> b!1398041 (=> (not res!936961) (not e!791467))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398041 (= res!936961 (validKeyInArray!0 (select (arr!46158 a!2901) j!112)))))

(declare-fun res!936956 () Bool)

(assert (=> start!120080 (=> (not res!936956) (not e!791467))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120080 (= res!936956 (validMask!0 mask!2840))))

(assert (=> start!120080 e!791467))

(assert (=> start!120080 true))

(declare-fun array_inv!35186 (array!95609) Bool)

(assert (=> start!120080 (array_inv!35186 a!2901)))

(declare-fun b!1398042 () Bool)

(declare-fun res!936954 () Bool)

(assert (=> b!1398042 (=> (not res!936954) (not e!791467))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398042 (= res!936954 (and (= (size!46708 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46708 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46708 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398043 () Bool)

(declare-fun e!791465 () Bool)

(declare-fun e!791468 () Bool)

(assert (=> b!1398043 (= e!791465 e!791468)))

(declare-fun res!936960 () Bool)

(assert (=> b!1398043 (=> res!936960 e!791468)))

(declare-datatypes ((SeekEntryResult!10475 0))(
  ( (MissingZero!10475 (index!44271 (_ BitVec 32))) (Found!10475 (index!44272 (_ BitVec 32))) (Intermediate!10475 (undefined!11287 Bool) (index!44273 (_ BitVec 32)) (x!125921 (_ BitVec 32))) (Undefined!10475) (MissingVacant!10475 (index!44274 (_ BitVec 32))) )
))
(declare-fun lt!614668 () SeekEntryResult!10475)

(declare-fun lt!614669 () SeekEntryResult!10475)

(get-info :version)

(assert (=> b!1398043 (= res!936960 (or (= lt!614668 lt!614669) (not ((_ is Intermediate!10475) lt!614669))))))

(declare-fun lt!614670 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95609 (_ BitVec 32)) SeekEntryResult!10475)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398043 (= lt!614669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614670 mask!2840) lt!614670 (array!95610 (store (arr!46158 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)) mask!2840))))

(assert (=> b!1398043 (= lt!614670 (select (store (arr!46158 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398044 () Bool)

(assert (=> b!1398044 (= e!791468 true)))

(assert (=> b!1398044 (and (not (undefined!11287 lt!614669)) (= (index!44273 lt!614669) i!1037) (bvslt (x!125921 lt!614669) (x!125921 lt!614668)) (= (select (store (arr!46158 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44273 lt!614669)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46954 0))(
  ( (Unit!46955) )
))
(declare-fun lt!614666 () Unit!46954)

(declare-fun lt!614667 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46954)

(assert (=> b!1398044 (= lt!614666 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614667 (x!125921 lt!614668) (index!44273 lt!614668) (x!125921 lt!614669) (index!44273 lt!614669) (undefined!11287 lt!614669) mask!2840))))

(declare-fun b!1398045 () Bool)

(declare-fun e!791464 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95609 (_ BitVec 32)) SeekEntryResult!10475)

(assert (=> b!1398045 (= e!791464 (= (seekEntryOrOpen!0 (select (arr!46158 a!2901) j!112) a!2901 mask!2840) (Found!10475 j!112)))))

(declare-fun b!1398046 () Bool)

(declare-fun res!936959 () Bool)

(assert (=> b!1398046 (=> (not res!936959) (not e!791467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95609 (_ BitVec 32)) Bool)

(assert (=> b!1398046 (= res!936959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398047 () Bool)

(declare-fun res!936953 () Bool)

(assert (=> b!1398047 (=> (not res!936953) (not e!791467))))

(assert (=> b!1398047 (= res!936953 (validKeyInArray!0 (select (arr!46158 a!2901) i!1037)))))

(declare-fun b!1398048 () Bool)

(assert (=> b!1398048 (= e!791467 (not e!791465))))

(declare-fun res!936958 () Bool)

(assert (=> b!1398048 (=> res!936958 e!791465)))

(assert (=> b!1398048 (= res!936958 (or (not ((_ is Intermediate!10475) lt!614668)) (undefined!11287 lt!614668)))))

(assert (=> b!1398048 e!791464))

(declare-fun res!936955 () Bool)

(assert (=> b!1398048 (=> (not res!936955) (not e!791464))))

(assert (=> b!1398048 (= res!936955 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614665 () Unit!46954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46954)

(assert (=> b!1398048 (= lt!614665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398048 (= lt!614668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614667 (select (arr!46158 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398048 (= lt!614667 (toIndex!0 (select (arr!46158 a!2901) j!112) mask!2840))))

(assert (= (and start!120080 res!936956) b!1398042))

(assert (= (and b!1398042 res!936954) b!1398047))

(assert (= (and b!1398047 res!936953) b!1398041))

(assert (= (and b!1398041 res!936961) b!1398046))

(assert (= (and b!1398046 res!936959) b!1398040))

(assert (= (and b!1398040 res!936957) b!1398048))

(assert (= (and b!1398048 res!936955) b!1398045))

(assert (= (and b!1398048 (not res!936958)) b!1398043))

(assert (= (and b!1398043 (not res!936960)) b!1398044))

(declare-fun m!1285013 () Bool)

(assert (=> b!1398045 m!1285013))

(assert (=> b!1398045 m!1285013))

(declare-fun m!1285015 () Bool)

(assert (=> b!1398045 m!1285015))

(declare-fun m!1285017 () Bool)

(assert (=> b!1398043 m!1285017))

(declare-fun m!1285019 () Bool)

(assert (=> b!1398043 m!1285019))

(assert (=> b!1398043 m!1285017))

(declare-fun m!1285021 () Bool)

(assert (=> b!1398043 m!1285021))

(declare-fun m!1285023 () Bool)

(assert (=> b!1398043 m!1285023))

(assert (=> b!1398048 m!1285013))

(declare-fun m!1285025 () Bool)

(assert (=> b!1398048 m!1285025))

(assert (=> b!1398048 m!1285013))

(declare-fun m!1285027 () Bool)

(assert (=> b!1398048 m!1285027))

(assert (=> b!1398048 m!1285013))

(declare-fun m!1285029 () Bool)

(assert (=> b!1398048 m!1285029))

(declare-fun m!1285031 () Bool)

(assert (=> b!1398048 m!1285031))

(declare-fun m!1285033 () Bool)

(assert (=> b!1398046 m!1285033))

(declare-fun m!1285035 () Bool)

(assert (=> start!120080 m!1285035))

(declare-fun m!1285037 () Bool)

(assert (=> start!120080 m!1285037))

(declare-fun m!1285039 () Bool)

(assert (=> b!1398047 m!1285039))

(assert (=> b!1398047 m!1285039))

(declare-fun m!1285041 () Bool)

(assert (=> b!1398047 m!1285041))

(assert (=> b!1398044 m!1285019))

(declare-fun m!1285043 () Bool)

(assert (=> b!1398044 m!1285043))

(declare-fun m!1285045 () Bool)

(assert (=> b!1398044 m!1285045))

(declare-fun m!1285047 () Bool)

(assert (=> b!1398040 m!1285047))

(assert (=> b!1398041 m!1285013))

(assert (=> b!1398041 m!1285013))

(declare-fun m!1285049 () Bool)

(assert (=> b!1398041 m!1285049))

(check-sat (not b!1398047) (not b!1398048) (not b!1398045) (not b!1398046) (not b!1398043) (not b!1398040) (not b!1398044) (not b!1398041) (not start!120080))
(check-sat)
