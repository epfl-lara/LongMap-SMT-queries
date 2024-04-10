; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52442 () Bool)

(assert start!52442)

(declare-fun b!572582 () Bool)

(declare-fun e!329369 () Bool)

(declare-fun e!329365 () Bool)

(assert (=> b!572582 (= e!329369 e!329365)))

(declare-fun res!362098 () Bool)

(assert (=> b!572582 (=> res!362098 e!329365)))

(declare-datatypes ((SeekEntryResult!5657 0))(
  ( (MissingZero!5657 (index!24855 (_ BitVec 32))) (Found!5657 (index!24856 (_ BitVec 32))) (Intermediate!5657 (undefined!6469 Bool) (index!24857 (_ BitVec 32)) (x!53726 (_ BitVec 32))) (Undefined!5657) (MissingVacant!5657 (index!24858 (_ BitVec 32))) )
))
(declare-fun lt!261342 () SeekEntryResult!5657)

(assert (=> b!572582 (= res!362098 (or (undefined!6469 lt!261342) (not (is-Intermediate!5657 lt!261342))))))

(declare-fun b!572583 () Bool)

(declare-fun res!362092 () Bool)

(declare-fun e!329370 () Bool)

(assert (=> b!572583 (=> (not res!362092) (not e!329370))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35839 0))(
  ( (array!35840 (arr!17208 (Array (_ BitVec 32) (_ BitVec 64))) (size!17572 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35839)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!572583 (= res!362092 (and (= (size!17572 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17572 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17572 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572584 () Bool)

(declare-fun e!329366 () Bool)

(assert (=> b!572584 (= e!329370 e!329366)))

(declare-fun res!362091 () Bool)

(assert (=> b!572584 (=> (not res!362091) (not e!329366))))

(declare-fun lt!261336 () SeekEntryResult!5657)

(assert (=> b!572584 (= res!362091 (or (= lt!261336 (MissingZero!5657 i!1132)) (= lt!261336 (MissingVacant!5657 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35839 (_ BitVec 32)) SeekEntryResult!5657)

(assert (=> b!572584 (= lt!261336 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572586 () Bool)

(declare-fun res!362097 () Bool)

(assert (=> b!572586 (=> (not res!362097) (not e!329370))))

(declare-fun arrayContainsKey!0 (array!35839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572586 (= res!362097 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572587 () Bool)

(declare-fun e!329364 () Bool)

(declare-fun e!329367 () Bool)

(assert (=> b!572587 (= e!329364 e!329367)))

(declare-fun res!362096 () Bool)

(assert (=> b!572587 (=> (not res!362096) (not e!329367))))

(declare-fun lt!261340 () SeekEntryResult!5657)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35839 (_ BitVec 32)) SeekEntryResult!5657)

(assert (=> b!572587 (= res!362096 (= lt!261340 (seekKeyOrZeroReturnVacant!0 (x!53726 lt!261342) (index!24857 lt!261342) (index!24857 lt!261342) (select (arr!17208 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572588 () Bool)

(declare-fun e!329368 () Bool)

(assert (=> b!572588 (= e!329368 (not true))))

(assert (=> b!572588 e!329369))

(declare-fun res!362095 () Bool)

(assert (=> b!572588 (=> (not res!362095) (not e!329369))))

(assert (=> b!572588 (= res!362095 (= lt!261340 (Found!5657 j!142)))))

(assert (=> b!572588 (= lt!261340 (seekEntryOrOpen!0 (select (arr!17208 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35839 (_ BitVec 32)) Bool)

(assert (=> b!572588 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18016 0))(
  ( (Unit!18017) )
))
(declare-fun lt!261338 () Unit!18016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18016)

(assert (=> b!572588 (= lt!261338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572589 () Bool)

(declare-fun res!362094 () Bool)

(assert (=> b!572589 (=> (not res!362094) (not e!329366))))

(assert (=> b!572589 (= res!362094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572590 () Bool)

(assert (=> b!572590 (= e!329366 e!329368)))

(declare-fun res!362100 () Bool)

(assert (=> b!572590 (=> (not res!362100) (not e!329368))))

(declare-fun lt!261335 () array!35839)

(declare-fun lt!261339 () (_ BitVec 32))

(declare-fun lt!261337 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35839 (_ BitVec 32)) SeekEntryResult!5657)

(assert (=> b!572590 (= res!362100 (= lt!261342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261339 lt!261337 lt!261335 mask!3119)))))

(declare-fun lt!261343 () (_ BitVec 32))

(assert (=> b!572590 (= lt!261342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261343 (select (arr!17208 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572590 (= lt!261339 (toIndex!0 lt!261337 mask!3119))))

(assert (=> b!572590 (= lt!261337 (select (store (arr!17208 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572590 (= lt!261343 (toIndex!0 (select (arr!17208 a!3118) j!142) mask!3119))))

(assert (=> b!572590 (= lt!261335 (array!35840 (store (arr!17208 a!3118) i!1132 k!1914) (size!17572 a!3118)))))

(declare-fun b!572591 () Bool)

(assert (=> b!572591 (= e!329367 (= (seekEntryOrOpen!0 lt!261337 lt!261335 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53726 lt!261342) (index!24857 lt!261342) (index!24857 lt!261342) lt!261337 lt!261335 mask!3119)))))

(declare-fun b!572592 () Bool)

(assert (=> b!572592 (= e!329365 e!329364)))

(declare-fun res!362099 () Bool)

(assert (=> b!572592 (=> res!362099 e!329364)))

(declare-fun lt!261341 () (_ BitVec 64))

(assert (=> b!572592 (= res!362099 (or (= lt!261341 (select (arr!17208 a!3118) j!142)) (= lt!261341 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572592 (= lt!261341 (select (arr!17208 a!3118) (index!24857 lt!261342)))))

(declare-fun b!572585 () Bool)

(declare-fun res!362102 () Bool)

(assert (=> b!572585 (=> (not res!362102) (not e!329370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572585 (= res!362102 (validKeyInArray!0 k!1914))))

(declare-fun res!362093 () Bool)

(assert (=> start!52442 (=> (not res!362093) (not e!329370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52442 (= res!362093 (validMask!0 mask!3119))))

(assert (=> start!52442 e!329370))

(assert (=> start!52442 true))

(declare-fun array_inv!13004 (array!35839) Bool)

(assert (=> start!52442 (array_inv!13004 a!3118)))

(declare-fun b!572593 () Bool)

(declare-fun res!362090 () Bool)

(assert (=> b!572593 (=> (not res!362090) (not e!329370))))

(assert (=> b!572593 (= res!362090 (validKeyInArray!0 (select (arr!17208 a!3118) j!142)))))

(declare-fun b!572594 () Bool)

(declare-fun res!362101 () Bool)

(assert (=> b!572594 (=> (not res!362101) (not e!329366))))

(declare-datatypes ((List!11288 0))(
  ( (Nil!11285) (Cons!11284 (h!12311 (_ BitVec 64)) (t!17516 List!11288)) )
))
(declare-fun arrayNoDuplicates!0 (array!35839 (_ BitVec 32) List!11288) Bool)

(assert (=> b!572594 (= res!362101 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11285))))

(assert (= (and start!52442 res!362093) b!572583))

(assert (= (and b!572583 res!362092) b!572593))

(assert (= (and b!572593 res!362090) b!572585))

(assert (= (and b!572585 res!362102) b!572586))

(assert (= (and b!572586 res!362097) b!572584))

(assert (= (and b!572584 res!362091) b!572589))

(assert (= (and b!572589 res!362094) b!572594))

(assert (= (and b!572594 res!362101) b!572590))

(assert (= (and b!572590 res!362100) b!572588))

(assert (= (and b!572588 res!362095) b!572582))

(assert (= (and b!572582 (not res!362098)) b!572592))

(assert (= (and b!572592 (not res!362099)) b!572587))

(assert (= (and b!572587 res!362096) b!572591))

(declare-fun m!551577 () Bool)

(assert (=> b!572590 m!551577))

(declare-fun m!551579 () Bool)

(assert (=> b!572590 m!551579))

(assert (=> b!572590 m!551577))

(assert (=> b!572590 m!551577))

(declare-fun m!551581 () Bool)

(assert (=> b!572590 m!551581))

(declare-fun m!551583 () Bool)

(assert (=> b!572590 m!551583))

(declare-fun m!551585 () Bool)

(assert (=> b!572590 m!551585))

(declare-fun m!551587 () Bool)

(assert (=> b!572590 m!551587))

(declare-fun m!551589 () Bool)

(assert (=> b!572590 m!551589))

(declare-fun m!551591 () Bool)

(assert (=> start!52442 m!551591))

(declare-fun m!551593 () Bool)

(assert (=> start!52442 m!551593))

(declare-fun m!551595 () Bool)

(assert (=> b!572594 m!551595))

(declare-fun m!551597 () Bool)

(assert (=> b!572585 m!551597))

(declare-fun m!551599 () Bool)

(assert (=> b!572591 m!551599))

(declare-fun m!551601 () Bool)

(assert (=> b!572591 m!551601))

(declare-fun m!551603 () Bool)

(assert (=> b!572586 m!551603))

(declare-fun m!551605 () Bool)

(assert (=> b!572589 m!551605))

(assert (=> b!572592 m!551577))

(declare-fun m!551607 () Bool)

(assert (=> b!572592 m!551607))

(declare-fun m!551609 () Bool)

(assert (=> b!572584 m!551609))

(assert (=> b!572587 m!551577))

(assert (=> b!572587 m!551577))

(declare-fun m!551611 () Bool)

(assert (=> b!572587 m!551611))

(assert (=> b!572588 m!551577))

(assert (=> b!572588 m!551577))

(declare-fun m!551613 () Bool)

(assert (=> b!572588 m!551613))

(declare-fun m!551615 () Bool)

(assert (=> b!572588 m!551615))

(declare-fun m!551617 () Bool)

(assert (=> b!572588 m!551617))

(assert (=> b!572593 m!551577))

(assert (=> b!572593 m!551577))

(declare-fun m!551619 () Bool)

(assert (=> b!572593 m!551619))

(push 1)

