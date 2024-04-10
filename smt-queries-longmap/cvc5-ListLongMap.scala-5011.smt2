; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68576 () Bool)

(assert start!68576)

(declare-fun res!542292 () Bool)

(declare-fun e!442574 () Bool)

(assert (=> start!68576 (=> (not res!542292) (not e!442574))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68576 (= res!542292 (validMask!0 mask!3266))))

(assert (=> start!68576 e!442574))

(assert (=> start!68576 true))

(declare-datatypes ((array!43366 0))(
  ( (array!43367 (arr!20763 (Array (_ BitVec 32) (_ BitVec 64))) (size!21184 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43366)

(declare-fun array_inv!16559 (array!43366) Bool)

(assert (=> start!68576 (array_inv!16559 a!3170)))

(declare-fun b!797764 () Bool)

(declare-fun res!542284 () Bool)

(declare-fun e!442571 () Bool)

(assert (=> b!797764 (=> (not res!542284) (not e!442571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43366 (_ BitVec 32)) Bool)

(assert (=> b!797764 (= res!542284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797765 () Bool)

(declare-fun res!542294 () Bool)

(assert (=> b!797765 (=> (not res!542294) (not e!442574))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797765 (= res!542294 (and (= (size!21184 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21184 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21184 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797766 () Bool)

(declare-fun res!542288 () Bool)

(assert (=> b!797766 (=> (not res!542288) (not e!442574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797766 (= res!542288 (validKeyInArray!0 (select (arr!20763 a!3170) j!153)))))

(declare-fun b!797767 () Bool)

(declare-fun e!442569 () Bool)

(assert (=> b!797767 (= e!442571 e!442569)))

(declare-fun res!542283 () Bool)

(assert (=> b!797767 (=> (not res!542283) (not e!442569))))

(declare-datatypes ((SeekEntryResult!8354 0))(
  ( (MissingZero!8354 (index!35784 (_ BitVec 32))) (Found!8354 (index!35785 (_ BitVec 32))) (Intermediate!8354 (undefined!9166 Bool) (index!35786 (_ BitVec 32)) (x!66680 (_ BitVec 32))) (Undefined!8354) (MissingVacant!8354 (index!35787 (_ BitVec 32))) )
))
(declare-fun lt!355980 () SeekEntryResult!8354)

(declare-fun lt!355978 () SeekEntryResult!8354)

(assert (=> b!797767 (= res!542283 (= lt!355980 lt!355978))))

(declare-fun lt!355985 () array!43366)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355983 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43366 (_ BitVec 32)) SeekEntryResult!8354)

(assert (=> b!797767 (= lt!355978 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355983 lt!355985 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43366 (_ BitVec 32)) SeekEntryResult!8354)

(assert (=> b!797767 (= lt!355980 (seekEntryOrOpen!0 lt!355983 lt!355985 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!797767 (= lt!355983 (select (store (arr!20763 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797767 (= lt!355985 (array!43367 (store (arr!20763 a!3170) i!1163 k!2044) (size!21184 a!3170)))))

(declare-fun b!797768 () Bool)

(declare-fun res!542286 () Bool)

(assert (=> b!797768 (=> (not res!542286) (not e!442571))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797768 (= res!542286 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21184 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20763 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21184 a!3170)) (= (select (arr!20763 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797769 () Bool)

(declare-fun res!542285 () Bool)

(assert (=> b!797769 (=> (not res!542285) (not e!442574))))

(assert (=> b!797769 (= res!542285 (validKeyInArray!0 k!2044))))

(declare-fun b!797770 () Bool)

(assert (=> b!797770 (= e!442574 e!442571)))

(declare-fun res!542293 () Bool)

(assert (=> b!797770 (=> (not res!542293) (not e!442571))))

(declare-fun lt!355982 () SeekEntryResult!8354)

(assert (=> b!797770 (= res!542293 (or (= lt!355982 (MissingZero!8354 i!1163)) (= lt!355982 (MissingVacant!8354 i!1163))))))

(assert (=> b!797770 (= lt!355982 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797771 () Bool)

(declare-fun e!442572 () Bool)

(declare-fun e!442573 () Bool)

(assert (=> b!797771 (= e!442572 e!442573)))

(declare-fun res!542290 () Bool)

(assert (=> b!797771 (=> (not res!542290) (not e!442573))))

(declare-fun lt!355984 () SeekEntryResult!8354)

(declare-fun lt!355981 () SeekEntryResult!8354)

(assert (=> b!797771 (= res!542290 (and (= lt!355981 lt!355984) (= (select (arr!20763 a!3170) index!1236) (select (arr!20763 a!3170) j!153))))))

(assert (=> b!797771 (= lt!355984 (Found!8354 j!153))))

(declare-fun b!797772 () Bool)

(declare-fun res!542287 () Bool)

(assert (=> b!797772 (=> (not res!542287) (not e!442574))))

(declare-fun arrayContainsKey!0 (array!43366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797772 (= res!542287 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797773 () Bool)

(assert (=> b!797773 (= e!442573 (not (or (not (= lt!355978 lt!355984)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(assert (=> b!797773 (= lt!355978 (Found!8354 index!1236))))

(declare-fun b!797774 () Bool)

(declare-fun res!542289 () Bool)

(assert (=> b!797774 (=> (not res!542289) (not e!442571))))

(declare-datatypes ((List!14726 0))(
  ( (Nil!14723) (Cons!14722 (h!15851 (_ BitVec 64)) (t!21041 List!14726)) )
))
(declare-fun arrayNoDuplicates!0 (array!43366 (_ BitVec 32) List!14726) Bool)

(assert (=> b!797774 (= res!542289 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14723))))

(declare-fun b!797775 () Bool)

(assert (=> b!797775 (= e!442569 e!442572)))

(declare-fun res!542291 () Bool)

(assert (=> b!797775 (=> (not res!542291) (not e!442572))))

(declare-fun lt!355979 () SeekEntryResult!8354)

(assert (=> b!797775 (= res!542291 (= lt!355979 lt!355981))))

(assert (=> b!797775 (= lt!355981 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20763 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797775 (= lt!355979 (seekEntryOrOpen!0 (select (arr!20763 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68576 res!542292) b!797765))

(assert (= (and b!797765 res!542294) b!797766))

(assert (= (and b!797766 res!542288) b!797769))

(assert (= (and b!797769 res!542285) b!797772))

(assert (= (and b!797772 res!542287) b!797770))

(assert (= (and b!797770 res!542293) b!797764))

(assert (= (and b!797764 res!542284) b!797774))

(assert (= (and b!797774 res!542289) b!797768))

(assert (= (and b!797768 res!542286) b!797767))

(assert (= (and b!797767 res!542283) b!797775))

(assert (= (and b!797775 res!542291) b!797771))

(assert (= (and b!797771 res!542290) b!797773))

(declare-fun m!738635 () Bool)

(assert (=> b!797769 m!738635))

(declare-fun m!738637 () Bool)

(assert (=> b!797764 m!738637))

(declare-fun m!738639 () Bool)

(assert (=> b!797767 m!738639))

(declare-fun m!738641 () Bool)

(assert (=> b!797767 m!738641))

(declare-fun m!738643 () Bool)

(assert (=> b!797767 m!738643))

(declare-fun m!738645 () Bool)

(assert (=> b!797767 m!738645))

(declare-fun m!738647 () Bool)

(assert (=> start!68576 m!738647))

(declare-fun m!738649 () Bool)

(assert (=> start!68576 m!738649))

(declare-fun m!738651 () Bool)

(assert (=> b!797775 m!738651))

(assert (=> b!797775 m!738651))

(declare-fun m!738653 () Bool)

(assert (=> b!797775 m!738653))

(assert (=> b!797775 m!738651))

(declare-fun m!738655 () Bool)

(assert (=> b!797775 m!738655))

(declare-fun m!738657 () Bool)

(assert (=> b!797772 m!738657))

(declare-fun m!738659 () Bool)

(assert (=> b!797774 m!738659))

(declare-fun m!738661 () Bool)

(assert (=> b!797771 m!738661))

(assert (=> b!797771 m!738651))

(declare-fun m!738663 () Bool)

(assert (=> b!797770 m!738663))

(declare-fun m!738665 () Bool)

(assert (=> b!797768 m!738665))

(declare-fun m!738667 () Bool)

(assert (=> b!797768 m!738667))

(assert (=> b!797766 m!738651))

(assert (=> b!797766 m!738651))

(declare-fun m!738669 () Bool)

(assert (=> b!797766 m!738669))

(push 1)

(assert (not b!797766))

(assert (not b!797767))

(assert (not b!797774))

(assert (not b!797772))

(assert (not b!797769))

(assert (not b!797764))

(assert (not b!797770))

(assert (not start!68576))

(assert (not b!797775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

