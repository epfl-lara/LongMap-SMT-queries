; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65786 () Bool)

(assert start!65786)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41976 0))(
  ( (array!41977 (arr!20102 (Array (_ BitVec 32) (_ BitVec 64))) (size!20523 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41976)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!756970 () Bool)

(declare-datatypes ((SeekEntryResult!7699 0))(
  ( (MissingZero!7699 (index!33164 (_ BitVec 32))) (Found!7699 (index!33165 (_ BitVec 32))) (Intermediate!7699 (undefined!8511 Bool) (index!33166 (_ BitVec 32)) (x!64068 (_ BitVec 32))) (Undefined!7699) (MissingVacant!7699 (index!33167 (_ BitVec 32))) )
))
(declare-fun lt!336960 () SeekEntryResult!7699)

(declare-fun e!422051 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41976 (_ BitVec 32)) SeekEntryResult!7699)

(assert (=> b!756970 (= e!422051 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20102 a!3186) j!159) a!3186 mask!3328) lt!336960))))

(declare-fun b!756971 () Bool)

(declare-fun e!422058 () Bool)

(declare-fun lt!336963 () SeekEntryResult!7699)

(declare-fun lt!336958 () SeekEntryResult!7699)

(assert (=> b!756971 (= e!422058 (= lt!336963 lt!336958))))

(declare-fun b!756972 () Bool)

(declare-fun res!511978 () Bool)

(declare-fun e!422055 () Bool)

(assert (=> b!756972 (=> (not res!511978) (not e!422055))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756972 (= res!511978 (and (= (size!20523 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20523 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20523 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756973 () Bool)

(declare-fun res!511980 () Bool)

(declare-fun e!422049 () Bool)

(assert (=> b!756973 (=> (not res!511980) (not e!422049))))

(declare-fun e!422056 () Bool)

(assert (=> b!756973 (= res!511980 e!422056)))

(declare-fun c!82877 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!756973 (= c!82877 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756974 () Bool)

(declare-fun e!422054 () Bool)

(assert (=> b!756974 (= e!422054 e!422049)))

(declare-fun res!511989 () Bool)

(assert (=> b!756974 (=> (not res!511989) (not e!422049))))

(declare-fun lt!336965 () SeekEntryResult!7699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41976 (_ BitVec 32)) SeekEntryResult!7699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756974 (= res!511989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20102 a!3186) j!159) mask!3328) (select (arr!20102 a!3186) j!159) a!3186 mask!3328) lt!336965))))

