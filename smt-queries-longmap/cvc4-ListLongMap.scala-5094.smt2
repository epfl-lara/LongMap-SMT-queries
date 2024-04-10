; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69174 () Bool)

(assert start!69174)

(declare-fun b!806702 () Bool)

(declare-fun res!550834 () Bool)

(declare-fun e!446710 () Bool)

(assert (=> b!806702 (=> (not res!550834) (not e!446710))))

(declare-datatypes ((array!43874 0))(
  ( (array!43875 (arr!21014 (Array (_ BitVec 32) (_ BitVec 64))) (size!21435 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43874)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806702 (= res!550834 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806703 () Bool)

(declare-fun e!446711 () Bool)

(assert (=> b!806703 (= e!446710 e!446711)))

(declare-fun res!550830 () Bool)

(assert (=> b!806703 (=> (not res!550830) (not e!446711))))

(declare-datatypes ((SeekEntryResult!8605 0))(
  ( (MissingZero!8605 (index!36788 (_ BitVec 32))) (Found!8605 (index!36789 (_ BitVec 32))) (Intermediate!8605 (undefined!9417 Bool) (index!36790 (_ BitVec 32)) (x!67601 (_ BitVec 32))) (Undefined!8605) (MissingVacant!8605 (index!36791 (_ BitVec 32))) )
))
(declare-fun lt!361308 () SeekEntryResult!8605)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806703 (= res!550830 (or (= lt!361308 (MissingZero!8605 i!1163)) (= lt!361308 (MissingVacant!8605 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43874 (_ BitVec 32)) SeekEntryResult!8605)

(assert (=> b!806703 (= lt!361308 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806704 () Bool)

(declare-fun e!446712 () Bool)

(declare-fun e!446713 () Bool)

(assert (=> b!806704 (= e!446712 e!446713)))

(declare-fun res!550831 () Bool)

(assert (=> b!806704 (=> (not res!550831) (not e!446713))))

(declare-fun lt!361310 () SeekEntryResult!8605)

(declare-fun lt!361307 () SeekEntryResult!8605)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806704 (= res!550831 (and (= lt!361307 lt!361310) (= lt!361310 (Found!8605 j!153)) (= (select (arr!21014 a!3170) index!1236) (select (arr!21014 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43874 (_ BitVec 32)) SeekEntryResult!8605)

(assert (=> b!806704 (= lt!361310 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21014 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806704 (= lt!361307 (seekEntryOrOpen!0 (select (arr!21014 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806705 () Bool)

(declare-fun res!550825 () Bool)

(assert (=> b!806705 (=> (not res!550825) (not e!446710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806705 (= res!550825 (validKeyInArray!0 (select (arr!21014 a!3170) j!153)))))

(declare-fun b!806706 () Bool)

(declare-fun res!550826 () Bool)

(assert (=> b!806706 (=> (not res!550826) (not e!446711))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806706 (= res!550826 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21435 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21014 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21435 a!3170)) (= (select (arr!21014 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806707 () Bool)

(declare-fun res!550835 () Bool)

(assert (=> b!806707 (=> (not res!550835) (not e!446711))))

(declare-datatypes ((List!14977 0))(
  ( (Nil!14974) (Cons!14973 (h!16102 (_ BitVec 64)) (t!21292 List!14977)) )
))
(declare-fun arrayNoDuplicates!0 (array!43874 (_ BitVec 32) List!14977) Bool)

(assert (=> b!806707 (= res!550835 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14974))))

(declare-fun b!806708 () Bool)

(declare-fun res!550832 () Bool)

(assert (=> b!806708 (=> (not res!550832) (not e!446710))))

(assert (=> b!806708 (= res!550832 (validKeyInArray!0 k!2044))))

(declare-fun res!550833 () Bool)

(assert (=> start!69174 (=> (not res!550833) (not e!446710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69174 (= res!550833 (validMask!0 mask!3266))))

(assert (=> start!69174 e!446710))

(assert (=> start!69174 true))

(declare-fun array_inv!16810 (array!43874) Bool)

(assert (=> start!69174 (array_inv!16810 a!3170)))

(declare-fun b!806709 () Bool)

(declare-fun res!550828 () Bool)

(assert (=> b!806709 (=> (not res!550828) (not e!446711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43874 (_ BitVec 32)) Bool)

(assert (=> b!806709 (= res!550828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806710 () Bool)

(assert (=> b!806710 (= e!446713 (not true))))

(declare-fun lt!361306 () SeekEntryResult!8605)

(assert (=> b!806710 (= lt!361306 (Found!8605 index!1236))))

(declare-fun b!806711 () Bool)

(assert (=> b!806711 (= e!446711 e!446712)))

(declare-fun res!550829 () Bool)

(assert (=> b!806711 (=> (not res!550829) (not e!446712))))

(declare-fun lt!361304 () SeekEntryResult!8605)

(assert (=> b!806711 (= res!550829 (= lt!361304 lt!361306))))

(declare-fun lt!361309 () array!43874)

(declare-fun lt!361305 () (_ BitVec 64))

(assert (=> b!806711 (= lt!361306 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361305 lt!361309 mask!3266))))

(assert (=> b!806711 (= lt!361304 (seekEntryOrOpen!0 lt!361305 lt!361309 mask!3266))))

(assert (=> b!806711 (= lt!361305 (select (store (arr!21014 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806711 (= lt!361309 (array!43875 (store (arr!21014 a!3170) i!1163 k!2044) (size!21435 a!3170)))))

(declare-fun b!806712 () Bool)

(declare-fun res!550827 () Bool)

(assert (=> b!806712 (=> (not res!550827) (not e!446710))))

(assert (=> b!806712 (= res!550827 (and (= (size!21435 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21435 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21435 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69174 res!550833) b!806712))

(assert (= (and b!806712 res!550827) b!806705))

(assert (= (and b!806705 res!550825) b!806708))

(assert (= (and b!806708 res!550832) b!806702))

(assert (= (and b!806702 res!550834) b!806703))

(assert (= (and b!806703 res!550830) b!806709))

(assert (= (and b!806709 res!550828) b!806707))

(assert (= (and b!806707 res!550835) b!806706))

(assert (= (and b!806706 res!550826) b!806711))

(assert (= (and b!806711 res!550829) b!806704))

(assert (= (and b!806704 res!550831) b!806710))

(declare-fun m!748649 () Bool)

(assert (=> b!806702 m!748649))

(declare-fun m!748651 () Bool)

(assert (=> b!806704 m!748651))

(declare-fun m!748653 () Bool)

(assert (=> b!806704 m!748653))

(assert (=> b!806704 m!748653))

(declare-fun m!748655 () Bool)

(assert (=> b!806704 m!748655))

(assert (=> b!806704 m!748653))

(declare-fun m!748657 () Bool)

(assert (=> b!806704 m!748657))

(declare-fun m!748659 () Bool)

(assert (=> b!806709 m!748659))

(declare-fun m!748661 () Bool)

(assert (=> b!806708 m!748661))

(declare-fun m!748663 () Bool)

(assert (=> b!806707 m!748663))

(declare-fun m!748665 () Bool)

(assert (=> b!806706 m!748665))

(declare-fun m!748667 () Bool)

(assert (=> b!806706 m!748667))

(assert (=> b!806705 m!748653))

(assert (=> b!806705 m!748653))

(declare-fun m!748669 () Bool)

(assert (=> b!806705 m!748669))

(declare-fun m!748671 () Bool)

(assert (=> b!806711 m!748671))

(declare-fun m!748673 () Bool)

(assert (=> b!806711 m!748673))

(declare-fun m!748675 () Bool)

(assert (=> b!806711 m!748675))

(declare-fun m!748677 () Bool)

(assert (=> b!806711 m!748677))

(declare-fun m!748679 () Bool)

(assert (=> b!806703 m!748679))

(declare-fun m!748681 () Bool)

(assert (=> start!69174 m!748681))

(declare-fun m!748683 () Bool)

(assert (=> start!69174 m!748683))

(push 1)

(assert (not b!806705))

(assert (not b!806709))

(assert (not b!806702))

(assert (not b!806704))

(assert (not b!806708))

(assert (not b!806711))

