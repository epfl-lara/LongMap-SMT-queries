; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120426 () Bool)

(assert start!120426)

(declare-fun b!1402037 () Bool)

(declare-fun e!793919 () Bool)

(declare-fun e!793914 () Bool)

(assert (=> b!1402037 (= e!793919 e!793914)))

(declare-fun res!940553 () Bool)

(assert (=> b!1402037 (=> res!940553 e!793914)))

(declare-datatypes ((array!95835 0))(
  ( (array!95836 (arr!46268 (Array (_ BitVec 32) (_ BitVec 64))) (size!46818 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95835)

(declare-datatypes ((SeekEntryResult!10585 0))(
  ( (MissingZero!10585 (index!44717 (_ BitVec 32))) (Found!10585 (index!44718 (_ BitVec 32))) (Intermediate!10585 (undefined!11397 Bool) (index!44719 (_ BitVec 32)) (x!126348 (_ BitVec 32))) (Undefined!10585) (MissingVacant!10585 (index!44720 (_ BitVec 32))) )
))
(declare-fun lt!617370 () SeekEntryResult!10585)

(declare-fun lt!617372 () (_ BitVec 32))

(declare-fun lt!617371 () SeekEntryResult!10585)

(assert (=> b!1402037 (= res!940553 (or (bvslt (x!126348 lt!617370) #b00000000000000000000000000000000) (bvsgt (x!126348 lt!617370) #b01111111111111111111111111111110) (bvslt (x!126348 lt!617371) #b00000000000000000000000000000000) (bvsgt (x!126348 lt!617371) #b01111111111111111111111111111110) (bvslt lt!617372 #b00000000000000000000000000000000) (bvsge lt!617372 (size!46818 a!2901)) (bvslt (index!44719 lt!617370) #b00000000000000000000000000000000) (bvsge (index!44719 lt!617370) (size!46818 a!2901)) (bvslt (index!44719 lt!617371) #b00000000000000000000000000000000) (bvsge (index!44719 lt!617371) (size!46818 a!2901)) (not (= lt!617370 (Intermediate!10585 false (index!44719 lt!617370) (x!126348 lt!617370)))) (not (= lt!617371 (Intermediate!10585 false (index!44719 lt!617371) (x!126348 lt!617371))))))))

(declare-fun e!793915 () Bool)

(assert (=> b!1402037 e!793915))

(declare-fun res!940550 () Bool)

(assert (=> b!1402037 (=> (not res!940550) (not e!793915))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402037 (= res!940550 (and (not (undefined!11397 lt!617371)) (= (index!44719 lt!617371) i!1037) (bvslt (x!126348 lt!617371) (x!126348 lt!617370)) (= (select (store (arr!46268 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44719 lt!617371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47174 0))(
  ( (Unit!47175) )
))
(declare-fun lt!617367 () Unit!47174)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47174)

(assert (=> b!1402037 (= lt!617367 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617372 (x!126348 lt!617370) (index!44719 lt!617370) (x!126348 lt!617371) (index!44719 lt!617371) (undefined!11397 lt!617371) mask!2840))))

(declare-fun b!1402038 () Bool)

(declare-fun lt!617373 () array!95835)

(declare-fun lt!617366 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95835 (_ BitVec 32)) SeekEntryResult!10585)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95835 (_ BitVec 32)) SeekEntryResult!10585)

(assert (=> b!1402038 (= e!793915 (= (seekEntryOrOpen!0 lt!617366 lt!617373 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126348 lt!617371) (index!44719 lt!617371) (index!44719 lt!617371) (select (arr!46268 a!2901) j!112) lt!617373 mask!2840)))))

(declare-fun e!793918 () Bool)

(declare-fun b!1402039 () Bool)

(assert (=> b!1402039 (= e!793918 (= (seekEntryOrOpen!0 (select (arr!46268 a!2901) j!112) a!2901 mask!2840) (Found!10585 j!112)))))

(declare-fun b!1402040 () Bool)

(declare-fun res!940551 () Bool)

(declare-fun e!793917 () Bool)

(assert (=> b!1402040 (=> (not res!940551) (not e!793917))))

(assert (=> b!1402040 (= res!940551 (and (= (size!46818 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46818 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46818 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!940558 () Bool)

(assert (=> start!120426 (=> (not res!940558) (not e!793917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120426 (= res!940558 (validMask!0 mask!2840))))

(assert (=> start!120426 e!793917))

(assert (=> start!120426 true))

(declare-fun array_inv!35296 (array!95835) Bool)

(assert (=> start!120426 (array_inv!35296 a!2901)))

(declare-fun b!1402041 () Bool)

(assert (=> b!1402041 (= e!793914 true)))

(declare-fun lt!617369 () SeekEntryResult!10585)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95835 (_ BitVec 32)) SeekEntryResult!10585)

(assert (=> b!1402041 (= lt!617369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617372 lt!617366 lt!617373 mask!2840))))

(declare-fun b!1402042 () Bool)

(declare-fun res!940552 () Bool)

(assert (=> b!1402042 (=> (not res!940552) (not e!793917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402042 (= res!940552 (validKeyInArray!0 (select (arr!46268 a!2901) i!1037)))))

(declare-fun b!1402043 () Bool)

(declare-fun res!940554 () Bool)

(assert (=> b!1402043 (=> (not res!940554) (not e!793917))))

(declare-datatypes ((List!32787 0))(
  ( (Nil!32784) (Cons!32783 (h!34031 (_ BitVec 64)) (t!47481 List!32787)) )
))
(declare-fun arrayNoDuplicates!0 (array!95835 (_ BitVec 32) List!32787) Bool)

(assert (=> b!1402043 (= res!940554 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32784))))

(declare-fun b!1402044 () Bool)

(declare-fun res!940556 () Bool)

(assert (=> b!1402044 (=> (not res!940556) (not e!793917))))

(assert (=> b!1402044 (= res!940556 (validKeyInArray!0 (select (arr!46268 a!2901) j!112)))))

(declare-fun b!1402045 () Bool)

(declare-fun e!793916 () Bool)

(assert (=> b!1402045 (= e!793917 (not e!793916))))

(declare-fun res!940548 () Bool)

(assert (=> b!1402045 (=> res!940548 e!793916)))

(assert (=> b!1402045 (= res!940548 (or (not (is-Intermediate!10585 lt!617370)) (undefined!11397 lt!617370)))))

(assert (=> b!1402045 e!793918))

(declare-fun res!940549 () Bool)

(assert (=> b!1402045 (=> (not res!940549) (not e!793918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95835 (_ BitVec 32)) Bool)

(assert (=> b!1402045 (= res!940549 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617368 () Unit!47174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47174)

(assert (=> b!1402045 (= lt!617368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402045 (= lt!617370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617372 (select (arr!46268 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402045 (= lt!617372 (toIndex!0 (select (arr!46268 a!2901) j!112) mask!2840))))

(declare-fun b!1402046 () Bool)

(declare-fun res!940555 () Bool)

(assert (=> b!1402046 (=> (not res!940555) (not e!793917))))

(assert (=> b!1402046 (= res!940555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402047 () Bool)

(assert (=> b!1402047 (= e!793916 e!793919)))

(declare-fun res!940557 () Bool)

(assert (=> b!1402047 (=> res!940557 e!793919)))

(assert (=> b!1402047 (= res!940557 (or (= lt!617370 lt!617371) (not (is-Intermediate!10585 lt!617371))))))

(assert (=> b!1402047 (= lt!617371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617366 mask!2840) lt!617366 lt!617373 mask!2840))))

(assert (=> b!1402047 (= lt!617366 (select (store (arr!46268 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402047 (= lt!617373 (array!95836 (store (arr!46268 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46818 a!2901)))))

(assert (= (and start!120426 res!940558) b!1402040))

(assert (= (and b!1402040 res!940551) b!1402042))

(assert (= (and b!1402042 res!940552) b!1402044))

(assert (= (and b!1402044 res!940556) b!1402046))

(assert (= (and b!1402046 res!940555) b!1402043))

(assert (= (and b!1402043 res!940554) b!1402045))

(assert (= (and b!1402045 res!940549) b!1402039))

(assert (= (and b!1402045 (not res!940548)) b!1402047))

(assert (= (and b!1402047 (not res!940557)) b!1402037))

(assert (= (and b!1402037 res!940550) b!1402038))

(assert (= (and b!1402037 (not res!940553)) b!1402041))

(declare-fun m!1290021 () Bool)

(assert (=> b!1402037 m!1290021))

(declare-fun m!1290023 () Bool)

(assert (=> b!1402037 m!1290023))

(declare-fun m!1290025 () Bool)

(assert (=> b!1402037 m!1290025))

(declare-fun m!1290027 () Bool)

(assert (=> b!1402045 m!1290027))

(declare-fun m!1290029 () Bool)

(assert (=> b!1402045 m!1290029))

(assert (=> b!1402045 m!1290027))

(assert (=> b!1402045 m!1290027))

(declare-fun m!1290031 () Bool)

(assert (=> b!1402045 m!1290031))

(declare-fun m!1290033 () Bool)

(assert (=> b!1402045 m!1290033))

(declare-fun m!1290035 () Bool)

(assert (=> b!1402045 m!1290035))

(declare-fun m!1290037 () Bool)

(assert (=> b!1402047 m!1290037))

(assert (=> b!1402047 m!1290037))

(declare-fun m!1290039 () Bool)

(assert (=> b!1402047 m!1290039))

(assert (=> b!1402047 m!1290021))

(declare-fun m!1290041 () Bool)

(assert (=> b!1402047 m!1290041))

(declare-fun m!1290043 () Bool)

(assert (=> start!120426 m!1290043))

(declare-fun m!1290045 () Bool)

(assert (=> start!120426 m!1290045))

(declare-fun m!1290047 () Bool)

(assert (=> b!1402042 m!1290047))

(assert (=> b!1402042 m!1290047))

(declare-fun m!1290049 () Bool)

(assert (=> b!1402042 m!1290049))

(assert (=> b!1402039 m!1290027))

(assert (=> b!1402039 m!1290027))

(declare-fun m!1290051 () Bool)

(assert (=> b!1402039 m!1290051))

(declare-fun m!1290053 () Bool)

(assert (=> b!1402038 m!1290053))

(assert (=> b!1402038 m!1290027))

(assert (=> b!1402038 m!1290027))

(declare-fun m!1290055 () Bool)

(assert (=> b!1402038 m!1290055))

(declare-fun m!1290057 () Bool)

(assert (=> b!1402041 m!1290057))

(assert (=> b!1402044 m!1290027))

(assert (=> b!1402044 m!1290027))

(declare-fun m!1290059 () Bool)

(assert (=> b!1402044 m!1290059))

(declare-fun m!1290061 () Bool)

(assert (=> b!1402046 m!1290061))

(declare-fun m!1290063 () Bool)

(assert (=> b!1402043 m!1290063))

(push 1)

