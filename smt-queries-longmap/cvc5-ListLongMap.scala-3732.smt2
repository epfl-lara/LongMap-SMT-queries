; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51386 () Bool)

(assert start!51386)

(declare-fun res!352377 () Bool)

(declare-fun e!323390 () Bool)

(assert (=> start!51386 (=> (not res!352377) (not e!323390))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51386 (= res!352377 (validMask!0 mask!3119))))

(assert (=> start!51386 e!323390))

(assert (=> start!51386 true))

(declare-datatypes ((array!35251 0))(
  ( (array!35252 (arr!16926 (Array (_ BitVec 32) (_ BitVec 64))) (size!17290 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35251)

(declare-fun array_inv!12722 (array!35251) Bool)

(assert (=> start!51386 (array_inv!12722 a!3118)))

(declare-fun b!561218 () Bool)

(declare-fun res!352372 () Bool)

(assert (=> b!561218 (=> (not res!352372) (not e!323390))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561218 (= res!352372 (validKeyInArray!0 (select (arr!16926 a!3118) j!142)))))

(declare-fun b!561219 () Bool)

(declare-fun res!352373 () Bool)

(declare-fun e!323386 () Bool)

(assert (=> b!561219 (=> (not res!352373) (not e!323386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35251 (_ BitVec 32)) Bool)

(assert (=> b!561219 (= res!352373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561220 () Bool)

(declare-fun lt!255356 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5375 0))(
  ( (MissingZero!5375 (index!23727 (_ BitVec 32))) (Found!5375 (index!23728 (_ BitVec 32))) (Intermediate!5375 (undefined!6187 Bool) (index!23729 (_ BitVec 32)) (x!52638 (_ BitVec 32))) (Undefined!5375) (MissingVacant!5375 (index!23730 (_ BitVec 32))) )
))
(declare-fun lt!255364 () SeekEntryResult!5375)

(declare-fun e!323391 () Bool)

(declare-fun lt!255361 () array!35251)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35251 (_ BitVec 32)) SeekEntryResult!5375)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35251 (_ BitVec 32)) SeekEntryResult!5375)

(assert (=> b!561220 (= e!323391 (= (seekEntryOrOpen!0 lt!255356 lt!255361 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52638 lt!255364) (index!23729 lt!255364) (index!23729 lt!255364) lt!255356 lt!255361 mask!3119)))))

(declare-fun b!561221 () Bool)

(declare-fun e!323389 () Bool)

(declare-fun e!323385 () Bool)

(assert (=> b!561221 (= e!323389 e!323385)))

(declare-fun res!352375 () Bool)

(assert (=> b!561221 (=> res!352375 e!323385)))

(declare-fun lt!255363 () (_ BitVec 64))

(assert (=> b!561221 (= res!352375 (or (= lt!255363 (select (arr!16926 a!3118) j!142)) (= lt!255363 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561221 (= lt!255363 (select (arr!16926 a!3118) (index!23729 lt!255364)))))

(declare-fun b!561222 () Bool)

(declare-fun e!323388 () Bool)

(assert (=> b!561222 (= e!323386 e!323388)))

(declare-fun res!352380 () Bool)

(assert (=> b!561222 (=> (not res!352380) (not e!323388))))

(declare-fun lt!255359 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35251 (_ BitVec 32)) SeekEntryResult!5375)

(assert (=> b!561222 (= res!352380 (= lt!255364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255359 lt!255356 lt!255361 mask!3119)))))

(declare-fun lt!255360 () (_ BitVec 32))

(assert (=> b!561222 (= lt!255364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255360 (select (arr!16926 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561222 (= lt!255359 (toIndex!0 lt!255356 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561222 (= lt!255356 (select (store (arr!16926 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561222 (= lt!255360 (toIndex!0 (select (arr!16926 a!3118) j!142) mask!3119))))

(assert (=> b!561222 (= lt!255361 (array!35252 (store (arr!16926 a!3118) i!1132 k!1914) (size!17290 a!3118)))))

(declare-fun b!561223 () Bool)

(declare-fun res!352376 () Bool)

(assert (=> b!561223 (=> (not res!352376) (not e!323390))))

(declare-fun arrayContainsKey!0 (array!35251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561223 (= res!352376 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561224 () Bool)

(declare-fun res!352370 () Bool)

(assert (=> b!561224 (=> (not res!352370) (not e!323390))))

(assert (=> b!561224 (= res!352370 (validKeyInArray!0 k!1914))))

(declare-fun b!561225 () Bool)

(declare-fun e!323387 () Bool)

(assert (=> b!561225 (= e!323387 e!323389)))

(declare-fun res!352381 () Bool)

(assert (=> b!561225 (=> res!352381 e!323389)))

(assert (=> b!561225 (= res!352381 (or (undefined!6187 lt!255364) (not (is-Intermediate!5375 lt!255364))))))

(declare-fun b!561226 () Bool)

(declare-fun res!352371 () Bool)

(assert (=> b!561226 (=> (not res!352371) (not e!323390))))

(assert (=> b!561226 (= res!352371 (and (= (size!17290 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17290 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17290 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561227 () Bool)

(assert (=> b!561227 (= e!323388 (not true))))

(assert (=> b!561227 e!323387))

(declare-fun res!352374 () Bool)

(assert (=> b!561227 (=> (not res!352374) (not e!323387))))

(declare-fun lt!255357 () SeekEntryResult!5375)

(assert (=> b!561227 (= res!352374 (= lt!255357 (Found!5375 j!142)))))

(assert (=> b!561227 (= lt!255357 (seekEntryOrOpen!0 (select (arr!16926 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561227 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17524 0))(
  ( (Unit!17525) )
))
(declare-fun lt!255358 () Unit!17524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17524)

(assert (=> b!561227 (= lt!255358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561228 () Bool)

(assert (=> b!561228 (= e!323390 e!323386)))

(declare-fun res!352378 () Bool)

(assert (=> b!561228 (=> (not res!352378) (not e!323386))))

(declare-fun lt!255362 () SeekEntryResult!5375)

(assert (=> b!561228 (= res!352378 (or (= lt!255362 (MissingZero!5375 i!1132)) (= lt!255362 (MissingVacant!5375 i!1132))))))

(assert (=> b!561228 (= lt!255362 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561229 () Bool)

(assert (=> b!561229 (= e!323385 e!323391)))

(declare-fun res!352379 () Bool)

(assert (=> b!561229 (=> (not res!352379) (not e!323391))))

(assert (=> b!561229 (= res!352379 (= lt!255357 (seekKeyOrZeroReturnVacant!0 (x!52638 lt!255364) (index!23729 lt!255364) (index!23729 lt!255364) (select (arr!16926 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561230 () Bool)

(declare-fun res!352382 () Bool)

(assert (=> b!561230 (=> (not res!352382) (not e!323386))))

(declare-datatypes ((List!11006 0))(
  ( (Nil!11003) (Cons!11002 (h!12005 (_ BitVec 64)) (t!17234 List!11006)) )
))
(declare-fun arrayNoDuplicates!0 (array!35251 (_ BitVec 32) List!11006) Bool)

(assert (=> b!561230 (= res!352382 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11003))))

(assert (= (and start!51386 res!352377) b!561226))

(assert (= (and b!561226 res!352371) b!561218))

(assert (= (and b!561218 res!352372) b!561224))

(assert (= (and b!561224 res!352370) b!561223))

(assert (= (and b!561223 res!352376) b!561228))

(assert (= (and b!561228 res!352378) b!561219))

(assert (= (and b!561219 res!352373) b!561230))

(assert (= (and b!561230 res!352382) b!561222))

(assert (= (and b!561222 res!352380) b!561227))

(assert (= (and b!561227 res!352374) b!561225))

(assert (= (and b!561225 (not res!352381)) b!561221))

(assert (= (and b!561221 (not res!352375)) b!561229))

(assert (= (and b!561229 res!352379) b!561220))

(declare-fun m!539085 () Bool)

(assert (=> b!561223 m!539085))

(declare-fun m!539087 () Bool)

(assert (=> start!51386 m!539087))

(declare-fun m!539089 () Bool)

(assert (=> start!51386 m!539089))

(declare-fun m!539091 () Bool)

(assert (=> b!561219 m!539091))

(declare-fun m!539093 () Bool)

(assert (=> b!561230 m!539093))

(declare-fun m!539095 () Bool)

(assert (=> b!561228 m!539095))

(declare-fun m!539097 () Bool)

(assert (=> b!561222 m!539097))

(declare-fun m!539099 () Bool)

(assert (=> b!561222 m!539099))

(declare-fun m!539101 () Bool)

(assert (=> b!561222 m!539101))

(assert (=> b!561222 m!539099))

(declare-fun m!539103 () Bool)

(assert (=> b!561222 m!539103))

(declare-fun m!539105 () Bool)

(assert (=> b!561222 m!539105))

(assert (=> b!561222 m!539099))

(declare-fun m!539107 () Bool)

(assert (=> b!561222 m!539107))

(declare-fun m!539109 () Bool)

(assert (=> b!561222 m!539109))

(declare-fun m!539111 () Bool)

(assert (=> b!561224 m!539111))

(assert (=> b!561229 m!539099))

(assert (=> b!561229 m!539099))

(declare-fun m!539113 () Bool)

(assert (=> b!561229 m!539113))

(assert (=> b!561218 m!539099))

(assert (=> b!561218 m!539099))

(declare-fun m!539115 () Bool)

(assert (=> b!561218 m!539115))

(assert (=> b!561227 m!539099))

(assert (=> b!561227 m!539099))

(declare-fun m!539117 () Bool)

(assert (=> b!561227 m!539117))

(declare-fun m!539119 () Bool)

(assert (=> b!561227 m!539119))

(declare-fun m!539121 () Bool)

(assert (=> b!561227 m!539121))

(declare-fun m!539123 () Bool)

(assert (=> b!561220 m!539123))

(declare-fun m!539125 () Bool)

(assert (=> b!561220 m!539125))

(assert (=> b!561221 m!539099))

(declare-fun m!539127 () Bool)

(assert (=> b!561221 m!539127))

(push 1)

