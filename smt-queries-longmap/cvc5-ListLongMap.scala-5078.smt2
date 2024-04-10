; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68978 () Bool)

(assert start!68978)

(declare-fun res!549147 () Bool)

(declare-fun e!445732 () Bool)

(assert (=> start!68978 (=> (not res!549147) (not e!445732))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68978 (= res!549147 (validMask!0 mask!3266))))

(assert (=> start!68978 e!445732))

(assert (=> start!68978 true))

(declare-datatypes ((array!43768 0))(
  ( (array!43769 (arr!20964 (Array (_ BitVec 32) (_ BitVec 64))) (size!21385 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43768)

(declare-fun array_inv!16760 (array!43768) Bool)

(assert (=> start!68978 (array_inv!16760 a!3170)))

(declare-fun b!804625 () Bool)

(declare-fun res!549150 () Bool)

(assert (=> b!804625 (=> (not res!549150) (not e!445732))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804625 (= res!549150 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804626 () Bool)

(declare-fun res!549148 () Bool)

(declare-fun e!445733 () Bool)

(assert (=> b!804626 (=> (not res!549148) (not e!445733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43768 (_ BitVec 32)) Bool)

(assert (=> b!804626 (= res!549148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804627 () Bool)

(declare-fun res!549145 () Bool)

(assert (=> b!804627 (=> (not res!549145) (not e!445732))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804627 (= res!549145 (validKeyInArray!0 (select (arr!20964 a!3170) j!153)))))

(declare-fun b!804628 () Bool)

(declare-fun res!549152 () Bool)

(assert (=> b!804628 (=> (not res!549152) (not e!445732))))

(assert (=> b!804628 (= res!549152 (validKeyInArray!0 k!2044))))

(declare-fun b!804629 () Bool)

(assert (=> b!804629 (= e!445732 e!445733)))

(declare-fun res!549151 () Bool)

(assert (=> b!804629 (=> (not res!549151) (not e!445733))))

(declare-datatypes ((SeekEntryResult!8555 0))(
  ( (MissingZero!8555 (index!36588 (_ BitVec 32))) (Found!8555 (index!36589 (_ BitVec 32))) (Intermediate!8555 (undefined!9367 Bool) (index!36590 (_ BitVec 32)) (x!67417 (_ BitVec 32))) (Undefined!8555) (MissingVacant!8555 (index!36591 (_ BitVec 32))) )
))
(declare-fun lt!360214 () SeekEntryResult!8555)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804629 (= res!549151 (or (= lt!360214 (MissingZero!8555 i!1163)) (= lt!360214 (MissingVacant!8555 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43768 (_ BitVec 32)) SeekEntryResult!8555)

(assert (=> b!804629 (= lt!360214 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804630 () Bool)

(declare-fun res!549144 () Bool)

(assert (=> b!804630 (=> (not res!549144) (not e!445732))))

(assert (=> b!804630 (= res!549144 (and (= (size!21385 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21385 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21385 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804631 () Bool)

(assert (=> b!804631 (= e!445733 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360212 () SeekEntryResult!8555)

(declare-fun lt!360215 () array!43768)

(declare-fun lt!360211 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43768 (_ BitVec 32)) SeekEntryResult!8555)

(assert (=> b!804631 (= lt!360212 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360211 lt!360215 mask!3266))))

(declare-fun lt!360213 () SeekEntryResult!8555)

(assert (=> b!804631 (= lt!360213 (seekEntryOrOpen!0 lt!360211 lt!360215 mask!3266))))

(assert (=> b!804631 (= lt!360211 (select (store (arr!20964 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804631 (= lt!360215 (array!43769 (store (arr!20964 a!3170) i!1163 k!2044) (size!21385 a!3170)))))

(declare-fun b!804632 () Bool)

(declare-fun res!549146 () Bool)

(assert (=> b!804632 (=> (not res!549146) (not e!445733))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804632 (= res!549146 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21385 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20964 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21385 a!3170)) (= (select (arr!20964 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804633 () Bool)

(declare-fun res!549149 () Bool)

(assert (=> b!804633 (=> (not res!549149) (not e!445733))))

(declare-datatypes ((List!14927 0))(
  ( (Nil!14924) (Cons!14923 (h!16052 (_ BitVec 64)) (t!21242 List!14927)) )
))
(declare-fun arrayNoDuplicates!0 (array!43768 (_ BitVec 32) List!14927) Bool)

(assert (=> b!804633 (= res!549149 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14924))))

(assert (= (and start!68978 res!549147) b!804630))

(assert (= (and b!804630 res!549144) b!804627))

(assert (= (and b!804627 res!549145) b!804628))

(assert (= (and b!804628 res!549152) b!804625))

(assert (= (and b!804625 res!549150) b!804629))

(assert (= (and b!804629 res!549151) b!804626))

(assert (= (and b!804626 res!549148) b!804633))

(assert (= (and b!804633 res!549149) b!804632))

(assert (= (and b!804632 res!549146) b!804631))

(declare-fun m!746471 () Bool)

(assert (=> b!804628 m!746471))

(declare-fun m!746473 () Bool)

(assert (=> start!68978 m!746473))

(declare-fun m!746475 () Bool)

(assert (=> start!68978 m!746475))

(declare-fun m!746477 () Bool)

(assert (=> b!804625 m!746477))

(declare-fun m!746479 () Bool)

(assert (=> b!804633 m!746479))

(declare-fun m!746481 () Bool)

(assert (=> b!804632 m!746481))

(declare-fun m!746483 () Bool)

(assert (=> b!804632 m!746483))

(declare-fun m!746485 () Bool)

(assert (=> b!804627 m!746485))

(assert (=> b!804627 m!746485))

(declare-fun m!746487 () Bool)

(assert (=> b!804627 m!746487))

(declare-fun m!746489 () Bool)

(assert (=> b!804629 m!746489))

(declare-fun m!746491 () Bool)

(assert (=> b!804631 m!746491))

(declare-fun m!746493 () Bool)

(assert (=> b!804631 m!746493))

(declare-fun m!746495 () Bool)

(assert (=> b!804631 m!746495))

(declare-fun m!746497 () Bool)

(assert (=> b!804631 m!746497))

(declare-fun m!746499 () Bool)

(assert (=> b!804626 m!746499))

(push 1)

