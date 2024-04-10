; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51448 () Bool)

(assert start!51448)

(declare-fun res!353578 () Bool)

(declare-fun e!324123 () Bool)

(assert (=> start!51448 (=> (not res!353578) (not e!324123))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51448 (= res!353578 (validMask!0 mask!3119))))

(assert (=> start!51448 e!324123))

(assert (=> start!51448 true))

(declare-datatypes ((array!35313 0))(
  ( (array!35314 (arr!16957 (Array (_ BitVec 32) (_ BitVec 64))) (size!17321 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35313)

(declare-fun array_inv!12753 (array!35313) Bool)

(assert (=> start!51448 (array_inv!12753 a!3118)))

(declare-fun b!562422 () Bool)

(declare-fun res!353575 () Bool)

(assert (=> b!562422 (=> (not res!353575) (not e!324123))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562422 (= res!353575 (validKeyInArray!0 k0!1914))))

(declare-fun b!562423 () Bool)

(declare-fun e!324125 () Bool)

(declare-fun e!324126 () Bool)

(assert (=> b!562423 (= e!324125 e!324126)))

(declare-fun res!353585 () Bool)

(assert (=> b!562423 (=> res!353585 e!324126)))

(declare-datatypes ((SeekEntryResult!5406 0))(
  ( (MissingZero!5406 (index!23851 (_ BitVec 32))) (Found!5406 (index!23852 (_ BitVec 32))) (Intermediate!5406 (undefined!6218 Bool) (index!23853 (_ BitVec 32)) (x!52749 (_ BitVec 32))) (Undefined!5406) (MissingVacant!5406 (index!23854 (_ BitVec 32))) )
))
(declare-fun lt!256228 () SeekEntryResult!5406)

(declare-fun lt!256227 () (_ BitVec 64))

(declare-fun lt!256231 () SeekEntryResult!5406)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!256222 () SeekEntryResult!5406)

(assert (=> b!562423 (= res!353585 (or (bvslt (index!23853 lt!256222) #b00000000000000000000000000000000) (bvsge (index!23853 lt!256222) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52749 lt!256222) #b01111111111111111111111111111110) (bvslt (x!52749 lt!256222) #b00000000000000000000000000000000) (not (= lt!256227 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16957 a!3118) i!1132 k0!1914) (index!23853 lt!256222)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256228 lt!256231))))))

(declare-fun lt!256225 () SeekEntryResult!5406)

(declare-fun lt!256223 () SeekEntryResult!5406)

(assert (=> b!562423 (= lt!256225 lt!256223)))

(declare-fun lt!256224 () (_ BitVec 64))

(declare-fun lt!256221 () array!35313)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35313 (_ BitVec 32)) SeekEntryResult!5406)

(assert (=> b!562423 (= lt!256223 (seekKeyOrZeroReturnVacant!0 (x!52749 lt!256222) (index!23853 lt!256222) (index!23853 lt!256222) lt!256224 lt!256221 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35313 (_ BitVec 32)) SeekEntryResult!5406)

(assert (=> b!562423 (= lt!256225 (seekEntryOrOpen!0 lt!256224 lt!256221 mask!3119))))

(declare-fun lt!256218 () SeekEntryResult!5406)

(assert (=> b!562423 (= lt!256218 lt!256228)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562423 (= lt!256228 (seekKeyOrZeroReturnVacant!0 (x!52749 lt!256222) (index!23853 lt!256222) (index!23853 lt!256222) (select (arr!16957 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562424 () Bool)

(declare-fun res!353574 () Bool)

(declare-fun e!324128 () Bool)

(assert (=> b!562424 (=> (not res!353574) (not e!324128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35313 (_ BitVec 32)) Bool)

(assert (=> b!562424 (= res!353574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562425 () Bool)

(declare-fun res!353579 () Bool)

(assert (=> b!562425 (=> (not res!353579) (not e!324128))))

(declare-datatypes ((List!11037 0))(
  ( (Nil!11034) (Cons!11033 (h!12036 (_ BitVec 64)) (t!17265 List!11037)) )
))
(declare-fun arrayNoDuplicates!0 (array!35313 (_ BitVec 32) List!11037) Bool)

(assert (=> b!562425 (= res!353579 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11034))))

(declare-fun b!562426 () Bool)

(declare-fun res!353577 () Bool)

(assert (=> b!562426 (=> (not res!353577) (not e!324123))))

(assert (=> b!562426 (= res!353577 (validKeyInArray!0 (select (arr!16957 a!3118) j!142)))))

(declare-fun b!562427 () Bool)

(declare-fun e!324129 () Bool)

(assert (=> b!562427 (= e!324129 e!324125)))

(declare-fun res!353584 () Bool)

(assert (=> b!562427 (=> res!353584 e!324125)))

(assert (=> b!562427 (= res!353584 (or (= lt!256227 (select (arr!16957 a!3118) j!142)) (= lt!256227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562427 (= lt!256227 (select (arr!16957 a!3118) (index!23853 lt!256222)))))

(declare-fun b!562428 () Bool)

(assert (=> b!562428 (= e!324126 true)))

(assert (=> b!562428 (= lt!256228 lt!256223)))

(declare-datatypes ((Unit!17586 0))(
  ( (Unit!17587) )
))
(declare-fun lt!256219 () Unit!17586)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17586)

(assert (=> b!562428 (= lt!256219 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52749 lt!256222) (index!23853 lt!256222) (index!23853 lt!256222) mask!3119))))

(declare-fun b!562429 () Bool)

(declare-fun e!324124 () Bool)

(assert (=> b!562429 (= e!324128 e!324124)))

(declare-fun res!353583 () Bool)

(assert (=> b!562429 (=> (not res!353583) (not e!324124))))

(declare-fun lt!256229 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35313 (_ BitVec 32)) SeekEntryResult!5406)

(assert (=> b!562429 (= res!353583 (= lt!256222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256229 lt!256224 lt!256221 mask!3119)))))

(declare-fun lt!256226 () (_ BitVec 32))

(assert (=> b!562429 (= lt!256222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256226 (select (arr!16957 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562429 (= lt!256229 (toIndex!0 lt!256224 mask!3119))))

(assert (=> b!562429 (= lt!256224 (select (store (arr!16957 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562429 (= lt!256226 (toIndex!0 (select (arr!16957 a!3118) j!142) mask!3119))))

(assert (=> b!562429 (= lt!256221 (array!35314 (store (arr!16957 a!3118) i!1132 k0!1914) (size!17321 a!3118)))))

(declare-fun b!562430 () Bool)

(assert (=> b!562430 (= e!324123 e!324128)))

(declare-fun res!353582 () Bool)

(assert (=> b!562430 (=> (not res!353582) (not e!324128))))

(declare-fun lt!256230 () SeekEntryResult!5406)

(assert (=> b!562430 (= res!353582 (or (= lt!256230 (MissingZero!5406 i!1132)) (= lt!256230 (MissingVacant!5406 i!1132))))))

(assert (=> b!562430 (= lt!256230 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562431 () Bool)

(declare-fun res!353576 () Bool)

(assert (=> b!562431 (=> (not res!353576) (not e!324123))))

(declare-fun arrayContainsKey!0 (array!35313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562431 (= res!353576 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562432 () Bool)

(declare-fun res!353581 () Bool)

(assert (=> b!562432 (=> (not res!353581) (not e!324123))))

(assert (=> b!562432 (= res!353581 (and (= (size!17321 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17321 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17321 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562433 () Bool)

(assert (=> b!562433 (= e!324124 (not e!324129))))

(declare-fun res!353580 () Bool)

(assert (=> b!562433 (=> res!353580 e!324129)))

(get-info :version)

(assert (=> b!562433 (= res!353580 (or (undefined!6218 lt!256222) (not ((_ is Intermediate!5406) lt!256222))))))

(assert (=> b!562433 (= lt!256218 lt!256231)))

(assert (=> b!562433 (= lt!256231 (Found!5406 j!142))))

(assert (=> b!562433 (= lt!256218 (seekEntryOrOpen!0 (select (arr!16957 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562433 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256220 () Unit!17586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17586)

(assert (=> b!562433 (= lt!256220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51448 res!353578) b!562432))

(assert (= (and b!562432 res!353581) b!562426))

(assert (= (and b!562426 res!353577) b!562422))

(assert (= (and b!562422 res!353575) b!562431))

(assert (= (and b!562431 res!353576) b!562430))

(assert (= (and b!562430 res!353582) b!562424))

(assert (= (and b!562424 res!353574) b!562425))

(assert (= (and b!562425 res!353579) b!562429))

(assert (= (and b!562429 res!353583) b!562433))

(assert (= (and b!562433 (not res!353580)) b!562427))

(assert (= (and b!562427 (not res!353584)) b!562423))

(assert (= (and b!562423 (not res!353585)) b!562428))

(declare-fun m!540453 () Bool)

(assert (=> b!562433 m!540453))

(assert (=> b!562433 m!540453))

(declare-fun m!540455 () Bool)

(assert (=> b!562433 m!540455))

(declare-fun m!540457 () Bool)

(assert (=> b!562433 m!540457))

(declare-fun m!540459 () Bool)

(assert (=> b!562433 m!540459))

(assert (=> b!562429 m!540453))

(declare-fun m!540461 () Bool)

(assert (=> b!562429 m!540461))

(assert (=> b!562429 m!540453))

(declare-fun m!540463 () Bool)

(assert (=> b!562429 m!540463))

(declare-fun m!540465 () Bool)

(assert (=> b!562429 m!540465))

(assert (=> b!562429 m!540453))

(declare-fun m!540467 () Bool)

(assert (=> b!562429 m!540467))

(declare-fun m!540469 () Bool)

(assert (=> b!562429 m!540469))

(declare-fun m!540471 () Bool)

(assert (=> b!562429 m!540471))

(declare-fun m!540473 () Bool)

(assert (=> b!562422 m!540473))

(declare-fun m!540475 () Bool)

(assert (=> b!562424 m!540475))

(declare-fun m!540477 () Bool)

(assert (=> b!562430 m!540477))

(declare-fun m!540479 () Bool)

(assert (=> b!562425 m!540479))

(assert (=> b!562427 m!540453))

(declare-fun m!540481 () Bool)

(assert (=> b!562427 m!540481))

(declare-fun m!540483 () Bool)

(assert (=> start!51448 m!540483))

(declare-fun m!540485 () Bool)

(assert (=> start!51448 m!540485))

(assert (=> b!562426 m!540453))

(assert (=> b!562426 m!540453))

(declare-fun m!540487 () Bool)

(assert (=> b!562426 m!540487))

(declare-fun m!540489 () Bool)

(assert (=> b!562423 m!540489))

(assert (=> b!562423 m!540453))

(declare-fun m!540491 () Bool)

(assert (=> b!562423 m!540491))

(assert (=> b!562423 m!540453))

(declare-fun m!540493 () Bool)

(assert (=> b!562423 m!540493))

(assert (=> b!562423 m!540469))

(declare-fun m!540495 () Bool)

(assert (=> b!562423 m!540495))

(declare-fun m!540497 () Bool)

(assert (=> b!562431 m!540497))

(declare-fun m!540499 () Bool)

(assert (=> b!562428 m!540499))

(check-sat (not b!562422) (not b!562426) (not b!562428) (not b!562425) (not b!562429) (not b!562433) (not b!562423) (not b!562424) (not b!562430) (not b!562431) (not start!51448))
(check-sat)
