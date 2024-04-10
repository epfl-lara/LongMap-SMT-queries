; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69394 () Bool)

(assert start!69394)

(declare-fun b!809081 () Bool)

(declare-fun res!552812 () Bool)

(declare-fun e!447887 () Bool)

(assert (=> b!809081 (=> (not res!552812) (not e!447887))))

(declare-datatypes ((array!43992 0))(
  ( (array!43993 (arr!21070 (Array (_ BitVec 32) (_ BitVec 64))) (size!21491 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43992)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809081 (= res!552812 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809082 () Bool)

(declare-fun res!552818 () Bool)

(assert (=> b!809082 (=> (not res!552818) (not e!447887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809082 (= res!552818 (validKeyInArray!0 k0!2044))))

(declare-fun b!809083 () Bool)

(declare-fun e!447885 () Bool)

(assert (=> b!809083 (= e!447885 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362552 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809083 (= lt!362552 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809084 () Bool)

(declare-fun e!447883 () Bool)

(declare-fun e!447886 () Bool)

(assert (=> b!809084 (= e!447883 e!447886)))

(declare-fun res!552813 () Bool)

(assert (=> b!809084 (=> (not res!552813) (not e!447886))))

(declare-fun lt!362550 () array!43992)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362551 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8661 0))(
  ( (MissingZero!8661 (index!37012 (_ BitVec 32))) (Found!8661 (index!37013 (_ BitVec 32))) (Intermediate!8661 (undefined!9473 Bool) (index!37014 (_ BitVec 32)) (x!67821 (_ BitVec 32))) (Undefined!8661) (MissingVacant!8661 (index!37015 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43992 (_ BitVec 32)) SeekEntryResult!8661)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43992 (_ BitVec 32)) SeekEntryResult!8661)

(assert (=> b!809084 (= res!552813 (= (seekEntryOrOpen!0 lt!362551 lt!362550 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362551 lt!362550 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809084 (= lt!362551 (select (store (arr!21070 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809084 (= lt!362550 (array!43993 (store (arr!21070 a!3170) i!1163 k0!2044) (size!21491 a!3170)))))

(declare-fun b!809085 () Bool)

(declare-fun res!552817 () Bool)

(assert (=> b!809085 (=> (not res!552817) (not e!447887))))

(assert (=> b!809085 (= res!552817 (and (= (size!21491 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21491 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21491 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809086 () Bool)

(declare-fun res!552809 () Bool)

(assert (=> b!809086 (=> (not res!552809) (not e!447883))))

(declare-datatypes ((List!15033 0))(
  ( (Nil!15030) (Cons!15029 (h!16158 (_ BitVec 64)) (t!21348 List!15033)) )
))
(declare-fun arrayNoDuplicates!0 (array!43992 (_ BitVec 32) List!15033) Bool)

(assert (=> b!809086 (= res!552809 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15030))))

(declare-fun b!809087 () Bool)

(assert (=> b!809087 (= e!447886 e!447885)))

(declare-fun res!552815 () Bool)

(assert (=> b!809087 (=> (not res!552815) (not e!447885))))

(declare-fun lt!362555 () SeekEntryResult!8661)

(declare-fun lt!362553 () SeekEntryResult!8661)

(assert (=> b!809087 (= res!552815 (and (= lt!362553 lt!362555) (= lt!362555 (Found!8661 j!153)) (not (= (select (arr!21070 a!3170) index!1236) (select (arr!21070 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809087 (= lt!362555 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21070 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809087 (= lt!362553 (seekEntryOrOpen!0 (select (arr!21070 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809088 () Bool)

(declare-fun res!552816 () Bool)

(assert (=> b!809088 (=> (not res!552816) (not e!447883))))

(assert (=> b!809088 (= res!552816 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21491 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21070 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21491 a!3170)) (= (select (arr!21070 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809089 () Bool)

(assert (=> b!809089 (= e!447887 e!447883)))

(declare-fun res!552808 () Bool)

(assert (=> b!809089 (=> (not res!552808) (not e!447883))))

(declare-fun lt!362554 () SeekEntryResult!8661)

(assert (=> b!809089 (= res!552808 (or (= lt!362554 (MissingZero!8661 i!1163)) (= lt!362554 (MissingVacant!8661 i!1163))))))

(assert (=> b!809089 (= lt!362554 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809090 () Bool)

(declare-fun res!552811 () Bool)

(assert (=> b!809090 (=> (not res!552811) (not e!447883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43992 (_ BitVec 32)) Bool)

(assert (=> b!809090 (= res!552811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!552814 () Bool)

(assert (=> start!69394 (=> (not res!552814) (not e!447887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69394 (= res!552814 (validMask!0 mask!3266))))

(assert (=> start!69394 e!447887))

(assert (=> start!69394 true))

(declare-fun array_inv!16866 (array!43992) Bool)

(assert (=> start!69394 (array_inv!16866 a!3170)))

(declare-fun b!809091 () Bool)

(declare-fun res!552810 () Bool)

(assert (=> b!809091 (=> (not res!552810) (not e!447887))))

(assert (=> b!809091 (= res!552810 (validKeyInArray!0 (select (arr!21070 a!3170) j!153)))))

(assert (= (and start!69394 res!552814) b!809085))

(assert (= (and b!809085 res!552817) b!809091))

(assert (= (and b!809091 res!552810) b!809082))

(assert (= (and b!809082 res!552818) b!809081))

(assert (= (and b!809081 res!552812) b!809089))

(assert (= (and b!809089 res!552808) b!809090))

(assert (= (and b!809090 res!552811) b!809086))

(assert (= (and b!809086 res!552809) b!809088))

(assert (= (and b!809088 res!552816) b!809084))

(assert (= (and b!809084 res!552813) b!809087))

(assert (= (and b!809087 res!552815) b!809083))

(declare-fun m!751219 () Bool)

(assert (=> b!809087 m!751219))

(declare-fun m!751221 () Bool)

(assert (=> b!809087 m!751221))

(assert (=> b!809087 m!751221))

(declare-fun m!751223 () Bool)

(assert (=> b!809087 m!751223))

(assert (=> b!809087 m!751221))

(declare-fun m!751225 () Bool)

(assert (=> b!809087 m!751225))

(declare-fun m!751227 () Bool)

(assert (=> b!809090 m!751227))

(declare-fun m!751229 () Bool)

(assert (=> start!69394 m!751229))

(declare-fun m!751231 () Bool)

(assert (=> start!69394 m!751231))

(declare-fun m!751233 () Bool)

(assert (=> b!809084 m!751233))

(declare-fun m!751235 () Bool)

(assert (=> b!809084 m!751235))

(declare-fun m!751237 () Bool)

(assert (=> b!809084 m!751237))

(declare-fun m!751239 () Bool)

(assert (=> b!809084 m!751239))

(declare-fun m!751241 () Bool)

(assert (=> b!809086 m!751241))

(assert (=> b!809091 m!751221))

(assert (=> b!809091 m!751221))

(declare-fun m!751243 () Bool)

(assert (=> b!809091 m!751243))

(declare-fun m!751245 () Bool)

(assert (=> b!809081 m!751245))

(declare-fun m!751247 () Bool)

(assert (=> b!809083 m!751247))

(declare-fun m!751249 () Bool)

(assert (=> b!809089 m!751249))

(declare-fun m!751251 () Bool)

(assert (=> b!809082 m!751251))

(declare-fun m!751253 () Bool)

(assert (=> b!809088 m!751253))

(declare-fun m!751255 () Bool)

(assert (=> b!809088 m!751255))

(check-sat (not start!69394) (not b!809091) (not b!809087) (not b!809083) (not b!809086) (not b!809089) (not b!809081) (not b!809090) (not b!809084) (not b!809082))
(check-sat)
