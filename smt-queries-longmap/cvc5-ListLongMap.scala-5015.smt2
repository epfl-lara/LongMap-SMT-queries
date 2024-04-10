; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68600 () Bool)

(assert start!68600)

(declare-fun b!798179 () Bool)

(declare-fun res!542698 () Bool)

(declare-fun e!442772 () Bool)

(assert (=> b!798179 (=> (not res!542698) (not e!442772))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798179 (= res!542698 (validKeyInArray!0 k!2044))))

(declare-fun b!798180 () Bool)

(declare-fun e!442769 () Bool)

(declare-fun e!442770 () Bool)

(assert (=> b!798180 (= e!442769 e!442770)))

(declare-fun res!542699 () Bool)

(assert (=> b!798180 (=> (not res!542699) (not e!442770))))

(declare-datatypes ((SeekEntryResult!8366 0))(
  ( (MissingZero!8366 (index!35832 (_ BitVec 32))) (Found!8366 (index!35833 (_ BitVec 32))) (Intermediate!8366 (undefined!9178 Bool) (index!35834 (_ BitVec 32)) (x!66724 (_ BitVec 32))) (Undefined!8366) (MissingVacant!8366 (index!35835 (_ BitVec 32))) )
))
(declare-fun lt!356251 () SeekEntryResult!8366)

(declare-fun lt!356253 () SeekEntryResult!8366)

