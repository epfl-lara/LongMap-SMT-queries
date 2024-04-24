; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65496 () Bool)

(assert start!65496)

(declare-fun b!744054 () Bool)

(declare-fun res!500727 () Bool)

(declare-fun e!415800 () Bool)

(assert (=> b!744054 (=> (not res!500727) (not e!415800))))

(declare-datatypes ((array!41539 0))(
  ( (array!41540 (arr!19879 (Array (_ BitVec 32) (_ BitVec 64))) (size!20299 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41539)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!744054 (= res!500727 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19879 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7435 0))(
  ( (MissingZero!7435 (index!32108 (_ BitVec 32))) (Found!7435 (index!32109 (_ BitVec 32))) (Intermediate!7435 (undefined!8247 Bool) (index!32110 (_ BitVec 32)) (x!63237 (_ BitVec 32))) (Undefined!7435) (MissingVacant!7435 (index!32111 (_ BitVec 32))) )
))
(declare-fun lt!330512 () SeekEntryResult!7435)

(declare-fun e!415805 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!744055 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41539 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!744055 (= e!415805 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330512))))

(declare-fun b!744056 () Bool)

(declare-fun res!500720 () Bool)

(declare-fun e!415798 () Bool)

(assert (=> b!744056 (=> (not res!500720) (not e!415798))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744056 (= res!500720 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20299 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20299 a!3186))))))

(declare-fun b!744057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41539 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!744057 (= e!415805 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) (Found!7435 j!159)))))

(declare-fun b!744058 () Bool)

(declare-fun res!500731 () Bool)

(declare-fun e!415804 () Bool)

(assert (=> b!744058 (=> res!500731 e!415804)))

(declare-fun lt!330508 () SeekEntryResult!7435)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!330509 () (_ BitVec 64))

(assert (=> b!744058 (= res!500731 (or (not (= (select (store (arr!19879 a!3186) i!1173 k0!2102) index!1321) lt!330509)) (undefined!8247 lt!330508)))))

(declare-fun b!744059 () Bool)

(assert (=> b!744059 (= e!415804 true)))

(declare-fun lt!330513 () array!41539)

(declare-fun lt!330511 () SeekEntryResult!7435)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41539 (_ BitVec 32)) SeekEntryResult!7435)

(assert (=> b!744059 (= lt!330511 (seekEntryOrOpen!0 lt!330509 lt!330513 mask!3328))))

(declare-fun res!500732 () Bool)

(declare-fun e!415801 () Bool)

