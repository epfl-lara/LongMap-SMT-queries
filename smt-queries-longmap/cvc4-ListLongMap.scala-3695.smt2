; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50790 () Bool)

(assert start!50790)

(declare-fun b!555657 () Bool)

(declare-fun res!348074 () Bool)

(declare-fun e!320233 () Bool)

(assert (=> b!555657 (=> (not res!348074) (not e!320233))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555657 (= res!348074 (validKeyInArray!0 k!1914))))

(declare-fun b!555658 () Bool)

(declare-fun res!348069 () Bool)

(assert (=> b!555658 (=> (not res!348069) (not e!320233))))

(declare-datatypes ((array!35015 0))(
  ( (array!35016 (arr!16817 (Array (_ BitVec 32) (_ BitVec 64))) (size!17181 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35015)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555658 (= res!348069 (validKeyInArray!0 (select (arr!16817 a!3118) j!142)))))

(declare-fun b!555659 () Bool)

(declare-fun res!348077 () Bool)

(assert (=> b!555659 (=> (not res!348077) (not e!320233))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555659 (= res!348077 (and (= (size!17181 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17181 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17181 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555660 () Bool)

(declare-fun e!320234 () Bool)

(assert (=> b!555660 (= e!320234 (not true))))

(declare-datatypes ((SeekEntryResult!5266 0))(
  ( (MissingZero!5266 (index!23291 (_ BitVec 32))) (Found!5266 (index!23292 (_ BitVec 32))) (Intermediate!5266 (undefined!6078 Bool) (index!23293 (_ BitVec 32)) (x!52188 (_ BitVec 32))) (Undefined!5266) (MissingVacant!5266 (index!23294 (_ BitVec 32))) )
))
(declare-fun lt!252563 () SeekEntryResult!5266)

(declare-fun lt!252562 () SeekEntryResult!5266)

(assert (=> b!555660 (and (= lt!252563 (Found!5266 j!142)) (or (undefined!6078 lt!252562) (not (is-Intermediate!5266 lt!252562)) (= (select (arr!16817 a!3118) (index!23293 lt!252562)) (select (arr!16817 a!3118) j!142)) (not (= (select (arr!16817 a!3118) (index!23293 lt!252562)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252563 (MissingZero!5266 (index!23293 lt!252562)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35015 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!555660 (= lt!252563 (seekEntryOrOpen!0 (select (arr!16817 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35015 (_ BitVec 32)) Bool)

(assert (=> b!555660 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17306 0))(
  ( (Unit!17307) )
))
(declare-fun lt!252565 () Unit!17306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35015 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17306)

(assert (=> b!555660 (= lt!252565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!348070 () Bool)

(assert (=> start!50790 (=> (not res!348070) (not e!320233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50790 (= res!348070 (validMask!0 mask!3119))))

(assert (=> start!50790 e!320233))

(assert (=> start!50790 true))

(declare-fun array_inv!12613 (array!35015) Bool)

(assert (=> start!50790 (array_inv!12613 a!3118)))

(declare-fun b!555661 () Bool)

(declare-fun e!320235 () Bool)

(assert (=> b!555661 (= e!320233 e!320235)))

(declare-fun res!348071 () Bool)

(assert (=> b!555661 (=> (not res!348071) (not e!320235))))

(declare-fun lt!252560 () SeekEntryResult!5266)

(assert (=> b!555661 (= res!348071 (or (= lt!252560 (MissingZero!5266 i!1132)) (= lt!252560 (MissingVacant!5266 i!1132))))))

(assert (=> b!555661 (= lt!252560 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555662 () Bool)

(declare-fun res!348076 () Bool)

(assert (=> b!555662 (=> (not res!348076) (not e!320233))))

(declare-fun arrayContainsKey!0 (array!35015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555662 (= res!348076 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555663 () Bool)

(declare-fun res!348073 () Bool)

(assert (=> b!555663 (=> (not res!348073) (not e!320235))))

(assert (=> b!555663 (= res!348073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555664 () Bool)

(assert (=> b!555664 (= e!320235 e!320234)))

(declare-fun res!348072 () Bool)

(assert (=> b!555664 (=> (not res!348072) (not e!320234))))

(declare-fun lt!252564 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35015 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!555664 (= res!348072 (= lt!252562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252564 (select (store (arr!16817 a!3118) i!1132 k!1914) j!142) (array!35016 (store (arr!16817 a!3118) i!1132 k!1914) (size!17181 a!3118)) mask!3119)))))

(declare-fun lt!252561 () (_ BitVec 32))

(assert (=> b!555664 (= lt!252562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252561 (select (arr!16817 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555664 (= lt!252564 (toIndex!0 (select (store (arr!16817 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555664 (= lt!252561 (toIndex!0 (select (arr!16817 a!3118) j!142) mask!3119))))

(declare-fun b!555665 () Bool)

(declare-fun res!348075 () Bool)

(assert (=> b!555665 (=> (not res!348075) (not e!320235))))

(declare-datatypes ((List!10897 0))(
  ( (Nil!10894) (Cons!10893 (h!11878 (_ BitVec 64)) (t!17125 List!10897)) )
))
(declare-fun arrayNoDuplicates!0 (array!35015 (_ BitVec 32) List!10897) Bool)

(assert (=> b!555665 (= res!348075 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10894))))

(assert (= (and start!50790 res!348070) b!555659))

(assert (= (and b!555659 res!348077) b!555658))

(assert (= (and b!555658 res!348069) b!555657))

(assert (= (and b!555657 res!348074) b!555662))

(assert (= (and b!555662 res!348076) b!555661))

(assert (= (and b!555661 res!348071) b!555663))

(assert (= (and b!555663 res!348073) b!555665))

(assert (= (and b!555665 res!348075) b!555664))

(assert (= (and b!555664 res!348072) b!555660))

(declare-fun m!533431 () Bool)

(assert (=> b!555662 m!533431))

(declare-fun m!533433 () Bool)

(assert (=> start!50790 m!533433))

(declare-fun m!533435 () Bool)

(assert (=> start!50790 m!533435))

(declare-fun m!533437 () Bool)

(assert (=> b!555661 m!533437))

(declare-fun m!533439 () Bool)

(assert (=> b!555665 m!533439))

(declare-fun m!533441 () Bool)

(assert (=> b!555660 m!533441))

(declare-fun m!533443 () Bool)

(assert (=> b!555660 m!533443))

(declare-fun m!533445 () Bool)

(assert (=> b!555660 m!533445))

(declare-fun m!533447 () Bool)

(assert (=> b!555660 m!533447))

(assert (=> b!555660 m!533441))

(declare-fun m!533449 () Bool)

(assert (=> b!555660 m!533449))

(assert (=> b!555658 m!533441))

(assert (=> b!555658 m!533441))

(declare-fun m!533451 () Bool)

(assert (=> b!555658 m!533451))

(assert (=> b!555664 m!533441))

(declare-fun m!533453 () Bool)

(assert (=> b!555664 m!533453))

(assert (=> b!555664 m!533441))

(declare-fun m!533455 () Bool)

(assert (=> b!555664 m!533455))

(declare-fun m!533457 () Bool)

(assert (=> b!555664 m!533457))

(assert (=> b!555664 m!533455))

(assert (=> b!555664 m!533441))

(declare-fun m!533459 () Bool)

(assert (=> b!555664 m!533459))

(declare-fun m!533461 () Bool)

(assert (=> b!555664 m!533461))

(assert (=> b!555664 m!533455))

(declare-fun m!533463 () Bool)

(assert (=> b!555664 m!533463))

(declare-fun m!533465 () Bool)

(assert (=> b!555663 m!533465))

(declare-fun m!533467 () Bool)

(assert (=> b!555657 m!533467))

(push 1)

