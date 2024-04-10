; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120388 () Bool)

(assert start!120388)

(declare-fun b!1401410 () Bool)

(declare-fun e!793519 () Bool)

(declare-fun e!793516 () Bool)

(assert (=> b!1401410 (= e!793519 e!793516)))

(declare-fun res!939921 () Bool)

(assert (=> b!1401410 (=> res!939921 e!793516)))

(declare-datatypes ((SeekEntryResult!10566 0))(
  ( (MissingZero!10566 (index!44641 (_ BitVec 32))) (Found!10566 (index!44642 (_ BitVec 32))) (Intermediate!10566 (undefined!11378 Bool) (index!44643 (_ BitVec 32)) (x!126273 (_ BitVec 32))) (Undefined!10566) (MissingVacant!10566 (index!44644 (_ BitVec 32))) )
))
(declare-fun lt!616910 () SeekEntryResult!10566)

(declare-fun lt!616914 () SeekEntryResult!10566)

(assert (=> b!1401410 (= res!939921 (or (= lt!616910 lt!616914) (not (is-Intermediate!10566 lt!616914))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616917 () (_ BitVec 64))

(declare-datatypes ((array!95797 0))(
  ( (array!95798 (arr!46249 (Array (_ BitVec 32) (_ BitVec 64))) (size!46799 (_ BitVec 32))) )
))
(declare-fun lt!616911 () array!95797)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95797 (_ BitVec 32)) SeekEntryResult!10566)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401410 (= lt!616914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616917 mask!2840) lt!616917 lt!616911 mask!2840))))

