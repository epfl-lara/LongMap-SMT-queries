; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68636 () Bool)

(assert start!68636)

(declare-fun b!798750 () Bool)

(declare-fun res!543269 () Bool)

(declare-fun e!443017 () Bool)

(assert (=> b!798750 (=> (not res!543269) (not e!443017))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798750 (= res!543269 (validKeyInArray!0 k!2044))))

(declare-fun b!798751 () Bool)

(declare-fun res!543275 () Bool)

(assert (=> b!798751 (=> (not res!543275) (not e!443017))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43426 0))(
  ( (array!43427 (arr!20793 (Array (_ BitVec 32) (_ BitVec 64))) (size!21214 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43426)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798751 (= res!543275 (and (= (size!21214 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21214 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21214 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798752 () Bool)

(declare-fun res!543277 () Bool)

(assert (=> b!798752 (=> (not res!543277) (not e!443017))))

(assert (=> b!798752 (= res!543277 (validKeyInArray!0 (select (arr!20793 a!3170) j!153)))))

(declare-fun b!798753 () Bool)

(declare-fun e!443016 () Bool)

(declare-fun e!443015 () Bool)

(assert (=> b!798753 (= e!443016 e!443015)))

(declare-fun res!543278 () Bool)

(assert (=> b!798753 (=> (not res!543278) (not e!443015))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356576 () array!43426)

(declare-fun lt!356575 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8384 0))(
  ( (MissingZero!8384 (index!35904 (_ BitVec 32))) (Found!8384 (index!35905 (_ BitVec 32))) (Intermediate!8384 (undefined!9196 Bool) (index!35906 (_ BitVec 32)) (x!66790 (_ BitVec 32))) (Undefined!8384) (MissingVacant!8384 (index!35907 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43426 (_ BitVec 32)) SeekEntryResult!8384)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43426 (_ BitVec 32)) SeekEntryResult!8384)

(assert (=> b!798753 (= res!543278 (= (seekEntryOrOpen!0 lt!356575 lt!356576 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356575 lt!356576 mask!3266)))))

(assert (=> b!798753 (= lt!356575 (select (store (arr!20793 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798753 (= lt!356576 (array!43427 (store (arr!20793 a!3170) i!1163 k!2044) (size!21214 a!3170)))))

(declare-fun res!543274 () Bool)

(assert (=> start!68636 (=> (not res!543274) (not e!443017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68636 (= res!543274 (validMask!0 mask!3266))))

(assert (=> start!68636 e!443017))

(assert (=> start!68636 true))

(declare-fun array_inv!16589 (array!43426) Bool)

(assert (=> start!68636 (array_inv!16589 a!3170)))

(declare-fun b!798754 () Bool)

(assert (=> b!798754 (= e!443015 false)))

(declare-fun lt!356578 () SeekEntryResult!8384)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798754 (= lt!356578 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20793 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356579 () SeekEntryResult!8384)

(assert (=> b!798754 (= lt!356579 (seekEntryOrOpen!0 (select (arr!20793 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798755 () Bool)

(declare-fun res!543271 () Bool)

(assert (=> b!798755 (=> (not res!543271) (not e!443017))))

(declare-fun arrayContainsKey!0 (array!43426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798755 (= res!543271 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798756 () Bool)

(declare-fun res!543276 () Bool)

(assert (=> b!798756 (=> (not res!543276) (not e!443016))))

(assert (=> b!798756 (= res!543276 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21214 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20793 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21214 a!3170)) (= (select (arr!20793 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798757 () Bool)

(declare-fun res!543270 () Bool)

(assert (=> b!798757 (=> (not res!543270) (not e!443016))))

(declare-datatypes ((List!14756 0))(
  ( (Nil!14753) (Cons!14752 (h!15881 (_ BitVec 64)) (t!21071 List!14756)) )
))
(declare-fun arrayNoDuplicates!0 (array!43426 (_ BitVec 32) List!14756) Bool)

(assert (=> b!798757 (= res!543270 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14753))))

(declare-fun b!798758 () Bool)

(assert (=> b!798758 (= e!443017 e!443016)))

(declare-fun res!543272 () Bool)

(assert (=> b!798758 (=> (not res!543272) (not e!443016))))

(declare-fun lt!356577 () SeekEntryResult!8384)

(assert (=> b!798758 (= res!543272 (or (= lt!356577 (MissingZero!8384 i!1163)) (= lt!356577 (MissingVacant!8384 i!1163))))))

(assert (=> b!798758 (= lt!356577 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798759 () Bool)

(declare-fun res!543273 () Bool)

(assert (=> b!798759 (=> (not res!543273) (not e!443016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43426 (_ BitVec 32)) Bool)

(assert (=> b!798759 (= res!543273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68636 res!543274) b!798751))

(assert (= (and b!798751 res!543275) b!798752))

(assert (= (and b!798752 res!543277) b!798750))

(assert (= (and b!798750 res!543269) b!798755))

(assert (= (and b!798755 res!543271) b!798758))

(assert (= (and b!798758 res!543272) b!798759))

(assert (= (and b!798759 res!543273) b!798757))

(assert (= (and b!798757 res!543270) b!798756))

(assert (= (and b!798756 res!543276) b!798753))

(assert (= (and b!798753 res!543278) b!798754))

(declare-fun m!739709 () Bool)

(assert (=> b!798752 m!739709))

(assert (=> b!798752 m!739709))

(declare-fun m!739711 () Bool)

(assert (=> b!798752 m!739711))

(declare-fun m!739713 () Bool)

(assert (=> b!798757 m!739713))

(declare-fun m!739715 () Bool)

(assert (=> b!798758 m!739715))

(declare-fun m!739717 () Bool)

(assert (=> b!798755 m!739717))

(declare-fun m!739719 () Bool)

(assert (=> b!798753 m!739719))

(declare-fun m!739721 () Bool)

(assert (=> b!798753 m!739721))

(declare-fun m!739723 () Bool)

(assert (=> b!798753 m!739723))

(declare-fun m!739725 () Bool)

(assert (=> b!798753 m!739725))

(declare-fun m!739727 () Bool)

(assert (=> start!68636 m!739727))

(declare-fun m!739729 () Bool)

(assert (=> start!68636 m!739729))

(declare-fun m!739731 () Bool)

(assert (=> b!798750 m!739731))

(declare-fun m!739733 () Bool)

(assert (=> b!798759 m!739733))

(declare-fun m!739735 () Bool)

(assert (=> b!798756 m!739735))

(declare-fun m!739737 () Bool)

(assert (=> b!798756 m!739737))

(assert (=> b!798754 m!739709))

(assert (=> b!798754 m!739709))

(declare-fun m!739739 () Bool)

(assert (=> b!798754 m!739739))

(assert (=> b!798754 m!739709))

(declare-fun m!739741 () Bool)

(assert (=> b!798754 m!739741))

(push 1)

