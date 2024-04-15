; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120308 () Bool)

(assert start!120308)

(declare-fun b!1400075 () Bool)

(declare-fun res!938640 () Bool)

(declare-fun e!792683 () Bool)

(assert (=> b!1400075 (=> (not res!938640) (not e!792683))))

(declare-datatypes ((array!95670 0))(
  ( (array!95671 (arr!46186 (Array (_ BitVec 32) (_ BitVec 64))) (size!46738 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95670)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400075 (= res!938640 (validKeyInArray!0 (select (arr!46186 a!2901) j!112)))))

(declare-fun b!1400076 () Bool)

(declare-fun e!792678 () Bool)

(declare-fun e!792680 () Bool)

(assert (=> b!1400076 (= e!792678 e!792680)))

(declare-fun res!938639 () Bool)

(assert (=> b!1400076 (=> res!938639 e!792680)))

(declare-datatypes ((SeekEntryResult!10529 0))(
  ( (MissingZero!10529 (index!44493 (_ BitVec 32))) (Found!10529 (index!44494 (_ BitVec 32))) (Intermediate!10529 (undefined!11341 Bool) (index!44495 (_ BitVec 32)) (x!126137 (_ BitVec 32))) (Undefined!10529) (MissingVacant!10529 (index!44496 (_ BitVec 32))) )
))
(declare-fun lt!615810 () SeekEntryResult!10529)

(declare-fun lt!615809 () (_ BitVec 32))

(declare-fun lt!615812 () SeekEntryResult!10529)

(assert (=> b!1400076 (= res!938639 (or (bvslt (x!126137 lt!615812) #b00000000000000000000000000000000) (bvsgt (x!126137 lt!615812) #b01111111111111111111111111111110) (bvslt (x!126137 lt!615810) #b00000000000000000000000000000000) (bvsgt (x!126137 lt!615810) #b01111111111111111111111111111110) (bvslt lt!615809 #b00000000000000000000000000000000) (bvsge lt!615809 (size!46738 a!2901)) (bvslt (index!44495 lt!615812) #b00000000000000000000000000000000) (bvsge (index!44495 lt!615812) (size!46738 a!2901)) (bvslt (index!44495 lt!615810) #b00000000000000000000000000000000) (bvsge (index!44495 lt!615810) (size!46738 a!2901)) (not (= lt!615812 (Intermediate!10529 false (index!44495 lt!615812) (x!126137 lt!615812)))) (not (= lt!615810 (Intermediate!10529 false (index!44495 lt!615810) (x!126137 lt!615810))))))))

(declare-fun e!792681 () Bool)

(assert (=> b!1400076 e!792681))

(declare-fun res!938647 () Bool)

(assert (=> b!1400076 (=> (not res!938647) (not e!792681))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400076 (= res!938647 (and (not (undefined!11341 lt!615810)) (= (index!44495 lt!615810) i!1037) (bvslt (x!126137 lt!615810) (x!126137 lt!615812)) (= (select (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44495 lt!615810)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!46905 0))(
  ( (Unit!46906) )
))
(declare-fun lt!615814 () Unit!46905)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46905)

(assert (=> b!1400076 (= lt!615814 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615809 (x!126137 lt!615812) (index!44495 lt!615812) (x!126137 lt!615810) (index!44495 lt!615810) (undefined!11341 lt!615810) mask!2840))))

(declare-fun b!1400077 () Bool)

(declare-fun res!938645 () Bool)

(assert (=> b!1400077 (=> (not res!938645) (not e!792683))))

(assert (=> b!1400077 (= res!938645 (validKeyInArray!0 (select (arr!46186 a!2901) i!1037)))))

(declare-fun res!938642 () Bool)

(assert (=> start!120308 (=> (not res!938642) (not e!792683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120308 (= res!938642 (validMask!0 mask!2840))))

(assert (=> start!120308 e!792683))

(assert (=> start!120308 true))

(declare-fun array_inv!35419 (array!95670) Bool)

(assert (=> start!120308 (array_inv!35419 a!2901)))

(declare-fun b!1400078 () Bool)

(declare-fun e!792679 () Bool)

(assert (=> b!1400078 (= e!792683 (not e!792679))))

(declare-fun res!938643 () Bool)

(assert (=> b!1400078 (=> res!938643 e!792679)))

(get-info :version)

(assert (=> b!1400078 (= res!938643 (or (not ((_ is Intermediate!10529) lt!615812)) (undefined!11341 lt!615812)))))

(declare-fun e!792682 () Bool)

(assert (=> b!1400078 e!792682))

(declare-fun res!938644 () Bool)

(assert (=> b!1400078 (=> (not res!938644) (not e!792682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95670 (_ BitVec 32)) Bool)

(assert (=> b!1400078 (= res!938644 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615811 () Unit!46905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46905)

(assert (=> b!1400078 (= lt!615811 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95670 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1400078 (= lt!615812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615809 (select (arr!46186 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400078 (= lt!615809 (toIndex!0 (select (arr!46186 a!2901) j!112) mask!2840))))

(declare-fun b!1400079 () Bool)

(assert (=> b!1400079 (= e!792680 true)))

(declare-fun lt!615815 () array!95670)

(declare-fun lt!615808 () SeekEntryResult!10529)

(declare-fun lt!615813 () (_ BitVec 64))

(assert (=> b!1400079 (= lt!615808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615809 lt!615813 lt!615815 mask!2840))))

(declare-fun b!1400080 () Bool)

(assert (=> b!1400080 (= e!792679 e!792678)))

(declare-fun res!938646 () Bool)

(assert (=> b!1400080 (=> res!938646 e!792678)))

(assert (=> b!1400080 (= res!938646 (or (= lt!615812 lt!615810) (not ((_ is Intermediate!10529) lt!615810))))))

(assert (=> b!1400080 (= lt!615810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615813 mask!2840) lt!615813 lt!615815 mask!2840))))

(assert (=> b!1400080 (= lt!615813 (select (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400080 (= lt!615815 (array!95671 (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46738 a!2901)))))

(declare-fun b!1400081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95670 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1400081 (= e!792682 (= (seekEntryOrOpen!0 (select (arr!46186 a!2901) j!112) a!2901 mask!2840) (Found!10529 j!112)))))

(declare-fun b!1400082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95670 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1400082 (= e!792681 (= (seekEntryOrOpen!0 lt!615813 lt!615815 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126137 lt!615810) (index!44495 lt!615810) (index!44495 lt!615810) (select (arr!46186 a!2901) j!112) lt!615815 mask!2840)))))

(declare-fun b!1400083 () Bool)

(declare-fun res!938641 () Bool)

(assert (=> b!1400083 (=> (not res!938641) (not e!792683))))

(assert (=> b!1400083 (= res!938641 (and (= (size!46738 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46738 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46738 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400084 () Bool)

(declare-fun res!938637 () Bool)

(assert (=> b!1400084 (=> (not res!938637) (not e!792683))))

(assert (=> b!1400084 (= res!938637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400085 () Bool)

(declare-fun res!938638 () Bool)

(assert (=> b!1400085 (=> (not res!938638) (not e!792683))))

(declare-datatypes ((List!32783 0))(
  ( (Nil!32780) (Cons!32779 (h!34027 (_ BitVec 64)) (t!47469 List!32783)) )
))
(declare-fun arrayNoDuplicates!0 (array!95670 (_ BitVec 32) List!32783) Bool)

(assert (=> b!1400085 (= res!938638 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32780))))

(assert (= (and start!120308 res!938642) b!1400083))

(assert (= (and b!1400083 res!938641) b!1400077))

(assert (= (and b!1400077 res!938645) b!1400075))

(assert (= (and b!1400075 res!938640) b!1400084))

(assert (= (and b!1400084 res!938637) b!1400085))

(assert (= (and b!1400085 res!938638) b!1400078))

(assert (= (and b!1400078 res!938644) b!1400081))

(assert (= (and b!1400078 (not res!938643)) b!1400080))

(assert (= (and b!1400080 (not res!938646)) b!1400076))

(assert (= (and b!1400076 res!938647) b!1400082))

(assert (= (and b!1400076 (not res!938639)) b!1400079))

(declare-fun m!1286977 () Bool)

(assert (=> b!1400085 m!1286977))

(declare-fun m!1286979 () Bool)

(assert (=> b!1400080 m!1286979))

(assert (=> b!1400080 m!1286979))

(declare-fun m!1286981 () Bool)

(assert (=> b!1400080 m!1286981))

(declare-fun m!1286983 () Bool)

(assert (=> b!1400080 m!1286983))

(declare-fun m!1286985 () Bool)

(assert (=> b!1400080 m!1286985))

(assert (=> b!1400076 m!1286983))

(declare-fun m!1286987 () Bool)

(assert (=> b!1400076 m!1286987))

(declare-fun m!1286989 () Bool)

(assert (=> b!1400076 m!1286989))

(declare-fun m!1286991 () Bool)

(assert (=> b!1400082 m!1286991))

(declare-fun m!1286993 () Bool)

(assert (=> b!1400082 m!1286993))

(assert (=> b!1400082 m!1286993))

(declare-fun m!1286995 () Bool)

(assert (=> b!1400082 m!1286995))

(declare-fun m!1286997 () Bool)

(assert (=> b!1400084 m!1286997))

(declare-fun m!1286999 () Bool)

(assert (=> b!1400079 m!1286999))

(declare-fun m!1287001 () Bool)

(assert (=> b!1400077 m!1287001))

(assert (=> b!1400077 m!1287001))

(declare-fun m!1287003 () Bool)

(assert (=> b!1400077 m!1287003))

(assert (=> b!1400078 m!1286993))

(declare-fun m!1287005 () Bool)

(assert (=> b!1400078 m!1287005))

(assert (=> b!1400078 m!1286993))

(declare-fun m!1287007 () Bool)

(assert (=> b!1400078 m!1287007))

(assert (=> b!1400078 m!1286993))

(declare-fun m!1287009 () Bool)

(assert (=> b!1400078 m!1287009))

(declare-fun m!1287011 () Bool)

(assert (=> b!1400078 m!1287011))

(assert (=> b!1400075 m!1286993))

(assert (=> b!1400075 m!1286993))

(declare-fun m!1287013 () Bool)

(assert (=> b!1400075 m!1287013))

(assert (=> b!1400081 m!1286993))

(assert (=> b!1400081 m!1286993))

(declare-fun m!1287015 () Bool)

(assert (=> b!1400081 m!1287015))

(declare-fun m!1287017 () Bool)

(assert (=> start!120308 m!1287017))

(declare-fun m!1287019 () Bool)

(assert (=> start!120308 m!1287019))

(check-sat (not b!1400079) (not b!1400078) (not b!1400075) (not b!1400080) (not b!1400076) (not start!120308) (not b!1400081) (not b!1400082) (not b!1400084) (not b!1400085) (not b!1400077))
(check-sat)
