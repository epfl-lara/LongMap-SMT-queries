; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120418 () Bool)

(assert start!120418)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95827 0))(
  ( (array!95828 (arr!46264 (Array (_ BitVec 32) (_ BitVec 64))) (size!46814 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95827)

(declare-fun e!793835 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1401905 () Bool)

(declare-datatypes ((SeekEntryResult!10581 0))(
  ( (MissingZero!10581 (index!44701 (_ BitVec 32))) (Found!10581 (index!44702 (_ BitVec 32))) (Intermediate!10581 (undefined!11393 Bool) (index!44703 (_ BitVec 32)) (x!126328 (_ BitVec 32))) (Undefined!10581) (MissingVacant!10581 (index!44704 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95827 (_ BitVec 32)) SeekEntryResult!10581)

(assert (=> b!1401905 (= e!793835 (= (seekEntryOrOpen!0 (select (arr!46264 a!2901) j!112) a!2901 mask!2840) (Found!10581 j!112)))))

(declare-fun b!1401906 () Bool)

(declare-fun e!793832 () Bool)

(declare-fun e!793829 () Bool)

(assert (=> b!1401906 (= e!793832 e!793829)))

(declare-fun res!940422 () Bool)

(assert (=> b!1401906 (=> res!940422 e!793829)))

(declare-fun lt!617270 () SeekEntryResult!10581)

(declare-fun lt!617275 () SeekEntryResult!10581)

(declare-fun lt!617272 () (_ BitVec 32))

(assert (=> b!1401906 (= res!940422 (or (bvslt (x!126328 lt!617270) #b00000000000000000000000000000000) (bvsgt (x!126328 lt!617270) #b01111111111111111111111111111110) (bvslt (x!126328 lt!617275) #b00000000000000000000000000000000) (bvsgt (x!126328 lt!617275) #b01111111111111111111111111111110) (bvslt lt!617272 #b00000000000000000000000000000000) (bvsge lt!617272 (size!46814 a!2901)) (bvslt (index!44703 lt!617270) #b00000000000000000000000000000000) (bvsge (index!44703 lt!617270) (size!46814 a!2901)) (bvslt (index!44703 lt!617275) #b00000000000000000000000000000000) (bvsge (index!44703 lt!617275) (size!46814 a!2901)) (not (= lt!617270 (Intermediate!10581 false (index!44703 lt!617270) (x!126328 lt!617270)))) (not (= lt!617275 (Intermediate!10581 false (index!44703 lt!617275) (x!126328 lt!617275))))))))

(declare-fun e!793830 () Bool)

(assert (=> b!1401906 e!793830))

(declare-fun res!940419 () Bool)

(assert (=> b!1401906 (=> (not res!940419) (not e!793830))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401906 (= res!940419 (and (not (undefined!11393 lt!617275)) (= (index!44703 lt!617275) i!1037) (bvslt (x!126328 lt!617275) (x!126328 lt!617270)) (= (select (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44703 lt!617275)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47166 0))(
  ( (Unit!47167) )
))
(declare-fun lt!617274 () Unit!47166)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47166)

(assert (=> b!1401906 (= lt!617274 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617272 (x!126328 lt!617270) (index!44703 lt!617270) (x!126328 lt!617275) (index!44703 lt!617275) (undefined!11393 lt!617275) mask!2840))))

(declare-fun b!1401907 () Bool)

(declare-fun res!940426 () Bool)

(declare-fun e!793834 () Bool)

(assert (=> b!1401907 (=> (not res!940426) (not e!793834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401907 (= res!940426 (validKeyInArray!0 (select (arr!46264 a!2901) j!112)))))

(declare-fun res!940424 () Bool)

(assert (=> start!120418 (=> (not res!940424) (not e!793834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120418 (= res!940424 (validMask!0 mask!2840))))

(assert (=> start!120418 e!793834))

(assert (=> start!120418 true))

(declare-fun array_inv!35292 (array!95827) Bool)

(assert (=> start!120418 (array_inv!35292 a!2901)))

(declare-fun b!1401908 () Bool)

(declare-fun res!940423 () Bool)

(assert (=> b!1401908 (=> (not res!940423) (not e!793834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95827 (_ BitVec 32)) Bool)

(assert (=> b!1401908 (= res!940423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401909 () Bool)

(declare-fun e!793831 () Bool)

(assert (=> b!1401909 (= e!793831 e!793832)))

(declare-fun res!940416 () Bool)

(assert (=> b!1401909 (=> res!940416 e!793832)))

(assert (=> b!1401909 (= res!940416 (or (= lt!617270 lt!617275) (not (is-Intermediate!10581 lt!617275))))))

(declare-fun lt!617277 () array!95827)

(declare-fun lt!617271 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95827 (_ BitVec 32)) SeekEntryResult!10581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401909 (= lt!617275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617271 mask!2840) lt!617271 lt!617277 mask!2840))))

(assert (=> b!1401909 (= lt!617271 (select (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401909 (= lt!617277 (array!95828 (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46814 a!2901)))))

(declare-fun b!1401910 () Bool)

(assert (=> b!1401910 (= e!793829 true)))

(declare-fun lt!617276 () SeekEntryResult!10581)

(assert (=> b!1401910 (= lt!617276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617272 lt!617271 lt!617277 mask!2840))))

(declare-fun b!1401911 () Bool)

(declare-fun res!940425 () Bool)

(assert (=> b!1401911 (=> (not res!940425) (not e!793834))))

(assert (=> b!1401911 (= res!940425 (and (= (size!46814 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46814 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46814 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401912 () Bool)

(declare-fun res!940417 () Bool)

(assert (=> b!1401912 (=> (not res!940417) (not e!793834))))

(assert (=> b!1401912 (= res!940417 (validKeyInArray!0 (select (arr!46264 a!2901) i!1037)))))

(declare-fun b!1401913 () Bool)

(assert (=> b!1401913 (= e!793834 (not e!793831))))

(declare-fun res!940418 () Bool)

(assert (=> b!1401913 (=> res!940418 e!793831)))

(assert (=> b!1401913 (= res!940418 (or (not (is-Intermediate!10581 lt!617270)) (undefined!11393 lt!617270)))))

(assert (=> b!1401913 e!793835))

(declare-fun res!940420 () Bool)

(assert (=> b!1401913 (=> (not res!940420) (not e!793835))))

(assert (=> b!1401913 (= res!940420 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617273 () Unit!47166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47166)

(assert (=> b!1401913 (= lt!617273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401913 (= lt!617270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617272 (select (arr!46264 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401913 (= lt!617272 (toIndex!0 (select (arr!46264 a!2901) j!112) mask!2840))))

(declare-fun b!1401914 () Bool)

(declare-fun res!940421 () Bool)

(assert (=> b!1401914 (=> (not res!940421) (not e!793834))))

(declare-datatypes ((List!32783 0))(
  ( (Nil!32780) (Cons!32779 (h!34027 (_ BitVec 64)) (t!47477 List!32783)) )
))
(declare-fun arrayNoDuplicates!0 (array!95827 (_ BitVec 32) List!32783) Bool)

(assert (=> b!1401914 (= res!940421 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32780))))

(declare-fun b!1401915 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95827 (_ BitVec 32)) SeekEntryResult!10581)

(assert (=> b!1401915 (= e!793830 (= (seekEntryOrOpen!0 lt!617271 lt!617277 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126328 lt!617275) (index!44703 lt!617275) (index!44703 lt!617275) (select (arr!46264 a!2901) j!112) lt!617277 mask!2840)))))

(assert (= (and start!120418 res!940424) b!1401911))

(assert (= (and b!1401911 res!940425) b!1401912))

(assert (= (and b!1401912 res!940417) b!1401907))

(assert (= (and b!1401907 res!940426) b!1401908))

(assert (= (and b!1401908 res!940423) b!1401914))

(assert (= (and b!1401914 res!940421) b!1401913))

(assert (= (and b!1401913 res!940420) b!1401905))

(assert (= (and b!1401913 (not res!940418)) b!1401909))

(assert (= (and b!1401909 (not res!940416)) b!1401906))

(assert (= (and b!1401906 res!940419) b!1401915))

(assert (= (and b!1401906 (not res!940422)) b!1401910))

(declare-fun m!1289845 () Bool)

(assert (=> start!120418 m!1289845))

(declare-fun m!1289847 () Bool)

(assert (=> start!120418 m!1289847))

(declare-fun m!1289849 () Bool)

(assert (=> b!1401909 m!1289849))

(assert (=> b!1401909 m!1289849))

(declare-fun m!1289851 () Bool)

(assert (=> b!1401909 m!1289851))

(declare-fun m!1289853 () Bool)

(assert (=> b!1401909 m!1289853))

(declare-fun m!1289855 () Bool)

(assert (=> b!1401909 m!1289855))

(declare-fun m!1289857 () Bool)

(assert (=> b!1401914 m!1289857))

(declare-fun m!1289859 () Bool)

(assert (=> b!1401912 m!1289859))

(assert (=> b!1401912 m!1289859))

(declare-fun m!1289861 () Bool)

(assert (=> b!1401912 m!1289861))

(declare-fun m!1289863 () Bool)

(assert (=> b!1401910 m!1289863))

(declare-fun m!1289865 () Bool)

(assert (=> b!1401905 m!1289865))

(assert (=> b!1401905 m!1289865))

(declare-fun m!1289867 () Bool)

(assert (=> b!1401905 m!1289867))

(declare-fun m!1289869 () Bool)

(assert (=> b!1401908 m!1289869))

(assert (=> b!1401913 m!1289865))

(declare-fun m!1289871 () Bool)

(assert (=> b!1401913 m!1289871))

(assert (=> b!1401913 m!1289865))

(declare-fun m!1289873 () Bool)

(assert (=> b!1401913 m!1289873))

(assert (=> b!1401913 m!1289865))

(declare-fun m!1289875 () Bool)

(assert (=> b!1401913 m!1289875))

(declare-fun m!1289877 () Bool)

(assert (=> b!1401913 m!1289877))

(assert (=> b!1401907 m!1289865))

(assert (=> b!1401907 m!1289865))

(declare-fun m!1289879 () Bool)

(assert (=> b!1401907 m!1289879))

(assert (=> b!1401906 m!1289853))

(declare-fun m!1289881 () Bool)

(assert (=> b!1401906 m!1289881))

(declare-fun m!1289883 () Bool)

(assert (=> b!1401906 m!1289883))

(declare-fun m!1289885 () Bool)

(assert (=> b!1401915 m!1289885))

(assert (=> b!1401915 m!1289865))

(assert (=> b!1401915 m!1289865))

(declare-fun m!1289887 () Bool)

(assert (=> b!1401915 m!1289887))

(push 1)

(assert (not b!1401910))

(assert (not b!1401912))

(assert (not b!1401905))

(assert (not start!120418))

(assert (not b!1401906))

(assert (not b!1401914))

(assert (not b!1401907))

(assert (not b!1401913))

(assert (not b!1401915))

(assert (not b!1401908))

(assert (not b!1401909))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

