; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51440 () Bool)

(assert start!51440)

(declare-fun b!562223 () Bool)

(declare-fun res!353524 () Bool)

(declare-fun e!323993 () Bool)

(assert (=> b!562223 (=> (not res!353524) (not e!323993))))

(declare-datatypes ((array!35314 0))(
  ( (array!35315 (arr!16958 (Array (_ BitVec 32) (_ BitVec 64))) (size!17323 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35314)

(declare-datatypes ((List!11077 0))(
  ( (Nil!11074) (Cons!11073 (h!12076 (_ BitVec 64)) (t!17296 List!11077)) )
))
(declare-fun arrayNoDuplicates!0 (array!35314 (_ BitVec 32) List!11077) Bool)

(assert (=> b!562223 (= res!353524 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11074))))

(declare-fun b!562224 () Bool)

(declare-fun e!323994 () Bool)

(declare-fun e!323997 () Bool)

(assert (=> b!562224 (= e!323994 e!323997)))

(declare-fun res!353521 () Bool)

(assert (=> b!562224 (=> res!353521 e!323997)))

(declare-datatypes ((SeekEntryResult!5404 0))(
  ( (MissingZero!5404 (index!23843 (_ BitVec 32))) (Found!5404 (index!23844 (_ BitVec 32))) (Intermediate!5404 (undefined!6216 Bool) (index!23845 (_ BitVec 32)) (x!52750 (_ BitVec 32))) (Undefined!5404) (MissingVacant!5404 (index!23846 (_ BitVec 32))) )
))
(declare-fun lt!256070 () SeekEntryResult!5404)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!256075 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!256068 () SeekEntryResult!5404)

(declare-fun lt!256074 () SeekEntryResult!5404)

(assert (=> b!562224 (= res!353521 (or (bvslt (index!23845 lt!256074) #b00000000000000000000000000000000) (bvsge (index!23845 lt!256074) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52750 lt!256074) #b01111111111111111111111111111110) (bvslt (x!52750 lt!256074) #b00000000000000000000000000000000) (not (= lt!256075 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16958 a!3118) i!1132 k0!1914) (index!23845 lt!256074)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256068 lt!256070))))))

(declare-fun lt!256081 () SeekEntryResult!5404)

(declare-fun lt!256073 () SeekEntryResult!5404)

(assert (=> b!562224 (= lt!256081 lt!256073)))

(declare-fun lt!256077 () array!35314)

(declare-fun lt!256069 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35314 (_ BitVec 32)) SeekEntryResult!5404)

(assert (=> b!562224 (= lt!256073 (seekKeyOrZeroReturnVacant!0 (x!52750 lt!256074) (index!23845 lt!256074) (index!23845 lt!256074) lt!256069 lt!256077 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35314 (_ BitVec 32)) SeekEntryResult!5404)

(assert (=> b!562224 (= lt!256081 (seekEntryOrOpen!0 lt!256069 lt!256077 mask!3119))))

(declare-fun lt!256072 () SeekEntryResult!5404)

(assert (=> b!562224 (= lt!256072 lt!256068)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562224 (= lt!256068 (seekKeyOrZeroReturnVacant!0 (x!52750 lt!256074) (index!23845 lt!256074) (index!23845 lt!256074) (select (arr!16958 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562225 () Bool)

(declare-fun e!323992 () Bool)

(declare-fun e!323991 () Bool)

(assert (=> b!562225 (= e!323992 (not e!323991))))

(declare-fun res!353523 () Bool)

(assert (=> b!562225 (=> res!353523 e!323991)))

(get-info :version)

(assert (=> b!562225 (= res!353523 (or (undefined!6216 lt!256074) (not ((_ is Intermediate!5404) lt!256074))))))

(assert (=> b!562225 (= lt!256072 lt!256070)))

(assert (=> b!562225 (= lt!256070 (Found!5404 j!142))))

(assert (=> b!562225 (= lt!256072 (seekEntryOrOpen!0 (select (arr!16958 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35314 (_ BitVec 32)) Bool)

(assert (=> b!562225 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17568 0))(
  ( (Unit!17569) )
))
(declare-fun lt!256076 () Unit!17568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17568)

(assert (=> b!562225 (= lt!256076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562226 () Bool)

(declare-fun res!353525 () Bool)

(declare-fun e!323995 () Bool)

(assert (=> b!562226 (=> (not res!353525) (not e!323995))))

(declare-fun arrayContainsKey!0 (array!35314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562226 (= res!353525 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!353517 () Bool)

(assert (=> start!51440 (=> (not res!353517) (not e!323995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51440 (= res!353517 (validMask!0 mask!3119))))

(assert (=> start!51440 e!323995))

(assert (=> start!51440 true))

(declare-fun array_inv!12841 (array!35314) Bool)

(assert (=> start!51440 (array_inv!12841 a!3118)))

(declare-fun b!562227 () Bool)

(assert (=> b!562227 (= e!323997 (bvsge mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!562227 (= lt!256068 lt!256073)))

(declare-fun lt!256080 () Unit!17568)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17568)

(assert (=> b!562227 (= lt!256080 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52750 lt!256074) (index!23845 lt!256074) (index!23845 lt!256074) mask!3119))))

(declare-fun b!562228 () Bool)

(assert (=> b!562228 (= e!323993 e!323992)))

(declare-fun res!353522 () Bool)

(assert (=> b!562228 (=> (not res!353522) (not e!323992))))

(declare-fun lt!256079 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35314 (_ BitVec 32)) SeekEntryResult!5404)

(assert (=> b!562228 (= res!353522 (= lt!256074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256079 lt!256069 lt!256077 mask!3119)))))

(declare-fun lt!256071 () (_ BitVec 32))

(assert (=> b!562228 (= lt!256074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256071 (select (arr!16958 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562228 (= lt!256079 (toIndex!0 lt!256069 mask!3119))))

(assert (=> b!562228 (= lt!256069 (select (store (arr!16958 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562228 (= lt!256071 (toIndex!0 (select (arr!16958 a!3118) j!142) mask!3119))))

(assert (=> b!562228 (= lt!256077 (array!35315 (store (arr!16958 a!3118) i!1132 k0!1914) (size!17323 a!3118)))))

(declare-fun b!562229 () Bool)

(declare-fun res!353526 () Bool)

(assert (=> b!562229 (=> (not res!353526) (not e!323995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562229 (= res!353526 (validKeyInArray!0 k0!1914))))

(declare-fun b!562230 () Bool)

(declare-fun res!353518 () Bool)

(assert (=> b!562230 (=> (not res!353518) (not e!323993))))

(assert (=> b!562230 (= res!353518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562231 () Bool)

(assert (=> b!562231 (= e!323995 e!323993)))

(declare-fun res!353520 () Bool)

(assert (=> b!562231 (=> (not res!353520) (not e!323993))))

(declare-fun lt!256078 () SeekEntryResult!5404)

(assert (=> b!562231 (= res!353520 (or (= lt!256078 (MissingZero!5404 i!1132)) (= lt!256078 (MissingVacant!5404 i!1132))))))

(assert (=> b!562231 (= lt!256078 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562232 () Bool)

(declare-fun res!353519 () Bool)

(assert (=> b!562232 (=> (not res!353519) (not e!323995))))

(assert (=> b!562232 (= res!353519 (and (= (size!17323 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17323 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17323 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562233 () Bool)

(assert (=> b!562233 (= e!323991 e!323994)))

(declare-fun res!353527 () Bool)

(assert (=> b!562233 (=> res!353527 e!323994)))

(assert (=> b!562233 (= res!353527 (or (= lt!256075 (select (arr!16958 a!3118) j!142)) (= lt!256075 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562233 (= lt!256075 (select (arr!16958 a!3118) (index!23845 lt!256074)))))

(declare-fun b!562234 () Bool)

(declare-fun res!353528 () Bool)

(assert (=> b!562234 (=> (not res!353528) (not e!323995))))

(assert (=> b!562234 (= res!353528 (validKeyInArray!0 (select (arr!16958 a!3118) j!142)))))

(assert (= (and start!51440 res!353517) b!562232))

(assert (= (and b!562232 res!353519) b!562234))

(assert (= (and b!562234 res!353528) b!562229))

(assert (= (and b!562229 res!353526) b!562226))

(assert (= (and b!562226 res!353525) b!562231))

(assert (= (and b!562231 res!353520) b!562230))

(assert (= (and b!562230 res!353518) b!562223))

(assert (= (and b!562223 res!353524) b!562228))

(assert (= (and b!562228 res!353522) b!562225))

(assert (= (and b!562225 (not res!353523)) b!562233))

(assert (= (and b!562233 (not res!353527)) b!562224))

(assert (= (and b!562224 (not res!353521)) b!562227))

(declare-fun m!539777 () Bool)

(assert (=> start!51440 m!539777))

(declare-fun m!539779 () Bool)

(assert (=> start!51440 m!539779))

(declare-fun m!539781 () Bool)

(assert (=> b!562225 m!539781))

(assert (=> b!562225 m!539781))

(declare-fun m!539783 () Bool)

(assert (=> b!562225 m!539783))

(declare-fun m!539785 () Bool)

(assert (=> b!562225 m!539785))

(declare-fun m!539787 () Bool)

(assert (=> b!562225 m!539787))

(declare-fun m!539789 () Bool)

(assert (=> b!562229 m!539789))

(declare-fun m!539791 () Bool)

(assert (=> b!562230 m!539791))

(assert (=> b!562228 m!539781))

(declare-fun m!539793 () Bool)

(assert (=> b!562228 m!539793))

(declare-fun m!539795 () Bool)

(assert (=> b!562228 m!539795))

(declare-fun m!539797 () Bool)

(assert (=> b!562228 m!539797))

(declare-fun m!539799 () Bool)

(assert (=> b!562228 m!539799))

(assert (=> b!562228 m!539781))

(declare-fun m!539801 () Bool)

(assert (=> b!562228 m!539801))

(assert (=> b!562228 m!539781))

(declare-fun m!539803 () Bool)

(assert (=> b!562228 m!539803))

(declare-fun m!539805 () Bool)

(assert (=> b!562231 m!539805))

(assert (=> b!562233 m!539781))

(declare-fun m!539807 () Bool)

(assert (=> b!562233 m!539807))

(assert (=> b!562224 m!539781))

(assert (=> b!562224 m!539797))

(declare-fun m!539809 () Bool)

(assert (=> b!562224 m!539809))

(declare-fun m!539811 () Bool)

(assert (=> b!562224 m!539811))

(declare-fun m!539813 () Bool)

(assert (=> b!562224 m!539813))

(assert (=> b!562224 m!539781))

(declare-fun m!539815 () Bool)

(assert (=> b!562224 m!539815))

(declare-fun m!539817 () Bool)

(assert (=> b!562223 m!539817))

(declare-fun m!539819 () Bool)

(assert (=> b!562227 m!539819))

(assert (=> b!562234 m!539781))

(assert (=> b!562234 m!539781))

(declare-fun m!539821 () Bool)

(assert (=> b!562234 m!539821))

(declare-fun m!539823 () Bool)

(assert (=> b!562226 m!539823))

(check-sat (not b!562229) (not b!562231) (not start!51440) (not b!562228) (not b!562227) (not b!562234) (not b!562223) (not b!562226) (not b!562230) (not b!562225) (not b!562224))
(check-sat)
