; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120082 () Bool)

(assert start!120082)

(declare-fun b!1398067 () Bool)

(declare-fun res!936983 () Bool)

(declare-fun e!791479 () Bool)

(assert (=> b!1398067 (=> (not res!936983) (not e!791479))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95611 0))(
  ( (array!95612 (arr!46159 (Array (_ BitVec 32) (_ BitVec 64))) (size!46709 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95611)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398067 (= res!936983 (and (= (size!46709 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46709 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46709 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398068 () Bool)

(declare-fun e!791482 () Bool)

(assert (=> b!1398068 (= e!791479 (not e!791482))))

(declare-fun res!936985 () Bool)

(assert (=> b!1398068 (=> res!936985 e!791482)))

(declare-datatypes ((SeekEntryResult!10476 0))(
  ( (MissingZero!10476 (index!44275 (_ BitVec 32))) (Found!10476 (index!44276 (_ BitVec 32))) (Intermediate!10476 (undefined!11288 Bool) (index!44277 (_ BitVec 32)) (x!125922 (_ BitVec 32))) (Undefined!10476) (MissingVacant!10476 (index!44278 (_ BitVec 32))) )
))
(declare-fun lt!614688 () SeekEntryResult!10476)

(assert (=> b!1398068 (= res!936985 (or (not (is-Intermediate!10476 lt!614688)) (undefined!11288 lt!614688)))))

(declare-fun e!791481 () Bool)

(assert (=> b!1398068 e!791481))

(declare-fun res!936982 () Bool)

(assert (=> b!1398068 (=> (not res!936982) (not e!791481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95611 (_ BitVec 32)) Bool)

(assert (=> b!1398068 (= res!936982 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46956 0))(
  ( (Unit!46957) )
))
(declare-fun lt!614686 () Unit!46956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46956)

(assert (=> b!1398068 (= lt!614686 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614685 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95611 (_ BitVec 32)) SeekEntryResult!10476)

(assert (=> b!1398068 (= lt!614688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614685 (select (arr!46159 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398068 (= lt!614685 (toIndex!0 (select (arr!46159 a!2901) j!112) mask!2840))))

(declare-fun b!1398070 () Bool)

(declare-fun res!936986 () Bool)

(assert (=> b!1398070 (=> (not res!936986) (not e!791479))))

(assert (=> b!1398070 (= res!936986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398071 () Bool)

(declare-fun e!791483 () Bool)

(assert (=> b!1398071 (= e!791482 e!791483)))

(declare-fun res!936980 () Bool)

(assert (=> b!1398071 (=> res!936980 e!791483)))

(declare-fun lt!614683 () SeekEntryResult!10476)

(assert (=> b!1398071 (= res!936980 (or (= lt!614688 lt!614683) (not (is-Intermediate!10476 lt!614683))))))

(declare-fun lt!614684 () (_ BitVec 64))

(assert (=> b!1398071 (= lt!614683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614684 mask!2840) lt!614684 (array!95612 (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46709 a!2901)) mask!2840))))

(assert (=> b!1398071 (= lt!614684 (select (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398072 () Bool)

(declare-fun res!936984 () Bool)

(assert (=> b!1398072 (=> (not res!936984) (not e!791479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398072 (= res!936984 (validKeyInArray!0 (select (arr!46159 a!2901) j!112)))))

(declare-fun b!1398073 () Bool)

(declare-fun res!936987 () Bool)

(assert (=> b!1398073 (=> (not res!936987) (not e!791479))))

(assert (=> b!1398073 (= res!936987 (validKeyInArray!0 (select (arr!46159 a!2901) i!1037)))))

(declare-fun b!1398069 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95611 (_ BitVec 32)) SeekEntryResult!10476)

(assert (=> b!1398069 (= e!791481 (= (seekEntryOrOpen!0 (select (arr!46159 a!2901) j!112) a!2901 mask!2840) (Found!10476 j!112)))))

(declare-fun res!936988 () Bool)

(assert (=> start!120082 (=> (not res!936988) (not e!791479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120082 (= res!936988 (validMask!0 mask!2840))))

(assert (=> start!120082 e!791479))

(assert (=> start!120082 true))

(declare-fun array_inv!35187 (array!95611) Bool)

(assert (=> start!120082 (array_inv!35187 a!2901)))

(declare-fun b!1398074 () Bool)

(declare-fun res!936981 () Bool)

(assert (=> b!1398074 (=> (not res!936981) (not e!791479))))

(declare-datatypes ((List!32678 0))(
  ( (Nil!32675) (Cons!32674 (h!33916 (_ BitVec 64)) (t!47372 List!32678)) )
))
(declare-fun arrayNoDuplicates!0 (array!95611 (_ BitVec 32) List!32678) Bool)

(assert (=> b!1398074 (= res!936981 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32675))))

(declare-fun b!1398075 () Bool)

(assert (=> b!1398075 (= e!791483 true)))

(assert (=> b!1398075 (and (not (undefined!11288 lt!614683)) (= (index!44277 lt!614683) i!1037) (bvslt (x!125922 lt!614683) (x!125922 lt!614688)) (= (select (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44277 lt!614683)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614687 () Unit!46956)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46956)

(assert (=> b!1398075 (= lt!614687 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614685 (x!125922 lt!614688) (index!44277 lt!614688) (x!125922 lt!614683) (index!44277 lt!614683) (undefined!11288 lt!614683) mask!2840))))

(assert (= (and start!120082 res!936988) b!1398067))

(assert (= (and b!1398067 res!936983) b!1398073))

(assert (= (and b!1398073 res!936987) b!1398072))

(assert (= (and b!1398072 res!936984) b!1398070))

(assert (= (and b!1398070 res!936986) b!1398074))

(assert (= (and b!1398074 res!936981) b!1398068))

(assert (= (and b!1398068 res!936982) b!1398069))

(assert (= (and b!1398068 (not res!936985)) b!1398071))

(assert (= (and b!1398071 (not res!936980)) b!1398075))

(declare-fun m!1285051 () Bool)

(assert (=> start!120082 m!1285051))

(declare-fun m!1285053 () Bool)

(assert (=> start!120082 m!1285053))

(declare-fun m!1285055 () Bool)

(assert (=> b!1398074 m!1285055))

(declare-fun m!1285057 () Bool)

(assert (=> b!1398075 m!1285057))

(declare-fun m!1285059 () Bool)

(assert (=> b!1398075 m!1285059))

(declare-fun m!1285061 () Bool)

(assert (=> b!1398075 m!1285061))

(declare-fun m!1285063 () Bool)

(assert (=> b!1398069 m!1285063))

(assert (=> b!1398069 m!1285063))

(declare-fun m!1285065 () Bool)

(assert (=> b!1398069 m!1285065))

(assert (=> b!1398068 m!1285063))

(declare-fun m!1285067 () Bool)

(assert (=> b!1398068 m!1285067))

(assert (=> b!1398068 m!1285063))

(declare-fun m!1285069 () Bool)

(assert (=> b!1398068 m!1285069))

(assert (=> b!1398068 m!1285063))

(declare-fun m!1285071 () Bool)

(assert (=> b!1398068 m!1285071))

(declare-fun m!1285073 () Bool)

(assert (=> b!1398068 m!1285073))

(declare-fun m!1285075 () Bool)

(assert (=> b!1398073 m!1285075))

(assert (=> b!1398073 m!1285075))

(declare-fun m!1285077 () Bool)

(assert (=> b!1398073 m!1285077))

(declare-fun m!1285079 () Bool)

(assert (=> b!1398070 m!1285079))

(declare-fun m!1285081 () Bool)

(assert (=> b!1398071 m!1285081))

(assert (=> b!1398071 m!1285057))

(assert (=> b!1398071 m!1285081))

(declare-fun m!1285083 () Bool)

(assert (=> b!1398071 m!1285083))

(declare-fun m!1285085 () Bool)

(assert (=> b!1398071 m!1285085))

(assert (=> b!1398072 m!1285063))

(assert (=> b!1398072 m!1285063))

(declare-fun m!1285087 () Bool)

(assert (=> b!1398072 m!1285087))

(push 1)

