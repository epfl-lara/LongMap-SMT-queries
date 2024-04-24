; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50814 () Bool)

(assert start!50814)

(declare-fun b!555560 () Bool)

(declare-fun res!347870 () Bool)

(declare-fun e!320231 () Bool)

(assert (=> b!555560 (=> (not res!347870) (not e!320231))))

(declare-datatypes ((array!34986 0))(
  ( (array!34987 (arr!16801 (Array (_ BitVec 32) (_ BitVec 64))) (size!17165 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34986)

(declare-datatypes ((List!10788 0))(
  ( (Nil!10785) (Cons!10784 (h!11772 (_ BitVec 64)) (t!17008 List!10788)) )
))
(declare-fun arrayNoDuplicates!0 (array!34986 (_ BitVec 32) List!10788) Bool)

(assert (=> b!555560 (= res!347870 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10785))))

(declare-fun b!555561 () Bool)

(declare-fun res!347867 () Bool)

(declare-fun e!320229 () Bool)

(assert (=> b!555561 (=> (not res!347867) (not e!320229))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555561 (= res!347867 (validKeyInArray!0 k0!1914))))

(declare-fun b!555562 () Bool)

(declare-fun e!320232 () Bool)

(assert (=> b!555562 (= e!320231 e!320232)))

(declare-fun res!347874 () Bool)

(assert (=> b!555562 (=> (not res!347874) (not e!320232))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252477 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5206 0))(
  ( (MissingZero!5206 (index!23051 (_ BitVec 32))) (Found!5206 (index!23052 (_ BitVec 32))) (Intermediate!5206 (undefined!6018 Bool) (index!23053 (_ BitVec 32)) (x!52107 (_ BitVec 32))) (Undefined!5206) (MissingVacant!5206 (index!23054 (_ BitVec 32))) )
))
(declare-fun lt!252478 () SeekEntryResult!5206)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34986 (_ BitVec 32)) SeekEntryResult!5206)

(assert (=> b!555562 (= res!347874 (= lt!252478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252477 (select (store (arr!16801 a!3118) i!1132 k0!1914) j!142) (array!34987 (store (arr!16801 a!3118) i!1132 k0!1914) (size!17165 a!3118)) mask!3119)))))

(declare-fun lt!252475 () (_ BitVec 32))

