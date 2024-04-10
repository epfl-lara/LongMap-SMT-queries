; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29188 () Bool)

(assert start!29188)

(declare-fun b!296206 () Bool)

(declare-fun e!187216 () Bool)

(declare-fun e!187214 () Bool)

(assert (=> b!296206 (= e!187216 e!187214)))

(declare-fun res!156014 () Bool)

(assert (=> b!296206 (=> (not res!156014) (not e!187214))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147045 () Bool)

(declare-datatypes ((SeekEntryResult!2255 0))(
  ( (MissingZero!2255 (index!11190 (_ BitVec 32))) (Found!2255 (index!11191 (_ BitVec 32))) (Intermediate!2255 (undefined!3067 Bool) (index!11192 (_ BitVec 32)) (x!29403 (_ BitVec 32))) (Undefined!2255) (MissingVacant!2255 (index!11193 (_ BitVec 32))) )
))
(declare-fun lt!147042 () SeekEntryResult!2255)

(assert (=> b!296206 (= res!156014 (or lt!147045 (= lt!147042 (MissingVacant!2255 i!1256))))))

(assert (=> b!296206 (= lt!147045 (= lt!147042 (MissingZero!2255 i!1256)))))

(declare-datatypes ((array!14991 0))(
  ( (array!14992 (arr!7106 (Array (_ BitVec 32) (_ BitVec 64))) (size!7458 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14991)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14991 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!296206 (= lt!147042 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296207 () Bool)

(declare-fun e!187212 () Bool)

(assert (=> b!296207 (= e!187214 e!187212)))

(declare-fun res!156015 () Bool)

(assert (=> b!296207 (=> (not res!156015) (not e!187212))))

(assert (=> b!296207 (= res!156015 lt!147045)))

(declare-fun lt!147040 () (_ BitVec 32))

(declare-fun lt!147043 () SeekEntryResult!2255)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14991 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!296207 (= lt!147043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147040 k!2524 (array!14992 (store (arr!7106 a!3312) i!1256 k!2524) (size!7458 a!3312)) mask!3809))))

(declare-fun lt!147044 () SeekEntryResult!2255)

(assert (=> b!296207 (= lt!147044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147040 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296207 (= lt!147040 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296208 () Bool)

(declare-fun res!156016 () Bool)

(assert (=> b!296208 (=> (not res!156016) (not e!187216))))

(declare-fun arrayContainsKey!0 (array!14991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296208 (= res!156016 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296209 () Bool)

(declare-fun e!187215 () Bool)

(assert (=> b!296209 (= e!187212 e!187215)))

(declare-fun res!156019 () Bool)

(assert (=> b!296209 (=> (not res!156019) (not e!187215))))

(declare-fun lt!147041 () Bool)

(assert (=> b!296209 (= res!156019 (and (or lt!147041 (not (undefined!3067 lt!147044))) (or lt!147041 (not (= (select (arr!7106 a!3312) (index!11192 lt!147044)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147041 (not (= (select (arr!7106 a!3312) (index!11192 lt!147044)) k!2524))) (not lt!147041)))))

(assert (=> b!296209 (= lt!147041 (not (is-Intermediate!2255 lt!147044)))))

(declare-fun b!296210 () Bool)

(declare-fun res!156020 () Bool)

(assert (=> b!296210 (=> (not res!156020) (not e!187216))))

(assert (=> b!296210 (= res!156020 (and (= (size!7458 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7458 a!3312))))))

(declare-fun b!296211 () Bool)

(declare-fun res!156018 () Bool)

(assert (=> b!296211 (=> (not res!156018) (not e!187216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296211 (= res!156018 (validKeyInArray!0 k!2524))))

(declare-fun res!156017 () Bool)

(assert (=> start!29188 (=> (not res!156017) (not e!187216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29188 (= res!156017 (validMask!0 mask!3809))))

(assert (=> start!29188 e!187216))

(assert (=> start!29188 true))

(declare-fun array_inv!5069 (array!14991) Bool)

(assert (=> start!29188 (array_inv!5069 a!3312)))

(declare-fun b!296212 () Bool)

(declare-fun res!156021 () Bool)

(assert (=> b!296212 (=> (not res!156021) (not e!187214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14991 (_ BitVec 32)) Bool)

(assert (=> b!296212 (= res!156021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296213 () Bool)

(assert (=> b!296213 (= e!187215 (not true))))

(assert (=> b!296213 (and (= (select (arr!7106 a!3312) (index!11192 lt!147044)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11192 lt!147044) i!1256))))

(assert (= (and start!29188 res!156017) b!296210))

(assert (= (and b!296210 res!156020) b!296211))

(assert (= (and b!296211 res!156018) b!296208))

(assert (= (and b!296208 res!156016) b!296206))

(assert (= (and b!296206 res!156014) b!296212))

(assert (= (and b!296212 res!156021) b!296207))

(assert (= (and b!296207 res!156015) b!296209))

(assert (= (and b!296209 res!156019) b!296213))

(declare-fun m!309249 () Bool)

(assert (=> b!296211 m!309249))

(declare-fun m!309251 () Bool)

(assert (=> start!29188 m!309251))

(declare-fun m!309253 () Bool)

(assert (=> start!29188 m!309253))

(declare-fun m!309255 () Bool)

(assert (=> b!296206 m!309255))

(declare-fun m!309257 () Bool)

(assert (=> b!296209 m!309257))

(declare-fun m!309259 () Bool)

(assert (=> b!296212 m!309259))

(assert (=> b!296213 m!309257))

(declare-fun m!309261 () Bool)

(assert (=> b!296207 m!309261))

(declare-fun m!309263 () Bool)

(assert (=> b!296207 m!309263))

(declare-fun m!309265 () Bool)

(assert (=> b!296207 m!309265))

(declare-fun m!309267 () Bool)

(assert (=> b!296207 m!309267))

(declare-fun m!309269 () Bool)

(assert (=> b!296208 m!309269))

(push 1)

