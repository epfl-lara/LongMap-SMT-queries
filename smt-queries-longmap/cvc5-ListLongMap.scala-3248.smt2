; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45360 () Bool)

(assert start!45360)

(declare-fun res!300217 () Bool)

(declare-fun e!291940 () Bool)

(assert (=> start!45360 (=> (not res!300217) (not e!291940))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45360 (= res!300217 (validMask!0 mask!3524))))

(assert (=> start!45360 e!291940))

(assert (=> start!45360 true))

(declare-datatypes ((array!32185 0))(
  ( (array!32186 (arr!15474 (Array (_ BitVec 32) (_ BitVec 64))) (size!15838 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32185)

(declare-fun array_inv!11270 (array!32185) Bool)

(assert (=> start!45360 (array_inv!11270 a!3235)))

(declare-fun b!498063 () Bool)

(declare-fun e!291942 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3941 0))(
  ( (MissingZero!3941 (index!17946 (_ BitVec 32))) (Found!3941 (index!17947 (_ BitVec 32))) (Intermediate!3941 (undefined!4753 Bool) (index!17948 (_ BitVec 32)) (x!47002 (_ BitVec 32))) (Undefined!3941) (MissingVacant!3941 (index!17949 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32185 (_ BitVec 32)) SeekEntryResult!3941)

(assert (=> b!498063 (= e!291942 (= (seekEntryOrOpen!0 (select (arr!15474 a!3235) j!176) a!3235 mask!3524) (Found!3941 j!176)))))

(declare-fun b!498064 () Bool)

(declare-fun res!300210 () Bool)

(declare-fun e!291938 () Bool)

(assert (=> b!498064 (=> (not res!300210) (not e!291938))))

(declare-datatypes ((List!9632 0))(
  ( (Nil!9629) (Cons!9628 (h!10502 (_ BitVec 64)) (t!15860 List!9632)) )
))
(declare-fun arrayNoDuplicates!0 (array!32185 (_ BitVec 32) List!9632) Bool)

(assert (=> b!498064 (= res!300210 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9629))))

(declare-fun b!498065 () Bool)

(assert (=> b!498065 (= e!291940 e!291938)))

(declare-fun res!300209 () Bool)

(assert (=> b!498065 (=> (not res!300209) (not e!291938))))

(declare-fun lt!225538 () SeekEntryResult!3941)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498065 (= res!300209 (or (= lt!225538 (MissingZero!3941 i!1204)) (= lt!225538 (MissingVacant!3941 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!498065 (= lt!225538 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498066 () Bool)

(declare-fun e!291936 () Bool)

(assert (=> b!498066 (= e!291936 false)))

(declare-fun b!498067 () Bool)

(declare-fun res!300219 () Bool)

(assert (=> b!498067 (=> (not res!300219) (not e!291938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32185 (_ BitVec 32)) Bool)

(assert (=> b!498067 (= res!300219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498068 () Bool)

(declare-datatypes ((Unit!14840 0))(
  ( (Unit!14841) )
))
(declare-fun e!291941 () Unit!14840)

(declare-fun Unit!14842 () Unit!14840)

(assert (=> b!498068 (= e!291941 Unit!14842)))

(declare-fun b!498069 () Bool)

(declare-fun res!300220 () Bool)

(assert (=> b!498069 (=> (not res!300220) (not e!291940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498069 (= res!300220 (validKeyInArray!0 k!2280))))

(declare-fun b!498070 () Bool)

(declare-fun e!291935 () Bool)

(assert (=> b!498070 (= e!291935 true)))

(declare-fun lt!225535 () SeekEntryResult!3941)

(declare-fun lt!225529 () (_ BitVec 64))

(declare-fun lt!225536 () array!32185)

(declare-fun lt!225532 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32185 (_ BitVec 32)) SeekEntryResult!3941)

(assert (=> b!498070 (= lt!225535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225532 lt!225529 lt!225536 mask!3524))))

(declare-fun b!498071 () Bool)

(declare-fun e!291939 () Bool)

(assert (=> b!498071 (= e!291938 (not e!291939))))

(declare-fun res!300213 () Bool)

(assert (=> b!498071 (=> res!300213 e!291939)))

(declare-fun lt!225531 () (_ BitVec 32))

(declare-fun lt!225537 () SeekEntryResult!3941)

(assert (=> b!498071 (= res!300213 (= lt!225537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225531 lt!225529 lt!225536 mask!3524)))))

(assert (=> b!498071 (= lt!225537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225532 (select (arr!15474 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498071 (= lt!225531 (toIndex!0 lt!225529 mask!3524))))

(assert (=> b!498071 (= lt!225529 (select (store (arr!15474 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498071 (= lt!225532 (toIndex!0 (select (arr!15474 a!3235) j!176) mask!3524))))

(assert (=> b!498071 (= lt!225536 (array!32186 (store (arr!15474 a!3235) i!1204 k!2280) (size!15838 a!3235)))))

(assert (=> b!498071 e!291942))

(declare-fun res!300215 () Bool)

(assert (=> b!498071 (=> (not res!300215) (not e!291942))))

(assert (=> b!498071 (= res!300215 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225533 () Unit!14840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14840)

(assert (=> b!498071 (= lt!225533 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498072 () Bool)

(declare-fun res!300216 () Bool)

(assert (=> b!498072 (=> (not res!300216) (not e!291940))))

(assert (=> b!498072 (= res!300216 (validKeyInArray!0 (select (arr!15474 a!3235) j!176)))))

(declare-fun b!498073 () Bool)

(assert (=> b!498073 (= e!291939 e!291935)))

(declare-fun res!300212 () Bool)

(assert (=> b!498073 (=> res!300212 e!291935)))

(assert (=> b!498073 (= res!300212 (or (bvsgt #b00000000000000000000000000000000 (x!47002 lt!225537)) (bvsgt (x!47002 lt!225537) #b01111111111111111111111111111110) (bvslt lt!225532 #b00000000000000000000000000000000) (bvsge lt!225532 (size!15838 a!3235)) (bvslt (index!17948 lt!225537) #b00000000000000000000000000000000) (bvsge (index!17948 lt!225537) (size!15838 a!3235)) (not (= lt!225537 (Intermediate!3941 false (index!17948 lt!225537) (x!47002 lt!225537))))))))

(assert (=> b!498073 (and (or (= (select (arr!15474 a!3235) (index!17948 lt!225537)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15474 a!3235) (index!17948 lt!225537)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15474 a!3235) (index!17948 lt!225537)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15474 a!3235) (index!17948 lt!225537)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225534 () Unit!14840)

(assert (=> b!498073 (= lt!225534 e!291941)))

(declare-fun c!59204 () Bool)

(assert (=> b!498073 (= c!59204 (= (select (arr!15474 a!3235) (index!17948 lt!225537)) (select (arr!15474 a!3235) j!176)))))

(assert (=> b!498073 (and (bvslt (x!47002 lt!225537) #b01111111111111111111111111111110) (or (= (select (arr!15474 a!3235) (index!17948 lt!225537)) (select (arr!15474 a!3235) j!176)) (= (select (arr!15474 a!3235) (index!17948 lt!225537)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15474 a!3235) (index!17948 lt!225537)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498074 () Bool)

(declare-fun res!300221 () Bool)

(assert (=> b!498074 (=> res!300221 e!291939)))

(assert (=> b!498074 (= res!300221 (or (undefined!4753 lt!225537) (not (is-Intermediate!3941 lt!225537))))))

(declare-fun b!498075 () Bool)

(declare-fun Unit!14843 () Unit!14840)

(assert (=> b!498075 (= e!291941 Unit!14843)))

(declare-fun lt!225530 () Unit!14840)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14840)

(assert (=> b!498075 (= lt!225530 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225532 #b00000000000000000000000000000000 (index!17948 lt!225537) (x!47002 lt!225537) mask!3524))))

(declare-fun res!300211 () Bool)

(assert (=> b!498075 (= res!300211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225532 lt!225529 lt!225536 mask!3524) (Intermediate!3941 false (index!17948 lt!225537) (x!47002 lt!225537))))))

(assert (=> b!498075 (=> (not res!300211) (not e!291936))))

(assert (=> b!498075 e!291936))

(declare-fun b!498076 () Bool)

(declare-fun res!300214 () Bool)

(assert (=> b!498076 (=> (not res!300214) (not e!291940))))

(declare-fun arrayContainsKey!0 (array!32185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498076 (= res!300214 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498077 () Bool)

(declare-fun res!300218 () Bool)

(assert (=> b!498077 (=> (not res!300218) (not e!291940))))

(assert (=> b!498077 (= res!300218 (and (= (size!15838 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15838 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15838 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45360 res!300217) b!498077))

(assert (= (and b!498077 res!300218) b!498072))

(assert (= (and b!498072 res!300216) b!498069))

(assert (= (and b!498069 res!300220) b!498076))

(assert (= (and b!498076 res!300214) b!498065))

(assert (= (and b!498065 res!300209) b!498067))

(assert (= (and b!498067 res!300219) b!498064))

(assert (= (and b!498064 res!300210) b!498071))

(assert (= (and b!498071 res!300215) b!498063))

(assert (= (and b!498071 (not res!300213)) b!498074))

(assert (= (and b!498074 (not res!300221)) b!498073))

(assert (= (and b!498073 c!59204) b!498075))

(assert (= (and b!498073 (not c!59204)) b!498068))

(assert (= (and b!498075 res!300211) b!498066))

(assert (= (and b!498073 (not res!300212)) b!498070))

(declare-fun m!479355 () Bool)

(assert (=> b!498063 m!479355))

(assert (=> b!498063 m!479355))

(declare-fun m!479357 () Bool)

(assert (=> b!498063 m!479357))

(declare-fun m!479359 () Bool)

(assert (=> start!45360 m!479359))

(declare-fun m!479361 () Bool)

(assert (=> start!45360 m!479361))

(declare-fun m!479363 () Bool)

(assert (=> b!498064 m!479363))

(declare-fun m!479365 () Bool)

(assert (=> b!498067 m!479365))

(declare-fun m!479367 () Bool)

(assert (=> b!498065 m!479367))

(declare-fun m!479369 () Bool)

(assert (=> b!498073 m!479369))

(assert (=> b!498073 m!479355))

(assert (=> b!498072 m!479355))

(assert (=> b!498072 m!479355))

(declare-fun m!479371 () Bool)

(assert (=> b!498072 m!479371))

(declare-fun m!479373 () Bool)

(assert (=> b!498070 m!479373))

(declare-fun m!479375 () Bool)

(assert (=> b!498076 m!479375))

(declare-fun m!479377 () Bool)

(assert (=> b!498071 m!479377))

(declare-fun m!479379 () Bool)

(assert (=> b!498071 m!479379))

(declare-fun m!479381 () Bool)

(assert (=> b!498071 m!479381))

(declare-fun m!479383 () Bool)

(assert (=> b!498071 m!479383))

(declare-fun m!479385 () Bool)

(assert (=> b!498071 m!479385))

(assert (=> b!498071 m!479355))

(declare-fun m!479387 () Bool)

(assert (=> b!498071 m!479387))

(assert (=> b!498071 m!479355))

(declare-fun m!479389 () Bool)

(assert (=> b!498071 m!479389))

(assert (=> b!498071 m!479355))

(declare-fun m!479391 () Bool)

(assert (=> b!498071 m!479391))

(declare-fun m!479393 () Bool)

(assert (=> b!498075 m!479393))

(assert (=> b!498075 m!479373))

(declare-fun m!479395 () Bool)

(assert (=> b!498069 m!479395))

(push 1)

