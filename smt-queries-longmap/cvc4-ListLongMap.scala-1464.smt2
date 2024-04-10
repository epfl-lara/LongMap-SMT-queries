; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28174 () Bool)

(assert start!28174)

(declare-fun b!288445 () Bool)

(declare-fun e!182633 () Bool)

(declare-fun e!182629 () Bool)

(assert (=> b!288445 (= e!182633 e!182629)))

(declare-fun res!150073 () Bool)

(assert (=> b!288445 (=> (not res!150073) (not e!182629))))

(declare-fun lt!142089 () Bool)

(assert (=> b!288445 (= res!150073 lt!142089)))

(declare-fun lt!142088 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2020 0))(
  ( (MissingZero!2020 (index!10250 (_ BitVec 32))) (Found!2020 (index!10251 (_ BitVec 32))) (Intermediate!2020 (undefined!2832 Bool) (index!10252 (_ BitVec 32)) (x!28465 (_ BitVec 32))) (Undefined!2020) (MissingVacant!2020 (index!10253 (_ BitVec 32))) )
))
(declare-fun lt!142090 () SeekEntryResult!2020)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14488 0))(
  ( (array!14489 (arr!6871 (Array (_ BitVec 32) (_ BitVec 64))) (size!7223 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14488)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14488 (_ BitVec 32)) SeekEntryResult!2020)

(assert (=> b!288445 (= lt!142090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142088 k!2524 (array!14489 (store (arr!6871 a!3312) i!1256 k!2524) (size!7223 a!3312)) mask!3809))))

(declare-fun lt!142086 () SeekEntryResult!2020)

(assert (=> b!288445 (= lt!142086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142088 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288445 (= lt!142088 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!150075 () Bool)

(declare-fun e!182631 () Bool)

(assert (=> start!28174 (=> (not res!150075) (not e!182631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28174 (= res!150075 (validMask!0 mask!3809))))

(assert (=> start!28174 e!182631))

(assert (=> start!28174 true))

(declare-fun array_inv!4834 (array!14488) Bool)

(assert (=> start!28174 (array_inv!4834 a!3312)))

(declare-fun b!288446 () Bool)

(declare-fun res!150068 () Bool)

(assert (=> b!288446 (=> (not res!150068) (not e!182631))))

(declare-fun arrayContainsKey!0 (array!14488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288446 (= res!150068 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288447 () Bool)

(declare-fun e!182632 () Bool)

(assert (=> b!288447 (= e!182629 e!182632)))

(declare-fun res!150071 () Bool)

(assert (=> b!288447 (=> (not res!150071) (not e!182632))))

(declare-fun lt!142085 () Bool)

(assert (=> b!288447 (= res!150071 (and (or lt!142085 (not (undefined!2832 lt!142086))) (or lt!142085 (not (= (select (arr!6871 a!3312) (index!10252 lt!142086)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142085 (not (= (select (arr!6871 a!3312) (index!10252 lt!142086)) k!2524))) (not lt!142085)))))

(assert (=> b!288447 (= lt!142085 (not (is-Intermediate!2020 lt!142086)))))

(declare-fun b!288448 () Bool)

(assert (=> b!288448 (= e!182631 e!182633)))

(declare-fun res!150069 () Bool)

(assert (=> b!288448 (=> (not res!150069) (not e!182633))))

(declare-fun lt!142087 () SeekEntryResult!2020)

(assert (=> b!288448 (= res!150069 (or lt!142089 (= lt!142087 (MissingVacant!2020 i!1256))))))

(assert (=> b!288448 (= lt!142089 (= lt!142087 (MissingZero!2020 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14488 (_ BitVec 32)) SeekEntryResult!2020)

(assert (=> b!288448 (= lt!142087 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288449 () Bool)

(declare-fun res!150070 () Bool)

(assert (=> b!288449 (=> (not res!150070) (not e!182631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288449 (= res!150070 (validKeyInArray!0 k!2524))))

(declare-fun b!288450 () Bool)

(declare-fun res!150074 () Bool)

(assert (=> b!288450 (=> (not res!150074) (not e!182631))))

(assert (=> b!288450 (= res!150074 (and (= (size!7223 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7223 a!3312))))))

(declare-fun b!288451 () Bool)

(assert (=> b!288451 (= e!182632 (not true))))

(assert (=> b!288451 (and (= (select (arr!6871 a!3312) (index!10252 lt!142086)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10252 lt!142086) i!1256))))

(declare-fun b!288452 () Bool)

(declare-fun res!150072 () Bool)

(assert (=> b!288452 (=> (not res!150072) (not e!182633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14488 (_ BitVec 32)) Bool)

(assert (=> b!288452 (= res!150072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28174 res!150075) b!288450))

(assert (= (and b!288450 res!150074) b!288449))

(assert (= (and b!288449 res!150070) b!288446))

(assert (= (and b!288446 res!150068) b!288448))

(assert (= (and b!288448 res!150069) b!288452))

(assert (= (and b!288452 res!150072) b!288445))

(assert (= (and b!288445 res!150073) b!288447))

(assert (= (and b!288447 res!150071) b!288451))

(declare-fun m!302675 () Bool)

(assert (=> b!288451 m!302675))

(assert (=> b!288447 m!302675))

(declare-fun m!302677 () Bool)

(assert (=> b!288446 m!302677))

(declare-fun m!302679 () Bool)

(assert (=> b!288445 m!302679))

(declare-fun m!302681 () Bool)

(assert (=> b!288445 m!302681))

(declare-fun m!302683 () Bool)

(assert (=> b!288445 m!302683))

(declare-fun m!302685 () Bool)

(assert (=> b!288445 m!302685))

(declare-fun m!302687 () Bool)

(assert (=> start!28174 m!302687))

(declare-fun m!302689 () Bool)

(assert (=> start!28174 m!302689))

(declare-fun m!302691 () Bool)

(assert (=> b!288448 m!302691))

(declare-fun m!302693 () Bool)

(assert (=> b!288452 m!302693))

(declare-fun m!302695 () Bool)

(assert (=> b!288449 m!302695))

(push 1)

