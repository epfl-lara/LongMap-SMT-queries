; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31920 () Bool)

(assert start!31920)

(declare-fun res!173400 () Bool)

(declare-fun e!198067 () Bool)

(assert (=> start!31920 (=> (not res!173400) (not e!198067))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31920 (= res!173400 (validMask!0 mask!3709))))

(assert (=> start!31920 e!198067))

(declare-datatypes ((array!16244 0))(
  ( (array!16245 (arr!7686 (Array (_ BitVec 32) (_ BitVec 64))) (size!8039 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16244)

(declare-fun array_inv!5658 (array!16244) Bool)

(assert (=> start!31920 (array_inv!5658 a!3293)))

(assert (=> start!31920 true))

(declare-fun b!318864 () Bool)

(declare-fun e!198069 () Bool)

(assert (=> b!318864 (= e!198067 e!198069)))

(declare-fun res!173397 () Bool)

(assert (=> b!318864 (=> (not res!173397) (not e!198069))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2825 0))(
  ( (MissingZero!2825 (index!13476 (_ BitVec 32))) (Found!2825 (index!13477 (_ BitVec 32))) (Intermediate!2825 (undefined!3637 Bool) (index!13478 (_ BitVec 32)) (x!31750 (_ BitVec 32))) (Undefined!2825) (MissingVacant!2825 (index!13479 (_ BitVec 32))) )
))
(declare-fun lt!155430 () SeekEntryResult!2825)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16244 (_ BitVec 32)) SeekEntryResult!2825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318864 (= res!173397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155430))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318864 (= lt!155430 (Intermediate!2825 false resIndex!52 resX!52))))

(declare-fun b!318865 () Bool)

(declare-fun e!198068 () Bool)

(declare-fun e!198071 () Bool)

(assert (=> b!318865 (= e!198068 (not e!198071))))

(declare-fun res!173399 () Bool)

(assert (=> b!318865 (=> res!173399 e!198071)))

(declare-fun lt!155431 () SeekEntryResult!2825)

(declare-fun lt!155425 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318865 (= res!173399 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155425 #b00000000000000000000000000000000) (bvsge lt!155425 (size!8039 a!3293)) (not (= lt!155431 lt!155430))))))

(declare-fun lt!155427 () SeekEntryResult!2825)

(declare-fun lt!155426 () SeekEntryResult!2825)

(assert (=> b!318865 (= lt!155427 lt!155426)))

(declare-fun lt!155428 () array!16244)

(assert (=> b!318865 (= lt!155426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155425 k0!2441 lt!155428 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318865 (= lt!155427 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155428 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318865 (= lt!155428 (array!16245 (store (arr!7686 a!3293) i!1240 k0!2441) (size!8039 a!3293)))))

(declare-fun lt!155429 () SeekEntryResult!2825)

(assert (=> b!318865 (= lt!155429 lt!155431)))

(assert (=> b!318865 (= lt!155431 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155425 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318865 (= lt!155425 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318866 () Bool)

(declare-fun res!173394 () Bool)

(assert (=> b!318866 (=> (not res!173394) (not e!198067))))

(declare-fun arrayContainsKey!0 (array!16244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318866 (= res!173394 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318867 () Bool)

(declare-fun res!173401 () Bool)

(assert (=> b!318867 (=> (not res!173401) (not e!198067))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16244 (_ BitVec 32)) SeekEntryResult!2825)

(assert (=> b!318867 (= res!173401 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2825 i!1240)))))

(declare-fun b!318868 () Bool)

(declare-fun res!173402 () Bool)

(assert (=> b!318868 (=> (not res!173402) (not e!198067))))

(assert (=> b!318868 (= res!173402 (and (= (size!8039 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8039 a!3293))))))

(declare-fun b!318869 () Bool)

(assert (=> b!318869 (= e!198069 e!198068)))

(declare-fun res!173396 () Bool)

(assert (=> b!318869 (=> (not res!173396) (not e!198068))))

(assert (=> b!318869 (= res!173396 (and (= lt!155429 lt!155430) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7686 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318869 (= lt!155429 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318870 () Bool)

(declare-fun res!173398 () Bool)

(assert (=> b!318870 (=> (not res!173398) (not e!198067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16244 (_ BitVec 32)) Bool)

(assert (=> b!318870 (= res!173398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318871 () Bool)

(declare-fun res!173403 () Bool)

(assert (=> b!318871 (=> (not res!173403) (not e!198067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318871 (= res!173403 (validKeyInArray!0 k0!2441))))

(declare-fun b!318872 () Bool)

(assert (=> b!318872 (= e!198071 true)))

(assert (=> b!318872 (= lt!155426 lt!155431)))

(declare-datatypes ((Unit!9764 0))(
  ( (Unit!9765) )
))
(declare-fun lt!155432 () Unit!9764)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9764)

(assert (=> b!318872 (= lt!155432 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155425 resIndex!52 resX!52 mask!3709))))

(declare-fun b!318873 () Bool)

(declare-fun res!173395 () Bool)

(assert (=> b!318873 (=> (not res!173395) (not e!198069))))

(assert (=> b!318873 (= res!173395 (and (= (select (arr!7686 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8039 a!3293))))))

(assert (= (and start!31920 res!173400) b!318868))

(assert (= (and b!318868 res!173402) b!318871))

(assert (= (and b!318871 res!173403) b!318866))

(assert (= (and b!318866 res!173394) b!318867))

(assert (= (and b!318867 res!173401) b!318870))

(assert (= (and b!318870 res!173398) b!318864))

(assert (= (and b!318864 res!173397) b!318873))

(assert (= (and b!318873 res!173395) b!318869))

(assert (= (and b!318869 res!173396) b!318865))

(assert (= (and b!318865 (not res!173399)) b!318872))

(declare-fun m!327013 () Bool)

(assert (=> b!318872 m!327013))

(declare-fun m!327015 () Bool)

(assert (=> b!318873 m!327015))

(declare-fun m!327017 () Bool)

(assert (=> b!318865 m!327017))

(declare-fun m!327019 () Bool)

(assert (=> b!318865 m!327019))

(declare-fun m!327021 () Bool)

(assert (=> b!318865 m!327021))

(declare-fun m!327023 () Bool)

(assert (=> b!318865 m!327023))

(declare-fun m!327025 () Bool)

(assert (=> b!318865 m!327025))

(declare-fun m!327027 () Bool)

(assert (=> b!318864 m!327027))

(assert (=> b!318864 m!327027))

(declare-fun m!327029 () Bool)

(assert (=> b!318864 m!327029))

(declare-fun m!327031 () Bool)

(assert (=> b!318870 m!327031))

(declare-fun m!327033 () Bool)

(assert (=> b!318869 m!327033))

(declare-fun m!327035 () Bool)

(assert (=> b!318869 m!327035))

(declare-fun m!327037 () Bool)

(assert (=> b!318867 m!327037))

(declare-fun m!327039 () Bool)

(assert (=> b!318866 m!327039))

(declare-fun m!327041 () Bool)

(assert (=> b!318871 m!327041))

(declare-fun m!327043 () Bool)

(assert (=> start!31920 m!327043))

(declare-fun m!327045 () Bool)

(assert (=> start!31920 m!327045))

(check-sat (not b!318869) (not b!318865) (not b!318867) (not b!318866) (not b!318871) (not start!31920) (not b!318872) (not b!318870) (not b!318864))
(check-sat)
