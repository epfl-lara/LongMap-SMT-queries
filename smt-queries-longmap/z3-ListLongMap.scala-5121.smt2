; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69528 () Bool)

(assert start!69528)

(declare-fun b!810226 () Bool)

(declare-fun res!553651 () Bool)

(declare-fun e!448470 () Bool)

(assert (=> b!810226 (=> (not res!553651) (not e!448470))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810226 (= res!553651 (validKeyInArray!0 k0!2044))))

(declare-fun b!810227 () Bool)

(declare-fun e!448471 () Bool)

(declare-fun e!448469 () Bool)

(assert (=> b!810227 (= e!448471 e!448469)))

(declare-fun res!553655 () Bool)

(assert (=> b!810227 (=> (not res!553655) (not e!448469))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44041 0))(
  ( (array!44042 (arr!21092 (Array (_ BitVec 32) (_ BitVec 64))) (size!21513 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44041)

(declare-fun lt!363005 () (_ BitVec 32))

(assert (=> b!810227 (= res!553655 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363005 #b00000000000000000000000000000000) (bvslt lt!363005 (size!21513 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810227 (= lt!363005 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810228 () Bool)

(declare-fun res!553656 () Bool)

(assert (=> b!810228 (=> (not res!553656) (not e!448470))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810228 (= res!553656 (validKeyInArray!0 (select (arr!21092 a!3170) j!153)))))

(declare-fun b!810229 () Bool)

(declare-fun e!448466 () Bool)

(declare-fun e!448467 () Bool)

(assert (=> b!810229 (= e!448466 e!448467)))

(declare-fun res!553647 () Bool)

(assert (=> b!810229 (=> (not res!553647) (not e!448467))))

(declare-datatypes ((SeekEntryResult!8680 0))(
  ( (MissingZero!8680 (index!37088 (_ BitVec 32))) (Found!8680 (index!37089 (_ BitVec 32))) (Intermediate!8680 (undefined!9492 Bool) (index!37090 (_ BitVec 32)) (x!67911 (_ BitVec 32))) (Undefined!8680) (MissingVacant!8680 (index!37091 (_ BitVec 32))) )
))
(declare-fun lt!363004 () SeekEntryResult!8680)

(declare-fun lt!363003 () SeekEntryResult!8680)

(assert (=> b!810229 (= res!553647 (= lt!363004 lt!363003))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44041 (_ BitVec 32)) SeekEntryResult!8680)

(assert (=> b!810229 (= lt!363003 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21092 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44041 (_ BitVec 32)) SeekEntryResult!8680)

(assert (=> b!810229 (= lt!363004 (seekEntryOrOpen!0 (select (arr!21092 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810230 () Bool)

(declare-fun res!553643 () Bool)

(declare-fun e!448468 () Bool)

(assert (=> b!810230 (=> (not res!553643) (not e!448468))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810230 (= res!553643 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21513 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21092 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21513 a!3170)) (= (select (arr!21092 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810231 () Bool)

(declare-fun res!553644 () Bool)

(assert (=> b!810231 (=> (not res!553644) (not e!448470))))

(declare-fun arrayContainsKey!0 (array!44041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810231 (= res!553644 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810232 () Bool)

(declare-fun res!553652 () Bool)

(assert (=> b!810232 (=> (not res!553652) (not e!448470))))

(assert (=> b!810232 (= res!553652 (and (= (size!21513 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21513 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21513 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810234 () Bool)

(declare-fun res!553648 () Bool)

(assert (=> b!810234 (=> (not res!553648) (not e!448468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44041 (_ BitVec 32)) Bool)

(assert (=> b!810234 (= res!553648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810235 () Bool)

(declare-fun res!553650 () Bool)

(assert (=> b!810235 (=> (not res!553650) (not e!448469))))

(declare-fun lt!363011 () array!44041)

(declare-fun lt!363010 () SeekEntryResult!8680)

(declare-fun lt!363009 () (_ BitVec 64))

(assert (=> b!810235 (= res!553650 (= lt!363010 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363005 vacantAfter!23 lt!363009 lt!363011 mask!3266)))))

(declare-fun lt!363007 () SeekEntryResult!8680)

(declare-fun b!810236 () Bool)

(declare-fun lt!363006 () SeekEntryResult!8680)

(assert (=> b!810236 (= e!448469 (and (= lt!363004 lt!363007) (= lt!363007 lt!363006) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1077)) (bvsub #b01111111111111111111111111111110 x!1077))))))

(assert (=> b!810236 (= lt!363007 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363005 vacantBefore!23 (select (arr!21092 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810237 () Bool)

(assert (=> b!810237 (= e!448470 e!448468)))

(declare-fun res!553646 () Bool)

(assert (=> b!810237 (=> (not res!553646) (not e!448468))))

(declare-fun lt!363008 () SeekEntryResult!8680)

(assert (=> b!810237 (= res!553646 (or (= lt!363008 (MissingZero!8680 i!1163)) (= lt!363008 (MissingVacant!8680 i!1163))))))

(assert (=> b!810237 (= lt!363008 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810233 () Bool)

(assert (=> b!810233 (= e!448468 e!448466)))

(declare-fun res!553649 () Bool)

(assert (=> b!810233 (=> (not res!553649) (not e!448466))))

(assert (=> b!810233 (= res!553649 (= lt!363010 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363009 lt!363011 mask!3266)))))

(assert (=> b!810233 (= lt!363010 (seekEntryOrOpen!0 lt!363009 lt!363011 mask!3266))))

(assert (=> b!810233 (= lt!363009 (select (store (arr!21092 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810233 (= lt!363011 (array!44042 (store (arr!21092 a!3170) i!1163 k0!2044) (size!21513 a!3170)))))

(declare-fun res!553645 () Bool)

(assert (=> start!69528 (=> (not res!553645) (not e!448470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69528 (= res!553645 (validMask!0 mask!3266))))

(assert (=> start!69528 e!448470))

(assert (=> start!69528 true))

(declare-fun array_inv!16975 (array!44041) Bool)

(assert (=> start!69528 (array_inv!16975 a!3170)))

(declare-fun b!810238 () Bool)

(assert (=> b!810238 (= e!448467 e!448471)))

(declare-fun res!553654 () Bool)

(assert (=> b!810238 (=> (not res!553654) (not e!448471))))

(assert (=> b!810238 (= res!553654 (and (= lt!363003 lt!363006) (not (= (select (arr!21092 a!3170) index!1236) (select (arr!21092 a!3170) j!153)))))))

(assert (=> b!810238 (= lt!363006 (Found!8680 j!153))))

(declare-fun b!810239 () Bool)

(declare-fun res!553653 () Bool)

(assert (=> b!810239 (=> (not res!553653) (not e!448468))))

(declare-datatypes ((List!15094 0))(
  ( (Nil!15091) (Cons!15090 (h!16219 (_ BitVec 64)) (t!21400 List!15094)) )
))
(declare-fun arrayNoDuplicates!0 (array!44041 (_ BitVec 32) List!15094) Bool)

(assert (=> b!810239 (= res!553653 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15091))))

(assert (= (and start!69528 res!553645) b!810232))

(assert (= (and b!810232 res!553652) b!810228))

(assert (= (and b!810228 res!553656) b!810226))

(assert (= (and b!810226 res!553651) b!810231))

(assert (= (and b!810231 res!553644) b!810237))

(assert (= (and b!810237 res!553646) b!810234))

(assert (= (and b!810234 res!553648) b!810239))

(assert (= (and b!810239 res!553653) b!810230))

(assert (= (and b!810230 res!553643) b!810233))

(assert (= (and b!810233 res!553649) b!810229))

(assert (= (and b!810229 res!553647) b!810238))

(assert (= (and b!810238 res!553654) b!810227))

(assert (= (and b!810227 res!553655) b!810235))

(assert (= (and b!810235 res!553650) b!810236))

(declare-fun m!751921 () Bool)

(assert (=> b!810228 m!751921))

(assert (=> b!810228 m!751921))

(declare-fun m!751923 () Bool)

(assert (=> b!810228 m!751923))

(declare-fun m!751925 () Bool)

(assert (=> b!810231 m!751925))

(declare-fun m!751927 () Bool)

(assert (=> b!810233 m!751927))

(declare-fun m!751929 () Bool)

(assert (=> b!810233 m!751929))

(declare-fun m!751931 () Bool)

(assert (=> b!810233 m!751931))

(declare-fun m!751933 () Bool)

(assert (=> b!810233 m!751933))

(declare-fun m!751935 () Bool)

(assert (=> b!810227 m!751935))

(declare-fun m!751937 () Bool)

(assert (=> b!810230 m!751937))

(declare-fun m!751939 () Bool)

(assert (=> b!810230 m!751939))

(declare-fun m!751941 () Bool)

(assert (=> start!69528 m!751941))

(declare-fun m!751943 () Bool)

(assert (=> start!69528 m!751943))

(declare-fun m!751945 () Bool)

(assert (=> b!810235 m!751945))

(declare-fun m!751947 () Bool)

(assert (=> b!810234 m!751947))

(declare-fun m!751949 () Bool)

(assert (=> b!810238 m!751949))

(assert (=> b!810238 m!751921))

(declare-fun m!751951 () Bool)

(assert (=> b!810239 m!751951))

(assert (=> b!810236 m!751921))

(assert (=> b!810236 m!751921))

(declare-fun m!751953 () Bool)

(assert (=> b!810236 m!751953))

(assert (=> b!810229 m!751921))

(assert (=> b!810229 m!751921))

(declare-fun m!751955 () Bool)

(assert (=> b!810229 m!751955))

(assert (=> b!810229 m!751921))

(declare-fun m!751957 () Bool)

(assert (=> b!810229 m!751957))

(declare-fun m!751959 () Bool)

(assert (=> b!810226 m!751959))

(declare-fun m!751961 () Bool)

(assert (=> b!810237 m!751961))

(check-sat (not b!810227) (not b!810233) (not b!810226) (not b!810234) (not b!810239) (not b!810235) (not start!69528) (not b!810237) (not b!810231) (not b!810228) (not b!810229) (not b!810236))
(check-sat)
