; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120452 () Bool)

(assert start!120452)

(declare-fun b!1402422 () Bool)

(declare-fun e!794134 () Bool)

(declare-fun e!794132 () Bool)

(assert (=> b!1402422 (= e!794134 e!794132)))

(declare-fun res!940984 () Bool)

(assert (=> b!1402422 (=> res!940984 e!794132)))

(declare-datatypes ((SeekEntryResult!10601 0))(
  ( (MissingZero!10601 (index!44781 (_ BitVec 32))) (Found!10601 (index!44782 (_ BitVec 32))) (Intermediate!10601 (undefined!11413 Bool) (index!44783 (_ BitVec 32)) (x!126401 (_ BitVec 32))) (Undefined!10601) (MissingVacant!10601 (index!44784 (_ BitVec 32))) )
))
(declare-fun lt!617597 () SeekEntryResult!10601)

(declare-fun lt!617598 () SeekEntryResult!10601)

(get-info :version)

(assert (=> b!1402422 (= res!940984 (or (= lt!617597 lt!617598) (not ((_ is Intermediate!10601) lt!617598))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617595 () (_ BitVec 64))

(declare-datatypes ((array!95814 0))(
  ( (array!95815 (arr!46258 (Array (_ BitVec 32) (_ BitVec 64))) (size!46810 (_ BitVec 32))) )
))
(declare-fun lt!617603 () array!95814)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95814 (_ BitVec 32)) SeekEntryResult!10601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402422 (= lt!617598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617595 mask!2840) lt!617595 lt!617603 mask!2840))))

