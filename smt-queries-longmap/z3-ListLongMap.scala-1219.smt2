; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25782 () Bool)

(assert start!25782)

(declare-fun b!267301 () Bool)

(declare-fun res!131601 () Bool)

(declare-fun e!172799 () Bool)

(assert (=> b!267301 (=> (not res!131601) (not e!172799))))

(declare-datatypes ((array!12961 0))(
  ( (array!12962 (arr!6135 (Array (_ BitVec 32) (_ BitVec 64))) (size!6487 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12961)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267301 (= res!131601 (and (= (size!6487 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6487 a!3436))))))

(declare-fun b!267302 () Bool)

(declare-fun res!131599 () Bool)

(assert (=> b!267302 (=> (not res!131599) (not e!172799))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267302 (= res!131599 (validKeyInArray!0 k0!2698))))

(declare-fun b!267303 () Bool)

(declare-fun res!131597 () Bool)

(declare-fun e!172798 () Bool)

(assert (=> b!267303 (=> (not res!131597) (not e!172798))))

(declare-datatypes ((List!3949 0))(
  ( (Nil!3946) (Cons!3945 (h!4612 (_ BitVec 64)) (t!9031 List!3949)) )
))
(declare-fun arrayNoDuplicates!0 (array!12961 (_ BitVec 32) List!3949) Bool)

(assert (=> b!267303 (= res!131597 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3946))))

(declare-fun res!131603 () Bool)

(assert (=> start!25782 (=> (not res!131603) (not e!172799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25782 (= res!131603 (validMask!0 mask!4002))))

(assert (=> start!25782 e!172799))

(assert (=> start!25782 true))

(declare-fun array_inv!4098 (array!12961) Bool)

(assert (=> start!25782 (array_inv!4098 a!3436)))

(declare-fun b!267304 () Bool)

(assert (=> b!267304 (= e!172799 e!172798)))

(declare-fun res!131604 () Bool)

(assert (=> b!267304 (=> (not res!131604) (not e!172798))))

(declare-datatypes ((SeekEntryResult!1326 0))(
  ( (MissingZero!1326 (index!7474 (_ BitVec 32))) (Found!1326 (index!7475 (_ BitVec 32))) (Intermediate!1326 (undefined!2138 Bool) (index!7476 (_ BitVec 32)) (x!25763 (_ BitVec 32))) (Undefined!1326) (MissingVacant!1326 (index!7477 (_ BitVec 32))) )
))
(declare-fun lt!134682 () SeekEntryResult!1326)

(assert (=> b!267304 (= res!131604 (or (= lt!134682 (MissingZero!1326 i!1355)) (= lt!134682 (MissingVacant!1326 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12961 (_ BitVec 32)) SeekEntryResult!1326)

(assert (=> b!267304 (= lt!134682 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267305 () Bool)

(declare-fun res!131600 () Bool)

(assert (=> b!267305 (=> (not res!131600) (not e!172799))))

(declare-fun arrayContainsKey!0 (array!12961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267305 (= res!131600 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267306 () Bool)

(declare-fun res!131602 () Bool)

(assert (=> b!267306 (=> (not res!131602) (not e!172798))))

(assert (=> b!267306 (= res!131602 (bvslt #b00000000000000000000000000000000 (size!6487 a!3436)))))

(declare-fun b!267307 () Bool)

(assert (=> b!267307 (= e!172798 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12961 (_ BitVec 32)) Bool)

(assert (=> b!267307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12962 (store (arr!6135 a!3436) i!1355 k0!2698) (size!6487 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8301 0))(
  ( (Unit!8302) )
))
(declare-fun lt!134683 () Unit!8301)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8301)

(assert (=> b!267307 (= lt!134683 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267308 () Bool)

(declare-fun res!131598 () Bool)

(assert (=> b!267308 (=> (not res!131598) (not e!172798))))

(assert (=> b!267308 (= res!131598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25782 res!131603) b!267301))

(assert (= (and b!267301 res!131601) b!267302))

(assert (= (and b!267302 res!131599) b!267305))

(assert (= (and b!267305 res!131600) b!267304))

(assert (= (and b!267304 res!131604) b!267308))

(assert (= (and b!267308 res!131598) b!267303))

(assert (= (and b!267303 res!131597) b!267306))

(assert (= (and b!267306 res!131602) b!267307))

(declare-fun m!283703 () Bool)

(assert (=> b!267305 m!283703))

(declare-fun m!283705 () Bool)

(assert (=> b!267303 m!283705))

(declare-fun m!283707 () Bool)

(assert (=> start!25782 m!283707))

(declare-fun m!283709 () Bool)

(assert (=> start!25782 m!283709))

(declare-fun m!283711 () Bool)

(assert (=> b!267308 m!283711))

(declare-fun m!283713 () Bool)

(assert (=> b!267304 m!283713))

(declare-fun m!283715 () Bool)

(assert (=> b!267307 m!283715))

(declare-fun m!283717 () Bool)

(assert (=> b!267307 m!283717))

(declare-fun m!283719 () Bool)

(assert (=> b!267307 m!283719))

(declare-fun m!283721 () Bool)

(assert (=> b!267302 m!283721))

(check-sat (not b!267308) (not b!267302) (not b!267307) (not b!267304) (not start!25782) (not b!267305) (not b!267303))
(check-sat)
