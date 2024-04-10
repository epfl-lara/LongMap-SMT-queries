; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29180 () Bool)

(assert start!29180)

(declare-fun b!296110 () Bool)

(declare-fun res!155921 () Bool)

(declare-fun e!187153 () Bool)

(assert (=> b!296110 (=> (not res!155921) (not e!187153))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296110 (= res!155921 (validKeyInArray!0 k!2524))))

(declare-fun b!296111 () Bool)

(declare-fun e!187155 () Bool)

(assert (=> b!296111 (= e!187153 e!187155)))

(declare-fun res!155918 () Bool)

(assert (=> b!296111 (=> (not res!155918) (not e!187155))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146970 () Bool)

(declare-datatypes ((SeekEntryResult!2251 0))(
  ( (MissingZero!2251 (index!11174 (_ BitVec 32))) (Found!2251 (index!11175 (_ BitVec 32))) (Intermediate!2251 (undefined!3063 Bool) (index!11176 (_ BitVec 32)) (x!29383 (_ BitVec 32))) (Undefined!2251) (MissingVacant!2251 (index!11177 (_ BitVec 32))) )
))
(declare-fun lt!146971 () SeekEntryResult!2251)

(assert (=> b!296111 (= res!155918 (or lt!146970 (= lt!146971 (MissingVacant!2251 i!1256))))))

(assert (=> b!296111 (= lt!146970 (= lt!146971 (MissingZero!2251 i!1256)))))

(declare-datatypes ((array!14983 0))(
  ( (array!14984 (arr!7102 (Array (_ BitVec 32) (_ BitVec 64))) (size!7454 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14983)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14983 (_ BitVec 32)) SeekEntryResult!2251)

(assert (=> b!296111 (= lt!146971 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296112 () Bool)

(declare-fun e!187152 () Bool)

(declare-fun lt!146973 () SeekEntryResult!2251)

(assert (=> b!296112 (= e!187152 (not (= lt!146973 (Intermediate!2251 false (index!11176 lt!146973) (x!29383 lt!146973)))))))

(assert (=> b!296112 (and (= (select (arr!7102 a!3312) (index!11176 lt!146973)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11176 lt!146973) i!1256))))

(declare-fun b!296113 () Bool)

(declare-fun res!155919 () Bool)

(assert (=> b!296113 (=> (not res!155919) (not e!187155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14983 (_ BitVec 32)) Bool)

(assert (=> b!296113 (= res!155919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296114 () Bool)

(declare-fun res!155920 () Bool)

(assert (=> b!296114 (=> (not res!155920) (not e!187153))))

(declare-fun arrayContainsKey!0 (array!14983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296114 (= res!155920 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155924 () Bool)

(assert (=> start!29180 (=> (not res!155924) (not e!187153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29180 (= res!155924 (validMask!0 mask!3809))))

(assert (=> start!29180 e!187153))

(assert (=> start!29180 true))

(declare-fun array_inv!5065 (array!14983) Bool)

(assert (=> start!29180 (array_inv!5065 a!3312)))

(declare-fun b!296115 () Bool)

(declare-fun e!187156 () Bool)

(assert (=> b!296115 (= e!187155 e!187156)))

(declare-fun res!155922 () Bool)

(assert (=> b!296115 (=> (not res!155922) (not e!187156))))

(assert (=> b!296115 (= res!155922 lt!146970)))

(declare-fun lt!146969 () SeekEntryResult!2251)

(declare-fun lt!146968 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14983 (_ BitVec 32)) SeekEntryResult!2251)

(assert (=> b!296115 (= lt!146969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146968 k!2524 (array!14984 (store (arr!7102 a!3312) i!1256 k!2524) (size!7454 a!3312)) mask!3809))))

(assert (=> b!296115 (= lt!146973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146968 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296115 (= lt!146968 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296116 () Bool)

(declare-fun res!155925 () Bool)

(assert (=> b!296116 (=> (not res!155925) (not e!187153))))

(assert (=> b!296116 (= res!155925 (and (= (size!7454 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7454 a!3312))))))

(declare-fun b!296117 () Bool)

(assert (=> b!296117 (= e!187156 e!187152)))

(declare-fun res!155923 () Bool)

(assert (=> b!296117 (=> (not res!155923) (not e!187152))))

(declare-fun lt!146972 () Bool)

(assert (=> b!296117 (= res!155923 (and (or lt!146972 (not (undefined!3063 lt!146973))) (or lt!146972 (not (= (select (arr!7102 a!3312) (index!11176 lt!146973)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146972 (not (= (select (arr!7102 a!3312) (index!11176 lt!146973)) k!2524))) (not lt!146972)))))

(assert (=> b!296117 (= lt!146972 (not (is-Intermediate!2251 lt!146973)))))

(assert (= (and start!29180 res!155924) b!296116))

(assert (= (and b!296116 res!155925) b!296110))

(assert (= (and b!296110 res!155921) b!296114))

(assert (= (and b!296114 res!155920) b!296111))

(assert (= (and b!296111 res!155918) b!296113))

(assert (= (and b!296113 res!155919) b!296115))

(assert (= (and b!296115 res!155922) b!296117))

(assert (= (and b!296117 res!155923) b!296112))

(declare-fun m!309161 () Bool)

(assert (=> b!296117 m!309161))

(declare-fun m!309163 () Bool)

(assert (=> b!296114 m!309163))

(declare-fun m!309165 () Bool)

(assert (=> b!296110 m!309165))

(declare-fun m!309167 () Bool)

(assert (=> b!296115 m!309167))

(declare-fun m!309169 () Bool)

(assert (=> b!296115 m!309169))

(declare-fun m!309171 () Bool)

(assert (=> b!296115 m!309171))

(declare-fun m!309173 () Bool)

(assert (=> b!296115 m!309173))

(declare-fun m!309175 () Bool)

(assert (=> b!296111 m!309175))

(declare-fun m!309177 () Bool)

(assert (=> b!296113 m!309177))

(assert (=> b!296112 m!309161))

(declare-fun m!309179 () Bool)

(assert (=> start!29180 m!309179))

(declare-fun m!309181 () Bool)

(assert (=> start!29180 m!309181))

(push 1)

