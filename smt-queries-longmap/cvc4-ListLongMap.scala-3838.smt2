; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52782 () Bool)

(assert start!52782)

(declare-fun b!575553 () Bool)

(declare-fun e!331165 () Bool)

(declare-fun e!331166 () Bool)

(assert (=> b!575553 (= e!331165 e!331166)))

(declare-fun res!363975 () Bool)

(assert (=> b!575553 (=> res!363975 e!331166)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!263169 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5695 0))(
  ( (MissingZero!5695 (index!25007 (_ BitVec 32))) (Found!5695 (index!25008 (_ BitVec 32))) (Intermediate!5695 (undefined!6507 Bool) (index!25009 (_ BitVec 32)) (x!53896 (_ BitVec 32))) (Undefined!5695) (MissingVacant!5695 (index!25010 (_ BitVec 32))) )
))
(declare-fun lt!263159 () SeekEntryResult!5695)

(declare-fun lt!263170 () SeekEntryResult!5695)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!263166 () SeekEntryResult!5695)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35927 0))(
  ( (array!35928 (arr!17246 (Array (_ BitVec 32) (_ BitVec 64))) (size!17610 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35927)

(assert (=> b!575553 (= res!363975 (or (bvslt (index!25009 lt!263159) #b00000000000000000000000000000000) (bvsge (index!25009 lt!263159) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53896 lt!263159) #b01111111111111111111111111111110) (bvslt (x!53896 lt!263159) #b00000000000000000000000000000000) (not (= lt!263169 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17246 a!3118) i!1132 k!1914) (index!25009 lt!263159)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263170 lt!263166))))))

(declare-fun lt!263167 () SeekEntryResult!5695)

(declare-fun lt!263158 () SeekEntryResult!5695)

(assert (=> b!575553 (= lt!263167 lt!263158)))

(declare-fun lt!263162 () (_ BitVec 64))

(declare-fun lt!263163 () array!35927)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35927 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!575553 (= lt!263158 (seekKeyOrZeroReturnVacant!0 (x!53896 lt!263159) (index!25009 lt!263159) (index!25009 lt!263159) lt!263162 lt!263163 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35927 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!575553 (= lt!263167 (seekEntryOrOpen!0 lt!263162 lt!263163 mask!3119))))

(declare-fun lt!263168 () SeekEntryResult!5695)

(assert (=> b!575553 (= lt!263168 lt!263170)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575553 (= lt!263170 (seekKeyOrZeroReturnVacant!0 (x!53896 lt!263159) (index!25009 lt!263159) (index!25009 lt!263159) (select (arr!17246 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575554 () Bool)

(declare-fun res!363971 () Bool)

(declare-fun e!331164 () Bool)

(assert (=> b!575554 (=> (not res!363971) (not e!331164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35927 (_ BitVec 32)) Bool)

(assert (=> b!575554 (= res!363971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575555 () Bool)

(declare-fun res!363979 () Bool)

(declare-fun e!331167 () Bool)

(assert (=> b!575555 (=> (not res!363979) (not e!331167))))

(assert (=> b!575555 (= res!363979 (and (= (size!17610 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17610 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17610 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575556 () Bool)

(declare-fun res!363974 () Bool)

(assert (=> b!575556 (=> (not res!363974) (not e!331167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575556 (= res!363974 (validKeyInArray!0 (select (arr!17246 a!3118) j!142)))))

(declare-fun b!575557 () Bool)

(declare-fun res!363969 () Bool)

(assert (=> b!575557 (=> (not res!363969) (not e!331167))))

(assert (=> b!575557 (= res!363969 (validKeyInArray!0 k!1914))))

(declare-fun b!575558 () Bool)

(declare-fun e!331169 () Bool)

(assert (=> b!575558 (= e!331164 e!331169)))

(declare-fun res!363970 () Bool)

(assert (=> b!575558 (=> (not res!363970) (not e!331169))))

(declare-fun lt!263164 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35927 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!575558 (= res!363970 (= lt!263159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263164 lt!263162 lt!263163 mask!3119)))))

(declare-fun lt!263157 () (_ BitVec 32))

(assert (=> b!575558 (= lt!263159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263157 (select (arr!17246 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575558 (= lt!263164 (toIndex!0 lt!263162 mask!3119))))

(assert (=> b!575558 (= lt!263162 (select (store (arr!17246 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575558 (= lt!263157 (toIndex!0 (select (arr!17246 a!3118) j!142) mask!3119))))

(assert (=> b!575558 (= lt!263163 (array!35928 (store (arr!17246 a!3118) i!1132 k!1914) (size!17610 a!3118)))))

(declare-fun res!363973 () Bool)

(assert (=> start!52782 (=> (not res!363973) (not e!331167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52782 (= res!363973 (validMask!0 mask!3119))))

(assert (=> start!52782 e!331167))

(assert (=> start!52782 true))

(declare-fun array_inv!13042 (array!35927) Bool)

(assert (=> start!52782 (array_inv!13042 a!3118)))

(declare-fun b!575559 () Bool)

(declare-fun e!331170 () Bool)

(assert (=> b!575559 (= e!331169 (not e!331170))))

(declare-fun res!363980 () Bool)

(assert (=> b!575559 (=> res!363980 e!331170)))

(assert (=> b!575559 (= res!363980 (or (undefined!6507 lt!263159) (not (is-Intermediate!5695 lt!263159))))))

(assert (=> b!575559 (= lt!263168 lt!263166)))

(assert (=> b!575559 (= lt!263166 (Found!5695 j!142))))

(assert (=> b!575559 (= lt!263168 (seekEntryOrOpen!0 (select (arr!17246 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575559 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18092 0))(
  ( (Unit!18093) )
))
(declare-fun lt!263160 () Unit!18092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18092)

(assert (=> b!575559 (= lt!263160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575560 () Bool)

(declare-fun res!363972 () Bool)

(assert (=> b!575560 (=> (not res!363972) (not e!331167))))

(declare-fun arrayContainsKey!0 (array!35927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575560 (= res!363972 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575561 () Bool)

(declare-fun res!363977 () Bool)

(assert (=> b!575561 (=> (not res!363977) (not e!331164))))

(declare-datatypes ((List!11326 0))(
  ( (Nil!11323) (Cons!11322 (h!12361 (_ BitVec 64)) (t!17554 List!11326)) )
))
(declare-fun arrayNoDuplicates!0 (array!35927 (_ BitVec 32) List!11326) Bool)

(assert (=> b!575561 (= res!363977 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11323))))

(declare-fun b!575562 () Bool)

(assert (=> b!575562 (= e!331166 true)))

(assert (=> b!575562 (= lt!263170 lt!263158)))

(declare-fun lt!263165 () Unit!18092)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35927 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18092)

(assert (=> b!575562 (= lt!263165 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53896 lt!263159) (index!25009 lt!263159) (index!25009 lt!263159) mask!3119))))

(declare-fun b!575563 () Bool)

(assert (=> b!575563 (= e!331170 e!331165)))

(declare-fun res!363978 () Bool)

(assert (=> b!575563 (=> res!363978 e!331165)))

(assert (=> b!575563 (= res!363978 (or (= lt!263169 (select (arr!17246 a!3118) j!142)) (= lt!263169 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575563 (= lt!263169 (select (arr!17246 a!3118) (index!25009 lt!263159)))))

(declare-fun b!575564 () Bool)

(assert (=> b!575564 (= e!331167 e!331164)))

(declare-fun res!363976 () Bool)

(assert (=> b!575564 (=> (not res!363976) (not e!331164))))

(declare-fun lt!263161 () SeekEntryResult!5695)

(assert (=> b!575564 (= res!363976 (or (= lt!263161 (MissingZero!5695 i!1132)) (= lt!263161 (MissingVacant!5695 i!1132))))))

(assert (=> b!575564 (= lt!263161 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52782 res!363973) b!575555))

(assert (= (and b!575555 res!363979) b!575556))

(assert (= (and b!575556 res!363974) b!575557))

(assert (= (and b!575557 res!363969) b!575560))

(assert (= (and b!575560 res!363972) b!575564))

(assert (= (and b!575564 res!363976) b!575554))

(assert (= (and b!575554 res!363971) b!575561))

(assert (= (and b!575561 res!363977) b!575558))

(assert (= (and b!575558 res!363970) b!575559))

(assert (= (and b!575559 (not res!363980)) b!575563))

(assert (= (and b!575563 (not res!363978)) b!575553))

(assert (= (and b!575553 (not res!363975)) b!575562))

(declare-fun m!554445 () Bool)

(assert (=> b!575556 m!554445))

(assert (=> b!575556 m!554445))

(declare-fun m!554447 () Bool)

(assert (=> b!575556 m!554447))

(declare-fun m!554449 () Bool)

(assert (=> b!575564 m!554449))

(declare-fun m!554451 () Bool)

(assert (=> b!575558 m!554451))

(assert (=> b!575558 m!554445))

(declare-fun m!554453 () Bool)

(assert (=> b!575558 m!554453))

(declare-fun m!554455 () Bool)

(assert (=> b!575558 m!554455))

(declare-fun m!554457 () Bool)

(assert (=> b!575558 m!554457))

(assert (=> b!575558 m!554445))

(declare-fun m!554459 () Bool)

(assert (=> b!575558 m!554459))

(assert (=> b!575558 m!554445))

(declare-fun m!554461 () Bool)

(assert (=> b!575558 m!554461))

(declare-fun m!554463 () Bool)

(assert (=> start!52782 m!554463))

(declare-fun m!554465 () Bool)

(assert (=> start!52782 m!554465))

(assert (=> b!575559 m!554445))

(assert (=> b!575559 m!554445))

(declare-fun m!554467 () Bool)

(assert (=> b!575559 m!554467))

(declare-fun m!554469 () Bool)

(assert (=> b!575559 m!554469))

(declare-fun m!554471 () Bool)

(assert (=> b!575559 m!554471))

(declare-fun m!554473 () Bool)

(assert (=> b!575560 m!554473))

(declare-fun m!554475 () Bool)

(assert (=> b!575554 m!554475))

(declare-fun m!554477 () Bool)

(assert (=> b!575561 m!554477))

(declare-fun m!554479 () Bool)

(assert (=> b!575562 m!554479))

(declare-fun m!554481 () Bool)

(assert (=> b!575553 m!554481))

(assert (=> b!575553 m!554445))

(declare-fun m!554483 () Bool)

(assert (=> b!575553 m!554483))

(declare-fun m!554485 () Bool)

(assert (=> b!575553 m!554485))

(assert (=> b!575553 m!554455))

(assert (=> b!575553 m!554445))

(declare-fun m!554487 () Bool)

(assert (=> b!575553 m!554487))

(declare-fun m!554489 () Bool)

(assert (=> b!575557 m!554489))

(assert (=> b!575563 m!554445))

(declare-fun m!554491 () Bool)

(assert (=> b!575563 m!554491))

(push 1)

