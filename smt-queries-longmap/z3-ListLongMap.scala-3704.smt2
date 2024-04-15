; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50828 () Bool)

(assert start!50828)

(declare-fun b!556108 () Bool)

(declare-fun res!348671 () Bool)

(declare-fun e!320372 () Bool)

(assert (=> b!556108 (=> (not res!348671) (not e!320372))))

(declare-datatypes ((array!35062 0))(
  ( (array!35063 (arr!16841 (Array (_ BitVec 32) (_ BitVec 64))) (size!17206 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35062)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35062 (_ BitVec 32)) Bool)

(assert (=> b!556108 (= res!348671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556109 () Bool)

(declare-fun e!320373 () Bool)

(assert (=> b!556109 (= e!320373 e!320372)))

(declare-fun res!348669 () Bool)

(assert (=> b!556109 (=> (not res!348669) (not e!320372))))

(declare-datatypes ((SeekEntryResult!5287 0))(
  ( (MissingZero!5287 (index!23375 (_ BitVec 32))) (Found!5287 (index!23376 (_ BitVec 32))) (Intermediate!5287 (undefined!6099 Bool) (index!23377 (_ BitVec 32)) (x!52276 (_ BitVec 32))) (Undefined!5287) (MissingVacant!5287 (index!23378 (_ BitVec 32))) )
))
(declare-fun lt!252621 () SeekEntryResult!5287)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556109 (= res!348669 (or (= lt!252621 (MissingZero!5287 i!1132)) (= lt!252621 (MissingVacant!5287 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35062 (_ BitVec 32)) SeekEntryResult!5287)

(assert (=> b!556109 (= lt!252621 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556110 () Bool)

(declare-fun res!348670 () Bool)

(assert (=> b!556110 (=> (not res!348670) (not e!320372))))

(declare-datatypes ((List!10960 0))(
  ( (Nil!10957) (Cons!10956 (h!11941 (_ BitVec 64)) (t!17179 List!10960)) )
))
(declare-fun arrayNoDuplicates!0 (array!35062 (_ BitVec 32) List!10960) Bool)

(assert (=> b!556110 (= res!348670 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10957))))

(declare-fun b!556111 () Bool)

(declare-fun res!348664 () Bool)

(assert (=> b!556111 (=> (not res!348664) (not e!320373))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!556111 (= res!348664 (and (= (size!17206 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17206 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17206 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!252624 () SeekEntryResult!5287)

(declare-fun e!320371 () Bool)

(declare-fun b!556112 () Bool)

(get-info :version)

(assert (=> b!556112 (= e!320371 (not (or (not ((_ is Intermediate!5287) lt!252624)) (undefined!6099 lt!252624) (= (select (arr!16841 a!3118) (index!23377 lt!252624)) (select (arr!16841 a!3118) j!142)) (= (select (arr!16841 a!3118) (index!23377 lt!252624)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!320370 () Bool)

(assert (=> b!556112 e!320370))

(declare-fun res!348662 () Bool)

(assert (=> b!556112 (=> (not res!348662) (not e!320370))))

(assert (=> b!556112 (= res!348662 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17334 0))(
  ( (Unit!17335) )
))
(declare-fun lt!252622 () Unit!17334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17334)

(assert (=> b!556112 (= lt!252622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556113 () Bool)

(declare-fun res!348667 () Bool)

(assert (=> b!556113 (=> (not res!348667) (not e!320373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556113 (= res!348667 (validKeyInArray!0 k0!1914))))

(declare-fun b!556114 () Bool)

(declare-fun res!348668 () Bool)

(assert (=> b!556114 (=> (not res!348668) (not e!320373))))

(assert (=> b!556114 (= res!348668 (validKeyInArray!0 (select (arr!16841 a!3118) j!142)))))

(declare-fun b!556115 () Bool)

(declare-fun res!348663 () Bool)

(assert (=> b!556115 (=> (not res!348663) (not e!320373))))

(declare-fun arrayContainsKey!0 (array!35062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556115 (= res!348663 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556116 () Bool)

(assert (=> b!556116 (= e!320372 e!320371)))

(declare-fun res!348666 () Bool)

(assert (=> b!556116 (=> (not res!348666) (not e!320371))))

(declare-fun lt!252625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35062 (_ BitVec 32)) SeekEntryResult!5287)

(assert (=> b!556116 (= res!348666 (= lt!252624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252625 (select (store (arr!16841 a!3118) i!1132 k0!1914) j!142) (array!35063 (store (arr!16841 a!3118) i!1132 k0!1914) (size!17206 a!3118)) mask!3119)))))

(declare-fun lt!252623 () (_ BitVec 32))

(assert (=> b!556116 (= lt!252624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252623 (select (arr!16841 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556116 (= lt!252625 (toIndex!0 (select (store (arr!16841 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556116 (= lt!252623 (toIndex!0 (select (arr!16841 a!3118) j!142) mask!3119))))

(declare-fun b!556117 () Bool)

(assert (=> b!556117 (= e!320370 (= (seekEntryOrOpen!0 (select (arr!16841 a!3118) j!142) a!3118 mask!3119) (Found!5287 j!142)))))

(declare-fun res!348665 () Bool)

(assert (=> start!50828 (=> (not res!348665) (not e!320373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50828 (= res!348665 (validMask!0 mask!3119))))

(assert (=> start!50828 e!320373))

(assert (=> start!50828 true))

(declare-fun array_inv!12724 (array!35062) Bool)

(assert (=> start!50828 (array_inv!12724 a!3118)))

(assert (= (and start!50828 res!348665) b!556111))

(assert (= (and b!556111 res!348664) b!556114))

(assert (= (and b!556114 res!348668) b!556113))

(assert (= (and b!556113 res!348667) b!556115))

(assert (= (and b!556115 res!348663) b!556109))

(assert (= (and b!556109 res!348669) b!556108))

(assert (= (and b!556108 res!348671) b!556110))

(assert (= (and b!556110 res!348670) b!556116))

(assert (= (and b!556116 res!348666) b!556112))

(assert (= (and b!556112 res!348662) b!556117))

(declare-fun m!533585 () Bool)

(assert (=> b!556117 m!533585))

(assert (=> b!556117 m!533585))

(declare-fun m!533587 () Bool)

(assert (=> b!556117 m!533587))

(declare-fun m!533589 () Bool)

(assert (=> b!556110 m!533589))

(declare-fun m!533591 () Bool)

(assert (=> start!50828 m!533591))

(declare-fun m!533593 () Bool)

(assert (=> start!50828 m!533593))

(declare-fun m!533595 () Bool)

(assert (=> b!556115 m!533595))

(assert (=> b!556114 m!533585))

(assert (=> b!556114 m!533585))

(declare-fun m!533597 () Bool)

(assert (=> b!556114 m!533597))

(assert (=> b!556116 m!533585))

(declare-fun m!533599 () Bool)

(assert (=> b!556116 m!533599))

(assert (=> b!556116 m!533585))

(declare-fun m!533601 () Bool)

(assert (=> b!556116 m!533601))

(declare-fun m!533603 () Bool)

(assert (=> b!556116 m!533603))

(declare-fun m!533605 () Bool)

(assert (=> b!556116 m!533605))

(assert (=> b!556116 m!533603))

(declare-fun m!533607 () Bool)

(assert (=> b!556116 m!533607))

(assert (=> b!556116 m!533603))

(assert (=> b!556116 m!533585))

(declare-fun m!533609 () Bool)

(assert (=> b!556116 m!533609))

(declare-fun m!533611 () Bool)

(assert (=> b!556108 m!533611))

(declare-fun m!533613 () Bool)

(assert (=> b!556113 m!533613))

(declare-fun m!533615 () Bool)

(assert (=> b!556112 m!533615))

(assert (=> b!556112 m!533585))

(declare-fun m!533617 () Bool)

(assert (=> b!556112 m!533617))

(declare-fun m!533619 () Bool)

(assert (=> b!556112 m!533619))

(declare-fun m!533621 () Bool)

(assert (=> b!556109 m!533621))

(check-sat (not b!556113) (not b!556114) (not b!556116) (not b!556117) (not b!556115) (not b!556108) (not b!556109) (not start!50828) (not b!556110) (not b!556112))
(check-sat)
