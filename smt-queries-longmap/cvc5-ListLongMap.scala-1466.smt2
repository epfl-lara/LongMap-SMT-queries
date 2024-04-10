; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28182 () Bool)

(assert start!28182)

(declare-fun b!288541 () Bool)

(declare-fun e!182690 () Bool)

(declare-fun e!182689 () Bool)

(assert (=> b!288541 (= e!182690 e!182689)))

(declare-fun res!150167 () Bool)

(assert (=> b!288541 (=> (not res!150167) (not e!182689))))

(declare-fun lt!142157 () Bool)

(assert (=> b!288541 (= res!150167 lt!142157)))

(declare-fun lt!142162 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14496 0))(
  ( (array!14497 (arr!6875 (Array (_ BitVec 32) (_ BitVec 64))) (size!7227 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14496)

(declare-datatypes ((SeekEntryResult!2024 0))(
  ( (MissingZero!2024 (index!10266 (_ BitVec 32))) (Found!2024 (index!10267 (_ BitVec 32))) (Intermediate!2024 (undefined!2836 Bool) (index!10268 (_ BitVec 32)) (x!28485 (_ BitVec 32))) (Undefined!2024) (MissingVacant!2024 (index!10269 (_ BitVec 32))) )
))
(declare-fun lt!142160 () SeekEntryResult!2024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14496 (_ BitVec 32)) SeekEntryResult!2024)

(assert (=> b!288541 (= lt!142160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142162 k!2524 (array!14497 (store (arr!6875 a!3312) i!1256 k!2524) (size!7227 a!3312)) mask!3809))))

(declare-fun lt!142159 () SeekEntryResult!2024)

(assert (=> b!288541 (= lt!142159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142162 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288541 (= lt!142162 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288542 () Bool)

(declare-fun e!182691 () Bool)

(assert (=> b!288542 (= e!182691 (not true))))

(assert (=> b!288542 (and (= (select (arr!6875 a!3312) (index!10268 lt!142159)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10268 lt!142159) i!1256))))

(declare-fun b!288543 () Bool)

(declare-fun res!150171 () Bool)

(declare-fun e!182693 () Bool)

(assert (=> b!288543 (=> (not res!150171) (not e!182693))))

(assert (=> b!288543 (= res!150171 (and (= (size!7227 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7227 a!3312))))))

(declare-fun b!288544 () Bool)

(declare-fun res!150164 () Bool)

(assert (=> b!288544 (=> (not res!150164) (not e!182693))))

(declare-fun arrayContainsKey!0 (array!14496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288544 (= res!150164 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288545 () Bool)

(assert (=> b!288545 (= e!182689 e!182691)))

(declare-fun res!150168 () Bool)

(assert (=> b!288545 (=> (not res!150168) (not e!182691))))

(declare-fun lt!142158 () Bool)

(assert (=> b!288545 (= res!150168 (and (or lt!142158 (not (undefined!2836 lt!142159))) (or lt!142158 (not (= (select (arr!6875 a!3312) (index!10268 lt!142159)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142158 (not (= (select (arr!6875 a!3312) (index!10268 lt!142159)) k!2524))) (not lt!142158)))))

(assert (=> b!288545 (= lt!142158 (not (is-Intermediate!2024 lt!142159)))))

(declare-fun b!288546 () Bool)

(assert (=> b!288546 (= e!182693 e!182690)))

(declare-fun res!150170 () Bool)

(assert (=> b!288546 (=> (not res!150170) (not e!182690))))

(declare-fun lt!142161 () SeekEntryResult!2024)

(assert (=> b!288546 (= res!150170 (or lt!142157 (= lt!142161 (MissingVacant!2024 i!1256))))))

(assert (=> b!288546 (= lt!142157 (= lt!142161 (MissingZero!2024 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14496 (_ BitVec 32)) SeekEntryResult!2024)

(assert (=> b!288546 (= lt!142161 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288548 () Bool)

(declare-fun res!150165 () Bool)

(assert (=> b!288548 (=> (not res!150165) (not e!182693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288548 (= res!150165 (validKeyInArray!0 k!2524))))

(declare-fun res!150166 () Bool)

(assert (=> start!28182 (=> (not res!150166) (not e!182693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28182 (= res!150166 (validMask!0 mask!3809))))

(assert (=> start!28182 e!182693))

(assert (=> start!28182 true))

(declare-fun array_inv!4838 (array!14496) Bool)

(assert (=> start!28182 (array_inv!4838 a!3312)))

(declare-fun b!288547 () Bool)

(declare-fun res!150169 () Bool)

(assert (=> b!288547 (=> (not res!150169) (not e!182690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14496 (_ BitVec 32)) Bool)

(assert (=> b!288547 (= res!150169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28182 res!150166) b!288543))

(assert (= (and b!288543 res!150171) b!288548))

(assert (= (and b!288548 res!150165) b!288544))

(assert (= (and b!288544 res!150164) b!288546))

(assert (= (and b!288546 res!150170) b!288547))

(assert (= (and b!288547 res!150169) b!288541))

(assert (= (and b!288541 res!150167) b!288545))

(assert (= (and b!288545 res!150168) b!288542))

(declare-fun m!302763 () Bool)

(assert (=> b!288548 m!302763))

(declare-fun m!302765 () Bool)

(assert (=> b!288546 m!302765))

(declare-fun m!302767 () Bool)

(assert (=> b!288544 m!302767))

(declare-fun m!302769 () Bool)

(assert (=> start!28182 m!302769))

(declare-fun m!302771 () Bool)

(assert (=> start!28182 m!302771))

(declare-fun m!302773 () Bool)

(assert (=> b!288542 m!302773))

(declare-fun m!302775 () Bool)

(assert (=> b!288547 m!302775))

(declare-fun m!302777 () Bool)

(assert (=> b!288541 m!302777))

(declare-fun m!302779 () Bool)

(assert (=> b!288541 m!302779))

(declare-fun m!302781 () Bool)

(assert (=> b!288541 m!302781))

(declare-fun m!302783 () Bool)

(assert (=> b!288541 m!302783))

(assert (=> b!288545 m!302773))

(push 1)

