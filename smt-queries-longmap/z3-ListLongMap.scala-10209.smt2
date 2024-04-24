; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120494 () Bool)

(assert start!120494)

(declare-fun b!1401197 () Bool)

(declare-fun e!793397 () Bool)

(declare-fun e!793394 () Bool)

(assert (=> b!1401197 (= e!793397 (not e!793394))))

(declare-fun res!939033 () Bool)

(assert (=> b!1401197 (=> res!939033 e!793394)))

(declare-datatypes ((SeekEntryResult!10481 0))(
  ( (MissingZero!10481 (index!44301 (_ BitVec 32))) (Found!10481 (index!44302 (_ BitVec 32))) (Intermediate!10481 (undefined!11293 Bool) (index!44303 (_ BitVec 32)) (x!126103 (_ BitVec 32))) (Undefined!10481) (MissingVacant!10481 (index!44304 (_ BitVec 32))) )
))
(declare-fun lt!616325 () SeekEntryResult!10481)

(get-info :version)

(assert (=> b!1401197 (= res!939033 (or (not ((_ is Intermediate!10481) lt!616325)) (undefined!11293 lt!616325)))))

(declare-fun e!793393 () Bool)

(assert (=> b!1401197 e!793393))

(declare-fun res!939026 () Bool)

(assert (=> b!1401197 (=> (not res!939026) (not e!793393))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95825 0))(
  ( (array!95826 (arr!46261 (Array (_ BitVec 32) (_ BitVec 64))) (size!46812 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95825)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95825 (_ BitVec 32)) Bool)

(assert (=> b!1401197 (= res!939026 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46993 0))(
  ( (Unit!46994) )
))
(declare-fun lt!616330 () Unit!46993)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46993)

