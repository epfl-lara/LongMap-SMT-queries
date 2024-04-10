; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52178 () Bool)

(assert start!52178)

(declare-fun b!569562 () Bool)

(declare-fun e!327634 () Bool)

(assert (=> b!569562 (= e!327634 (not true))))

(declare-datatypes ((SeekEntryResult!5591 0))(
  ( (MissingZero!5591 (index!24591 (_ BitVec 32))) (Found!5591 (index!24592 (_ BitVec 32))) (Intermediate!5591 (undefined!6403 Bool) (index!24593 (_ BitVec 32)) (x!53466 (_ BitVec 32))) (Undefined!5591) (MissingVacant!5591 (index!24594 (_ BitVec 32))) )
))
(declare-fun lt!259630 () SeekEntryResult!5591)

(declare-fun lt!259629 () SeekEntryResult!5591)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35701 0))(
  ( (array!35702 (arr!17142 (Array (_ BitVec 32) (_ BitVec 64))) (size!17506 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35701)

(assert (=> b!569562 (and (= lt!259630 (Found!5591 j!142)) (or (undefined!6403 lt!259629) (not (is-Intermediate!5591 lt!259629)) (= (select (arr!17142 a!3118) (index!24593 lt!259629)) (select (arr!17142 a!3118) j!142)) (not (= (select (arr!17142 a!3118) (index!24593 lt!259629)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259630 (MissingZero!5591 (index!24593 lt!259629)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35701 (_ BitVec 32)) SeekEntryResult!5591)

(assert (=> b!569562 (= lt!259630 (seekEntryOrOpen!0 (select (arr!17142 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35701 (_ BitVec 32)) Bool)

(assert (=> b!569562 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17884 0))(
  ( (Unit!17885) )
))
(declare-fun lt!259628 () Unit!17884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17884)

(assert (=> b!569562 (= lt!259628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569563 () Bool)

(declare-fun e!327635 () Bool)

(declare-fun e!327636 () Bool)

(assert (=> b!569563 (= e!327635 e!327636)))

(declare-fun res!359585 () Bool)

(assert (=> b!569563 (=> (not res!359585) (not e!327636))))

(declare-fun lt!259626 () SeekEntryResult!5591)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569563 (= res!359585 (or (= lt!259626 (MissingZero!5591 i!1132)) (= lt!259626 (MissingVacant!5591 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!569563 (= lt!259626 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569564 () Bool)

(declare-fun res!359581 () Bool)

(assert (=> b!569564 (=> (not res!359581) (not e!327635))))

(assert (=> b!569564 (= res!359581 (and (= (size!17506 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17506 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17506 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359580 () Bool)

(assert (=> start!52178 (=> (not res!359580) (not e!327635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52178 (= res!359580 (validMask!0 mask!3119))))

(assert (=> start!52178 e!327635))

(assert (=> start!52178 true))

(declare-fun array_inv!12938 (array!35701) Bool)

(assert (=> start!52178 (array_inv!12938 a!3118)))

(declare-fun b!569565 () Bool)

(declare-fun res!359587 () Bool)

(assert (=> b!569565 (=> (not res!359587) (not e!327635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569565 (= res!359587 (validKeyInArray!0 k!1914))))

(declare-fun b!569566 () Bool)

(declare-fun res!359582 () Bool)

(assert (=> b!569566 (=> (not res!359582) (not e!327636))))

(declare-datatypes ((List!11222 0))(
  ( (Nil!11219) (Cons!11218 (h!12239 (_ BitVec 64)) (t!17450 List!11222)) )
))
(declare-fun arrayNoDuplicates!0 (array!35701 (_ BitVec 32) List!11222) Bool)

(assert (=> b!569566 (= res!359582 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11219))))

(declare-fun b!569567 () Bool)

(assert (=> b!569567 (= e!327636 e!327634)))

(declare-fun res!359584 () Bool)

(assert (=> b!569567 (=> (not res!359584) (not e!327634))))

(declare-fun lt!259625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35701 (_ BitVec 32)) SeekEntryResult!5591)

(assert (=> b!569567 (= res!359584 (= lt!259629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259625 (select (store (arr!17142 a!3118) i!1132 k!1914) j!142) (array!35702 (store (arr!17142 a!3118) i!1132 k!1914) (size!17506 a!3118)) mask!3119)))))

(declare-fun lt!259627 () (_ BitVec 32))

(assert (=> b!569567 (= lt!259629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259627 (select (arr!17142 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569567 (= lt!259625 (toIndex!0 (select (store (arr!17142 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569567 (= lt!259627 (toIndex!0 (select (arr!17142 a!3118) j!142) mask!3119))))

(declare-fun b!569568 () Bool)

(declare-fun res!359583 () Bool)

(assert (=> b!569568 (=> (not res!359583) (not e!327635))))

(assert (=> b!569568 (= res!359583 (validKeyInArray!0 (select (arr!17142 a!3118) j!142)))))

(declare-fun b!569569 () Bool)

(declare-fun res!359588 () Bool)

(assert (=> b!569569 (=> (not res!359588) (not e!327635))))

(declare-fun arrayContainsKey!0 (array!35701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569569 (= res!359588 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569570 () Bool)

(declare-fun res!359586 () Bool)

(assert (=> b!569570 (=> (not res!359586) (not e!327636))))

(assert (=> b!569570 (= res!359586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52178 res!359580) b!569564))

(assert (= (and b!569564 res!359581) b!569568))

(assert (= (and b!569568 res!359583) b!569565))

(assert (= (and b!569565 res!359587) b!569569))

(assert (= (and b!569569 res!359588) b!569563))

(assert (= (and b!569563 res!359585) b!569570))

(assert (= (and b!569570 res!359586) b!569566))

(assert (= (and b!569566 res!359582) b!569567))

(assert (= (and b!569567 res!359584) b!569562))

(declare-fun m!548343 () Bool)

(assert (=> start!52178 m!548343))

(declare-fun m!548345 () Bool)

(assert (=> start!52178 m!548345))

(declare-fun m!548347 () Bool)

(assert (=> b!569570 m!548347))

(declare-fun m!548349 () Bool)

(assert (=> b!569565 m!548349))

(declare-fun m!548351 () Bool)

(assert (=> b!569569 m!548351))

(declare-fun m!548353 () Bool)

(assert (=> b!569562 m!548353))

(declare-fun m!548355 () Bool)

(assert (=> b!569562 m!548355))

(declare-fun m!548357 () Bool)

(assert (=> b!569562 m!548357))

(declare-fun m!548359 () Bool)

(assert (=> b!569562 m!548359))

(assert (=> b!569562 m!548353))

(declare-fun m!548361 () Bool)

(assert (=> b!569562 m!548361))

(declare-fun m!548363 () Bool)

(assert (=> b!569563 m!548363))

(assert (=> b!569568 m!548353))

(assert (=> b!569568 m!548353))

(declare-fun m!548365 () Bool)

(assert (=> b!569568 m!548365))

(declare-fun m!548367 () Bool)

(assert (=> b!569566 m!548367))

(assert (=> b!569567 m!548353))

(declare-fun m!548369 () Bool)

(assert (=> b!569567 m!548369))

(assert (=> b!569567 m!548353))

(declare-fun m!548371 () Bool)

(assert (=> b!569567 m!548371))

(assert (=> b!569567 m!548371))

(declare-fun m!548373 () Bool)

(assert (=> b!569567 m!548373))

(assert (=> b!569567 m!548371))

(declare-fun m!548375 () Bool)

(assert (=> b!569567 m!548375))

(declare-fun m!548377 () Bool)

(assert (=> b!569567 m!548377))

(assert (=> b!569567 m!548353))

(declare-fun m!548379 () Bool)

(assert (=> b!569567 m!548379))

(push 1)

