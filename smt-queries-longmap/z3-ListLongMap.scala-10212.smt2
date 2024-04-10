; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120326 () Bool)

(assert start!120326)

(declare-fun b!1400387 () Bool)

(declare-fun res!938904 () Bool)

(declare-fun e!792867 () Bool)

(assert (=> b!1400387 (=> (not res!938904) (not e!792867))))

(declare-datatypes ((array!95735 0))(
  ( (array!95736 (arr!46218 (Array (_ BitVec 32) (_ BitVec 64))) (size!46768 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95735)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400387 (= res!938904 (validKeyInArray!0 (select (arr!46218 a!2901) i!1037)))))

(declare-fun res!938900 () Bool)

(assert (=> start!120326 (=> (not res!938900) (not e!792867))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120326 (= res!938900 (validMask!0 mask!2840))))

(assert (=> start!120326 e!792867))

(assert (=> start!120326 true))

(declare-fun array_inv!35246 (array!95735) Bool)

(assert (=> start!120326 (array_inv!35246 a!2901)))

(declare-fun b!1400388 () Bool)

(declare-fun e!792864 () Bool)

(assert (=> b!1400388 (= e!792867 (not e!792864))))

(declare-fun res!938902 () Bool)

(assert (=> b!1400388 (=> res!938902 e!792864)))

(declare-datatypes ((SeekEntryResult!10535 0))(
  ( (MissingZero!10535 (index!44517 (_ BitVec 32))) (Found!10535 (index!44518 (_ BitVec 32))) (Intermediate!10535 (undefined!11347 Bool) (index!44519 (_ BitVec 32)) (x!126162 (_ BitVec 32))) (Undefined!10535) (MissingVacant!10535 (index!44520 (_ BitVec 32))) )
))
(declare-fun lt!616168 () SeekEntryResult!10535)

(get-info :version)

(assert (=> b!1400388 (= res!938902 (or (not ((_ is Intermediate!10535) lt!616168)) (undefined!11347 lt!616168)))))

(declare-fun e!792869 () Bool)

(assert (=> b!1400388 e!792869))

(declare-fun res!938908 () Bool)

(assert (=> b!1400388 (=> (not res!938908) (not e!792869))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95735 (_ BitVec 32)) Bool)

(assert (=> b!1400388 (= res!938908 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47074 0))(
  ( (Unit!47075) )
))
(declare-fun lt!616170 () Unit!47074)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47074)

(assert (=> b!1400388 (= lt!616170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616169 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95735 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1400388 (= lt!616168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616169 (select (arr!46218 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400388 (= lt!616169 (toIndex!0 (select (arr!46218 a!2901) j!112) mask!2840))))

(declare-fun b!1400389 () Bool)

(declare-fun e!792868 () Bool)

(assert (=> b!1400389 (= e!792868 true)))

(declare-fun lt!616166 () array!95735)

(declare-fun lt!616173 () (_ BitVec 64))

(declare-fun lt!616172 () SeekEntryResult!10535)

(assert (=> b!1400389 (= lt!616172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616169 lt!616173 lt!616166 mask!2840))))

(declare-fun b!1400390 () Bool)

(declare-fun e!792866 () Bool)

(assert (=> b!1400390 (= e!792864 e!792866)))

(declare-fun res!938901 () Bool)

(assert (=> b!1400390 (=> res!938901 e!792866)))

(declare-fun lt!616167 () SeekEntryResult!10535)

(assert (=> b!1400390 (= res!938901 (or (= lt!616168 lt!616167) (not ((_ is Intermediate!10535) lt!616167))))))

(assert (=> b!1400390 (= lt!616167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616173 mask!2840) lt!616173 lt!616166 mask!2840))))

(assert (=> b!1400390 (= lt!616173 (select (store (arr!46218 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400390 (= lt!616166 (array!95736 (store (arr!46218 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46768 a!2901)))))

(declare-fun b!1400391 () Bool)

(declare-fun e!792863 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95735 (_ BitVec 32)) SeekEntryResult!10535)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95735 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1400391 (= e!792863 (= (seekEntryOrOpen!0 lt!616173 lt!616166 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126162 lt!616167) (index!44519 lt!616167) (index!44519 lt!616167) (select (arr!46218 a!2901) j!112) lt!616166 mask!2840)))))

(declare-fun b!1400392 () Bool)

(declare-fun res!938903 () Bool)

(assert (=> b!1400392 (=> (not res!938903) (not e!792867))))

(assert (=> b!1400392 (= res!938903 (and (= (size!46768 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46768 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46768 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400393 () Bool)

(declare-fun res!938905 () Bool)

(assert (=> b!1400393 (=> (not res!938905) (not e!792867))))

(assert (=> b!1400393 (= res!938905 (validKeyInArray!0 (select (arr!46218 a!2901) j!112)))))

(declare-fun b!1400394 () Bool)

(assert (=> b!1400394 (= e!792869 (= (seekEntryOrOpen!0 (select (arr!46218 a!2901) j!112) a!2901 mask!2840) (Found!10535 j!112)))))

(declare-fun b!1400395 () Bool)

(assert (=> b!1400395 (= e!792866 e!792868)))

(declare-fun res!938899 () Bool)

(assert (=> b!1400395 (=> res!938899 e!792868)))

(assert (=> b!1400395 (= res!938899 (or (bvslt (x!126162 lt!616168) #b00000000000000000000000000000000) (bvsgt (x!126162 lt!616168) #b01111111111111111111111111111110) (bvslt (x!126162 lt!616167) #b00000000000000000000000000000000) (bvsgt (x!126162 lt!616167) #b01111111111111111111111111111110) (bvslt lt!616169 #b00000000000000000000000000000000) (bvsge lt!616169 (size!46768 a!2901)) (bvslt (index!44519 lt!616168) #b00000000000000000000000000000000) (bvsge (index!44519 lt!616168) (size!46768 a!2901)) (bvslt (index!44519 lt!616167) #b00000000000000000000000000000000) (bvsge (index!44519 lt!616167) (size!46768 a!2901)) (not (= lt!616168 (Intermediate!10535 false (index!44519 lt!616168) (x!126162 lt!616168)))) (not (= lt!616167 (Intermediate!10535 false (index!44519 lt!616167) (x!126162 lt!616167))))))))

(assert (=> b!1400395 e!792863))

(declare-fun res!938907 () Bool)

(assert (=> b!1400395 (=> (not res!938907) (not e!792863))))

(assert (=> b!1400395 (= res!938907 (and (not (undefined!11347 lt!616167)) (= (index!44519 lt!616167) i!1037) (bvslt (x!126162 lt!616167) (x!126162 lt!616168)) (= (select (store (arr!46218 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44519 lt!616167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616171 () Unit!47074)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47074)

(assert (=> b!1400395 (= lt!616171 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616169 (x!126162 lt!616168) (index!44519 lt!616168) (x!126162 lt!616167) (index!44519 lt!616167) (undefined!11347 lt!616167) mask!2840))))

(declare-fun b!1400396 () Bool)

(declare-fun res!938898 () Bool)

(assert (=> b!1400396 (=> (not res!938898) (not e!792867))))

(assert (=> b!1400396 (= res!938898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400397 () Bool)

(declare-fun res!938906 () Bool)

(assert (=> b!1400397 (=> (not res!938906) (not e!792867))))

(declare-datatypes ((List!32737 0))(
  ( (Nil!32734) (Cons!32733 (h!33981 (_ BitVec 64)) (t!47431 List!32737)) )
))
(declare-fun arrayNoDuplicates!0 (array!95735 (_ BitVec 32) List!32737) Bool)

(assert (=> b!1400397 (= res!938906 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32734))))

(assert (= (and start!120326 res!938900) b!1400392))

(assert (= (and b!1400392 res!938903) b!1400387))

(assert (= (and b!1400387 res!938904) b!1400393))

(assert (= (and b!1400393 res!938905) b!1400396))

(assert (= (and b!1400396 res!938898) b!1400397))

(assert (= (and b!1400397 res!938906) b!1400388))

(assert (= (and b!1400388 res!938908) b!1400394))

(assert (= (and b!1400388 (not res!938902)) b!1400390))

(assert (= (and b!1400390 (not res!938901)) b!1400395))

(assert (= (and b!1400395 res!938907) b!1400391))

(assert (= (and b!1400395 (not res!938899)) b!1400389))

(declare-fun m!1287821 () Bool)

(assert (=> b!1400397 m!1287821))

(declare-fun m!1287823 () Bool)

(assert (=> start!120326 m!1287823))

(declare-fun m!1287825 () Bool)

(assert (=> start!120326 m!1287825))

(declare-fun m!1287827 () Bool)

(assert (=> b!1400391 m!1287827))

(declare-fun m!1287829 () Bool)

(assert (=> b!1400391 m!1287829))

(assert (=> b!1400391 m!1287829))

(declare-fun m!1287831 () Bool)

(assert (=> b!1400391 m!1287831))

(declare-fun m!1287833 () Bool)

(assert (=> b!1400389 m!1287833))

(assert (=> b!1400388 m!1287829))

(declare-fun m!1287835 () Bool)

(assert (=> b!1400388 m!1287835))

(assert (=> b!1400388 m!1287829))

(declare-fun m!1287837 () Bool)

(assert (=> b!1400388 m!1287837))

(declare-fun m!1287839 () Bool)

(assert (=> b!1400388 m!1287839))

(assert (=> b!1400388 m!1287829))

(declare-fun m!1287841 () Bool)

(assert (=> b!1400388 m!1287841))

(declare-fun m!1287843 () Bool)

(assert (=> b!1400387 m!1287843))

(assert (=> b!1400387 m!1287843))

(declare-fun m!1287845 () Bool)

(assert (=> b!1400387 m!1287845))

(declare-fun m!1287847 () Bool)

(assert (=> b!1400390 m!1287847))

(assert (=> b!1400390 m!1287847))

(declare-fun m!1287849 () Bool)

(assert (=> b!1400390 m!1287849))

(declare-fun m!1287851 () Bool)

(assert (=> b!1400390 m!1287851))

(declare-fun m!1287853 () Bool)

(assert (=> b!1400390 m!1287853))

(assert (=> b!1400393 m!1287829))

(assert (=> b!1400393 m!1287829))

(declare-fun m!1287855 () Bool)

(assert (=> b!1400393 m!1287855))

(assert (=> b!1400394 m!1287829))

(assert (=> b!1400394 m!1287829))

(declare-fun m!1287857 () Bool)

(assert (=> b!1400394 m!1287857))

(declare-fun m!1287859 () Bool)

(assert (=> b!1400396 m!1287859))

(assert (=> b!1400395 m!1287851))

(declare-fun m!1287861 () Bool)

(assert (=> b!1400395 m!1287861))

(declare-fun m!1287863 () Bool)

(assert (=> b!1400395 m!1287863))

(check-sat (not b!1400394) (not b!1400393) (not b!1400390) (not b!1400388) (not b!1400389) (not b!1400391) (not b!1400395) (not b!1400396) (not start!120326) (not b!1400387) (not b!1400397))
(check-sat)
