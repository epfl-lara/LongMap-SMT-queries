; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51390 () Bool)

(assert start!51390)

(declare-fun b!561297 () Bool)

(declare-fun res!352456 () Bool)

(declare-fun e!323436 () Bool)

(assert (=> b!561297 (=> (not res!352456) (not e!323436))))

(declare-datatypes ((array!35255 0))(
  ( (array!35256 (arr!16928 (Array (_ BitVec 32) (_ BitVec 64))) (size!17292 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35255)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35255 (_ BitVec 32)) Bool)

(assert (=> b!561297 (= res!352456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561298 () Bool)

(declare-fun e!323439 () Bool)

(assert (=> b!561298 (= e!323439 e!323436)))

(declare-fun res!352450 () Bool)

(assert (=> b!561298 (=> (not res!352450) (not e!323436))))

(declare-datatypes ((SeekEntryResult!5377 0))(
  ( (MissingZero!5377 (index!23735 (_ BitVec 32))) (Found!5377 (index!23736 (_ BitVec 32))) (Intermediate!5377 (undefined!6189 Bool) (index!23737 (_ BitVec 32)) (x!52640 (_ BitVec 32))) (Undefined!5377) (MissingVacant!5377 (index!23738 (_ BitVec 32))) )
))
(declare-fun lt!255411 () SeekEntryResult!5377)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561298 (= res!352450 (or (= lt!255411 (MissingZero!5377 i!1132)) (= lt!255411 (MissingVacant!5377 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35255 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!561298 (= lt!255411 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561299 () Bool)

(declare-fun e!323437 () Bool)

(declare-fun e!323435 () Bool)

(assert (=> b!561299 (= e!323437 e!323435)))

(declare-fun res!352455 () Bool)

(assert (=> b!561299 (=> (not res!352455) (not e!323435))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255414 () SeekEntryResult!5377)

(declare-fun lt!255415 () SeekEntryResult!5377)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35255 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!561299 (= res!352455 (= lt!255414 (seekKeyOrZeroReturnVacant!0 (x!52640 lt!255415) (index!23737 lt!255415) (index!23737 lt!255415) (select (arr!16928 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561300 () Bool)

(declare-fun res!352459 () Bool)

(assert (=> b!561300 (=> (not res!352459) (not e!323439))))

(assert (=> b!561300 (= res!352459 (and (= (size!17292 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17292 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17292 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561301 () Bool)

(declare-fun e!323434 () Bool)

(assert (=> b!561301 (= e!323436 e!323434)))

(declare-fun res!352451 () Bool)

(assert (=> b!561301 (=> (not res!352451) (not e!323434))))

(declare-fun lt!255412 () (_ BitVec 64))

(declare-fun lt!255418 () (_ BitVec 32))

(declare-fun lt!255410 () array!35255)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35255 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!561301 (= res!352451 (= lt!255415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255418 lt!255412 lt!255410 mask!3119)))))

(declare-fun lt!255413 () (_ BitVec 32))

(assert (=> b!561301 (= lt!255415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255413 (select (arr!16928 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561301 (= lt!255418 (toIndex!0 lt!255412 mask!3119))))

(assert (=> b!561301 (= lt!255412 (select (store (arr!16928 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561301 (= lt!255413 (toIndex!0 (select (arr!16928 a!3118) j!142) mask!3119))))

(assert (=> b!561301 (= lt!255410 (array!35256 (store (arr!16928 a!3118) i!1132 k!1914) (size!17292 a!3118)))))

(declare-fun b!561302 () Bool)

(declare-fun res!352458 () Bool)

(assert (=> b!561302 (=> (not res!352458) (not e!323436))))

(declare-datatypes ((List!11008 0))(
  ( (Nil!11005) (Cons!11004 (h!12007 (_ BitVec 64)) (t!17236 List!11008)) )
))
(declare-fun arrayNoDuplicates!0 (array!35255 (_ BitVec 32) List!11008) Bool)

(assert (=> b!561302 (= res!352458 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11005))))

(declare-fun b!561303 () Bool)

(assert (=> b!561303 (= e!323434 (not true))))

(declare-fun e!323438 () Bool)

(assert (=> b!561303 e!323438))

(declare-fun res!352460 () Bool)

(assert (=> b!561303 (=> (not res!352460) (not e!323438))))

(assert (=> b!561303 (= res!352460 (= lt!255414 (Found!5377 j!142)))))

(assert (=> b!561303 (= lt!255414 (seekEntryOrOpen!0 (select (arr!16928 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561303 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17528 0))(
  ( (Unit!17529) )
))
(declare-fun lt!255416 () Unit!17528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17528)

(assert (=> b!561303 (= lt!255416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561304 () Bool)

(declare-fun res!352448 () Bool)

(assert (=> b!561304 (=> (not res!352448) (not e!323439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561304 (= res!352448 (validKeyInArray!0 k!1914))))

(declare-fun b!561305 () Bool)

(declare-fun e!323432 () Bool)

(assert (=> b!561305 (= e!323432 e!323437)))

(declare-fun res!352449 () Bool)

(assert (=> b!561305 (=> res!352449 e!323437)))

(declare-fun lt!255417 () (_ BitVec 64))

(assert (=> b!561305 (= res!352449 (or (= lt!255417 (select (arr!16928 a!3118) j!142)) (= lt!255417 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561305 (= lt!255417 (select (arr!16928 a!3118) (index!23737 lt!255415)))))

(declare-fun b!561306 () Bool)

(declare-fun res!352453 () Bool)

(assert (=> b!561306 (=> (not res!352453) (not e!323439))))

(assert (=> b!561306 (= res!352453 (validKeyInArray!0 (select (arr!16928 a!3118) j!142)))))

(declare-fun b!561307 () Bool)

(assert (=> b!561307 (= e!323435 (= (seekEntryOrOpen!0 lt!255412 lt!255410 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52640 lt!255415) (index!23737 lt!255415) (index!23737 lt!255415) lt!255412 lt!255410 mask!3119)))))

(declare-fun b!561308 () Bool)

(declare-fun res!352457 () Bool)

(assert (=> b!561308 (=> (not res!352457) (not e!323439))))

(declare-fun arrayContainsKey!0 (array!35255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561308 (= res!352457 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!352452 () Bool)

(assert (=> start!51390 (=> (not res!352452) (not e!323439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51390 (= res!352452 (validMask!0 mask!3119))))

(assert (=> start!51390 e!323439))

(assert (=> start!51390 true))

(declare-fun array_inv!12724 (array!35255) Bool)

(assert (=> start!51390 (array_inv!12724 a!3118)))

(declare-fun b!561296 () Bool)

(assert (=> b!561296 (= e!323438 e!323432)))

(declare-fun res!352454 () Bool)

(assert (=> b!561296 (=> res!352454 e!323432)))

(assert (=> b!561296 (= res!352454 (or (undefined!6189 lt!255415) (not (is-Intermediate!5377 lt!255415))))))

(assert (= (and start!51390 res!352452) b!561300))

(assert (= (and b!561300 res!352459) b!561306))

(assert (= (and b!561306 res!352453) b!561304))

(assert (= (and b!561304 res!352448) b!561308))

(assert (= (and b!561308 res!352457) b!561298))

(assert (= (and b!561298 res!352450) b!561297))

(assert (= (and b!561297 res!352456) b!561302))

(assert (= (and b!561302 res!352458) b!561301))

(assert (= (and b!561301 res!352451) b!561303))

(assert (= (and b!561303 res!352460) b!561296))

(assert (= (and b!561296 (not res!352454)) b!561305))

(assert (= (and b!561305 (not res!352449)) b!561299))

(assert (= (and b!561299 res!352455) b!561307))

(declare-fun m!539173 () Bool)

(assert (=> b!561305 m!539173))

(declare-fun m!539175 () Bool)

(assert (=> b!561305 m!539175))

(declare-fun m!539177 () Bool)

(assert (=> b!561304 m!539177))

(declare-fun m!539179 () Bool)

(assert (=> b!561307 m!539179))

(declare-fun m!539181 () Bool)

(assert (=> b!561307 m!539181))

(assert (=> b!561303 m!539173))

(assert (=> b!561303 m!539173))

(declare-fun m!539183 () Bool)

(assert (=> b!561303 m!539183))

(declare-fun m!539185 () Bool)

(assert (=> b!561303 m!539185))

(declare-fun m!539187 () Bool)

(assert (=> b!561303 m!539187))

(declare-fun m!539189 () Bool)

(assert (=> b!561297 m!539189))

(declare-fun m!539191 () Bool)

(assert (=> b!561298 m!539191))

(assert (=> b!561306 m!539173))

(assert (=> b!561306 m!539173))

(declare-fun m!539193 () Bool)

(assert (=> b!561306 m!539193))

(declare-fun m!539195 () Bool)

(assert (=> b!561308 m!539195))

(assert (=> b!561301 m!539173))

(declare-fun m!539197 () Bool)

(assert (=> b!561301 m!539197))

(assert (=> b!561301 m!539173))

(assert (=> b!561301 m!539173))

(declare-fun m!539199 () Bool)

(assert (=> b!561301 m!539199))

(declare-fun m!539201 () Bool)

(assert (=> b!561301 m!539201))

(declare-fun m!539203 () Bool)

(assert (=> b!561301 m!539203))

(declare-fun m!539205 () Bool)

(assert (=> b!561301 m!539205))

(declare-fun m!539207 () Bool)

(assert (=> b!561301 m!539207))

(declare-fun m!539209 () Bool)

(assert (=> start!51390 m!539209))

(declare-fun m!539211 () Bool)

(assert (=> start!51390 m!539211))

(assert (=> b!561299 m!539173))

(assert (=> b!561299 m!539173))

(declare-fun m!539213 () Bool)

(assert (=> b!561299 m!539213))

(declare-fun m!539215 () Bool)

(assert (=> b!561302 m!539215))

(push 1)

