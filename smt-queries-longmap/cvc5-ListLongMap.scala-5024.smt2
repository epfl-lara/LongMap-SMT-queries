; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68654 () Bool)

(assert start!68654)

(declare-fun res!543607 () Bool)

(declare-fun e!443164 () Bool)

(assert (=> start!68654 (=> (not res!543607) (not e!443164))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68654 (= res!543607 (validMask!0 mask!3266))))

(assert (=> start!68654 e!443164))

(assert (=> start!68654 true))

(declare-datatypes ((array!43444 0))(
  ( (array!43445 (arr!20802 (Array (_ BitVec 32) (_ BitVec 64))) (size!21223 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43444)

(declare-fun array_inv!16598 (array!43444) Bool)

(assert (=> start!68654 (array_inv!16598 a!3170)))

(declare-fun b!799080 () Bool)

(declare-fun res!543599 () Bool)

(assert (=> b!799080 (=> (not res!543599) (not e!443164))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799080 (= res!543599 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799081 () Bool)

(declare-fun res!543602 () Bool)

(assert (=> b!799081 (=> (not res!543602) (not e!443164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799081 (= res!543602 (validKeyInArray!0 k!2044))))

(declare-fun b!799082 () Bool)

(declare-fun res!543603 () Bool)

(declare-fun e!443166 () Bool)

(assert (=> b!799082 (=> (not res!543603) (not e!443166))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799082 (= res!543603 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21223 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20802 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21223 a!3170)) (= (select (arr!20802 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799083 () Bool)

(declare-fun e!443168 () Bool)

(assert (=> b!799083 (= e!443168 false)))

(declare-fun lt!356772 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8393 0))(
  ( (MissingZero!8393 (index!35940 (_ BitVec 32))) (Found!8393 (index!35941 (_ BitVec 32))) (Intermediate!8393 (undefined!9205 Bool) (index!35942 (_ BitVec 32)) (x!66823 (_ BitVec 32))) (Undefined!8393) (MissingVacant!8393 (index!35943 (_ BitVec 32))) )
))
(declare-fun lt!356771 () SeekEntryResult!8393)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43444 (_ BitVec 32)) SeekEntryResult!8393)

(assert (=> b!799083 (= lt!356771 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356772 vacantBefore!23 (select (arr!20802 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799084 () Bool)

(assert (=> b!799084 (= e!443164 e!443166)))

(declare-fun res!543608 () Bool)

(assert (=> b!799084 (=> (not res!543608) (not e!443166))))

(declare-fun lt!356777 () SeekEntryResult!8393)

(assert (=> b!799084 (= res!543608 (or (= lt!356777 (MissingZero!8393 i!1163)) (= lt!356777 (MissingVacant!8393 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43444 (_ BitVec 32)) SeekEntryResult!8393)

(assert (=> b!799084 (= lt!356777 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!799085 () Bool)

(declare-fun res!543604 () Bool)

(assert (=> b!799085 (=> (not res!543604) (not e!443166))))

(declare-datatypes ((List!14765 0))(
  ( (Nil!14762) (Cons!14761 (h!15890 (_ BitVec 64)) (t!21080 List!14765)) )
))
(declare-fun arrayNoDuplicates!0 (array!43444 (_ BitVec 32) List!14765) Bool)

(assert (=> b!799085 (= res!543604 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14762))))

(declare-fun b!799086 () Bool)

(declare-fun res!543611 () Bool)

(assert (=> b!799086 (=> (not res!543611) (not e!443164))))

(assert (=> b!799086 (= res!543611 (and (= (size!21223 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21223 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21223 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799087 () Bool)

(declare-fun e!443165 () Bool)

(declare-fun e!443167 () Bool)

(assert (=> b!799087 (= e!443165 e!443167)))

(declare-fun res!543606 () Bool)

(assert (=> b!799087 (=> (not res!543606) (not e!443167))))

(declare-fun lt!356774 () SeekEntryResult!8393)

(declare-fun lt!356770 () SeekEntryResult!8393)

(assert (=> b!799087 (= res!543606 (and (= lt!356774 lt!356770) (= lt!356770 (Found!8393 j!153)) (not (= (select (arr!20802 a!3170) index!1236) (select (arr!20802 a!3170) j!153)))))))

(assert (=> b!799087 (= lt!356770 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20802 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799087 (= lt!356774 (seekEntryOrOpen!0 (select (arr!20802 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799088 () Bool)

(declare-fun res!543600 () Bool)

(assert (=> b!799088 (=> (not res!543600) (not e!443168))))

(declare-fun lt!356776 () (_ BitVec 64))

(declare-fun lt!356775 () SeekEntryResult!8393)

(declare-fun lt!356773 () array!43444)

(assert (=> b!799088 (= res!543600 (= lt!356775 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356772 vacantAfter!23 lt!356776 lt!356773 mask!3266)))))

(declare-fun b!799089 () Bool)

(declare-fun res!543609 () Bool)

(assert (=> b!799089 (=> (not res!543609) (not e!443166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43444 (_ BitVec 32)) Bool)

(assert (=> b!799089 (= res!543609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799090 () Bool)

(declare-fun res!543605 () Bool)

(assert (=> b!799090 (=> (not res!543605) (not e!443164))))

(assert (=> b!799090 (= res!543605 (validKeyInArray!0 (select (arr!20802 a!3170) j!153)))))

(declare-fun b!799091 () Bool)

(assert (=> b!799091 (= e!443167 e!443168)))

(declare-fun res!543610 () Bool)

(assert (=> b!799091 (=> (not res!543610) (not e!443168))))

(assert (=> b!799091 (= res!543610 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356772 #b00000000000000000000000000000000) (bvslt lt!356772 (size!21223 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799091 (= lt!356772 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799092 () Bool)

(assert (=> b!799092 (= e!443166 e!443165)))

(declare-fun res!543601 () Bool)

(assert (=> b!799092 (=> (not res!543601) (not e!443165))))

(assert (=> b!799092 (= res!543601 (= lt!356775 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356776 lt!356773 mask!3266)))))

(assert (=> b!799092 (= lt!356775 (seekEntryOrOpen!0 lt!356776 lt!356773 mask!3266))))

(assert (=> b!799092 (= lt!356776 (select (store (arr!20802 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799092 (= lt!356773 (array!43445 (store (arr!20802 a!3170) i!1163 k!2044) (size!21223 a!3170)))))

(assert (= (and start!68654 res!543607) b!799086))

(assert (= (and b!799086 res!543611) b!799090))

(assert (= (and b!799090 res!543605) b!799081))

(assert (= (and b!799081 res!543602) b!799080))

(assert (= (and b!799080 res!543599) b!799084))

(assert (= (and b!799084 res!543608) b!799089))

(assert (= (and b!799089 res!543609) b!799085))

(assert (= (and b!799085 res!543604) b!799082))

(assert (= (and b!799082 res!543603) b!799092))

(assert (= (and b!799092 res!543601) b!799087))

(assert (= (and b!799087 res!543606) b!799091))

(assert (= (and b!799091 res!543610) b!799088))

(assert (= (and b!799088 res!543600) b!799083))

(declare-fun m!740063 () Bool)

(assert (=> b!799088 m!740063))

(declare-fun m!740065 () Bool)

(assert (=> b!799087 m!740065))

(declare-fun m!740067 () Bool)

(assert (=> b!799087 m!740067))

(assert (=> b!799087 m!740067))

(declare-fun m!740069 () Bool)

(assert (=> b!799087 m!740069))

(assert (=> b!799087 m!740067))

(declare-fun m!740071 () Bool)

(assert (=> b!799087 m!740071))

(declare-fun m!740073 () Bool)

(assert (=> b!799081 m!740073))

(declare-fun m!740075 () Bool)

(assert (=> b!799085 m!740075))

(declare-fun m!740077 () Bool)

(assert (=> b!799091 m!740077))

(declare-fun m!740079 () Bool)

(assert (=> b!799089 m!740079))

(assert (=> b!799090 m!740067))

(assert (=> b!799090 m!740067))

(declare-fun m!740081 () Bool)

(assert (=> b!799090 m!740081))

(declare-fun m!740083 () Bool)

(assert (=> b!799080 m!740083))

(declare-fun m!740085 () Bool)

(assert (=> start!68654 m!740085))

(declare-fun m!740087 () Bool)

(assert (=> start!68654 m!740087))

(declare-fun m!740089 () Bool)

(assert (=> b!799092 m!740089))

(declare-fun m!740091 () Bool)

(assert (=> b!799092 m!740091))

(declare-fun m!740093 () Bool)

(assert (=> b!799092 m!740093))

(declare-fun m!740095 () Bool)

(assert (=> b!799092 m!740095))

(assert (=> b!799083 m!740067))

(assert (=> b!799083 m!740067))

(declare-fun m!740097 () Bool)

(assert (=> b!799083 m!740097))

(declare-fun m!740099 () Bool)

(assert (=> b!799082 m!740099))

(declare-fun m!740101 () Bool)

(assert (=> b!799082 m!740101))

(declare-fun m!740103 () Bool)

(assert (=> b!799084 m!740103))

(push 1)