(assert (=> b!555562 (= lt!252478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252475 (select (arr!16801 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555562 (= lt!252477 (toIndex!0 (select (store (arr!16801 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555562 (= lt!252475 (toIndex!0 (select (arr!16801 a!3118) j!142) mask!3119))))

(declare-fun b!555563 () Bool)

(assert (=> b!555563 (= e!320232 (not true))))

(declare-fun lt!252474 () SeekEntryResult!5206)

(get-info :version)

(assert (=> b!555563 (and (= lt!252474 (Found!5206 j!142)) (or (undefined!6018 lt!252478) (not ((_ is Intermediate!5206) lt!252478)) (= (select (arr!16801 a!3118) (index!23053 lt!252478)) (select (arr!16801 a!3118) j!142)) (not (= (select (arr!16801 a!3118) (index!23053 lt!252478)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252474 (MissingZero!5206 (index!23053 lt!252478)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34986 (_ BitVec 32)) SeekEntryResult!5206)

(assert (=> b!555563 (= lt!252474 (seekEntryOrOpen!0 (select (arr!16801 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34986 (_ BitVec 32)) Bool)

(assert (=> b!555563 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17257 0))(
  ( (Unit!17258) )
))
(declare-fun lt!252473 () Unit!17257)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17257)

(assert (=> b!555563 (= lt!252473 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555564 () Bool)

(declare-fun res!347875 () Bool)

(assert (=> b!555564 (=> (not res!347875) (not e!320229))))

(declare-fun arrayContainsKey!0 (array!34986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555564 (= res!347875 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555565 () Bool)

(assert (=> b!555565 (= e!320229 e!320231)))

(declare-fun res!347872 () Bool)

(assert (=> b!555565 (=> (not res!347872) (not e!320231))))

(declare-fun lt!252476 () SeekEntryResult!5206)

(assert (=> b!555565 (= res!347872 (or (= lt!252476 (MissingZero!5206 i!1132)) (= lt!252476 (MissingVacant!5206 i!1132))))))

(assert (=> b!555565 (= lt!252476 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555566 () Bool)

(declare-fun res!347873 () Bool)

(assert (=> b!555566 (=> (not res!347873) (not e!320231))))

(assert (=> b!555566 (= res!347873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555567 () Bool)

(declare-fun res!347869 () Bool)

(assert (=> b!555567 (=> (not res!347869) (not e!320229))))

(assert (=> b!555567 (= res!347869 (validKeyInArray!0 (select (arr!16801 a!3118) j!142)))))

(declare-fun b!555568 () Bool)

(declare-fun res!347868 () Bool)

(assert (=> b!555568 (=> (not res!347868) (not e!320229))))

(assert (=> b!555568 (= res!347868 (and (= (size!17165 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17165 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17165 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347871 () Bool)

(assert (=> start!50814 (=> (not res!347871) (not e!320229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50814 (= res!347871 (validMask!0 mask!3119))))

(assert (=> start!50814 e!320229))

(assert (=> start!50814 true))

(declare-fun array_inv!12660 (array!34986) Bool)

(assert (=> start!50814 (array_inv!12660 a!3118)))

(assert (= (and start!50814 res!347871) b!555568))

(assert (= (and b!555568 res!347868) b!555567))

(assert (= (and b!555567 res!347869) b!555561))

(assert (= (and b!555561 res!347867) b!555564))

(assert (= (and b!555564 res!347875) b!555565))

(assert (= (and b!555565 res!347872) b!555566))

(assert (= (and b!555566 res!347873) b!555560))

(assert (= (and b!555560 res!347870) b!555562))

(assert (= (and b!555562 res!347874) b!555563))

(declare-fun m!533351 () Bool)

(assert (=> b!555563 m!533351))

(declare-fun m!533353 () Bool)

(assert (=> b!555563 m!533353))

(declare-fun m!533355 () Bool)

(assert (=> b!555563 m!533355))

(declare-fun m!533357 () Bool)

(assert (=> b!555563 m!533357))

(assert (=> b!555563 m!533351))

(declare-fun m!533359 () Bool)

(assert (=> b!555563 m!533359))

(declare-fun m!533361 () Bool)

(assert (=> b!555564 m!533361))

(assert (=> b!555562 m!533351))

(declare-fun m!533363 () Bool)

(assert (=> b!555562 m!533363))

(assert (=> b!555562 m!533351))

(declare-fun m!533365 () Bool)

(assert (=> b!555562 m!533365))

(assert (=> b!555562 m!533365))

(declare-fun m!533367 () Bool)

(assert (=> b!555562 m!533367))

(declare-fun m!533369 () Bool)

(assert (=> b!555562 m!533369))

(assert (=> b!555562 m!533351))

(declare-fun m!533371 () Bool)

(assert (=> b!555562 m!533371))

(assert (=> b!555562 m!533365))

(declare-fun m!533373 () Bool)

(assert (=> b!555562 m!533373))

(assert (=> b!555567 m!533351))

(assert (=> b!555567 m!533351))

(declare-fun m!533375 () Bool)

(assert (=> b!555567 m!533375))

(declare-fun m!533377 () Bool)

(assert (=> b!555561 m!533377))

(declare-fun m!533379 () Bool)

(assert (=> b!555560 m!533379))

(declare-fun m!533381 () Bool)

(assert (=> start!50814 m!533381))

(declare-fun m!533383 () Bool)

(assert (=> start!50814 m!533383))

(declare-fun m!533385 () Bool)

(assert (=> b!555566 m!533385))

(declare-fun m!533387 () Bool)

(assert (=> b!555565 m!533387))

(check-sat (not b!555564) (not b!555561) (not start!50814) (not b!555566) (not b!555563) (not b!555560) (not b!555562) (not b!555567) (not b!555565))
(check-sat)
