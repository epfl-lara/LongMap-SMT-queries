; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28188 () Bool)

(assert start!28188)

(declare-fun res!150238 () Bool)

(declare-fun e!182735 () Bool)

(assert (=> start!28188 (=> (not res!150238) (not e!182735))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28188 (= res!150238 (validMask!0 mask!3809))))

(assert (=> start!28188 e!182735))

(assert (=> start!28188 true))

(declare-datatypes ((array!14502 0))(
  ( (array!14503 (arr!6878 (Array (_ BitVec 32) (_ BitVec 64))) (size!7230 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14502)

(declare-fun array_inv!4841 (array!14502) Bool)

(assert (=> start!28188 (array_inv!4841 a!3312)))

(declare-fun b!288613 () Bool)

(declare-fun e!182736 () Bool)

(declare-fun e!182734 () Bool)

(assert (=> b!288613 (= e!182736 e!182734)))

(declare-fun res!150240 () Bool)

(assert (=> b!288613 (=> (not res!150240) (not e!182734))))

(declare-fun lt!142214 () Bool)

(assert (=> b!288613 (= res!150240 lt!142214)))

(declare-datatypes ((SeekEntryResult!2027 0))(
  ( (MissingZero!2027 (index!10278 (_ BitVec 32))) (Found!2027 (index!10279 (_ BitVec 32))) (Intermediate!2027 (undefined!2839 Bool) (index!10280 (_ BitVec 32)) (x!28496 (_ BitVec 32))) (Undefined!2027) (MissingVacant!2027 (index!10281 (_ BitVec 32))) )
))
(declare-fun lt!142212 () SeekEntryResult!2027)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142213 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14502 (_ BitVec 32)) SeekEntryResult!2027)

(assert (=> b!288613 (= lt!142212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142213 k!2524 (array!14503 (store (arr!6878 a!3312) i!1256 k!2524) (size!7230 a!3312)) mask!3809))))

(declare-fun lt!142215 () SeekEntryResult!2027)

(assert (=> b!288613 (= lt!142215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142213 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288613 (= lt!142213 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288614 () Bool)

(declare-fun res!150239 () Bool)

(assert (=> b!288614 (=> (not res!150239) (not e!182735))))

(assert (=> b!288614 (= res!150239 (and (= (size!7230 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7230 a!3312))))))

(declare-fun b!288615 () Bool)

(declare-fun e!182737 () Bool)

(assert (=> b!288615 (= e!182734 e!182737)))

(declare-fun res!150236 () Bool)

(assert (=> b!288615 (=> (not res!150236) (not e!182737))))

(declare-fun lt!142211 () Bool)

(assert (=> b!288615 (= res!150236 (and (or lt!142211 (not (undefined!2839 lt!142215))) (or lt!142211 (not (= (select (arr!6878 a!3312) (index!10280 lt!142215)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142211 (not (= (select (arr!6878 a!3312) (index!10280 lt!142215)) k!2524))) (not lt!142211)))))

(assert (=> b!288615 (= lt!142211 (not (is-Intermediate!2027 lt!142215)))))

(declare-fun b!288616 () Bool)

(assert (=> b!288616 (= e!182735 e!182736)))

(declare-fun res!150243 () Bool)

(assert (=> b!288616 (=> (not res!150243) (not e!182736))))

(declare-fun lt!142216 () SeekEntryResult!2027)

(assert (=> b!288616 (= res!150243 (or lt!142214 (= lt!142216 (MissingVacant!2027 i!1256))))))

(assert (=> b!288616 (= lt!142214 (= lt!142216 (MissingZero!2027 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14502 (_ BitVec 32)) SeekEntryResult!2027)

(assert (=> b!288616 (= lt!142216 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288617 () Bool)

(declare-fun res!150241 () Bool)

(assert (=> b!288617 (=> (not res!150241) (not e!182735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288617 (= res!150241 (validKeyInArray!0 k!2524))))

(declare-fun b!288618 () Bool)

(declare-fun res!150242 () Bool)

(assert (=> b!288618 (=> (not res!150242) (not e!182735))))

(declare-fun arrayContainsKey!0 (array!14502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288618 (= res!150242 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288619 () Bool)

(declare-fun res!150237 () Bool)

(assert (=> b!288619 (=> (not res!150237) (not e!182736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14502 (_ BitVec 32)) Bool)

(assert (=> b!288619 (= res!150237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288620 () Bool)

(assert (=> b!288620 (= e!182737 (not true))))

(assert (=> b!288620 (and (= (select (arr!6878 a!3312) (index!10280 lt!142215)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10280 lt!142215) i!1256))))

(assert (= (and start!28188 res!150238) b!288614))

(assert (= (and b!288614 res!150239) b!288617))

(assert (= (and b!288617 res!150241) b!288618))

(assert (= (and b!288618 res!150242) b!288616))

(assert (= (and b!288616 res!150243) b!288619))

(assert (= (and b!288619 res!150237) b!288613))

(assert (= (and b!288613 res!150240) b!288615))

(assert (= (and b!288615 res!150236) b!288620))

(declare-fun m!302829 () Bool)

(assert (=> start!28188 m!302829))

(declare-fun m!302831 () Bool)

(assert (=> start!28188 m!302831))

(declare-fun m!302833 () Bool)

(assert (=> b!288613 m!302833))

(declare-fun m!302835 () Bool)

(assert (=> b!288613 m!302835))

(declare-fun m!302837 () Bool)

(assert (=> b!288613 m!302837))

(declare-fun m!302839 () Bool)

(assert (=> b!288613 m!302839))

(declare-fun m!302841 () Bool)

(assert (=> b!288616 m!302841))

(declare-fun m!302843 () Bool)

(assert (=> b!288619 m!302843))

(declare-fun m!302845 () Bool)

(assert (=> b!288618 m!302845))

(declare-fun m!302847 () Bool)

(assert (=> b!288617 m!302847))

(declare-fun m!302849 () Bool)

(assert (=> b!288620 m!302849))

(assert (=> b!288615 m!302849))

(push 1)

