; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46086 () Bool)

(assert start!46086)

(declare-fun b!510459 () Bool)

(declare-fun res!311308 () Bool)

(declare-fun e!298377 () Bool)

(assert (=> b!510459 (=> (not res!311308) (not e!298377))))

(declare-datatypes ((array!32797 0))(
  ( (array!32798 (arr!15777 (Array (_ BitVec 32) (_ BitVec 64))) (size!16141 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32797)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32797 (_ BitVec 32)) Bool)

(assert (=> b!510459 (= res!311308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510460 () Bool)

(declare-fun res!311311 () Bool)

(declare-fun e!298374 () Bool)

(assert (=> b!510460 (=> (not res!311311) (not e!298374))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510460 (= res!311311 (validKeyInArray!0 k!2280))))

(declare-fun b!510461 () Bool)

(declare-fun e!298375 () Bool)

(assert (=> b!510461 (= e!298375 true)))

(declare-fun lt!233400 () array!32797)

(declare-fun lt!233398 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4244 0))(
  ( (MissingZero!4244 (index!19164 (_ BitVec 32))) (Found!4244 (index!19165 (_ BitVec 32))) (Intermediate!4244 (undefined!5056 Bool) (index!19166 (_ BitVec 32)) (x!48125 (_ BitVec 32))) (Undefined!4244) (MissingVacant!4244 (index!19167 (_ BitVec 32))) )
))
(declare-fun lt!233396 () SeekEntryResult!4244)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32797 (_ BitVec 32)) SeekEntryResult!4244)

(assert (=> b!510461 (= lt!233396 (seekEntryOrOpen!0 lt!233398 lt!233400 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15746 0))(
  ( (Unit!15747) )
))
(declare-fun lt!233399 () Unit!15746)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15746)

(assert (=> b!510461 (= lt!233399 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun res!311310 () Bool)

(assert (=> start!46086 (=> (not res!311310) (not e!298374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46086 (= res!311310 (validMask!0 mask!3524))))

(assert (=> start!46086 e!298374))

(assert (=> start!46086 true))

(declare-fun array_inv!11573 (array!32797) Bool)

(assert (=> start!46086 (array_inv!11573 a!3235)))

(declare-fun b!510462 () Bool)

(declare-fun res!311312 () Bool)

(assert (=> b!510462 (=> (not res!311312) (not e!298374))))

(assert (=> b!510462 (= res!311312 (and (= (size!16141 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16141 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16141 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510463 () Bool)

(assert (=> b!510463 (= e!298374 e!298377)))

(declare-fun res!311305 () Bool)

(assert (=> b!510463 (=> (not res!311305) (not e!298377))))

(declare-fun lt!233397 () SeekEntryResult!4244)

(assert (=> b!510463 (= res!311305 (or (= lt!233397 (MissingZero!4244 i!1204)) (= lt!233397 (MissingVacant!4244 i!1204))))))

(assert (=> b!510463 (= lt!233397 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510464 () Bool)

(declare-fun res!311306 () Bool)

(assert (=> b!510464 (=> (not res!311306) (not e!298374))))

(declare-fun arrayContainsKey!0 (array!32797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510464 (= res!311306 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510465 () Bool)

(declare-fun res!311309 () Bool)

(assert (=> b!510465 (=> (not res!311309) (not e!298377))))

(declare-datatypes ((List!9935 0))(
  ( (Nil!9932) (Cons!9931 (h!10808 (_ BitVec 64)) (t!16163 List!9935)) )
))
(declare-fun arrayNoDuplicates!0 (array!32797 (_ BitVec 32) List!9935) Bool)

(assert (=> b!510465 (= res!311309 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9932))))

(declare-fun b!510466 () Bool)

(declare-fun res!311307 () Bool)

(assert (=> b!510466 (=> (not res!311307) (not e!298374))))

(assert (=> b!510466 (= res!311307 (validKeyInArray!0 (select (arr!15777 a!3235) j!176)))))

(declare-fun b!510467 () Bool)

(assert (=> b!510467 (= e!298377 (not e!298375))))

(declare-fun res!311304 () Bool)

(assert (=> b!510467 (=> res!311304 e!298375)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32797 (_ BitVec 32)) SeekEntryResult!4244)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510467 (= res!311304 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15777 a!3235) j!176) mask!3524) (select (arr!15777 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233398 mask!3524) lt!233398 lt!233400 mask!3524))))))

(assert (=> b!510467 (= lt!233398 (select (store (arr!15777 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510467 (= lt!233400 (array!32798 (store (arr!15777 a!3235) i!1204 k!2280) (size!16141 a!3235)))))

(assert (=> b!510467 (= lt!233396 (Found!4244 j!176))))

(assert (=> b!510467 (= lt!233396 (seekEntryOrOpen!0 (select (arr!15777 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510467 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233401 () Unit!15746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15746)

(assert (=> b!510467 (= lt!233401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46086 res!311310) b!510462))

(assert (= (and b!510462 res!311312) b!510466))

(assert (= (and b!510466 res!311307) b!510460))

(assert (= (and b!510460 res!311311) b!510464))

(assert (= (and b!510464 res!311306) b!510463))

(assert (= (and b!510463 res!311305) b!510459))

(assert (= (and b!510459 res!311308) b!510465))

(assert (= (and b!510465 res!311309) b!510467))

(assert (= (and b!510467 (not res!311304)) b!510461))

(declare-fun m!491733 () Bool)

(assert (=> b!510464 m!491733))

(declare-fun m!491735 () Bool)

(assert (=> b!510459 m!491735))

(declare-fun m!491737 () Bool)

(assert (=> b!510465 m!491737))

(declare-fun m!491739 () Bool)

(assert (=> b!510467 m!491739))

(declare-fun m!491741 () Bool)

(assert (=> b!510467 m!491741))

(declare-fun m!491743 () Bool)

(assert (=> b!510467 m!491743))

(declare-fun m!491745 () Bool)

(assert (=> b!510467 m!491745))

(declare-fun m!491747 () Bool)

(assert (=> b!510467 m!491747))

(declare-fun m!491749 () Bool)

(assert (=> b!510467 m!491749))

(declare-fun m!491751 () Bool)

(assert (=> b!510467 m!491751))

(assert (=> b!510467 m!491751))

(declare-fun m!491753 () Bool)

(assert (=> b!510467 m!491753))

(assert (=> b!510467 m!491747))

(assert (=> b!510467 m!491745))

(assert (=> b!510467 m!491747))

(declare-fun m!491755 () Bool)

(assert (=> b!510467 m!491755))

(assert (=> b!510467 m!491747))

(declare-fun m!491757 () Bool)

(assert (=> b!510467 m!491757))

(declare-fun m!491759 () Bool)

(assert (=> b!510460 m!491759))

(declare-fun m!491761 () Bool)

(assert (=> start!46086 m!491761))

(declare-fun m!491763 () Bool)

(assert (=> start!46086 m!491763))

(assert (=> b!510466 m!491747))

(assert (=> b!510466 m!491747))

(declare-fun m!491765 () Bool)

(assert (=> b!510466 m!491765))

(declare-fun m!491767 () Bool)

(assert (=> b!510463 m!491767))

(declare-fun m!491769 () Bool)

(assert (=> b!510461 m!491769))

(declare-fun m!491771 () Bool)

(assert (=> b!510461 m!491771))

(push 1)

