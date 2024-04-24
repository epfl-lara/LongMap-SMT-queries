; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68460 () Bool)

(assert start!68460)

(declare-fun b!794595 () Bool)

(declare-fun e!441360 () Bool)

(declare-fun e!441361 () Bool)

(assert (=> b!794595 (= e!441360 e!441361)))

(declare-fun res!538741 () Bool)

(assert (=> b!794595 (=> (not res!538741) (not e!441361))))

(declare-datatypes ((SeekEntryResult!8185 0))(
  ( (MissingZero!8185 (index!35108 (_ BitVec 32))) (Found!8185 (index!35109 (_ BitVec 32))) (Intermediate!8185 (undefined!8997 Bool) (index!35110 (_ BitVec 32)) (x!66202 (_ BitVec 32))) (Undefined!8185) (MissingVacant!8185 (index!35111 (_ BitVec 32))) )
))
(declare-fun lt!354198 () SeekEntryResult!8185)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794595 (= res!538741 (or (= lt!354198 (MissingZero!8185 i!1163)) (= lt!354198 (MissingVacant!8185 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43124 0))(
  ( (array!43125 (arr!20638 (Array (_ BitVec 32) (_ BitVec 64))) (size!21058 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43124)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43124 (_ BitVec 32)) SeekEntryResult!8185)

(assert (=> b!794595 (= lt!354198 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794596 () Bool)

(declare-fun res!538746 () Bool)

(assert (=> b!794596 (=> (not res!538746) (not e!441361))))

(declare-datatypes ((List!14508 0))(
  ( (Nil!14505) (Cons!14504 (h!15639 (_ BitVec 64)) (t!20815 List!14508)) )
))
(declare-fun arrayNoDuplicates!0 (array!43124 (_ BitVec 32) List!14508) Bool)

(assert (=> b!794596 (= res!538746 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14505))))

(declare-fun b!794597 () Bool)

(declare-fun res!538743 () Bool)

(assert (=> b!794597 (=> (not res!538743) (not e!441360))))

(declare-fun arrayContainsKey!0 (array!43124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794597 (= res!538743 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794598 () Bool)

(declare-fun res!538747 () Bool)

(assert (=> b!794598 (=> (not res!538747) (not e!441361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43124 (_ BitVec 32)) Bool)

(assert (=> b!794598 (= res!538747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794599 () Bool)

(declare-fun res!538748 () Bool)

(assert (=> b!794599 (=> (not res!538748) (not e!441360))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794599 (= res!538748 (and (= (size!21058 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21058 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21058 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794600 () Bool)

(declare-fun e!441359 () Bool)

(assert (=> b!794600 (= e!441359 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun res!538744 () Bool)

(assert (=> start!68460 (=> (not res!538744) (not e!441360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68460 (= res!538744 (validMask!0 mask!3266))))

(assert (=> start!68460 e!441360))

(assert (=> start!68460 true))

(declare-fun array_inv!16497 (array!43124) Bool)

(assert (=> start!68460 (array_inv!16497 a!3170)))

(declare-fun b!794601 () Bool)

(assert (=> b!794601 (= e!441361 e!441359)))

(declare-fun res!538740 () Bool)

(assert (=> b!794601 (=> (not res!538740) (not e!441359))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354197 () (_ BitVec 64))

(declare-fun lt!354199 () array!43124)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43124 (_ BitVec 32)) SeekEntryResult!8185)

(assert (=> b!794601 (= res!538740 (= (seekEntryOrOpen!0 lt!354197 lt!354199 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354197 lt!354199 mask!3266)))))

(assert (=> b!794601 (= lt!354197 (select (store (arr!20638 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794601 (= lt!354199 (array!43125 (store (arr!20638 a!3170) i!1163 k0!2044) (size!21058 a!3170)))))

(declare-fun b!794602 () Bool)

(declare-fun res!538745 () Bool)

(assert (=> b!794602 (=> (not res!538745) (not e!441360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794602 (= res!538745 (validKeyInArray!0 (select (arr!20638 a!3170) j!153)))))

(declare-fun b!794603 () Bool)

(declare-fun res!538742 () Bool)

(assert (=> b!794603 (=> (not res!538742) (not e!441360))))

(assert (=> b!794603 (= res!538742 (validKeyInArray!0 k0!2044))))

(declare-fun b!794604 () Bool)

(declare-fun res!538749 () Bool)

(assert (=> b!794604 (=> (not res!538749) (not e!441361))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794604 (= res!538749 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21058 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20638 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21058 a!3170)) (= (select (arr!20638 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68460 res!538744) b!794599))

(assert (= (and b!794599 res!538748) b!794602))

(assert (= (and b!794602 res!538745) b!794603))

(assert (= (and b!794603 res!538742) b!794597))

(assert (= (and b!794597 res!538743) b!794595))

(assert (= (and b!794595 res!538741) b!794598))

(assert (= (and b!794598 res!538747) b!794596))

(assert (= (and b!794596 res!538746) b!794604))

(assert (= (and b!794604 res!538749) b!794601))

(assert (= (and b!794601 res!538740) b!794600))

(declare-fun m!735533 () Bool)

(assert (=> b!794604 m!735533))

(declare-fun m!735535 () Bool)

(assert (=> b!794604 m!735535))

(declare-fun m!735537 () Bool)

(assert (=> b!794597 m!735537))

(declare-fun m!735539 () Bool)

(assert (=> b!794598 m!735539))

(declare-fun m!735541 () Bool)

(assert (=> start!68460 m!735541))

(declare-fun m!735543 () Bool)

(assert (=> start!68460 m!735543))

(declare-fun m!735545 () Bool)

(assert (=> b!794602 m!735545))

(assert (=> b!794602 m!735545))

(declare-fun m!735547 () Bool)

(assert (=> b!794602 m!735547))

(declare-fun m!735549 () Bool)

(assert (=> b!794603 m!735549))

(declare-fun m!735551 () Bool)

(assert (=> b!794595 m!735551))

(declare-fun m!735553 () Bool)

(assert (=> b!794596 m!735553))

(declare-fun m!735555 () Bool)

(assert (=> b!794601 m!735555))

(declare-fun m!735557 () Bool)

(assert (=> b!794601 m!735557))

(declare-fun m!735559 () Bool)

(assert (=> b!794601 m!735559))

(declare-fun m!735561 () Bool)

(assert (=> b!794601 m!735561))

(check-sat (not b!794595) (not b!794597) (not b!794596) (not b!794598) (not start!68460) (not b!794603) (not b!794602) (not b!794601))
(check-sat)
