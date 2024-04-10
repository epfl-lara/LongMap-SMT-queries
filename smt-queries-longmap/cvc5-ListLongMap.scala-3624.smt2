; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49982 () Bool)

(assert start!49982)

(declare-fun b!548029 () Bool)

(declare-fun e!316656 () Bool)

(declare-fun e!316654 () Bool)

(assert (=> b!548029 (= e!316656 e!316654)))

(declare-fun res!341443 () Bool)

(assert (=> b!548029 (=> (not res!341443) (not e!316654))))

(declare-datatypes ((SeekEntryResult!5051 0))(
  ( (MissingZero!5051 (index!22431 (_ BitVec 32))) (Found!5051 (index!22432 (_ BitVec 32))) (Intermediate!5051 (undefined!5863 Bool) (index!22433 (_ BitVec 32)) (x!51375 (_ BitVec 32))) (Undefined!5051) (MissingVacant!5051 (index!22434 (_ BitVec 32))) )
))
(declare-fun lt!249706 () SeekEntryResult!5051)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548029 (= res!341443 (or (= lt!249706 (MissingZero!5051 i!1132)) (= lt!249706 (MissingVacant!5051 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34564 0))(
  ( (array!34565 (arr!16602 (Array (_ BitVec 32) (_ BitVec 64))) (size!16966 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34564)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34564 (_ BitVec 32)) SeekEntryResult!5051)

(assert (=> b!548029 (= lt!249706 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548030 () Bool)

(declare-fun res!341437 () Bool)

(assert (=> b!548030 (=> (not res!341437) (not e!316656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548030 (= res!341437 (validKeyInArray!0 k!1914))))

(declare-fun b!548031 () Bool)

(assert (=> b!548031 (= e!316654 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!249705 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548031 (= lt!249705 (toIndex!0 (select (arr!16602 a!3118) j!142) mask!3119))))

(declare-fun b!548032 () Bool)

(declare-fun res!341442 () Bool)

(assert (=> b!548032 (=> (not res!341442) (not e!316656))))

(assert (=> b!548032 (= res!341442 (validKeyInArray!0 (select (arr!16602 a!3118) j!142)))))

(declare-fun res!341444 () Bool)

(assert (=> start!49982 (=> (not res!341444) (not e!316656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49982 (= res!341444 (validMask!0 mask!3119))))

(assert (=> start!49982 e!316656))

(assert (=> start!49982 true))

(declare-fun array_inv!12398 (array!34564) Bool)

(assert (=> start!49982 (array_inv!12398 a!3118)))

(declare-fun b!548033 () Bool)

(declare-fun res!341440 () Bool)

(assert (=> b!548033 (=> (not res!341440) (not e!316656))))

(assert (=> b!548033 (= res!341440 (and (= (size!16966 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16966 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16966 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548034 () Bool)

(declare-fun res!341441 () Bool)

(assert (=> b!548034 (=> (not res!341441) (not e!316654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34564 (_ BitVec 32)) Bool)

(assert (=> b!548034 (= res!341441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548035 () Bool)

(declare-fun res!341438 () Bool)

(assert (=> b!548035 (=> (not res!341438) (not e!316654))))

(declare-datatypes ((List!10682 0))(
  ( (Nil!10679) (Cons!10678 (h!11645 (_ BitVec 64)) (t!16910 List!10682)) )
))
(declare-fun arrayNoDuplicates!0 (array!34564 (_ BitVec 32) List!10682) Bool)

(assert (=> b!548035 (= res!341438 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10679))))

(declare-fun b!548036 () Bool)

(declare-fun res!341439 () Bool)

(assert (=> b!548036 (=> (not res!341439) (not e!316656))))

(declare-fun arrayContainsKey!0 (array!34564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548036 (= res!341439 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49982 res!341444) b!548033))

(assert (= (and b!548033 res!341440) b!548032))

(assert (= (and b!548032 res!341442) b!548030))

(assert (= (and b!548030 res!341437) b!548036))

(assert (= (and b!548036 res!341439) b!548029))

(assert (= (and b!548029 res!341443) b!548034))

(assert (= (and b!548034 res!341441) b!548035))

(assert (= (and b!548035 res!341438) b!548031))

(declare-fun m!525147 () Bool)

(assert (=> b!548032 m!525147))

(assert (=> b!548032 m!525147))

(declare-fun m!525149 () Bool)

(assert (=> b!548032 m!525149))

(declare-fun m!525151 () Bool)

(assert (=> start!49982 m!525151))

(declare-fun m!525153 () Bool)

(assert (=> start!49982 m!525153))

(declare-fun m!525155 () Bool)

(assert (=> b!548030 m!525155))

(declare-fun m!525157 () Bool)

(assert (=> b!548029 m!525157))

(declare-fun m!525159 () Bool)

(assert (=> b!548035 m!525159))

(declare-fun m!525161 () Bool)

(assert (=> b!548036 m!525161))

(assert (=> b!548031 m!525147))

(assert (=> b!548031 m!525147))

(declare-fun m!525163 () Bool)

(assert (=> b!548031 m!525163))

(declare-fun m!525165 () Bool)

(assert (=> b!548034 m!525165))

(push 1)