(declare-fun a!2901 () array!95797)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401410 (= lt!616917 (select (store (arr!46249 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401410 (= lt!616911 (array!95798 (store (arr!46249 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46799 a!2901)))))

(declare-fun res!939922 () Bool)

(declare-fun e!793515 () Bool)

(assert (=> start!120388 (=> (not res!939922) (not e!793515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120388 (= res!939922 (validMask!0 mask!2840))))

(assert (=> start!120388 e!793515))

(assert (=> start!120388 true))

(declare-fun array_inv!35277 (array!95797) Bool)

(assert (=> start!120388 (array_inv!35277 a!2901)))

(declare-fun b!1401411 () Bool)

(declare-fun res!939924 () Bool)

(assert (=> b!1401411 (=> (not res!939924) (not e!793515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95797 (_ BitVec 32)) Bool)

(assert (=> b!1401411 (= res!939924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401412 () Bool)

(declare-fun res!939929 () Bool)

(assert (=> b!1401412 (=> (not res!939929) (not e!793515))))

(declare-datatypes ((List!32768 0))(
  ( (Nil!32765) (Cons!32764 (h!34012 (_ BitVec 64)) (t!47462 List!32768)) )
))
(declare-fun arrayNoDuplicates!0 (array!95797 (_ BitVec 32) List!32768) Bool)

(assert (=> b!1401412 (= res!939929 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32765))))

(declare-fun b!1401413 () Bool)

(declare-fun res!939927 () Bool)

(assert (=> b!1401413 (=> (not res!939927) (not e!793515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401413 (= res!939927 (validKeyInArray!0 (select (arr!46249 a!2901) i!1037)))))

(declare-fun b!1401414 () Bool)

(assert (=> b!1401414 (= e!793515 (not e!793519))))

(declare-fun res!939928 () Bool)

(assert (=> b!1401414 (=> res!939928 e!793519)))

(assert (=> b!1401414 (= res!939928 (or (not (is-Intermediate!10566 lt!616910)) (undefined!11378 lt!616910)))))

(declare-fun e!793520 () Bool)

(assert (=> b!1401414 e!793520))

(declare-fun res!939931 () Bool)

(assert (=> b!1401414 (=> (not res!939931) (not e!793520))))

(assert (=> b!1401414 (= res!939931 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47136 0))(
  ( (Unit!47137) )
))
(declare-fun lt!616912 () Unit!47136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47136)

(assert (=> b!1401414 (= lt!616912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616916 () (_ BitVec 32))

(assert (=> b!1401414 (= lt!616910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616916 (select (arr!46249 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401414 (= lt!616916 (toIndex!0 (select (arr!46249 a!2901) j!112) mask!2840))))

(declare-fun b!1401415 () Bool)

(declare-fun res!939926 () Bool)

(assert (=> b!1401415 (=> (not res!939926) (not e!793515))))

(assert (=> b!1401415 (= res!939926 (and (= (size!46799 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46799 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46799 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!793518 () Bool)

(declare-fun b!1401416 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95797 (_ BitVec 32)) SeekEntryResult!10566)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95797 (_ BitVec 32)) SeekEntryResult!10566)

(assert (=> b!1401416 (= e!793518 (= (seekEntryOrOpen!0 lt!616917 lt!616911 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126273 lt!616914) (index!44643 lt!616914) (index!44643 lt!616914) (select (arr!46249 a!2901) j!112) lt!616911 mask!2840)))))

(declare-fun b!1401417 () Bool)

(declare-fun e!793517 () Bool)

(assert (=> b!1401417 (= e!793517 true)))

(declare-fun lt!616915 () SeekEntryResult!10566)

(assert (=> b!1401417 (= lt!616915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616916 lt!616917 lt!616911 mask!2840))))

(declare-fun b!1401418 () Bool)

(assert (=> b!1401418 (= e!793520 (= (seekEntryOrOpen!0 (select (arr!46249 a!2901) j!112) a!2901 mask!2840) (Found!10566 j!112)))))

(declare-fun b!1401419 () Bool)

(assert (=> b!1401419 (= e!793516 e!793517)))

(declare-fun res!939925 () Bool)

(assert (=> b!1401419 (=> res!939925 e!793517)))

(assert (=> b!1401419 (= res!939925 (or (bvslt (x!126273 lt!616910) #b00000000000000000000000000000000) (bvsgt (x!126273 lt!616910) #b01111111111111111111111111111110) (bvslt (x!126273 lt!616914) #b00000000000000000000000000000000) (bvsgt (x!126273 lt!616914) #b01111111111111111111111111111110) (bvslt lt!616916 #b00000000000000000000000000000000) (bvsge lt!616916 (size!46799 a!2901)) (bvslt (index!44643 lt!616910) #b00000000000000000000000000000000) (bvsge (index!44643 lt!616910) (size!46799 a!2901)) (bvslt (index!44643 lt!616914) #b00000000000000000000000000000000) (bvsge (index!44643 lt!616914) (size!46799 a!2901)) (not (= lt!616910 (Intermediate!10566 false (index!44643 lt!616910) (x!126273 lt!616910)))) (not (= lt!616914 (Intermediate!10566 false (index!44643 lt!616914) (x!126273 lt!616914))))))))

(assert (=> b!1401419 e!793518))

(declare-fun res!939930 () Bool)

(assert (=> b!1401419 (=> (not res!939930) (not e!793518))))

(assert (=> b!1401419 (= res!939930 (and (not (undefined!11378 lt!616914)) (= (index!44643 lt!616914) i!1037) (bvslt (x!126273 lt!616914) (x!126273 lt!616910)) (= (select (store (arr!46249 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44643 lt!616914)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616913 () Unit!47136)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47136)

(assert (=> b!1401419 (= lt!616913 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616916 (x!126273 lt!616910) (index!44643 lt!616910) (x!126273 lt!616914) (index!44643 lt!616914) (undefined!11378 lt!616914) mask!2840))))

(declare-fun b!1401420 () Bool)

(declare-fun res!939923 () Bool)

(assert (=> b!1401420 (=> (not res!939923) (not e!793515))))

(assert (=> b!1401420 (= res!939923 (validKeyInArray!0 (select (arr!46249 a!2901) j!112)))))

(assert (= (and start!120388 res!939922) b!1401415))

(assert (= (and b!1401415 res!939926) b!1401413))

(assert (= (and b!1401413 res!939927) b!1401420))

(assert (= (and b!1401420 res!939923) b!1401411))

(assert (= (and b!1401411 res!939924) b!1401412))

(assert (= (and b!1401412 res!939929) b!1401414))

(assert (= (and b!1401414 res!939931) b!1401418))

(assert (= (and b!1401414 (not res!939928)) b!1401410))

(assert (= (and b!1401410 (not res!939921)) b!1401419))

(assert (= (and b!1401419 res!939930) b!1401416))

(assert (= (and b!1401419 (not res!939925)) b!1401417))

(declare-fun m!1289185 () Bool)

(assert (=> b!1401420 m!1289185))

(assert (=> b!1401420 m!1289185))

(declare-fun m!1289187 () Bool)

(assert (=> b!1401420 m!1289187))

(declare-fun m!1289189 () Bool)

(assert (=> b!1401413 m!1289189))

(assert (=> b!1401413 m!1289189))

(declare-fun m!1289191 () Bool)

(assert (=> b!1401413 m!1289191))

(declare-fun m!1289193 () Bool)

(assert (=> b!1401412 m!1289193))

(declare-fun m!1289195 () Bool)

(assert (=> start!120388 m!1289195))

(declare-fun m!1289197 () Bool)

(assert (=> start!120388 m!1289197))

(assert (=> b!1401414 m!1289185))

(declare-fun m!1289199 () Bool)

(assert (=> b!1401414 m!1289199))

(assert (=> b!1401414 m!1289185))

(declare-fun m!1289201 () Bool)

(assert (=> b!1401414 m!1289201))

(assert (=> b!1401414 m!1289185))

(declare-fun m!1289203 () Bool)

(assert (=> b!1401414 m!1289203))

(declare-fun m!1289205 () Bool)

(assert (=> b!1401414 m!1289205))

(assert (=> b!1401418 m!1289185))

(assert (=> b!1401418 m!1289185))

(declare-fun m!1289207 () Bool)

(assert (=> b!1401418 m!1289207))

(declare-fun m!1289209 () Bool)

(assert (=> b!1401410 m!1289209))

(assert (=> b!1401410 m!1289209))

(declare-fun m!1289211 () Bool)

(assert (=> b!1401410 m!1289211))

(declare-fun m!1289213 () Bool)

(assert (=> b!1401410 m!1289213))

(declare-fun m!1289215 () Bool)

(assert (=> b!1401410 m!1289215))

(declare-fun m!1289217 () Bool)

(assert (=> b!1401417 m!1289217))

(declare-fun m!1289219 () Bool)

(assert (=> b!1401416 m!1289219))

(assert (=> b!1401416 m!1289185))

(assert (=> b!1401416 m!1289185))

(declare-fun m!1289221 () Bool)

(assert (=> b!1401416 m!1289221))

(declare-fun m!1289223 () Bool)

(assert (=> b!1401411 m!1289223))

(assert (=> b!1401419 m!1289213))

(declare-fun m!1289225 () Bool)

(assert (=> b!1401419 m!1289225))

(declare-fun m!1289227 () Bool)

(assert (=> b!1401419 m!1289227))

(push 1)

