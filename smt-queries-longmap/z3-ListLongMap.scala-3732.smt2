; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51388 () Bool)

(assert start!51388)

(declare-fun b!561257 () Bool)

(declare-fun e!323410 () Bool)

(declare-fun e!323413 () Bool)

(assert (=> b!561257 (= e!323410 e!323413)))

(declare-fun res!352419 () Bool)

(assert (=> b!561257 (=> (not res!352419) (not e!323413))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5376 0))(
  ( (MissingZero!5376 (index!23731 (_ BitVec 32))) (Found!5376 (index!23732 (_ BitVec 32))) (Intermediate!5376 (undefined!6188 Bool) (index!23733 (_ BitVec 32)) (x!52639 (_ BitVec 32))) (Undefined!5376) (MissingVacant!5376 (index!23734 (_ BitVec 32))) )
))
(declare-fun lt!255388 () SeekEntryResult!5376)

(declare-fun lt!255391 () SeekEntryResult!5376)

(declare-datatypes ((array!35253 0))(
  ( (array!35254 (arr!16927 (Array (_ BitVec 32) (_ BitVec 64))) (size!17291 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35253)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35253 (_ BitVec 32)) SeekEntryResult!5376)

(assert (=> b!561257 (= res!352419 (= lt!255388 (seekKeyOrZeroReturnVacant!0 (x!52639 lt!255391) (index!23733 lt!255391) (index!23733 lt!255391) (select (arr!16927 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561258 () Bool)

(declare-fun res!352415 () Bool)

(declare-fun e!323409 () Bool)

(assert (=> b!561258 (=> (not res!352415) (not e!323409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35253 (_ BitVec 32)) Bool)

(assert (=> b!561258 (= res!352415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561259 () Bool)

(declare-fun res!352418 () Bool)

(assert (=> b!561259 (=> (not res!352418) (not e!323409))))

(declare-datatypes ((List!11007 0))(
  ( (Nil!11004) (Cons!11003 (h!12006 (_ BitVec 64)) (t!17235 List!11007)) )
))
(declare-fun arrayNoDuplicates!0 (array!35253 (_ BitVec 32) List!11007) Bool)

(assert (=> b!561259 (= res!352418 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11004))))

(declare-fun b!561260 () Bool)

(declare-fun res!352412 () Bool)

(declare-fun e!323408 () Bool)

(assert (=> b!561260 (=> (not res!352412) (not e!323408))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561260 (= res!352412 (validKeyInArray!0 k0!1914))))

(declare-fun res!352411 () Bool)

(assert (=> start!51388 (=> (not res!352411) (not e!323408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51388 (= res!352411 (validMask!0 mask!3119))))

(assert (=> start!51388 e!323408))

(assert (=> start!51388 true))

(declare-fun array_inv!12723 (array!35253) Bool)

(assert (=> start!51388 (array_inv!12723 a!3118)))

(declare-fun b!561261 () Bool)

(declare-fun res!352410 () Bool)

(assert (=> b!561261 (=> (not res!352410) (not e!323408))))

(assert (=> b!561261 (= res!352410 (validKeyInArray!0 (select (arr!16927 a!3118) j!142)))))

(declare-fun b!561262 () Bool)

(declare-fun e!323414 () Bool)

(assert (=> b!561262 (= e!323414 (not true))))

(declare-fun e!323411 () Bool)

(assert (=> b!561262 e!323411))

(declare-fun res!352416 () Bool)

(assert (=> b!561262 (=> (not res!352416) (not e!323411))))

(assert (=> b!561262 (= res!352416 (= lt!255388 (Found!5376 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35253 (_ BitVec 32)) SeekEntryResult!5376)

(assert (=> b!561262 (= lt!255388 (seekEntryOrOpen!0 (select (arr!16927 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561262 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17526 0))(
  ( (Unit!17527) )
))
(declare-fun lt!255386 () Unit!17526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17526)

(assert (=> b!561262 (= lt!255386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561263 () Bool)

(assert (=> b!561263 (= e!323408 e!323409)))

(declare-fun res!352409 () Bool)

(assert (=> b!561263 (=> (not res!352409) (not e!323409))))

(declare-fun lt!255387 () SeekEntryResult!5376)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561263 (= res!352409 (or (= lt!255387 (MissingZero!5376 i!1132)) (= lt!255387 (MissingVacant!5376 i!1132))))))

(assert (=> b!561263 (= lt!255387 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561264 () Bool)

(declare-fun e!323415 () Bool)

(assert (=> b!561264 (= e!323411 e!323415)))

(declare-fun res!352414 () Bool)

(assert (=> b!561264 (=> res!352414 e!323415)))

(get-info :version)

(assert (=> b!561264 (= res!352414 (or (undefined!6188 lt!255391) (not ((_ is Intermediate!5376) lt!255391))))))

(declare-fun b!561265 () Bool)

(assert (=> b!561265 (= e!323409 e!323414)))

(declare-fun res!352413 () Bool)

(assert (=> b!561265 (=> (not res!352413) (not e!323414))))

(declare-fun lt!255383 () (_ BitVec 64))

(declare-fun lt!255385 () array!35253)

(declare-fun lt!255389 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35253 (_ BitVec 32)) SeekEntryResult!5376)

(assert (=> b!561265 (= res!352413 (= lt!255391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255389 lt!255383 lt!255385 mask!3119)))))

(declare-fun lt!255384 () (_ BitVec 32))

(assert (=> b!561265 (= lt!255391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255384 (select (arr!16927 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561265 (= lt!255389 (toIndex!0 lt!255383 mask!3119))))

(assert (=> b!561265 (= lt!255383 (select (store (arr!16927 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561265 (= lt!255384 (toIndex!0 (select (arr!16927 a!3118) j!142) mask!3119))))

(assert (=> b!561265 (= lt!255385 (array!35254 (store (arr!16927 a!3118) i!1132 k0!1914) (size!17291 a!3118)))))

(declare-fun b!561266 () Bool)

(declare-fun res!352417 () Bool)

(assert (=> b!561266 (=> (not res!352417) (not e!323408))))

(declare-fun arrayContainsKey!0 (array!35253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561266 (= res!352417 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561267 () Bool)

(declare-fun res!352420 () Bool)

(assert (=> b!561267 (=> (not res!352420) (not e!323408))))

(assert (=> b!561267 (= res!352420 (and (= (size!17291 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17291 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17291 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561268 () Bool)

(assert (=> b!561268 (= e!323413 (= (seekEntryOrOpen!0 lt!255383 lt!255385 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52639 lt!255391) (index!23733 lt!255391) (index!23733 lt!255391) lt!255383 lt!255385 mask!3119)))))

(declare-fun b!561269 () Bool)

(assert (=> b!561269 (= e!323415 e!323410)))

(declare-fun res!352421 () Bool)

(assert (=> b!561269 (=> res!352421 e!323410)))

(declare-fun lt!255390 () (_ BitVec 64))

(assert (=> b!561269 (= res!352421 (or (= lt!255390 (select (arr!16927 a!3118) j!142)) (= lt!255390 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561269 (= lt!255390 (select (arr!16927 a!3118) (index!23733 lt!255391)))))

(assert (= (and start!51388 res!352411) b!561267))

(assert (= (and b!561267 res!352420) b!561261))

(assert (= (and b!561261 res!352410) b!561260))

(assert (= (and b!561260 res!352412) b!561266))

(assert (= (and b!561266 res!352417) b!561263))

(assert (= (and b!561263 res!352409) b!561258))

(assert (= (and b!561258 res!352415) b!561259))

(assert (= (and b!561259 res!352418) b!561265))

(assert (= (and b!561265 res!352413) b!561262))

(assert (= (and b!561262 res!352416) b!561264))

(assert (= (and b!561264 (not res!352414)) b!561269))

(assert (= (and b!561269 (not res!352421)) b!561257))

(assert (= (and b!561257 res!352419) b!561268))

(declare-fun m!539129 () Bool)

(assert (=> b!561262 m!539129))

(assert (=> b!561262 m!539129))

(declare-fun m!539131 () Bool)

(assert (=> b!561262 m!539131))

(declare-fun m!539133 () Bool)

(assert (=> b!561262 m!539133))

(declare-fun m!539135 () Bool)

(assert (=> b!561262 m!539135))

(declare-fun m!539137 () Bool)

(assert (=> b!561263 m!539137))

(declare-fun m!539139 () Bool)

(assert (=> start!51388 m!539139))

(declare-fun m!539141 () Bool)

(assert (=> start!51388 m!539141))

(declare-fun m!539143 () Bool)

(assert (=> b!561268 m!539143))

(declare-fun m!539145 () Bool)

(assert (=> b!561268 m!539145))

(assert (=> b!561261 m!539129))

(assert (=> b!561261 m!539129))

(declare-fun m!539147 () Bool)

(assert (=> b!561261 m!539147))

(assert (=> b!561257 m!539129))

(assert (=> b!561257 m!539129))

(declare-fun m!539149 () Bool)

(assert (=> b!561257 m!539149))

(declare-fun m!539151 () Bool)

(assert (=> b!561260 m!539151))

(declare-fun m!539153 () Bool)

(assert (=> b!561258 m!539153))

(declare-fun m!539155 () Bool)

(assert (=> b!561266 m!539155))

(assert (=> b!561269 m!539129))

(declare-fun m!539157 () Bool)

(assert (=> b!561269 m!539157))

(assert (=> b!561265 m!539129))

(declare-fun m!539159 () Bool)

(assert (=> b!561265 m!539159))

(assert (=> b!561265 m!539129))

(declare-fun m!539161 () Bool)

(assert (=> b!561265 m!539161))

(declare-fun m!539163 () Bool)

(assert (=> b!561265 m!539163))

(declare-fun m!539165 () Bool)

(assert (=> b!561265 m!539165))

(declare-fun m!539167 () Bool)

(assert (=> b!561265 m!539167))

(assert (=> b!561265 m!539129))

(declare-fun m!539169 () Bool)

(assert (=> b!561265 m!539169))

(declare-fun m!539171 () Bool)

(assert (=> b!561259 m!539171))

(check-sat (not b!561259) (not b!561268) (not b!561260) (not b!561263) (not b!561266) (not b!561257) (not b!561265) (not start!51388) (not b!561258) (not b!561262) (not b!561261))
(check-sat)
