; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120470 () Bool)

(assert start!120470)

(declare-fun b!1402713 () Bool)

(declare-fun e!794279 () Bool)

(declare-fun e!794275 () Bool)

(assert (=> b!1402713 (= e!794279 e!794275)))

(declare-fun res!941231 () Bool)

(assert (=> b!1402713 (=> res!941231 e!794275)))

(declare-datatypes ((SeekEntryResult!10607 0))(
  ( (MissingZero!10607 (index!44805 (_ BitVec 32))) (Found!10607 (index!44806 (_ BitVec 32))) (Intermediate!10607 (undefined!11419 Bool) (index!44807 (_ BitVec 32)) (x!126426 (_ BitVec 32))) (Undefined!10607) (MissingVacant!10607 (index!44808 (_ BitVec 32))) )
))
(declare-fun lt!618002 () SeekEntryResult!10607)

(declare-fun lt!617997 () SeekEntryResult!10607)

(get-info :version)

(assert (=> b!1402713 (= res!941231 (or (= lt!618002 lt!617997) (not ((_ is Intermediate!10607) lt!617997))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!618003 () (_ BitVec 64))

(declare-datatypes ((array!95879 0))(
  ( (array!95880 (arr!46290 (Array (_ BitVec 32) (_ BitVec 64))) (size!46840 (_ BitVec 32))) )
))
(declare-fun lt!618000 () array!95879)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95879 (_ BitVec 32)) SeekEntryResult!10607)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402713 (= lt!617997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618003 mask!2840) lt!618003 lt!618000 mask!2840))))

