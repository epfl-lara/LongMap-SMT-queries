; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68544 () Bool)

(assert start!68544)

(declare-fun b!797197 () Bool)

(declare-fun e!442293 () Bool)

(declare-fun e!442295 () Bool)

(assert (=> b!797197 (= e!442293 e!442295)))

(declare-fun res!541716 () Bool)

(assert (=> b!797197 (=> (not res!541716) (not e!442295))))

(declare-datatypes ((SeekEntryResult!8338 0))(
  ( (MissingZero!8338 (index!35720 (_ BitVec 32))) (Found!8338 (index!35721 (_ BitVec 32))) (Intermediate!8338 (undefined!9150 Bool) (index!35722 (_ BitVec 32)) (x!66616 (_ BitVec 32))) (Undefined!8338) (MissingVacant!8338 (index!35723 (_ BitVec 32))) )
))
(declare-fun lt!355615 () SeekEntryResult!8338)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797197 (= res!541716 (or (= lt!355615 (MissingZero!8338 i!1163)) (= lt!355615 (MissingVacant!8338 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43334 0))(
  ( (array!43335 (arr!20747 (Array (_ BitVec 32) (_ BitVec 64))) (size!21168 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43334)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43334 (_ BitVec 32)) SeekEntryResult!8338)

(assert (=> b!797197 (= lt!355615 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797198 () Bool)

(declare-fun e!442294 () Bool)

(declare-fun e!442290 () Bool)

(assert (=> b!797198 (= e!442294 e!442290)))

(declare-fun res!541720 () Bool)

(assert (=> b!797198 (=> (not res!541720) (not e!442290))))

(declare-fun lt!355617 () SeekEntryResult!8338)

(declare-fun lt!355612 () SeekEntryResult!8338)

(assert (=> b!797198 (= res!541720 (= lt!355617 lt!355612))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43334 (_ BitVec 32)) SeekEntryResult!8338)

(assert (=> b!797198 (= lt!355612 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20747 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797198 (= lt!355617 (seekEntryOrOpen!0 (select (arr!20747 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797199 () Bool)

(declare-fun res!541727 () Bool)

(assert (=> b!797199 (=> (not res!541727) (not e!442295))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797199 (= res!541727 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21168 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20747 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21168 a!3170)) (= (select (arr!20747 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797200 () Bool)

(declare-fun res!541725 () Bool)

(assert (=> b!797200 (=> (not res!541725) (not e!442293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797200 (= res!541725 (validKeyInArray!0 (select (arr!20747 a!3170) j!153)))))

(declare-fun res!541723 () Bool)

(assert (=> start!68544 (=> (not res!541723) (not e!442293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68544 (= res!541723 (validMask!0 mask!3266))))

(assert (=> start!68544 e!442293))

(assert (=> start!68544 true))

(declare-fun array_inv!16543 (array!43334) Bool)

(assert (=> start!68544 (array_inv!16543 a!3170)))

(declare-fun lt!355616 () SeekEntryResult!8338)

(declare-fun b!797201 () Bool)

(declare-fun e!442291 () Bool)

(declare-fun lt!355614 () SeekEntryResult!8338)

(assert (=> b!797201 (= e!442291 (not (or (not (= lt!355616 lt!355614)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797201 (= lt!355616 (Found!8338 index!1236))))

(declare-fun b!797202 () Bool)

(declare-fun res!541717 () Bool)

(assert (=> b!797202 (=> (not res!541717) (not e!442293))))

(assert (=> b!797202 (= res!541717 (and (= (size!21168 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21168 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21168 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797203 () Bool)

(declare-fun res!541718 () Bool)

(assert (=> b!797203 (=> (not res!541718) (not e!442293))))

(declare-fun arrayContainsKey!0 (array!43334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797203 (= res!541718 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797204 () Bool)

(assert (=> b!797204 (= e!442295 e!442294)))

(declare-fun res!541721 () Bool)

(assert (=> b!797204 (=> (not res!541721) (not e!442294))))

(declare-fun lt!355613 () SeekEntryResult!8338)

(assert (=> b!797204 (= res!541721 (= lt!355613 lt!355616))))

(declare-fun lt!355618 () array!43334)

(declare-fun lt!355619 () (_ BitVec 64))

(assert (=> b!797204 (= lt!355616 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355619 lt!355618 mask!3266))))

(assert (=> b!797204 (= lt!355613 (seekEntryOrOpen!0 lt!355619 lt!355618 mask!3266))))

(assert (=> b!797204 (= lt!355619 (select (store (arr!20747 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797204 (= lt!355618 (array!43335 (store (arr!20747 a!3170) i!1163 k!2044) (size!21168 a!3170)))))

(declare-fun b!797205 () Bool)

(declare-fun res!541722 () Bool)

(assert (=> b!797205 (=> (not res!541722) (not e!442295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43334 (_ BitVec 32)) Bool)

(assert (=> b!797205 (= res!541722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797206 () Bool)

(declare-fun res!541719 () Bool)

(assert (=> b!797206 (=> (not res!541719) (not e!442295))))

(declare-datatypes ((List!14710 0))(
  ( (Nil!14707) (Cons!14706 (h!15835 (_ BitVec 64)) (t!21025 List!14710)) )
))
(declare-fun arrayNoDuplicates!0 (array!43334 (_ BitVec 32) List!14710) Bool)

(assert (=> b!797206 (= res!541719 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14707))))

(declare-fun b!797207 () Bool)

(assert (=> b!797207 (= e!442290 e!442291)))

(declare-fun res!541726 () Bool)

(assert (=> b!797207 (=> (not res!541726) (not e!442291))))

(assert (=> b!797207 (= res!541726 (and (= lt!355612 lt!355614) (= (select (arr!20747 a!3170) index!1236) (select (arr!20747 a!3170) j!153))))))

(assert (=> b!797207 (= lt!355614 (Found!8338 j!153))))

(declare-fun b!797208 () Bool)

(declare-fun res!541724 () Bool)

(assert (=> b!797208 (=> (not res!541724) (not e!442293))))

(assert (=> b!797208 (= res!541724 (validKeyInArray!0 k!2044))))

(assert (= (and start!68544 res!541723) b!797202))

(assert (= (and b!797202 res!541717) b!797200))

(assert (= (and b!797200 res!541725) b!797208))

(assert (= (and b!797208 res!541724) b!797203))

(assert (= (and b!797203 res!541718) b!797197))

(assert (= (and b!797197 res!541716) b!797205))

(assert (= (and b!797205 res!541722) b!797206))

(assert (= (and b!797206 res!541719) b!797199))

(assert (= (and b!797199 res!541727) b!797204))

(assert (= (and b!797204 res!541721) b!797198))

(assert (= (and b!797198 res!541720) b!797207))

(assert (= (and b!797207 res!541726) b!797201))

(declare-fun m!738041 () Bool)

(assert (=> b!797197 m!738041))

(declare-fun m!738043 () Bool)

(assert (=> b!797206 m!738043))

(declare-fun m!738045 () Bool)

(assert (=> b!797205 m!738045))

(declare-fun m!738047 () Bool)

(assert (=> start!68544 m!738047))

(declare-fun m!738049 () Bool)

(assert (=> start!68544 m!738049))

(declare-fun m!738051 () Bool)

(assert (=> b!797199 m!738051))

(declare-fun m!738053 () Bool)

(assert (=> b!797199 m!738053))

(declare-fun m!738055 () Bool)

(assert (=> b!797207 m!738055))

(declare-fun m!738057 () Bool)

(assert (=> b!797207 m!738057))

(declare-fun m!738059 () Bool)

(assert (=> b!797203 m!738059))

(declare-fun m!738061 () Bool)

(assert (=> b!797204 m!738061))

(declare-fun m!738063 () Bool)

(assert (=> b!797204 m!738063))

(declare-fun m!738065 () Bool)

(assert (=> b!797204 m!738065))

(declare-fun m!738067 () Bool)

(assert (=> b!797204 m!738067))

(declare-fun m!738069 () Bool)

(assert (=> b!797208 m!738069))

(assert (=> b!797200 m!738057))

(assert (=> b!797200 m!738057))

(declare-fun m!738071 () Bool)

(assert (=> b!797200 m!738071))

(assert (=> b!797198 m!738057))

(assert (=> b!797198 m!738057))

(declare-fun m!738073 () Bool)

(assert (=> b!797198 m!738073))

(assert (=> b!797198 m!738057))

(declare-fun m!738075 () Bool)

(assert (=> b!797198 m!738075))

(push 1)

(assert (not b!797205))

(assert (not b!797203))

(assert (not b!797200))

(assert (not b!797198))

(assert (not b!797206))

(assert (not b!797208))

(assert (not b!797204))

(assert (not start!68544))

(assert (not b!797197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

