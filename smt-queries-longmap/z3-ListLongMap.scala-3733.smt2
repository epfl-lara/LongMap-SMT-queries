; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51380 () Bool)

(assert start!51380)

(declare-fun b!561064 () Bool)

(declare-fun e!323284 () Bool)

(declare-fun e!323282 () Bool)

(assert (=> b!561064 (= e!323284 e!323282)))

(declare-fun res!352365 () Bool)

(assert (=> b!561064 (=> (not res!352365) (not e!323282))))

(declare-datatypes ((SeekEntryResult!5374 0))(
  ( (MissingZero!5374 (index!23723 (_ BitVec 32))) (Found!5374 (index!23724 (_ BitVec 32))) (Intermediate!5374 (undefined!6186 Bool) (index!23725 (_ BitVec 32)) (x!52640 (_ BitVec 32))) (Undefined!5374) (MissingVacant!5374 (index!23726 (_ BitVec 32))) )
))
(declare-fun lt!255206 () SeekEntryResult!5374)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561064 (= res!352365 (or (= lt!255206 (MissingZero!5374 i!1132)) (= lt!255206 (MissingVacant!5374 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35254 0))(
  ( (array!35255 (arr!16928 (Array (_ BitVec 32) (_ BitVec 64))) (size!17293 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35254)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35254 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!561064 (= lt!255206 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561065 () Bool)

(declare-fun res!352367 () Bool)

(assert (=> b!561065 (=> (not res!352367) (not e!323284))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561065 (= res!352367 (and (= (size!17293 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17293 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17293 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561066 () Bool)

(declare-fun res!352364 () Bool)

(assert (=> b!561066 (=> (not res!352364) (not e!323282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35254 (_ BitVec 32)) Bool)

(assert (=> b!561066 (= res!352364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!352359 () Bool)

(assert (=> start!51380 (=> (not res!352359) (not e!323284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51380 (= res!352359 (validMask!0 mask!3119))))

(assert (=> start!51380 e!323284))

(assert (=> start!51380 true))

(declare-fun array_inv!12811 (array!35254) Bool)

(assert (=> start!51380 (array_inv!12811 a!3118)))

(declare-fun b!561067 () Bool)

(declare-fun e!323286 () Bool)

(declare-fun e!323288 () Bool)

(assert (=> b!561067 (= e!323286 e!323288)))

(declare-fun res!352366 () Bool)

(assert (=> b!561067 (=> res!352366 e!323288)))

(declare-fun lt!255204 () (_ BitVec 64))

(assert (=> b!561067 (= res!352366 (or (= lt!255204 (select (arr!16928 a!3118) j!142)) (= lt!255204 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!255211 () SeekEntryResult!5374)

(assert (=> b!561067 (= lt!255204 (select (arr!16928 a!3118) (index!23725 lt!255211)))))

(declare-fun b!561068 () Bool)

(declare-fun res!352370 () Bool)

(assert (=> b!561068 (=> (not res!352370) (not e!323284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561068 (= res!352370 (validKeyInArray!0 k0!1914))))

(declare-fun b!561069 () Bool)

(declare-fun e!323283 () Bool)

(assert (=> b!561069 (= e!323283 e!323286)))

(declare-fun res!352361 () Bool)

(assert (=> b!561069 (=> res!352361 e!323286)))

(get-info :version)

(assert (=> b!561069 (= res!352361 (or (undefined!6186 lt!255211) (not ((_ is Intermediate!5374) lt!255211))))))

(declare-fun b!561070 () Bool)

(declare-fun e!323287 () Bool)

(assert (=> b!561070 (= e!323287 (not true))))

(assert (=> b!561070 e!323283))

(declare-fun res!352358 () Bool)

(assert (=> b!561070 (=> (not res!352358) (not e!323283))))

(declare-fun lt!255207 () SeekEntryResult!5374)

(assert (=> b!561070 (= res!352358 (= lt!255207 (Found!5374 j!142)))))

(assert (=> b!561070 (= lt!255207 (seekEntryOrOpen!0 (select (arr!16928 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561070 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17508 0))(
  ( (Unit!17509) )
))
(declare-fun lt!255209 () Unit!17508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17508)

(assert (=> b!561070 (= lt!255209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561071 () Bool)

(declare-fun res!352362 () Bool)

(assert (=> b!561071 (=> (not res!352362) (not e!323284))))

(assert (=> b!561071 (= res!352362 (validKeyInArray!0 (select (arr!16928 a!3118) j!142)))))

(declare-fun b!561072 () Bool)

(declare-fun res!352363 () Bool)

(assert (=> b!561072 (=> (not res!352363) (not e!323282))))

(declare-datatypes ((List!11047 0))(
  ( (Nil!11044) (Cons!11043 (h!12046 (_ BitVec 64)) (t!17266 List!11047)) )
))
(declare-fun arrayNoDuplicates!0 (array!35254 (_ BitVec 32) List!11047) Bool)

(assert (=> b!561072 (= res!352363 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11044))))

(declare-fun b!561073 () Bool)

(declare-fun res!352369 () Bool)

(assert (=> b!561073 (=> (not res!352369) (not e!323284))))

(declare-fun arrayContainsKey!0 (array!35254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561073 (= res!352369 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561074 () Bool)

(declare-fun e!323285 () Bool)

(assert (=> b!561074 (= e!323288 e!323285)))

(declare-fun res!352368 () Bool)

(assert (=> b!561074 (=> (not res!352368) (not e!323285))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35254 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!561074 (= res!352368 (= lt!255207 (seekKeyOrZeroReturnVacant!0 (x!52640 lt!255211) (index!23725 lt!255211) (index!23725 lt!255211) (select (arr!16928 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561075 () Bool)

(assert (=> b!561075 (= e!323282 e!323287)))

(declare-fun res!352360 () Bool)

(assert (=> b!561075 (=> (not res!352360) (not e!323287))))

(declare-fun lt!255210 () array!35254)

(declare-fun lt!255205 () (_ BitVec 64))

(declare-fun lt!255208 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35254 (_ BitVec 32)) SeekEntryResult!5374)

(assert (=> b!561075 (= res!352360 (= lt!255211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255208 lt!255205 lt!255210 mask!3119)))))

(declare-fun lt!255203 () (_ BitVec 32))

(assert (=> b!561075 (= lt!255211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255203 (select (arr!16928 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561075 (= lt!255208 (toIndex!0 lt!255205 mask!3119))))

(assert (=> b!561075 (= lt!255205 (select (store (arr!16928 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561075 (= lt!255203 (toIndex!0 (select (arr!16928 a!3118) j!142) mask!3119))))

(assert (=> b!561075 (= lt!255210 (array!35255 (store (arr!16928 a!3118) i!1132 k0!1914) (size!17293 a!3118)))))

(declare-fun b!561076 () Bool)

(assert (=> b!561076 (= e!323285 (= (seekEntryOrOpen!0 lt!255205 lt!255210 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52640 lt!255211) (index!23725 lt!255211) (index!23725 lt!255211) lt!255205 lt!255210 mask!3119)))))

(assert (= (and start!51380 res!352359) b!561065))

(assert (= (and b!561065 res!352367) b!561071))

(assert (= (and b!561071 res!352362) b!561068))

(assert (= (and b!561068 res!352370) b!561073))

(assert (= (and b!561073 res!352369) b!561064))

(assert (= (and b!561064 res!352365) b!561066))

(assert (= (and b!561066 res!352364) b!561072))

(assert (= (and b!561072 res!352363) b!561075))

(assert (= (and b!561075 res!352360) b!561070))

(assert (= (and b!561070 res!352358) b!561069))

(assert (= (and b!561069 (not res!352361)) b!561067))

(assert (= (and b!561067 (not res!352366)) b!561074))

(assert (= (and b!561074 res!352368) b!561076))

(declare-fun m!538445 () Bool)

(assert (=> b!561064 m!538445))

(declare-fun m!538447 () Bool)

(assert (=> b!561074 m!538447))

(assert (=> b!561074 m!538447))

(declare-fun m!538449 () Bool)

(assert (=> b!561074 m!538449))

(declare-fun m!538451 () Bool)

(assert (=> b!561068 m!538451))

(declare-fun m!538453 () Bool)

(assert (=> b!561073 m!538453))

(assert (=> b!561071 m!538447))

(assert (=> b!561071 m!538447))

(declare-fun m!538455 () Bool)

(assert (=> b!561071 m!538455))

(declare-fun m!538457 () Bool)

(assert (=> start!51380 m!538457))

(declare-fun m!538459 () Bool)

(assert (=> start!51380 m!538459))

(assert (=> b!561070 m!538447))

(assert (=> b!561070 m!538447))

(declare-fun m!538461 () Bool)

(assert (=> b!561070 m!538461))

(declare-fun m!538463 () Bool)

(assert (=> b!561070 m!538463))

(declare-fun m!538465 () Bool)

(assert (=> b!561070 m!538465))

(assert (=> b!561067 m!538447))

(declare-fun m!538467 () Bool)

(assert (=> b!561067 m!538467))

(declare-fun m!538469 () Bool)

(assert (=> b!561072 m!538469))

(declare-fun m!538471 () Bool)

(assert (=> b!561075 m!538471))

(assert (=> b!561075 m!538447))

(declare-fun m!538473 () Bool)

(assert (=> b!561075 m!538473))

(assert (=> b!561075 m!538447))

(declare-fun m!538475 () Bool)

(assert (=> b!561075 m!538475))

(assert (=> b!561075 m!538447))

(declare-fun m!538477 () Bool)

(assert (=> b!561075 m!538477))

(declare-fun m!538479 () Bool)

(assert (=> b!561075 m!538479))

(declare-fun m!538481 () Bool)

(assert (=> b!561075 m!538481))

(declare-fun m!538483 () Bool)

(assert (=> b!561076 m!538483))

(declare-fun m!538485 () Bool)

(assert (=> b!561076 m!538485))

(declare-fun m!538487 () Bool)

(assert (=> b!561066 m!538487))

(check-sat (not b!561075) (not b!561070) (not b!561073) (not b!561068) (not b!561076) (not b!561074) (not b!561066) (not b!561072) (not b!561071) (not b!561064) (not start!51380))
(check-sat)
