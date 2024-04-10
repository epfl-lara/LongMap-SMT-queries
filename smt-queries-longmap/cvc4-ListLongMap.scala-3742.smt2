; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51450 () Bool)

(assert start!51450)

(declare-fun b!562458 () Bool)

(declare-fun e!324149 () Bool)

(assert (=> b!562458 (= e!324149 true)))

(declare-datatypes ((SeekEntryResult!5407 0))(
  ( (MissingZero!5407 (index!23855 (_ BitVec 32))) (Found!5407 (index!23856 (_ BitVec 32))) (Intermediate!5407 (undefined!6219 Bool) (index!23857 (_ BitVec 32)) (x!52750 (_ BitVec 32))) (Undefined!5407) (MissingVacant!5407 (index!23858 (_ BitVec 32))) )
))
(declare-fun lt!256265 () SeekEntryResult!5407)

(declare-fun lt!256264 () SeekEntryResult!5407)

(assert (=> b!562458 (= lt!256265 lt!256264)))

(declare-datatypes ((Unit!17588 0))(
  ( (Unit!17589) )
))
(declare-fun lt!256270 () Unit!17588)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!256267 () SeekEntryResult!5407)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35315 0))(
  ( (array!35316 (arr!16958 (Array (_ BitVec 32) (_ BitVec 64))) (size!17322 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35315)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17588)

(assert (=> b!562458 (= lt!256270 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52750 lt!256267) (index!23857 lt!256267) (index!23857 lt!256267) mask!3119))))

(declare-fun b!562459 () Bool)

(declare-fun res!353610 () Bool)

(declare-fun e!324148 () Bool)

