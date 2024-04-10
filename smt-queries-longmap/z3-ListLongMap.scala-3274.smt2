; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45590 () Bool)

(assert start!45590)

(declare-fun b!501973 () Bool)

(declare-fun res!303447 () Bool)

(declare-fun e!294054 () Bool)

(assert (=> b!501973 (=> res!303447 e!294054)))

(declare-fun e!294053 () Bool)

(assert (=> b!501973 (= res!303447 e!294053)))

(declare-fun res!303446 () Bool)

(assert (=> b!501973 (=> (not res!303446) (not e!294053))))

(declare-datatypes ((SeekEntryResult!4020 0))(
  ( (MissingZero!4020 (index!18268 (_ BitVec 32))) (Found!4020 (index!18269 (_ BitVec 32))) (Intermediate!4020 (undefined!4832 Bool) (index!18270 (_ BitVec 32)) (x!47301 (_ BitVec 32))) (Undefined!4020) (MissingVacant!4020 (index!18271 (_ BitVec 32))) )
))
(declare-fun lt!228082 () SeekEntryResult!4020)

(assert (=> b!501973 (= res!303446 (bvsgt #b00000000000000000000000000000000 (x!47301 lt!228082)))))

(declare-fun b!501974 () Bool)

(declare-fun res!303445 () Bool)

(declare-fun e!294047 () Bool)

(assert (=> b!501974 (=> (not res!303445) (not e!294047))))

(declare-datatypes ((array!32346 0))(
  ( (array!32347 (arr!15553 (Array (_ BitVec 32) (_ BitVec 64))) (size!15917 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32346)

(declare-datatypes ((List!9711 0))(
  ( (Nil!9708) (Cons!9707 (h!10584 (_ BitVec 64)) (t!15939 List!9711)) )
))
(declare-fun arrayNoDuplicates!0 (array!32346 (_ BitVec 32) List!9711) Bool)

(assert (=> b!501974 (= res!303445 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9708))))

(declare-fun b!501975 () Bool)

(declare-fun e!294046 () Bool)

(assert (=> b!501975 (= e!294046 e!294047)))

(declare-fun res!303453 () Bool)

(assert (=> b!501975 (=> (not res!303453) (not e!294047))))

(declare-fun lt!228077 () SeekEntryResult!4020)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501975 (= res!303453 (or (= lt!228077 (MissingZero!4020 i!1204)) (= lt!228077 (MissingVacant!4020 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32346 (_ BitVec 32)) SeekEntryResult!4020)

(assert (=> b!501975 (= lt!228077 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501976 () Bool)

(declare-fun e!294048 () Bool)

(assert (=> b!501976 (= e!294048 e!294054)))

(declare-fun res!303457 () Bool)

(assert (=> b!501976 (=> res!303457 e!294054)))

(declare-fun lt!228083 () (_ BitVec 32))

(assert (=> b!501976 (= res!303457 (or (bvsgt (x!47301 lt!228082) #b01111111111111111111111111111110) (bvslt lt!228083 #b00000000000000000000000000000000) (bvsge lt!228083 (size!15917 a!3235)) (bvslt (index!18270 lt!228082) #b00000000000000000000000000000000) (bvsge (index!18270 lt!228082) (size!15917 a!3235)) (not (= lt!228082 (Intermediate!4020 false (index!18270 lt!228082) (x!47301 lt!228082))))))))

(assert (=> b!501976 (= (index!18270 lt!228082) i!1204)))

(declare-datatypes ((Unit!15156 0))(
  ( (Unit!15157) )
))
(declare-fun lt!228075 () Unit!15156)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32346 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15156)

(assert (=> b!501976 (= lt!228075 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228083 #b00000000000000000000000000000000 (index!18270 lt!228082) (x!47301 lt!228082) mask!3524))))

(assert (=> b!501976 (and (or (= (select (arr!15553 a!3235) (index!18270 lt!228082)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15553 a!3235) (index!18270 lt!228082)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15553 a!3235) (index!18270 lt!228082)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15553 a!3235) (index!18270 lt!228082)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228078 () Unit!15156)

(declare-fun e!294049 () Unit!15156)

(assert (=> b!501976 (= lt!228078 e!294049)))

(declare-fun c!59543 () Bool)

(assert (=> b!501976 (= c!59543 (= (select (arr!15553 a!3235) (index!18270 lt!228082)) (select (arr!15553 a!3235) j!176)))))

(assert (=> b!501976 (and (bvslt (x!47301 lt!228082) #b01111111111111111111111111111110) (or (= (select (arr!15553 a!3235) (index!18270 lt!228082)) (select (arr!15553 a!3235) j!176)) (= (select (arr!15553 a!3235) (index!18270 lt!228082)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15553 a!3235) (index!18270 lt!228082)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501977 () Bool)

(declare-fun res!303452 () Bool)

(assert (=> b!501977 (=> (not res!303452) (not e!294046))))

(assert (=> b!501977 (= res!303452 (and (= (size!15917 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15917 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15917 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501978 () Bool)

(declare-fun res!303456 () Bool)

(assert (=> b!501978 (=> (not res!303456) (not e!294047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32346 (_ BitVec 32)) Bool)

(assert (=> b!501978 (= res!303456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501979 () Bool)

(declare-fun Unit!15158 () Unit!15156)

(assert (=> b!501979 (= e!294049 Unit!15158)))

(declare-fun b!501980 () Bool)

(declare-fun Unit!15159 () Unit!15156)

(assert (=> b!501980 (= e!294049 Unit!15159)))

(declare-fun lt!228084 () Unit!15156)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32346 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15156)

(assert (=> b!501980 (= lt!228084 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228083 #b00000000000000000000000000000000 (index!18270 lt!228082) (x!47301 lt!228082) mask!3524))))

(declare-fun lt!228076 () (_ BitVec 64))

(declare-fun lt!228080 () array!32346)

(declare-fun res!303458 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32346 (_ BitVec 32)) SeekEntryResult!4020)

(assert (=> b!501980 (= res!303458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228083 lt!228076 lt!228080 mask!3524) (Intermediate!4020 false (index!18270 lt!228082) (x!47301 lt!228082))))))

(declare-fun e!294050 () Bool)

(assert (=> b!501980 (=> (not res!303458) (not e!294050))))

(assert (=> b!501980 e!294050))

(declare-fun b!501981 () Bool)

(declare-fun res!303449 () Bool)

(assert (=> b!501981 (=> (not res!303449) (not e!294046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501981 (= res!303449 (validKeyInArray!0 k0!2280))))

(declare-fun b!501982 () Bool)

(assert (=> b!501982 (= e!294054 true)))

(declare-fun lt!228081 () SeekEntryResult!4020)

(assert (=> b!501982 (= lt!228081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228083 lt!228076 lt!228080 mask!3524))))

(declare-fun b!501983 () Bool)

(declare-fun res!303455 () Bool)

(assert (=> b!501983 (=> (not res!303455) (not e!294046))))

(assert (=> b!501983 (= res!303455 (validKeyInArray!0 (select (arr!15553 a!3235) j!176)))))

(declare-fun res!303454 () Bool)

(assert (=> start!45590 (=> (not res!303454) (not e!294046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45590 (= res!303454 (validMask!0 mask!3524))))

(assert (=> start!45590 e!294046))

(assert (=> start!45590 true))

(declare-fun array_inv!11349 (array!32346) Bool)

(assert (=> start!45590 (array_inv!11349 a!3235)))

(declare-fun b!501984 () Bool)

(declare-fun res!303450 () Bool)

(assert (=> b!501984 (=> (not res!303450) (not e!294046))))

(declare-fun arrayContainsKey!0 (array!32346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501984 (= res!303450 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501985 () Bool)

(declare-fun res!303448 () Bool)

(assert (=> b!501985 (=> res!303448 e!294048)))

(get-info :version)

(assert (=> b!501985 (= res!303448 (or (undefined!4832 lt!228082) (not ((_ is Intermediate!4020) lt!228082))))))

(declare-fun b!501986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32346 (_ BitVec 32)) SeekEntryResult!4020)

(assert (=> b!501986 (= e!294053 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228083 (index!18270 lt!228082) (select (arr!15553 a!3235) j!176) a!3235 mask!3524) (Found!4020 j!176))))))

(declare-fun b!501987 () Bool)

(assert (=> b!501987 (= e!294050 false)))

(declare-fun e!294051 () Bool)

(declare-fun b!501988 () Bool)

(assert (=> b!501988 (= e!294051 (= (seekEntryOrOpen!0 (select (arr!15553 a!3235) j!176) a!3235 mask!3524) (Found!4020 j!176)))))

(declare-fun b!501989 () Bool)

(assert (=> b!501989 (= e!294047 (not e!294048))))

(declare-fun res!303451 () Bool)

(assert (=> b!501989 (=> res!303451 e!294048)))

(declare-fun lt!228085 () (_ BitVec 32))

(assert (=> b!501989 (= res!303451 (= lt!228082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228085 lt!228076 lt!228080 mask!3524)))))

(assert (=> b!501989 (= lt!228082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228083 (select (arr!15553 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501989 (= lt!228085 (toIndex!0 lt!228076 mask!3524))))

(assert (=> b!501989 (= lt!228076 (select (store (arr!15553 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501989 (= lt!228083 (toIndex!0 (select (arr!15553 a!3235) j!176) mask!3524))))

(assert (=> b!501989 (= lt!228080 (array!32347 (store (arr!15553 a!3235) i!1204 k0!2280) (size!15917 a!3235)))))

(assert (=> b!501989 e!294051))

(declare-fun res!303444 () Bool)

(assert (=> b!501989 (=> (not res!303444) (not e!294051))))

(assert (=> b!501989 (= res!303444 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228079 () Unit!15156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15156)

(assert (=> b!501989 (= lt!228079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45590 res!303454) b!501977))

(assert (= (and b!501977 res!303452) b!501983))

(assert (= (and b!501983 res!303455) b!501981))

(assert (= (and b!501981 res!303449) b!501984))

(assert (= (and b!501984 res!303450) b!501975))

(assert (= (and b!501975 res!303453) b!501978))

(assert (= (and b!501978 res!303456) b!501974))

(assert (= (and b!501974 res!303445) b!501989))

(assert (= (and b!501989 res!303444) b!501988))

(assert (= (and b!501989 (not res!303451)) b!501985))

(assert (= (and b!501985 (not res!303448)) b!501976))

(assert (= (and b!501976 c!59543) b!501980))

(assert (= (and b!501976 (not c!59543)) b!501979))

(assert (= (and b!501980 res!303458) b!501987))

(assert (= (and b!501976 (not res!303457)) b!501973))

(assert (= (and b!501973 res!303446) b!501986))

(assert (= (and b!501973 (not res!303447)) b!501982))

(declare-fun m!482953 () Bool)

(assert (=> b!501989 m!482953))

(declare-fun m!482955 () Bool)

(assert (=> b!501989 m!482955))

(declare-fun m!482957 () Bool)

(assert (=> b!501989 m!482957))

(declare-fun m!482959 () Bool)

(assert (=> b!501989 m!482959))

(declare-fun m!482961 () Bool)

(assert (=> b!501989 m!482961))

(declare-fun m!482963 () Bool)

(assert (=> b!501989 m!482963))

(assert (=> b!501989 m!482953))

(declare-fun m!482965 () Bool)

(assert (=> b!501989 m!482965))

(assert (=> b!501989 m!482953))

(declare-fun m!482967 () Bool)

(assert (=> b!501989 m!482967))

(declare-fun m!482969 () Bool)

(assert (=> b!501989 m!482969))

(declare-fun m!482971 () Bool)

(assert (=> b!501978 m!482971))

(declare-fun m!482973 () Bool)

(assert (=> start!45590 m!482973))

(declare-fun m!482975 () Bool)

(assert (=> start!45590 m!482975))

(assert (=> b!501986 m!482953))

(assert (=> b!501986 m!482953))

(declare-fun m!482977 () Bool)

(assert (=> b!501986 m!482977))

(declare-fun m!482979 () Bool)

(assert (=> b!501976 m!482979))

(declare-fun m!482981 () Bool)

(assert (=> b!501976 m!482981))

(assert (=> b!501976 m!482953))

(assert (=> b!501983 m!482953))

(assert (=> b!501983 m!482953))

(declare-fun m!482983 () Bool)

(assert (=> b!501983 m!482983))

(declare-fun m!482985 () Bool)

(assert (=> b!501984 m!482985))

(assert (=> b!501988 m!482953))

(assert (=> b!501988 m!482953))

(declare-fun m!482987 () Bool)

(assert (=> b!501988 m!482987))

(declare-fun m!482989 () Bool)

(assert (=> b!501974 m!482989))

(declare-fun m!482991 () Bool)

(assert (=> b!501982 m!482991))

(declare-fun m!482993 () Bool)

(assert (=> b!501981 m!482993))

(declare-fun m!482995 () Bool)

(assert (=> b!501980 m!482995))

(assert (=> b!501980 m!482991))

(declare-fun m!482997 () Bool)

(assert (=> b!501975 m!482997))

(check-sat (not b!501986) (not b!501981) (not b!501988) (not b!501989) (not b!501978) (not b!501982) (not start!45590) (not b!501974) (not b!501984) (not b!501980) (not b!501983) (not b!501976) (not b!501975))
(check-sat)
