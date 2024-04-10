; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52788 () Bool)

(assert start!52788)

(declare-fun b!575661 () Bool)

(declare-fun e!331231 () Bool)

(declare-fun e!331229 () Bool)

(assert (=> b!575661 (= e!331231 (not e!331229))))

(declare-fun res!364080 () Bool)

(assert (=> b!575661 (=> res!364080 e!331229)))

(declare-datatypes ((SeekEntryResult!5698 0))(
  ( (MissingZero!5698 (index!25019 (_ BitVec 32))) (Found!5698 (index!25020 (_ BitVec 32))) (Intermediate!5698 (undefined!6510 Bool) (index!25021 (_ BitVec 32)) (x!53907 (_ BitVec 32))) (Undefined!5698) (MissingVacant!5698 (index!25022 (_ BitVec 32))) )
))
(declare-fun lt!263284 () SeekEntryResult!5698)

(assert (=> b!575661 (= res!364080 (or (undefined!6510 lt!263284) (not (is-Intermediate!5698 lt!263284))))))

(declare-fun lt!263287 () SeekEntryResult!5698)

(declare-fun lt!263283 () SeekEntryResult!5698)

(assert (=> b!575661 (= lt!263287 lt!263283)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575661 (= lt!263283 (Found!5698 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35933 0))(
  ( (array!35934 (arr!17249 (Array (_ BitVec 32) (_ BitVec 64))) (size!17613 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35933)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35933 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!575661 (= lt!263287 (seekEntryOrOpen!0 (select (arr!17249 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35933 (_ BitVec 32)) Bool)

(assert (=> b!575661 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18098 0))(
  ( (Unit!18099) )
))
(declare-fun lt!263286 () Unit!18098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18098)

(assert (=> b!575661 (= lt!263286 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575662 () Bool)

(declare-fun res!364087 () Bool)

(declare-fun e!331228 () Bool)

(assert (=> b!575662 (=> (not res!364087) (not e!331228))))

(declare-datatypes ((List!11329 0))(
  ( (Nil!11326) (Cons!11325 (h!12364 (_ BitVec 64)) (t!17557 List!11329)) )
))
(declare-fun arrayNoDuplicates!0 (array!35933 (_ BitVec 32) List!11329) Bool)

(assert (=> b!575662 (= res!364087 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11326))))

(declare-fun b!575663 () Bool)

(declare-fun e!331227 () Bool)

(assert (=> b!575663 (= e!331227 true)))

(declare-fun lt!263285 () SeekEntryResult!5698)

(declare-fun lt!263291 () SeekEntryResult!5698)

(assert (=> b!575663 (= lt!263285 lt!263291)))

(declare-fun lt!263290 () Unit!18098)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35933 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18098)

(assert (=> b!575663 (= lt!263290 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53907 lt!263284) (index!25021 lt!263284) (index!25021 lt!263284) mask!3119))))

(declare-fun b!575664 () Bool)

(assert (=> b!575664 (= e!331228 e!331231)))

(declare-fun res!364079 () Bool)

(assert (=> b!575664 (=> (not res!364079) (not e!331231))))

(declare-fun lt!263293 () array!35933)

(declare-fun lt!263288 () (_ BitVec 64))

(declare-fun lt!263294 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35933 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!575664 (= res!364079 (= lt!263284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263294 lt!263288 lt!263293 mask!3119)))))

(declare-fun lt!263289 () (_ BitVec 32))

(assert (=> b!575664 (= lt!263284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263289 (select (arr!17249 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575664 (= lt!263294 (toIndex!0 lt!263288 mask!3119))))

(assert (=> b!575664 (= lt!263288 (select (store (arr!17249 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575664 (= lt!263289 (toIndex!0 (select (arr!17249 a!3118) j!142) mask!3119))))

(assert (=> b!575664 (= lt!263293 (array!35934 (store (arr!17249 a!3118) i!1132 k!1914) (size!17613 a!3118)))))

(declare-fun b!575665 () Bool)

(declare-fun res!364083 () Bool)

(declare-fun e!331233 () Bool)

(assert (=> b!575665 (=> (not res!364083) (not e!331233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575665 (= res!364083 (validKeyInArray!0 k!1914))))

(declare-fun b!575666 () Bool)

(declare-fun res!364084 () Bool)

(assert (=> b!575666 (=> (not res!364084) (not e!331233))))

(declare-fun arrayContainsKey!0 (array!35933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575666 (= res!364084 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575667 () Bool)

(declare-fun res!364086 () Bool)

(assert (=> b!575667 (=> (not res!364086) (not e!331228))))

(assert (=> b!575667 (= res!364086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575668 () Bool)

(declare-fun res!364077 () Bool)

(assert (=> b!575668 (=> (not res!364077) (not e!331233))))

(assert (=> b!575668 (= res!364077 (and (= (size!17613 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17613 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17613 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!364085 () Bool)

(assert (=> start!52788 (=> (not res!364085) (not e!331233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52788 (= res!364085 (validMask!0 mask!3119))))

(assert (=> start!52788 e!331233))

(assert (=> start!52788 true))

(declare-fun array_inv!13045 (array!35933) Bool)

(assert (=> start!52788 (array_inv!13045 a!3118)))

(declare-fun b!575669 () Bool)

(declare-fun e!331230 () Bool)

(assert (=> b!575669 (= e!331229 e!331230)))

(declare-fun res!364088 () Bool)

(assert (=> b!575669 (=> res!364088 e!331230)))

(declare-fun lt!263296 () (_ BitVec 64))

(assert (=> b!575669 (= res!364088 (or (= lt!263296 (select (arr!17249 a!3118) j!142)) (= lt!263296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575669 (= lt!263296 (select (arr!17249 a!3118) (index!25021 lt!263284)))))

(declare-fun b!575670 () Bool)

(assert (=> b!575670 (= e!331230 e!331227)))

(declare-fun res!364082 () Bool)

(assert (=> b!575670 (=> res!364082 e!331227)))

(assert (=> b!575670 (= res!364082 (or (bvslt (index!25021 lt!263284) #b00000000000000000000000000000000) (bvsge (index!25021 lt!263284) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53907 lt!263284) #b01111111111111111111111111111110) (bvslt (x!53907 lt!263284) #b00000000000000000000000000000000) (not (= lt!263296 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17249 a!3118) i!1132 k!1914) (index!25021 lt!263284)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263285 lt!263283))))))

(declare-fun lt!263295 () SeekEntryResult!5698)

(assert (=> b!575670 (= lt!263295 lt!263291)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35933 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!575670 (= lt!263291 (seekKeyOrZeroReturnVacant!0 (x!53907 lt!263284) (index!25021 lt!263284) (index!25021 lt!263284) lt!263288 lt!263293 mask!3119))))

(assert (=> b!575670 (= lt!263295 (seekEntryOrOpen!0 lt!263288 lt!263293 mask!3119))))

(assert (=> b!575670 (= lt!263287 lt!263285)))

(assert (=> b!575670 (= lt!263285 (seekKeyOrZeroReturnVacant!0 (x!53907 lt!263284) (index!25021 lt!263284) (index!25021 lt!263284) (select (arr!17249 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575671 () Bool)

(declare-fun res!364078 () Bool)

(assert (=> b!575671 (=> (not res!364078) (not e!331233))))

(assert (=> b!575671 (= res!364078 (validKeyInArray!0 (select (arr!17249 a!3118) j!142)))))

(declare-fun b!575672 () Bool)

(assert (=> b!575672 (= e!331233 e!331228)))

(declare-fun res!364081 () Bool)

(assert (=> b!575672 (=> (not res!364081) (not e!331228))))

(declare-fun lt!263292 () SeekEntryResult!5698)

(assert (=> b!575672 (= res!364081 (or (= lt!263292 (MissingZero!5698 i!1132)) (= lt!263292 (MissingVacant!5698 i!1132))))))

(assert (=> b!575672 (= lt!263292 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52788 res!364085) b!575668))

(assert (= (and b!575668 res!364077) b!575671))

(assert (= (and b!575671 res!364078) b!575665))

(assert (= (and b!575665 res!364083) b!575666))

(assert (= (and b!575666 res!364084) b!575672))

(assert (= (and b!575672 res!364081) b!575667))

(assert (= (and b!575667 res!364086) b!575662))

(assert (= (and b!575662 res!364087) b!575664))

(assert (= (and b!575664 res!364079) b!575661))

(assert (= (and b!575661 (not res!364080)) b!575669))

(assert (= (and b!575669 (not res!364088)) b!575670))

(assert (= (and b!575670 (not res!364082)) b!575663))

(declare-fun m!554589 () Bool)

(assert (=> b!575667 m!554589))

(declare-fun m!554591 () Bool)

(assert (=> b!575665 m!554591))

(declare-fun m!554593 () Bool)

(assert (=> b!575664 m!554593))

(declare-fun m!554595 () Bool)

(assert (=> b!575664 m!554595))

(assert (=> b!575664 m!554593))

(declare-fun m!554597 () Bool)

(assert (=> b!575664 m!554597))

(declare-fun m!554599 () Bool)

(assert (=> b!575664 m!554599))

(declare-fun m!554601 () Bool)

(assert (=> b!575664 m!554601))

(declare-fun m!554603 () Bool)

(assert (=> b!575664 m!554603))

(assert (=> b!575664 m!554593))

(declare-fun m!554605 () Bool)

(assert (=> b!575664 m!554605))

(assert (=> b!575671 m!554593))

(assert (=> b!575671 m!554593))

(declare-fun m!554607 () Bool)

(assert (=> b!575671 m!554607))

(declare-fun m!554609 () Bool)

(assert (=> start!52788 m!554609))

(declare-fun m!554611 () Bool)

(assert (=> start!52788 m!554611))

(assert (=> b!575669 m!554593))

(declare-fun m!554613 () Bool)

(assert (=> b!575669 m!554613))

(assert (=> b!575670 m!554593))

(declare-fun m!554615 () Bool)

(assert (=> b!575670 m!554615))

(assert (=> b!575670 m!554593))

(declare-fun m!554617 () Bool)

(assert (=> b!575670 m!554617))

(declare-fun m!554619 () Bool)

(assert (=> b!575670 m!554619))

(declare-fun m!554621 () Bool)

(assert (=> b!575670 m!554621))

(assert (=> b!575670 m!554603))

(declare-fun m!554623 () Bool)

(assert (=> b!575662 m!554623))

(declare-fun m!554625 () Bool)

(assert (=> b!575666 m!554625))

(declare-fun m!554627 () Bool)

(assert (=> b!575672 m!554627))

(declare-fun m!554629 () Bool)

(assert (=> b!575663 m!554629))

(assert (=> b!575661 m!554593))

(assert (=> b!575661 m!554593))

(declare-fun m!554631 () Bool)

(assert (=> b!575661 m!554631))

(declare-fun m!554633 () Bool)

(assert (=> b!575661 m!554633))

(declare-fun m!554635 () Bool)

(assert (=> b!575661 m!554635))

(push 1)

