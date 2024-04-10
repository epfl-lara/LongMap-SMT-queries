; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120414 () Bool)

(assert start!120414)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95823 0))(
  ( (array!95824 (arr!46262 (Array (_ BitVec 32) (_ BitVec 64))) (size!46812 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95823)

(declare-fun e!793790 () Bool)

(declare-fun b!1401839 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10579 0))(
  ( (MissingZero!10579 (index!44693 (_ BitVec 32))) (Found!10579 (index!44694 (_ BitVec 32))) (Intermediate!10579 (undefined!11391 Bool) (index!44695 (_ BitVec 32)) (x!126326 (_ BitVec 32))) (Undefined!10579) (MissingVacant!10579 (index!44696 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95823 (_ BitVec 32)) SeekEntryResult!10579)

(assert (=> b!1401839 (= e!793790 (= (seekEntryOrOpen!0 (select (arr!46262 a!2901) j!112) a!2901 mask!2840) (Found!10579 j!112)))))

(declare-fun b!1401840 () Bool)

(declare-fun res!940359 () Bool)

(declare-fun e!793791 () Bool)

(assert (=> b!1401840 (=> (not res!940359) (not e!793791))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401840 (= res!940359 (and (= (size!46812 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46812 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46812 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401841 () Bool)

(declare-fun res!940357 () Bool)

(assert (=> b!1401841 (=> (not res!940357) (not e!793791))))

(declare-datatypes ((List!32781 0))(
  ( (Nil!32778) (Cons!32777 (h!34025 (_ BitVec 64)) (t!47475 List!32781)) )
))
(declare-fun arrayNoDuplicates!0 (array!95823 (_ BitVec 32) List!32781) Bool)

(assert (=> b!1401841 (= res!940357 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32778))))

(declare-fun b!1401842 () Bool)

(declare-fun e!793789 () Bool)

(assert (=> b!1401842 (= e!793789 true)))

(declare-fun lt!617226 () SeekEntryResult!10579)

(declare-fun lt!617229 () (_ BitVec 64))

(declare-fun lt!617222 () (_ BitVec 32))

(declare-fun lt!617227 () array!95823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95823 (_ BitVec 32)) SeekEntryResult!10579)

(assert (=> b!1401842 (= lt!617226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617222 lt!617229 lt!617227 mask!2840))))

(declare-fun b!1401843 () Bool)

(declare-fun res!940360 () Bool)

(assert (=> b!1401843 (=> (not res!940360) (not e!793791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95823 (_ BitVec 32)) Bool)

(assert (=> b!1401843 (= res!940360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940350 () Bool)

(assert (=> start!120414 (=> (not res!940350) (not e!793791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120414 (= res!940350 (validMask!0 mask!2840))))

(assert (=> start!120414 e!793791))

(assert (=> start!120414 true))

(declare-fun array_inv!35290 (array!95823) Bool)

(assert (=> start!120414 (array_inv!35290 a!2901)))

(declare-fun b!1401844 () Bool)

(declare-fun res!940354 () Bool)

(assert (=> b!1401844 (=> (not res!940354) (not e!793791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401844 (= res!940354 (validKeyInArray!0 (select (arr!46262 a!2901) i!1037)))))

(declare-fun b!1401845 () Bool)

(declare-fun e!793792 () Bool)

(assert (=> b!1401845 (= e!793791 (not e!793792))))

(declare-fun res!940351 () Bool)

(assert (=> b!1401845 (=> res!940351 e!793792)))

(declare-fun lt!617225 () SeekEntryResult!10579)

(assert (=> b!1401845 (= res!940351 (or (not (is-Intermediate!10579 lt!617225)) (undefined!11391 lt!617225)))))

(assert (=> b!1401845 e!793790))

(declare-fun res!940355 () Bool)

(assert (=> b!1401845 (=> (not res!940355) (not e!793790))))

(assert (=> b!1401845 (= res!940355 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47162 0))(
  ( (Unit!47163) )
))
(declare-fun lt!617224 () Unit!47162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47162)

(assert (=> b!1401845 (= lt!617224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401845 (= lt!617225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617222 (select (arr!46262 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401845 (= lt!617222 (toIndex!0 (select (arr!46262 a!2901) j!112) mask!2840))))

(declare-fun b!1401846 () Bool)

(declare-fun res!940353 () Bool)

(assert (=> b!1401846 (=> (not res!940353) (not e!793791))))

(assert (=> b!1401846 (= res!940353 (validKeyInArray!0 (select (arr!46262 a!2901) j!112)))))

(declare-fun e!793787 () Bool)

(declare-fun b!1401847 () Bool)

(declare-fun lt!617228 () SeekEntryResult!10579)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95823 (_ BitVec 32)) SeekEntryResult!10579)

(assert (=> b!1401847 (= e!793787 (= (seekEntryOrOpen!0 lt!617229 lt!617227 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126326 lt!617228) (index!44695 lt!617228) (index!44695 lt!617228) (select (arr!46262 a!2901) j!112) lt!617227 mask!2840)))))

(declare-fun b!1401848 () Bool)

(declare-fun e!793788 () Bool)

(assert (=> b!1401848 (= e!793788 e!793789)))

(declare-fun res!940356 () Bool)

(assert (=> b!1401848 (=> res!940356 e!793789)))

(assert (=> b!1401848 (= res!940356 (or (bvslt (x!126326 lt!617225) #b00000000000000000000000000000000) (bvsgt (x!126326 lt!617225) #b01111111111111111111111111111110) (bvslt (x!126326 lt!617228) #b00000000000000000000000000000000) (bvsgt (x!126326 lt!617228) #b01111111111111111111111111111110) (bvslt lt!617222 #b00000000000000000000000000000000) (bvsge lt!617222 (size!46812 a!2901)) (bvslt (index!44695 lt!617225) #b00000000000000000000000000000000) (bvsge (index!44695 lt!617225) (size!46812 a!2901)) (bvslt (index!44695 lt!617228) #b00000000000000000000000000000000) (bvsge (index!44695 lt!617228) (size!46812 a!2901)) (not (= lt!617225 (Intermediate!10579 false (index!44695 lt!617225) (x!126326 lt!617225)))) (not (= lt!617228 (Intermediate!10579 false (index!44695 lt!617228) (x!126326 lt!617228))))))))

(assert (=> b!1401848 e!793787))

(declare-fun res!940358 () Bool)

(assert (=> b!1401848 (=> (not res!940358) (not e!793787))))

(assert (=> b!1401848 (= res!940358 (and (not (undefined!11391 lt!617228)) (= (index!44695 lt!617228) i!1037) (bvslt (x!126326 lt!617228) (x!126326 lt!617225)) (= (select (store (arr!46262 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44695 lt!617228)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617223 () Unit!47162)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47162)

(assert (=> b!1401848 (= lt!617223 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617222 (x!126326 lt!617225) (index!44695 lt!617225) (x!126326 lt!617228) (index!44695 lt!617228) (undefined!11391 lt!617228) mask!2840))))

(declare-fun b!1401849 () Bool)

(assert (=> b!1401849 (= e!793792 e!793788)))

(declare-fun res!940352 () Bool)

(assert (=> b!1401849 (=> res!940352 e!793788)))

(assert (=> b!1401849 (= res!940352 (or (= lt!617225 lt!617228) (not (is-Intermediate!10579 lt!617228))))))

(assert (=> b!1401849 (= lt!617228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617229 mask!2840) lt!617229 lt!617227 mask!2840))))

(assert (=> b!1401849 (= lt!617229 (select (store (arr!46262 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401849 (= lt!617227 (array!95824 (store (arr!46262 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46812 a!2901)))))

(assert (= (and start!120414 res!940350) b!1401840))

(assert (= (and b!1401840 res!940359) b!1401844))

(assert (= (and b!1401844 res!940354) b!1401846))

(assert (= (and b!1401846 res!940353) b!1401843))

(assert (= (and b!1401843 res!940360) b!1401841))

(assert (= (and b!1401841 res!940357) b!1401845))

(assert (= (and b!1401845 res!940355) b!1401839))

(assert (= (and b!1401845 (not res!940351)) b!1401849))

(assert (= (and b!1401849 (not res!940352)) b!1401848))

(assert (= (and b!1401848 res!940358) b!1401847))

(assert (= (and b!1401848 (not res!940356)) b!1401842))

(declare-fun m!1289757 () Bool)

(assert (=> b!1401844 m!1289757))

(assert (=> b!1401844 m!1289757))

(declare-fun m!1289759 () Bool)

(assert (=> b!1401844 m!1289759))

(declare-fun m!1289761 () Bool)

(assert (=> start!120414 m!1289761))

(declare-fun m!1289763 () Bool)

(assert (=> start!120414 m!1289763))

(declare-fun m!1289765 () Bool)

(assert (=> b!1401841 m!1289765))

(declare-fun m!1289767 () Bool)

(assert (=> b!1401843 m!1289767))

(declare-fun m!1289769 () Bool)

(assert (=> b!1401846 m!1289769))

(assert (=> b!1401846 m!1289769))

(declare-fun m!1289771 () Bool)

(assert (=> b!1401846 m!1289771))

(declare-fun m!1289773 () Bool)

(assert (=> b!1401842 m!1289773))

(declare-fun m!1289775 () Bool)

(assert (=> b!1401849 m!1289775))

(assert (=> b!1401849 m!1289775))

(declare-fun m!1289777 () Bool)

(assert (=> b!1401849 m!1289777))

(declare-fun m!1289779 () Bool)

(assert (=> b!1401849 m!1289779))

(declare-fun m!1289781 () Bool)

(assert (=> b!1401849 m!1289781))

(assert (=> b!1401839 m!1289769))

(assert (=> b!1401839 m!1289769))

(declare-fun m!1289783 () Bool)

(assert (=> b!1401839 m!1289783))

(assert (=> b!1401848 m!1289779))

(declare-fun m!1289785 () Bool)

(assert (=> b!1401848 m!1289785))

(declare-fun m!1289787 () Bool)

(assert (=> b!1401848 m!1289787))

(declare-fun m!1289789 () Bool)

(assert (=> b!1401847 m!1289789))

(assert (=> b!1401847 m!1289769))

(assert (=> b!1401847 m!1289769))

(declare-fun m!1289791 () Bool)

(assert (=> b!1401847 m!1289791))

(assert (=> b!1401845 m!1289769))

(declare-fun m!1289793 () Bool)

(assert (=> b!1401845 m!1289793))

(assert (=> b!1401845 m!1289769))

(declare-fun m!1289795 () Bool)

(assert (=> b!1401845 m!1289795))

(assert (=> b!1401845 m!1289769))

(declare-fun m!1289797 () Bool)

(assert (=> b!1401845 m!1289797))

(declare-fun m!1289799 () Bool)

(assert (=> b!1401845 m!1289799))

(push 1)