(assert (=> b!562459 (=> (not res!353610) (not e!324148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562459 (= res!353610 (validKeyInArray!0 (select (arr!16958 a!3118) j!142)))))

(declare-fun b!562460 () Bool)

(declare-fun e!324150 () Bool)

(assert (=> b!562460 (= e!324150 e!324149)))

(declare-fun res!353612 () Bool)

(assert (=> b!562460 (=> res!353612 e!324149)))

(declare-fun lt!256261 () SeekEntryResult!5407)

(declare-fun lt!256260 () (_ BitVec 64))

(assert (=> b!562460 (= res!353612 (or (bvslt (index!23857 lt!256267) #b00000000000000000000000000000000) (bvsge (index!23857 lt!256267) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52750 lt!256267) #b01111111111111111111111111111110) (bvslt (x!52750 lt!256267) #b00000000000000000000000000000000) (not (= lt!256260 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16958 a!3118) i!1132 k!1914) (index!23857 lt!256267)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256265 lt!256261))))))

(declare-fun lt!256262 () SeekEntryResult!5407)

(assert (=> b!562460 (= lt!256262 lt!256264)))

(declare-fun lt!256268 () array!35315)

(declare-fun lt!256266 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35315 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!562460 (= lt!256264 (seekKeyOrZeroReturnVacant!0 (x!52750 lt!256267) (index!23857 lt!256267) (index!23857 lt!256267) lt!256266 lt!256268 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35315 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!562460 (= lt!256262 (seekEntryOrOpen!0 lt!256266 lt!256268 mask!3119))))

(declare-fun lt!256272 () SeekEntryResult!5407)

(assert (=> b!562460 (= lt!256272 lt!256265)))

(assert (=> b!562460 (= lt!256265 (seekKeyOrZeroReturnVacant!0 (x!52750 lt!256267) (index!23857 lt!256267) (index!23857 lt!256267) (select (arr!16958 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562461 () Bool)

(declare-fun res!353611 () Bool)

(assert (=> b!562461 (=> (not res!353611) (not e!324148))))

(declare-fun arrayContainsKey!0 (array!35315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562461 (= res!353611 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562462 () Bool)

(declare-fun e!324144 () Bool)

(assert (=> b!562462 (= e!324148 e!324144)))

(declare-fun res!353621 () Bool)

(assert (=> b!562462 (=> (not res!353621) (not e!324144))))

(declare-fun lt!256263 () SeekEntryResult!5407)

(assert (=> b!562462 (= res!353621 (or (= lt!256263 (MissingZero!5407 i!1132)) (= lt!256263 (MissingVacant!5407 i!1132))))))

(assert (=> b!562462 (= lt!256263 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562463 () Bool)

(declare-fun res!353620 () Bool)

(assert (=> b!562463 (=> (not res!353620) (not e!324148))))

(assert (=> b!562463 (= res!353620 (validKeyInArray!0 k!1914))))

(declare-fun res!353618 () Bool)

(assert (=> start!51450 (=> (not res!353618) (not e!324148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51450 (= res!353618 (validMask!0 mask!3119))))

(assert (=> start!51450 e!324148))

(assert (=> start!51450 true))

(declare-fun array_inv!12754 (array!35315) Bool)

(assert (=> start!51450 (array_inv!12754 a!3118)))

(declare-fun b!562464 () Bool)

(declare-fun res!353616 () Bool)

(assert (=> b!562464 (=> (not res!353616) (not e!324144))))

(declare-datatypes ((List!11038 0))(
  ( (Nil!11035) (Cons!11034 (h!12037 (_ BitVec 64)) (t!17266 List!11038)) )
))
(declare-fun arrayNoDuplicates!0 (array!35315 (_ BitVec 32) List!11038) Bool)

(assert (=> b!562464 (= res!353616 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11035))))

(declare-fun b!562465 () Bool)

(declare-fun res!353613 () Bool)

(assert (=> b!562465 (=> (not res!353613) (not e!324144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35315 (_ BitVec 32)) Bool)

(assert (=> b!562465 (= res!353613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562466 () Bool)

(declare-fun e!324146 () Bool)

(assert (=> b!562466 (= e!324146 e!324150)))

(declare-fun res!353619 () Bool)

(assert (=> b!562466 (=> res!353619 e!324150)))

(assert (=> b!562466 (= res!353619 (or (= lt!256260 (select (arr!16958 a!3118) j!142)) (= lt!256260 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562466 (= lt!256260 (select (arr!16958 a!3118) (index!23857 lt!256267)))))

(declare-fun b!562467 () Bool)

(declare-fun e!324147 () Bool)

(assert (=> b!562467 (= e!324147 (not e!324146))))

(declare-fun res!353615 () Bool)

(assert (=> b!562467 (=> res!353615 e!324146)))

(assert (=> b!562467 (= res!353615 (or (undefined!6219 lt!256267) (not (is-Intermediate!5407 lt!256267))))))

(assert (=> b!562467 (= lt!256272 lt!256261)))

(assert (=> b!562467 (= lt!256261 (Found!5407 j!142))))

(assert (=> b!562467 (= lt!256272 (seekEntryOrOpen!0 (select (arr!16958 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562467 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256273 () Unit!17588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17588)

(assert (=> b!562467 (= lt!256273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562468 () Bool)

(declare-fun res!353614 () Bool)

(assert (=> b!562468 (=> (not res!353614) (not e!324148))))

(assert (=> b!562468 (= res!353614 (and (= (size!17322 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17322 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17322 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562469 () Bool)

(assert (=> b!562469 (= e!324144 e!324147)))

(declare-fun res!353617 () Bool)

(assert (=> b!562469 (=> (not res!353617) (not e!324147))))

(declare-fun lt!256269 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35315 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!562469 (= res!353617 (= lt!256267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256269 lt!256266 lt!256268 mask!3119)))))

(declare-fun lt!256271 () (_ BitVec 32))

(assert (=> b!562469 (= lt!256267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256271 (select (arr!16958 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562469 (= lt!256269 (toIndex!0 lt!256266 mask!3119))))

(assert (=> b!562469 (= lt!256266 (select (store (arr!16958 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562469 (= lt!256271 (toIndex!0 (select (arr!16958 a!3118) j!142) mask!3119))))

(assert (=> b!562469 (= lt!256268 (array!35316 (store (arr!16958 a!3118) i!1132 k!1914) (size!17322 a!3118)))))

(assert (= (and start!51450 res!353618) b!562468))

(assert (= (and b!562468 res!353614) b!562459))

(assert (= (and b!562459 res!353610) b!562463))

(assert (= (and b!562463 res!353620) b!562461))

(assert (= (and b!562461 res!353611) b!562462))

(assert (= (and b!562462 res!353621) b!562465))

(assert (= (and b!562465 res!353613) b!562464))

(assert (= (and b!562464 res!353616) b!562469))

(assert (= (and b!562469 res!353617) b!562467))

(assert (= (and b!562467 (not res!353615)) b!562466))

(assert (= (and b!562466 (not res!353619)) b!562460))

(assert (= (and b!562460 (not res!353612)) b!562458))

(declare-fun m!540501 () Bool)

(assert (=> b!562465 m!540501))

(declare-fun m!540503 () Bool)

(assert (=> start!51450 m!540503))

(declare-fun m!540505 () Bool)

(assert (=> start!51450 m!540505))

(declare-fun m!540507 () Bool)

(assert (=> b!562461 m!540507))

(declare-fun m!540509 () Bool)

(assert (=> b!562462 m!540509))

(declare-fun m!540511 () Bool)

(assert (=> b!562463 m!540511))

(declare-fun m!540513 () Bool)

(assert (=> b!562460 m!540513))

(declare-fun m!540515 () Bool)

(assert (=> b!562460 m!540515))

(assert (=> b!562460 m!540515))

(declare-fun m!540517 () Bool)

(assert (=> b!562460 m!540517))

(declare-fun m!540519 () Bool)

(assert (=> b!562460 m!540519))

(declare-fun m!540521 () Bool)

(assert (=> b!562460 m!540521))

(declare-fun m!540523 () Bool)

(assert (=> b!562460 m!540523))

(assert (=> b!562467 m!540515))

(assert (=> b!562467 m!540515))

(declare-fun m!540525 () Bool)

(assert (=> b!562467 m!540525))

(declare-fun m!540527 () Bool)

(assert (=> b!562467 m!540527))

(declare-fun m!540529 () Bool)

(assert (=> b!562467 m!540529))

(declare-fun m!540531 () Bool)

(assert (=> b!562464 m!540531))

(assert (=> b!562469 m!540515))

(declare-fun m!540533 () Bool)

(assert (=> b!562469 m!540533))

(assert (=> b!562469 m!540515))

(declare-fun m!540535 () Bool)

(assert (=> b!562469 m!540535))

(assert (=> b!562469 m!540515))

(declare-fun m!540537 () Bool)

(assert (=> b!562469 m!540537))

(declare-fun m!540539 () Bool)

(assert (=> b!562469 m!540539))

(declare-fun m!540541 () Bool)

(assert (=> b!562469 m!540541))

(assert (=> b!562469 m!540523))

(declare-fun m!540543 () Bool)

(assert (=> b!562458 m!540543))

(assert (=> b!562466 m!540515))

(declare-fun m!540545 () Bool)

(assert (=> b!562466 m!540545))

(assert (=> b!562459 m!540515))

(assert (=> b!562459 m!540515))

(declare-fun m!540547 () Bool)

(assert (=> b!562459 m!540547))

(push 1)

