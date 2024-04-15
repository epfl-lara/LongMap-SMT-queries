; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51062 () Bool)

(assert start!51062)

(declare-fun b!557811 () Bool)

(declare-fun res!349822 () Bool)

(declare-fun e!321328 () Bool)

(assert (=> b!557811 (=> (not res!349822) (not e!321328))))

(declare-datatypes ((array!35125 0))(
  ( (array!35126 (arr!16868 (Array (_ BitVec 32) (_ BitVec 64))) (size!17233 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35125)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35125 (_ BitVec 32)) Bool)

(assert (=> b!557811 (= res!349822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557812 () Bool)

(declare-fun res!349825 () Bool)

(declare-fun e!321329 () Bool)

(assert (=> b!557812 (=> (not res!349825) (not e!321329))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557812 (= res!349825 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557813 () Bool)

(declare-fun e!321327 () Bool)

(assert (=> b!557813 (= e!321328 e!321327)))

(declare-fun res!349821 () Bool)

(assert (=> b!557813 (=> (not res!349821) (not e!321327))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5314 0))(
  ( (MissingZero!5314 (index!23483 (_ BitVec 32))) (Found!5314 (index!23484 (_ BitVec 32))) (Intermediate!5314 (undefined!6126 Bool) (index!23485 (_ BitVec 32)) (x!52393 (_ BitVec 32))) (Undefined!5314) (MissingVacant!5314 (index!23486 (_ BitVec 32))) )
))
(declare-fun lt!253354 () SeekEntryResult!5314)

(declare-fun lt!253356 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35125 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!557813 (= res!349821 (= lt!253354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253356 (select (store (arr!16868 a!3118) i!1132 k0!1914) j!142) (array!35126 (store (arr!16868 a!3118) i!1132 k0!1914) (size!17233 a!3118)) mask!3119)))))

(declare-fun lt!253355 () (_ BitVec 32))

(assert (=> b!557813 (= lt!253354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253355 (select (arr!16868 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557813 (= lt!253356 (toIndex!0 (select (store (arr!16868 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557813 (= lt!253355 (toIndex!0 (select (arr!16868 a!3118) j!142) mask!3119))))

(declare-fun b!557814 () Bool)

(declare-fun res!349823 () Bool)

(assert (=> b!557814 (=> (not res!349823) (not e!321329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557814 (= res!349823 (validKeyInArray!0 k0!1914))))

(declare-fun b!557815 () Bool)

(declare-fun e!321325 () Bool)

(declare-fun lt!253353 () SeekEntryResult!5314)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35125 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!557815 (= e!321325 (= lt!253353 (seekKeyOrZeroReturnVacant!0 (x!52393 lt!253354) (index!23485 lt!253354) (index!23485 lt!253354) (select (arr!16868 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!349824 () Bool)

(assert (=> start!51062 (=> (not res!349824) (not e!321329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51062 (= res!349824 (validMask!0 mask!3119))))

(assert (=> start!51062 e!321329))

(assert (=> start!51062 true))

(declare-fun array_inv!12751 (array!35125) Bool)

(assert (=> start!51062 (array_inv!12751 a!3118)))

(declare-fun b!557816 () Bool)

(declare-fun res!349820 () Bool)

(assert (=> b!557816 (=> (not res!349820) (not e!321329))))

(assert (=> b!557816 (= res!349820 (and (= (size!17233 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17233 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17233 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557817 () Bool)

(assert (=> b!557817 (= e!321329 e!321328)))

(declare-fun res!349818 () Bool)

(assert (=> b!557817 (=> (not res!349818) (not e!321328))))

(declare-fun lt!253357 () SeekEntryResult!5314)

(assert (=> b!557817 (= res!349818 (or (= lt!253357 (MissingZero!5314 i!1132)) (= lt!253357 (MissingVacant!5314 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35125 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!557817 (= lt!253357 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557818 () Bool)

(assert (=> b!557818 (= e!321327 (not true))))

(declare-fun e!321330 () Bool)

(assert (=> b!557818 e!321330))

(declare-fun res!349816 () Bool)

(assert (=> b!557818 (=> (not res!349816) (not e!321330))))

(assert (=> b!557818 (= res!349816 (= lt!253353 (Found!5314 j!142)))))

(assert (=> b!557818 (= lt!253353 (seekEntryOrOpen!0 (select (arr!16868 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!557818 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17388 0))(
  ( (Unit!17389) )
))
(declare-fun lt!253352 () Unit!17388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17388)

(assert (=> b!557818 (= lt!253352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557819 () Bool)

(declare-fun res!349826 () Bool)

(assert (=> b!557819 (=> (not res!349826) (not e!321329))))

(assert (=> b!557819 (= res!349826 (validKeyInArray!0 (select (arr!16868 a!3118) j!142)))))

(declare-fun b!557820 () Bool)

(declare-fun res!349819 () Bool)

(assert (=> b!557820 (=> (not res!349819) (not e!321328))))

(declare-datatypes ((List!10987 0))(
  ( (Nil!10984) (Cons!10983 (h!11977 (_ BitVec 64)) (t!17206 List!10987)) )
))
(declare-fun arrayNoDuplicates!0 (array!35125 (_ BitVec 32) List!10987) Bool)

(assert (=> b!557820 (= res!349819 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10984))))

(declare-fun b!557821 () Bool)

(assert (=> b!557821 (= e!321330 e!321325)))

(declare-fun res!349817 () Bool)

(assert (=> b!557821 (=> res!349817 e!321325)))

(get-info :version)

(assert (=> b!557821 (= res!349817 (or (undefined!6126 lt!253354) (not ((_ is Intermediate!5314) lt!253354)) (= (select (arr!16868 a!3118) (index!23485 lt!253354)) (select (arr!16868 a!3118) j!142)) (= (select (arr!16868 a!3118) (index!23485 lt!253354)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!51062 res!349824) b!557816))

(assert (= (and b!557816 res!349820) b!557819))

(assert (= (and b!557819 res!349826) b!557814))

(assert (= (and b!557814 res!349823) b!557812))

(assert (= (and b!557812 res!349825) b!557817))

(assert (= (and b!557817 res!349818) b!557811))

(assert (= (and b!557811 res!349822) b!557820))

(assert (= (and b!557820 res!349819) b!557813))

(assert (= (and b!557813 res!349821) b!557818))

(assert (= (and b!557818 res!349816) b!557821))

(assert (= (and b!557821 (not res!349817)) b!557815))

(declare-fun m!535217 () Bool)

(assert (=> b!557821 m!535217))

(declare-fun m!535219 () Bool)

(assert (=> b!557821 m!535219))

(declare-fun m!535221 () Bool)

(assert (=> b!557812 m!535221))

(declare-fun m!535223 () Bool)

(assert (=> b!557817 m!535223))

(assert (=> b!557813 m!535219))

(declare-fun m!535225 () Bool)

(assert (=> b!557813 m!535225))

(declare-fun m!535227 () Bool)

(assert (=> b!557813 m!535227))

(declare-fun m!535229 () Bool)

(assert (=> b!557813 m!535229))

(assert (=> b!557813 m!535219))

(assert (=> b!557813 m!535227))

(declare-fun m!535231 () Bool)

(assert (=> b!557813 m!535231))

(assert (=> b!557813 m!535219))

(declare-fun m!535233 () Bool)

(assert (=> b!557813 m!535233))

(assert (=> b!557813 m!535227))

(declare-fun m!535235 () Bool)

(assert (=> b!557813 m!535235))

(declare-fun m!535237 () Bool)

(assert (=> b!557811 m!535237))

(declare-fun m!535239 () Bool)

(assert (=> start!51062 m!535239))

(declare-fun m!535241 () Bool)

(assert (=> start!51062 m!535241))

(assert (=> b!557819 m!535219))

(assert (=> b!557819 m!535219))

(declare-fun m!535243 () Bool)

(assert (=> b!557819 m!535243))

(assert (=> b!557815 m!535219))

(assert (=> b!557815 m!535219))

(declare-fun m!535245 () Bool)

(assert (=> b!557815 m!535245))

(declare-fun m!535247 () Bool)

(assert (=> b!557814 m!535247))

(assert (=> b!557818 m!535219))

(assert (=> b!557818 m!535219))

(declare-fun m!535249 () Bool)

(assert (=> b!557818 m!535249))

(declare-fun m!535251 () Bool)

(assert (=> b!557818 m!535251))

(declare-fun m!535253 () Bool)

(assert (=> b!557818 m!535253))

(declare-fun m!535255 () Bool)

(assert (=> b!557820 m!535255))

(check-sat (not b!557812) (not b!557811) (not b!557820) (not b!557819) (not b!557814) (not b!557817) (not b!557815) (not start!51062) (not b!557813) (not b!557818))
(check-sat)
