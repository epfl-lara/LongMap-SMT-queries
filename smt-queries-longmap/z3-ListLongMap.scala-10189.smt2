; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120248 () Bool)

(assert start!120248)

(declare-fun b!1398910 () Bool)

(declare-fun res!937142 () Bool)

(declare-fun e!792054 () Bool)

(assert (=> b!1398910 (=> (not res!937142) (not e!792054))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95699 0))(
  ( (array!95700 (arr!46201 (Array (_ BitVec 32) (_ BitVec 64))) (size!46752 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95699)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398910 (= res!937142 (and (= (size!46752 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46752 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46752 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398911 () Bool)

(declare-fun e!792053 () Bool)

(declare-fun e!792052 () Bool)

(assert (=> b!1398911 (= e!792053 e!792052)))

(declare-fun res!937141 () Bool)

(assert (=> b!1398911 (=> res!937141 e!792052)))

(declare-datatypes ((SeekEntryResult!10421 0))(
  ( (MissingZero!10421 (index!44055 (_ BitVec 32))) (Found!10421 (index!44056 (_ BitVec 32))) (Intermediate!10421 (undefined!11233 Bool) (index!44057 (_ BitVec 32)) (x!125862 (_ BitVec 32))) (Undefined!10421) (MissingVacant!10421 (index!44058 (_ BitVec 32))) )
))
(declare-fun lt!614859 () SeekEntryResult!10421)

(declare-fun lt!614860 () SeekEntryResult!10421)

(declare-fun lt!614864 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1398911 (= res!937141 (or (= lt!614860 lt!614859) (not ((_ is Intermediate!10421) lt!614859)) (bvslt (x!125862 lt!614860) #b00000000000000000000000000000000) (bvsgt (x!125862 lt!614860) #b01111111111111111111111111111110) (bvslt lt!614864 #b00000000000000000000000000000000) (bvsge lt!614864 (size!46752 a!2901)) (bvslt (index!44057 lt!614860) #b00000000000000000000000000000000) (bvsge (index!44057 lt!614860) (size!46752 a!2901)) (not (= lt!614860 (Intermediate!10421 false (index!44057 lt!614860) (x!125862 lt!614860)))) (not (= lt!614859 (Intermediate!10421 (undefined!11233 lt!614859) (index!44057 lt!614859) (x!125862 lt!614859))))))))

(declare-fun lt!614863 () array!95699)

(declare-fun lt!614862 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95699 (_ BitVec 32)) SeekEntryResult!10421)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398911 (= lt!614859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614862 mask!2840) lt!614862 lt!614863 mask!2840))))

(assert (=> b!1398911 (= lt!614862 (select (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398911 (= lt!614863 (array!95700 (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46752 a!2901)))))

(declare-fun b!1398912 () Bool)

(assert (=> b!1398912 (= e!792054 (not e!792053))))

(declare-fun res!937147 () Bool)

(assert (=> b!1398912 (=> res!937147 e!792053)))

(assert (=> b!1398912 (= res!937147 (or (not ((_ is Intermediate!10421) lt!614860)) (undefined!11233 lt!614860)))))

(declare-fun e!792055 () Bool)

(assert (=> b!1398912 e!792055))

(declare-fun res!937139 () Bool)

(assert (=> b!1398912 (=> (not res!937139) (not e!792055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95699 (_ BitVec 32)) Bool)

(assert (=> b!1398912 (= res!937139 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46873 0))(
  ( (Unit!46874) )
))
(declare-fun lt!614861 () Unit!46873)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46873)

(assert (=> b!1398912 (= lt!614861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398912 (= lt!614860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614864 (select (arr!46201 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398912 (= lt!614864 (toIndex!0 (select (arr!46201 a!2901) j!112) mask!2840))))

(declare-fun b!1398913 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95699 (_ BitVec 32)) SeekEntryResult!10421)

(assert (=> b!1398913 (= e!792055 (= (seekEntryOrOpen!0 (select (arr!46201 a!2901) j!112) a!2901 mask!2840) (Found!10421 j!112)))))

(declare-fun b!1398914 () Bool)

(declare-fun res!937144 () Bool)

(assert (=> b!1398914 (=> (not res!937144) (not e!792054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398914 (= res!937144 (validKeyInArray!0 (select (arr!46201 a!2901) i!1037)))))

(declare-fun b!1398915 () Bool)

(declare-fun res!937146 () Bool)

(assert (=> b!1398915 (=> (not res!937146) (not e!792054))))

(assert (=> b!1398915 (= res!937146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398916 () Bool)

(declare-fun res!937145 () Bool)

(assert (=> b!1398916 (=> (not res!937145) (not e!792054))))

(declare-datatypes ((List!32707 0))(
  ( (Nil!32704) (Cons!32703 (h!33953 (_ BitVec 64)) (t!47393 List!32707)) )
))
(declare-fun arrayNoDuplicates!0 (array!95699 (_ BitVec 32) List!32707) Bool)

(assert (=> b!1398916 (= res!937145 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32704))))

(declare-fun res!937140 () Bool)

(assert (=> start!120248 (=> (not res!937140) (not e!792054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120248 (= res!937140 (validMask!0 mask!2840))))

(assert (=> start!120248 e!792054))

(assert (=> start!120248 true))

(declare-fun array_inv!35482 (array!95699) Bool)

(assert (=> start!120248 (array_inv!35482 a!2901)))

(declare-fun b!1398917 () Bool)

(assert (=> b!1398917 (= e!792052 true)))

(declare-fun lt!614858 () SeekEntryResult!10421)

(assert (=> b!1398917 (= lt!614858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614864 lt!614862 lt!614863 mask!2840))))

(declare-fun b!1398918 () Bool)

(declare-fun res!937143 () Bool)

(assert (=> b!1398918 (=> (not res!937143) (not e!792054))))

(assert (=> b!1398918 (= res!937143 (validKeyInArray!0 (select (arr!46201 a!2901) j!112)))))

(assert (= (and start!120248 res!937140) b!1398910))

(assert (= (and b!1398910 res!937142) b!1398914))

(assert (= (and b!1398914 res!937144) b!1398918))

(assert (= (and b!1398918 res!937143) b!1398915))

(assert (= (and b!1398915 res!937146) b!1398916))

(assert (= (and b!1398916 res!937145) b!1398912))

(assert (= (and b!1398912 res!937139) b!1398913))

(assert (= (and b!1398912 (not res!937147)) b!1398911))

(assert (= (and b!1398911 (not res!937141)) b!1398917))

(declare-fun m!1286023 () Bool)

(assert (=> b!1398911 m!1286023))

(assert (=> b!1398911 m!1286023))

(declare-fun m!1286025 () Bool)

(assert (=> b!1398911 m!1286025))

(declare-fun m!1286027 () Bool)

(assert (=> b!1398911 m!1286027))

(declare-fun m!1286029 () Bool)

(assert (=> b!1398911 m!1286029))

(declare-fun m!1286031 () Bool)

(assert (=> start!120248 m!1286031))

(declare-fun m!1286033 () Bool)

(assert (=> start!120248 m!1286033))

(declare-fun m!1286035 () Bool)

(assert (=> b!1398918 m!1286035))

(assert (=> b!1398918 m!1286035))

(declare-fun m!1286037 () Bool)

(assert (=> b!1398918 m!1286037))

(declare-fun m!1286039 () Bool)

(assert (=> b!1398915 m!1286039))

(declare-fun m!1286041 () Bool)

(assert (=> b!1398914 m!1286041))

(assert (=> b!1398914 m!1286041))

(declare-fun m!1286043 () Bool)

(assert (=> b!1398914 m!1286043))

(declare-fun m!1286045 () Bool)

(assert (=> b!1398917 m!1286045))

(assert (=> b!1398912 m!1286035))

(declare-fun m!1286047 () Bool)

(assert (=> b!1398912 m!1286047))

(assert (=> b!1398912 m!1286035))

(assert (=> b!1398912 m!1286035))

(declare-fun m!1286049 () Bool)

(assert (=> b!1398912 m!1286049))

(declare-fun m!1286051 () Bool)

(assert (=> b!1398912 m!1286051))

(declare-fun m!1286053 () Bool)

(assert (=> b!1398912 m!1286053))

(assert (=> b!1398913 m!1286035))

(assert (=> b!1398913 m!1286035))

(declare-fun m!1286055 () Bool)

(assert (=> b!1398913 m!1286055))

(declare-fun m!1286057 () Bool)

(assert (=> b!1398916 m!1286057))

(check-sat (not b!1398912) (not b!1398915) (not b!1398916) (not b!1398917) (not b!1398918) (not b!1398913) (not start!120248) (not b!1398914) (not b!1398911))
(check-sat)
