; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29830 () Bool)

(assert start!29830)

(declare-fun b!300195 () Bool)

(declare-fun res!158230 () Bool)

(declare-fun e!189577 () Bool)

(assert (=> b!300195 (=> (not res!158230) (not e!189577))))

(declare-datatypes ((array!15153 0))(
  ( (array!15154 (arr!7172 (Array (_ BitVec 32) (_ BitVec 64))) (size!7524 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15153)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300195 (= res!158230 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300196 () Bool)

(declare-fun e!189575 () Bool)

(assert (=> b!300196 (= e!189577 e!189575)))

(declare-fun res!158228 () Bool)

(assert (=> b!300196 (=> (not res!158228) (not e!189575))))

(declare-datatypes ((SeekEntryResult!2321 0))(
  ( (MissingZero!2321 (index!11460 (_ BitVec 32))) (Found!2321 (index!11461 (_ BitVec 32))) (Intermediate!2321 (undefined!3133 Bool) (index!11462 (_ BitVec 32)) (x!29717 (_ BitVec 32))) (Undefined!2321) (MissingVacant!2321 (index!11463 (_ BitVec 32))) )
))
(declare-fun lt!149311 () SeekEntryResult!2321)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300196 (= res!158228 (or (= lt!149311 (MissingZero!2321 i!1256)) (= lt!149311 (MissingVacant!2321 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15153 (_ BitVec 32)) SeekEntryResult!2321)

(assert (=> b!300196 (= lt!149311 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300197 () Bool)

(declare-fun res!158229 () Bool)

(assert (=> b!300197 (=> (not res!158229) (not e!189577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300197 (= res!158229 (validKeyInArray!0 k!2524))))

(declare-fun res!158232 () Bool)

(assert (=> start!29830 (=> (not res!158232) (not e!189577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29830 (= res!158232 (validMask!0 mask!3809))))

(assert (=> start!29830 e!189577))

(assert (=> start!29830 true))

(declare-fun array_inv!5135 (array!15153) Bool)

(assert (=> start!29830 (array_inv!5135 a!3312)))

(declare-fun b!300198 () Bool)

(declare-fun res!158231 () Bool)

(assert (=> b!300198 (=> (not res!158231) (not e!189575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15153 (_ BitVec 32)) Bool)

(assert (=> b!300198 (= res!158231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300199 () Bool)

(assert (=> b!300199 (= e!189575 false)))

(declare-fun lt!149310 () SeekEntryResult!2321)

(declare-fun lt!149313 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15153 (_ BitVec 32)) SeekEntryResult!2321)

(assert (=> b!300199 (= lt!149310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149313 k!2524 (array!15154 (store (arr!7172 a!3312) i!1256 k!2524) (size!7524 a!3312)) mask!3809))))

(declare-fun lt!149312 () SeekEntryResult!2321)

(assert (=> b!300199 (= lt!149312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149313 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300199 (= lt!149313 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300200 () Bool)

(declare-fun res!158227 () Bool)

(assert (=> b!300200 (=> (not res!158227) (not e!189577))))

(assert (=> b!300200 (= res!158227 (and (= (size!7524 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7524 a!3312))))))

(assert (= (and start!29830 res!158232) b!300200))

(assert (= (and b!300200 res!158227) b!300197))

(assert (= (and b!300197 res!158229) b!300195))

(assert (= (and b!300195 res!158230) b!300196))

(assert (= (and b!300196 res!158228) b!300198))

(assert (= (and b!300198 res!158231) b!300199))

(declare-fun m!312243 () Bool)

(assert (=> b!300197 m!312243))

(declare-fun m!312245 () Bool)

(assert (=> b!300195 m!312245))

(declare-fun m!312247 () Bool)

(assert (=> start!29830 m!312247))

(declare-fun m!312249 () Bool)

(assert (=> start!29830 m!312249))

(declare-fun m!312251 () Bool)

(assert (=> b!300198 m!312251))

(declare-fun m!312253 () Bool)

(assert (=> b!300196 m!312253))

(declare-fun m!312255 () Bool)

(assert (=> b!300199 m!312255))

(declare-fun m!312257 () Bool)

(assert (=> b!300199 m!312257))

(declare-fun m!312259 () Bool)

(assert (=> b!300199 m!312259))

(declare-fun m!312261 () Bool)

(assert (=> b!300199 m!312261))

(push 1)

