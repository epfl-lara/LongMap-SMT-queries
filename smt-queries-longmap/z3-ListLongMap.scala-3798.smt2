; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52188 () Bool)

(assert start!52188)

(declare-fun res!359196 () Bool)

(declare-fun e!327549 () Bool)

(assert (=> start!52188 (=> (not res!359196) (not e!327549))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52188 (= res!359196 (validMask!0 mask!3119))))

(assert (=> start!52188 e!327549))

(assert (=> start!52188 true))

(declare-datatypes ((array!35658 0))(
  ( (array!35659 (arr!17119 (Array (_ BitVec 32) (_ BitVec 64))) (size!17483 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35658)

(declare-fun array_inv!12978 (array!35658) Bool)

(assert (=> start!52188 (array_inv!12978 a!3118)))

(declare-fun b!569276 () Bool)

(declare-fun e!327546 () Bool)

(declare-fun e!327547 () Bool)

(assert (=> b!569276 (= e!327546 e!327547)))

(declare-fun res!359195 () Bool)

(assert (=> b!569276 (=> (not res!359195) (not e!327547))))

(declare-datatypes ((SeekEntryResult!5524 0))(
  ( (MissingZero!5524 (index!24323 (_ BitVec 32))) (Found!5524 (index!24324 (_ BitVec 32))) (Intermediate!5524 (undefined!6336 Bool) (index!24325 (_ BitVec 32)) (x!53354 (_ BitVec 32))) (Undefined!5524) (MissingVacant!5524 (index!24326 (_ BitVec 32))) )
))
(declare-fun lt!259415 () SeekEntryResult!5524)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!259413 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35658 (_ BitVec 32)) SeekEntryResult!5524)

(assert (=> b!569276 (= res!359195 (= lt!259415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259413 (select (store (arr!17119 a!3118) i!1132 k0!1914) j!142) (array!35659 (store (arr!17119 a!3118) i!1132 k0!1914) (size!17483 a!3118)) mask!3119)))))

(declare-fun lt!259417 () (_ BitVec 32))

(assert (=> b!569276 (= lt!259415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259417 (select (arr!17119 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569276 (= lt!259413 (toIndex!0 (select (store (arr!17119 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569276 (= lt!259417 (toIndex!0 (select (arr!17119 a!3118) j!142) mask!3119))))

(declare-fun b!569277 () Bool)

(declare-fun res!359197 () Bool)

(assert (=> b!569277 (=> (not res!359197) (not e!327549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569277 (= res!359197 (validKeyInArray!0 (select (arr!17119 a!3118) j!142)))))

(declare-fun b!569278 () Bool)

(assert (=> b!569278 (= e!327549 e!327546)))

(declare-fun res!359194 () Bool)

(assert (=> b!569278 (=> (not res!359194) (not e!327546))))

(declare-fun lt!259414 () SeekEntryResult!5524)

(assert (=> b!569278 (= res!359194 (or (= lt!259414 (MissingZero!5524 i!1132)) (= lt!259414 (MissingVacant!5524 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35658 (_ BitVec 32)) SeekEntryResult!5524)

(assert (=> b!569278 (= lt!259414 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569279 () Bool)

(get-info :version)

(assert (=> b!569279 (= e!327547 (not (or (undefined!6336 lt!259415) (not ((_ is Intermediate!5524) lt!259415)) (= (select (arr!17119 a!3118) (index!24325 lt!259415)) (select (arr!17119 a!3118) j!142)) (not (= (select (arr!17119 a!3118) (index!24325 lt!259415)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17483 a!3118)))))))

(declare-fun lt!259412 () SeekEntryResult!5524)

(assert (=> b!569279 (and (= lt!259412 (Found!5524 j!142)) (or (undefined!6336 lt!259415) (not ((_ is Intermediate!5524) lt!259415)) (= (select (arr!17119 a!3118) (index!24325 lt!259415)) (select (arr!17119 a!3118) j!142)) (not (= (select (arr!17119 a!3118) (index!24325 lt!259415)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259412 (MissingZero!5524 (index!24325 lt!259415)))))))

(assert (=> b!569279 (= lt!259412 (seekEntryOrOpen!0 (select (arr!17119 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35658 (_ BitVec 32)) Bool)

(assert (=> b!569279 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17821 0))(
  ( (Unit!17822) )
))
(declare-fun lt!259416 () Unit!17821)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17821)

(assert (=> b!569279 (= lt!259416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569280 () Bool)

(declare-fun res!359191 () Bool)

(assert (=> b!569280 (=> (not res!359191) (not e!327549))))

(assert (=> b!569280 (= res!359191 (validKeyInArray!0 k0!1914))))

(declare-fun b!569281 () Bool)

(declare-fun res!359189 () Bool)

(assert (=> b!569281 (=> (not res!359189) (not e!327546))))

(declare-datatypes ((List!11106 0))(
  ( (Nil!11103) (Cons!11102 (h!12126 (_ BitVec 64)) (t!17326 List!11106)) )
))
(declare-fun arrayNoDuplicates!0 (array!35658 (_ BitVec 32) List!11106) Bool)

(assert (=> b!569281 (= res!359189 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11103))))

(declare-fun b!569282 () Bool)

(declare-fun res!359190 () Bool)

(assert (=> b!569282 (=> (not res!359190) (not e!327546))))

(assert (=> b!569282 (= res!359190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569283 () Bool)

(declare-fun res!359192 () Bool)

(assert (=> b!569283 (=> (not res!359192) (not e!327549))))

(declare-fun arrayContainsKey!0 (array!35658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569283 (= res!359192 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569284 () Bool)

(declare-fun res!359193 () Bool)

(assert (=> b!569284 (=> (not res!359193) (not e!327549))))

(assert (=> b!569284 (= res!359193 (and (= (size!17483 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17483 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17483 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52188 res!359196) b!569284))

(assert (= (and b!569284 res!359193) b!569277))

(assert (= (and b!569277 res!359197) b!569280))

(assert (= (and b!569280 res!359191) b!569283))

(assert (= (and b!569283 res!359192) b!569278))

(assert (= (and b!569278 res!359194) b!569282))

(assert (= (and b!569282 res!359190) b!569281))

(assert (= (and b!569281 res!359189) b!569276))

(assert (= (and b!569276 res!359195) b!569279))

(declare-fun m!547997 () Bool)

(assert (=> start!52188 m!547997))

(declare-fun m!547999 () Bool)

(assert (=> start!52188 m!547999))

(declare-fun m!548001 () Bool)

(assert (=> b!569279 m!548001))

(declare-fun m!548003 () Bool)

(assert (=> b!569279 m!548003))

(declare-fun m!548005 () Bool)

(assert (=> b!569279 m!548005))

(declare-fun m!548007 () Bool)

(assert (=> b!569279 m!548007))

(assert (=> b!569279 m!548001))

(declare-fun m!548009 () Bool)

(assert (=> b!569279 m!548009))

(declare-fun m!548011 () Bool)

(assert (=> b!569281 m!548011))

(declare-fun m!548013 () Bool)

(assert (=> b!569278 m!548013))

(declare-fun m!548015 () Bool)

(assert (=> b!569282 m!548015))

(assert (=> b!569277 m!548001))

(assert (=> b!569277 m!548001))

(declare-fun m!548017 () Bool)

(assert (=> b!569277 m!548017))

(assert (=> b!569276 m!548001))

(declare-fun m!548019 () Bool)

(assert (=> b!569276 m!548019))

(assert (=> b!569276 m!548001))

(declare-fun m!548021 () Bool)

(assert (=> b!569276 m!548021))

(declare-fun m!548023 () Bool)

(assert (=> b!569276 m!548023))

(declare-fun m!548025 () Bool)

(assert (=> b!569276 m!548025))

(assert (=> b!569276 m!548001))

(assert (=> b!569276 m!548023))

(declare-fun m!548027 () Bool)

(assert (=> b!569276 m!548027))

(assert (=> b!569276 m!548023))

(declare-fun m!548029 () Bool)

(assert (=> b!569276 m!548029))

(declare-fun m!548031 () Bool)

(assert (=> b!569280 m!548031))

(declare-fun m!548033 () Bool)

(assert (=> b!569283 m!548033))

(check-sat (not b!569279) (not b!569278) (not b!569283) (not b!569280) (not start!52188) (not b!569282) (not b!569276) (not b!569281) (not b!569277))
(check-sat)
