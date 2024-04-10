; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50742 () Bool)

(assert start!50742)

(declare-fun b!555009 () Bool)

(declare-fun res!347425 () Bool)

(declare-fun e!319946 () Bool)

(assert (=> b!555009 (=> (not res!347425) (not e!319946))))

(declare-datatypes ((array!34967 0))(
  ( (array!34968 (arr!16793 (Array (_ BitVec 32) (_ BitVec 64))) (size!17157 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34967)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34967 (_ BitVec 32)) Bool)

(assert (=> b!555009 (= res!347425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555010 () Bool)

(declare-fun res!347423 () Bool)

(declare-fun e!319944 () Bool)

(assert (=> b!555010 (=> (not res!347423) (not e!319944))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555010 (= res!347423 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555011 () Bool)

(declare-fun res!347424 () Bool)

(assert (=> b!555011 (=> (not res!347424) (not e!319944))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555011 (= res!347424 (and (= (size!17157 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17157 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17157 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347421 () Bool)

(assert (=> start!50742 (=> (not res!347421) (not e!319944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50742 (= res!347421 (validMask!0 mask!3119))))

(assert (=> start!50742 e!319944))

(assert (=> start!50742 true))

(declare-fun array_inv!12589 (array!34967) Bool)

(assert (=> start!50742 (array_inv!12589 a!3118)))

(declare-fun b!555012 () Bool)

(declare-fun res!347428 () Bool)

(assert (=> b!555012 (=> (not res!347428) (not e!319946))))

(declare-datatypes ((List!10873 0))(
  ( (Nil!10870) (Cons!10869 (h!11854 (_ BitVec 64)) (t!17101 List!10873)) )
))
(declare-fun arrayNoDuplicates!0 (array!34967 (_ BitVec 32) List!10873) Bool)

(assert (=> b!555012 (= res!347428 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10870))))

(declare-fun b!555013 () Bool)

(declare-fun res!347422 () Bool)

(assert (=> b!555013 (=> (not res!347422) (not e!319944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555013 (= res!347422 (validKeyInArray!0 (select (arr!16793 a!3118) j!142)))))

(declare-fun b!555014 () Bool)

(declare-fun res!347426 () Bool)

(assert (=> b!555014 (=> (not res!347426) (not e!319944))))

(assert (=> b!555014 (= res!347426 (validKeyInArray!0 k!1914))))

(declare-fun b!555015 () Bool)

(declare-fun e!319947 () Bool)

(assert (=> b!555015 (= e!319947 (not true))))

(declare-datatypes ((SeekEntryResult!5242 0))(
  ( (MissingZero!5242 (index!23195 (_ BitVec 32))) (Found!5242 (index!23196 (_ BitVec 32))) (Intermediate!5242 (undefined!6054 Bool) (index!23197 (_ BitVec 32)) (x!52100 (_ BitVec 32))) (Undefined!5242) (MissingVacant!5242 (index!23198 (_ BitVec 32))) )
))
(declare-fun lt!252128 () SeekEntryResult!5242)

(declare-fun lt!252130 () SeekEntryResult!5242)

(assert (=> b!555015 (and (= lt!252128 (Found!5242 j!142)) (or (undefined!6054 lt!252130) (not (is-Intermediate!5242 lt!252130)) (= (select (arr!16793 a!3118) (index!23197 lt!252130)) (select (arr!16793 a!3118) j!142)) (not (= (select (arr!16793 a!3118) (index!23197 lt!252130)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252128 (MissingZero!5242 (index!23197 lt!252130)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34967 (_ BitVec 32)) SeekEntryResult!5242)

(assert (=> b!555015 (= lt!252128 (seekEntryOrOpen!0 (select (arr!16793 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555015 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17258 0))(
  ( (Unit!17259) )
))
(declare-fun lt!252133 () Unit!17258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17258)

(assert (=> b!555015 (= lt!252133 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555016 () Bool)

(assert (=> b!555016 (= e!319944 e!319946)))

(declare-fun res!347429 () Bool)

(assert (=> b!555016 (=> (not res!347429) (not e!319946))))

(declare-fun lt!252132 () SeekEntryResult!5242)

(assert (=> b!555016 (= res!347429 (or (= lt!252132 (MissingZero!5242 i!1132)) (= lt!252132 (MissingVacant!5242 i!1132))))))

(assert (=> b!555016 (= lt!252132 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555017 () Bool)

(assert (=> b!555017 (= e!319946 e!319947)))

(declare-fun res!347427 () Bool)

(assert (=> b!555017 (=> (not res!347427) (not e!319947))))

(declare-fun lt!252129 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34967 (_ BitVec 32)) SeekEntryResult!5242)

(assert (=> b!555017 (= res!347427 (= lt!252130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252129 (select (store (arr!16793 a!3118) i!1132 k!1914) j!142) (array!34968 (store (arr!16793 a!3118) i!1132 k!1914) (size!17157 a!3118)) mask!3119)))))

(declare-fun lt!252131 () (_ BitVec 32))

(assert (=> b!555017 (= lt!252130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252131 (select (arr!16793 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555017 (= lt!252129 (toIndex!0 (select (store (arr!16793 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555017 (= lt!252131 (toIndex!0 (select (arr!16793 a!3118) j!142) mask!3119))))

(assert (= (and start!50742 res!347421) b!555011))

(assert (= (and b!555011 res!347424) b!555013))

(assert (= (and b!555013 res!347422) b!555014))

(assert (= (and b!555014 res!347426) b!555010))

(assert (= (and b!555010 res!347423) b!555016))

(assert (= (and b!555016 res!347429) b!555009))

(assert (= (and b!555009 res!347425) b!555012))

(assert (= (and b!555012 res!347428) b!555017))

(assert (= (and b!555017 res!347427) b!555015))

(declare-fun m!532519 () Bool)

(assert (=> start!50742 m!532519))

(declare-fun m!532521 () Bool)

(assert (=> start!50742 m!532521))

(declare-fun m!532523 () Bool)

(assert (=> b!555014 m!532523))

(declare-fun m!532525 () Bool)

(assert (=> b!555015 m!532525))

(declare-fun m!532527 () Bool)

(assert (=> b!555015 m!532527))

(declare-fun m!532529 () Bool)

(assert (=> b!555015 m!532529))

(declare-fun m!532531 () Bool)

(assert (=> b!555015 m!532531))

(declare-fun m!532533 () Bool)

(assert (=> b!555015 m!532533))

(assert (=> b!555015 m!532529))

(declare-fun m!532535 () Bool)

(assert (=> b!555009 m!532535))

(assert (=> b!555017 m!532529))

(declare-fun m!532537 () Bool)

(assert (=> b!555017 m!532537))

(assert (=> b!555017 m!532529))

(declare-fun m!532539 () Bool)

(assert (=> b!555017 m!532539))

(assert (=> b!555017 m!532529))

(declare-fun m!532541 () Bool)

(assert (=> b!555017 m!532541))

(declare-fun m!532543 () Bool)

(assert (=> b!555017 m!532543))

(assert (=> b!555017 m!532539))

(declare-fun m!532545 () Bool)

(assert (=> b!555017 m!532545))

(assert (=> b!555017 m!532539))

(declare-fun m!532547 () Bool)

(assert (=> b!555017 m!532547))

(assert (=> b!555013 m!532529))

(assert (=> b!555013 m!532529))

(declare-fun m!532549 () Bool)

(assert (=> b!555013 m!532549))

(declare-fun m!532551 () Bool)

(assert (=> b!555016 m!532551))

(declare-fun m!532553 () Bool)

(assert (=> b!555010 m!532553))

(declare-fun m!532555 () Bool)

(assert (=> b!555012 m!532555))

(push 1)

