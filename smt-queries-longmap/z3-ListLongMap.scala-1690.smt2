; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31014 () Bool)

(assert start!31014)

(declare-fun b!311904 () Bool)

(declare-fun res!168414 () Bool)

(declare-fun e!194544 () Bool)

(assert (=> b!311904 (=> (not res!168414) (not e!194544))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15929 0))(
  ( (array!15930 (arr!7546 (Array (_ BitVec 32) (_ BitVec 64))) (size!7898 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15929)

(assert (=> b!311904 (= res!168414 (and (= (size!7898 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7898 a!3293))))))

(declare-fun res!168412 () Bool)

(assert (=> start!31014 (=> (not res!168412) (not e!194544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31014 (= res!168412 (validMask!0 mask!3709))))

(assert (=> start!31014 e!194544))

(declare-fun array_inv!5496 (array!15929) Bool)

(assert (=> start!31014 (array_inv!5496 a!3293)))

(assert (=> start!31014 true))

(declare-fun b!311905 () Bool)

(declare-fun e!194545 () Bool)

(declare-fun e!194543 () Bool)

(assert (=> b!311905 (= e!194545 e!194543)))

(declare-fun res!168410 () Bool)

(assert (=> b!311905 (=> (not res!168410) (not e!194543))))

(declare-datatypes ((SeekEntryResult!2651 0))(
  ( (MissingZero!2651 (index!12780 (_ BitVec 32))) (Found!2651 (index!12781 (_ BitVec 32))) (Intermediate!2651 (undefined!3463 Bool) (index!12782 (_ BitVec 32)) (x!31101 (_ BitVec 32))) (Undefined!2651) (MissingVacant!2651 (index!12783 (_ BitVec 32))) )
))
(declare-fun lt!152662 () SeekEntryResult!2651)

(declare-fun lt!152660 () SeekEntryResult!2651)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311905 (= res!168410 (and (= lt!152660 lt!152662) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7546 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15929 (_ BitVec 32)) SeekEntryResult!2651)

(assert (=> b!311905 (= lt!152660 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311906 () Bool)

(declare-fun e!194547 () Bool)

(assert (=> b!311906 (= e!194543 (not e!194547))))

(declare-fun res!168416 () Bool)

(assert (=> b!311906 (=> res!168416 e!194547)))

(declare-fun lt!152666 () (_ BitVec 32))

(declare-fun lt!152665 () SeekEntryResult!2651)

(assert (=> b!311906 (= res!168416 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152666 #b00000000000000000000000000000000) (bvsge lt!152666 (size!7898 a!3293)) (not (= lt!152665 lt!152662))))))

(declare-fun lt!152664 () SeekEntryResult!2651)

(declare-fun lt!152663 () SeekEntryResult!2651)

(assert (=> b!311906 (= lt!152664 lt!152663)))

(declare-fun lt!152661 () array!15929)

(assert (=> b!311906 (= lt!152663 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152666 k0!2441 lt!152661 mask!3709))))

(assert (=> b!311906 (= lt!152664 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152661 mask!3709))))

(assert (=> b!311906 (= lt!152661 (array!15930 (store (arr!7546 a!3293) i!1240 k0!2441) (size!7898 a!3293)))))

(assert (=> b!311906 (= lt!152660 lt!152665)))

(assert (=> b!311906 (= lt!152665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152666 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311906 (= lt!152666 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311907 () Bool)

(declare-fun res!168411 () Bool)

(assert (=> b!311907 (=> (not res!168411) (not e!194544))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15929 (_ BitVec 32)) SeekEntryResult!2651)

(assert (=> b!311907 (= res!168411 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2651 i!1240)))))

(declare-fun b!311908 () Bool)

(declare-fun res!168417 () Bool)

(assert (=> b!311908 (=> (not res!168417) (not e!194545))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311908 (= res!168417 (and (= (select (arr!7546 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7898 a!3293))))))

(declare-fun b!311909 () Bool)

(declare-fun res!168413 () Bool)

(assert (=> b!311909 (=> (not res!168413) (not e!194544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311909 (= res!168413 (validKeyInArray!0 k0!2441))))

(declare-fun b!311910 () Bool)

(declare-fun res!168415 () Bool)

(assert (=> b!311910 (=> (not res!168415) (not e!194544))))

(declare-fun arrayContainsKey!0 (array!15929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311910 (= res!168415 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311911 () Bool)

(assert (=> b!311911 (= e!194547 true)))

(assert (=> b!311911 (= lt!152663 lt!152665)))

(declare-datatypes ((Unit!9563 0))(
  ( (Unit!9564) )
))
(declare-fun lt!152667 () Unit!9563)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9563)

(assert (=> b!311911 (= lt!152667 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152666 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311912 () Bool)

(declare-fun res!168409 () Bool)

(assert (=> b!311912 (=> (not res!168409) (not e!194544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15929 (_ BitVec 32)) Bool)

(assert (=> b!311912 (= res!168409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311913 () Bool)

(assert (=> b!311913 (= e!194544 e!194545)))

(declare-fun res!168408 () Bool)

(assert (=> b!311913 (=> (not res!168408) (not e!194545))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311913 (= res!168408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152662))))

(assert (=> b!311913 (= lt!152662 (Intermediate!2651 false resIndex!52 resX!52))))

(assert (= (and start!31014 res!168412) b!311904))

(assert (= (and b!311904 res!168414) b!311909))

(assert (= (and b!311909 res!168413) b!311910))

(assert (= (and b!311910 res!168415) b!311907))

(assert (= (and b!311907 res!168411) b!311912))

(assert (= (and b!311912 res!168409) b!311913))

(assert (= (and b!311913 res!168408) b!311908))

(assert (= (and b!311908 res!168417) b!311905))

(assert (= (and b!311905 res!168410) b!311906))

(assert (= (and b!311906 (not res!168416)) b!311911))

(declare-fun m!322111 () Bool)

(assert (=> b!311913 m!322111))

(assert (=> b!311913 m!322111))

(declare-fun m!322113 () Bool)

(assert (=> b!311913 m!322113))

(declare-fun m!322115 () Bool)

(assert (=> start!31014 m!322115))

(declare-fun m!322117 () Bool)

(assert (=> start!31014 m!322117))

(declare-fun m!322119 () Bool)

(assert (=> b!311905 m!322119))

(declare-fun m!322121 () Bool)

(assert (=> b!311905 m!322121))

(declare-fun m!322123 () Bool)

(assert (=> b!311911 m!322123))

(declare-fun m!322125 () Bool)

(assert (=> b!311907 m!322125))

(declare-fun m!322127 () Bool)

(assert (=> b!311908 m!322127))

(declare-fun m!322129 () Bool)

(assert (=> b!311912 m!322129))

(declare-fun m!322131 () Bool)

(assert (=> b!311910 m!322131))

(declare-fun m!322133 () Bool)

(assert (=> b!311909 m!322133))

(declare-fun m!322135 () Bool)

(assert (=> b!311906 m!322135))

(declare-fun m!322137 () Bool)

(assert (=> b!311906 m!322137))

(declare-fun m!322139 () Bool)

(assert (=> b!311906 m!322139))

(declare-fun m!322141 () Bool)

(assert (=> b!311906 m!322141))

(declare-fun m!322143 () Bool)

(assert (=> b!311906 m!322143))

(check-sat (not b!311909) (not b!311907) (not b!311906) (not b!311911) (not b!311910) (not b!311905) (not b!311912) (not start!31014) (not b!311913))
(check-sat)
