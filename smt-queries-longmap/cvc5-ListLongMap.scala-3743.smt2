; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51452 () Bool)

(assert start!51452)

(declare-fun b!562494 () Bool)

(declare-fun e!324165 () Bool)

(declare-fun e!324171 () Bool)

(assert (=> b!562494 (= e!324165 e!324171)))

(declare-fun res!353646 () Bool)

(assert (=> b!562494 (=> (not res!353646) (not e!324171))))

(declare-datatypes ((SeekEntryResult!5408 0))(
  ( (MissingZero!5408 (index!23859 (_ BitVec 32))) (Found!5408 (index!23860 (_ BitVec 32))) (Intermediate!5408 (undefined!6220 Bool) (index!23861 (_ BitVec 32)) (x!52759 (_ BitVec 32))) (Undefined!5408) (MissingVacant!5408 (index!23862 (_ BitVec 32))) )
))
(declare-fun lt!256312 () SeekEntryResult!5408)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562494 (= res!353646 (or (= lt!256312 (MissingZero!5408 i!1132)) (= lt!256312 (MissingVacant!5408 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35317 0))(
  ( (array!35318 (arr!16959 (Array (_ BitVec 32) (_ BitVec 64))) (size!17323 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35317)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35317 (_ BitVec 32)) SeekEntryResult!5408)

(assert (=> b!562494 (= lt!256312 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562495 () Bool)

(declare-fun e!324166 () Bool)

(declare-fun e!324170 () Bool)

(assert (=> b!562495 (= e!324166 e!324170)))

(declare-fun res!353652 () Bool)

(assert (=> b!562495 (=> res!353652 e!324170)))

(declare-fun lt!256313 () SeekEntryResult!5408)

(declare-fun lt!256315 () (_ BitVec 64))

(declare-fun lt!256302 () SeekEntryResult!5408)

(declare-fun lt!256314 () SeekEntryResult!5408)

(assert (=> b!562495 (= res!353652 (or (bvslt (index!23861 lt!256313) #b00000000000000000000000000000000) (bvsge (index!23861 lt!256313) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52759 lt!256313) #b01111111111111111111111111111110) (bvslt (x!52759 lt!256313) #b00000000000000000000000000000000) (not (= lt!256315 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16959 a!3118) i!1132 k!1914) (index!23861 lt!256313)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256302 lt!256314))))))

(declare-fun lt!256303 () SeekEntryResult!5408)

(declare-fun lt!256306 () SeekEntryResult!5408)

(assert (=> b!562495 (= lt!256303 lt!256306)))

(declare-fun lt!256310 () array!35317)

(declare-fun lt!256309 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35317 (_ BitVec 32)) SeekEntryResult!5408)

(assert (=> b!562495 (= lt!256306 (seekKeyOrZeroReturnVacant!0 (x!52759 lt!256313) (index!23861 lt!256313) (index!23861 lt!256313) lt!256309 lt!256310 mask!3119))))

(assert (=> b!562495 (= lt!256303 (seekEntryOrOpen!0 lt!256309 lt!256310 mask!3119))))

(declare-fun lt!256308 () SeekEntryResult!5408)

(assert (=> b!562495 (= lt!256308 lt!256302)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562495 (= lt!256302 (seekKeyOrZeroReturnVacant!0 (x!52759 lt!256313) (index!23861 lt!256313) (index!23861 lt!256313) (select (arr!16959 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562496 () Bool)

(declare-fun res!353654 () Bool)

(assert (=> b!562496 (=> (not res!353654) (not e!324165))))

(declare-fun arrayContainsKey!0 (array!35317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562496 (= res!353654 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562497 () Bool)

(declare-fun e!324167 () Bool)

(declare-fun e!324168 () Bool)

(assert (=> b!562497 (= e!324167 (not e!324168))))

(declare-fun res!353651 () Bool)

(assert (=> b!562497 (=> res!353651 e!324168)))

(assert (=> b!562497 (= res!353651 (or (undefined!6220 lt!256313) (not (is-Intermediate!5408 lt!256313))))))

(assert (=> b!562497 (= lt!256308 lt!256314)))

(assert (=> b!562497 (= lt!256314 (Found!5408 j!142))))

(assert (=> b!562497 (= lt!256308 (seekEntryOrOpen!0 (select (arr!16959 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35317 (_ BitVec 32)) Bool)

(assert (=> b!562497 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17590 0))(
  ( (Unit!17591) )
))
(declare-fun lt!256311 () Unit!17590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17590)

(assert (=> b!562497 (= lt!256311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562499 () Bool)

(declare-fun res!353656 () Bool)

(assert (=> b!562499 (=> (not res!353656) (not e!324165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562499 (= res!353656 (validKeyInArray!0 k!1914))))

(declare-fun b!562500 () Bool)

(assert (=> b!562500 (= e!324168 e!324166)))

(declare-fun res!353653 () Bool)

(assert (=> b!562500 (=> res!353653 e!324166)))

(assert (=> b!562500 (= res!353653 (or (= lt!256315 (select (arr!16959 a!3118) j!142)) (= lt!256315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562500 (= lt!256315 (select (arr!16959 a!3118) (index!23861 lt!256313)))))

(declare-fun b!562501 () Bool)

(declare-fun res!353655 () Bool)

(assert (=> b!562501 (=> (not res!353655) (not e!324171))))

(declare-datatypes ((List!11039 0))(
  ( (Nil!11036) (Cons!11035 (h!12038 (_ BitVec 64)) (t!17267 List!11039)) )
))
(declare-fun arrayNoDuplicates!0 (array!35317 (_ BitVec 32) List!11039) Bool)

(assert (=> b!562501 (= res!353655 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11036))))

(declare-fun b!562502 () Bool)

(assert (=> b!562502 (= e!324170 (bvsge mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!562502 (= lt!256302 lt!256306)))

(declare-fun lt!256304 () Unit!17590)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17590)

(assert (=> b!562502 (= lt!256304 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52759 lt!256313) (index!23861 lt!256313) (index!23861 lt!256313) mask!3119))))

(declare-fun b!562503 () Bool)

(declare-fun res!353649 () Bool)

(assert (=> b!562503 (=> (not res!353649) (not e!324165))))

(assert (=> b!562503 (= res!353649 (validKeyInArray!0 (select (arr!16959 a!3118) j!142)))))

(declare-fun b!562504 () Bool)

(declare-fun res!353657 () Bool)

(assert (=> b!562504 (=> (not res!353657) (not e!324171))))

(assert (=> b!562504 (= res!353657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562505 () Bool)

(assert (=> b!562505 (= e!324171 e!324167)))

(declare-fun res!353648 () Bool)

(assert (=> b!562505 (=> (not res!353648) (not e!324167))))

(declare-fun lt!256305 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35317 (_ BitVec 32)) SeekEntryResult!5408)

(assert (=> b!562505 (= res!353648 (= lt!256313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256305 lt!256309 lt!256310 mask!3119)))))

(declare-fun lt!256307 () (_ BitVec 32))

(assert (=> b!562505 (= lt!256313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256307 (select (arr!16959 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562505 (= lt!256305 (toIndex!0 lt!256309 mask!3119))))

(assert (=> b!562505 (= lt!256309 (select (store (arr!16959 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562505 (= lt!256307 (toIndex!0 (select (arr!16959 a!3118) j!142) mask!3119))))

(assert (=> b!562505 (= lt!256310 (array!35318 (store (arr!16959 a!3118) i!1132 k!1914) (size!17323 a!3118)))))

(declare-fun b!562498 () Bool)

(declare-fun res!353650 () Bool)

(assert (=> b!562498 (=> (not res!353650) (not e!324165))))

(assert (=> b!562498 (= res!353650 (and (= (size!17323 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17323 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17323 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!353647 () Bool)

(assert (=> start!51452 (=> (not res!353647) (not e!324165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51452 (= res!353647 (validMask!0 mask!3119))))

(assert (=> start!51452 e!324165))

(assert (=> start!51452 true))

(declare-fun array_inv!12755 (array!35317) Bool)

(assert (=> start!51452 (array_inv!12755 a!3118)))

(assert (= (and start!51452 res!353647) b!562498))

(assert (= (and b!562498 res!353650) b!562503))

(assert (= (and b!562503 res!353649) b!562499))

(assert (= (and b!562499 res!353656) b!562496))

(assert (= (and b!562496 res!353654) b!562494))

(assert (= (and b!562494 res!353646) b!562504))

(assert (= (and b!562504 res!353657) b!562501))

(assert (= (and b!562501 res!353655) b!562505))

(assert (= (and b!562505 res!353648) b!562497))

(assert (= (and b!562497 (not res!353651)) b!562500))

(assert (= (and b!562500 (not res!353653)) b!562495))

(assert (= (and b!562495 (not res!353652)) b!562502))

(declare-fun m!540549 () Bool)

(assert (=> b!562503 m!540549))

(assert (=> b!562503 m!540549))

(declare-fun m!540551 () Bool)

(assert (=> b!562503 m!540551))

(assert (=> b!562495 m!540549))

(declare-fun m!540553 () Bool)

(assert (=> b!562495 m!540553))

(declare-fun m!540555 () Bool)

(assert (=> b!562495 m!540555))

(assert (=> b!562495 m!540549))

(declare-fun m!540557 () Bool)

(assert (=> b!562495 m!540557))

(declare-fun m!540559 () Bool)

(assert (=> b!562495 m!540559))

(declare-fun m!540561 () Bool)

(assert (=> b!562495 m!540561))

(declare-fun m!540563 () Bool)

(assert (=> b!562501 m!540563))

(assert (=> b!562497 m!540549))

(assert (=> b!562497 m!540549))

(declare-fun m!540565 () Bool)

(assert (=> b!562497 m!540565))

(declare-fun m!540567 () Bool)

(assert (=> b!562497 m!540567))

(declare-fun m!540569 () Bool)

(assert (=> b!562497 m!540569))

(declare-fun m!540571 () Bool)

(assert (=> b!562496 m!540571))

(declare-fun m!540573 () Bool)

(assert (=> start!51452 m!540573))

(declare-fun m!540575 () Bool)

(assert (=> start!51452 m!540575))

(declare-fun m!540577 () Bool)

(assert (=> b!562505 m!540577))

(assert (=> b!562505 m!540549))

(declare-fun m!540579 () Bool)

(assert (=> b!562505 m!540579))

(declare-fun m!540581 () Bool)

(assert (=> b!562505 m!540581))

(assert (=> b!562505 m!540549))

(declare-fun m!540583 () Bool)

(assert (=> b!562505 m!540583))

(assert (=> b!562505 m!540561))

(assert (=> b!562505 m!540549))

(declare-fun m!540585 () Bool)

(assert (=> b!562505 m!540585))

(assert (=> b!562500 m!540549))

(declare-fun m!540587 () Bool)

(assert (=> b!562500 m!540587))

(declare-fun m!540589 () Bool)

(assert (=> b!562504 m!540589))

(declare-fun m!540591 () Bool)

(assert (=> b!562499 m!540591))

(declare-fun m!540593 () Bool)

(assert (=> b!562494 m!540593))

(declare-fun m!540595 () Bool)

(assert (=> b!562502 m!540595))

(push 1)

