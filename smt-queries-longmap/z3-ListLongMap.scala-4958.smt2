; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68260 () Bool)

(assert start!68260)

(declare-fun b!792987 () Bool)

(declare-fun e!440583 () Bool)

(declare-fun e!440585 () Bool)

(assert (=> b!792987 (= e!440583 e!440585)))

(declare-fun res!537507 () Bool)

(assert (=> b!792987 (=> (not res!537507) (not e!440585))))

(declare-datatypes ((SeekEntryResult!8196 0))(
  ( (MissingZero!8196 (index!35152 (_ BitVec 32))) (Found!8196 (index!35153 (_ BitVec 32))) (Intermediate!8196 (undefined!9008 Bool) (index!35154 (_ BitVec 32)) (x!66098 (_ BitVec 32))) (Undefined!8196) (MissingVacant!8196 (index!35155 (_ BitVec 32))) )
))
(declare-fun lt!353624 () SeekEntryResult!8196)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792987 (= res!537507 (or (= lt!353624 (MissingZero!8196 i!1163)) (= lt!353624 (MissingVacant!8196 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43050 0))(
  ( (array!43051 (arr!20605 (Array (_ BitVec 32) (_ BitVec 64))) (size!21026 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43050)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43050 (_ BitVec 32)) SeekEntryResult!8196)

(assert (=> b!792987 (= lt!353624 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792988 () Bool)

(declare-fun res!537511 () Bool)

(assert (=> b!792988 (=> (not res!537511) (not e!440583))))

(declare-fun arrayContainsKey!0 (array!43050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792988 (= res!537511 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792989 () Bool)

(declare-fun res!537506 () Bool)

(assert (=> b!792989 (=> (not res!537506) (not e!440583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792989 (= res!537506 (validKeyInArray!0 k0!2044))))

(declare-fun b!792990 () Bool)

(assert (=> b!792990 (= e!440585 false)))

(declare-fun lt!353623 () Bool)

(declare-datatypes ((List!14568 0))(
  ( (Nil!14565) (Cons!14564 (h!15693 (_ BitVec 64)) (t!20883 List!14568)) )
))
(declare-fun arrayNoDuplicates!0 (array!43050 (_ BitVec 32) List!14568) Bool)

(assert (=> b!792990 (= lt!353623 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14565))))

(declare-fun b!792991 () Bool)

(declare-fun res!537509 () Bool)

(assert (=> b!792991 (=> (not res!537509) (not e!440585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43050 (_ BitVec 32)) Bool)

(assert (=> b!792991 (= res!537509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537512 () Bool)

(assert (=> start!68260 (=> (not res!537512) (not e!440583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68260 (= res!537512 (validMask!0 mask!3266))))

(assert (=> start!68260 e!440583))

(assert (=> start!68260 true))

(declare-fun array_inv!16401 (array!43050) Bool)

(assert (=> start!68260 (array_inv!16401 a!3170)))

(declare-fun b!792992 () Bool)

(declare-fun res!537508 () Bool)

(assert (=> b!792992 (=> (not res!537508) (not e!440583))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792992 (= res!537508 (and (= (size!21026 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21026 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21026 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792993 () Bool)

(declare-fun res!537510 () Bool)

(assert (=> b!792993 (=> (not res!537510) (not e!440583))))

(assert (=> b!792993 (= res!537510 (validKeyInArray!0 (select (arr!20605 a!3170) j!153)))))

(assert (= (and start!68260 res!537512) b!792992))

(assert (= (and b!792992 res!537508) b!792993))

(assert (= (and b!792993 res!537510) b!792989))

(assert (= (and b!792989 res!537506) b!792988))

(assert (= (and b!792988 res!537511) b!792987))

(assert (= (and b!792987 res!537507) b!792991))

(assert (= (and b!792991 res!537509) b!792990))

(declare-fun m!733493 () Bool)

(assert (=> b!792989 m!733493))

(declare-fun m!733495 () Bool)

(assert (=> b!792993 m!733495))

(assert (=> b!792993 m!733495))

(declare-fun m!733497 () Bool)

(assert (=> b!792993 m!733497))

(declare-fun m!733499 () Bool)

(assert (=> b!792990 m!733499))

(declare-fun m!733501 () Bool)

(assert (=> start!68260 m!733501))

(declare-fun m!733503 () Bool)

(assert (=> start!68260 m!733503))

(declare-fun m!733505 () Bool)

(assert (=> b!792987 m!733505))

(declare-fun m!733507 () Bool)

(assert (=> b!792988 m!733507))

(declare-fun m!733509 () Bool)

(assert (=> b!792991 m!733509))

(check-sat (not start!68260) (not b!792991) (not b!792987) (not b!792989) (not b!792990) (not b!792988) (not b!792993))
(check-sat)
