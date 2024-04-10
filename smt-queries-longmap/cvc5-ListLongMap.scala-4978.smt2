; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68378 () Bool)

(assert start!68378)

(declare-fun b!794538 () Bool)

(declare-fun res!539061 () Bool)

(declare-fun e!441153 () Bool)

(assert (=> b!794538 (=> (not res!539061) (not e!441153))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43168 0))(
  ( (array!43169 (arr!20664 (Array (_ BitVec 32) (_ BitVec 64))) (size!21085 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43168)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794538 (= res!539061 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21085 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20664 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21085 a!3170)) (= (select (arr!20664 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794539 () Bool)

(declare-fun res!539066 () Bool)

(declare-fun e!441152 () Bool)

(assert (=> b!794539 (=> (not res!539066) (not e!441152))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794539 (= res!539066 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794540 () Bool)

(declare-fun res!539065 () Bool)

(assert (=> b!794540 (=> (not res!539065) (not e!441152))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794540 (= res!539065 (and (= (size!21085 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21085 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21085 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!539058 () Bool)

(assert (=> start!68378 (=> (not res!539058) (not e!441152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68378 (= res!539058 (validMask!0 mask!3266))))

(assert (=> start!68378 e!441152))

(assert (=> start!68378 true))

(declare-fun array_inv!16460 (array!43168) Bool)

(assert (=> start!68378 (array_inv!16460 a!3170)))

(declare-fun b!794541 () Bool)

(declare-fun e!441154 () Bool)

(assert (=> b!794541 (= e!441153 e!441154)))

(declare-fun res!539062 () Bool)

(assert (=> b!794541 (=> (not res!539062) (not e!441154))))

(declare-fun lt!354194 () array!43168)

(declare-fun lt!354191 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8255 0))(
  ( (MissingZero!8255 (index!35388 (_ BitVec 32))) (Found!8255 (index!35389 (_ BitVec 32))) (Intermediate!8255 (undefined!9067 Bool) (index!35390 (_ BitVec 32)) (x!66317 (_ BitVec 32))) (Undefined!8255) (MissingVacant!8255 (index!35391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43168 (_ BitVec 32)) SeekEntryResult!8255)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43168 (_ BitVec 32)) SeekEntryResult!8255)

(assert (=> b!794541 (= res!539062 (= (seekEntryOrOpen!0 lt!354191 lt!354194 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354191 lt!354194 mask!3266)))))

(assert (=> b!794541 (= lt!354191 (select (store (arr!20664 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794541 (= lt!354194 (array!43169 (store (arr!20664 a!3170) i!1163 k!2044) (size!21085 a!3170)))))

(declare-fun b!794542 () Bool)

(declare-fun res!539064 () Bool)

(assert (=> b!794542 (=> (not res!539064) (not e!441153))))

(declare-datatypes ((List!14627 0))(
  ( (Nil!14624) (Cons!14623 (h!15752 (_ BitVec 64)) (t!20942 List!14627)) )
))
(declare-fun arrayNoDuplicates!0 (array!43168 (_ BitVec 32) List!14627) Bool)

(assert (=> b!794542 (= res!539064 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14624))))

(declare-fun b!794543 () Bool)

(assert (=> b!794543 (= e!441152 e!441153)))

(declare-fun res!539060 () Bool)

(assert (=> b!794543 (=> (not res!539060) (not e!441153))))

(declare-fun lt!354192 () SeekEntryResult!8255)

(assert (=> b!794543 (= res!539060 (or (= lt!354192 (MissingZero!8255 i!1163)) (= lt!354192 (MissingVacant!8255 i!1163))))))

(assert (=> b!794543 (= lt!354192 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794544 () Bool)

(assert (=> b!794544 (= e!441154 false)))

(declare-fun lt!354190 () SeekEntryResult!8255)

(assert (=> b!794544 (= lt!354190 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20664 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354193 () SeekEntryResult!8255)

(assert (=> b!794544 (= lt!354193 (seekEntryOrOpen!0 (select (arr!20664 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794545 () Bool)

(declare-fun res!539059 () Bool)

(assert (=> b!794545 (=> (not res!539059) (not e!441152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794545 (= res!539059 (validKeyInArray!0 k!2044))))

(declare-fun b!794546 () Bool)

(declare-fun res!539057 () Bool)

(assert (=> b!794546 (=> (not res!539057) (not e!441152))))

(assert (=> b!794546 (= res!539057 (validKeyInArray!0 (select (arr!20664 a!3170) j!153)))))

(declare-fun b!794547 () Bool)

(declare-fun res!539063 () Bool)

(assert (=> b!794547 (=> (not res!539063) (not e!441153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43168 (_ BitVec 32)) Bool)

(assert (=> b!794547 (= res!539063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68378 res!539058) b!794540))

(assert (= (and b!794540 res!539065) b!794546))

(assert (= (and b!794546 res!539057) b!794545))

(assert (= (and b!794545 res!539059) b!794539))

(assert (= (and b!794539 res!539066) b!794543))

(assert (= (and b!794543 res!539060) b!794547))

(assert (= (and b!794547 res!539063) b!794542))

(assert (= (and b!794542 res!539064) b!794538))

(assert (= (and b!794538 res!539061) b!794541))

(assert (= (and b!794541 res!539062) b!794544))

(declare-fun m!735083 () Bool)

(assert (=> b!794538 m!735083))

(declare-fun m!735085 () Bool)

(assert (=> b!794538 m!735085))

(declare-fun m!735087 () Bool)

(assert (=> b!794541 m!735087))

(declare-fun m!735089 () Bool)

(assert (=> b!794541 m!735089))

(declare-fun m!735091 () Bool)

(assert (=> b!794541 m!735091))

(declare-fun m!735093 () Bool)

(assert (=> b!794541 m!735093))

(declare-fun m!735095 () Bool)

(assert (=> b!794539 m!735095))

(declare-fun m!735097 () Bool)

(assert (=> start!68378 m!735097))

(declare-fun m!735099 () Bool)

(assert (=> start!68378 m!735099))

(declare-fun m!735101 () Bool)

(assert (=> b!794547 m!735101))

(declare-fun m!735103 () Bool)

(assert (=> b!794546 m!735103))

(assert (=> b!794546 m!735103))

(declare-fun m!735105 () Bool)

(assert (=> b!794546 m!735105))

(declare-fun m!735107 () Bool)

(assert (=> b!794543 m!735107))

(declare-fun m!735109 () Bool)

(assert (=> b!794545 m!735109))

(assert (=> b!794544 m!735103))

(assert (=> b!794544 m!735103))

(declare-fun m!735111 () Bool)

(assert (=> b!794544 m!735111))

(assert (=> b!794544 m!735103))

(declare-fun m!735113 () Bool)

(assert (=> b!794544 m!735113))

(declare-fun m!735115 () Bool)

(assert (=> b!794542 m!735115))

(push 1)

