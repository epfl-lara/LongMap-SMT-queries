; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52170 () Bool)

(assert start!52170)

(declare-fun res!359477 () Bool)

(declare-fun e!327586 () Bool)

(assert (=> start!52170 (=> (not res!359477) (not e!327586))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52170 (= res!359477 (validMask!0 mask!3119))))

(assert (=> start!52170 e!327586))

(assert (=> start!52170 true))

(declare-datatypes ((array!35693 0))(
  ( (array!35694 (arr!17138 (Array (_ BitVec 32) (_ BitVec 64))) (size!17502 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35693)

(declare-fun array_inv!12934 (array!35693) Bool)

(assert (=> start!52170 (array_inv!12934 a!3118)))

(declare-fun b!569454 () Bool)

(declare-fun res!359474 () Bool)

(declare-fun e!327587 () Bool)

(assert (=> b!569454 (=> (not res!359474) (not e!327587))))

(declare-datatypes ((List!11218 0))(
  ( (Nil!11215) (Cons!11214 (h!12235 (_ BitVec 64)) (t!17446 List!11218)) )
))
(declare-fun arrayNoDuplicates!0 (array!35693 (_ BitVec 32) List!11218) Bool)

(assert (=> b!569454 (= res!359474 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11215))))

(declare-fun b!569455 () Bool)

(assert (=> b!569455 (= e!327586 e!327587)))

(declare-fun res!359473 () Bool)

(assert (=> b!569455 (=> (not res!359473) (not e!327587))))

(declare-datatypes ((SeekEntryResult!5587 0))(
  ( (MissingZero!5587 (index!24575 (_ BitVec 32))) (Found!5587 (index!24576 (_ BitVec 32))) (Intermediate!5587 (undefined!6399 Bool) (index!24577 (_ BitVec 32)) (x!53446 (_ BitVec 32))) (Undefined!5587) (MissingVacant!5587 (index!24578 (_ BitVec 32))) )
))
(declare-fun lt!259558 () SeekEntryResult!5587)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569455 (= res!359473 (or (= lt!259558 (MissingZero!5587 i!1132)) (= lt!259558 (MissingVacant!5587 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35693 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!569455 (= lt!259558 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569456 () Bool)

(declare-fun res!359480 () Bool)

(assert (=> b!569456 (=> (not res!359480) (not e!327586))))

(declare-fun arrayContainsKey!0 (array!35693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569456 (= res!359480 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569457 () Bool)

(declare-fun e!327588 () Bool)

(assert (=> b!569457 (= e!327587 e!327588)))

(declare-fun res!359479 () Bool)

(assert (=> b!569457 (=> (not res!359479) (not e!327588))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259557 () SeekEntryResult!5587)

(declare-fun lt!259554 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35693 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!569457 (= res!359479 (= lt!259557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259554 (select (store (arr!17138 a!3118) i!1132 k!1914) j!142) (array!35694 (store (arr!17138 a!3118) i!1132 k!1914) (size!17502 a!3118)) mask!3119)))))

(declare-fun lt!259555 () (_ BitVec 32))

(assert (=> b!569457 (= lt!259557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259555 (select (arr!17138 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569457 (= lt!259554 (toIndex!0 (select (store (arr!17138 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569457 (= lt!259555 (toIndex!0 (select (arr!17138 a!3118) j!142) mask!3119))))

(declare-fun b!569458 () Bool)

(declare-fun res!359476 () Bool)

(assert (=> b!569458 (=> (not res!359476) (not e!327586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569458 (= res!359476 (validKeyInArray!0 (select (arr!17138 a!3118) j!142)))))

(declare-fun b!569459 () Bool)

(declare-fun res!359475 () Bool)

(assert (=> b!569459 (=> (not res!359475) (not e!327586))))

(assert (=> b!569459 (= res!359475 (and (= (size!17502 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17502 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17502 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569460 () Bool)

(declare-fun res!359472 () Bool)

(assert (=> b!569460 (=> (not res!359472) (not e!327586))))

(assert (=> b!569460 (= res!359472 (validKeyInArray!0 k!1914))))

(declare-fun b!569461 () Bool)

(declare-fun res!359478 () Bool)

(assert (=> b!569461 (=> (not res!359478) (not e!327587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35693 (_ BitVec 32)) Bool)

(assert (=> b!569461 (= res!359478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569462 () Bool)

(assert (=> b!569462 (= e!327588 (not true))))

(declare-fun lt!259556 () SeekEntryResult!5587)

(assert (=> b!569462 (and (= lt!259556 (Found!5587 j!142)) (or (undefined!6399 lt!259557) (not (is-Intermediate!5587 lt!259557)) (= (select (arr!17138 a!3118) (index!24577 lt!259557)) (select (arr!17138 a!3118) j!142)) (not (= (select (arr!17138 a!3118) (index!24577 lt!259557)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259556 (MissingZero!5587 (index!24577 lt!259557)))))))

(assert (=> b!569462 (= lt!259556 (seekEntryOrOpen!0 (select (arr!17138 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569462 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17876 0))(
  ( (Unit!17877) )
))
(declare-fun lt!259553 () Unit!17876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17876)

(assert (=> b!569462 (= lt!259553 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52170 res!359477) b!569459))

(assert (= (and b!569459 res!359475) b!569458))

(assert (= (and b!569458 res!359476) b!569460))

(assert (= (and b!569460 res!359472) b!569456))

(assert (= (and b!569456 res!359480) b!569455))

(assert (= (and b!569455 res!359473) b!569461))

(assert (= (and b!569461 res!359478) b!569454))

(assert (= (and b!569454 res!359474) b!569457))

(assert (= (and b!569457 res!359479) b!569462))

(declare-fun m!548191 () Bool)

(assert (=> b!569462 m!548191))

(declare-fun m!548193 () Bool)

(assert (=> b!569462 m!548193))

(declare-fun m!548195 () Bool)

(assert (=> b!569462 m!548195))

(declare-fun m!548197 () Bool)

(assert (=> b!569462 m!548197))

(assert (=> b!569462 m!548191))

(declare-fun m!548199 () Bool)

(assert (=> b!569462 m!548199))

(assert (=> b!569458 m!548191))

(assert (=> b!569458 m!548191))

(declare-fun m!548201 () Bool)

(assert (=> b!569458 m!548201))

(declare-fun m!548203 () Bool)

(assert (=> b!569454 m!548203))

(declare-fun m!548205 () Bool)

(assert (=> b!569455 m!548205))

(declare-fun m!548207 () Bool)

(assert (=> b!569456 m!548207))

(assert (=> b!569457 m!548191))

(declare-fun m!548209 () Bool)

(assert (=> b!569457 m!548209))

(assert (=> b!569457 m!548191))

(declare-fun m!548211 () Bool)

(assert (=> b!569457 m!548211))

(assert (=> b!569457 m!548191))

(declare-fun m!548213 () Bool)

(assert (=> b!569457 m!548213))

(assert (=> b!569457 m!548211))

(declare-fun m!548215 () Bool)

(assert (=> b!569457 m!548215))

(declare-fun m!548217 () Bool)

(assert (=> b!569457 m!548217))

(assert (=> b!569457 m!548211))

(declare-fun m!548219 () Bool)

(assert (=> b!569457 m!548219))

(declare-fun m!548221 () Bool)

(assert (=> start!52170 m!548221))

(declare-fun m!548223 () Bool)

(assert (=> start!52170 m!548223))

(declare-fun m!548225 () Bool)

(assert (=> b!569460 m!548225))

(declare-fun m!548227 () Bool)

(assert (=> b!569461 m!548227))

(push 1)

(assert (not b!569457))

(assert (not b!569462))

(assert (not b!569460))

