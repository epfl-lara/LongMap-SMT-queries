; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120336 () Bool)

(assert start!120336)

(declare-fun b!1400552 () Bool)

(declare-fun res!939073 () Bool)

(declare-fun e!792970 () Bool)

(assert (=> b!1400552 (=> (not res!939073) (not e!792970))))

(declare-datatypes ((array!95745 0))(
  ( (array!95746 (arr!46223 (Array (_ BitVec 32) (_ BitVec 64))) (size!46773 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95745)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400552 (= res!939073 (validKeyInArray!0 (select (arr!46223 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1400553 () Bool)

(declare-fun lt!616287 () (_ BitVec 64))

(declare-fun e!792974 () Bool)

(declare-datatypes ((SeekEntryResult!10540 0))(
  ( (MissingZero!10540 (index!44537 (_ BitVec 32))) (Found!10540 (index!44538 (_ BitVec 32))) (Intermediate!10540 (undefined!11352 Bool) (index!44539 (_ BitVec 32)) (x!126183 (_ BitVec 32))) (Undefined!10540) (MissingVacant!10540 (index!44540 (_ BitVec 32))) )
))
(declare-fun lt!616293 () SeekEntryResult!10540)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!616290 () array!95745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95745 (_ BitVec 32)) SeekEntryResult!10540)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95745 (_ BitVec 32)) SeekEntryResult!10540)

(assert (=> b!1400553 (= e!792974 (= (seekEntryOrOpen!0 lt!616287 lt!616290 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126183 lt!616293) (index!44539 lt!616293) (index!44539 lt!616293) (select (arr!46223 a!2901) j!112) lt!616290 mask!2840)))))

(declare-fun b!1400554 () Bool)

(declare-fun e!792971 () Bool)

(assert (=> b!1400554 (= e!792970 (not e!792971))))

(declare-fun res!939068 () Bool)

(assert (=> b!1400554 (=> res!939068 e!792971)))

(declare-fun lt!616286 () SeekEntryResult!10540)

(assert (=> b!1400554 (= res!939068 (or (not (is-Intermediate!10540 lt!616286)) (undefined!11352 lt!616286)))))

(declare-fun e!792968 () Bool)

(assert (=> b!1400554 e!792968))

(declare-fun res!939067 () Bool)

(assert (=> b!1400554 (=> (not res!939067) (not e!792968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95745 (_ BitVec 32)) Bool)

(assert (=> b!1400554 (= res!939067 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47084 0))(
  ( (Unit!47085) )
))
(declare-fun lt!616289 () Unit!47084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47084)

(assert (=> b!1400554 (= lt!616289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616291 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95745 (_ BitVec 32)) SeekEntryResult!10540)

(assert (=> b!1400554 (= lt!616286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616291 (select (arr!46223 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400554 (= lt!616291 (toIndex!0 (select (arr!46223 a!2901) j!112) mask!2840))))

(declare-fun b!1400555 () Bool)

(declare-fun res!939064 () Bool)

(assert (=> b!1400555 (=> (not res!939064) (not e!792970))))

(declare-datatypes ((List!32742 0))(
  ( (Nil!32739) (Cons!32738 (h!33986 (_ BitVec 64)) (t!47436 List!32742)) )
))
(declare-fun arrayNoDuplicates!0 (array!95745 (_ BitVec 32) List!32742) Bool)

(assert (=> b!1400555 (= res!939064 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32739))))

(declare-fun b!1400556 () Bool)

(assert (=> b!1400556 (= e!792968 (= (seekEntryOrOpen!0 (select (arr!46223 a!2901) j!112) a!2901 mask!2840) (Found!10540 j!112)))))

(declare-fun res!939072 () Bool)

(assert (=> start!120336 (=> (not res!939072) (not e!792970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120336 (= res!939072 (validMask!0 mask!2840))))

(assert (=> start!120336 e!792970))

(assert (=> start!120336 true))

(declare-fun array_inv!35251 (array!95745) Bool)

(assert (=> start!120336 (array_inv!35251 a!2901)))

(declare-fun b!1400557 () Bool)

(declare-fun e!792973 () Bool)

(assert (=> b!1400557 (= e!792973 true)))

(declare-fun lt!616288 () SeekEntryResult!10540)

(assert (=> b!1400557 (= lt!616288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616291 lt!616287 lt!616290 mask!2840))))

(declare-fun b!1400558 () Bool)

(declare-fun res!939070 () Bool)

(assert (=> b!1400558 (=> (not res!939070) (not e!792970))))

(assert (=> b!1400558 (= res!939070 (and (= (size!46773 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46773 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46773 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400559 () Bool)

(declare-fun res!939071 () Bool)

(assert (=> b!1400559 (=> (not res!939071) (not e!792970))))

(assert (=> b!1400559 (= res!939071 (validKeyInArray!0 (select (arr!46223 a!2901) j!112)))))

(declare-fun b!1400560 () Bool)

(declare-fun e!792972 () Bool)

(assert (=> b!1400560 (= e!792972 e!792973)))

(declare-fun res!939069 () Bool)

(assert (=> b!1400560 (=> res!939069 e!792973)))

(assert (=> b!1400560 (= res!939069 (or (bvslt (x!126183 lt!616286) #b00000000000000000000000000000000) (bvsgt (x!126183 lt!616286) #b01111111111111111111111111111110) (bvslt (x!126183 lt!616293) #b00000000000000000000000000000000) (bvsgt (x!126183 lt!616293) #b01111111111111111111111111111110) (bvslt lt!616291 #b00000000000000000000000000000000) (bvsge lt!616291 (size!46773 a!2901)) (bvslt (index!44539 lt!616286) #b00000000000000000000000000000000) (bvsge (index!44539 lt!616286) (size!46773 a!2901)) (bvslt (index!44539 lt!616293) #b00000000000000000000000000000000) (bvsge (index!44539 lt!616293) (size!46773 a!2901)) (not (= lt!616286 (Intermediate!10540 false (index!44539 lt!616286) (x!126183 lt!616286)))) (not (= lt!616293 (Intermediate!10540 false (index!44539 lt!616293) (x!126183 lt!616293))))))))

(assert (=> b!1400560 e!792974))

(declare-fun res!939066 () Bool)

(assert (=> b!1400560 (=> (not res!939066) (not e!792974))))

(assert (=> b!1400560 (= res!939066 (and (not (undefined!11352 lt!616293)) (= (index!44539 lt!616293) i!1037) (bvslt (x!126183 lt!616293) (x!126183 lt!616286)) (= (select (store (arr!46223 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44539 lt!616293)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616292 () Unit!47084)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47084)

(assert (=> b!1400560 (= lt!616292 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616291 (x!126183 lt!616286) (index!44539 lt!616286) (x!126183 lt!616293) (index!44539 lt!616293) (undefined!11352 lt!616293) mask!2840))))

(declare-fun b!1400561 () Bool)

(assert (=> b!1400561 (= e!792971 e!792972)))

(declare-fun res!939065 () Bool)

(assert (=> b!1400561 (=> res!939065 e!792972)))

(assert (=> b!1400561 (= res!939065 (or (= lt!616286 lt!616293) (not (is-Intermediate!10540 lt!616293))))))

(assert (=> b!1400561 (= lt!616293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616287 mask!2840) lt!616287 lt!616290 mask!2840))))

(assert (=> b!1400561 (= lt!616287 (select (store (arr!46223 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400561 (= lt!616290 (array!95746 (store (arr!46223 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46773 a!2901)))))

(declare-fun b!1400562 () Bool)

(declare-fun res!939063 () Bool)

(assert (=> b!1400562 (=> (not res!939063) (not e!792970))))

(assert (=> b!1400562 (= res!939063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120336 res!939072) b!1400558))

(assert (= (and b!1400558 res!939070) b!1400552))

(assert (= (and b!1400552 res!939073) b!1400559))

(assert (= (and b!1400559 res!939071) b!1400562))

(assert (= (and b!1400562 res!939063) b!1400555))

(assert (= (and b!1400555 res!939064) b!1400554))

(assert (= (and b!1400554 res!939067) b!1400556))

(assert (= (and b!1400554 (not res!939068)) b!1400561))

(assert (= (and b!1400561 (not res!939065)) b!1400560))

(assert (= (and b!1400560 res!939066) b!1400553))

(assert (= (and b!1400560 (not res!939069)) b!1400557))

(declare-fun m!1288041 () Bool)

(assert (=> b!1400554 m!1288041))

(declare-fun m!1288043 () Bool)

(assert (=> b!1400554 m!1288043))

(declare-fun m!1288045 () Bool)

(assert (=> b!1400554 m!1288045))

(declare-fun m!1288047 () Bool)

(assert (=> b!1400554 m!1288047))

(assert (=> b!1400554 m!1288041))

(declare-fun m!1288049 () Bool)

(assert (=> b!1400554 m!1288049))

(assert (=> b!1400554 m!1288041))

(declare-fun m!1288051 () Bool)

(assert (=> b!1400555 m!1288051))

(declare-fun m!1288053 () Bool)

(assert (=> b!1400560 m!1288053))

(declare-fun m!1288055 () Bool)

(assert (=> b!1400560 m!1288055))

(declare-fun m!1288057 () Bool)

(assert (=> b!1400560 m!1288057))

(declare-fun m!1288059 () Bool)

(assert (=> b!1400557 m!1288059))

(declare-fun m!1288061 () Bool)

(assert (=> b!1400562 m!1288061))

(declare-fun m!1288063 () Bool)

(assert (=> b!1400561 m!1288063))

(assert (=> b!1400561 m!1288063))

(declare-fun m!1288065 () Bool)

(assert (=> b!1400561 m!1288065))

(assert (=> b!1400561 m!1288053))

(declare-fun m!1288067 () Bool)

(assert (=> b!1400561 m!1288067))

(declare-fun m!1288069 () Bool)

(assert (=> b!1400552 m!1288069))

(assert (=> b!1400552 m!1288069))

(declare-fun m!1288071 () Bool)

(assert (=> b!1400552 m!1288071))

(assert (=> b!1400559 m!1288041))

(assert (=> b!1400559 m!1288041))

(declare-fun m!1288073 () Bool)

(assert (=> b!1400559 m!1288073))

(declare-fun m!1288075 () Bool)

(assert (=> b!1400553 m!1288075))

(assert (=> b!1400553 m!1288041))

(assert (=> b!1400553 m!1288041))

(declare-fun m!1288077 () Bool)

(assert (=> b!1400553 m!1288077))

(declare-fun m!1288079 () Bool)

(assert (=> start!120336 m!1288079))

(declare-fun m!1288081 () Bool)

(assert (=> start!120336 m!1288081))

(assert (=> b!1400556 m!1288041))

(assert (=> b!1400556 m!1288041))

(declare-fun m!1288083 () Bool)

(assert (=> b!1400556 m!1288083))

(push 1)