(declare-fun a!2901 () array!95814)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402422 (= lt!617595 (select (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402422 (= lt!617603 (array!95815 (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46810 a!2901)))))

(declare-fun b!1402423 () Bool)

(declare-fun res!940987 () Bool)

(declare-fun e!794133 () Bool)

(assert (=> b!1402423 (=> (not res!940987) (not e!794133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402423 (= res!940987 (validKeyInArray!0 (select (arr!46258 a!2901) i!1037)))))

(declare-fun b!1402424 () Bool)

(declare-fun e!794135 () Bool)

(assert (=> b!1402424 (= e!794132 e!794135)))

(declare-fun res!940988 () Bool)

(assert (=> b!1402424 (=> res!940988 e!794135)))

(declare-fun lt!617599 () (_ BitVec 32))

(assert (=> b!1402424 (= res!940988 (or (bvslt (x!126401 lt!617597) #b00000000000000000000000000000000) (bvsgt (x!126401 lt!617597) #b01111111111111111111111111111110) (bvslt (x!126401 lt!617598) #b00000000000000000000000000000000) (bvsgt (x!126401 lt!617598) #b01111111111111111111111111111110) (bvslt lt!617599 #b00000000000000000000000000000000) (bvsge lt!617599 (size!46810 a!2901)) (bvslt (index!44783 lt!617597) #b00000000000000000000000000000000) (bvsge (index!44783 lt!617597) (size!46810 a!2901)) (bvslt (index!44783 lt!617598) #b00000000000000000000000000000000) (bvsge (index!44783 lt!617598) (size!46810 a!2901)) (not (= lt!617597 (Intermediate!10601 false (index!44783 lt!617597) (x!126401 lt!617597)))) (not (= lt!617598 (Intermediate!10601 false (index!44783 lt!617598) (x!126401 lt!617598))))))))

(declare-fun lt!617602 () SeekEntryResult!10601)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95814 (_ BitVec 32)) SeekEntryResult!10601)

(assert (=> b!1402424 (= lt!617602 (seekKeyOrZeroReturnVacant!0 (x!126401 lt!617598) (index!44783 lt!617598) (index!44783 lt!617598) (select (arr!46258 a!2901) j!112) lt!617603 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95814 (_ BitVec 32)) SeekEntryResult!10601)

(assert (=> b!1402424 (= lt!617602 (seekEntryOrOpen!0 lt!617595 lt!617603 mask!2840))))

(assert (=> b!1402424 (and (not (undefined!11413 lt!617598)) (= (index!44783 lt!617598) i!1037) (bvslt (x!126401 lt!617598) (x!126401 lt!617597)) (= (select (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44783 lt!617598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47049 0))(
  ( (Unit!47050) )
))
(declare-fun lt!617601 () Unit!47049)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47049)

(assert (=> b!1402424 (= lt!617601 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617599 (x!126401 lt!617597) (index!44783 lt!617597) (x!126401 lt!617598) (index!44783 lt!617598) (undefined!11413 lt!617598) mask!2840))))

(declare-fun b!1402425 () Bool)

(declare-fun res!940993 () Bool)

(assert (=> b!1402425 (=> (not res!940993) (not e!794133))))

(assert (=> b!1402425 (= res!940993 (and (= (size!46810 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46810 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46810 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402426 () Bool)

(declare-fun res!940991 () Bool)

(assert (=> b!1402426 (=> (not res!940991) (not e!794133))))

(declare-datatypes ((List!32855 0))(
  ( (Nil!32852) (Cons!32851 (h!34099 (_ BitVec 64)) (t!47541 List!32855)) )
))
(declare-fun arrayNoDuplicates!0 (array!95814 (_ BitVec 32) List!32855) Bool)

(assert (=> b!1402426 (= res!940991 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32852))))

(declare-fun b!1402427 () Bool)

(declare-fun res!940989 () Bool)

(assert (=> b!1402427 (=> (not res!940989) (not e!794133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95814 (_ BitVec 32)) Bool)

(assert (=> b!1402427 (= res!940989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940986 () Bool)

(assert (=> start!120452 (=> (not res!940986) (not e!794133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120452 (= res!940986 (validMask!0 mask!2840))))

(assert (=> start!120452 e!794133))

(assert (=> start!120452 true))

(declare-fun array_inv!35491 (array!95814) Bool)

(assert (=> start!120452 (array_inv!35491 a!2901)))

(declare-fun b!1402428 () Bool)

(assert (=> b!1402428 (= e!794135 true)))

(declare-fun lt!617594 () SeekEntryResult!10601)

(assert (=> b!1402428 (= lt!617594 lt!617602)))

(declare-fun lt!617600 () Unit!47049)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47049)

(assert (=> b!1402428 (= lt!617600 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617599 (x!126401 lt!617597) (index!44783 lt!617597) (x!126401 lt!617598) (index!44783 lt!617598) mask!2840))))

(declare-fun b!1402429 () Bool)

(declare-fun res!940992 () Bool)

(assert (=> b!1402429 (=> (not res!940992) (not e!794133))))

(assert (=> b!1402429 (= res!940992 (validKeyInArray!0 (select (arr!46258 a!2901) j!112)))))

(declare-fun b!1402430 () Bool)

(declare-fun res!940985 () Bool)

(assert (=> b!1402430 (=> res!940985 e!794135)))

(assert (=> b!1402430 (= res!940985 (not (= lt!617598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617599 lt!617595 lt!617603 mask!2840))))))

(declare-fun b!1402431 () Bool)

(assert (=> b!1402431 (= e!794133 (not e!794134))))

(declare-fun res!940990 () Bool)

(assert (=> b!1402431 (=> res!940990 e!794134)))

(assert (=> b!1402431 (= res!940990 (or (not ((_ is Intermediate!10601) lt!617597)) (undefined!11413 lt!617597)))))

(assert (=> b!1402431 (= lt!617594 (Found!10601 j!112))))

(assert (=> b!1402431 (= lt!617594 (seekEntryOrOpen!0 (select (arr!46258 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402431 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617596 () Unit!47049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47049)

(assert (=> b!1402431 (= lt!617596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402431 (= lt!617597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617599 (select (arr!46258 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402431 (= lt!617599 (toIndex!0 (select (arr!46258 a!2901) j!112) mask!2840))))

(assert (= (and start!120452 res!940986) b!1402425))

(assert (= (and b!1402425 res!940993) b!1402423))

(assert (= (and b!1402423 res!940987) b!1402429))

(assert (= (and b!1402429 res!940992) b!1402427))

(assert (= (and b!1402427 res!940989) b!1402426))

(assert (= (and b!1402426 res!940991) b!1402431))

(assert (= (and b!1402431 (not res!940990)) b!1402422))

(assert (= (and b!1402422 (not res!940984)) b!1402424))

(assert (= (and b!1402424 (not res!940988)) b!1402430))

(assert (= (and b!1402430 (not res!940985)) b!1402428))

(declare-fun m!1290163 () Bool)

(assert (=> b!1402427 m!1290163))

(declare-fun m!1290165 () Bool)

(assert (=> b!1402428 m!1290165))

(declare-fun m!1290167 () Bool)

(assert (=> b!1402424 m!1290167))

(declare-fun m!1290169 () Bool)

(assert (=> b!1402424 m!1290169))

(declare-fun m!1290171 () Bool)

(assert (=> b!1402424 m!1290171))

(declare-fun m!1290173 () Bool)

(assert (=> b!1402424 m!1290173))

(assert (=> b!1402424 m!1290167))

(declare-fun m!1290175 () Bool)

(assert (=> b!1402424 m!1290175))

(declare-fun m!1290177 () Bool)

(assert (=> b!1402424 m!1290177))

(declare-fun m!1290179 () Bool)

(assert (=> b!1402423 m!1290179))

(assert (=> b!1402423 m!1290179))

(declare-fun m!1290181 () Bool)

(assert (=> b!1402423 m!1290181))

(assert (=> b!1402429 m!1290167))

(assert (=> b!1402429 m!1290167))

(declare-fun m!1290183 () Bool)

(assert (=> b!1402429 m!1290183))

(assert (=> b!1402431 m!1290167))

(declare-fun m!1290185 () Bool)

(assert (=> b!1402431 m!1290185))

(assert (=> b!1402431 m!1290167))

(declare-fun m!1290187 () Bool)

(assert (=> b!1402431 m!1290187))

(declare-fun m!1290189 () Bool)

(assert (=> b!1402431 m!1290189))

(assert (=> b!1402431 m!1290167))

(declare-fun m!1290191 () Bool)

(assert (=> b!1402431 m!1290191))

(assert (=> b!1402431 m!1290167))

(declare-fun m!1290193 () Bool)

(assert (=> b!1402431 m!1290193))

(declare-fun m!1290195 () Bool)

(assert (=> b!1402422 m!1290195))

(assert (=> b!1402422 m!1290195))

(declare-fun m!1290197 () Bool)

(assert (=> b!1402422 m!1290197))

(assert (=> b!1402422 m!1290177))

(declare-fun m!1290199 () Bool)

(assert (=> b!1402422 m!1290199))

(declare-fun m!1290201 () Bool)

(assert (=> b!1402430 m!1290201))

(declare-fun m!1290203 () Bool)

(assert (=> b!1402426 m!1290203))

(declare-fun m!1290205 () Bool)

(assert (=> start!120452 m!1290205))

(declare-fun m!1290207 () Bool)

(assert (=> start!120452 m!1290207))

(check-sat (not b!1402431) (not b!1402427) (not b!1402423) (not b!1402429) (not b!1402428) (not b!1402426) (not b!1402430) (not start!120452) (not b!1402424) (not b!1402422))
(check-sat)
