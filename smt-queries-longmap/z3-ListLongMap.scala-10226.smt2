; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120596 () Bool)

(assert start!120596)

(declare-fun b!1402880 () Bool)

(declare-fun res!940711 () Bool)

(declare-fun e!794464 () Bool)

(assert (=> b!1402880 (=> (not res!940711) (not e!794464))))

(declare-datatypes ((array!95927 0))(
  ( (array!95928 (arr!46312 (Array (_ BitVec 32) (_ BitVec 64))) (size!46863 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95927)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402880 (= res!940711 (validKeyInArray!0 (select (arr!46312 a!2901) i!1037)))))

(declare-fun b!1402881 () Bool)

(declare-fun e!794467 () Bool)

(assert (=> b!1402881 (= e!794464 (not e!794467))))

(declare-fun res!940707 () Bool)

(assert (=> b!1402881 (=> res!940707 e!794467)))

(declare-datatypes ((SeekEntryResult!10532 0))(
  ( (MissingZero!10532 (index!44505 (_ BitVec 32))) (Found!10532 (index!44506 (_ BitVec 32))) (Intermediate!10532 (undefined!11344 Bool) (index!44507 (_ BitVec 32)) (x!126290 (_ BitVec 32))) (Undefined!10532) (MissingVacant!10532 (index!44508 (_ BitVec 32))) )
))
(declare-fun lt!617548 () SeekEntryResult!10532)

(get-info :version)

(assert (=> b!1402881 (= res!940707 (or (not ((_ is Intermediate!10532) lt!617548)) (undefined!11344 lt!617548)))))

(declare-fun e!794466 () Bool)

(assert (=> b!1402881 e!794466))

(declare-fun res!940715 () Bool)

(assert (=> b!1402881 (=> (not res!940715) (not e!794466))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95927 (_ BitVec 32)) Bool)

(assert (=> b!1402881 (= res!940715 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47095 0))(
  ( (Unit!47096) )
))
(declare-fun lt!617551 () Unit!47095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47095)

(assert (=> b!1402881 (= lt!617551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617553 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95927 (_ BitVec 32)) SeekEntryResult!10532)

(assert (=> b!1402881 (= lt!617548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617553 (select (arr!46312 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402881 (= lt!617553 (toIndex!0 (select (arr!46312 a!2901) j!112) mask!2840))))

(declare-fun b!1402882 () Bool)

(declare-fun res!940716 () Bool)

(assert (=> b!1402882 (=> (not res!940716) (not e!794464))))

(assert (=> b!1402882 (= res!940716 (and (= (size!46863 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46863 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46863 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402883 () Bool)

(declare-fun res!940710 () Bool)

(assert (=> b!1402883 (=> (not res!940710) (not e!794464))))

(declare-datatypes ((List!32818 0))(
  ( (Nil!32815) (Cons!32814 (h!34070 (_ BitVec 64)) (t!47504 List!32818)) )
))
(declare-fun arrayNoDuplicates!0 (array!95927 (_ BitVec 32) List!32818) Bool)

(assert (=> b!1402883 (= res!940710 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32815))))

(declare-fun b!1402884 () Bool)

(declare-fun res!940712 () Bool)

(assert (=> b!1402884 (=> (not res!940712) (not e!794464))))

(assert (=> b!1402884 (= res!940712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!794463 () Bool)

(declare-fun lt!617549 () array!95927)

(declare-fun lt!617552 () SeekEntryResult!10532)

(declare-fun b!1402885 () Bool)

(declare-fun lt!617550 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95927 (_ BitVec 32)) SeekEntryResult!10532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95927 (_ BitVec 32)) SeekEntryResult!10532)

(assert (=> b!1402885 (= e!794463 (= (seekEntryOrOpen!0 lt!617550 lt!617549 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126290 lt!617552) (index!44507 lt!617552) (index!44507 lt!617552) (select (arr!46312 a!2901) j!112) lt!617549 mask!2840)))))

(declare-fun b!1402886 () Bool)

(declare-fun res!940708 () Bool)

(assert (=> b!1402886 (=> (not res!940708) (not e!794464))))

(assert (=> b!1402886 (= res!940708 (validKeyInArray!0 (select (arr!46312 a!2901) j!112)))))

(declare-fun b!1402887 () Bool)

(assert (=> b!1402887 (= e!794466 (= (seekEntryOrOpen!0 (select (arr!46312 a!2901) j!112) a!2901 mask!2840) (Found!10532 j!112)))))

(declare-fun b!1402888 () Bool)

(declare-fun e!794468 () Bool)

(assert (=> b!1402888 (= e!794468 true)))

(declare-fun lt!617555 () SeekEntryResult!10532)

(assert (=> b!1402888 (= lt!617555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617553 lt!617550 lt!617549 mask!2840))))

(declare-fun res!940717 () Bool)

(assert (=> start!120596 (=> (not res!940717) (not e!794464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120596 (= res!940717 (validMask!0 mask!2840))))

(assert (=> start!120596 e!794464))

(assert (=> start!120596 true))

(declare-fun array_inv!35593 (array!95927) Bool)

(assert (=> start!120596 (array_inv!35593 a!2901)))

(declare-fun b!1402889 () Bool)

(declare-fun e!794465 () Bool)

(assert (=> b!1402889 (= e!794467 e!794465)))

(declare-fun res!940713 () Bool)

(assert (=> b!1402889 (=> res!940713 e!794465)))

(assert (=> b!1402889 (= res!940713 (or (= lt!617548 lt!617552) (not ((_ is Intermediate!10532) lt!617552))))))

(assert (=> b!1402889 (= lt!617552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617550 mask!2840) lt!617550 lt!617549 mask!2840))))

(assert (=> b!1402889 (= lt!617550 (select (store (arr!46312 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402889 (= lt!617549 (array!95928 (store (arr!46312 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46863 a!2901)))))

(declare-fun b!1402890 () Bool)

(assert (=> b!1402890 (= e!794465 e!794468)))

(declare-fun res!940709 () Bool)

(assert (=> b!1402890 (=> res!940709 e!794468)))

(assert (=> b!1402890 (= res!940709 (or (bvslt (x!126290 lt!617548) #b00000000000000000000000000000000) (bvsgt (x!126290 lt!617548) #b01111111111111111111111111111110) (bvslt (x!126290 lt!617552) #b00000000000000000000000000000000) (bvsgt (x!126290 lt!617552) #b01111111111111111111111111111110) (bvslt lt!617553 #b00000000000000000000000000000000) (bvsge lt!617553 (size!46863 a!2901)) (bvslt (index!44507 lt!617548) #b00000000000000000000000000000000) (bvsge (index!44507 lt!617548) (size!46863 a!2901)) (bvslt (index!44507 lt!617552) #b00000000000000000000000000000000) (bvsge (index!44507 lt!617552) (size!46863 a!2901)) (not (= lt!617548 (Intermediate!10532 false (index!44507 lt!617548) (x!126290 lt!617548)))) (not (= lt!617552 (Intermediate!10532 false (index!44507 lt!617552) (x!126290 lt!617552))))))))

(assert (=> b!1402890 e!794463))

(declare-fun res!940714 () Bool)

(assert (=> b!1402890 (=> (not res!940714) (not e!794463))))

(assert (=> b!1402890 (= res!940714 (and (not (undefined!11344 lt!617552)) (= (index!44507 lt!617552) i!1037) (bvslt (x!126290 lt!617552) (x!126290 lt!617548)) (= (select (store (arr!46312 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44507 lt!617552)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617554 () Unit!47095)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47095)

(assert (=> b!1402890 (= lt!617554 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617553 (x!126290 lt!617548) (index!44507 lt!617548) (x!126290 lt!617552) (index!44507 lt!617552) (undefined!11344 lt!617552) mask!2840))))

(assert (= (and start!120596 res!940717) b!1402882))

(assert (= (and b!1402882 res!940716) b!1402880))

(assert (= (and b!1402880 res!940711) b!1402886))

(assert (= (and b!1402886 res!940708) b!1402884))

(assert (= (and b!1402884 res!940712) b!1402883))

(assert (= (and b!1402883 res!940710) b!1402881))

(assert (= (and b!1402881 res!940715) b!1402887))

(assert (= (and b!1402881 (not res!940707)) b!1402889))

(assert (= (and b!1402889 (not res!940713)) b!1402890))

(assert (= (and b!1402890 res!940714) b!1402885))

(assert (= (and b!1402890 (not res!940709)) b!1402888))

(declare-fun m!1290997 () Bool)

(assert (=> start!120596 m!1290997))

(declare-fun m!1290999 () Bool)

(assert (=> start!120596 m!1290999))

(declare-fun m!1291001 () Bool)

(assert (=> b!1402884 m!1291001))

(declare-fun m!1291003 () Bool)

(assert (=> b!1402889 m!1291003))

(assert (=> b!1402889 m!1291003))

(declare-fun m!1291005 () Bool)

(assert (=> b!1402889 m!1291005))

(declare-fun m!1291007 () Bool)

(assert (=> b!1402889 m!1291007))

(declare-fun m!1291009 () Bool)

(assert (=> b!1402889 m!1291009))

(declare-fun m!1291011 () Bool)

(assert (=> b!1402886 m!1291011))

(assert (=> b!1402886 m!1291011))

(declare-fun m!1291013 () Bool)

(assert (=> b!1402886 m!1291013))

(declare-fun m!1291015 () Bool)

(assert (=> b!1402880 m!1291015))

(assert (=> b!1402880 m!1291015))

(declare-fun m!1291017 () Bool)

(assert (=> b!1402880 m!1291017))

(assert (=> b!1402881 m!1291011))

(declare-fun m!1291019 () Bool)

(assert (=> b!1402881 m!1291019))

(assert (=> b!1402881 m!1291011))

(declare-fun m!1291021 () Bool)

(assert (=> b!1402881 m!1291021))

(declare-fun m!1291023 () Bool)

(assert (=> b!1402881 m!1291023))

(assert (=> b!1402881 m!1291011))

(declare-fun m!1291025 () Bool)

(assert (=> b!1402881 m!1291025))

(assert (=> b!1402890 m!1291007))

(declare-fun m!1291027 () Bool)

(assert (=> b!1402890 m!1291027))

(declare-fun m!1291029 () Bool)

(assert (=> b!1402890 m!1291029))

(declare-fun m!1291031 () Bool)

(assert (=> b!1402885 m!1291031))

(assert (=> b!1402885 m!1291011))

(assert (=> b!1402885 m!1291011))

(declare-fun m!1291033 () Bool)

(assert (=> b!1402885 m!1291033))

(declare-fun m!1291035 () Bool)

(assert (=> b!1402883 m!1291035))

(assert (=> b!1402887 m!1291011))

(assert (=> b!1402887 m!1291011))

(declare-fun m!1291037 () Bool)

(assert (=> b!1402887 m!1291037))

(declare-fun m!1291039 () Bool)

(assert (=> b!1402888 m!1291039))

(check-sat (not start!120596) (not b!1402881) (not b!1402886) (not b!1402885) (not b!1402880) (not b!1402888) (not b!1402883) (not b!1402887) (not b!1402889) (not b!1402884) (not b!1402890))
(check-sat)
