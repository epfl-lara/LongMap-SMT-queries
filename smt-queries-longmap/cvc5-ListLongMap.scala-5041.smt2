; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68756 () Bool)

(assert start!68756)

(declare-fun b!801069 () Bool)

(declare-fun res!545590 () Bool)

(declare-fun e!444081 () Bool)

(assert (=> b!801069 (=> (not res!545590) (not e!444081))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43546 0))(
  ( (array!43547 (arr!20853 (Array (_ BitVec 32) (_ BitVec 64))) (size!21274 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43546)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801069 (= res!545590 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21274 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20853 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21274 a!3170)) (= (select (arr!20853 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801070 () Bool)

(declare-fun res!545599 () Bool)

(assert (=> b!801070 (=> (not res!545599) (not e!444081))))

(declare-datatypes ((List!14816 0))(
  ( (Nil!14813) (Cons!14812 (h!15941 (_ BitVec 64)) (t!21131 List!14816)) )
))
(declare-fun arrayNoDuplicates!0 (array!43546 (_ BitVec 32) List!14816) Bool)

(assert (=> b!801070 (= res!545599 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14813))))

(declare-fun b!801071 () Bool)

(declare-fun res!545597 () Bool)

(declare-fun e!444084 () Bool)

(assert (=> b!801071 (=> (not res!545597) (not e!444084))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801071 (= res!545597 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801073 () Bool)

(declare-fun e!444083 () Bool)

(assert (=> b!801073 (= e!444081 e!444083)))

(declare-fun res!545596 () Bool)

(assert (=> b!801073 (=> (not res!545596) (not e!444083))))

(declare-fun lt!357997 () array!43546)

(declare-fun lt!357998 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8444 0))(
  ( (MissingZero!8444 (index!36144 (_ BitVec 32))) (Found!8444 (index!36145 (_ BitVec 32))) (Intermediate!8444 (undefined!9256 Bool) (index!36146 (_ BitVec 32)) (x!67010 (_ BitVec 32))) (Undefined!8444) (MissingVacant!8444 (index!36147 (_ BitVec 32))) )
))
(declare-fun lt!357996 () SeekEntryResult!8444)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43546 (_ BitVec 32)) SeekEntryResult!8444)

(assert (=> b!801073 (= res!545596 (= lt!357996 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357998 lt!357997 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43546 (_ BitVec 32)) SeekEntryResult!8444)

(assert (=> b!801073 (= lt!357996 (seekEntryOrOpen!0 lt!357998 lt!357997 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801073 (= lt!357998 (select (store (arr!20853 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801073 (= lt!357997 (array!43547 (store (arr!20853 a!3170) i!1163 k!2044) (size!21274 a!3170)))))

(declare-fun b!801074 () Bool)

(declare-fun res!545595 () Bool)

(assert (=> b!801074 (=> (not res!545595) (not e!444084))))

(assert (=> b!801074 (= res!545595 (and (= (size!21274 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21274 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21274 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801075 () Bool)

(declare-fun res!545591 () Bool)

(assert (=> b!801075 (=> (not res!545591) (not e!444081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43546 (_ BitVec 32)) Bool)

(assert (=> b!801075 (= res!545591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801076 () Bool)

(declare-fun res!545600 () Bool)

(declare-fun e!444085 () Bool)

(assert (=> b!801076 (=> (not res!545600) (not e!444085))))

(declare-fun lt!357994 () (_ BitVec 32))

(assert (=> b!801076 (= res!545600 (= lt!357996 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357994 vacantAfter!23 lt!357998 lt!357997 mask!3266)))))

(declare-fun b!801077 () Bool)

(declare-fun e!444086 () Bool)

(assert (=> b!801077 (= e!444086 e!444085)))

(declare-fun res!545588 () Bool)

(assert (=> b!801077 (=> (not res!545588) (not e!444085))))

(assert (=> b!801077 (= res!545588 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357994 #b00000000000000000000000000000000) (bvslt lt!357994 (size!21274 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801077 (= lt!357994 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801078 () Bool)

(assert (=> b!801078 (= e!444085 false)))

(declare-fun lt!358001 () SeekEntryResult!8444)

(assert (=> b!801078 (= lt!358001 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357994 vacantBefore!23 (select (arr!20853 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545592 () Bool)

(assert (=> start!68756 (=> (not res!545592) (not e!444084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68756 (= res!545592 (validMask!0 mask!3266))))

(assert (=> start!68756 e!444084))

(assert (=> start!68756 true))

(declare-fun array_inv!16649 (array!43546) Bool)

(assert (=> start!68756 (array_inv!16649 a!3170)))

(declare-fun b!801072 () Bool)

(assert (=> b!801072 (= e!444083 e!444086)))

(declare-fun res!545593 () Bool)

(assert (=> b!801072 (=> (not res!545593) (not e!444086))))

(declare-fun lt!357995 () SeekEntryResult!8444)

(declare-fun lt!358000 () SeekEntryResult!8444)

(assert (=> b!801072 (= res!545593 (and (= lt!358000 lt!357995) (= lt!357995 (Found!8444 j!153)) (not (= (select (arr!20853 a!3170) index!1236) (select (arr!20853 a!3170) j!153)))))))

(assert (=> b!801072 (= lt!357995 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20853 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801072 (= lt!358000 (seekEntryOrOpen!0 (select (arr!20853 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801079 () Bool)

(declare-fun res!545594 () Bool)

(assert (=> b!801079 (=> (not res!545594) (not e!444084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801079 (= res!545594 (validKeyInArray!0 (select (arr!20853 a!3170) j!153)))))

(declare-fun b!801080 () Bool)

(assert (=> b!801080 (= e!444084 e!444081)))

(declare-fun res!545598 () Bool)

(assert (=> b!801080 (=> (not res!545598) (not e!444081))))

(declare-fun lt!357999 () SeekEntryResult!8444)

(assert (=> b!801080 (= res!545598 (or (= lt!357999 (MissingZero!8444 i!1163)) (= lt!357999 (MissingVacant!8444 i!1163))))))

(assert (=> b!801080 (= lt!357999 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801081 () Bool)

(declare-fun res!545589 () Bool)

(assert (=> b!801081 (=> (not res!545589) (not e!444084))))

(assert (=> b!801081 (= res!545589 (validKeyInArray!0 k!2044))))

(assert (= (and start!68756 res!545592) b!801074))

(assert (= (and b!801074 res!545595) b!801079))

(assert (= (and b!801079 res!545594) b!801081))

(assert (= (and b!801081 res!545589) b!801071))

(assert (= (and b!801071 res!545597) b!801080))

(assert (= (and b!801080 res!545598) b!801075))

(assert (= (and b!801075 res!545591) b!801070))

(assert (= (and b!801070 res!545599) b!801069))

(assert (= (and b!801069 res!545590) b!801073))

(assert (= (and b!801073 res!545596) b!801072))

(assert (= (and b!801072 res!545593) b!801077))

(assert (= (and b!801077 res!545588) b!801076))

(assert (= (and b!801076 res!545600) b!801078))

(declare-fun m!742205 () Bool)

(assert (=> b!801078 m!742205))

(assert (=> b!801078 m!742205))

(declare-fun m!742207 () Bool)

(assert (=> b!801078 m!742207))

(declare-fun m!742209 () Bool)

(assert (=> b!801081 m!742209))

(assert (=> b!801079 m!742205))

(assert (=> b!801079 m!742205))

(declare-fun m!742211 () Bool)

(assert (=> b!801079 m!742211))

(declare-fun m!742213 () Bool)

(assert (=> b!801070 m!742213))

(declare-fun m!742215 () Bool)

(assert (=> b!801072 m!742215))

(assert (=> b!801072 m!742205))

(assert (=> b!801072 m!742205))

(declare-fun m!742217 () Bool)

(assert (=> b!801072 m!742217))

(assert (=> b!801072 m!742205))

(declare-fun m!742219 () Bool)

(assert (=> b!801072 m!742219))

(declare-fun m!742221 () Bool)

(assert (=> b!801080 m!742221))

(declare-fun m!742223 () Bool)

(assert (=> b!801069 m!742223))

(declare-fun m!742225 () Bool)

(assert (=> b!801069 m!742225))

(declare-fun m!742227 () Bool)

(assert (=> b!801073 m!742227))

(declare-fun m!742229 () Bool)

(assert (=> b!801073 m!742229))

(declare-fun m!742231 () Bool)

(assert (=> b!801073 m!742231))

(declare-fun m!742233 () Bool)

(assert (=> b!801073 m!742233))

(declare-fun m!742235 () Bool)

(assert (=> b!801077 m!742235))

(declare-fun m!742237 () Bool)

(assert (=> b!801076 m!742237))

(declare-fun m!742239 () Bool)

(assert (=> b!801071 m!742239))

(declare-fun m!742241 () Bool)

(assert (=> start!68756 m!742241))

(declare-fun m!742243 () Bool)

(assert (=> start!68756 m!742243))

(declare-fun m!742245 () Bool)

(assert (=> b!801075 m!742245))

(push 1)

(assert (not b!801075))

(assert (not b!801076))

(assert (not b!801080))

(assert (not b!801081))

(assert (not b!801079))

(assert (not b!801071))

(assert (not start!68756))

(assert (not b!801073))

