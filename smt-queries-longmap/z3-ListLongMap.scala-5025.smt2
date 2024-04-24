; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68828 () Bool)

(assert start!68828)

(declare-fun b!800085 () Bool)

(declare-fun res!544066 () Bool)

(declare-fun e!443794 () Bool)

(assert (=> b!800085 (=> (not res!544066) (not e!443794))))

(declare-datatypes ((array!43450 0))(
  ( (array!43451 (arr!20800 (Array (_ BitVec 32) (_ BitVec 64))) (size!21220 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43450)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43450 (_ BitVec 32)) Bool)

(assert (=> b!800085 (= res!544066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800086 () Bool)

(declare-fun res!544063 () Bool)

(assert (=> b!800086 (=> (not res!544063) (not e!443794))))

(declare-datatypes ((List!14670 0))(
  ( (Nil!14667) (Cons!14666 (h!15801 (_ BitVec 64)) (t!20977 List!14670)) )
))
(declare-fun arrayNoDuplicates!0 (array!43450 (_ BitVec 32) List!14670) Bool)

(assert (=> b!800086 (= res!544063 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14667))))

(declare-fun b!800088 () Bool)

(declare-fun e!443792 () Bool)

(declare-fun e!443789 () Bool)

(assert (=> b!800088 (= e!443792 e!443789)))

(declare-fun res!544062 () Bool)

(assert (=> b!800088 (=> (not res!544062) (not e!443789))))

(declare-datatypes ((SeekEntryResult!8347 0))(
  ( (MissingZero!8347 (index!35756 (_ BitVec 32))) (Found!8347 (index!35757 (_ BitVec 32))) (Intermediate!8347 (undefined!9159 Bool) (index!35758 (_ BitVec 32)) (x!66799 (_ BitVec 32))) (Undefined!8347) (MissingVacant!8347 (index!35759 (_ BitVec 32))) )
))
(declare-fun lt!357205 () SeekEntryResult!8347)

(declare-fun lt!357200 () SeekEntryResult!8347)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800088 (= res!544062 (and (= lt!357205 lt!357200) (= lt!357200 (Found!8347 j!153)) (not (= (select (arr!20800 a!3170) index!1236) (select (arr!20800 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43450 (_ BitVec 32)) SeekEntryResult!8347)

(assert (=> b!800088 (= lt!357200 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20800 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43450 (_ BitVec 32)) SeekEntryResult!8347)

(assert (=> b!800088 (= lt!357205 (seekEntryOrOpen!0 (select (arr!20800 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800089 () Bool)

(declare-fun res!544064 () Bool)

(assert (=> b!800089 (=> (not res!544064) (not e!443794))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800089 (= res!544064 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21220 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20800 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21220 a!3170)) (= (select (arr!20800 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800090 () Bool)

(declare-fun e!443793 () Bool)

(assert (=> b!800090 (= e!443789 e!443793)))

(declare-fun res!544059 () Bool)

(assert (=> b!800090 (=> (not res!544059) (not e!443793))))

(declare-fun lt!357204 () (_ BitVec 32))

(assert (=> b!800090 (= res!544059 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357204 #b00000000000000000000000000000000) (bvslt lt!357204 (size!21220 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800090 (= lt!357204 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800091 () Bool)

(declare-fun e!443791 () Bool)

(assert (=> b!800091 (= e!443791 e!443794)))

(declare-fun res!544058 () Bool)

(assert (=> b!800091 (=> (not res!544058) (not e!443794))))

(declare-fun lt!357202 () SeekEntryResult!8347)

(assert (=> b!800091 (= res!544058 (or (= lt!357202 (MissingZero!8347 i!1163)) (= lt!357202 (MissingVacant!8347 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!800091 (= lt!357202 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800092 () Bool)

(declare-fun res!544068 () Bool)

(assert (=> b!800092 (=> (not res!544068) (not e!443791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800092 (= res!544068 (validKeyInArray!0 (select (arr!20800 a!3170) j!153)))))

(declare-fun b!800093 () Bool)

(assert (=> b!800093 (= e!443794 e!443792)))

(declare-fun res!544056 () Bool)

(assert (=> b!800093 (=> (not res!544056) (not e!443792))))

(declare-fun lt!357201 () (_ BitVec 64))

(declare-fun lt!357206 () SeekEntryResult!8347)

(declare-fun lt!357199 () array!43450)

(assert (=> b!800093 (= res!544056 (= lt!357206 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357201 lt!357199 mask!3266)))))

(assert (=> b!800093 (= lt!357206 (seekEntryOrOpen!0 lt!357201 lt!357199 mask!3266))))

(assert (=> b!800093 (= lt!357201 (select (store (arr!20800 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800093 (= lt!357199 (array!43451 (store (arr!20800 a!3170) i!1163 k0!2044) (size!21220 a!3170)))))

(declare-fun b!800094 () Bool)

(declare-fun res!544057 () Bool)

(assert (=> b!800094 (=> (not res!544057) (not e!443793))))

(assert (=> b!800094 (= res!544057 (= lt!357206 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357204 vacantAfter!23 lt!357201 lt!357199 mask!3266)))))

(declare-fun b!800095 () Bool)

(declare-fun res!544067 () Bool)

(assert (=> b!800095 (=> (not res!544067) (not e!443791))))

(declare-fun arrayContainsKey!0 (array!43450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800095 (= res!544067 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!544065 () Bool)

(assert (=> start!68828 (=> (not res!544065) (not e!443791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68828 (= res!544065 (validMask!0 mask!3266))))

(assert (=> start!68828 e!443791))

(assert (=> start!68828 true))

(declare-fun array_inv!16659 (array!43450) Bool)

(assert (=> start!68828 (array_inv!16659 a!3170)))

(declare-fun b!800087 () Bool)

(assert (=> b!800087 (= e!443793 false)))

(declare-fun lt!357203 () SeekEntryResult!8347)

(assert (=> b!800087 (= lt!357203 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357204 vacantBefore!23 (select (arr!20800 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800096 () Bool)

(declare-fun res!544060 () Bool)

(assert (=> b!800096 (=> (not res!544060) (not e!443791))))

(assert (=> b!800096 (= res!544060 (and (= (size!21220 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21220 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21220 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800097 () Bool)

(declare-fun res!544061 () Bool)

(assert (=> b!800097 (=> (not res!544061) (not e!443791))))

(assert (=> b!800097 (= res!544061 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68828 res!544065) b!800096))

(assert (= (and b!800096 res!544060) b!800092))

(assert (= (and b!800092 res!544068) b!800097))

(assert (= (and b!800097 res!544061) b!800095))

(assert (= (and b!800095 res!544067) b!800091))

(assert (= (and b!800091 res!544058) b!800085))

(assert (= (and b!800085 res!544066) b!800086))

(assert (= (and b!800086 res!544063) b!800089))

(assert (= (and b!800089 res!544064) b!800093))

(assert (= (and b!800093 res!544056) b!800088))

(assert (= (and b!800088 res!544062) b!800090))

(assert (= (and b!800090 res!544059) b!800094))

(assert (= (and b!800094 res!544057) b!800087))

(declare-fun m!741445 () Bool)

(assert (=> b!800087 m!741445))

(assert (=> b!800087 m!741445))

(declare-fun m!741447 () Bool)

(assert (=> b!800087 m!741447))

(declare-fun m!741449 () Bool)

(assert (=> b!800089 m!741449))

(declare-fun m!741451 () Bool)

(assert (=> b!800089 m!741451))

(declare-fun m!741453 () Bool)

(assert (=> b!800090 m!741453))

(declare-fun m!741455 () Bool)

(assert (=> b!800094 m!741455))

(declare-fun m!741457 () Bool)

(assert (=> b!800091 m!741457))

(declare-fun m!741459 () Bool)

(assert (=> start!68828 m!741459))

(declare-fun m!741461 () Bool)

(assert (=> start!68828 m!741461))

(declare-fun m!741463 () Bool)

(assert (=> b!800085 m!741463))

(declare-fun m!741465 () Bool)

(assert (=> b!800088 m!741465))

(assert (=> b!800088 m!741445))

(assert (=> b!800088 m!741445))

(declare-fun m!741467 () Bool)

(assert (=> b!800088 m!741467))

(assert (=> b!800088 m!741445))

(declare-fun m!741469 () Bool)

(assert (=> b!800088 m!741469))

(declare-fun m!741471 () Bool)

(assert (=> b!800097 m!741471))

(assert (=> b!800092 m!741445))

(assert (=> b!800092 m!741445))

(declare-fun m!741473 () Bool)

(assert (=> b!800092 m!741473))

(declare-fun m!741475 () Bool)

(assert (=> b!800093 m!741475))

(declare-fun m!741477 () Bool)

(assert (=> b!800093 m!741477))

(declare-fun m!741479 () Bool)

(assert (=> b!800093 m!741479))

(declare-fun m!741481 () Bool)

(assert (=> b!800093 m!741481))

(declare-fun m!741483 () Bool)

(assert (=> b!800095 m!741483))

(declare-fun m!741485 () Bool)

(assert (=> b!800086 m!741485))

(check-sat (not b!800090) (not b!800085) (not b!800088) (not b!800095) (not b!800091) (not b!800087) (not b!800094) (not b!800086) (not b!800097) (not start!68828) (not b!800092) (not b!800093))
(check-sat)
