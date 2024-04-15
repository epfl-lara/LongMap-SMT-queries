; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120002 () Bool)

(assert start!120002)

(declare-fun res!935932 () Bool)

(declare-fun e!790870 () Bool)

(assert (=> start!120002 (=> (not res!935932) (not e!790870))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120002 (= res!935932 (validMask!0 mask!2840))))

(assert (=> start!120002 e!790870))

(assert (=> start!120002 true))

(declare-datatypes ((array!95484 0))(
  ( (array!95485 (arr!46096 (Array (_ BitVec 32) (_ BitVec 64))) (size!46648 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95484)

(declare-fun array_inv!35329 (array!95484) Bool)

(assert (=> start!120002 (array_inv!35329 a!2901)))

(declare-fun b!1396960 () Bool)

(declare-fun res!935930 () Bool)

(assert (=> b!1396960 (=> (not res!935930) (not e!790870))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396960 (= res!935930 (validKeyInArray!0 (select (arr!46096 a!2901) j!112)))))

(declare-fun e!790874 () Bool)

(declare-fun b!1396961 () Bool)

(declare-datatypes ((SeekEntryResult!10439 0))(
  ( (MissingZero!10439 (index!44127 (_ BitVec 32))) (Found!10439 (index!44128 (_ BitVec 32))) (Intermediate!10439 (undefined!11251 Bool) (index!44129 (_ BitVec 32)) (x!125786 (_ BitVec 32))) (Undefined!10439) (MissingVacant!10439 (index!44130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95484 (_ BitVec 32)) SeekEntryResult!10439)

(assert (=> b!1396961 (= e!790874 (= (seekEntryOrOpen!0 (select (arr!46096 a!2901) j!112) a!2901 mask!2840) (Found!10439 j!112)))))

(declare-fun b!1396962 () Bool)

(declare-fun res!935928 () Bool)

(assert (=> b!1396962 (=> (not res!935928) (not e!790870))))

(declare-datatypes ((List!32693 0))(
  ( (Nil!32690) (Cons!32689 (h!33931 (_ BitVec 64)) (t!47379 List!32693)) )
))
(declare-fun arrayNoDuplicates!0 (array!95484 (_ BitVec 32) List!32693) Bool)

(assert (=> b!1396962 (= res!935928 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32690))))

(declare-fun b!1396963 () Bool)

(declare-fun e!790873 () Bool)

(assert (=> b!1396963 (= e!790870 (not e!790873))))

(declare-fun res!935925 () Bool)

(assert (=> b!1396963 (=> res!935925 e!790873)))

(declare-fun lt!613705 () SeekEntryResult!10439)

(get-info :version)

(assert (=> b!1396963 (= res!935925 (or (not ((_ is Intermediate!10439) lt!613705)) (undefined!11251 lt!613705)))))

(assert (=> b!1396963 e!790874))

(declare-fun res!935927 () Bool)

(assert (=> b!1396963 (=> (not res!935927) (not e!790874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95484 (_ BitVec 32)) Bool)

(assert (=> b!1396963 (= res!935927 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46725 0))(
  ( (Unit!46726) )
))
(declare-fun lt!613709 () Unit!46725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46725)

(assert (=> b!1396963 (= lt!613709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613704 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95484 (_ BitVec 32)) SeekEntryResult!10439)

(assert (=> b!1396963 (= lt!613705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613704 (select (arr!46096 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396963 (= lt!613704 (toIndex!0 (select (arr!46096 a!2901) j!112) mask!2840))))

(declare-fun b!1396964 () Bool)

(declare-fun e!790871 () Bool)

(assert (=> b!1396964 (= e!790871 true)))

(declare-fun lt!613706 () (_ BitVec 64))

(declare-fun lt!613707 () SeekEntryResult!10439)

(declare-fun lt!613708 () array!95484)

(assert (=> b!1396964 (= lt!613707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613704 lt!613706 lt!613708 mask!2840))))

(declare-fun b!1396965 () Bool)

(declare-fun res!935924 () Bool)

(assert (=> b!1396965 (=> (not res!935924) (not e!790870))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396965 (= res!935924 (validKeyInArray!0 (select (arr!46096 a!2901) i!1037)))))

(declare-fun b!1396966 () Bool)

(declare-fun res!935929 () Bool)

(assert (=> b!1396966 (=> (not res!935929) (not e!790870))))

(assert (=> b!1396966 (= res!935929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396967 () Bool)

(assert (=> b!1396967 (= e!790873 e!790871)))

(declare-fun res!935931 () Bool)

(assert (=> b!1396967 (=> res!935931 e!790871)))

(declare-fun lt!613703 () SeekEntryResult!10439)

(assert (=> b!1396967 (= res!935931 (or (= lt!613705 lt!613703) (not ((_ is Intermediate!10439) lt!613703)) (bvslt (x!125786 lt!613705) #b00000000000000000000000000000000) (bvsgt (x!125786 lt!613705) #b01111111111111111111111111111110) (bvslt lt!613704 #b00000000000000000000000000000000) (bvsge lt!613704 (size!46648 a!2901)) (bvslt (index!44129 lt!613705) #b00000000000000000000000000000000) (bvsge (index!44129 lt!613705) (size!46648 a!2901)) (not (= lt!613705 (Intermediate!10439 false (index!44129 lt!613705) (x!125786 lt!613705)))) (not (= lt!613703 (Intermediate!10439 (undefined!11251 lt!613703) (index!44129 lt!613703) (x!125786 lt!613703))))))))

(assert (=> b!1396967 (= lt!613703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613706 mask!2840) lt!613706 lt!613708 mask!2840))))

(assert (=> b!1396967 (= lt!613706 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396967 (= lt!613708 (array!95485 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46648 a!2901)))))

(declare-fun b!1396968 () Bool)

(declare-fun res!935926 () Bool)

(assert (=> b!1396968 (=> (not res!935926) (not e!790870))))

(assert (=> b!1396968 (= res!935926 (and (= (size!46648 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46648 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46648 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120002 res!935932) b!1396968))

(assert (= (and b!1396968 res!935926) b!1396965))

(assert (= (and b!1396965 res!935924) b!1396960))

(assert (= (and b!1396960 res!935930) b!1396966))

(assert (= (and b!1396966 res!935929) b!1396962))

(assert (= (and b!1396962 res!935928) b!1396963))

(assert (= (and b!1396963 res!935927) b!1396961))

(assert (= (and b!1396963 (not res!935925)) b!1396967))

(assert (= (and b!1396967 (not res!935931)) b!1396964))

(declare-fun m!1283143 () Bool)

(assert (=> b!1396965 m!1283143))

(assert (=> b!1396965 m!1283143))

(declare-fun m!1283145 () Bool)

(assert (=> b!1396965 m!1283145))

(declare-fun m!1283147 () Bool)

(assert (=> b!1396963 m!1283147))

(declare-fun m!1283149 () Bool)

(assert (=> b!1396963 m!1283149))

(assert (=> b!1396963 m!1283147))

(declare-fun m!1283151 () Bool)

(assert (=> b!1396963 m!1283151))

(assert (=> b!1396963 m!1283147))

(declare-fun m!1283153 () Bool)

(assert (=> b!1396963 m!1283153))

(declare-fun m!1283155 () Bool)

(assert (=> b!1396963 m!1283155))

(declare-fun m!1283157 () Bool)

(assert (=> b!1396966 m!1283157))

(declare-fun m!1283159 () Bool)

(assert (=> b!1396967 m!1283159))

(assert (=> b!1396967 m!1283159))

(declare-fun m!1283161 () Bool)

(assert (=> b!1396967 m!1283161))

(declare-fun m!1283163 () Bool)

(assert (=> b!1396967 m!1283163))

(declare-fun m!1283165 () Bool)

(assert (=> b!1396967 m!1283165))

(assert (=> b!1396961 m!1283147))

(assert (=> b!1396961 m!1283147))

(declare-fun m!1283167 () Bool)

(assert (=> b!1396961 m!1283167))

(declare-fun m!1283169 () Bool)

(assert (=> b!1396962 m!1283169))

(declare-fun m!1283171 () Bool)

(assert (=> start!120002 m!1283171))

(declare-fun m!1283173 () Bool)

(assert (=> start!120002 m!1283173))

(declare-fun m!1283175 () Bool)

(assert (=> b!1396964 m!1283175))

(assert (=> b!1396960 m!1283147))

(assert (=> b!1396960 m!1283147))

(declare-fun m!1283177 () Bool)

(assert (=> b!1396960 m!1283177))

(check-sat (not b!1396967) (not b!1396961) (not b!1396962) (not start!120002) (not b!1396966) (not b!1396960) (not b!1396965) (not b!1396964) (not b!1396963))
(check-sat)