(declare-fun a!2901 () array!95879)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402713 (= lt!618003 (select (store (arr!46290 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402713 (= lt!618000 (array!95880 (store (arr!46290 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46840 a!2901)))))

(declare-fun b!1402714 () Bool)

(declare-fun res!941225 () Bool)

(declare-fun e!794277 () Bool)

(assert (=> b!1402714 (=> (not res!941225) (not e!794277))))

(assert (=> b!1402714 (= res!941225 (and (= (size!46840 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46840 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46840 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402715 () Bool)

(declare-fun res!941224 () Bool)

(assert (=> b!1402715 (=> (not res!941224) (not e!794277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402715 (= res!941224 (validKeyInArray!0 (select (arr!46290 a!2901) i!1037)))))

(declare-fun b!1402716 () Bool)

(declare-fun res!941229 () Bool)

(assert (=> b!1402716 (=> (not res!941229) (not e!794277))))

(assert (=> b!1402716 (= res!941229 (validKeyInArray!0 (select (arr!46290 a!2901) j!112)))))

(declare-fun b!1402717 () Bool)

(declare-fun e!794276 () Bool)

(assert (=> b!1402717 (= e!794275 e!794276)))

(declare-fun res!941232 () Bool)

(assert (=> b!1402717 (=> res!941232 e!794276)))

(declare-fun lt!617998 () (_ BitVec 32))

(assert (=> b!1402717 (= res!941232 (or (bvslt (x!126426 lt!618002) #b00000000000000000000000000000000) (bvsgt (x!126426 lt!618002) #b01111111111111111111111111111110) (bvslt (x!126426 lt!617997) #b00000000000000000000000000000000) (bvsgt (x!126426 lt!617997) #b01111111111111111111111111111110) (bvslt lt!617998 #b00000000000000000000000000000000) (bvsge lt!617998 (size!46840 a!2901)) (bvslt (index!44807 lt!618002) #b00000000000000000000000000000000) (bvsge (index!44807 lt!618002) (size!46840 a!2901)) (bvslt (index!44807 lt!617997) #b00000000000000000000000000000000) (bvsge (index!44807 lt!617997) (size!46840 a!2901)) (not (= lt!618002 (Intermediate!10607 false (index!44807 lt!618002) (x!126426 lt!618002)))) (not (= lt!617997 (Intermediate!10607 false (index!44807 lt!617997) (x!126426 lt!617997))))))))

(declare-fun lt!617995 () SeekEntryResult!10607)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95879 (_ BitVec 32)) SeekEntryResult!10607)

(assert (=> b!1402717 (= lt!617995 (seekKeyOrZeroReturnVacant!0 (x!126426 lt!617997) (index!44807 lt!617997) (index!44807 lt!617997) (select (arr!46290 a!2901) j!112) lt!618000 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95879 (_ BitVec 32)) SeekEntryResult!10607)

(assert (=> b!1402717 (= lt!617995 (seekEntryOrOpen!0 lt!618003 lt!618000 mask!2840))))

(assert (=> b!1402717 (and (not (undefined!11419 lt!617997)) (= (index!44807 lt!617997) i!1037) (bvslt (x!126426 lt!617997) (x!126426 lt!618002)) (= (select (store (arr!46290 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44807 lt!617997)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47218 0))(
  ( (Unit!47219) )
))
(declare-fun lt!617994 () Unit!47218)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47218)

(assert (=> b!1402717 (= lt!617994 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617998 (x!126426 lt!618002) (index!44807 lt!618002) (x!126426 lt!617997) (index!44807 lt!617997) (undefined!11419 lt!617997) mask!2840))))

(declare-fun b!1402718 () Bool)

(declare-fun res!941226 () Bool)

(assert (=> b!1402718 (=> (not res!941226) (not e!794277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95879 (_ BitVec 32)) Bool)

(assert (=> b!1402718 (= res!941226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402719 () Bool)

(declare-fun res!941228 () Bool)

(assert (=> b!1402719 (=> (not res!941228) (not e!794277))))

(declare-datatypes ((List!32809 0))(
  ( (Nil!32806) (Cons!32805 (h!34053 (_ BitVec 64)) (t!47503 List!32809)) )
))
(declare-fun arrayNoDuplicates!0 (array!95879 (_ BitVec 32) List!32809) Bool)

(assert (=> b!1402719 (= res!941228 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32806))))

(declare-fun b!1402720 () Bool)

(assert (=> b!1402720 (= e!794277 (not e!794279))))

(declare-fun res!941230 () Bool)

(assert (=> b!1402720 (=> res!941230 e!794279)))

(assert (=> b!1402720 (= res!941230 (or (not ((_ is Intermediate!10607) lt!618002)) (undefined!11419 lt!618002)))))

(declare-fun lt!617996 () SeekEntryResult!10607)

(assert (=> b!1402720 (= lt!617996 (Found!10607 j!112))))

(assert (=> b!1402720 (= lt!617996 (seekEntryOrOpen!0 (select (arr!46290 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402720 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617999 () Unit!47218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47218)

(assert (=> b!1402720 (= lt!617999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402720 (= lt!618002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617998 (select (arr!46290 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402720 (= lt!617998 (toIndex!0 (select (arr!46290 a!2901) j!112) mask!2840))))

(declare-fun b!1402721 () Bool)

(assert (=> b!1402721 (= e!794276 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1402721 (= lt!617996 lt!617995)))

(declare-fun lt!618001 () Unit!47218)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47218)

(assert (=> b!1402721 (= lt!618001 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617998 (x!126426 lt!618002) (index!44807 lt!618002) (x!126426 lt!617997) (index!44807 lt!617997) mask!2840))))

(declare-fun res!941233 () Bool)

(assert (=> start!120470 (=> (not res!941233) (not e!794277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120470 (= res!941233 (validMask!0 mask!2840))))

(assert (=> start!120470 e!794277))

(assert (=> start!120470 true))

(declare-fun array_inv!35318 (array!95879) Bool)

(assert (=> start!120470 (array_inv!35318 a!2901)))

(declare-fun b!1402722 () Bool)

(declare-fun res!941227 () Bool)

(assert (=> b!1402722 (=> res!941227 e!794276)))

(assert (=> b!1402722 (= res!941227 (not (= lt!617997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617998 lt!618003 lt!618000 mask!2840))))))

(assert (= (and start!120470 res!941233) b!1402714))

(assert (= (and b!1402714 res!941225) b!1402715))

(assert (= (and b!1402715 res!941224) b!1402716))

(assert (= (and b!1402716 res!941229) b!1402718))

(assert (= (and b!1402718 res!941226) b!1402719))

(assert (= (and b!1402719 res!941228) b!1402720))

(assert (= (and b!1402720 (not res!941230)) b!1402713))

(assert (= (and b!1402713 (not res!941231)) b!1402717))

(assert (= (and b!1402717 (not res!941232)) b!1402722))

(assert (= (and b!1402722 (not res!941227)) b!1402721))

(declare-fun m!1291021 () Bool)

(assert (=> b!1402716 m!1291021))

(assert (=> b!1402716 m!1291021))

(declare-fun m!1291023 () Bool)

(assert (=> b!1402716 m!1291023))

(declare-fun m!1291025 () Bool)

(assert (=> b!1402722 m!1291025))

(declare-fun m!1291027 () Bool)

(assert (=> b!1402721 m!1291027))

(declare-fun m!1291029 () Bool)

(assert (=> b!1402717 m!1291029))

(declare-fun m!1291031 () Bool)

(assert (=> b!1402717 m!1291031))

(assert (=> b!1402717 m!1291021))

(declare-fun m!1291033 () Bool)

(assert (=> b!1402717 m!1291033))

(assert (=> b!1402717 m!1291021))

(declare-fun m!1291035 () Bool)

(assert (=> b!1402717 m!1291035))

(declare-fun m!1291037 () Bool)

(assert (=> b!1402717 m!1291037))

(declare-fun m!1291039 () Bool)

(assert (=> b!1402715 m!1291039))

(assert (=> b!1402715 m!1291039))

(declare-fun m!1291041 () Bool)

(assert (=> b!1402715 m!1291041))

(declare-fun m!1291043 () Bool)

(assert (=> start!120470 m!1291043))

(declare-fun m!1291045 () Bool)

(assert (=> start!120470 m!1291045))

(declare-fun m!1291047 () Bool)

(assert (=> b!1402713 m!1291047))

(assert (=> b!1402713 m!1291047))

(declare-fun m!1291049 () Bool)

(assert (=> b!1402713 m!1291049))

(assert (=> b!1402713 m!1291037))

(declare-fun m!1291051 () Bool)

(assert (=> b!1402713 m!1291051))

(declare-fun m!1291053 () Bool)

(assert (=> b!1402718 m!1291053))

(declare-fun m!1291055 () Bool)

(assert (=> b!1402719 m!1291055))

(assert (=> b!1402720 m!1291021))

(declare-fun m!1291057 () Bool)

(assert (=> b!1402720 m!1291057))

(declare-fun m!1291059 () Bool)

(assert (=> b!1402720 m!1291059))

(assert (=> b!1402720 m!1291021))

(declare-fun m!1291061 () Bool)

(assert (=> b!1402720 m!1291061))

(declare-fun m!1291063 () Bool)

(assert (=> b!1402720 m!1291063))

(assert (=> b!1402720 m!1291021))

(declare-fun m!1291065 () Bool)

(assert (=> b!1402720 m!1291065))

(assert (=> b!1402720 m!1291021))

(check-sat (not b!1402713) (not b!1402719) (not b!1402720) (not b!1402715) (not start!120470) (not b!1402718) (not b!1402716) (not b!1402717) (not b!1402721) (not b!1402722))
(check-sat)
