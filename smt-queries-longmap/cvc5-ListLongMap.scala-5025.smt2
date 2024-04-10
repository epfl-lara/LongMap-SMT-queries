; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68660 () Bool)

(assert start!68660)

(declare-fun b!799197 () Bool)

(declare-fun e!443217 () Bool)

(declare-fun e!443220 () Bool)

(assert (=> b!799197 (= e!443217 e!443220)))

(declare-fun res!543719 () Bool)

(assert (=> b!799197 (=> (not res!543719) (not e!443220))))

(declare-fun lt!356848 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43450 0))(
  ( (array!43451 (arr!20805 (Array (_ BitVec 32) (_ BitVec 64))) (size!21226 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43450)

(assert (=> b!799197 (= res!543719 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356848 #b00000000000000000000000000000000) (bvslt lt!356848 (size!21226 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799197 (= lt!356848 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799198 () Bool)

(declare-fun res!543721 () Bool)

(declare-fun e!443219 () Bool)

(assert (=> b!799198 (=> (not res!543721) (not e!443219))))

(declare-datatypes ((List!14768 0))(
  ( (Nil!14765) (Cons!14764 (h!15893 (_ BitVec 64)) (t!21083 List!14768)) )
))
(declare-fun arrayNoDuplicates!0 (array!43450 (_ BitVec 32) List!14768) Bool)

(assert (=> b!799198 (= res!543721 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14765))))

(declare-fun b!799199 () Bool)

(declare-fun res!543726 () Bool)

(declare-fun e!443221 () Bool)

(assert (=> b!799199 (=> (not res!543726) (not e!443221))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799199 (= res!543726 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799200 () Bool)

(declare-fun e!443222 () Bool)

(assert (=> b!799200 (= e!443222 e!443217)))

(declare-fun res!543718 () Bool)

(assert (=> b!799200 (=> (not res!543718) (not e!443217))))

(declare-datatypes ((SeekEntryResult!8396 0))(
  ( (MissingZero!8396 (index!35952 (_ BitVec 32))) (Found!8396 (index!35953 (_ BitVec 32))) (Intermediate!8396 (undefined!9208 Bool) (index!35954 (_ BitVec 32)) (x!66834 (_ BitVec 32))) (Undefined!8396) (MissingVacant!8396 (index!35955 (_ BitVec 32))) )
))
(declare-fun lt!356845 () SeekEntryResult!8396)

(declare-fun lt!356844 () SeekEntryResult!8396)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799200 (= res!543718 (and (= lt!356845 lt!356844) (= lt!356844 (Found!8396 j!153)) (not (= (select (arr!20805 a!3170) index!1236) (select (arr!20805 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43450 (_ BitVec 32)) SeekEntryResult!8396)

(assert (=> b!799200 (= lt!356844 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20805 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43450 (_ BitVec 32)) SeekEntryResult!8396)

(assert (=> b!799200 (= lt!356845 (seekEntryOrOpen!0 (select (arr!20805 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799201 () Bool)

(declare-fun res!543716 () Bool)

(assert (=> b!799201 (=> (not res!543716) (not e!443219))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799201 (= res!543716 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21226 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20805 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21226 a!3170)) (= (select (arr!20805 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799202 () Bool)

(assert (=> b!799202 (= e!443221 e!443219)))

(declare-fun res!543728 () Bool)

(assert (=> b!799202 (=> (not res!543728) (not e!443219))))

(declare-fun lt!356843 () SeekEntryResult!8396)

(assert (=> b!799202 (= res!543728 (or (= lt!356843 (MissingZero!8396 i!1163)) (= lt!356843 (MissingVacant!8396 i!1163))))))

(assert (=> b!799202 (= lt!356843 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799203 () Bool)

(declare-fun res!543725 () Bool)

(assert (=> b!799203 (=> (not res!543725) (not e!443221))))

(assert (=> b!799203 (= res!543725 (and (= (size!21226 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21226 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21226 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799204 () Bool)

(declare-fun res!543727 () Bool)

(assert (=> b!799204 (=> (not res!543727) (not e!443221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799204 (= res!543727 (validKeyInArray!0 k!2044))))

(declare-fun b!799205 () Bool)

(declare-fun res!543722 () Bool)

(assert (=> b!799205 (=> (not res!543722) (not e!443221))))

(assert (=> b!799205 (= res!543722 (validKeyInArray!0 (select (arr!20805 a!3170) j!153)))))

(declare-fun b!799207 () Bool)

(assert (=> b!799207 (= e!443220 false)))

(declare-fun lt!356846 () SeekEntryResult!8396)

(assert (=> b!799207 (= lt!356846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356848 vacantBefore!23 (select (arr!20805 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543717 () Bool)

(assert (=> start!68660 (=> (not res!543717) (not e!443221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68660 (= res!543717 (validMask!0 mask!3266))))

(assert (=> start!68660 e!443221))

(assert (=> start!68660 true))

(declare-fun array_inv!16601 (array!43450) Bool)

(assert (=> start!68660 (array_inv!16601 a!3170)))

(declare-fun b!799206 () Bool)

(assert (=> b!799206 (= e!443219 e!443222)))

(declare-fun res!543723 () Bool)

(assert (=> b!799206 (=> (not res!543723) (not e!443222))))

(declare-fun lt!356847 () array!43450)

(declare-fun lt!356849 () SeekEntryResult!8396)

(declare-fun lt!356842 () (_ BitVec 64))

(assert (=> b!799206 (= res!543723 (= lt!356849 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356842 lt!356847 mask!3266)))))

(assert (=> b!799206 (= lt!356849 (seekEntryOrOpen!0 lt!356842 lt!356847 mask!3266))))

(assert (=> b!799206 (= lt!356842 (select (store (arr!20805 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799206 (= lt!356847 (array!43451 (store (arr!20805 a!3170) i!1163 k!2044) (size!21226 a!3170)))))

(declare-fun b!799208 () Bool)

(declare-fun res!543724 () Bool)

(assert (=> b!799208 (=> (not res!543724) (not e!443219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43450 (_ BitVec 32)) Bool)

(assert (=> b!799208 (= res!543724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799209 () Bool)

(declare-fun res!543720 () Bool)

(assert (=> b!799209 (=> (not res!543720) (not e!443220))))

(assert (=> b!799209 (= res!543720 (= lt!356849 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356848 vacantAfter!23 lt!356842 lt!356847 mask!3266)))))

(assert (= (and start!68660 res!543717) b!799203))

(assert (= (and b!799203 res!543725) b!799205))

(assert (= (and b!799205 res!543722) b!799204))

(assert (= (and b!799204 res!543727) b!799199))

(assert (= (and b!799199 res!543726) b!799202))

(assert (= (and b!799202 res!543728) b!799208))

(assert (= (and b!799208 res!543724) b!799198))

(assert (= (and b!799198 res!543721) b!799201))

(assert (= (and b!799201 res!543716) b!799206))

(assert (= (and b!799206 res!543723) b!799200))

(assert (= (and b!799200 res!543718) b!799197))

(assert (= (and b!799197 res!543719) b!799209))

(assert (= (and b!799209 res!543720) b!799207))

(declare-fun m!740189 () Bool)

(assert (=> b!799204 m!740189))

(declare-fun m!740191 () Bool)

(assert (=> b!799207 m!740191))

(assert (=> b!799207 m!740191))

(declare-fun m!740193 () Bool)

(assert (=> b!799207 m!740193))

(declare-fun m!740195 () Bool)

(assert (=> b!799201 m!740195))

(declare-fun m!740197 () Bool)

(assert (=> b!799201 m!740197))

(assert (=> b!799205 m!740191))

(assert (=> b!799205 m!740191))

(declare-fun m!740199 () Bool)

(assert (=> b!799205 m!740199))

(declare-fun m!740201 () Bool)

(assert (=> b!799198 m!740201))

(declare-fun m!740203 () Bool)

(assert (=> b!799206 m!740203))

(declare-fun m!740205 () Bool)

(assert (=> b!799206 m!740205))

(declare-fun m!740207 () Bool)

(assert (=> b!799206 m!740207))

(declare-fun m!740209 () Bool)

(assert (=> b!799206 m!740209))

(declare-fun m!740211 () Bool)

(assert (=> b!799208 m!740211))

(declare-fun m!740213 () Bool)

(assert (=> b!799199 m!740213))

(declare-fun m!740215 () Bool)

(assert (=> start!68660 m!740215))

(declare-fun m!740217 () Bool)

(assert (=> start!68660 m!740217))

(declare-fun m!740219 () Bool)

(assert (=> b!799197 m!740219))

(declare-fun m!740221 () Bool)

(assert (=> b!799200 m!740221))

(assert (=> b!799200 m!740191))

(assert (=> b!799200 m!740191))

(declare-fun m!740223 () Bool)

(assert (=> b!799200 m!740223))

(assert (=> b!799200 m!740191))

(declare-fun m!740225 () Bool)

(assert (=> b!799200 m!740225))

(declare-fun m!740227 () Bool)

(assert (=> b!799209 m!740227))

(declare-fun m!740229 () Bool)

(assert (=> b!799202 m!740229))

(push 1)

