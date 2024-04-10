; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28214 () Bool)

(assert start!28214)

(declare-fun b!288925 () Bool)

(declare-fun res!150551 () Bool)

(declare-fun e!182931 () Bool)

(assert (=> b!288925 (=> (not res!150551) (not e!182931))))

(declare-datatypes ((array!14528 0))(
  ( (array!14529 (arr!6891 (Array (_ BitVec 32) (_ BitVec 64))) (size!7243 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14528)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14528 (_ BitVec 32)) Bool)

(assert (=> b!288925 (= res!150551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288926 () Bool)

(declare-fun e!182930 () Bool)

(assert (=> b!288926 (= e!182930 e!182931)))

(declare-fun res!150550 () Bool)

(assert (=> b!288926 (=> (not res!150550) (not e!182931))))

(declare-datatypes ((SeekEntryResult!2040 0))(
  ( (MissingZero!2040 (index!10330 (_ BitVec 32))) (Found!2040 (index!10331 (_ BitVec 32))) (Intermediate!2040 (undefined!2852 Bool) (index!10332 (_ BitVec 32)) (x!28541 (_ BitVec 32))) (Undefined!2040) (MissingVacant!2040 (index!10333 (_ BitVec 32))) )
))
(declare-fun lt!142446 () SeekEntryResult!2040)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142449 () Bool)

(assert (=> b!288926 (= res!150550 (or lt!142449 (= lt!142446 (MissingVacant!2040 i!1256))))))

(assert (=> b!288926 (= lt!142449 (= lt!142446 (MissingZero!2040 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14528 (_ BitVec 32)) SeekEntryResult!2040)

(assert (=> b!288926 (= lt!142446 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288927 () Bool)

(declare-fun e!182932 () Bool)

(declare-fun e!182929 () Bool)

(assert (=> b!288927 (= e!182932 e!182929)))

(declare-fun res!150554 () Bool)

(assert (=> b!288927 (=> (not res!150554) (not e!182929))))

(declare-fun lt!142447 () Bool)

(declare-fun lt!142448 () SeekEntryResult!2040)

(assert (=> b!288927 (= res!150554 (and (or lt!142447 (not (undefined!2852 lt!142448))) (or lt!142447 (not (= (select (arr!6891 a!3312) (index!10332 lt!142448)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142447 (not (= (select (arr!6891 a!3312) (index!10332 lt!142448)) k0!2524))) (not lt!142447)))))

(get-info :version)

(assert (=> b!288927 (= lt!142447 (not ((_ is Intermediate!2040) lt!142448)))))

(declare-fun b!288928 () Bool)

(assert (=> b!288928 (= e!182929 (not true))))

(assert (=> b!288928 (and (= (select (arr!6891 a!3312) (index!10332 lt!142448)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10332 lt!142448) i!1256))))

(declare-fun res!150552 () Bool)

(assert (=> start!28214 (=> (not res!150552) (not e!182930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28214 (= res!150552 (validMask!0 mask!3809))))

(assert (=> start!28214 e!182930))

(assert (=> start!28214 true))

(declare-fun array_inv!4854 (array!14528) Bool)

(assert (=> start!28214 (array_inv!4854 a!3312)))

(declare-fun b!288929 () Bool)

(assert (=> b!288929 (= e!182931 e!182932)))

(declare-fun res!150553 () Bool)

(assert (=> b!288929 (=> (not res!150553) (not e!182932))))

(assert (=> b!288929 (= res!150553 lt!142449)))

(declare-fun lt!142445 () SeekEntryResult!2040)

(declare-fun lt!142450 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14528 (_ BitVec 32)) SeekEntryResult!2040)

(assert (=> b!288929 (= lt!142445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142450 k0!2524 (array!14529 (store (arr!6891 a!3312) i!1256 k0!2524) (size!7243 a!3312)) mask!3809))))

(assert (=> b!288929 (= lt!142448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142450 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288929 (= lt!142450 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288930 () Bool)

(declare-fun res!150548 () Bool)

(assert (=> b!288930 (=> (not res!150548) (not e!182930))))

(assert (=> b!288930 (= res!150548 (and (= (size!7243 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7243 a!3312))))))

(declare-fun b!288931 () Bool)

(declare-fun res!150549 () Bool)

(assert (=> b!288931 (=> (not res!150549) (not e!182930))))

(declare-fun arrayContainsKey!0 (array!14528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288931 (= res!150549 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288932 () Bool)

(declare-fun res!150555 () Bool)

(assert (=> b!288932 (=> (not res!150555) (not e!182930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288932 (= res!150555 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28214 res!150552) b!288930))

(assert (= (and b!288930 res!150548) b!288932))

(assert (= (and b!288932 res!150555) b!288931))

(assert (= (and b!288931 res!150549) b!288926))

(assert (= (and b!288926 res!150550) b!288925))

(assert (= (and b!288925 res!150551) b!288929))

(assert (= (and b!288929 res!150553) b!288927))

(assert (= (and b!288927 res!150554) b!288928))

(declare-fun m!303115 () Bool)

(assert (=> b!288927 m!303115))

(declare-fun m!303117 () Bool)

(assert (=> b!288926 m!303117))

(declare-fun m!303119 () Bool)

(assert (=> b!288929 m!303119))

(declare-fun m!303121 () Bool)

(assert (=> b!288929 m!303121))

(declare-fun m!303123 () Bool)

(assert (=> b!288929 m!303123))

(declare-fun m!303125 () Bool)

(assert (=> b!288929 m!303125))

(declare-fun m!303127 () Bool)

(assert (=> b!288931 m!303127))

(declare-fun m!303129 () Bool)

(assert (=> b!288932 m!303129))

(declare-fun m!303131 () Bool)

(assert (=> b!288925 m!303131))

(declare-fun m!303133 () Bool)

(assert (=> start!28214 m!303133))

(declare-fun m!303135 () Bool)

(assert (=> start!28214 m!303135))

(assert (=> b!288928 m!303115))

(check-sat (not b!288926) (not b!288929) (not b!288925) (not b!288931) (not start!28214) (not b!288932))
(check-sat)