(assert (=> b!1401197 (= lt!616330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616324 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95825 (_ BitVec 32)) SeekEntryResult!10481)

(assert (=> b!1401197 (= lt!616325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616324 (select (arr!46261 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401197 (= lt!616324 (toIndex!0 (select (arr!46261 a!2901) j!112) mask!2840))))

(declare-fun b!1401198 () Bool)

(declare-fun res!939027 () Bool)

(assert (=> b!1401198 (=> (not res!939027) (not e!793397))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401198 (= res!939027 (validKeyInArray!0 (select (arr!46261 a!2901) i!1037)))))

(declare-fun b!1401199 () Bool)

(declare-fun e!793395 () Bool)

(declare-fun e!793392 () Bool)

(assert (=> b!1401199 (= e!793395 e!793392)))

(declare-fun res!939029 () Bool)

(assert (=> b!1401199 (=> res!939029 e!793392)))

(declare-fun lt!616329 () SeekEntryResult!10481)

(assert (=> b!1401199 (= res!939029 (or (bvslt (x!126103 lt!616325) #b00000000000000000000000000000000) (bvsgt (x!126103 lt!616325) #b01111111111111111111111111111110) (bvslt (x!126103 lt!616329) #b00000000000000000000000000000000) (bvsgt (x!126103 lt!616329) #b01111111111111111111111111111110) (bvslt lt!616324 #b00000000000000000000000000000000) (bvsge lt!616324 (size!46812 a!2901)) (bvslt (index!44303 lt!616325) #b00000000000000000000000000000000) (bvsge (index!44303 lt!616325) (size!46812 a!2901)) (bvslt (index!44303 lt!616329) #b00000000000000000000000000000000) (bvsge (index!44303 lt!616329) (size!46812 a!2901)) (not (= lt!616325 (Intermediate!10481 false (index!44303 lt!616325) (x!126103 lt!616325)))) (not (= lt!616329 (Intermediate!10481 false (index!44303 lt!616329) (x!126103 lt!616329))))))))

(declare-fun e!793391 () Bool)

(assert (=> b!1401199 e!793391))

(declare-fun res!939031 () Bool)

(assert (=> b!1401199 (=> (not res!939031) (not e!793391))))

(assert (=> b!1401199 (= res!939031 (and (not (undefined!11293 lt!616329)) (= (index!44303 lt!616329) i!1037) (bvslt (x!126103 lt!616329) (x!126103 lt!616325)) (= (select (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44303 lt!616329)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616326 () Unit!46993)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46993)

(assert (=> b!1401199 (= lt!616326 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616324 (x!126103 lt!616325) (index!44303 lt!616325) (x!126103 lt!616329) (index!44303 lt!616329) (undefined!11293 lt!616329) mask!2840))))

(declare-fun res!939030 () Bool)

(assert (=> start!120494 (=> (not res!939030) (not e!793397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120494 (= res!939030 (validMask!0 mask!2840))))

(assert (=> start!120494 e!793397))

(assert (=> start!120494 true))

(declare-fun array_inv!35542 (array!95825) Bool)

(assert (=> start!120494 (array_inv!35542 a!2901)))

(declare-fun b!1401200 () Bool)

(declare-fun res!939024 () Bool)

(assert (=> b!1401200 (=> (not res!939024) (not e!793397))))

(assert (=> b!1401200 (= res!939024 (validKeyInArray!0 (select (arr!46261 a!2901) j!112)))))

(declare-fun b!1401201 () Bool)

(declare-fun lt!616331 () array!95825)

(declare-fun lt!616327 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95825 (_ BitVec 32)) SeekEntryResult!10481)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95825 (_ BitVec 32)) SeekEntryResult!10481)

(assert (=> b!1401201 (= e!793391 (= (seekEntryOrOpen!0 lt!616327 lt!616331 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126103 lt!616329) (index!44303 lt!616329) (index!44303 lt!616329) (select (arr!46261 a!2901) j!112) lt!616331 mask!2840)))))

(declare-fun b!1401202 () Bool)

(assert (=> b!1401202 (= e!793392 true)))

(declare-fun lt!616328 () SeekEntryResult!10481)

(assert (=> b!1401202 (= lt!616328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616324 lt!616327 lt!616331 mask!2840))))

(declare-fun b!1401203 () Bool)

(declare-fun res!939032 () Bool)

(assert (=> b!1401203 (=> (not res!939032) (not e!793397))))

(assert (=> b!1401203 (= res!939032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401204 () Bool)

(declare-fun res!939034 () Bool)

(assert (=> b!1401204 (=> (not res!939034) (not e!793397))))

(declare-datatypes ((List!32767 0))(
  ( (Nil!32764) (Cons!32763 (h!34019 (_ BitVec 64)) (t!47453 List!32767)) )
))
(declare-fun arrayNoDuplicates!0 (array!95825 (_ BitVec 32) List!32767) Bool)

(assert (=> b!1401204 (= res!939034 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32764))))

(declare-fun b!1401205 () Bool)

(assert (=> b!1401205 (= e!793393 (= (seekEntryOrOpen!0 (select (arr!46261 a!2901) j!112) a!2901 mask!2840) (Found!10481 j!112)))))

(declare-fun b!1401206 () Bool)

(assert (=> b!1401206 (= e!793394 e!793395)))

(declare-fun res!939025 () Bool)

(assert (=> b!1401206 (=> res!939025 e!793395)))

(assert (=> b!1401206 (= res!939025 (or (= lt!616325 lt!616329) (not ((_ is Intermediate!10481) lt!616329))))))

(assert (=> b!1401206 (= lt!616329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616327 mask!2840) lt!616327 lt!616331 mask!2840))))

(assert (=> b!1401206 (= lt!616327 (select (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401206 (= lt!616331 (array!95826 (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46812 a!2901)))))

(declare-fun b!1401207 () Bool)

(declare-fun res!939028 () Bool)

(assert (=> b!1401207 (=> (not res!939028) (not e!793397))))

(assert (=> b!1401207 (= res!939028 (and (= (size!46812 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46812 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46812 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120494 res!939030) b!1401207))

(assert (= (and b!1401207 res!939028) b!1401198))

(assert (= (and b!1401198 res!939027) b!1401200))

(assert (= (and b!1401200 res!939024) b!1401203))

(assert (= (and b!1401203 res!939032) b!1401204))

(assert (= (and b!1401204 res!939034) b!1401197))

(assert (= (and b!1401197 res!939026) b!1401205))

(assert (= (and b!1401197 (not res!939033)) b!1401206))

(assert (= (and b!1401206 (not res!939025)) b!1401199))

(assert (= (and b!1401199 res!939031) b!1401201))

(assert (= (and b!1401199 (not res!939029)) b!1401202))

(declare-fun m!1288753 () Bool)

(assert (=> b!1401201 m!1288753))

(declare-fun m!1288755 () Bool)

(assert (=> b!1401201 m!1288755))

(assert (=> b!1401201 m!1288755))

(declare-fun m!1288757 () Bool)

(assert (=> b!1401201 m!1288757))

(declare-fun m!1288759 () Bool)

(assert (=> b!1401204 m!1288759))

(declare-fun m!1288761 () Bool)

(assert (=> start!120494 m!1288761))

(declare-fun m!1288763 () Bool)

(assert (=> start!120494 m!1288763))

(declare-fun m!1288765 () Bool)

(assert (=> b!1401202 m!1288765))

(declare-fun m!1288767 () Bool)

(assert (=> b!1401199 m!1288767))

(declare-fun m!1288769 () Bool)

(assert (=> b!1401199 m!1288769))

(declare-fun m!1288771 () Bool)

(assert (=> b!1401199 m!1288771))

(declare-fun m!1288773 () Bool)

(assert (=> b!1401203 m!1288773))

(declare-fun m!1288775 () Bool)

(assert (=> b!1401206 m!1288775))

(assert (=> b!1401206 m!1288775))

(declare-fun m!1288777 () Bool)

(assert (=> b!1401206 m!1288777))

(assert (=> b!1401206 m!1288767))

(declare-fun m!1288779 () Bool)

(assert (=> b!1401206 m!1288779))

(assert (=> b!1401200 m!1288755))

(assert (=> b!1401200 m!1288755))

(declare-fun m!1288781 () Bool)

(assert (=> b!1401200 m!1288781))

(assert (=> b!1401205 m!1288755))

(assert (=> b!1401205 m!1288755))

(declare-fun m!1288783 () Bool)

(assert (=> b!1401205 m!1288783))

(declare-fun m!1288785 () Bool)

(assert (=> b!1401198 m!1288785))

(assert (=> b!1401198 m!1288785))

(declare-fun m!1288787 () Bool)

(assert (=> b!1401198 m!1288787))

(assert (=> b!1401197 m!1288755))

(declare-fun m!1288789 () Bool)

(assert (=> b!1401197 m!1288789))

(assert (=> b!1401197 m!1288755))

(assert (=> b!1401197 m!1288755))

(declare-fun m!1288791 () Bool)

(assert (=> b!1401197 m!1288791))

(declare-fun m!1288793 () Bool)

(assert (=> b!1401197 m!1288793))

(declare-fun m!1288795 () Bool)

(assert (=> b!1401197 m!1288795))

(check-sat (not b!1401203) (not b!1401206) (not b!1401200) (not b!1401204) (not b!1401202) (not b!1401198) (not start!120494) (not b!1401201) (not b!1401199) (not b!1401205) (not b!1401197))
(check-sat)
