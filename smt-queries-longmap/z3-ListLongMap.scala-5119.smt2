; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69484 () Bool)

(assert start!69484)

(declare-fun b!809973 () Bool)

(declare-fun res!553489 () Bool)

(declare-fun e!448340 () Bool)

(assert (=> b!809973 (=> (not res!553489) (not e!448340))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809973 (= res!553489 (validKeyInArray!0 k0!2044))))

(declare-fun b!809974 () Bool)

(declare-fun res!553494 () Bool)

(declare-fun e!448339 () Bool)

(assert (=> b!809974 (=> (not res!553494) (not e!448339))))

(declare-datatypes ((array!44031 0))(
  ( (array!44032 (arr!21088 (Array (_ BitVec 32) (_ BitVec 64))) (size!21509 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44031)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44031 (_ BitVec 32)) Bool)

(assert (=> b!809974 (= res!553494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809975 () Bool)

(declare-fun e!448338 () Bool)

(declare-fun e!448341 () Bool)

(assert (=> b!809975 (= e!448338 e!448341)))

(declare-fun res!553493 () Bool)

(assert (=> b!809975 (=> (not res!553493) (not e!448341))))

(declare-fun lt!363005 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!809975 (= res!553493 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363005 #b00000000000000000000000000000000) (bvslt lt!363005 (size!21509 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809975 (= lt!363005 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-datatypes ((SeekEntryResult!8679 0))(
  ( (MissingZero!8679 (index!37084 (_ BitVec 32))) (Found!8679 (index!37085 (_ BitVec 32))) (Intermediate!8679 (undefined!9491 Bool) (index!37086 (_ BitVec 32)) (x!67893 (_ BitVec 32))) (Undefined!8679) (MissingVacant!8679 (index!37087 (_ BitVec 32))) )
))
(declare-fun lt!362999 () SeekEntryResult!8679)

(declare-fun b!809976 () Bool)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44031 (_ BitVec 32)) SeekEntryResult!8679)

(assert (=> b!809976 (= e!448341 (not (= lt!362999 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363005 vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))))

(declare-fun b!809977 () Bool)

(declare-fun res!553484 () Bool)

(assert (=> b!809977 (=> (not res!553484) (not e!448340))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809977 (= res!553484 (and (= (size!21509 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21509 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21509 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809978 () Bool)

(declare-fun res!553495 () Bool)

(assert (=> b!809978 (=> (not res!553495) (not e!448340))))

(assert (=> b!809978 (= res!553495 (validKeyInArray!0 (select (arr!21088 a!3170) j!153)))))

(declare-fun b!809979 () Bool)

(declare-fun res!553490 () Bool)

(assert (=> b!809979 (=> (not res!553490) (not e!448341))))

(declare-fun lt!363003 () SeekEntryResult!8679)

(declare-fun lt!363000 () array!44031)

(declare-fun lt!363002 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!809979 (= res!553490 (= lt!363003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363005 vacantAfter!23 lt!363002 lt!363000 mask!3266)))))

(declare-fun b!809981 () Bool)

(declare-fun e!448342 () Bool)

(assert (=> b!809981 (= e!448339 e!448342)))

(declare-fun res!553486 () Bool)

(assert (=> b!809981 (=> (not res!553486) (not e!448342))))

(assert (=> b!809981 (= res!553486 (= lt!363003 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363002 lt!363000 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44031 (_ BitVec 32)) SeekEntryResult!8679)

(assert (=> b!809981 (= lt!363003 (seekEntryOrOpen!0 lt!363002 lt!363000 mask!3266))))

(assert (=> b!809981 (= lt!363002 (select (store (arr!21088 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809981 (= lt!363000 (array!44032 (store (arr!21088 a!3170) i!1163 k0!2044) (size!21509 a!3170)))))

(declare-fun b!809982 () Bool)

(declare-fun res!553496 () Bool)

(assert (=> b!809982 (=> (not res!553496) (not e!448340))))

(declare-fun arrayContainsKey!0 (array!44031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809982 (= res!553496 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809983 () Bool)

(assert (=> b!809983 (= e!448342 e!448338)))

(declare-fun res!553485 () Bool)

(assert (=> b!809983 (=> (not res!553485) (not e!448338))))

(declare-fun lt!363004 () SeekEntryResult!8679)

(assert (=> b!809983 (= res!553485 (and (= lt!362999 lt!363004) (= lt!363004 (Found!8679 j!153)) (not (= (select (arr!21088 a!3170) index!1236) (select (arr!21088 a!3170) j!153)))))))

(assert (=> b!809983 (= lt!363004 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809983 (= lt!362999 (seekEntryOrOpen!0 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809984 () Bool)

(declare-fun res!553488 () Bool)

(assert (=> b!809984 (=> (not res!553488) (not e!448339))))

(assert (=> b!809984 (= res!553488 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21509 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21088 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21509 a!3170)) (= (select (arr!21088 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809985 () Bool)

(declare-fun res!553487 () Bool)

(assert (=> b!809985 (=> (not res!553487) (not e!448339))))

(declare-datatypes ((List!15051 0))(
  ( (Nil!15048) (Cons!15047 (h!16176 (_ BitVec 64)) (t!21366 List!15051)) )
))
(declare-fun arrayNoDuplicates!0 (array!44031 (_ BitVec 32) List!15051) Bool)

(assert (=> b!809985 (= res!553487 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15048))))

(declare-fun b!809980 () Bool)

(assert (=> b!809980 (= e!448340 e!448339)))

(declare-fun res!553492 () Bool)

(assert (=> b!809980 (=> (not res!553492) (not e!448339))))

(declare-fun lt!363001 () SeekEntryResult!8679)

(assert (=> b!809980 (= res!553492 (or (= lt!363001 (MissingZero!8679 i!1163)) (= lt!363001 (MissingVacant!8679 i!1163))))))

(assert (=> b!809980 (= lt!363001 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!553491 () Bool)

(assert (=> start!69484 (=> (not res!553491) (not e!448340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69484 (= res!553491 (validMask!0 mask!3266))))

(assert (=> start!69484 e!448340))

(assert (=> start!69484 true))

(declare-fun array_inv!16884 (array!44031) Bool)

(assert (=> start!69484 (array_inv!16884 a!3170)))

(assert (= (and start!69484 res!553491) b!809977))

(assert (= (and b!809977 res!553484) b!809978))

(assert (= (and b!809978 res!553495) b!809973))

(assert (= (and b!809973 res!553489) b!809982))

(assert (= (and b!809982 res!553496) b!809980))

(assert (= (and b!809980 res!553492) b!809974))

(assert (= (and b!809974 res!553494) b!809985))

(assert (= (and b!809985 res!553487) b!809984))

(assert (= (and b!809984 res!553488) b!809981))

(assert (= (and b!809981 res!553486) b!809983))

(assert (= (and b!809983 res!553485) b!809975))

(assert (= (and b!809975 res!553493) b!809979))

(assert (= (and b!809979 res!553490) b!809976))

(declare-fun m!752171 () Bool)

(assert (=> b!809975 m!752171))

(declare-fun m!752173 () Bool)

(assert (=> b!809976 m!752173))

(assert (=> b!809976 m!752173))

(declare-fun m!752175 () Bool)

(assert (=> b!809976 m!752175))

(declare-fun m!752177 () Bool)

(assert (=> b!809981 m!752177))

(declare-fun m!752179 () Bool)

(assert (=> b!809981 m!752179))

(declare-fun m!752181 () Bool)

(assert (=> b!809981 m!752181))

(declare-fun m!752183 () Bool)

(assert (=> b!809981 m!752183))

(declare-fun m!752185 () Bool)

(assert (=> start!69484 m!752185))

(declare-fun m!752187 () Bool)

(assert (=> start!69484 m!752187))

(declare-fun m!752189 () Bool)

(assert (=> b!809984 m!752189))

(declare-fun m!752191 () Bool)

(assert (=> b!809984 m!752191))

(declare-fun m!752193 () Bool)

(assert (=> b!809979 m!752193))

(declare-fun m!752195 () Bool)

(assert (=> b!809985 m!752195))

(declare-fun m!752197 () Bool)

(assert (=> b!809973 m!752197))

(declare-fun m!752199 () Bool)

(assert (=> b!809974 m!752199))

(declare-fun m!752201 () Bool)

(assert (=> b!809980 m!752201))

(assert (=> b!809978 m!752173))

(assert (=> b!809978 m!752173))

(declare-fun m!752203 () Bool)

(assert (=> b!809978 m!752203))

(declare-fun m!752205 () Bool)

(assert (=> b!809982 m!752205))

(declare-fun m!752207 () Bool)

(assert (=> b!809983 m!752207))

(assert (=> b!809983 m!752173))

(assert (=> b!809983 m!752173))

(declare-fun m!752209 () Bool)

(assert (=> b!809983 m!752209))

(assert (=> b!809983 m!752173))

(declare-fun m!752211 () Bool)

(assert (=> b!809983 m!752211))

(check-sat (not b!809980) (not b!809974) (not b!809976) (not b!809978) (not start!69484) (not b!809979) (not b!809975) (not b!809983) (not b!809982) (not b!809981) (not b!809973) (not b!809985))
(check-sat)
(get-model)

(declare-fun d!103999 () Bool)

(declare-fun res!553540 () Bool)

(declare-fun e!448366 () Bool)

(assert (=> d!103999 (=> res!553540 e!448366)))

(assert (=> d!103999 (= res!553540 (= (select (arr!21088 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103999 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448366)))

(declare-fun b!810029 () Bool)

(declare-fun e!448367 () Bool)

(assert (=> b!810029 (= e!448366 e!448367)))

(declare-fun res!553541 () Bool)

(assert (=> b!810029 (=> (not res!553541) (not e!448367))))

(assert (=> b!810029 (= res!553541 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21509 a!3170)))))

(declare-fun b!810030 () Bool)

(assert (=> b!810030 (= e!448367 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103999 (not res!553540)) b!810029))

(assert (= (and b!810029 res!553541) b!810030))

(declare-fun m!752255 () Bool)

(assert (=> d!103999 m!752255))

(declare-fun m!752257 () Bool)

(assert (=> b!810030 m!752257))

(assert (=> b!809982 d!103999))

(declare-fun b!810043 () Bool)

(declare-fun e!448375 () SeekEntryResult!8679)

(assert (=> b!810043 (= e!448375 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!363002 lt!363000 mask!3266))))

(declare-fun b!810044 () Bool)

(declare-fun e!448374 () SeekEntryResult!8679)

(assert (=> b!810044 (= e!448374 Undefined!8679)))

(declare-fun b!810045 () Bool)

(declare-fun c!88663 () Bool)

(declare-fun lt!363031 () (_ BitVec 64))

(assert (=> b!810045 (= c!88663 (= lt!363031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448376 () SeekEntryResult!8679)

(assert (=> b!810045 (= e!448376 e!448375)))

(declare-fun b!810047 () Bool)

(assert (=> b!810047 (= e!448375 (MissingVacant!8679 vacantAfter!23))))

(declare-fun b!810048 () Bool)

(assert (=> b!810048 (= e!448376 (Found!8679 index!1236))))

(declare-fun b!810046 () Bool)

(assert (=> b!810046 (= e!448374 e!448376)))

(declare-fun c!88661 () Bool)

(assert (=> b!810046 (= c!88661 (= lt!363031 lt!363002))))

(declare-fun lt!363032 () SeekEntryResult!8679)

(declare-fun d!104001 () Bool)

(get-info :version)

(assert (=> d!104001 (and (or ((_ is Undefined!8679) lt!363032) (not ((_ is Found!8679) lt!363032)) (and (bvsge (index!37085 lt!363032) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363032) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363032) ((_ is Found!8679) lt!363032) (not ((_ is MissingVacant!8679) lt!363032)) (not (= (index!37087 lt!363032) vacantAfter!23)) (and (bvsge (index!37087 lt!363032) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363032) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363032) (ite ((_ is Found!8679) lt!363032) (= (select (arr!21088 lt!363000) (index!37085 lt!363032)) lt!363002) (and ((_ is MissingVacant!8679) lt!363032) (= (index!37087 lt!363032) vacantAfter!23) (= (select (arr!21088 lt!363000) (index!37087 lt!363032)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104001 (= lt!363032 e!448374)))

(declare-fun c!88662 () Bool)

(assert (=> d!104001 (= c!88662 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104001 (= lt!363031 (select (arr!21088 lt!363000) index!1236))))

(assert (=> d!104001 (validMask!0 mask!3266)))

(assert (=> d!104001 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363002 lt!363000 mask!3266) lt!363032)))

(assert (= (and d!104001 c!88662) b!810044))

(assert (= (and d!104001 (not c!88662)) b!810046))

(assert (= (and b!810046 c!88661) b!810048))

(assert (= (and b!810046 (not c!88661)) b!810045))

(assert (= (and b!810045 c!88663) b!810047))

(assert (= (and b!810045 (not c!88663)) b!810043))

(assert (=> b!810043 m!752171))

(assert (=> b!810043 m!752171))

(declare-fun m!752259 () Bool)

(assert (=> b!810043 m!752259))

(declare-fun m!752261 () Bool)

(assert (=> d!104001 m!752261))

(declare-fun m!752263 () Bool)

(assert (=> d!104001 m!752263))

(declare-fun m!752265 () Bool)

(assert (=> d!104001 m!752265))

(assert (=> d!104001 m!752185))

(assert (=> b!809981 d!104001))

(declare-fun d!104003 () Bool)

(declare-fun lt!363051 () SeekEntryResult!8679)

(assert (=> d!104003 (and (or ((_ is Undefined!8679) lt!363051) (not ((_ is Found!8679) lt!363051)) (and (bvsge (index!37085 lt!363051) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363051) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363051) ((_ is Found!8679) lt!363051) (not ((_ is MissingZero!8679) lt!363051)) (and (bvsge (index!37084 lt!363051) #b00000000000000000000000000000000) (bvslt (index!37084 lt!363051) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363051) ((_ is Found!8679) lt!363051) ((_ is MissingZero!8679) lt!363051) (not ((_ is MissingVacant!8679) lt!363051)) (and (bvsge (index!37087 lt!363051) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363051) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363051) (ite ((_ is Found!8679) lt!363051) (= (select (arr!21088 lt!363000) (index!37085 lt!363051)) lt!363002) (ite ((_ is MissingZero!8679) lt!363051) (= (select (arr!21088 lt!363000) (index!37084 lt!363051)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8679) lt!363051) (= (select (arr!21088 lt!363000) (index!37087 lt!363051)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448395 () SeekEntryResult!8679)

(assert (=> d!104003 (= lt!363051 e!448395)))

(declare-fun c!88680 () Bool)

(declare-fun lt!363049 () SeekEntryResult!8679)

(assert (=> d!104003 (= c!88680 (and ((_ is Intermediate!8679) lt!363049) (undefined!9491 lt!363049)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44031 (_ BitVec 32)) SeekEntryResult!8679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104003 (= lt!363049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363002 mask!3266) lt!363002 lt!363000 mask!3266))))

(assert (=> d!104003 (validMask!0 mask!3266)))

(assert (=> d!104003 (= (seekEntryOrOpen!0 lt!363002 lt!363000 mask!3266) lt!363051)))

(declare-fun b!810081 () Bool)

(declare-fun e!448396 () SeekEntryResult!8679)

(assert (=> b!810081 (= e!448396 (Found!8679 (index!37086 lt!363049)))))

(declare-fun b!810082 () Bool)

(declare-fun c!88678 () Bool)

(declare-fun lt!363050 () (_ BitVec 64))

(assert (=> b!810082 (= c!88678 (= lt!363050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448397 () SeekEntryResult!8679)

(assert (=> b!810082 (= e!448396 e!448397)))

(declare-fun b!810083 () Bool)

(assert (=> b!810083 (= e!448397 (seekKeyOrZeroReturnVacant!0 (x!67893 lt!363049) (index!37086 lt!363049) (index!37086 lt!363049) lt!363002 lt!363000 mask!3266))))

(declare-fun b!810084 () Bool)

(assert (=> b!810084 (= e!448395 e!448396)))

(assert (=> b!810084 (= lt!363050 (select (arr!21088 lt!363000) (index!37086 lt!363049)))))

(declare-fun c!88679 () Bool)

(assert (=> b!810084 (= c!88679 (= lt!363050 lt!363002))))

(declare-fun b!810085 () Bool)

(assert (=> b!810085 (= e!448397 (MissingZero!8679 (index!37086 lt!363049)))))

(declare-fun b!810086 () Bool)

(assert (=> b!810086 (= e!448395 Undefined!8679)))

(assert (= (and d!104003 c!88680) b!810086))

(assert (= (and d!104003 (not c!88680)) b!810084))

(assert (= (and b!810084 c!88679) b!810081))

(assert (= (and b!810084 (not c!88679)) b!810082))

(assert (= (and b!810082 c!88678) b!810085))

(assert (= (and b!810082 (not c!88678)) b!810083))

(declare-fun m!752267 () Bool)

(assert (=> d!104003 m!752267))

(declare-fun m!752269 () Bool)

(assert (=> d!104003 m!752269))

(declare-fun m!752271 () Bool)

(assert (=> d!104003 m!752271))

(assert (=> d!104003 m!752269))

(declare-fun m!752275 () Bool)

(assert (=> d!104003 m!752275))

(assert (=> d!104003 m!752185))

(declare-fun m!752277 () Bool)

(assert (=> d!104003 m!752277))

(declare-fun m!752281 () Bool)

(assert (=> b!810083 m!752281))

(declare-fun m!752283 () Bool)

(assert (=> b!810084 m!752283))

(assert (=> b!809981 d!104003))

(declare-fun d!104009 () Bool)

(declare-fun lt!363057 () SeekEntryResult!8679)

(assert (=> d!104009 (and (or ((_ is Undefined!8679) lt!363057) (not ((_ is Found!8679) lt!363057)) (and (bvsge (index!37085 lt!363057) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363057) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363057) ((_ is Found!8679) lt!363057) (not ((_ is MissingZero!8679) lt!363057)) (and (bvsge (index!37084 lt!363057) #b00000000000000000000000000000000) (bvslt (index!37084 lt!363057) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363057) ((_ is Found!8679) lt!363057) ((_ is MissingZero!8679) lt!363057) (not ((_ is MissingVacant!8679) lt!363057)) (and (bvsge (index!37087 lt!363057) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363057) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363057) (ite ((_ is Found!8679) lt!363057) (= (select (arr!21088 a!3170) (index!37085 lt!363057)) k0!2044) (ite ((_ is MissingZero!8679) lt!363057) (= (select (arr!21088 a!3170) (index!37084 lt!363057)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8679) lt!363057) (= (select (arr!21088 a!3170) (index!37087 lt!363057)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448401 () SeekEntryResult!8679)

(assert (=> d!104009 (= lt!363057 e!448401)))

(declare-fun c!88684 () Bool)

(declare-fun lt!363055 () SeekEntryResult!8679)

(assert (=> d!104009 (= c!88684 (and ((_ is Intermediate!8679) lt!363055) (undefined!9491 lt!363055)))))

(assert (=> d!104009 (= lt!363055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104009 (validMask!0 mask!3266)))

(assert (=> d!104009 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!363057)))

(declare-fun b!810091 () Bool)

(declare-fun e!448402 () SeekEntryResult!8679)

(assert (=> b!810091 (= e!448402 (Found!8679 (index!37086 lt!363055)))))

(declare-fun b!810092 () Bool)

(declare-fun c!88682 () Bool)

(declare-fun lt!363056 () (_ BitVec 64))

(assert (=> b!810092 (= c!88682 (= lt!363056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448403 () SeekEntryResult!8679)

(assert (=> b!810092 (= e!448402 e!448403)))

(declare-fun b!810093 () Bool)

(assert (=> b!810093 (= e!448403 (seekKeyOrZeroReturnVacant!0 (x!67893 lt!363055) (index!37086 lt!363055) (index!37086 lt!363055) k0!2044 a!3170 mask!3266))))

(declare-fun b!810094 () Bool)

(assert (=> b!810094 (= e!448401 e!448402)))

(assert (=> b!810094 (= lt!363056 (select (arr!21088 a!3170) (index!37086 lt!363055)))))

(declare-fun c!88683 () Bool)

(assert (=> b!810094 (= c!88683 (= lt!363056 k0!2044))))

(declare-fun b!810095 () Bool)

(assert (=> b!810095 (= e!448403 (MissingZero!8679 (index!37086 lt!363055)))))

(declare-fun b!810096 () Bool)

(assert (=> b!810096 (= e!448401 Undefined!8679)))

(assert (= (and d!104009 c!88684) b!810096))

(assert (= (and d!104009 (not c!88684)) b!810094))

(assert (= (and b!810094 c!88683) b!810091))

(assert (= (and b!810094 (not c!88683)) b!810092))

(assert (= (and b!810092 c!88682) b!810095))

(assert (= (and b!810092 (not c!88682)) b!810093))

(declare-fun m!752293 () Bool)

(assert (=> d!104009 m!752293))

(declare-fun m!752295 () Bool)

(assert (=> d!104009 m!752295))

(declare-fun m!752297 () Bool)

(assert (=> d!104009 m!752297))

(assert (=> d!104009 m!752295))

(declare-fun m!752300 () Bool)

(assert (=> d!104009 m!752300))

(assert (=> d!104009 m!752185))

(declare-fun m!752305 () Bool)

(assert (=> d!104009 m!752305))

(declare-fun m!752309 () Bool)

(assert (=> b!810093 m!752309))

(declare-fun m!752311 () Bool)

(assert (=> b!810094 m!752311))

(assert (=> b!809980 d!104009))

(declare-fun b!810103 () Bool)

(declare-fun e!448408 () SeekEntryResult!8679)

(assert (=> b!810103 (= e!448408 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363005 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!363002 lt!363000 mask!3266))))

(declare-fun b!810104 () Bool)

(declare-fun e!448407 () SeekEntryResult!8679)

(assert (=> b!810104 (= e!448407 Undefined!8679)))

(declare-fun b!810105 () Bool)

(declare-fun c!88690 () Bool)

(declare-fun lt!363060 () (_ BitVec 64))

(assert (=> b!810105 (= c!88690 (= lt!363060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448409 () SeekEntryResult!8679)

(assert (=> b!810105 (= e!448409 e!448408)))

(declare-fun b!810107 () Bool)

(assert (=> b!810107 (= e!448408 (MissingVacant!8679 vacantAfter!23))))

(declare-fun b!810108 () Bool)

(assert (=> b!810108 (= e!448409 (Found!8679 lt!363005))))

(declare-fun b!810106 () Bool)

(assert (=> b!810106 (= e!448407 e!448409)))

(declare-fun c!88688 () Bool)

(assert (=> b!810106 (= c!88688 (= lt!363060 lt!363002))))

(declare-fun d!104013 () Bool)

(declare-fun lt!363061 () SeekEntryResult!8679)

(assert (=> d!104013 (and (or ((_ is Undefined!8679) lt!363061) (not ((_ is Found!8679) lt!363061)) (and (bvsge (index!37085 lt!363061) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363061) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363061) ((_ is Found!8679) lt!363061) (not ((_ is MissingVacant!8679) lt!363061)) (not (= (index!37087 lt!363061) vacantAfter!23)) (and (bvsge (index!37087 lt!363061) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363061) (size!21509 lt!363000)))) (or ((_ is Undefined!8679) lt!363061) (ite ((_ is Found!8679) lt!363061) (= (select (arr!21088 lt!363000) (index!37085 lt!363061)) lt!363002) (and ((_ is MissingVacant!8679) lt!363061) (= (index!37087 lt!363061) vacantAfter!23) (= (select (arr!21088 lt!363000) (index!37087 lt!363061)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104013 (= lt!363061 e!448407)))

(declare-fun c!88689 () Bool)

(assert (=> d!104013 (= c!88689 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104013 (= lt!363060 (select (arr!21088 lt!363000) lt!363005))))

(assert (=> d!104013 (validMask!0 mask!3266)))

(assert (=> d!104013 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363005 vacantAfter!23 lt!363002 lt!363000 mask!3266) lt!363061)))

(assert (= (and d!104013 c!88689) b!810104))

(assert (= (and d!104013 (not c!88689)) b!810106))

(assert (= (and b!810106 c!88688) b!810108))

(assert (= (and b!810106 (not c!88688)) b!810105))

(assert (= (and b!810105 c!88690) b!810107))

(assert (= (and b!810105 (not c!88690)) b!810103))

(declare-fun m!752315 () Bool)

(assert (=> b!810103 m!752315))

(assert (=> b!810103 m!752315))

(declare-fun m!752317 () Bool)

(assert (=> b!810103 m!752317))

(declare-fun m!752319 () Bool)

(assert (=> d!104013 m!752319))

(declare-fun m!752321 () Bool)

(assert (=> d!104013 m!752321))

(declare-fun m!752323 () Bool)

(assert (=> d!104013 m!752323))

(assert (=> d!104013 m!752185))

(assert (=> b!809979 d!104013))

(declare-fun d!104019 () Bool)

(assert (=> d!104019 (= (validKeyInArray!0 (select (arr!21088 a!3170) j!153)) (and (not (= (select (arr!21088 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21088 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809978 d!104019))

(declare-fun b!810109 () Bool)

(declare-fun e!448411 () SeekEntryResult!8679)

(assert (=> b!810109 (= e!448411 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363005 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810110 () Bool)

(declare-fun e!448410 () SeekEntryResult!8679)

(assert (=> b!810110 (= e!448410 Undefined!8679)))

(declare-fun b!810111 () Bool)

(declare-fun c!88693 () Bool)

(declare-fun lt!363062 () (_ BitVec 64))

(assert (=> b!810111 (= c!88693 (= lt!363062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448412 () SeekEntryResult!8679)

(assert (=> b!810111 (= e!448412 e!448411)))

(declare-fun b!810113 () Bool)

(assert (=> b!810113 (= e!448411 (MissingVacant!8679 vacantBefore!23))))

(declare-fun b!810114 () Bool)

(assert (=> b!810114 (= e!448412 (Found!8679 lt!363005))))

(declare-fun b!810112 () Bool)

(assert (=> b!810112 (= e!448410 e!448412)))

(declare-fun c!88691 () Bool)

(assert (=> b!810112 (= c!88691 (= lt!363062 (select (arr!21088 a!3170) j!153)))))

(declare-fun d!104021 () Bool)

(declare-fun lt!363063 () SeekEntryResult!8679)

(assert (=> d!104021 (and (or ((_ is Undefined!8679) lt!363063) (not ((_ is Found!8679) lt!363063)) (and (bvsge (index!37085 lt!363063) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363063) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363063) ((_ is Found!8679) lt!363063) (not ((_ is MissingVacant!8679) lt!363063)) (not (= (index!37087 lt!363063) vacantBefore!23)) (and (bvsge (index!37087 lt!363063) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363063) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363063) (ite ((_ is Found!8679) lt!363063) (= (select (arr!21088 a!3170) (index!37085 lt!363063)) (select (arr!21088 a!3170) j!153)) (and ((_ is MissingVacant!8679) lt!363063) (= (index!37087 lt!363063) vacantBefore!23) (= (select (arr!21088 a!3170) (index!37087 lt!363063)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104021 (= lt!363063 e!448410)))

(declare-fun c!88692 () Bool)

(assert (=> d!104021 (= c!88692 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104021 (= lt!363062 (select (arr!21088 a!3170) lt!363005))))

(assert (=> d!104021 (validMask!0 mask!3266)))

(assert (=> d!104021 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363005 vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266) lt!363063)))

(assert (= (and d!104021 c!88692) b!810110))

(assert (= (and d!104021 (not c!88692)) b!810112))

(assert (= (and b!810112 c!88691) b!810114))

(assert (= (and b!810112 (not c!88691)) b!810111))

(assert (= (and b!810111 c!88693) b!810113))

(assert (= (and b!810111 (not c!88693)) b!810109))

(assert (=> b!810109 m!752315))

(assert (=> b!810109 m!752315))

(assert (=> b!810109 m!752173))

(declare-fun m!752325 () Bool)

(assert (=> b!810109 m!752325))

(declare-fun m!752327 () Bool)

(assert (=> d!104021 m!752327))

(declare-fun m!752329 () Bool)

(assert (=> d!104021 m!752329))

(declare-fun m!752331 () Bool)

(assert (=> d!104021 m!752331))

(assert (=> d!104021 m!752185))

(assert (=> b!809976 d!104021))

(declare-fun d!104023 () Bool)

(declare-fun lt!363066 () (_ BitVec 32))

(assert (=> d!104023 (and (bvsge lt!363066 #b00000000000000000000000000000000) (bvslt lt!363066 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104023 (= lt!363066 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!104023 (validMask!0 mask!3266)))

(assert (=> d!104023 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363066)))

(declare-fun bs!22429 () Bool)

(assert (= bs!22429 d!104023))

(declare-fun m!752333 () Bool)

(assert (=> bs!22429 m!752333))

(assert (=> bs!22429 m!752185))

(assert (=> b!809975 d!104023))

(declare-fun d!104025 () Bool)

(assert (=> d!104025 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69484 d!104025))

(declare-fun d!104027 () Bool)

(assert (=> d!104027 (= (array_inv!16884 a!3170) (bvsge (size!21509 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69484 d!104027))

(declare-fun b!810161 () Bool)

(declare-fun e!448439 () Bool)

(declare-fun call!35442 () Bool)

(assert (=> b!810161 (= e!448439 call!35442)))

(declare-fun d!104029 () Bool)

(declare-fun res!553556 () Bool)

(declare-fun e!448442 () Bool)

(assert (=> d!104029 (=> res!553556 e!448442)))

(assert (=> d!104029 (= res!553556 (bvsge #b00000000000000000000000000000000 (size!21509 a!3170)))))

(assert (=> d!104029 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15048) e!448442)))

(declare-fun b!810162 () Bool)

(declare-fun e!448440 () Bool)

(assert (=> b!810162 (= e!448440 e!448439)))

(declare-fun c!88714 () Bool)

(assert (=> b!810162 (= c!88714 (validKeyInArray!0 (select (arr!21088 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35439 () Bool)

(assert (=> bm!35439 (= call!35442 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88714 (Cons!15047 (select (arr!21088 a!3170) #b00000000000000000000000000000000) Nil!15048) Nil!15048)))))

(declare-fun b!810163 () Bool)

(assert (=> b!810163 (= e!448439 call!35442)))

(declare-fun b!810164 () Bool)

(declare-fun e!448441 () Bool)

(declare-fun contains!4133 (List!15051 (_ BitVec 64)) Bool)

(assert (=> b!810164 (= e!448441 (contains!4133 Nil!15048 (select (arr!21088 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810165 () Bool)

(assert (=> b!810165 (= e!448442 e!448440)))

(declare-fun res!553554 () Bool)

(assert (=> b!810165 (=> (not res!553554) (not e!448440))))

(assert (=> b!810165 (= res!553554 (not e!448441))))

(declare-fun res!553555 () Bool)

(assert (=> b!810165 (=> (not res!553555) (not e!448441))))

(assert (=> b!810165 (= res!553555 (validKeyInArray!0 (select (arr!21088 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104029 (not res!553556)) b!810165))

(assert (= (and b!810165 res!553555) b!810164))

(assert (= (and b!810165 res!553554) b!810162))

(assert (= (and b!810162 c!88714) b!810161))

(assert (= (and b!810162 (not c!88714)) b!810163))

(assert (= (or b!810161 b!810163) bm!35439))

(assert (=> b!810162 m!752255))

(assert (=> b!810162 m!752255))

(declare-fun m!752355 () Bool)

(assert (=> b!810162 m!752355))

(assert (=> bm!35439 m!752255))

(declare-fun m!752357 () Bool)

(assert (=> bm!35439 m!752357))

(assert (=> b!810164 m!752255))

(assert (=> b!810164 m!752255))

(declare-fun m!752359 () Bool)

(assert (=> b!810164 m!752359))

(assert (=> b!810165 m!752255))

(assert (=> b!810165 m!752255))

(assert (=> b!810165 m!752355))

(assert (=> b!809985 d!104029))

(declare-fun b!810226 () Bool)

(declare-fun e!448486 () Bool)

(declare-fun call!35451 () Bool)

(assert (=> b!810226 (= e!448486 call!35451)))

(declare-fun bm!35448 () Bool)

(assert (=> bm!35448 (= call!35451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!810227 () Bool)

(declare-fun e!448487 () Bool)

(assert (=> b!810227 (= e!448487 call!35451)))

(declare-fun b!810228 () Bool)

(declare-fun e!448488 () Bool)

(assert (=> b!810228 (= e!448488 e!448487)))

(declare-fun c!88732 () Bool)

(assert (=> b!810228 (= c!88732 (validKeyInArray!0 (select (arr!21088 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!104035 () Bool)

(declare-fun res!553584 () Bool)

(assert (=> d!104035 (=> res!553584 e!448488)))

(assert (=> d!104035 (= res!553584 (bvsge #b00000000000000000000000000000000 (size!21509 a!3170)))))

(assert (=> d!104035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448488)))

(declare-fun b!810229 () Bool)

(assert (=> b!810229 (= e!448487 e!448486)))

(declare-fun lt!363100 () (_ BitVec 64))

(assert (=> b!810229 (= lt!363100 (select (arr!21088 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27632 0))(
  ( (Unit!27633) )
))
(declare-fun lt!363098 () Unit!27632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44031 (_ BitVec 64) (_ BitVec 32)) Unit!27632)

(assert (=> b!810229 (= lt!363098 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363100 #b00000000000000000000000000000000))))

(assert (=> b!810229 (arrayContainsKey!0 a!3170 lt!363100 #b00000000000000000000000000000000)))

(declare-fun lt!363099 () Unit!27632)

(assert (=> b!810229 (= lt!363099 lt!363098)))

(declare-fun res!553583 () Bool)

(assert (=> b!810229 (= res!553583 (= (seekEntryOrOpen!0 (select (arr!21088 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8679 #b00000000000000000000000000000000)))))

(assert (=> b!810229 (=> (not res!553583) (not e!448486))))

(assert (= (and d!104035 (not res!553584)) b!810228))

(assert (= (and b!810228 c!88732) b!810229))

(assert (= (and b!810228 (not c!88732)) b!810227))

(assert (= (and b!810229 res!553583) b!810226))

(assert (= (or b!810226 b!810227) bm!35448))

(declare-fun m!752407 () Bool)

(assert (=> bm!35448 m!752407))

(assert (=> b!810228 m!752255))

(assert (=> b!810228 m!752255))

(assert (=> b!810228 m!752355))

(assert (=> b!810229 m!752255))

(declare-fun m!752413 () Bool)

(assert (=> b!810229 m!752413))

(declare-fun m!752415 () Bool)

(assert (=> b!810229 m!752415))

(assert (=> b!810229 m!752255))

(declare-fun m!752417 () Bool)

(assert (=> b!810229 m!752417))

(assert (=> b!809974 d!104035))

(declare-fun d!104049 () Bool)

(assert (=> d!104049 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809973 d!104049))

(declare-fun b!810232 () Bool)

(declare-fun e!448492 () SeekEntryResult!8679)

(assert (=> b!810232 (= e!448492 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810233 () Bool)

(declare-fun e!448491 () SeekEntryResult!8679)

(assert (=> b!810233 (= e!448491 Undefined!8679)))

(declare-fun b!810234 () Bool)

(declare-fun c!88735 () Bool)

(declare-fun lt!363101 () (_ BitVec 64))

(assert (=> b!810234 (= c!88735 (= lt!363101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448493 () SeekEntryResult!8679)

(assert (=> b!810234 (= e!448493 e!448492)))

(declare-fun b!810236 () Bool)

(assert (=> b!810236 (= e!448492 (MissingVacant!8679 vacantBefore!23))))

(declare-fun b!810237 () Bool)

(assert (=> b!810237 (= e!448493 (Found!8679 index!1236))))

(declare-fun b!810235 () Bool)

(assert (=> b!810235 (= e!448491 e!448493)))

(declare-fun c!88733 () Bool)

(assert (=> b!810235 (= c!88733 (= lt!363101 (select (arr!21088 a!3170) j!153)))))

(declare-fun d!104053 () Bool)

(declare-fun lt!363102 () SeekEntryResult!8679)

(assert (=> d!104053 (and (or ((_ is Undefined!8679) lt!363102) (not ((_ is Found!8679) lt!363102)) (and (bvsge (index!37085 lt!363102) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363102) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363102) ((_ is Found!8679) lt!363102) (not ((_ is MissingVacant!8679) lt!363102)) (not (= (index!37087 lt!363102) vacantBefore!23)) (and (bvsge (index!37087 lt!363102) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363102) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363102) (ite ((_ is Found!8679) lt!363102) (= (select (arr!21088 a!3170) (index!37085 lt!363102)) (select (arr!21088 a!3170) j!153)) (and ((_ is MissingVacant!8679) lt!363102) (= (index!37087 lt!363102) vacantBefore!23) (= (select (arr!21088 a!3170) (index!37087 lt!363102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104053 (= lt!363102 e!448491)))

(declare-fun c!88734 () Bool)

(assert (=> d!104053 (= c!88734 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104053 (= lt!363101 (select (arr!21088 a!3170) index!1236))))

(assert (=> d!104053 (validMask!0 mask!3266)))

(assert (=> d!104053 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21088 a!3170) j!153) a!3170 mask!3266) lt!363102)))

(assert (= (and d!104053 c!88734) b!810233))

(assert (= (and d!104053 (not c!88734)) b!810235))

(assert (= (and b!810235 c!88733) b!810237))

(assert (= (and b!810235 (not c!88733)) b!810234))

(assert (= (and b!810234 c!88735) b!810236))

(assert (= (and b!810234 (not c!88735)) b!810232))

(assert (=> b!810232 m!752171))

(assert (=> b!810232 m!752171))

(assert (=> b!810232 m!752173))

(declare-fun m!752421 () Bool)

(assert (=> b!810232 m!752421))

(declare-fun m!752423 () Bool)

(assert (=> d!104053 m!752423))

(declare-fun m!752425 () Bool)

(assert (=> d!104053 m!752425))

(assert (=> d!104053 m!752207))

(assert (=> d!104053 m!752185))

(assert (=> b!809983 d!104053))

(declare-fun d!104057 () Bool)

(declare-fun lt!363105 () SeekEntryResult!8679)

(assert (=> d!104057 (and (or ((_ is Undefined!8679) lt!363105) (not ((_ is Found!8679) lt!363105)) (and (bvsge (index!37085 lt!363105) #b00000000000000000000000000000000) (bvslt (index!37085 lt!363105) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363105) ((_ is Found!8679) lt!363105) (not ((_ is MissingZero!8679) lt!363105)) (and (bvsge (index!37084 lt!363105) #b00000000000000000000000000000000) (bvslt (index!37084 lt!363105) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363105) ((_ is Found!8679) lt!363105) ((_ is MissingZero!8679) lt!363105) (not ((_ is MissingVacant!8679) lt!363105)) (and (bvsge (index!37087 lt!363105) #b00000000000000000000000000000000) (bvslt (index!37087 lt!363105) (size!21509 a!3170)))) (or ((_ is Undefined!8679) lt!363105) (ite ((_ is Found!8679) lt!363105) (= (select (arr!21088 a!3170) (index!37085 lt!363105)) (select (arr!21088 a!3170) j!153)) (ite ((_ is MissingZero!8679) lt!363105) (= (select (arr!21088 a!3170) (index!37084 lt!363105)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8679) lt!363105) (= (select (arr!21088 a!3170) (index!37087 lt!363105)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448494 () SeekEntryResult!8679)

(assert (=> d!104057 (= lt!363105 e!448494)))

(declare-fun c!88738 () Bool)

(declare-fun lt!363103 () SeekEntryResult!8679)

(assert (=> d!104057 (= c!88738 (and ((_ is Intermediate!8679) lt!363103) (undefined!9491 lt!363103)))))

(assert (=> d!104057 (= lt!363103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21088 a!3170) j!153) mask!3266) (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104057 (validMask!0 mask!3266)))

(assert (=> d!104057 (= (seekEntryOrOpen!0 (select (arr!21088 a!3170) j!153) a!3170 mask!3266) lt!363105)))

(declare-fun b!810238 () Bool)

(declare-fun e!448495 () SeekEntryResult!8679)

(assert (=> b!810238 (= e!448495 (Found!8679 (index!37086 lt!363103)))))

(declare-fun b!810239 () Bool)

(declare-fun c!88736 () Bool)

(declare-fun lt!363104 () (_ BitVec 64))

(assert (=> b!810239 (= c!88736 (= lt!363104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448496 () SeekEntryResult!8679)

(assert (=> b!810239 (= e!448495 e!448496)))

(declare-fun b!810240 () Bool)

(assert (=> b!810240 (= e!448496 (seekKeyOrZeroReturnVacant!0 (x!67893 lt!363103) (index!37086 lt!363103) (index!37086 lt!363103) (select (arr!21088 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810241 () Bool)

(assert (=> b!810241 (= e!448494 e!448495)))

(assert (=> b!810241 (= lt!363104 (select (arr!21088 a!3170) (index!37086 lt!363103)))))

(declare-fun c!88737 () Bool)

(assert (=> b!810241 (= c!88737 (= lt!363104 (select (arr!21088 a!3170) j!153)))))

(declare-fun b!810242 () Bool)

(assert (=> b!810242 (= e!448496 (MissingZero!8679 (index!37086 lt!363103)))))

(declare-fun b!810243 () Bool)

(assert (=> b!810243 (= e!448494 Undefined!8679)))

(assert (= (and d!104057 c!88738) b!810243))

(assert (= (and d!104057 (not c!88738)) b!810241))

(assert (= (and b!810241 c!88737) b!810238))

(assert (= (and b!810241 (not c!88737)) b!810239))

(assert (= (and b!810239 c!88736) b!810242))

(assert (= (and b!810239 (not c!88736)) b!810240))

(declare-fun m!752427 () Bool)

(assert (=> d!104057 m!752427))

(assert (=> d!104057 m!752173))

(declare-fun m!752429 () Bool)

(assert (=> d!104057 m!752429))

(declare-fun m!752431 () Bool)

(assert (=> d!104057 m!752431))

(assert (=> d!104057 m!752429))

(assert (=> d!104057 m!752173))

(declare-fun m!752433 () Bool)

(assert (=> d!104057 m!752433))

(assert (=> d!104057 m!752185))

(declare-fun m!752435 () Bool)

(assert (=> d!104057 m!752435))

(assert (=> b!810240 m!752173))

(declare-fun m!752437 () Bool)

(assert (=> b!810240 m!752437))

(declare-fun m!752439 () Bool)

(assert (=> b!810241 m!752439))

(assert (=> b!809983 d!104057))

(check-sat (not d!104023) (not d!104003) (not b!810083) (not d!104057) (not d!104013) (not b!810165) (not b!810229) (not b!810232) (not b!810240) (not b!810043) (not b!810228) (not b!810164) (not bm!35439) (not b!810162) (not d!104009) (not d!104001) (not b!810030) (not b!810103) (not d!104021) (not b!810109) (not b!810093) (not bm!35448) (not d!104053))
(check-sat)
