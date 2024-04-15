; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33062 () Bool)

(assert start!33062)

(declare-fun b!328924 () Bool)

(declare-fun res!181257 () Bool)

(declare-fun e!202085 () Bool)

(assert (=> b!328924 (=> (not res!181257) (not e!202085))))

(declare-datatypes ((array!16827 0))(
  ( (array!16828 (arr!7959 (Array (_ BitVec 32) (_ BitVec 64))) (size!8312 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16827)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16827 (_ BitVec 32)) Bool)

(assert (=> b!328924 (= res!181257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328925 () Bool)

(declare-fun res!181256 () Bool)

(assert (=> b!328925 (=> (not res!181256) (not e!202085))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328925 (= res!181256 (validKeyInArray!0 k0!2497))))

(declare-fun b!328926 () Bool)

(declare-fun res!181263 () Bool)

(assert (=> b!328926 (=> (not res!181263) (not e!202085))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3089 0))(
  ( (MissingZero!3089 (index!14532 (_ BitVec 32))) (Found!3089 (index!14533 (_ BitVec 32))) (Intermediate!3089 (undefined!3901 Bool) (index!14534 (_ BitVec 32)) (x!32817 (_ BitVec 32))) (Undefined!3089) (MissingVacant!3089 (index!14535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16827 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!328926 (= res!181263 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3089 i!1250)))))

(declare-fun b!328927 () Bool)

(declare-fun e!202086 () Bool)

(declare-fun e!202088 () Bool)

(assert (=> b!328927 (= e!202086 e!202088)))

(declare-fun res!181255 () Bool)

(assert (=> b!328927 (=> (not res!181255) (not e!202088))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!157921 () SeekEntryResult!3089)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!157922 () SeekEntryResult!3089)

(assert (=> b!328927 (= res!181255 (and (= lt!157921 lt!157922) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7959 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7959 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7959 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16827 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!328927 (= lt!157921 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!328928 () Bool)

(assert (=> b!328928 (= e!202085 e!202086)))

(declare-fun res!181259 () Bool)

(assert (=> b!328928 (=> (not res!181259) (not e!202086))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328928 (= res!181259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157922))))

(assert (=> b!328928 (= lt!157922 (Intermediate!3089 false resIndex!58 resX!58))))

(declare-fun res!181258 () Bool)

(assert (=> start!33062 (=> (not res!181258) (not e!202085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33062 (= res!181258 (validMask!0 mask!3777))))

(assert (=> start!33062 e!202085))

(declare-fun array_inv!5931 (array!16827) Bool)

(assert (=> start!33062 (array_inv!5931 a!3305)))

(assert (=> start!33062 true))

(declare-fun b!328929 () Bool)

(declare-fun res!181260 () Bool)

(assert (=> b!328929 (=> (not res!181260) (not e!202085))))

(declare-fun arrayContainsKey!0 (array!16827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328929 (= res!181260 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328930 () Bool)

(assert (=> b!328930 (= e!202088 (not false))))

(assert (=> b!328930 (= lt!157921 (Intermediate!3089 false index!1840 resX!58))))

(declare-fun b!328931 () Bool)

(declare-fun res!181262 () Bool)

(assert (=> b!328931 (=> (not res!181262) (not e!202085))))

(assert (=> b!328931 (= res!181262 (and (= (size!8312 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8312 a!3305))))))

(declare-fun b!328932 () Bool)

(declare-fun res!181261 () Bool)

(assert (=> b!328932 (=> (not res!181261) (not e!202086))))

(assert (=> b!328932 (= res!181261 (and (= (select (arr!7959 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8312 a!3305))))))

(assert (= (and start!33062 res!181258) b!328931))

(assert (= (and b!328931 res!181262) b!328925))

(assert (= (and b!328925 res!181256) b!328929))

(assert (= (and b!328929 res!181260) b!328926))

(assert (= (and b!328926 res!181263) b!328924))

(assert (= (and b!328924 res!181257) b!328928))

(assert (= (and b!328928 res!181259) b!328932))

(assert (= (and b!328932 res!181261) b!328927))

(assert (= (and b!328927 res!181255) b!328930))

(declare-fun m!334195 () Bool)

(assert (=> start!33062 m!334195))

(declare-fun m!334197 () Bool)

(assert (=> start!33062 m!334197))

(declare-fun m!334199 () Bool)

(assert (=> b!328926 m!334199))

(declare-fun m!334201 () Bool)

(assert (=> b!328928 m!334201))

(assert (=> b!328928 m!334201))

(declare-fun m!334203 () Bool)

(assert (=> b!328928 m!334203))

(declare-fun m!334205 () Bool)

(assert (=> b!328925 m!334205))

(declare-fun m!334207 () Bool)

(assert (=> b!328929 m!334207))

(declare-fun m!334209 () Bool)

(assert (=> b!328932 m!334209))

(declare-fun m!334211 () Bool)

(assert (=> b!328924 m!334211))

(declare-fun m!334213 () Bool)

(assert (=> b!328927 m!334213))

(declare-fun m!334215 () Bool)

(assert (=> b!328927 m!334215))

(check-sat (not start!33062) (not b!328926) (not b!328925) (not b!328927) (not b!328924) (not b!328929) (not b!328928))
(check-sat)
