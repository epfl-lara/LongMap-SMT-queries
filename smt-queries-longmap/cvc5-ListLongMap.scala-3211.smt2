; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45012 () Bool)

(assert start!45012)

(declare-fun res!296399 () Bool)

(declare-fun e!289939 () Bool)

(assert (=> start!45012 (=> (not res!296399) (not e!289939))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45012 (= res!296399 (validMask!0 mask!3524))))

(assert (=> start!45012 e!289939))

(assert (=> start!45012 true))

(declare-datatypes ((array!31957 0))(
  ( (array!31958 (arr!15363 (Array (_ BitVec 32) (_ BitVec 64))) (size!15727 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31957)

(declare-fun array_inv!11159 (array!31957) Bool)

(assert (=> start!45012 (array_inv!11159 a!3235)))

(declare-fun b!493826 () Bool)

(declare-fun res!296402 () Bool)

(assert (=> b!493826 (=> (not res!296402) (not e!289939))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493826 (= res!296402 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493827 () Bool)

(declare-fun e!289940 () Bool)

(declare-fun e!289938 () Bool)

(assert (=> b!493827 (= e!289940 (not e!289938))))

(declare-fun res!296396 () Bool)

(assert (=> b!493827 (=> res!296396 e!289938)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223403 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3830 0))(
  ( (MissingZero!3830 (index!17499 (_ BitVec 32))) (Found!3830 (index!17500 (_ BitVec 32))) (Intermediate!3830 (undefined!4642 Bool) (index!17501 (_ BitVec 32)) (x!46580 (_ BitVec 32))) (Undefined!3830) (MissingVacant!3830 (index!17502 (_ BitVec 32))) )
))
(declare-fun lt!223407 () SeekEntryResult!3830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31957 (_ BitVec 32)) SeekEntryResult!3830)

(assert (=> b!493827 (= res!296396 (= lt!223407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223403 (select (store (arr!15363 a!3235) i!1204 k!2280) j!176) (array!31958 (store (arr!15363 a!3235) i!1204 k!2280) (size!15727 a!3235)) mask!3524)))))

(declare-fun lt!223408 () (_ BitVec 32))

(assert (=> b!493827 (= lt!223407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223408 (select (arr!15363 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493827 (= lt!223403 (toIndex!0 (select (store (arr!15363 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493827 (= lt!223408 (toIndex!0 (select (arr!15363 a!3235) j!176) mask!3524))))

(declare-fun lt!223404 () SeekEntryResult!3830)

(assert (=> b!493827 (= lt!223404 (Found!3830 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31957 (_ BitVec 32)) SeekEntryResult!3830)

(assert (=> b!493827 (= lt!223404 (seekEntryOrOpen!0 (select (arr!15363 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31957 (_ BitVec 32)) Bool)

(assert (=> b!493827 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14606 0))(
  ( (Unit!14607) )
))
(declare-fun lt!223405 () Unit!14606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14606)

(assert (=> b!493827 (= lt!223405 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493828 () Bool)

(declare-fun res!296401 () Bool)

(assert (=> b!493828 (=> (not res!296401) (not e!289939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493828 (= res!296401 (validKeyInArray!0 (select (arr!15363 a!3235) j!176)))))

(declare-fun b!493829 () Bool)

(declare-fun res!296405 () Bool)

(assert (=> b!493829 (=> (not res!296405) (not e!289939))))

(assert (=> b!493829 (= res!296405 (and (= (size!15727 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15727 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15727 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493830 () Bool)

(declare-fun res!296404 () Bool)

(assert (=> b!493830 (=> res!296404 e!289938)))

(assert (=> b!493830 (= res!296404 (or (not (is-Intermediate!3830 lt!223407)) (not (undefined!4642 lt!223407))))))

(declare-fun b!493831 () Bool)

(declare-fun res!296400 () Bool)

(assert (=> b!493831 (=> (not res!296400) (not e!289940))))

(declare-datatypes ((List!9521 0))(
  ( (Nil!9518) (Cons!9517 (h!10385 (_ BitVec 64)) (t!15749 List!9521)) )
))
(declare-fun arrayNoDuplicates!0 (array!31957 (_ BitVec 32) List!9521) Bool)

(assert (=> b!493831 (= res!296400 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9518))))

(declare-fun b!493832 () Bool)

(assert (=> b!493832 (= e!289939 e!289940)))

(declare-fun res!296397 () Bool)

(assert (=> b!493832 (=> (not res!296397) (not e!289940))))

(declare-fun lt!223406 () SeekEntryResult!3830)

(assert (=> b!493832 (= res!296397 (or (= lt!223406 (MissingZero!3830 i!1204)) (= lt!223406 (MissingVacant!3830 i!1204))))))

(assert (=> b!493832 (= lt!223406 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493833 () Bool)

(declare-fun res!296398 () Bool)

(assert (=> b!493833 (=> (not res!296398) (not e!289939))))

(assert (=> b!493833 (= res!296398 (validKeyInArray!0 k!2280))))

(declare-fun b!493834 () Bool)

(assert (=> b!493834 (= e!289938 true)))

(assert (=> b!493834 (= lt!223404 Undefined!3830)))

(declare-fun b!493835 () Bool)

(declare-fun res!296403 () Bool)

(assert (=> b!493835 (=> (not res!296403) (not e!289940))))

(assert (=> b!493835 (= res!296403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45012 res!296399) b!493829))

(assert (= (and b!493829 res!296405) b!493828))

(assert (= (and b!493828 res!296401) b!493833))

(assert (= (and b!493833 res!296398) b!493826))

(assert (= (and b!493826 res!296402) b!493832))

(assert (= (and b!493832 res!296397) b!493835))

(assert (= (and b!493835 res!296403) b!493831))

(assert (= (and b!493831 res!296400) b!493827))

(assert (= (and b!493827 (not res!296396)) b!493830))

(assert (= (and b!493830 (not res!296404)) b!493834))

(declare-fun m!474747 () Bool)

(assert (=> b!493835 m!474747))

(declare-fun m!474749 () Bool)

(assert (=> b!493832 m!474749))

(declare-fun m!474751 () Bool)

(assert (=> b!493833 m!474751))

(declare-fun m!474753 () Bool)

(assert (=> b!493828 m!474753))

(assert (=> b!493828 m!474753))

(declare-fun m!474755 () Bool)

(assert (=> b!493828 m!474755))

(declare-fun m!474757 () Bool)

(assert (=> start!45012 m!474757))

(declare-fun m!474759 () Bool)

(assert (=> start!45012 m!474759))

(declare-fun m!474761 () Bool)

(assert (=> b!493827 m!474761))

(declare-fun m!474763 () Bool)

(assert (=> b!493827 m!474763))

(assert (=> b!493827 m!474763))

(declare-fun m!474765 () Bool)

(assert (=> b!493827 m!474765))

(assert (=> b!493827 m!474753))

(declare-fun m!474767 () Bool)

(assert (=> b!493827 m!474767))

(assert (=> b!493827 m!474753))

(declare-fun m!474769 () Bool)

(assert (=> b!493827 m!474769))

(assert (=> b!493827 m!474753))

(declare-fun m!474771 () Bool)

(assert (=> b!493827 m!474771))

(assert (=> b!493827 m!474763))

(declare-fun m!474773 () Bool)

(assert (=> b!493827 m!474773))

(assert (=> b!493827 m!474753))

(declare-fun m!474775 () Bool)

(assert (=> b!493827 m!474775))

(declare-fun m!474777 () Bool)

(assert (=> b!493827 m!474777))

(declare-fun m!474779 () Bool)

(assert (=> b!493831 m!474779))

(declare-fun m!474781 () Bool)

(assert (=> b!493826 m!474781))

(push 1)

