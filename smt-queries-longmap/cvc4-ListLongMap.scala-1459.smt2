; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28096 () Bool)

(assert start!28096)

(declare-fun res!149654 () Bool)

(declare-fun e!182292 () Bool)

(assert (=> start!28096 (=> (not res!149654) (not e!182292))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28096 (= res!149654 (validMask!0 mask!3809))))

(assert (=> start!28096 e!182292))

(assert (=> start!28096 true))

(declare-datatypes ((array!14455 0))(
  ( (array!14456 (arr!6856 (Array (_ BitVec 32) (_ BitVec 64))) (size!7208 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14455)

(declare-fun array_inv!4819 (array!14455) Bool)

(assert (=> start!28096 (array_inv!4819 a!3312)))

(declare-fun b!287889 () Bool)

(declare-fun res!149656 () Bool)

(declare-fun e!182293 () Bool)

(assert (=> b!287889 (=> (not res!149656) (not e!182293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14455 (_ BitVec 32)) Bool)

(assert (=> b!287889 (= res!149656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287890 () Bool)

(declare-fun res!149653 () Bool)

(assert (=> b!287890 (=> (not res!149653) (not e!182292))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287890 (= res!149653 (validKeyInArray!0 k!2524))))

(declare-fun b!287891 () Bool)

(declare-fun res!149655 () Bool)

(assert (=> b!287891 (=> (not res!149655) (not e!182292))))

(declare-fun arrayContainsKey!0 (array!14455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287891 (= res!149655 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287892 () Bool)

(assert (=> b!287892 (= e!182293 false)))

(declare-datatypes ((SeekEntryResult!2005 0))(
  ( (MissingZero!2005 (index!10190 (_ BitVec 32))) (Found!2005 (index!10191 (_ BitVec 32))) (Intermediate!2005 (undefined!2817 Bool) (index!10192 (_ BitVec 32)) (x!28404 (_ BitVec 32))) (Undefined!2005) (MissingVacant!2005 (index!10193 (_ BitVec 32))) )
))
(declare-fun lt!141739 () SeekEntryResult!2005)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!141740 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14455 (_ BitVec 32)) SeekEntryResult!2005)

(assert (=> b!287892 (= lt!141739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141740 k!2524 (array!14456 (store (arr!6856 a!3312) i!1256 k!2524) (size!7208 a!3312)) mask!3809))))

(declare-fun lt!141741 () SeekEntryResult!2005)

(assert (=> b!287892 (= lt!141741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141740 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287892 (= lt!141740 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287893 () Bool)

(declare-fun res!149658 () Bool)

(assert (=> b!287893 (=> (not res!149658) (not e!182292))))

(assert (=> b!287893 (= res!149658 (and (= (size!7208 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7208 a!3312))))))

(declare-fun b!287894 () Bool)

(assert (=> b!287894 (= e!182292 e!182293)))

(declare-fun res!149657 () Bool)

(assert (=> b!287894 (=> (not res!149657) (not e!182293))))

(declare-fun lt!141742 () SeekEntryResult!2005)

(assert (=> b!287894 (= res!149657 (or (= lt!141742 (MissingZero!2005 i!1256)) (= lt!141742 (MissingVacant!2005 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14455 (_ BitVec 32)) SeekEntryResult!2005)

(assert (=> b!287894 (= lt!141742 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28096 res!149654) b!287893))

(assert (= (and b!287893 res!149658) b!287890))

(assert (= (and b!287890 res!149653) b!287891))

(assert (= (and b!287891 res!149655) b!287894))

(assert (= (and b!287894 res!149657) b!287889))

(assert (= (and b!287889 res!149656) b!287892))

(declare-fun m!302233 () Bool)

(assert (=> start!28096 m!302233))

(declare-fun m!302235 () Bool)

(assert (=> start!28096 m!302235))

(declare-fun m!302237 () Bool)

(assert (=> b!287890 m!302237))

(declare-fun m!302239 () Bool)

(assert (=> b!287894 m!302239))

(declare-fun m!302241 () Bool)

(assert (=> b!287891 m!302241))

(declare-fun m!302243 () Bool)

(assert (=> b!287889 m!302243))

(declare-fun m!302245 () Bool)

(assert (=> b!287892 m!302245))

(declare-fun m!302247 () Bool)

(assert (=> b!287892 m!302247))

(declare-fun m!302249 () Bool)

(assert (=> b!287892 m!302249))

(declare-fun m!302251 () Bool)

(assert (=> b!287892 m!302251))

(push 1)

(assert (not b!287889))

(assert (not start!28096))

(assert (not b!287892))

(assert (not b!287890))

(assert (not b!287891))

(assert (not b!287894))

(check-sat)

(pop 1)

