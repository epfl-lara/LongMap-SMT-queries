; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47720 () Bool)

(assert start!47720)

(declare-fun b!525069 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!306171 () Bool)

(declare-datatypes ((array!33358 0))(
  ( (array!33359 (arr!16030 (Array (_ BitVec 32) (_ BitVec 64))) (size!16394 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33358)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4453 0))(
  ( (MissingZero!4453 (index!20024 (_ BitVec 32))) (Found!4453 (index!20025 (_ BitVec 32))) (Intermediate!4453 (undefined!5265 Bool) (index!20026 (_ BitVec 32)) (x!49151 (_ BitVec 32))) (Undefined!4453) (MissingVacant!4453 (index!20027 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33358 (_ BitVec 32)) SeekEntryResult!4453)

(assert (=> b!525069 (= e!306171 (= (seekEntryOrOpen!0 (select (arr!16030 a!3235) j!176) a!3235 mask!3524) (Found!4453 j!176)))))

(declare-fun b!525071 () Bool)

(declare-fun res!321935 () Bool)

(declare-fun e!306167 () Bool)

(assert (=> b!525071 (=> (not res!321935) (not e!306167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525071 (= res!321935 (validKeyInArray!0 (select (arr!16030 a!3235) j!176)))))

(declare-fun b!525072 () Bool)

(declare-datatypes ((Unit!16423 0))(
  ( (Unit!16424) )
))
(declare-fun e!306168 () Unit!16423)

(declare-fun Unit!16425 () Unit!16423)

(assert (=> b!525072 (= e!306168 Unit!16425)))

(declare-fun b!525073 () Bool)

(declare-fun res!321942 () Bool)

(declare-fun e!306169 () Bool)

(assert (=> b!525073 (=> (not res!321942) (not e!306169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33358 (_ BitVec 32)) Bool)

(assert (=> b!525073 (= res!321942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525074 () Bool)

(declare-fun e!306165 () Bool)

(assert (=> b!525074 (= e!306165 true)))

(declare-fun lt!241186 () SeekEntryResult!4453)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525074 (= (index!20026 lt!241186) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!241189 () (_ BitVec 32))

(declare-fun lt!241190 () Unit!16423)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33358 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16423)

(assert (=> b!525074 (= lt!241190 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241189 #b00000000000000000000000000000000 (index!20026 lt!241186) (x!49151 lt!241186) mask!3524))))

(assert (=> b!525074 (and (or (= (select (arr!16030 a!3235) (index!20026 lt!241186)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16030 a!3235) (index!20026 lt!241186)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16030 a!3235) (index!20026 lt!241186)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16030 a!3235) (index!20026 lt!241186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241194 () Unit!16423)

(assert (=> b!525074 (= lt!241194 e!306168)))

(declare-fun c!61874 () Bool)

(assert (=> b!525074 (= c!61874 (= (select (arr!16030 a!3235) (index!20026 lt!241186)) (select (arr!16030 a!3235) j!176)))))

(assert (=> b!525074 (and (bvslt (x!49151 lt!241186) #b01111111111111111111111111111110) (or (= (select (arr!16030 a!3235) (index!20026 lt!241186)) (select (arr!16030 a!3235) j!176)) (= (select (arr!16030 a!3235) (index!20026 lt!241186)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16030 a!3235) (index!20026 lt!241186)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525075 () Bool)

(assert (=> b!525075 (= e!306167 e!306169)))

(declare-fun res!321934 () Bool)

(assert (=> b!525075 (=> (not res!321934) (not e!306169))))

(declare-fun lt!241187 () SeekEntryResult!4453)

(assert (=> b!525075 (= res!321934 (or (= lt!241187 (MissingZero!4453 i!1204)) (= lt!241187 (MissingVacant!4453 i!1204))))))

(assert (=> b!525075 (= lt!241187 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525076 () Bool)

(declare-fun res!321932 () Bool)

(assert (=> b!525076 (=> (not res!321932) (not e!306167))))

(assert (=> b!525076 (= res!321932 (and (= (size!16394 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16394 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16394 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525077 () Bool)

(declare-fun e!306170 () Bool)

(assert (=> b!525077 (= e!306170 false)))

(declare-fun b!525078 () Bool)

(declare-fun res!321941 () Bool)

(assert (=> b!525078 (=> (not res!321941) (not e!306167))))

(declare-fun arrayContainsKey!0 (array!33358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525078 (= res!321941 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!321939 () Bool)

(assert (=> start!47720 (=> (not res!321939) (not e!306167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47720 (= res!321939 (validMask!0 mask!3524))))

(assert (=> start!47720 e!306167))

(assert (=> start!47720 true))

(declare-fun array_inv!11889 (array!33358) Bool)

(assert (=> start!47720 (array_inv!11889 a!3235)))

(declare-fun b!525070 () Bool)

(assert (=> b!525070 (= e!306169 (not e!306165))))

(declare-fun res!321933 () Bool)

(assert (=> b!525070 (=> res!321933 e!306165)))

(declare-fun lt!241188 () array!33358)

(declare-fun lt!241195 () (_ BitVec 32))

(declare-fun lt!241191 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33358 (_ BitVec 32)) SeekEntryResult!4453)

(assert (=> b!525070 (= res!321933 (= lt!241186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241195 lt!241191 lt!241188 mask!3524)))))

(assert (=> b!525070 (= lt!241186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241189 (select (arr!16030 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525070 (= lt!241195 (toIndex!0 lt!241191 mask!3524))))

(assert (=> b!525070 (= lt!241191 (select (store (arr!16030 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525070 (= lt!241189 (toIndex!0 (select (arr!16030 a!3235) j!176) mask!3524))))

(assert (=> b!525070 (= lt!241188 (array!33359 (store (arr!16030 a!3235) i!1204 k0!2280) (size!16394 a!3235)))))

(assert (=> b!525070 e!306171))

(declare-fun res!321936 () Bool)

(assert (=> b!525070 (=> (not res!321936) (not e!306171))))

(assert (=> b!525070 (= res!321936 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241193 () Unit!16423)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16423)

(assert (=> b!525070 (= lt!241193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525079 () Bool)

(declare-fun Unit!16426 () Unit!16423)

(assert (=> b!525079 (= e!306168 Unit!16426)))

(declare-fun lt!241192 () Unit!16423)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33358 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16423)

(assert (=> b!525079 (= lt!241192 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241189 #b00000000000000000000000000000000 (index!20026 lt!241186) (x!49151 lt!241186) mask!3524))))

(declare-fun res!321943 () Bool)

(assert (=> b!525079 (= res!321943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241189 lt!241191 lt!241188 mask!3524) (Intermediate!4453 false (index!20026 lt!241186) (x!49151 lt!241186))))))

(assert (=> b!525079 (=> (not res!321943) (not e!306170))))

(assert (=> b!525079 e!306170))

(declare-fun b!525080 () Bool)

(declare-fun res!321937 () Bool)

(assert (=> b!525080 (=> res!321937 e!306165)))

(get-info :version)

(assert (=> b!525080 (= res!321937 (or (undefined!5265 lt!241186) (not ((_ is Intermediate!4453) lt!241186))))))

(declare-fun b!525081 () Bool)

(declare-fun res!321940 () Bool)

(assert (=> b!525081 (=> (not res!321940) (not e!306167))))

(assert (=> b!525081 (= res!321940 (validKeyInArray!0 k0!2280))))

(declare-fun b!525082 () Bool)

(declare-fun res!321938 () Bool)

(assert (=> b!525082 (=> (not res!321938) (not e!306169))))

(declare-datatypes ((List!10095 0))(
  ( (Nil!10092) (Cons!10091 (h!11022 (_ BitVec 64)) (t!16315 List!10095)) )
))
(declare-fun arrayNoDuplicates!0 (array!33358 (_ BitVec 32) List!10095) Bool)

(assert (=> b!525082 (= res!321938 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10092))))

(assert (= (and start!47720 res!321939) b!525076))

(assert (= (and b!525076 res!321932) b!525071))

(assert (= (and b!525071 res!321935) b!525081))

(assert (= (and b!525081 res!321940) b!525078))

(assert (= (and b!525078 res!321941) b!525075))

(assert (= (and b!525075 res!321934) b!525073))

(assert (= (and b!525073 res!321942) b!525082))

(assert (= (and b!525082 res!321938) b!525070))

(assert (= (and b!525070 res!321936) b!525069))

(assert (= (and b!525070 (not res!321933)) b!525080))

(assert (= (and b!525080 (not res!321937)) b!525074))

(assert (= (and b!525074 c!61874) b!525079))

(assert (= (and b!525074 (not c!61874)) b!525072))

(assert (= (and b!525079 res!321943) b!525077))

(declare-fun m!505957 () Bool)

(assert (=> b!525078 m!505957))

(declare-fun m!505959 () Bool)

(assert (=> b!525073 m!505959))

(declare-fun m!505961 () Bool)

(assert (=> b!525082 m!505961))

(declare-fun m!505963 () Bool)

(assert (=> b!525074 m!505963))

(declare-fun m!505965 () Bool)

(assert (=> b!525074 m!505965))

(declare-fun m!505967 () Bool)

(assert (=> b!525074 m!505967))

(declare-fun m!505969 () Bool)

(assert (=> b!525075 m!505969))

(assert (=> b!525070 m!505967))

(declare-fun m!505971 () Bool)

(assert (=> b!525070 m!505971))

(declare-fun m!505973 () Bool)

(assert (=> b!525070 m!505973))

(declare-fun m!505975 () Bool)

(assert (=> b!525070 m!505975))

(declare-fun m!505977 () Bool)

(assert (=> b!525070 m!505977))

(declare-fun m!505979 () Bool)

(assert (=> b!525070 m!505979))

(assert (=> b!525070 m!505967))

(declare-fun m!505981 () Bool)

(assert (=> b!525070 m!505981))

(assert (=> b!525070 m!505967))

(declare-fun m!505983 () Bool)

(assert (=> b!525070 m!505983))

(declare-fun m!505985 () Bool)

(assert (=> b!525070 m!505985))

(assert (=> b!525069 m!505967))

(assert (=> b!525069 m!505967))

(declare-fun m!505987 () Bool)

(assert (=> b!525069 m!505987))

(declare-fun m!505989 () Bool)

(assert (=> b!525081 m!505989))

(declare-fun m!505991 () Bool)

(assert (=> start!47720 m!505991))

(declare-fun m!505993 () Bool)

(assert (=> start!47720 m!505993))

(declare-fun m!505995 () Bool)

(assert (=> b!525079 m!505995))

(declare-fun m!505997 () Bool)

(assert (=> b!525079 m!505997))

(assert (=> b!525071 m!505967))

(assert (=> b!525071 m!505967))

(declare-fun m!505999 () Bool)

(assert (=> b!525071 m!505999))

(check-sat (not b!525079) (not b!525078) (not b!525070) (not b!525075) (not b!525069) (not b!525082) (not b!525081) (not start!47720) (not b!525073) (not b!525074) (not b!525071))
(check-sat)
