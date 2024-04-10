; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31052 () Bool)

(assert start!31052)

(declare-fun b!312317 () Bool)

(declare-fun res!168773 () Bool)

(declare-fun e!194759 () Bool)

(assert (=> b!312317 (=> (not res!168773) (not e!194759))))

(declare-datatypes ((array!15954 0))(
  ( (array!15955 (arr!7559 (Array (_ BitVec 32) (_ BitVec 64))) (size!7911 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15954)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2699 0))(
  ( (MissingZero!2699 (index!12972 (_ BitVec 32))) (Found!2699 (index!12973 (_ BitVec 32))) (Intermediate!2699 (undefined!3511 Bool) (index!12974 (_ BitVec 32)) (x!31184 (_ BitVec 32))) (Undefined!2699) (MissingVacant!2699 (index!12975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15954 (_ BitVec 32)) SeekEntryResult!2699)

(assert (=> b!312317 (= res!168773 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2699 i!1240)))))

(declare-fun b!312318 () Bool)

(declare-fun res!168779 () Bool)

(assert (=> b!312318 (=> (not res!168779) (not e!194759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312318 (= res!168779 (validKeyInArray!0 k!2441))))

(declare-fun b!312319 () Bool)

(declare-fun res!168771 () Bool)

(declare-fun e!194758 () Bool)

(assert (=> b!312319 (=> (not res!168771) (not e!194758))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312319 (= res!168771 (and (= (select (arr!7559 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7911 a!3293))))))

(declare-fun b!312320 () Bool)

(declare-fun res!168772 () Bool)

(assert (=> b!312320 (=> (not res!168772) (not e!194759))))

(assert (=> b!312320 (= res!168772 (and (= (size!7911 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7911 a!3293))))))

(declare-fun b!312321 () Bool)

(declare-fun e!194761 () Bool)

(declare-fun e!194757 () Bool)

(assert (=> b!312321 (= e!194761 (not e!194757))))

(declare-fun res!168776 () Bool)

(assert (=> b!312321 (=> res!168776 e!194757)))

(declare-fun lt!152935 () SeekEntryResult!2699)

(declare-fun lt!152932 () (_ BitVec 32))

(declare-fun lt!152936 () SeekEntryResult!2699)

(assert (=> b!312321 (= res!168776 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152932 #b00000000000000000000000000000000) (bvsge lt!152932 (size!7911 a!3293)) (not (= lt!152935 lt!152936))))))

(declare-fun lt!152930 () SeekEntryResult!2699)

(declare-fun lt!152934 () SeekEntryResult!2699)

(assert (=> b!312321 (= lt!152930 lt!152934)))

(declare-fun lt!152933 () array!15954)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15954 (_ BitVec 32)) SeekEntryResult!2699)

(assert (=> b!312321 (= lt!152934 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152932 k!2441 lt!152933 mask!3709))))

(assert (=> b!312321 (= lt!152930 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152933 mask!3709))))

(assert (=> b!312321 (= lt!152933 (array!15955 (store (arr!7559 a!3293) i!1240 k!2441) (size!7911 a!3293)))))

(declare-fun lt!152931 () SeekEntryResult!2699)

(assert (=> b!312321 (= lt!152931 lt!152935)))

(assert (=> b!312321 (= lt!152935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152932 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312321 (= lt!152932 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312322 () Bool)

(assert (=> b!312322 (= e!194758 e!194761)))

(declare-fun res!168774 () Bool)

(assert (=> b!312322 (=> (not res!168774) (not e!194761))))

(assert (=> b!312322 (= res!168774 (and (= lt!152931 lt!152936) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7559 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312322 (= lt!152931 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312323 () Bool)

(assert (=> b!312323 (= e!194757 true)))

(assert (=> b!312323 (= lt!152934 lt!152935)))

(declare-datatypes ((Unit!9629 0))(
  ( (Unit!9630) )
))
(declare-fun lt!152937 () Unit!9629)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15954 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9629)

(assert (=> b!312323 (= lt!152937 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152932 resIndex!52 resX!52 mask!3709))))

(declare-fun res!168775 () Bool)

(assert (=> start!31052 (=> (not res!168775) (not e!194759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31052 (= res!168775 (validMask!0 mask!3709))))

(assert (=> start!31052 e!194759))

(declare-fun array_inv!5522 (array!15954) Bool)

(assert (=> start!31052 (array_inv!5522 a!3293)))

(assert (=> start!31052 true))

(declare-fun b!312324 () Bool)

(declare-fun res!168778 () Bool)

(assert (=> b!312324 (=> (not res!168778) (not e!194759))))

(declare-fun arrayContainsKey!0 (array!15954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312324 (= res!168778 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312325 () Bool)

(declare-fun res!168777 () Bool)

(assert (=> b!312325 (=> (not res!168777) (not e!194759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15954 (_ BitVec 32)) Bool)

(assert (=> b!312325 (= res!168777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312326 () Bool)

(assert (=> b!312326 (= e!194759 e!194758)))

(declare-fun res!168780 () Bool)

(assert (=> b!312326 (=> (not res!168780) (not e!194758))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312326 (= res!168780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152936))))

(assert (=> b!312326 (= lt!152936 (Intermediate!2699 false resIndex!52 resX!52))))

(assert (= (and start!31052 res!168775) b!312320))

(assert (= (and b!312320 res!168772) b!312318))

(assert (= (and b!312318 res!168779) b!312324))

(assert (= (and b!312324 res!168778) b!312317))

(assert (= (and b!312317 res!168773) b!312325))

(assert (= (and b!312325 res!168777) b!312326))

(assert (= (and b!312326 res!168780) b!312319))

(assert (= (and b!312319 res!168771) b!312322))

(assert (= (and b!312322 res!168774) b!312321))

(assert (= (and b!312321 (not res!168776)) b!312323))

(declare-fun m!322385 () Bool)

(assert (=> b!312324 m!322385))

(declare-fun m!322387 () Bool)

(assert (=> b!312322 m!322387))

(declare-fun m!322389 () Bool)

(assert (=> b!312322 m!322389))

(declare-fun m!322391 () Bool)

(assert (=> b!312318 m!322391))

(declare-fun m!322393 () Bool)

(assert (=> b!312319 m!322393))

(declare-fun m!322395 () Bool)

(assert (=> b!312325 m!322395))

(declare-fun m!322397 () Bool)

(assert (=> b!312323 m!322397))

(declare-fun m!322399 () Bool)

(assert (=> b!312317 m!322399))

(declare-fun m!322401 () Bool)

(assert (=> b!312321 m!322401))

(declare-fun m!322403 () Bool)

(assert (=> b!312321 m!322403))

(declare-fun m!322405 () Bool)

(assert (=> b!312321 m!322405))

(declare-fun m!322407 () Bool)

(assert (=> b!312321 m!322407))

(declare-fun m!322409 () Bool)

(assert (=> b!312321 m!322409))

(declare-fun m!322411 () Bool)

(assert (=> start!31052 m!322411))

(declare-fun m!322413 () Bool)

(assert (=> start!31052 m!322413))

(declare-fun m!322415 () Bool)

(assert (=> b!312326 m!322415))

(assert (=> b!312326 m!322415))

(declare-fun m!322417 () Bool)

(assert (=> b!312326 m!322417))

(push 1)

