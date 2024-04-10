; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29146 () Bool)

(assert start!29146)

(declare-fun b!295703 () Bool)

(declare-fun res!155512 () Bool)

(declare-fun e!186897 () Bool)

(assert (=> b!295703 (=> (not res!155512) (not e!186897))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295703 (= res!155512 (validKeyInArray!0 k!2524))))

(declare-fun b!295704 () Bool)

(declare-fun e!186898 () Bool)

(assert (=> b!295704 (= e!186897 e!186898)))

(declare-fun res!155511 () Bool)

(assert (=> b!295704 (=> (not res!155511) (not e!186898))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146665 () Bool)

(declare-datatypes ((SeekEntryResult!2234 0))(
  ( (MissingZero!2234 (index!11106 (_ BitVec 32))) (Found!2234 (index!11107 (_ BitVec 32))) (Intermediate!2234 (undefined!3046 Bool) (index!11108 (_ BitVec 32)) (x!29326 (_ BitVec 32))) (Undefined!2234) (MissingVacant!2234 (index!11109 (_ BitVec 32))) )
))
(declare-fun lt!146666 () SeekEntryResult!2234)

(assert (=> b!295704 (= res!155511 (or lt!146665 (= lt!146666 (MissingVacant!2234 i!1256))))))

(assert (=> b!295704 (= lt!146665 (= lt!146666 (MissingZero!2234 i!1256)))))

(declare-datatypes ((array!14949 0))(
  ( (array!14950 (arr!7085 (Array (_ BitVec 32) (_ BitVec 64))) (size!7437 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14949)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14949 (_ BitVec 32)) SeekEntryResult!2234)

(assert (=> b!295704 (= lt!146666 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295705 () Bool)

(declare-fun res!155517 () Bool)

(assert (=> b!295705 (=> (not res!155517) (not e!186897))))

(assert (=> b!295705 (= res!155517 (and (= (size!7437 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7437 a!3312))))))

(declare-fun b!295706 () Bool)

(declare-fun e!186900 () Bool)

(assert (=> b!295706 (= e!186900 (not true))))

(declare-fun lt!146664 () SeekEntryResult!2234)

(assert (=> b!295706 (and (= (select (arr!7085 a!3312) (index!11108 lt!146664)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11108 lt!146664) i!1256))))

(declare-fun b!295707 () Bool)

(declare-fun e!186899 () Bool)

(assert (=> b!295707 (= e!186898 e!186899)))

(declare-fun res!155516 () Bool)

(assert (=> b!295707 (=> (not res!155516) (not e!186899))))

(assert (=> b!295707 (= res!155516 lt!146665)))

(declare-fun lt!146667 () SeekEntryResult!2234)

(declare-fun lt!146663 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14949 (_ BitVec 32)) SeekEntryResult!2234)

(assert (=> b!295707 (= lt!146667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146663 k!2524 (array!14950 (store (arr!7085 a!3312) i!1256 k!2524) (size!7437 a!3312)) mask!3809))))

(assert (=> b!295707 (= lt!146664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146663 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295707 (= lt!146663 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295702 () Bool)

(assert (=> b!295702 (= e!186899 e!186900)))

(declare-fun res!155513 () Bool)

(assert (=> b!295702 (=> (not res!155513) (not e!186900))))

(declare-fun lt!146662 () Bool)

(assert (=> b!295702 (= res!155513 (and (or lt!146662 (not (undefined!3046 lt!146664))) (or lt!146662 (not (= (select (arr!7085 a!3312) (index!11108 lt!146664)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146662 (not (= (select (arr!7085 a!3312) (index!11108 lt!146664)) k!2524))) (not lt!146662)))))

(assert (=> b!295702 (= lt!146662 (not (is-Intermediate!2234 lt!146664)))))

(declare-fun res!155515 () Bool)

(assert (=> start!29146 (=> (not res!155515) (not e!186897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29146 (= res!155515 (validMask!0 mask!3809))))

(assert (=> start!29146 e!186897))

(assert (=> start!29146 true))

(declare-fun array_inv!5048 (array!14949) Bool)

(assert (=> start!29146 (array_inv!5048 a!3312)))

(declare-fun b!295708 () Bool)

(declare-fun res!155514 () Bool)

(assert (=> b!295708 (=> (not res!155514) (not e!186898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14949 (_ BitVec 32)) Bool)

(assert (=> b!295708 (= res!155514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295709 () Bool)

(declare-fun res!155510 () Bool)

(assert (=> b!295709 (=> (not res!155510) (not e!186897))))

(declare-fun arrayContainsKey!0 (array!14949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295709 (= res!155510 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29146 res!155515) b!295705))

(assert (= (and b!295705 res!155517) b!295703))

(assert (= (and b!295703 res!155512) b!295709))

(assert (= (and b!295709 res!155510) b!295704))

(assert (= (and b!295704 res!155511) b!295708))

(assert (= (and b!295708 res!155514) b!295707))

(assert (= (and b!295707 res!155516) b!295702))

(assert (= (and b!295702 res!155513) b!295706))

(declare-fun m!308787 () Bool)

(assert (=> b!295709 m!308787))

(declare-fun m!308789 () Bool)

(assert (=> b!295703 m!308789))

(declare-fun m!308791 () Bool)

(assert (=> b!295702 m!308791))

(assert (=> b!295706 m!308791))

(declare-fun m!308793 () Bool)

(assert (=> b!295704 m!308793))

(declare-fun m!308795 () Bool)

(assert (=> b!295708 m!308795))

(declare-fun m!308797 () Bool)

(assert (=> b!295707 m!308797))

(declare-fun m!308799 () Bool)

(assert (=> b!295707 m!308799))

(declare-fun m!308801 () Bool)

(assert (=> b!295707 m!308801))

(declare-fun m!308803 () Bool)

(assert (=> b!295707 m!308803))

(declare-fun m!308805 () Bool)

(assert (=> start!29146 m!308805))

(declare-fun m!308807 () Bool)

(assert (=> start!29146 m!308807))

(push 1)

