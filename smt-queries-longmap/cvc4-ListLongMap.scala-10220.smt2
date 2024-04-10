; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120376 () Bool)

(assert start!120376)

(declare-fun res!939733 () Bool)

(declare-fun e!793388 () Bool)

(assert (=> start!120376 (=> (not res!939733) (not e!793388))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120376 (= res!939733 (validMask!0 mask!2840))))

(assert (=> start!120376 e!793388))

(assert (=> start!120376 true))

(declare-datatypes ((array!95785 0))(
  ( (array!95786 (arr!46243 (Array (_ BitVec 32) (_ BitVec 64))) (size!46793 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95785)

(declare-fun array_inv!35271 (array!95785) Bool)

(assert (=> start!120376 (array_inv!35271 a!2901)))

(declare-fun b!1401212 () Bool)

(declare-fun e!793390 () Bool)

(assert (=> b!1401212 (= e!793388 (not e!793390))))

(declare-fun res!939723 () Bool)

(assert (=> b!1401212 (=> res!939723 e!793390)))

(declare-datatypes ((SeekEntryResult!10560 0))(
  ( (MissingZero!10560 (index!44617 (_ BitVec 32))) (Found!10560 (index!44618 (_ BitVec 32))) (Intermediate!10560 (undefined!11372 Bool) (index!44619 (_ BitVec 32)) (x!126251 (_ BitVec 32))) (Undefined!10560) (MissingVacant!10560 (index!44620 (_ BitVec 32))) )
))
(declare-fun lt!616773 () SeekEntryResult!10560)

(assert (=> b!1401212 (= res!939723 (or (not (is-Intermediate!10560 lt!616773)) (undefined!11372 lt!616773)))))

(declare-fun e!793394 () Bool)

(assert (=> b!1401212 e!793394))

(declare-fun res!939724 () Bool)

(assert (=> b!1401212 (=> (not res!939724) (not e!793394))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95785 (_ BitVec 32)) Bool)

(assert (=> b!1401212 (= res!939724 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47124 0))(
  ( (Unit!47125) )
))
(declare-fun lt!616771 () Unit!47124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47124)

(assert (=> b!1401212 (= lt!616771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616772 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95785 (_ BitVec 32)) SeekEntryResult!10560)

(assert (=> b!1401212 (= lt!616773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616772 (select (arr!46243 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401212 (= lt!616772 (toIndex!0 (select (arr!46243 a!2901) j!112) mask!2840))))

(declare-fun b!1401213 () Bool)

(declare-fun e!793389 () Bool)

(assert (=> b!1401213 (= e!793390 e!793389)))

(declare-fun res!939731 () Bool)

(assert (=> b!1401213 (=> res!939731 e!793389)))

(declare-fun lt!616768 () SeekEntryResult!10560)

(assert (=> b!1401213 (= res!939731 (or (= lt!616773 lt!616768) (not (is-Intermediate!10560 lt!616768))))))

(declare-fun lt!616769 () array!95785)

(declare-fun lt!616766 () (_ BitVec 64))

(assert (=> b!1401213 (= lt!616768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616766 mask!2840) lt!616766 lt!616769 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401213 (= lt!616766 (select (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401213 (= lt!616769 (array!95786 (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46793 a!2901)))))

(declare-fun b!1401214 () Bool)

(declare-fun res!939728 () Bool)

(assert (=> b!1401214 (=> (not res!939728) (not e!793388))))

(assert (=> b!1401214 (= res!939728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401215 () Bool)

(declare-fun res!939726 () Bool)

(assert (=> b!1401215 (=> (not res!939726) (not e!793388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401215 (= res!939726 (validKeyInArray!0 (select (arr!46243 a!2901) i!1037)))))

(declare-fun b!1401216 () Bool)

(declare-fun res!939729 () Bool)

(assert (=> b!1401216 (=> (not res!939729) (not e!793388))))

(assert (=> b!1401216 (= res!939729 (and (= (size!46793 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46793 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46793 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401217 () Bool)

(declare-fun res!939727 () Bool)

(assert (=> b!1401217 (=> (not res!939727) (not e!793388))))

(assert (=> b!1401217 (= res!939727 (validKeyInArray!0 (select (arr!46243 a!2901) j!112)))))

(declare-fun b!1401218 () Bool)

(declare-fun res!939730 () Bool)

(assert (=> b!1401218 (=> (not res!939730) (not e!793388))))

(declare-datatypes ((List!32762 0))(
  ( (Nil!32759) (Cons!32758 (h!34006 (_ BitVec 64)) (t!47456 List!32762)) )
))
(declare-fun arrayNoDuplicates!0 (array!95785 (_ BitVec 32) List!32762) Bool)

(assert (=> b!1401218 (= res!939730 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32759))))

(declare-fun b!1401219 () Bool)

(declare-fun e!793391 () Bool)

(assert (=> b!1401219 (= e!793391 true)))

(declare-fun lt!616770 () SeekEntryResult!10560)

(assert (=> b!1401219 (= lt!616770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616772 lt!616766 lt!616769 mask!2840))))

(declare-fun b!1401220 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95785 (_ BitVec 32)) SeekEntryResult!10560)

(assert (=> b!1401220 (= e!793394 (= (seekEntryOrOpen!0 (select (arr!46243 a!2901) j!112) a!2901 mask!2840) (Found!10560 j!112)))))

(declare-fun b!1401221 () Bool)

(assert (=> b!1401221 (= e!793389 e!793391)))

(declare-fun res!939732 () Bool)

(assert (=> b!1401221 (=> res!939732 e!793391)))

(assert (=> b!1401221 (= res!939732 (or (bvslt (x!126251 lt!616773) #b00000000000000000000000000000000) (bvsgt (x!126251 lt!616773) #b01111111111111111111111111111110) (bvslt (x!126251 lt!616768) #b00000000000000000000000000000000) (bvsgt (x!126251 lt!616768) #b01111111111111111111111111111110) (bvslt lt!616772 #b00000000000000000000000000000000) (bvsge lt!616772 (size!46793 a!2901)) (bvslt (index!44619 lt!616773) #b00000000000000000000000000000000) (bvsge (index!44619 lt!616773) (size!46793 a!2901)) (bvslt (index!44619 lt!616768) #b00000000000000000000000000000000) (bvsge (index!44619 lt!616768) (size!46793 a!2901)) (not (= lt!616773 (Intermediate!10560 false (index!44619 lt!616773) (x!126251 lt!616773)))) (not (= lt!616768 (Intermediate!10560 false (index!44619 lt!616768) (x!126251 lt!616768))))))))

(declare-fun e!793393 () Bool)

(assert (=> b!1401221 e!793393))

(declare-fun res!939725 () Bool)

(assert (=> b!1401221 (=> (not res!939725) (not e!793393))))

(assert (=> b!1401221 (= res!939725 (and (not (undefined!11372 lt!616768)) (= (index!44619 lt!616768) i!1037) (bvslt (x!126251 lt!616768) (x!126251 lt!616773)) (= (select (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44619 lt!616768)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616767 () Unit!47124)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47124)

(assert (=> b!1401221 (= lt!616767 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616772 (x!126251 lt!616773) (index!44619 lt!616773) (x!126251 lt!616768) (index!44619 lt!616768) (undefined!11372 lt!616768) mask!2840))))

(declare-fun b!1401222 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95785 (_ BitVec 32)) SeekEntryResult!10560)

(assert (=> b!1401222 (= e!793393 (= (seekEntryOrOpen!0 lt!616766 lt!616769 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126251 lt!616768) (index!44619 lt!616768) (index!44619 lt!616768) (select (arr!46243 a!2901) j!112) lt!616769 mask!2840)))))

(assert (= (and start!120376 res!939733) b!1401216))

(assert (= (and b!1401216 res!939729) b!1401215))

(assert (= (and b!1401215 res!939726) b!1401217))

(assert (= (and b!1401217 res!939727) b!1401214))

(assert (= (and b!1401214 res!939728) b!1401218))

(assert (= (and b!1401218 res!939730) b!1401212))

(assert (= (and b!1401212 res!939724) b!1401220))

(assert (= (and b!1401212 (not res!939723)) b!1401213))

(assert (= (and b!1401213 (not res!939731)) b!1401221))

(assert (= (and b!1401221 res!939725) b!1401222))

(assert (= (and b!1401221 (not res!939732)) b!1401219))

(declare-fun m!1288921 () Bool)

(assert (=> b!1401215 m!1288921))

(assert (=> b!1401215 m!1288921))

(declare-fun m!1288923 () Bool)

(assert (=> b!1401215 m!1288923))

(declare-fun m!1288925 () Bool)

(assert (=> b!1401212 m!1288925))

(declare-fun m!1288927 () Bool)

(assert (=> b!1401212 m!1288927))

(assert (=> b!1401212 m!1288925))

(declare-fun m!1288929 () Bool)

(assert (=> b!1401212 m!1288929))

(assert (=> b!1401212 m!1288925))

(declare-fun m!1288931 () Bool)

(assert (=> b!1401212 m!1288931))

(declare-fun m!1288933 () Bool)

(assert (=> b!1401212 m!1288933))

(declare-fun m!1288935 () Bool)

(assert (=> start!120376 m!1288935))

(declare-fun m!1288937 () Bool)

(assert (=> start!120376 m!1288937))

(assert (=> b!1401220 m!1288925))

(assert (=> b!1401220 m!1288925))

(declare-fun m!1288939 () Bool)

(assert (=> b!1401220 m!1288939))

(declare-fun m!1288941 () Bool)

(assert (=> b!1401219 m!1288941))

(assert (=> b!1401217 m!1288925))

(assert (=> b!1401217 m!1288925))

(declare-fun m!1288943 () Bool)

(assert (=> b!1401217 m!1288943))

(declare-fun m!1288945 () Bool)

(assert (=> b!1401222 m!1288945))

(assert (=> b!1401222 m!1288925))

(assert (=> b!1401222 m!1288925))

(declare-fun m!1288947 () Bool)

(assert (=> b!1401222 m!1288947))

(declare-fun m!1288949 () Bool)

(assert (=> b!1401214 m!1288949))

(declare-fun m!1288951 () Bool)

(assert (=> b!1401213 m!1288951))

(assert (=> b!1401213 m!1288951))

(declare-fun m!1288953 () Bool)

(assert (=> b!1401213 m!1288953))

(declare-fun m!1288955 () Bool)

(assert (=> b!1401213 m!1288955))

(declare-fun m!1288957 () Bool)

(assert (=> b!1401213 m!1288957))

(assert (=> b!1401221 m!1288955))

(declare-fun m!1288959 () Bool)

(assert (=> b!1401221 m!1288959))

(declare-fun m!1288961 () Bool)

(assert (=> b!1401221 m!1288961))

(declare-fun m!1288963 () Bool)

(assert (=> b!1401218 m!1288963))

(push 1)

