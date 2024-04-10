; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50640 () Bool)

(assert start!50640)

(declare-fun b!553523 () Bool)

(declare-fun res!345942 () Bool)

(declare-fun e!319288 () Bool)

(assert (=> b!553523 (=> (not res!345942) (not e!319288))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553523 (= res!345942 (validKeyInArray!0 k!1914))))

(declare-fun b!553524 () Bool)

(declare-fun res!345944 () Bool)

(declare-fun e!319289 () Bool)

(assert (=> b!553524 (=> (not res!345944) (not e!319289))))

(declare-datatypes ((array!34865 0))(
  ( (array!34866 (arr!16742 (Array (_ BitVec 32) (_ BitVec 64))) (size!17106 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34865)

(declare-datatypes ((List!10822 0))(
  ( (Nil!10819) (Cons!10818 (h!11803 (_ BitVec 64)) (t!17050 List!10822)) )
))
(declare-fun arrayNoDuplicates!0 (array!34865 (_ BitVec 32) List!10822) Bool)

(assert (=> b!553524 (= res!345944 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10819))))

(declare-fun b!553525 () Bool)

(declare-fun res!345938 () Bool)

(assert (=> b!553525 (=> (not res!345938) (not e!319288))))

(declare-fun arrayContainsKey!0 (array!34865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553525 (= res!345938 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!319287 () Bool)

(declare-fun b!553526 () Bool)

(declare-datatypes ((SeekEntryResult!5191 0))(
  ( (MissingZero!5191 (index!22991 (_ BitVec 32))) (Found!5191 (index!22992 (_ BitVec 32))) (Intermediate!5191 (undefined!6003 Bool) (index!22993 (_ BitVec 32)) (x!51913 (_ BitVec 32))) (Undefined!5191) (MissingVacant!5191 (index!22994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34865 (_ BitVec 32)) SeekEntryResult!5191)

(assert (=> b!553526 (= e!319287 (= (seekEntryOrOpen!0 (select (arr!16742 a!3118) j!142) a!3118 mask!3119) (Found!5191 j!142)))))

(declare-fun b!553527 () Bool)

(declare-fun res!345940 () Bool)

(assert (=> b!553527 (=> (not res!345940) (not e!319289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34865 (_ BitVec 32)) Bool)

(assert (=> b!553527 (= res!345940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553528 () Bool)

(declare-fun res!345941 () Bool)

(assert (=> b!553528 (=> (not res!345941) (not e!319289))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34865 (_ BitVec 32)) SeekEntryResult!5191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553528 (= res!345941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16742 a!3118) j!142) mask!3119) (select (arr!16742 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16742 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16742 a!3118) i!1132 k!1914) j!142) (array!34866 (store (arr!16742 a!3118) i!1132 k!1914) (size!17106 a!3118)) mask!3119)))))

(declare-fun b!553529 () Bool)

(assert (=> b!553529 (= e!319288 e!319289)))

(declare-fun res!345936 () Bool)

(assert (=> b!553529 (=> (not res!345936) (not e!319289))))

(declare-fun lt!251503 () SeekEntryResult!5191)

(assert (=> b!553529 (= res!345936 (or (= lt!251503 (MissingZero!5191 i!1132)) (= lt!251503 (MissingVacant!5191 i!1132))))))

(assert (=> b!553529 (= lt!251503 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553530 () Bool)

(declare-fun res!345939 () Bool)

(assert (=> b!553530 (=> (not res!345939) (not e!319288))))

(assert (=> b!553530 (= res!345939 (and (= (size!17106 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17106 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17106 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553531 () Bool)

(declare-fun res!345935 () Bool)

(assert (=> b!553531 (=> (not res!345935) (not e!319288))))

(assert (=> b!553531 (= res!345935 (validKeyInArray!0 (select (arr!16742 a!3118) j!142)))))

(declare-fun res!345937 () Bool)

(assert (=> start!50640 (=> (not res!345937) (not e!319288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50640 (= res!345937 (validMask!0 mask!3119))))

(assert (=> start!50640 e!319288))

(assert (=> start!50640 true))

(declare-fun array_inv!12538 (array!34865) Bool)

(assert (=> start!50640 (array_inv!12538 a!3118)))

(declare-fun b!553532 () Bool)

(assert (=> b!553532 (= e!319289 (not true))))

(assert (=> b!553532 e!319287))

(declare-fun res!345943 () Bool)

(assert (=> b!553532 (=> (not res!345943) (not e!319287))))

(assert (=> b!553532 (= res!345943 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17156 0))(
  ( (Unit!17157) )
))
(declare-fun lt!251502 () Unit!17156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17156)

(assert (=> b!553532 (= lt!251502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50640 res!345937) b!553530))

(assert (= (and b!553530 res!345939) b!553531))

(assert (= (and b!553531 res!345935) b!553523))

(assert (= (and b!553523 res!345942) b!553525))

(assert (= (and b!553525 res!345938) b!553529))

(assert (= (and b!553529 res!345936) b!553527))

(assert (= (and b!553527 res!345940) b!553524))

(assert (= (and b!553524 res!345944) b!553528))

(assert (= (and b!553528 res!345941) b!553532))

(assert (= (and b!553532 res!345943) b!553526))

(declare-fun m!530619 () Bool)

(assert (=> b!553524 m!530619))

(declare-fun m!530621 () Bool)

(assert (=> b!553525 m!530621))

(declare-fun m!530623 () Bool)

(assert (=> b!553523 m!530623))

(declare-fun m!530625 () Bool)

(assert (=> b!553528 m!530625))

(declare-fun m!530627 () Bool)

(assert (=> b!553528 m!530627))

(assert (=> b!553528 m!530625))

(declare-fun m!530629 () Bool)

(assert (=> b!553528 m!530629))

(declare-fun m!530631 () Bool)

(assert (=> b!553528 m!530631))

(assert (=> b!553528 m!530629))

(declare-fun m!530633 () Bool)

(assert (=> b!553528 m!530633))

(assert (=> b!553528 m!530627))

(assert (=> b!553528 m!530625))

(declare-fun m!530635 () Bool)

(assert (=> b!553528 m!530635))

(declare-fun m!530637 () Bool)

(assert (=> b!553528 m!530637))

(assert (=> b!553528 m!530629))

(assert (=> b!553528 m!530631))

(declare-fun m!530639 () Bool)

(assert (=> b!553532 m!530639))

(declare-fun m!530641 () Bool)

(assert (=> b!553532 m!530641))

(declare-fun m!530643 () Bool)

(assert (=> start!50640 m!530643))

(declare-fun m!530645 () Bool)

(assert (=> start!50640 m!530645))

(declare-fun m!530647 () Bool)

(assert (=> b!553529 m!530647))

(assert (=> b!553531 m!530625))

(assert (=> b!553531 m!530625))

(declare-fun m!530649 () Bool)

(assert (=> b!553531 m!530649))

(declare-fun m!530651 () Bool)

(assert (=> b!553527 m!530651))

(assert (=> b!553526 m!530625))

(assert (=> b!553526 m!530625))

(declare-fun m!530653 () Bool)

(assert (=> b!553526 m!530653))

(push 1)

