; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28074 () Bool)

(assert start!28074)

(declare-fun b!287691 () Bool)

(declare-fun res!149459 () Bool)

(declare-fun e!182195 () Bool)

(assert (=> b!287691 (=> (not res!149459) (not e!182195))))

(declare-datatypes ((array!14433 0))(
  ( (array!14434 (arr!6845 (Array (_ BitVec 32) (_ BitVec 64))) (size!7197 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14433)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287691 (= res!149459 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149460 () Bool)

(assert (=> start!28074 (=> (not res!149460) (not e!182195))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28074 (= res!149460 (validMask!0 mask!3809))))

(assert (=> start!28074 e!182195))

(assert (=> start!28074 true))

(declare-fun array_inv!4808 (array!14433) Bool)

(assert (=> start!28074 (array_inv!4808 a!3312)))

(declare-fun b!287692 () Bool)

(declare-fun res!149456 () Bool)

(declare-fun e!182193 () Bool)

(assert (=> b!287692 (=> (not res!149456) (not e!182193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14433 (_ BitVec 32)) Bool)

(assert (=> b!287692 (= res!149456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287693 () Bool)

(assert (=> b!287693 (= e!182195 e!182193)))

(declare-fun res!149458 () Bool)

(assert (=> b!287693 (=> (not res!149458) (not e!182193))))

(declare-datatypes ((SeekEntryResult!1994 0))(
  ( (MissingZero!1994 (index!10146 (_ BitVec 32))) (Found!1994 (index!10147 (_ BitVec 32))) (Intermediate!1994 (undefined!2806 Bool) (index!10148 (_ BitVec 32)) (x!28369 (_ BitVec 32))) (Undefined!1994) (MissingVacant!1994 (index!10149 (_ BitVec 32))) )
))
(declare-fun lt!141621 () SeekEntryResult!1994)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287693 (= res!149458 (or (= lt!141621 (MissingZero!1994 i!1256)) (= lt!141621 (MissingVacant!1994 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14433 (_ BitVec 32)) SeekEntryResult!1994)

(assert (=> b!287693 (= lt!141621 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287694 () Bool)

(declare-fun res!149457 () Bool)

(assert (=> b!287694 (=> (not res!149457) (not e!182195))))

(assert (=> b!287694 (= res!149457 (and (= (size!7197 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7197 a!3312))))))

(declare-fun b!287695 () Bool)

(assert (=> b!287695 (= e!182193 false)))

(declare-fun lt!141622 () SeekEntryResult!1994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14433 (_ BitVec 32)) SeekEntryResult!1994)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287695 (= lt!141622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287696 () Bool)

(declare-fun res!149455 () Bool)

(assert (=> b!287696 (=> (not res!149455) (not e!182195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287696 (= res!149455 (validKeyInArray!0 k!2524))))

(assert (= (and start!28074 res!149460) b!287694))

(assert (= (and b!287694 res!149457) b!287696))

(assert (= (and b!287696 res!149455) b!287691))

(assert (= (and b!287691 res!149459) b!287693))

(assert (= (and b!287693 res!149458) b!287692))

(assert (= (and b!287692 res!149456) b!287695))

(declare-fun m!302025 () Bool)

(assert (=> b!287695 m!302025))

(assert (=> b!287695 m!302025))

(declare-fun m!302027 () Bool)

(assert (=> b!287695 m!302027))

(declare-fun m!302029 () Bool)

(assert (=> b!287696 m!302029))

(declare-fun m!302031 () Bool)

(assert (=> start!28074 m!302031))

(declare-fun m!302033 () Bool)

(assert (=> start!28074 m!302033))

(declare-fun m!302035 () Bool)

(assert (=> b!287692 m!302035))

(declare-fun m!302037 () Bool)

(assert (=> b!287691 m!302037))

(declare-fun m!302039 () Bool)

(assert (=> b!287693 m!302039))

(push 1)

