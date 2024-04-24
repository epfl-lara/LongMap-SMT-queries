; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52206 () Bool)

(assert start!52206)

(declare-fun res!359437 () Bool)

(declare-fun e!327656 () Bool)

(assert (=> start!52206 (=> (not res!359437) (not e!327656))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52206 (= res!359437 (validMask!0 mask!3119))))

(assert (=> start!52206 e!327656))

(assert (=> start!52206 true))

(declare-datatypes ((array!35676 0))(
  ( (array!35677 (arr!17128 (Array (_ BitVec 32) (_ BitVec 64))) (size!17492 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35676)

(declare-fun array_inv!12987 (array!35676) Bool)

(assert (=> start!52206 (array_inv!12987 a!3118)))

(declare-fun b!569519 () Bool)

(declare-fun res!359436 () Bool)

(declare-fun e!327657 () Bool)

(assert (=> b!569519 (=> (not res!359436) (not e!327657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35676 (_ BitVec 32)) Bool)

(assert (=> b!569519 (= res!359436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569520 () Bool)

(declare-fun res!359434 () Bool)

(assert (=> b!569520 (=> (not res!359434) (not e!327656))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569520 (= res!359434 (validKeyInArray!0 k0!1914))))

(declare-fun b!569521 () Bool)

(declare-fun res!359432 () Bool)

(assert (=> b!569521 (=> (not res!359432) (not e!327656))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!569521 (= res!359432 (validKeyInArray!0 (select (arr!17128 a!3118) j!142)))))

(declare-fun b!569522 () Bool)

(assert (=> b!569522 (= e!327656 e!327657)))

(declare-fun res!359438 () Bool)

(assert (=> b!569522 (=> (not res!359438) (not e!327657))))

(declare-datatypes ((SeekEntryResult!5533 0))(
  ( (MissingZero!5533 (index!24359 (_ BitVec 32))) (Found!5533 (index!24360 (_ BitVec 32))) (Intermediate!5533 (undefined!6345 Bool) (index!24361 (_ BitVec 32)) (x!53387 (_ BitVec 32))) (Undefined!5533) (MissingVacant!5533 (index!24362 (_ BitVec 32))) )
))
(declare-fun lt!259578 () SeekEntryResult!5533)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569522 (= res!359438 (or (= lt!259578 (MissingZero!5533 i!1132)) (= lt!259578 (MissingVacant!5533 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35676 (_ BitVec 32)) SeekEntryResult!5533)

(assert (=> b!569522 (= lt!259578 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569523 () Bool)

(declare-fun res!359435 () Bool)

(assert (=> b!569523 (=> (not res!359435) (not e!327656))))

(declare-fun arrayContainsKey!0 (array!35676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569523 (= res!359435 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569524 () Bool)

(declare-fun e!327654 () Bool)

(assert (=> b!569524 (= e!327657 e!327654)))

(declare-fun res!359440 () Bool)

(assert (=> b!569524 (=> (not res!359440) (not e!327654))))

(declare-fun lt!259577 () (_ BitVec 32))

(declare-fun lt!259579 () SeekEntryResult!5533)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35676 (_ BitVec 32)) SeekEntryResult!5533)

(assert (=> b!569524 (= res!359440 (= lt!259579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259577 (select (store (arr!17128 a!3118) i!1132 k0!1914) j!142) (array!35677 (store (arr!17128 a!3118) i!1132 k0!1914) (size!17492 a!3118)) mask!3119)))))

(declare-fun lt!259576 () (_ BitVec 32))

(assert (=> b!569524 (= lt!259579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259576 (select (arr!17128 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569524 (= lt!259577 (toIndex!0 (select (store (arr!17128 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569524 (= lt!259576 (toIndex!0 (select (arr!17128 a!3118) j!142) mask!3119))))

(declare-fun b!569525 () Bool)

(get-info :version)

(assert (=> b!569525 (= e!327654 (not (or (undefined!6345 lt!259579) (not ((_ is Intermediate!5533) lt!259579)) (= (select (arr!17128 a!3118) (index!24361 lt!259579)) (select (arr!17128 a!3118) j!142)) (not (= (select (arr!17128 a!3118) (index!24361 lt!259579)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!259575 () SeekEntryResult!5533)

(assert (=> b!569525 (and (= lt!259575 (Found!5533 j!142)) (or (undefined!6345 lt!259579) (not ((_ is Intermediate!5533) lt!259579)) (= (select (arr!17128 a!3118) (index!24361 lt!259579)) (select (arr!17128 a!3118) j!142)) (not (= (select (arr!17128 a!3118) (index!24361 lt!259579)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259575 (MissingZero!5533 (index!24361 lt!259579)))))))

(assert (=> b!569525 (= lt!259575 (seekEntryOrOpen!0 (select (arr!17128 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569525 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17839 0))(
  ( (Unit!17840) )
))
(declare-fun lt!259574 () Unit!17839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17839)

(assert (=> b!569525 (= lt!259574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569526 () Bool)

(declare-fun res!359439 () Bool)

(assert (=> b!569526 (=> (not res!359439) (not e!327657))))

(declare-datatypes ((List!11115 0))(
  ( (Nil!11112) (Cons!11111 (h!12135 (_ BitVec 64)) (t!17335 List!11115)) )
))
(declare-fun arrayNoDuplicates!0 (array!35676 (_ BitVec 32) List!11115) Bool)

(assert (=> b!569526 (= res!359439 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11112))))

(declare-fun b!569527 () Bool)

(declare-fun res!359433 () Bool)

(assert (=> b!569527 (=> (not res!359433) (not e!327656))))

(assert (=> b!569527 (= res!359433 (and (= (size!17492 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17492 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17492 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52206 res!359437) b!569527))

(assert (= (and b!569527 res!359433) b!569521))

(assert (= (and b!569521 res!359432) b!569520))

(assert (= (and b!569520 res!359434) b!569523))

(assert (= (and b!569523 res!359435) b!569522))

(assert (= (and b!569522 res!359438) b!569519))

(assert (= (and b!569519 res!359436) b!569526))

(assert (= (and b!569526 res!359439) b!569524))

(assert (= (and b!569524 res!359440) b!569525))

(declare-fun m!548339 () Bool)

(assert (=> start!52206 m!548339))

(declare-fun m!548341 () Bool)

(assert (=> start!52206 m!548341))

(declare-fun m!548343 () Bool)

(assert (=> b!569519 m!548343))

(declare-fun m!548345 () Bool)

(assert (=> b!569526 m!548345))

(declare-fun m!548347 () Bool)

(assert (=> b!569521 m!548347))

(assert (=> b!569521 m!548347))

(declare-fun m!548349 () Bool)

(assert (=> b!569521 m!548349))

(assert (=> b!569524 m!548347))

(declare-fun m!548351 () Bool)

(assert (=> b!569524 m!548351))

(assert (=> b!569524 m!548347))

(declare-fun m!548353 () Bool)

(assert (=> b!569524 m!548353))

(assert (=> b!569524 m!548347))

(declare-fun m!548355 () Bool)

(assert (=> b!569524 m!548355))

(declare-fun m!548357 () Bool)

(assert (=> b!569524 m!548357))

(assert (=> b!569524 m!548355))

(declare-fun m!548359 () Bool)

(assert (=> b!569524 m!548359))

(assert (=> b!569524 m!548355))

(declare-fun m!548361 () Bool)

(assert (=> b!569524 m!548361))

(assert (=> b!569525 m!548347))

(declare-fun m!548363 () Bool)

(assert (=> b!569525 m!548363))

(declare-fun m!548365 () Bool)

(assert (=> b!569525 m!548365))

(declare-fun m!548367 () Bool)

(assert (=> b!569525 m!548367))

(assert (=> b!569525 m!548347))

(declare-fun m!548369 () Bool)

(assert (=> b!569525 m!548369))

(declare-fun m!548371 () Bool)

(assert (=> b!569523 m!548371))

(declare-fun m!548373 () Bool)

(assert (=> b!569522 m!548373))

(declare-fun m!548375 () Bool)

(assert (=> b!569520 m!548375))

(check-sat (not b!569521) (not b!569519) (not b!569522) (not start!52206) (not b!569526) (not b!569524) (not b!569520) (not b!569523) (not b!569525))
(check-sat)
