; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52428 () Bool)

(assert start!52428)

(declare-fun b!572309 () Bool)

(declare-fun e!329198 () Bool)

(assert (=> b!572309 (= e!329198 (not true))))

(declare-fun e!329202 () Bool)

(assert (=> b!572309 e!329202))

(declare-fun res!361817 () Bool)

(assert (=> b!572309 (=> (not res!361817) (not e!329202))))

(declare-datatypes ((SeekEntryResult!5650 0))(
  ( (MissingZero!5650 (index!24827 (_ BitVec 32))) (Found!5650 (index!24828 (_ BitVec 32))) (Intermediate!5650 (undefined!6462 Bool) (index!24829 (_ BitVec 32)) (x!53695 (_ BitVec 32))) (Undefined!5650) (MissingVacant!5650 (index!24830 (_ BitVec 32))) )
))
(declare-fun lt!261153 () SeekEntryResult!5650)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572309 (= res!361817 (= lt!261153 (Found!5650 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35825 0))(
  ( (array!35826 (arr!17201 (Array (_ BitVec 32) (_ BitVec 64))) (size!17565 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35825)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35825 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!572309 (= lt!261153 (seekEntryOrOpen!0 (select (arr!17201 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35825 (_ BitVec 32)) Bool)

(assert (=> b!572309 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18002 0))(
  ( (Unit!18003) )
))
(declare-fun lt!261151 () Unit!18002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18002)

(assert (=> b!572309 (= lt!261151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!361826 () Bool)

(declare-fun e!329196 () Bool)

(assert (=> start!52428 (=> (not res!361826) (not e!329196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52428 (= res!361826 (validMask!0 mask!3119))))

(assert (=> start!52428 e!329196))

(assert (=> start!52428 true))

(declare-fun array_inv!12997 (array!35825) Bool)

(assert (=> start!52428 (array_inv!12997 a!3118)))

(declare-fun b!572310 () Bool)

(declare-fun e!329199 () Bool)

(assert (=> b!572310 (= e!329202 e!329199)))

(declare-fun res!361818 () Bool)

(assert (=> b!572310 (=> res!361818 e!329199)))

(declare-fun lt!261154 () SeekEntryResult!5650)

(assert (=> b!572310 (= res!361818 (or (undefined!6462 lt!261154) (not (is-Intermediate!5650 lt!261154))))))

(declare-fun b!572311 () Bool)

(declare-fun res!361823 () Bool)

(assert (=> b!572311 (=> (not res!361823) (not e!329196))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572311 (= res!361823 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572312 () Bool)

(declare-fun res!361825 () Bool)

(declare-fun e!329201 () Bool)

(assert (=> b!572312 (=> (not res!361825) (not e!329201))))

(declare-datatypes ((List!11281 0))(
  ( (Nil!11278) (Cons!11277 (h!12304 (_ BitVec 64)) (t!17509 List!11281)) )
))
(declare-fun arrayNoDuplicates!0 (array!35825 (_ BitVec 32) List!11281) Bool)

(assert (=> b!572312 (= res!361825 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11278))))

(declare-fun b!572313 () Bool)

(declare-fun res!361819 () Bool)

(assert (=> b!572313 (=> (not res!361819) (not e!329196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572313 (= res!361819 (validKeyInArray!0 (select (arr!17201 a!3118) j!142)))))

(declare-fun b!572314 () Bool)

(declare-fun res!361821 () Bool)

(assert (=> b!572314 (=> (not res!361821) (not e!329196))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572314 (= res!361821 (and (= (size!17565 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17565 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17565 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572315 () Bool)

(assert (=> b!572315 (= e!329196 e!329201)))

(declare-fun res!361822 () Bool)

(assert (=> b!572315 (=> (not res!361822) (not e!329201))))

(declare-fun lt!261150 () SeekEntryResult!5650)

(assert (=> b!572315 (= res!361822 (or (= lt!261150 (MissingZero!5650 i!1132)) (= lt!261150 (MissingVacant!5650 i!1132))))))

(assert (=> b!572315 (= lt!261150 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572316 () Bool)

(declare-fun res!361820 () Bool)

(assert (=> b!572316 (=> (not res!361820) (not e!329201))))

(assert (=> b!572316 (= res!361820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572317 () Bool)

(declare-fun res!361828 () Bool)

(assert (=> b!572317 (=> (not res!361828) (not e!329196))))

(assert (=> b!572317 (= res!361828 (validKeyInArray!0 k!1914))))

(declare-fun lt!261149 () (_ BitVec 64))

(declare-fun lt!261152 () array!35825)

(declare-fun e!329197 () Bool)

(declare-fun b!572318 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35825 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!572318 (= e!329197 (= (seekEntryOrOpen!0 lt!261149 lt!261152 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53695 lt!261154) (index!24829 lt!261154) (index!24829 lt!261154) lt!261149 lt!261152 mask!3119)))))

(declare-fun b!572319 () Bool)

(declare-fun e!329200 () Bool)

(assert (=> b!572319 (= e!329200 e!329197)))

(declare-fun res!361824 () Bool)

(assert (=> b!572319 (=> (not res!361824) (not e!329197))))

(assert (=> b!572319 (= res!361824 (= lt!261153 (seekKeyOrZeroReturnVacant!0 (x!53695 lt!261154) (index!24829 lt!261154) (index!24829 lt!261154) (select (arr!17201 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572320 () Bool)

(assert (=> b!572320 (= e!329201 e!329198)))

(declare-fun res!361829 () Bool)

(assert (=> b!572320 (=> (not res!361829) (not e!329198))))

(declare-fun lt!261146 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35825 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!572320 (= res!361829 (= lt!261154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261146 lt!261149 lt!261152 mask!3119)))))

(declare-fun lt!261147 () (_ BitVec 32))

(assert (=> b!572320 (= lt!261154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261147 (select (arr!17201 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572320 (= lt!261146 (toIndex!0 lt!261149 mask!3119))))

(assert (=> b!572320 (= lt!261149 (select (store (arr!17201 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572320 (= lt!261147 (toIndex!0 (select (arr!17201 a!3118) j!142) mask!3119))))

(assert (=> b!572320 (= lt!261152 (array!35826 (store (arr!17201 a!3118) i!1132 k!1914) (size!17565 a!3118)))))

(declare-fun b!572321 () Bool)

(assert (=> b!572321 (= e!329199 e!329200)))

(declare-fun res!361827 () Bool)

(assert (=> b!572321 (=> res!361827 e!329200)))

(declare-fun lt!261148 () (_ BitVec 64))

(assert (=> b!572321 (= res!361827 (or (= lt!261148 (select (arr!17201 a!3118) j!142)) (= lt!261148 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572321 (= lt!261148 (select (arr!17201 a!3118) (index!24829 lt!261154)))))

(assert (= (and start!52428 res!361826) b!572314))

(assert (= (and b!572314 res!361821) b!572313))

(assert (= (and b!572313 res!361819) b!572317))

(assert (= (and b!572317 res!361828) b!572311))

(assert (= (and b!572311 res!361823) b!572315))

(assert (= (and b!572315 res!361822) b!572316))

(assert (= (and b!572316 res!361820) b!572312))

(assert (= (and b!572312 res!361825) b!572320))

(assert (= (and b!572320 res!361829) b!572309))

(assert (= (and b!572309 res!361817) b!572310))

(assert (= (and b!572310 (not res!361818)) b!572321))

(assert (= (and b!572321 (not res!361827)) b!572319))

(assert (= (and b!572319 res!361824) b!572318))

(declare-fun m!551269 () Bool)

(assert (=> b!572313 m!551269))

(assert (=> b!572313 m!551269))

(declare-fun m!551271 () Bool)

(assert (=> b!572313 m!551271))

(declare-fun m!551273 () Bool)

(assert (=> b!572315 m!551273))

(assert (=> b!572309 m!551269))

(assert (=> b!572309 m!551269))

(declare-fun m!551275 () Bool)

(assert (=> b!572309 m!551275))

(declare-fun m!551277 () Bool)

(assert (=> b!572309 m!551277))

(declare-fun m!551279 () Bool)

(assert (=> b!572309 m!551279))

(assert (=> b!572320 m!551269))

(declare-fun m!551281 () Bool)

(assert (=> b!572320 m!551281))

(assert (=> b!572320 m!551269))

(declare-fun m!551283 () Bool)

(assert (=> b!572320 m!551283))

(assert (=> b!572320 m!551269))

(declare-fun m!551285 () Bool)

(assert (=> b!572320 m!551285))

(declare-fun m!551287 () Bool)

(assert (=> b!572320 m!551287))

(declare-fun m!551289 () Bool)

(assert (=> b!572320 m!551289))

(declare-fun m!551291 () Bool)

(assert (=> b!572320 m!551291))

(declare-fun m!551293 () Bool)

(assert (=> b!572312 m!551293))

(declare-fun m!551295 () Bool)

(assert (=> b!572317 m!551295))

(declare-fun m!551297 () Bool)

(assert (=> b!572316 m!551297))

(assert (=> b!572319 m!551269))

(assert (=> b!572319 m!551269))

(declare-fun m!551299 () Bool)

(assert (=> b!572319 m!551299))

(declare-fun m!551301 () Bool)

(assert (=> start!52428 m!551301))

(declare-fun m!551303 () Bool)

(assert (=> start!52428 m!551303))

(assert (=> b!572321 m!551269))

(declare-fun m!551305 () Bool)

(assert (=> b!572321 m!551305))

(declare-fun m!551307 () Bool)

(assert (=> b!572311 m!551307))

(declare-fun m!551309 () Bool)

(assert (=> b!572318 m!551309))

(declare-fun m!551311 () Bool)

(assert (=> b!572318 m!551311))

(push 1)

