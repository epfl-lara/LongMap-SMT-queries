; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28170 () Bool)

(assert start!28170)

(declare-fun b!288397 () Bool)

(declare-fun res!150024 () Bool)

(declare-fun e!182599 () Bool)

(assert (=> b!288397 (=> (not res!150024) (not e!182599))))

(declare-datatypes ((array!14484 0))(
  ( (array!14485 (arr!6869 (Array (_ BitVec 32) (_ BitVec 64))) (size!7221 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14484)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14484 (_ BitVec 32)) Bool)

(assert (=> b!288397 (= res!150024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288398 () Bool)

(declare-fun e!182602 () Bool)

(assert (=> b!288398 (= e!182599 e!182602)))

(declare-fun res!150023 () Bool)

(assert (=> b!288398 (=> (not res!150023) (not e!182602))))

(declare-fun lt!142053 () Bool)

(assert (=> b!288398 (= res!150023 lt!142053)))

(declare-datatypes ((SeekEntryResult!2018 0))(
  ( (MissingZero!2018 (index!10242 (_ BitVec 32))) (Found!2018 (index!10243 (_ BitVec 32))) (Intermediate!2018 (undefined!2830 Bool) (index!10244 (_ BitVec 32)) (x!28463 (_ BitVec 32))) (Undefined!2018) (MissingVacant!2018 (index!10245 (_ BitVec 32))) )
))
(declare-fun lt!142052 () SeekEntryResult!2018)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142050 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14484 (_ BitVec 32)) SeekEntryResult!2018)

(assert (=> b!288398 (= lt!142052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142050 k!2524 (array!14485 (store (arr!6869 a!3312) i!1256 k!2524) (size!7221 a!3312)) mask!3809))))

(declare-fun lt!142051 () SeekEntryResult!2018)

(assert (=> b!288398 (= lt!142051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142050 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288398 (= lt!142050 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!150022 () Bool)

(declare-fun e!182603 () Bool)

(assert (=> start!28170 (=> (not res!150022) (not e!182603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28170 (= res!150022 (validMask!0 mask!3809))))

(assert (=> start!28170 e!182603))

(assert (=> start!28170 true))

(declare-fun array_inv!4832 (array!14484) Bool)

(assert (=> start!28170 (array_inv!4832 a!3312)))

(declare-fun b!288399 () Bool)

(declare-fun res!150025 () Bool)

(assert (=> b!288399 (=> (not res!150025) (not e!182603))))

(assert (=> b!288399 (= res!150025 (and (= (size!7221 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7221 a!3312))))))

(declare-fun b!288400 () Bool)

(declare-fun e!182601 () Bool)

(assert (=> b!288400 (= e!182601 (not true))))

(assert (=> b!288400 (and (= (select (arr!6869 a!3312) (index!10244 lt!142051)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10244 lt!142051) i!1256))))

(declare-fun b!288401 () Bool)

(assert (=> b!288401 (= e!182602 e!182601)))

(declare-fun res!150026 () Bool)

(assert (=> b!288401 (=> (not res!150026) (not e!182601))))

(declare-fun lt!142049 () Bool)

(assert (=> b!288401 (= res!150026 (and (or lt!142049 (not (undefined!2830 lt!142051))) (or lt!142049 (not (= (select (arr!6869 a!3312) (index!10244 lt!142051)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142049 (not (= (select (arr!6869 a!3312) (index!10244 lt!142051)) k!2524))) (not lt!142049)))))

(assert (=> b!288401 (= lt!142049 (not (is-Intermediate!2018 lt!142051)))))

(declare-fun b!288402 () Bool)

(assert (=> b!288402 (= e!182603 e!182599)))

(declare-fun res!150020 () Bool)

(assert (=> b!288402 (=> (not res!150020) (not e!182599))))

(declare-fun lt!142054 () SeekEntryResult!2018)

(assert (=> b!288402 (= res!150020 (or lt!142053 (= lt!142054 (MissingVacant!2018 i!1256))))))

(assert (=> b!288402 (= lt!142053 (= lt!142054 (MissingZero!2018 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14484 (_ BitVec 32)) SeekEntryResult!2018)

(assert (=> b!288402 (= lt!142054 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288403 () Bool)

(declare-fun res!150021 () Bool)

(assert (=> b!288403 (=> (not res!150021) (not e!182603))))

(declare-fun arrayContainsKey!0 (array!14484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288403 (= res!150021 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288404 () Bool)

(declare-fun res!150027 () Bool)

(assert (=> b!288404 (=> (not res!150027) (not e!182603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288404 (= res!150027 (validKeyInArray!0 k!2524))))

(assert (= (and start!28170 res!150022) b!288399))

(assert (= (and b!288399 res!150025) b!288404))

(assert (= (and b!288404 res!150027) b!288403))

(assert (= (and b!288403 res!150021) b!288402))

(assert (= (and b!288402 res!150020) b!288397))

(assert (= (and b!288397 res!150024) b!288398))

(assert (= (and b!288398 res!150023) b!288401))

(assert (= (and b!288401 res!150026) b!288400))

(declare-fun m!302631 () Bool)

(assert (=> b!288402 m!302631))

(declare-fun m!302633 () Bool)

(assert (=> b!288403 m!302633))

(declare-fun m!302635 () Bool)

(assert (=> b!288398 m!302635))

(declare-fun m!302637 () Bool)

(assert (=> b!288398 m!302637))

(declare-fun m!302639 () Bool)

(assert (=> b!288398 m!302639))

(declare-fun m!302641 () Bool)

(assert (=> b!288398 m!302641))

(declare-fun m!302643 () Bool)

(assert (=> b!288397 m!302643))

(declare-fun m!302645 () Bool)

(assert (=> b!288404 m!302645))

(declare-fun m!302647 () Bool)

(assert (=> b!288400 m!302647))

(assert (=> b!288401 m!302647))

(declare-fun m!302649 () Bool)

(assert (=> start!28170 m!302649))

(declare-fun m!302651 () Bool)

(assert (=> start!28170 m!302651))

(push 1)

(assert (not start!28170))

(assert (not b!288404))

(assert (not b!288402))

(assert (not b!288397))

(assert (not b!288403))

(assert (not b!288398))

(check-sat)

(pop 1)

