; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32708 () Bool)

(assert start!32708)

(declare-fun b!326856 () Bool)

(declare-fun res!180034 () Bool)

(declare-fun e!201058 () Bool)

(assert (=> b!326856 (=> (not res!180034) (not e!201058))))

(declare-datatypes ((array!16749 0))(
  ( (array!16750 (arr!7929 (Array (_ BitVec 32) (_ BitVec 64))) (size!8282 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16749)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16749 (_ BitVec 32)) Bool)

(assert (=> b!326856 (= res!180034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326857 () Bool)

(declare-fun res!180040 () Bool)

(assert (=> b!326857 (=> (not res!180040) (not e!201058))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326857 (= res!180040 (validKeyInArray!0 k0!2497))))

(declare-fun b!326858 () Bool)

(declare-fun e!201057 () Bool)

(assert (=> b!326858 (= e!201058 e!201057)))

(declare-fun res!180038 () Bool)

(assert (=> b!326858 (=> (not res!180038) (not e!201057))))

(declare-datatypes ((SeekEntryResult!3059 0))(
  ( (MissingZero!3059 (index!14412 (_ BitVec 32))) (Found!3059 (index!14413 (_ BitVec 32))) (Intermediate!3059 (undefined!3871 Bool) (index!14414 (_ BitVec 32)) (x!32668 (_ BitVec 32))) (Undefined!3059) (MissingVacant!3059 (index!14415 (_ BitVec 32))) )
))
(declare-fun lt!157229 () SeekEntryResult!3059)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16749 (_ BitVec 32)) SeekEntryResult!3059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326858 (= res!180038 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157229))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326858 (= lt!157229 (Intermediate!3059 false resIndex!58 resX!58))))

(declare-fun b!326859 () Bool)

(declare-fun res!180041 () Bool)

(assert (=> b!326859 (=> (not res!180041) (not e!201057))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326859 (= res!180041 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7929 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!180036 () Bool)

(assert (=> start!32708 (=> (not res!180036) (not e!201058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32708 (= res!180036 (validMask!0 mask!3777))))

(assert (=> start!32708 e!201058))

(declare-fun array_inv!5901 (array!16749) Bool)

(assert (=> start!32708 (array_inv!5901 a!3305)))

(assert (=> start!32708 true))

(declare-fun b!326860 () Bool)

(assert (=> b!326860 (= e!201057 false)))

(declare-datatypes ((Unit!10130 0))(
  ( (Unit!10131) )
))
(declare-fun lt!157228 () Unit!10130)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16749 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10130)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326860 (= lt!157228 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326861 () Bool)

(declare-fun res!180035 () Bool)

(assert (=> b!326861 (=> (not res!180035) (not e!201057))))

(assert (=> b!326861 (= res!180035 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157229))))

(declare-fun b!326862 () Bool)

(declare-fun res!180039 () Bool)

(assert (=> b!326862 (=> (not res!180039) (not e!201057))))

(assert (=> b!326862 (= res!180039 (and (= (select (arr!7929 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8282 a!3305))))))

(declare-fun b!326863 () Bool)

(declare-fun res!180037 () Bool)

(assert (=> b!326863 (=> (not res!180037) (not e!201058))))

(declare-fun arrayContainsKey!0 (array!16749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326863 (= res!180037 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326864 () Bool)

(declare-fun res!180042 () Bool)

(assert (=> b!326864 (=> (not res!180042) (not e!201058))))

(assert (=> b!326864 (= res!180042 (and (= (size!8282 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8282 a!3305))))))

(declare-fun b!326865 () Bool)

(declare-fun res!180033 () Bool)

(assert (=> b!326865 (=> (not res!180033) (not e!201058))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16749 (_ BitVec 32)) SeekEntryResult!3059)

(assert (=> b!326865 (= res!180033 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3059 i!1250)))))

(assert (= (and start!32708 res!180036) b!326864))

(assert (= (and b!326864 res!180042) b!326857))

(assert (= (and b!326857 res!180040) b!326863))

(assert (= (and b!326863 res!180037) b!326865))

(assert (= (and b!326865 res!180033) b!326856))

(assert (= (and b!326856 res!180034) b!326858))

(assert (= (and b!326858 res!180038) b!326862))

(assert (= (and b!326862 res!180039) b!326861))

(assert (= (and b!326861 res!180035) b!326859))

(assert (= (and b!326859 res!180041) b!326860))

(declare-fun m!332857 () Bool)

(assert (=> b!326865 m!332857))

(declare-fun m!332859 () Bool)

(assert (=> b!326858 m!332859))

(assert (=> b!326858 m!332859))

(declare-fun m!332861 () Bool)

(assert (=> b!326858 m!332861))

(declare-fun m!332863 () Bool)

(assert (=> b!326857 m!332863))

(declare-fun m!332865 () Bool)

(assert (=> b!326859 m!332865))

(declare-fun m!332867 () Bool)

(assert (=> b!326860 m!332867))

(assert (=> b!326860 m!332867))

(declare-fun m!332869 () Bool)

(assert (=> b!326860 m!332869))

(declare-fun m!332871 () Bool)

(assert (=> start!32708 m!332871))

(declare-fun m!332873 () Bool)

(assert (=> start!32708 m!332873))

(declare-fun m!332875 () Bool)

(assert (=> b!326856 m!332875))

(declare-fun m!332877 () Bool)

(assert (=> b!326862 m!332877))

(declare-fun m!332879 () Bool)

(assert (=> b!326861 m!332879))

(declare-fun m!332881 () Bool)

(assert (=> b!326863 m!332881))

(check-sat (not b!326856) (not b!326863) (not b!326857) (not b!326860) (not b!326858) (not b!326861) (not start!32708) (not b!326865))
(check-sat)
