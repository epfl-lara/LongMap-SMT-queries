; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68924 () Bool)

(assert start!68924)

(declare-fun b!801957 () Bool)

(declare-fun e!444657 () Bool)

(assert (=> b!801957 (= e!444657 false)))

(declare-fun lt!358355 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8395 0))(
  ( (MissingZero!8395 (index!35948 (_ BitVec 32))) (Found!8395 (index!35949 (_ BitVec 32))) (Intermediate!8395 (undefined!9207 Bool) (index!35950 (_ BitVec 32)) (x!66975 (_ BitVec 32))) (Undefined!8395) (MissingVacant!8395 (index!35951 (_ BitVec 32))) )
))
(declare-fun lt!358354 () SeekEntryResult!8395)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43546 0))(
  ( (array!43547 (arr!20848 (Array (_ BitVec 32) (_ BitVec 64))) (size!21268 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43546)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43546 (_ BitVec 32)) SeekEntryResult!8395)

(assert (=> b!801957 (= lt!358354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358355 vacantBefore!23 (select (arr!20848 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801958 () Bool)

(declare-fun res!545930 () Bool)

(declare-fun e!444658 () Bool)

(assert (=> b!801958 (=> (not res!545930) (not e!444658))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801958 (= res!545930 (validKeyInArray!0 k0!2044))))

(declare-fun b!801959 () Bool)

(declare-fun res!545939 () Bool)

(assert (=> b!801959 (=> (not res!545939) (not e!444658))))

(declare-fun arrayContainsKey!0 (array!43546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801959 (= res!545939 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!545933 () Bool)

(assert (=> start!68924 (=> (not res!545933) (not e!444658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68924 (= res!545933 (validMask!0 mask!3266))))

(assert (=> start!68924 e!444658))

(assert (=> start!68924 true))

(declare-fun array_inv!16707 (array!43546) Bool)

(assert (=> start!68924 (array_inv!16707 a!3170)))

(declare-fun b!801960 () Bool)

(declare-fun res!545935 () Bool)

(declare-fun e!444656 () Bool)

(assert (=> b!801960 (=> (not res!545935) (not e!444656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43546 (_ BitVec 32)) Bool)

(assert (=> b!801960 (= res!545935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801961 () Bool)

(declare-fun res!545940 () Bool)

(assert (=> b!801961 (=> (not res!545940) (not e!444657))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358357 () array!43546)

(declare-fun lt!358351 () SeekEntryResult!8395)

(declare-fun lt!358356 () (_ BitVec 64))

(assert (=> b!801961 (= res!545940 (= lt!358351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358355 vacantAfter!23 lt!358356 lt!358357 mask!3266)))))

(declare-fun b!801962 () Bool)

(declare-fun res!545937 () Bool)

(assert (=> b!801962 (=> (not res!545937) (not e!444656))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801962 (= res!545937 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21268 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20848 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21268 a!3170)) (= (select (arr!20848 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801963 () Bool)

(declare-fun e!444654 () Bool)

(declare-fun e!444653 () Bool)

(assert (=> b!801963 (= e!444654 e!444653)))

(declare-fun res!545928 () Bool)

(assert (=> b!801963 (=> (not res!545928) (not e!444653))))

(declare-fun lt!358353 () SeekEntryResult!8395)

(declare-fun lt!358352 () SeekEntryResult!8395)

(assert (=> b!801963 (= res!545928 (and (= lt!358353 lt!358352) (= lt!358352 (Found!8395 j!153)) (not (= (select (arr!20848 a!3170) index!1236) (select (arr!20848 a!3170) j!153)))))))

(assert (=> b!801963 (= lt!358352 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20848 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43546 (_ BitVec 32)) SeekEntryResult!8395)

(assert (=> b!801963 (= lt!358353 (seekEntryOrOpen!0 (select (arr!20848 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801964 () Bool)

(assert (=> b!801964 (= e!444653 e!444657)))

(declare-fun res!545931 () Bool)

(assert (=> b!801964 (=> (not res!545931) (not e!444657))))

(assert (=> b!801964 (= res!545931 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358355 #b00000000000000000000000000000000) (bvslt lt!358355 (size!21268 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801964 (= lt!358355 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801965 () Bool)

(assert (=> b!801965 (= e!444658 e!444656)))

(declare-fun res!545938 () Bool)

(assert (=> b!801965 (=> (not res!545938) (not e!444656))))

(declare-fun lt!358358 () SeekEntryResult!8395)

(assert (=> b!801965 (= res!545938 (or (= lt!358358 (MissingZero!8395 i!1163)) (= lt!358358 (MissingVacant!8395 i!1163))))))

(assert (=> b!801965 (= lt!358358 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801966 () Bool)

(declare-fun res!545932 () Bool)

(assert (=> b!801966 (=> (not res!545932) (not e!444656))))

(declare-datatypes ((List!14718 0))(
  ( (Nil!14715) (Cons!14714 (h!15849 (_ BitVec 64)) (t!21025 List!14718)) )
))
(declare-fun arrayNoDuplicates!0 (array!43546 (_ BitVec 32) List!14718) Bool)

(assert (=> b!801966 (= res!545932 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14715))))

(declare-fun b!801967 () Bool)

(declare-fun res!545934 () Bool)

(assert (=> b!801967 (=> (not res!545934) (not e!444658))))

(assert (=> b!801967 (= res!545934 (and (= (size!21268 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21268 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21268 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801968 () Bool)

(declare-fun res!545936 () Bool)

(assert (=> b!801968 (=> (not res!545936) (not e!444658))))

(assert (=> b!801968 (= res!545936 (validKeyInArray!0 (select (arr!20848 a!3170) j!153)))))

(declare-fun b!801969 () Bool)

(assert (=> b!801969 (= e!444656 e!444654)))

(declare-fun res!545929 () Bool)

(assert (=> b!801969 (=> (not res!545929) (not e!444654))))

(assert (=> b!801969 (= res!545929 (= lt!358351 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358356 lt!358357 mask!3266)))))

(assert (=> b!801969 (= lt!358351 (seekEntryOrOpen!0 lt!358356 lt!358357 mask!3266))))

(assert (=> b!801969 (= lt!358356 (select (store (arr!20848 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801969 (= lt!358357 (array!43547 (store (arr!20848 a!3170) i!1163 k0!2044) (size!21268 a!3170)))))

(assert (= (and start!68924 res!545933) b!801967))

(assert (= (and b!801967 res!545934) b!801968))

(assert (= (and b!801968 res!545936) b!801958))

(assert (= (and b!801958 res!545930) b!801959))

(assert (= (and b!801959 res!545939) b!801965))

(assert (= (and b!801965 res!545938) b!801960))

(assert (= (and b!801960 res!545935) b!801966))

(assert (= (and b!801966 res!545932) b!801962))

(assert (= (and b!801962 res!545937) b!801969))

(assert (= (and b!801969 res!545929) b!801963))

(assert (= (and b!801963 res!545928) b!801964))

(assert (= (and b!801964 res!545931) b!801961))

(assert (= (and b!801961 res!545940) b!801957))

(declare-fun m!743461 () Bool)

(assert (=> b!801960 m!743461))

(declare-fun m!743463 () Bool)

(assert (=> b!801966 m!743463))

(declare-fun m!743465 () Bool)

(assert (=> b!801957 m!743465))

(assert (=> b!801957 m!743465))

(declare-fun m!743467 () Bool)

(assert (=> b!801957 m!743467))

(declare-fun m!743469 () Bool)

(assert (=> b!801961 m!743469))

(declare-fun m!743471 () Bool)

(assert (=> b!801964 m!743471))

(assert (=> b!801968 m!743465))

(assert (=> b!801968 m!743465))

(declare-fun m!743473 () Bool)

(assert (=> b!801968 m!743473))

(declare-fun m!743475 () Bool)

(assert (=> b!801962 m!743475))

(declare-fun m!743477 () Bool)

(assert (=> b!801962 m!743477))

(declare-fun m!743479 () Bool)

(assert (=> start!68924 m!743479))

(declare-fun m!743481 () Bool)

(assert (=> start!68924 m!743481))

(declare-fun m!743483 () Bool)

(assert (=> b!801963 m!743483))

(assert (=> b!801963 m!743465))

(assert (=> b!801963 m!743465))

(declare-fun m!743485 () Bool)

(assert (=> b!801963 m!743485))

(assert (=> b!801963 m!743465))

(declare-fun m!743487 () Bool)

(assert (=> b!801963 m!743487))

(declare-fun m!743489 () Bool)

(assert (=> b!801965 m!743489))

(declare-fun m!743491 () Bool)

(assert (=> b!801969 m!743491))

(declare-fun m!743493 () Bool)

(assert (=> b!801969 m!743493))

(declare-fun m!743495 () Bool)

(assert (=> b!801969 m!743495))

(declare-fun m!743497 () Bool)

(assert (=> b!801969 m!743497))

(declare-fun m!743499 () Bool)

(assert (=> b!801958 m!743499))

(declare-fun m!743501 () Bool)

(assert (=> b!801959 m!743501))

(check-sat (not b!801960) (not b!801966) (not b!801961) (not b!801957) (not start!68924) (not b!801958) (not b!801965) (not b!801963) (not b!801964) (not b!801969) (not b!801959) (not b!801968))
(check-sat)
