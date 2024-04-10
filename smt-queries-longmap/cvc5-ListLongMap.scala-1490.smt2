; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28326 () Bool)

(assert start!28326)

(declare-fun b!290233 () Bool)

(declare-fun res!151713 () Bool)

(declare-fun e!183662 () Bool)

(assert (=> b!290233 (=> (not res!151713) (not e!183662))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290233 (= res!151713 (validKeyInArray!0 k!2524))))

(declare-fun b!290234 () Bool)

(declare-fun e!183663 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290234 (= e!183663 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!2096 0))(
  ( (MissingZero!2096 (index!10554 (_ BitVec 32))) (Found!2096 (index!10555 (_ BitVec 32))) (Intermediate!2096 (undefined!2908 Bool) (index!10556 (_ BitVec 32)) (x!28749 (_ BitVec 32))) (Undefined!2096) (MissingVacant!2096 (index!10557 (_ BitVec 32))) )
))
(declare-fun lt!143358 () SeekEntryResult!2096)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290234 (= (index!10556 lt!143358) i!1256)))

(declare-fun b!290235 () Bool)

(declare-fun e!183665 () Bool)

(assert (=> b!290235 (= e!183662 e!183665)))

(declare-fun res!151716 () Bool)

(assert (=> b!290235 (=> (not res!151716) (not e!183665))))

(declare-fun lt!143356 () Bool)

(declare-fun lt!143357 () SeekEntryResult!2096)

(assert (=> b!290235 (= res!151716 (or lt!143356 (= lt!143357 (MissingVacant!2096 i!1256))))))

(assert (=> b!290235 (= lt!143356 (= lt!143357 (MissingZero!2096 i!1256)))))

(declare-datatypes ((array!14640 0))(
  ( (array!14641 (arr!6947 (Array (_ BitVec 32) (_ BitVec 64))) (size!7299 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14640)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14640 (_ BitVec 32)) SeekEntryResult!2096)

(assert (=> b!290235 (= lt!143357 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290236 () Bool)

(declare-fun res!151719 () Bool)

(assert (=> b!290236 (=> (not res!151719) (not e!183662))))

(declare-fun arrayContainsKey!0 (array!14640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290236 (= res!151719 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290238 () Bool)

(declare-fun res!151717 () Bool)

(assert (=> b!290238 (=> (not res!151717) (not e!183662))))

(assert (=> b!290238 (= res!151717 (and (= (size!7299 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7299 a!3312))))))

(declare-fun b!290239 () Bool)

(declare-fun res!151712 () Bool)

(assert (=> b!290239 (=> (not res!151712) (not e!183665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14640 (_ BitVec 32)) Bool)

(assert (=> b!290239 (= res!151712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290240 () Bool)

(declare-fun e!183661 () Bool)

(assert (=> b!290240 (= e!183665 e!183661)))

(declare-fun res!151715 () Bool)

(assert (=> b!290240 (=> (not res!151715) (not e!183661))))

(assert (=> b!290240 (= res!151715 (and (not lt!143356) (= lt!143357 (MissingVacant!2096 i!1256))))))

(declare-fun lt!143354 () (_ BitVec 32))

(declare-fun lt!143359 () SeekEntryResult!2096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14640 (_ BitVec 32)) SeekEntryResult!2096)

(assert (=> b!290240 (= lt!143359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143354 k!2524 (array!14641 (store (arr!6947 a!3312) i!1256 k!2524) (size!7299 a!3312)) mask!3809))))

(assert (=> b!290240 (= lt!143358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143354 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290240 (= lt!143354 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290237 () Bool)

(assert (=> b!290237 (= e!183661 e!183663)))

(declare-fun res!151714 () Bool)

(assert (=> b!290237 (=> (not res!151714) (not e!183663))))

(declare-fun lt!143355 () Bool)

(assert (=> b!290237 (= res!151714 (and (or lt!143355 (not (undefined!2908 lt!143358))) (not lt!143355) (= (select (arr!6947 a!3312) (index!10556 lt!143358)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290237 (= lt!143355 (not (is-Intermediate!2096 lt!143358)))))

(declare-fun res!151718 () Bool)

(assert (=> start!28326 (=> (not res!151718) (not e!183662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28326 (= res!151718 (validMask!0 mask!3809))))

(assert (=> start!28326 e!183662))

(assert (=> start!28326 true))

(declare-fun array_inv!4910 (array!14640) Bool)

(assert (=> start!28326 (array_inv!4910 a!3312)))

(assert (= (and start!28326 res!151718) b!290238))

(assert (= (and b!290238 res!151717) b!290233))

(assert (= (and b!290233 res!151713) b!290236))

(assert (= (and b!290236 res!151719) b!290235))

(assert (= (and b!290235 res!151716) b!290239))

(assert (= (and b!290239 res!151712) b!290240))

(assert (= (and b!290240 res!151715) b!290237))

(assert (= (and b!290237 res!151714) b!290234))

(declare-fun m!304347 () Bool)

(assert (=> b!290237 m!304347))

(declare-fun m!304349 () Bool)

(assert (=> b!290235 m!304349))

(declare-fun m!304351 () Bool)

(assert (=> b!290240 m!304351))

(declare-fun m!304353 () Bool)

(assert (=> b!290240 m!304353))

(declare-fun m!304355 () Bool)

(assert (=> b!290240 m!304355))

(declare-fun m!304357 () Bool)

(assert (=> b!290240 m!304357))

(declare-fun m!304359 () Bool)

(assert (=> start!28326 m!304359))

(declare-fun m!304361 () Bool)

(assert (=> start!28326 m!304361))

(declare-fun m!304363 () Bool)

(assert (=> b!290239 m!304363))

(declare-fun m!304365 () Bool)

(assert (=> b!290233 m!304365))

(declare-fun m!304367 () Bool)

(assert (=> b!290236 m!304367))

(push 1)

