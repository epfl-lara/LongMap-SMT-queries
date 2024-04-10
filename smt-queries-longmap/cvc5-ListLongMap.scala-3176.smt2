; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44682 () Bool)

(assert start!44682)

(declare-fun b!490299 () Bool)

(declare-fun e!288244 () Bool)

(assert (=> b!490299 (= e!288244 (not true))))

(declare-fun lt!221400 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3725 0))(
  ( (MissingZero!3725 (index!17079 (_ BitVec 32))) (Found!3725 (index!17080 (_ BitVec 32))) (Intermediate!3725 (undefined!4537 Bool) (index!17081 (_ BitVec 32)) (x!46183 (_ BitVec 32))) (Undefined!3725) (MissingVacant!3725 (index!17082 (_ BitVec 32))) )
))
(declare-fun lt!221401 () SeekEntryResult!3725)

(declare-datatypes ((array!31741 0))(
  ( (array!31742 (arr!15258 (Array (_ BitVec 32) (_ BitVec 64))) (size!15622 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31741 (_ BitVec 32)) SeekEntryResult!3725)

(assert (=> b!490299 (= lt!221401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221400 (select (store (arr!15258 a!3235) i!1204 k!2280) j!176) (array!31742 (store (arr!15258 a!3235) i!1204 k!2280) (size!15622 a!3235)) mask!3524))))

(declare-fun lt!221404 () SeekEntryResult!3725)

(declare-fun lt!221403 () (_ BitVec 32))

(assert (=> b!490299 (= lt!221404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221403 (select (arr!15258 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490299 (= lt!221400 (toIndex!0 (select (store (arr!15258 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490299 (= lt!221403 (toIndex!0 (select (arr!15258 a!3235) j!176) mask!3524))))

(declare-fun e!288243 () Bool)

(assert (=> b!490299 e!288243))

(declare-fun res!293239 () Bool)

(assert (=> b!490299 (=> (not res!293239) (not e!288243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31741 (_ BitVec 32)) Bool)

(assert (=> b!490299 (= res!293239 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14396 0))(
  ( (Unit!14397) )
))
(declare-fun lt!221399 () Unit!14396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14396)

(assert (=> b!490299 (= lt!221399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293236 () Bool)

(declare-fun e!288246 () Bool)

(assert (=> start!44682 (=> (not res!293236) (not e!288246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44682 (= res!293236 (validMask!0 mask!3524))))

(assert (=> start!44682 e!288246))

(assert (=> start!44682 true))

(declare-fun array_inv!11054 (array!31741) Bool)

(assert (=> start!44682 (array_inv!11054 a!3235)))

(declare-fun b!490300 () Bool)

(declare-fun res!293241 () Bool)

(assert (=> b!490300 (=> (not res!293241) (not e!288244))))

(assert (=> b!490300 (= res!293241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490301 () Bool)

(declare-fun res!293243 () Bool)

(assert (=> b!490301 (=> (not res!293243) (not e!288246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490301 (= res!293243 (validKeyInArray!0 (select (arr!15258 a!3235) j!176)))))

(declare-fun b!490302 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31741 (_ BitVec 32)) SeekEntryResult!3725)

(assert (=> b!490302 (= e!288243 (= (seekEntryOrOpen!0 (select (arr!15258 a!3235) j!176) a!3235 mask!3524) (Found!3725 j!176)))))

(declare-fun b!490303 () Bool)

(declare-fun res!293238 () Bool)

(assert (=> b!490303 (=> (not res!293238) (not e!288246))))

(assert (=> b!490303 (= res!293238 (validKeyInArray!0 k!2280))))

(declare-fun b!490304 () Bool)

(declare-fun res!293237 () Bool)

(assert (=> b!490304 (=> (not res!293237) (not e!288246))))

(declare-fun arrayContainsKey!0 (array!31741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490304 (= res!293237 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490305 () Bool)

(declare-fun res!293242 () Bool)

(assert (=> b!490305 (=> (not res!293242) (not e!288246))))

(assert (=> b!490305 (= res!293242 (and (= (size!15622 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15622 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15622 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490306 () Bool)

(assert (=> b!490306 (= e!288246 e!288244)))

(declare-fun res!293240 () Bool)

(assert (=> b!490306 (=> (not res!293240) (not e!288244))))

(declare-fun lt!221402 () SeekEntryResult!3725)

(assert (=> b!490306 (= res!293240 (or (= lt!221402 (MissingZero!3725 i!1204)) (= lt!221402 (MissingVacant!3725 i!1204))))))

(assert (=> b!490306 (= lt!221402 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490307 () Bool)

(declare-fun res!293235 () Bool)

(assert (=> b!490307 (=> (not res!293235) (not e!288244))))

(declare-datatypes ((List!9416 0))(
  ( (Nil!9413) (Cons!9412 (h!10274 (_ BitVec 64)) (t!15644 List!9416)) )
))
(declare-fun arrayNoDuplicates!0 (array!31741 (_ BitVec 32) List!9416) Bool)

(assert (=> b!490307 (= res!293235 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9413))))

(assert (= (and start!44682 res!293236) b!490305))

(assert (= (and b!490305 res!293242) b!490301))

(assert (= (and b!490301 res!293243) b!490303))

(assert (= (and b!490303 res!293238) b!490304))

(assert (= (and b!490304 res!293237) b!490306))

(assert (= (and b!490306 res!293240) b!490300))

(assert (= (and b!490300 res!293241) b!490307))

(assert (= (and b!490307 res!293235) b!490299))

(assert (= (and b!490299 res!293239) b!490302))

(declare-fun m!470361 () Bool)

(assert (=> b!490299 m!470361))

(declare-fun m!470363 () Bool)

(assert (=> b!490299 m!470363))

(declare-fun m!470365 () Bool)

(assert (=> b!490299 m!470365))

(declare-fun m!470367 () Bool)

(assert (=> b!490299 m!470367))

(assert (=> b!490299 m!470365))

(declare-fun m!470369 () Bool)

(assert (=> b!490299 m!470369))

(declare-fun m!470371 () Bool)

(assert (=> b!490299 m!470371))

(declare-fun m!470373 () Bool)

(assert (=> b!490299 m!470373))

(assert (=> b!490299 m!470371))

(declare-fun m!470375 () Bool)

(assert (=> b!490299 m!470375))

(assert (=> b!490299 m!470365))

(declare-fun m!470377 () Bool)

(assert (=> b!490299 m!470377))

(assert (=> b!490299 m!470371))

(declare-fun m!470379 () Bool)

(assert (=> b!490304 m!470379))

(declare-fun m!470381 () Bool)

(assert (=> b!490300 m!470381))

(declare-fun m!470383 () Bool)

(assert (=> b!490307 m!470383))

(assert (=> b!490302 m!470365))

(assert (=> b!490302 m!470365))

(declare-fun m!470385 () Bool)

(assert (=> b!490302 m!470385))

(declare-fun m!470387 () Bool)

(assert (=> b!490306 m!470387))

(declare-fun m!470389 () Bool)

(assert (=> start!44682 m!470389))

(declare-fun m!470391 () Bool)

(assert (=> start!44682 m!470391))

(assert (=> b!490301 m!470365))

(assert (=> b!490301 m!470365))

(declare-fun m!470393 () Bool)

(assert (=> b!490301 m!470393))

(declare-fun m!470395 () Bool)

(assert (=> b!490303 m!470395))

(push 1)