(assert (=> b!798180 (= res!542699 (= lt!356251 lt!356253))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43390 0))(
  ( (array!43391 (arr!20775 (Array (_ BitVec 32) (_ BitVec 64))) (size!21196 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43390)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43390 (_ BitVec 32)) SeekEntryResult!8366)

(assert (=> b!798180 (= lt!356253 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20775 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43390 (_ BitVec 32)) SeekEntryResult!8366)

(assert (=> b!798180 (= lt!356251 (seekEntryOrOpen!0 (select (arr!20775 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798181 () Bool)

(declare-fun res!542705 () Bool)

(assert (=> b!798181 (=> (not res!542705) (not e!442772))))

(declare-fun arrayContainsKey!0 (array!43390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798181 (= res!542705 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798182 () Bool)

(declare-fun e!442771 () Bool)

(assert (=> b!798182 (= e!442772 e!442771)))

(declare-fun res!542707 () Bool)

(assert (=> b!798182 (=> (not res!542707) (not e!442771))))

(declare-fun lt!356254 () SeekEntryResult!8366)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798182 (= res!542707 (or (= lt!356254 (MissingZero!8366 i!1163)) (= lt!356254 (MissingVacant!8366 i!1163))))))

(assert (=> b!798182 (= lt!356254 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798183 () Bool)

(assert (=> b!798183 (= e!442771 e!442769)))

(declare-fun res!542702 () Bool)

(assert (=> b!798183 (=> (not res!542702) (not e!442769))))

(declare-fun lt!356250 () SeekEntryResult!8366)

(declare-fun lt!356255 () SeekEntryResult!8366)

(assert (=> b!798183 (= res!542702 (= lt!356250 lt!356255))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356249 () (_ BitVec 64))

(declare-fun lt!356252 () array!43390)

(assert (=> b!798183 (= lt!356255 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356249 lt!356252 mask!3266))))

(assert (=> b!798183 (= lt!356250 (seekEntryOrOpen!0 lt!356249 lt!356252 mask!3266))))

(assert (=> b!798183 (= lt!356249 (select (store (arr!20775 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798183 (= lt!356252 (array!43391 (store (arr!20775 a!3170) i!1163 k!2044) (size!21196 a!3170)))))

(declare-fun res!542704 () Bool)

(assert (=> start!68600 (=> (not res!542704) (not e!442772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68600 (= res!542704 (validMask!0 mask!3266))))

(assert (=> start!68600 e!442772))

(assert (=> start!68600 true))

(declare-fun array_inv!16571 (array!43390) Bool)

(assert (=> start!68600 (array_inv!16571 a!3170)))

(declare-fun e!442768 () Bool)

(declare-fun b!798178 () Bool)

(declare-fun lt!356248 () SeekEntryResult!8366)

(assert (=> b!798178 (= e!442768 (not (or (not (= lt!356255 lt!356248)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(assert (=> b!798178 (= lt!356255 (Found!8366 index!1236))))

(declare-fun b!798184 () Bool)

(declare-fun res!542697 () Bool)

(assert (=> b!798184 (=> (not res!542697) (not e!442772))))

(assert (=> b!798184 (= res!542697 (validKeyInArray!0 (select (arr!20775 a!3170) j!153)))))

(declare-fun b!798185 () Bool)

(declare-fun res!542703 () Bool)

(assert (=> b!798185 (=> (not res!542703) (not e!442771))))

(assert (=> b!798185 (= res!542703 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21196 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20775 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21196 a!3170)) (= (select (arr!20775 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798186 () Bool)

(assert (=> b!798186 (= e!442770 e!442768)))

(declare-fun res!542701 () Bool)

(assert (=> b!798186 (=> (not res!542701) (not e!442768))))

(assert (=> b!798186 (= res!542701 (and (= lt!356253 lt!356248) (= (select (arr!20775 a!3170) index!1236) (select (arr!20775 a!3170) j!153))))))

(assert (=> b!798186 (= lt!356248 (Found!8366 j!153))))

(declare-fun b!798187 () Bool)

(declare-fun res!542700 () Bool)

(assert (=> b!798187 (=> (not res!542700) (not e!442771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43390 (_ BitVec 32)) Bool)

(assert (=> b!798187 (= res!542700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798188 () Bool)

(declare-fun res!542708 () Bool)

(assert (=> b!798188 (=> (not res!542708) (not e!442771))))

(declare-datatypes ((List!14738 0))(
  ( (Nil!14735) (Cons!14734 (h!15863 (_ BitVec 64)) (t!21053 List!14738)) )
))
(declare-fun arrayNoDuplicates!0 (array!43390 (_ BitVec 32) List!14738) Bool)

(assert (=> b!798188 (= res!542708 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14735))))

(declare-fun b!798189 () Bool)

(declare-fun res!542706 () Bool)

(assert (=> b!798189 (=> (not res!542706) (not e!442772))))

(assert (=> b!798189 (= res!542706 (and (= (size!21196 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21196 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21196 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68600 res!542704) b!798189))

(assert (= (and b!798189 res!542706) b!798184))

(assert (= (and b!798184 res!542697) b!798179))

(assert (= (and b!798179 res!542698) b!798181))

(assert (= (and b!798181 res!542705) b!798182))

(assert (= (and b!798182 res!542707) b!798187))

(assert (= (and b!798187 res!542700) b!798188))

(assert (= (and b!798188 res!542708) b!798185))

(assert (= (and b!798185 res!542703) b!798183))

(assert (= (and b!798183 res!542702) b!798180))

(assert (= (and b!798180 res!542699) b!798186))

(assert (= (and b!798186 res!542701) b!798178))

(declare-fun m!739067 () Bool)

(assert (=> b!798188 m!739067))

(declare-fun m!739069 () Bool)

(assert (=> b!798183 m!739069))

(declare-fun m!739071 () Bool)

(assert (=> b!798183 m!739071))

(declare-fun m!739073 () Bool)

(assert (=> b!798183 m!739073))

(declare-fun m!739075 () Bool)

(assert (=> b!798183 m!739075))

(declare-fun m!739077 () Bool)

(assert (=> start!68600 m!739077))

(declare-fun m!739079 () Bool)

(assert (=> start!68600 m!739079))

(declare-fun m!739081 () Bool)

(assert (=> b!798187 m!739081))

(declare-fun m!739083 () Bool)

(assert (=> b!798184 m!739083))

(assert (=> b!798184 m!739083))

(declare-fun m!739085 () Bool)

(assert (=> b!798184 m!739085))

(declare-fun m!739087 () Bool)

(assert (=> b!798186 m!739087))

(assert (=> b!798186 m!739083))

(declare-fun m!739089 () Bool)

(assert (=> b!798181 m!739089))

(declare-fun m!739091 () Bool)

(assert (=> b!798182 m!739091))

(declare-fun m!739093 () Bool)

(assert (=> b!798185 m!739093))

(declare-fun m!739095 () Bool)

(assert (=> b!798185 m!739095))

(declare-fun m!739097 () Bool)

(assert (=> b!798179 m!739097))

(assert (=> b!798180 m!739083))

(assert (=> b!798180 m!739083))

(declare-fun m!739099 () Bool)

(assert (=> b!798180 m!739099))

(assert (=> b!798180 m!739083))

(declare-fun m!739101 () Bool)

(assert (=> b!798180 m!739101))

(push 1)

(assert (not b!798181))

(assert (not b!798179))

(assert (not b!798180))

(assert (not b!798182))

(assert (not b!798183))

(assert (not b!798188))

(assert (not start!68600))

(assert (not b!798184))

(assert (not b!798187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