(assert (=> start!65496 (=> (not res!500732) (not e!415801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65496 (= res!500732 (validMask!0 mask!3328))))

(assert (=> start!65496 e!415801))

(assert (=> start!65496 true))

(declare-fun array_inv!15738 (array!41539) Bool)

(assert (=> start!65496 (array_inv!15738 a!3186)))

(declare-fun b!744060 () Bool)

(declare-fun res!500719 () Bool)

(assert (=> b!744060 (=> (not res!500719) (not e!415798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41539 (_ BitVec 32)) Bool)

(assert (=> b!744060 (= res!500719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744061 () Bool)

(declare-fun res!500723 () Bool)

(assert (=> b!744061 (=> (not res!500723) (not e!415798))))

(declare-datatypes ((List!13788 0))(
  ( (Nil!13785) (Cons!13784 (h!14862 (_ BitVec 64)) (t!20095 List!13788)) )
))
(declare-fun arrayNoDuplicates!0 (array!41539 (_ BitVec 32) List!13788) Bool)

(assert (=> b!744061 (= res!500723 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13785))))

(declare-fun b!744062 () Bool)

(declare-fun e!415799 () Bool)

(assert (=> b!744062 (= e!415800 e!415799)))

(declare-fun res!500734 () Bool)

(assert (=> b!744062 (=> (not res!500734) (not e!415799))))

(declare-fun lt!330516 () SeekEntryResult!7435)

(assert (=> b!744062 (= res!500734 (= lt!330516 lt!330508))))

(assert (=> b!744062 (= lt!330508 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330509 lt!330513 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744062 (= lt!330516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330509 mask!3328) lt!330509 lt!330513 mask!3328))))

(assert (=> b!744062 (= lt!330509 (select (store (arr!19879 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744062 (= lt!330513 (array!41540 (store (arr!19879 a!3186) i!1173 k0!2102) (size!20299 a!3186)))))

(declare-fun b!744063 () Bool)

(declare-fun res!500718 () Bool)

(assert (=> b!744063 (=> (not res!500718) (not e!415801))))

(assert (=> b!744063 (= res!500718 (and (= (size!20299 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20299 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20299 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744064 () Bool)

(declare-fun res!500724 () Bool)

(assert (=> b!744064 (=> res!500724 e!415804)))

(assert (=> b!744064 (= res!500724 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) (Found!7435 j!159))))))

(declare-fun b!744065 () Bool)

(assert (=> b!744065 (= e!415799 (not e!415804))))

(declare-fun res!500725 () Bool)

(assert (=> b!744065 (=> res!500725 e!415804)))

(get-info :version)

(assert (=> b!744065 (= res!500725 (or (not ((_ is Intermediate!7435) lt!330508)) (bvslt x!1131 (x!63237 lt!330508)) (not (= x!1131 (x!63237 lt!330508))) (not (= index!1321 (index!32110 lt!330508)))))))

(declare-fun e!415802 () Bool)

(assert (=> b!744065 e!415802))

(declare-fun res!500717 () Bool)

(assert (=> b!744065 (=> (not res!500717) (not e!415802))))

(assert (=> b!744065 (= res!500717 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25429 0))(
  ( (Unit!25430) )
))
(declare-fun lt!330510 () Unit!25429)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25429)

(assert (=> b!744065 (= lt!330510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744066 () Bool)

(declare-fun res!500726 () Bool)

(assert (=> b!744066 (=> (not res!500726) (not e!415800))))

(assert (=> b!744066 (= res!500726 e!415805)))

(declare-fun c!82052 () Bool)

(assert (=> b!744066 (= c!82052 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744067 () Bool)

(declare-fun res!500722 () Bool)

(assert (=> b!744067 (=> (not res!500722) (not e!415801))))

(declare-fun arrayContainsKey!0 (array!41539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744067 (= res!500722 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744068 () Bool)

(declare-fun res!500721 () Bool)

(assert (=> b!744068 (=> (not res!500721) (not e!415801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744068 (= res!500721 (validKeyInArray!0 k0!2102))))

(declare-fun b!744069 () Bool)

(assert (=> b!744069 (= e!415801 e!415798)))

(declare-fun res!500729 () Bool)

(assert (=> b!744069 (=> (not res!500729) (not e!415798))))

(declare-fun lt!330515 () SeekEntryResult!7435)

(assert (=> b!744069 (= res!500729 (or (= lt!330515 (MissingZero!7435 i!1173)) (= lt!330515 (MissingVacant!7435 i!1173))))))

(assert (=> b!744069 (= lt!330515 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744070 () Bool)

(declare-fun e!415806 () Bool)

(assert (=> b!744070 (= e!415802 e!415806)))

(declare-fun res!500733 () Bool)

(assert (=> b!744070 (=> (not res!500733) (not e!415806))))

(declare-fun lt!330514 () SeekEntryResult!7435)

(assert (=> b!744070 (= res!500733 (= (seekEntryOrOpen!0 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330514))))

(assert (=> b!744070 (= lt!330514 (Found!7435 j!159))))

(declare-fun b!744071 () Bool)

(assert (=> b!744071 (= e!415798 e!415800)))

(declare-fun res!500728 () Bool)

(assert (=> b!744071 (=> (not res!500728) (not e!415800))))

(assert (=> b!744071 (= res!500728 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19879 a!3186) j!159) mask!3328) (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330512))))

(assert (=> b!744071 (= lt!330512 (Intermediate!7435 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744072 () Bool)

(assert (=> b!744072 (= e!415806 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330514))))

(declare-fun b!744073 () Bool)

(declare-fun res!500730 () Bool)

(assert (=> b!744073 (=> (not res!500730) (not e!415801))))

(assert (=> b!744073 (= res!500730 (validKeyInArray!0 (select (arr!19879 a!3186) j!159)))))

(assert (= (and start!65496 res!500732) b!744063))

(assert (= (and b!744063 res!500718) b!744073))

(assert (= (and b!744073 res!500730) b!744068))

(assert (= (and b!744068 res!500721) b!744067))

(assert (= (and b!744067 res!500722) b!744069))

(assert (= (and b!744069 res!500729) b!744060))

(assert (= (and b!744060 res!500719) b!744061))

(assert (= (and b!744061 res!500723) b!744056))

(assert (= (and b!744056 res!500720) b!744071))

(assert (= (and b!744071 res!500728) b!744054))

(assert (= (and b!744054 res!500727) b!744066))

(assert (= (and b!744066 c!82052) b!744055))

(assert (= (and b!744066 (not c!82052)) b!744057))

(assert (= (and b!744066 res!500726) b!744062))

(assert (= (and b!744062 res!500734) b!744065))

(assert (= (and b!744065 res!500717) b!744070))

(assert (= (and b!744070 res!500733) b!744072))

(assert (= (and b!744065 (not res!500725)) b!744064))

(assert (= (and b!744064 (not res!500724)) b!744058))

(assert (= (and b!744058 (not res!500731)) b!744059))

(declare-fun m!695181 () Bool)

(assert (=> b!744062 m!695181))

(declare-fun m!695183 () Bool)

(assert (=> b!744062 m!695183))

(assert (=> b!744062 m!695181))

(declare-fun m!695185 () Bool)

(assert (=> b!744062 m!695185))

(declare-fun m!695187 () Bool)

(assert (=> b!744062 m!695187))

(declare-fun m!695189 () Bool)

(assert (=> b!744062 m!695189))

(declare-fun m!695191 () Bool)

(assert (=> b!744067 m!695191))

(declare-fun m!695193 () Bool)

(assert (=> b!744072 m!695193))

(assert (=> b!744072 m!695193))

(declare-fun m!695195 () Bool)

(assert (=> b!744072 m!695195))

(declare-fun m!695197 () Bool)

(assert (=> b!744068 m!695197))

(assert (=> b!744057 m!695193))

(assert (=> b!744057 m!695193))

(declare-fun m!695199 () Bool)

(assert (=> b!744057 m!695199))

(declare-fun m!695201 () Bool)

(assert (=> b!744065 m!695201))

(declare-fun m!695203 () Bool)

(assert (=> b!744065 m!695203))

(declare-fun m!695205 () Bool)

(assert (=> b!744054 m!695205))

(assert (=> b!744058 m!695185))

(declare-fun m!695207 () Bool)

(assert (=> b!744058 m!695207))

(declare-fun m!695209 () Bool)

(assert (=> b!744061 m!695209))

(declare-fun m!695211 () Bool)

(assert (=> b!744069 m!695211))

(assert (=> b!744071 m!695193))

(assert (=> b!744071 m!695193))

(declare-fun m!695213 () Bool)

(assert (=> b!744071 m!695213))

(assert (=> b!744071 m!695213))

(assert (=> b!744071 m!695193))

(declare-fun m!695215 () Bool)

(assert (=> b!744071 m!695215))

(declare-fun m!695217 () Bool)

(assert (=> start!65496 m!695217))

(declare-fun m!695219 () Bool)

(assert (=> start!65496 m!695219))

(assert (=> b!744073 m!695193))

(assert (=> b!744073 m!695193))

(declare-fun m!695221 () Bool)

(assert (=> b!744073 m!695221))

(declare-fun m!695223 () Bool)

(assert (=> b!744060 m!695223))

(assert (=> b!744055 m!695193))

(assert (=> b!744055 m!695193))

(declare-fun m!695225 () Bool)

(assert (=> b!744055 m!695225))

(assert (=> b!744064 m!695193))

(assert (=> b!744064 m!695193))

(assert (=> b!744064 m!695199))

(assert (=> b!744070 m!695193))

(assert (=> b!744070 m!695193))

(declare-fun m!695227 () Bool)

(assert (=> b!744070 m!695227))

(declare-fun m!695229 () Bool)

(assert (=> b!744059 m!695229))

(check-sat (not b!744069) (not b!744070) (not b!744061) (not b!744072) (not b!744065) (not b!744057) (not start!65496) (not b!744071) (not b!744055) (not b!744067) (not b!744059) (not b!744062) (not b!744064) (not b!744068) (not b!744073) (not b!744060))
(check-sat)
