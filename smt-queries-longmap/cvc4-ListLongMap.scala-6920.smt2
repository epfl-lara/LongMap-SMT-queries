; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86940 () Bool)

(assert start!86940)

(declare-fun b!1008515 () Bool)

(declare-fun res!677417 () Bool)

(declare-fun e!567446 () Bool)

(assert (=> b!1008515 (=> (not res!677417) (not e!567446))))

(declare-datatypes ((array!63588 0))(
  ( (array!63589 (arr!30615 (Array (_ BitVec 32) (_ BitVec 64))) (size!31117 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63588)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008515 (= res!677417 (and (= (size!31117 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31117 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31117 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008516 () Bool)

(declare-fun res!677421 () Bool)

(assert (=> b!1008516 (=> (not res!677421) (not e!567446))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008516 (= res!677421 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008517 () Bool)

(declare-fun e!567447 () Bool)

(declare-fun e!567451 () Bool)

(assert (=> b!1008517 (= e!567447 e!567451)))

(declare-fun res!677412 () Bool)

(assert (=> b!1008517 (=> (not res!677412) (not e!567451))))

(declare-datatypes ((SeekEntryResult!9547 0))(
  ( (MissingZero!9547 (index!40559 (_ BitVec 32))) (Found!9547 (index!40560 (_ BitVec 32))) (Intermediate!9547 (undefined!10359 Bool) (index!40561 (_ BitVec 32)) (x!87945 (_ BitVec 32))) (Undefined!9547) (MissingVacant!9547 (index!40562 (_ BitVec 32))) )
))
(declare-fun lt!445738 () SeekEntryResult!9547)

(declare-fun lt!445739 () SeekEntryResult!9547)

(assert (=> b!1008517 (= res!677412 (= lt!445738 lt!445739))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008517 (= lt!445739 (Intermediate!9547 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63588 (_ BitVec 32)) SeekEntryResult!9547)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008517 (= lt!445738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30615 a!3219) j!170) mask!3464) (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008518 () Bool)

(declare-fun e!567450 () Bool)

(declare-fun e!567448 () Bool)

(assert (=> b!1008518 (= e!567450 e!567448)))

(declare-fun res!677419 () Bool)

(assert (=> b!1008518 (=> (not res!677419) (not e!567448))))

(declare-fun lt!445742 () (_ BitVec 64))

(declare-fun lt!445736 () array!63588)

(assert (=> b!1008518 (= res!677419 (not (= lt!445738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445742 mask!3464) lt!445742 lt!445736 mask!3464))))))

(assert (=> b!1008518 (= lt!445742 (select (store (arr!30615 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008518 (= lt!445736 (array!63589 (store (arr!30615 a!3219) i!1194 k!2224) (size!31117 a!3219)))))

(declare-fun b!1008519 () Bool)

(declare-fun res!677409 () Bool)

(assert (=> b!1008519 (=> (not res!677409) (not e!567446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008519 (= res!677409 (validKeyInArray!0 k!2224))))

(declare-fun b!1008520 () Bool)

(declare-fun res!677416 () Bool)

(assert (=> b!1008520 (=> (not res!677416) (not e!567447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63588 (_ BitVec 32)) Bool)

(assert (=> b!1008520 (= res!677416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008521 () Bool)

(assert (=> b!1008521 (= e!567446 e!567447)))

(declare-fun res!677410 () Bool)

(assert (=> b!1008521 (=> (not res!677410) (not e!567447))))

(declare-fun lt!445741 () SeekEntryResult!9547)

(assert (=> b!1008521 (= res!677410 (or (= lt!445741 (MissingVacant!9547 i!1194)) (= lt!445741 (MissingZero!9547 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63588 (_ BitVec 32)) SeekEntryResult!9547)

(assert (=> b!1008521 (= lt!445741 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008522 () Bool)

(declare-fun res!677420 () Bool)

(assert (=> b!1008522 (=> (not res!677420) (not e!567448))))

(declare-fun lt!445740 () SeekEntryResult!9547)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1008522 (= res!677420 (not (= lt!445740 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445742 lt!445736 mask!3464))))))

(declare-fun b!1008523 () Bool)

(declare-fun res!677414 () Bool)

(assert (=> b!1008523 (=> (not res!677414) (not e!567447))))

(declare-datatypes ((List!21291 0))(
  ( (Nil!21288) (Cons!21287 (h!22473 (_ BitVec 64)) (t!30292 List!21291)) )
))
(declare-fun arrayNoDuplicates!0 (array!63588 (_ BitVec 32) List!21291) Bool)

(assert (=> b!1008523 (= res!677414 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21288))))

(declare-fun b!1008524 () Bool)

(assert (=> b!1008524 (= e!567451 e!567450)))

(declare-fun res!677411 () Bool)

(assert (=> b!1008524 (=> (not res!677411) (not e!567450))))

(assert (=> b!1008524 (= res!677411 (= lt!445740 lt!445739))))

(assert (=> b!1008524 (= lt!445740 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30615 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!677415 () Bool)

(assert (=> start!86940 (=> (not res!677415) (not e!567446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86940 (= res!677415 (validMask!0 mask!3464))))

(assert (=> start!86940 e!567446))

(declare-fun array_inv!23739 (array!63588) Bool)

(assert (=> start!86940 (array_inv!23739 a!3219)))

(assert (=> start!86940 true))

(declare-fun b!1008525 () Bool)

(declare-fun res!677413 () Bool)

(assert (=> b!1008525 (=> (not res!677413) (not e!567447))))

(assert (=> b!1008525 (= res!677413 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31117 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31117 a!3219))))))

(declare-fun b!1008526 () Bool)

(declare-fun res!677418 () Bool)

(assert (=> b!1008526 (=> (not res!677418) (not e!567448))))

(assert (=> b!1008526 (= res!677418 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008527 () Bool)

(declare-fun res!677408 () Bool)

(assert (=> b!1008527 (=> (not res!677408) (not e!567446))))

(assert (=> b!1008527 (= res!677408 (validKeyInArray!0 (select (arr!30615 a!3219) j!170)))))

(declare-fun b!1008528 () Bool)

(assert (=> b!1008528 (= e!567448 false)))

(declare-fun lt!445737 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008528 (= lt!445737 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!86940 res!677415) b!1008515))

(assert (= (and b!1008515 res!677417) b!1008527))

(assert (= (and b!1008527 res!677408) b!1008519))

(assert (= (and b!1008519 res!677409) b!1008516))

(assert (= (and b!1008516 res!677421) b!1008521))

(assert (= (and b!1008521 res!677410) b!1008520))

(assert (= (and b!1008520 res!677416) b!1008523))

(assert (= (and b!1008523 res!677414) b!1008525))

(assert (= (and b!1008525 res!677413) b!1008517))

(assert (= (and b!1008517 res!677412) b!1008524))

(assert (= (and b!1008524 res!677411) b!1008518))

(assert (= (and b!1008518 res!677419) b!1008522))

(assert (= (and b!1008522 res!677420) b!1008526))

(assert (= (and b!1008526 res!677418) b!1008528))

(declare-fun m!933251 () Bool)

(assert (=> b!1008516 m!933251))

(declare-fun m!933253 () Bool)

(assert (=> b!1008528 m!933253))

(declare-fun m!933255 () Bool)

(assert (=> b!1008520 m!933255))

(declare-fun m!933257 () Bool)

(assert (=> b!1008518 m!933257))

(assert (=> b!1008518 m!933257))

(declare-fun m!933259 () Bool)

(assert (=> b!1008518 m!933259))

(declare-fun m!933261 () Bool)

(assert (=> b!1008518 m!933261))

(declare-fun m!933263 () Bool)

(assert (=> b!1008518 m!933263))

(declare-fun m!933265 () Bool)

(assert (=> b!1008524 m!933265))

(assert (=> b!1008524 m!933265))

(declare-fun m!933267 () Bool)

(assert (=> b!1008524 m!933267))

(declare-fun m!933269 () Bool)

(assert (=> b!1008519 m!933269))

(declare-fun m!933271 () Bool)

(assert (=> b!1008521 m!933271))

(declare-fun m!933273 () Bool)

(assert (=> b!1008523 m!933273))

(declare-fun m!933275 () Bool)

(assert (=> b!1008522 m!933275))

(assert (=> b!1008527 m!933265))

(assert (=> b!1008527 m!933265))

(declare-fun m!933277 () Bool)

(assert (=> b!1008527 m!933277))

(declare-fun m!933279 () Bool)

(assert (=> start!86940 m!933279))

(declare-fun m!933281 () Bool)

(assert (=> start!86940 m!933281))

(assert (=> b!1008517 m!933265))

(assert (=> b!1008517 m!933265))

(declare-fun m!933283 () Bool)

(assert (=> b!1008517 m!933283))

(assert (=> b!1008517 m!933283))

(assert (=> b!1008517 m!933265))

(declare-fun m!933285 () Bool)

(assert (=> b!1008517 m!933285))

(push 1)

