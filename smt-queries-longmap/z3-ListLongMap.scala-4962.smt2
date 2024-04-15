; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68262 () Bool)

(assert start!68262)

(declare-fun b!792986 () Bool)

(declare-fun res!537647 () Bool)

(declare-fun e!440530 () Bool)

(assert (=> b!792986 (=> (not res!537647) (not e!440530))))

(declare-datatypes ((array!43069 0))(
  ( (array!43070 (arr!20615 (Array (_ BitVec 32) (_ BitVec 64))) (size!21036 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43069)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43069 (_ BitVec 32)) Bool)

(assert (=> b!792986 (= res!537647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792987 () Bool)

(declare-fun res!537649 () Bool)

(declare-fun e!440529 () Bool)

(assert (=> b!792987 (=> (not res!537649) (not e!440529))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792987 (= res!537649 (and (= (size!21036 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21036 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21036 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!537645 () Bool)

(assert (=> start!68262 (=> (not res!537645) (not e!440529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68262 (= res!537645 (validMask!0 mask!3266))))

(assert (=> start!68262 e!440529))

(assert (=> start!68262 true))

(declare-fun array_inv!16498 (array!43069) Bool)

(assert (=> start!68262 (array_inv!16498 a!3170)))

(declare-fun b!792988 () Bool)

(assert (=> b!792988 (= e!440530 false)))

(declare-fun lt!353431 () Bool)

(declare-datatypes ((List!14617 0))(
  ( (Nil!14614) (Cons!14613 (h!15742 (_ BitVec 64)) (t!20923 List!14617)) )
))
(declare-fun arrayNoDuplicates!0 (array!43069 (_ BitVec 32) List!14617) Bool)

(assert (=> b!792988 (= lt!353431 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14614))))

(declare-fun b!792989 () Bool)

(declare-fun res!537650 () Bool)

(assert (=> b!792989 (=> (not res!537650) (not e!440529))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792989 (= res!537650 (validKeyInArray!0 k0!2044))))

(declare-fun b!792990 () Bool)

(assert (=> b!792990 (= e!440529 e!440530)))

(declare-fun res!537646 () Bool)

(assert (=> b!792990 (=> (not res!537646) (not e!440530))))

(declare-datatypes ((SeekEntryResult!8203 0))(
  ( (MissingZero!8203 (index!35180 (_ BitVec 32))) (Found!8203 (index!35181 (_ BitVec 32))) (Intermediate!8203 (undefined!9015 Bool) (index!35182 (_ BitVec 32)) (x!66132 (_ BitVec 32))) (Undefined!8203) (MissingVacant!8203 (index!35183 (_ BitVec 32))) )
))
(declare-fun lt!353432 () SeekEntryResult!8203)

(assert (=> b!792990 (= res!537646 (or (= lt!353432 (MissingZero!8203 i!1163)) (= lt!353432 (MissingVacant!8203 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43069 (_ BitVec 32)) SeekEntryResult!8203)

(assert (=> b!792990 (= lt!353432 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792991 () Bool)

(declare-fun res!537651 () Bool)

(assert (=> b!792991 (=> (not res!537651) (not e!440529))))

(assert (=> b!792991 (= res!537651 (validKeyInArray!0 (select (arr!20615 a!3170) j!153)))))

(declare-fun b!792992 () Bool)

(declare-fun res!537648 () Bool)

(assert (=> b!792992 (=> (not res!537648) (not e!440529))))

(declare-fun arrayContainsKey!0 (array!43069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792992 (= res!537648 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68262 res!537645) b!792987))

(assert (= (and b!792987 res!537649) b!792991))

(assert (= (and b!792991 res!537651) b!792989))

(assert (= (and b!792989 res!537650) b!792992))

(assert (= (and b!792992 res!537648) b!792990))

(assert (= (and b!792990 res!537646) b!792986))

(assert (= (and b!792986 res!537647) b!792988))

(declare-fun m!732973 () Bool)

(assert (=> b!792991 m!732973))

(assert (=> b!792991 m!732973))

(declare-fun m!732975 () Bool)

(assert (=> b!792991 m!732975))

(declare-fun m!732977 () Bool)

(assert (=> b!792986 m!732977))

(declare-fun m!732979 () Bool)

(assert (=> start!68262 m!732979))

(declare-fun m!732981 () Bool)

(assert (=> start!68262 m!732981))

(declare-fun m!732983 () Bool)

(assert (=> b!792988 m!732983))

(declare-fun m!732985 () Bool)

(assert (=> b!792989 m!732985))

(declare-fun m!732987 () Bool)

(assert (=> b!792992 m!732987))

(declare-fun m!732989 () Bool)

(assert (=> b!792990 m!732989))

(check-sat (not b!792990) (not b!792992) (not b!792988) (not b!792989) (not b!792986) (not b!792991) (not start!68262))
(check-sat)