(assert (=> b!756974 (= lt!336965 (Intermediate!7699 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756975 () Bool)

(declare-fun res!511985 () Bool)

(assert (=> b!756975 (=> (not res!511985) (not e!422049))))

(assert (=> b!756975 (= res!511985 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20102 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756976 () Bool)

(declare-fun e!422057 () Bool)

(declare-fun e!422052 () Bool)

(assert (=> b!756976 (= e!422057 e!422052)))

(declare-fun res!511994 () Bool)

(assert (=> b!756976 (=> res!511994 e!422052)))

(assert (=> b!756976 (= res!511994 (not (= lt!336958 lt!336960)))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!756976 (= lt!336958 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20102 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756977 () Bool)

(declare-fun res!511984 () Bool)

(assert (=> b!756977 (=> (not res!511984) (not e!422058))))

(declare-fun lt!336957 () (_ BitVec 64))

(declare-fun lt!336954 () array!41976)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41976 (_ BitVec 32)) SeekEntryResult!7699)

(assert (=> b!756977 (= res!511984 (= (seekEntryOrOpen!0 lt!336957 lt!336954 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336957 lt!336954 mask!3328)))))

(declare-fun b!756978 () Bool)

(declare-fun e!422059 () Bool)

(assert (=> b!756978 (= e!422059 (not e!422057))))

(declare-fun res!511987 () Bool)

(assert (=> b!756978 (=> res!511987 e!422057)))

(declare-fun lt!336959 () SeekEntryResult!7699)

(get-info :version)

(assert (=> b!756978 (= res!511987 (or (not ((_ is Intermediate!7699) lt!336959)) (bvslt x!1131 (x!64068 lt!336959)) (not (= x!1131 (x!64068 lt!336959))) (not (= index!1321 (index!33166 lt!336959)))))))

(assert (=> b!756978 e!422051))

(declare-fun res!511986 () Bool)

(assert (=> b!756978 (=> (not res!511986) (not e!422051))))

(assert (=> b!756978 (= res!511986 (= lt!336963 lt!336960))))

(assert (=> b!756978 (= lt!336960 (Found!7699 j!159))))

(assert (=> b!756978 (= lt!336963 (seekEntryOrOpen!0 (select (arr!20102 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41976 (_ BitVec 32)) Bool)

(assert (=> b!756978 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26156 0))(
  ( (Unit!26157) )
))
(declare-fun lt!336956 () Unit!26156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26156)

(assert (=> b!756978 (= lt!336956 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756979 () Bool)

(declare-fun res!511988 () Bool)

(assert (=> b!756979 (=> (not res!511988) (not e!422054))))

(declare-datatypes ((List!14143 0))(
  ( (Nil!14140) (Cons!14139 (h!15211 (_ BitVec 64)) (t!20449 List!14143)) )
))
(declare-fun arrayNoDuplicates!0 (array!41976 (_ BitVec 32) List!14143) Bool)

(assert (=> b!756979 (= res!511988 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14140))))

(declare-fun b!756980 () Bool)

(declare-fun res!511981 () Bool)

(assert (=> b!756980 (=> (not res!511981) (not e!422054))))

(assert (=> b!756980 (= res!511981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756981 () Bool)

(assert (=> b!756981 (= e!422055 e!422054)))

(declare-fun res!511992 () Bool)

(assert (=> b!756981 (=> (not res!511992) (not e!422054))))

(declare-fun lt!336961 () SeekEntryResult!7699)

(assert (=> b!756981 (= res!511992 (or (= lt!336961 (MissingZero!7699 i!1173)) (= lt!336961 (MissingVacant!7699 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756981 (= lt!336961 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756982 () Bool)

(declare-fun e!422053 () Unit!26156)

(declare-fun Unit!26158 () Unit!26156)

(assert (=> b!756982 (= e!422053 Unit!26158)))

(assert (=> b!756982 false))

(declare-fun b!756983 () Bool)

(declare-fun e!422048 () Bool)

(assert (=> b!756983 (= e!422052 e!422048)))

(declare-fun res!511983 () Bool)

(assert (=> b!756983 (=> res!511983 e!422048)))

(declare-fun lt!336964 () (_ BitVec 64))

(assert (=> b!756983 (= res!511983 (= lt!336964 lt!336957))))

(assert (=> b!756983 (= lt!336964 (select (store (arr!20102 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756984 () Bool)

(declare-fun res!511993 () Bool)

(assert (=> b!756984 (=> (not res!511993) (not e!422055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756984 (= res!511993 (validKeyInArray!0 (select (arr!20102 a!3186) j!159)))))

(declare-fun b!756985 () Bool)

(declare-fun res!511979 () Bool)

(assert (=> b!756985 (=> (not res!511979) (not e!422054))))

(assert (=> b!756985 (= res!511979 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20523 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20523 a!3186))))))

(declare-fun b!756986 () Bool)

(declare-fun res!511991 () Bool)

(assert (=> b!756986 (=> (not res!511991) (not e!422055))))

(assert (=> b!756986 (= res!511991 (validKeyInArray!0 k0!2102))))

(declare-fun b!756987 () Bool)

(assert (=> b!756987 (= e!422056 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20102 a!3186) j!159) a!3186 mask!3328) (Found!7699 j!159)))))

(declare-fun b!756988 () Bool)

(declare-fun Unit!26159 () Unit!26156)

(assert (=> b!756988 (= e!422053 Unit!26159)))

(declare-fun res!511982 () Bool)

(assert (=> start!65786 (=> (not res!511982) (not e!422055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65786 (= res!511982 (validMask!0 mask!3328))))

(assert (=> start!65786 e!422055))

(assert (=> start!65786 true))

(declare-fun array_inv!15985 (array!41976) Bool)

(assert (=> start!65786 (array_inv!15985 a!3186)))

(declare-fun b!756989 () Bool)

(assert (=> b!756989 (= e!422048 true)))

(assert (=> b!756989 e!422058))

(declare-fun res!511977 () Bool)

(assert (=> b!756989 (=> (not res!511977) (not e!422058))))

(assert (=> b!756989 (= res!511977 (= lt!336964 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336955 () Unit!26156)

(assert (=> b!756989 (= lt!336955 e!422053)))

(declare-fun c!82878 () Bool)

(assert (=> b!756989 (= c!82878 (= lt!336964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756990 () Bool)

(assert (=> b!756990 (= e!422056 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20102 a!3186) j!159) a!3186 mask!3328) lt!336965))))

(declare-fun b!756991 () Bool)

(declare-fun res!511990 () Bool)

(assert (=> b!756991 (=> (not res!511990) (not e!422055))))

(declare-fun arrayContainsKey!0 (array!41976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756991 (= res!511990 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756992 () Bool)

(assert (=> b!756992 (= e!422049 e!422059)))

(declare-fun res!511995 () Bool)

(assert (=> b!756992 (=> (not res!511995) (not e!422059))))

(declare-fun lt!336962 () SeekEntryResult!7699)

(assert (=> b!756992 (= res!511995 (= lt!336962 lt!336959))))

(assert (=> b!756992 (= lt!336959 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336957 lt!336954 mask!3328))))

(assert (=> b!756992 (= lt!336962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336957 mask!3328) lt!336957 lt!336954 mask!3328))))

(assert (=> b!756992 (= lt!336957 (select (store (arr!20102 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756992 (= lt!336954 (array!41977 (store (arr!20102 a!3186) i!1173 k0!2102) (size!20523 a!3186)))))

(assert (= (and start!65786 res!511982) b!756972))

(assert (= (and b!756972 res!511978) b!756984))

(assert (= (and b!756984 res!511993) b!756986))

(assert (= (and b!756986 res!511991) b!756991))

(assert (= (and b!756991 res!511990) b!756981))

(assert (= (and b!756981 res!511992) b!756980))

(assert (= (and b!756980 res!511981) b!756979))

(assert (= (and b!756979 res!511988) b!756985))

(assert (= (and b!756985 res!511979) b!756974))

(assert (= (and b!756974 res!511989) b!756975))

(assert (= (and b!756975 res!511985) b!756973))

(assert (= (and b!756973 c!82877) b!756990))

(assert (= (and b!756973 (not c!82877)) b!756987))

(assert (= (and b!756973 res!511980) b!756992))

(assert (= (and b!756992 res!511995) b!756978))

(assert (= (and b!756978 res!511986) b!756970))

(assert (= (and b!756978 (not res!511987)) b!756976))

(assert (= (and b!756976 (not res!511994)) b!756983))

(assert (= (and b!756983 (not res!511983)) b!756989))

(assert (= (and b!756989 c!82878) b!756982))

(assert (= (and b!756989 (not c!82878)) b!756988))

(assert (= (and b!756989 res!511977) b!756977))

(assert (= (and b!756977 res!511984) b!756971))

(declare-fun m!704225 () Bool)

(assert (=> b!756992 m!704225))

(declare-fun m!704227 () Bool)

(assert (=> b!756992 m!704227))

(declare-fun m!704229 () Bool)

(assert (=> b!756992 m!704229))

(declare-fun m!704231 () Bool)

(assert (=> b!756992 m!704231))

(assert (=> b!756992 m!704225))

(declare-fun m!704233 () Bool)

(assert (=> b!756992 m!704233))

(assert (=> b!756983 m!704231))

(declare-fun m!704235 () Bool)

(assert (=> b!756983 m!704235))

(declare-fun m!704237 () Bool)

(assert (=> b!756978 m!704237))

(assert (=> b!756978 m!704237))

(declare-fun m!704239 () Bool)

(assert (=> b!756978 m!704239))

(declare-fun m!704241 () Bool)

(assert (=> b!756978 m!704241))

(declare-fun m!704243 () Bool)

(assert (=> b!756978 m!704243))

(declare-fun m!704245 () Bool)

(assert (=> b!756979 m!704245))

(declare-fun m!704247 () Bool)

(assert (=> b!756980 m!704247))

(assert (=> b!756984 m!704237))

(assert (=> b!756984 m!704237))

(declare-fun m!704249 () Bool)

(assert (=> b!756984 m!704249))

(declare-fun m!704251 () Bool)

(assert (=> start!65786 m!704251))

(declare-fun m!704253 () Bool)

(assert (=> start!65786 m!704253))

(declare-fun m!704255 () Bool)

(assert (=> b!756986 m!704255))

(assert (=> b!756974 m!704237))

(assert (=> b!756974 m!704237))

(declare-fun m!704257 () Bool)

(assert (=> b!756974 m!704257))

(assert (=> b!756974 m!704257))

(assert (=> b!756974 m!704237))

(declare-fun m!704259 () Bool)

(assert (=> b!756974 m!704259))

(declare-fun m!704261 () Bool)

(assert (=> b!756991 m!704261))

(declare-fun m!704263 () Bool)

(assert (=> b!756981 m!704263))

(assert (=> b!756970 m!704237))

(assert (=> b!756970 m!704237))

(declare-fun m!704265 () Bool)

(assert (=> b!756970 m!704265))

(assert (=> b!756990 m!704237))

(assert (=> b!756990 m!704237))

(declare-fun m!704267 () Bool)

(assert (=> b!756990 m!704267))

(declare-fun m!704269 () Bool)

(assert (=> b!756977 m!704269))

(declare-fun m!704271 () Bool)

(assert (=> b!756977 m!704271))

(assert (=> b!756976 m!704237))

(assert (=> b!756976 m!704237))

(declare-fun m!704273 () Bool)

(assert (=> b!756976 m!704273))

(assert (=> b!756987 m!704237))

(assert (=> b!756987 m!704237))

(assert (=> b!756987 m!704273))

(declare-fun m!704275 () Bool)

(assert (=> b!756975 m!704275))

(check-sat (not b!756980) (not b!756990) (not start!65786) (not b!756991) (not b!756987) (not b!756977) (not b!756978) (not b!756976) (not b!756992) (not b!756970) (not b!756984) (not b!756986) (not b!756979) (not b!756981) (not b!756974))
(check-sat)
