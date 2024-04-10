; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130860 () Bool)

(assert start!130860)

(declare-fun b!1534733 () Bool)

(declare-fun res!1051819 () Bool)

(declare-fun e!854586 () Bool)

(assert (=> b!1534733 (=> (not res!1051819) (not e!854586))))

(declare-datatypes ((array!101958 0))(
  ( (array!101959 (arr!49195 (Array (_ BitVec 32) (_ BitVec 64))) (size!49745 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101958)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534733 (= res!1051819 (and (= (size!49745 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49745 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49745 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534734 () Bool)

(declare-fun res!1051820 () Bool)

(assert (=> b!1534734 (=> (not res!1051820) (not e!854586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534734 (= res!1051820 (validKeyInArray!0 (select (arr!49195 a!2792) j!64)))))

(declare-fun b!1534735 () Bool)

(declare-fun res!1051821 () Bool)

(assert (=> b!1534735 (=> (not res!1051821) (not e!854586))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534735 (= res!1051821 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49745 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49745 a!2792)) (= (select (arr!49195 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534736 () Bool)

(declare-fun res!1051825 () Bool)

(assert (=> b!1534736 (=> (not res!1051825) (not e!854586))))

(assert (=> b!1534736 (= res!1051825 (not (= (select (arr!49195 a!2792) index!463) (select (arr!49195 a!2792) j!64))))))

(declare-fun b!1534737 () Bool)

(declare-fun res!1051823 () Bool)

(assert (=> b!1534737 (=> (not res!1051823) (not e!854586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101958 (_ BitVec 32)) Bool)

(assert (=> b!1534737 (= res!1051823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534738 () Bool)

(declare-fun res!1051824 () Bool)

(assert (=> b!1534738 (=> (not res!1051824) (not e!854586))))

(assert (=> b!1534738 (= res!1051824 (validKeyInArray!0 (select (arr!49195 a!2792) i!951)))))

(declare-fun b!1534739 () Bool)

(declare-fun res!1051822 () Bool)

(assert (=> b!1534739 (=> (not res!1051822) (not e!854586))))

(declare-datatypes ((List!35669 0))(
  ( (Nil!35666) (Cons!35665 (h!37110 (_ BitVec 64)) (t!50363 List!35669)) )
))
(declare-fun arrayNoDuplicates!0 (array!101958 (_ BitVec 32) List!35669) Bool)

(assert (=> b!1534739 (= res!1051822 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35666))))

(declare-fun b!1534740 () Bool)

(declare-fun e!854587 () Bool)

(assert (=> b!1534740 (= e!854586 e!854587)))

(declare-fun res!1051828 () Bool)

(assert (=> b!1534740 (=> (not res!1051828) (not e!854587))))

(declare-fun lt!663919 () (_ BitVec 32))

(assert (=> b!1534740 (= res!1051828 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663919 #b00000000000000000000000000000000) (bvslt lt!663919 (size!49745 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534740 (= lt!663919 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1051827 () Bool)

(assert (=> start!130860 (=> (not res!1051827) (not e!854586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130860 (= res!1051827 (validMask!0 mask!2480))))

(assert (=> start!130860 e!854586))

(assert (=> start!130860 true))

(declare-fun array_inv!38223 (array!101958) Bool)

(assert (=> start!130860 (array_inv!38223 a!2792)))

(declare-fun b!1534741 () Bool)

(declare-fun res!1051826 () Bool)

(assert (=> b!1534741 (=> (not res!1051826) (not e!854586))))

(declare-datatypes ((SeekEntryResult!13327 0))(
  ( (MissingZero!13327 (index!55703 (_ BitVec 32))) (Found!13327 (index!55704 (_ BitVec 32))) (Intermediate!13327 (undefined!14139 Bool) (index!55705 (_ BitVec 32)) (x!137457 (_ BitVec 32))) (Undefined!13327) (MissingVacant!13327 (index!55706 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101958 (_ BitVec 32)) SeekEntryResult!13327)

(assert (=> b!1534741 (= res!1051826 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49195 a!2792) j!64) a!2792 mask!2480) (Found!13327 j!64)))))

(declare-fun b!1534742 () Bool)

(assert (=> b!1534742 (= e!854587 false)))

(declare-fun lt!663918 () SeekEntryResult!13327)

(assert (=> b!1534742 (= lt!663918 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663919 vacantIndex!5 (select (arr!49195 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130860 res!1051827) b!1534733))

(assert (= (and b!1534733 res!1051819) b!1534738))

(assert (= (and b!1534738 res!1051824) b!1534734))

(assert (= (and b!1534734 res!1051820) b!1534737))

(assert (= (and b!1534737 res!1051823) b!1534739))

(assert (= (and b!1534739 res!1051822) b!1534735))

(assert (= (and b!1534735 res!1051821) b!1534741))

(assert (= (and b!1534741 res!1051826) b!1534736))

(assert (= (and b!1534736 res!1051825) b!1534740))

(assert (= (and b!1534740 res!1051828) b!1534742))

(declare-fun m!1417345 () Bool)

(assert (=> start!130860 m!1417345))

(declare-fun m!1417347 () Bool)

(assert (=> start!130860 m!1417347))

(declare-fun m!1417349 () Bool)

(assert (=> b!1534736 m!1417349))

(declare-fun m!1417351 () Bool)

(assert (=> b!1534736 m!1417351))

(declare-fun m!1417353 () Bool)

(assert (=> b!1534740 m!1417353))

(assert (=> b!1534741 m!1417351))

(assert (=> b!1534741 m!1417351))

(declare-fun m!1417355 () Bool)

(assert (=> b!1534741 m!1417355))

(assert (=> b!1534734 m!1417351))

(assert (=> b!1534734 m!1417351))

(declare-fun m!1417357 () Bool)

(assert (=> b!1534734 m!1417357))

(declare-fun m!1417359 () Bool)

(assert (=> b!1534738 m!1417359))

(assert (=> b!1534738 m!1417359))

(declare-fun m!1417361 () Bool)

(assert (=> b!1534738 m!1417361))

(declare-fun m!1417363 () Bool)

(assert (=> b!1534739 m!1417363))

(assert (=> b!1534742 m!1417351))

(assert (=> b!1534742 m!1417351))

(declare-fun m!1417365 () Bool)

(assert (=> b!1534742 m!1417365))

(declare-fun m!1417367 () Bool)

(assert (=> b!1534737 m!1417367))

(declare-fun m!1417369 () Bool)

(assert (=> b!1534735 m!1417369))

(push 1)

(assert (not b!1534742))

(assert (not b!1534739))

(assert (not b!1534741))

(assert (not b!1534740))

(assert (not b!1534737))

(assert (not start!130860))

(assert (not b!1534734))

(assert (not b!1534738))

(check-sat)

