; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25714 () Bool)

(assert start!25714)

(declare-fun b!266652 () Bool)

(declare-fun res!130948 () Bool)

(declare-fun e!172493 () Bool)

(assert (=> b!266652 (=> (not res!130948) (not e!172493))))

(declare-datatypes ((array!12893 0))(
  ( (array!12894 (arr!6101 (Array (_ BitVec 32) (_ BitVec 64))) (size!6453 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12893)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266652 (= res!130948 (and (= (size!6453 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6453 a!3436))))))

(declare-fun b!266653 () Bool)

(declare-fun res!130952 () Bool)

(assert (=> b!266653 (=> (not res!130952) (not e!172493))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266653 (= res!130952 (validKeyInArray!0 k!2698))))

(declare-fun res!130951 () Bool)

(assert (=> start!25714 (=> (not res!130951) (not e!172493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25714 (= res!130951 (validMask!0 mask!4002))))

(assert (=> start!25714 e!172493))

(assert (=> start!25714 true))

(declare-fun array_inv!4064 (array!12893) Bool)

(assert (=> start!25714 (array_inv!4064 a!3436)))

(declare-fun b!266654 () Bool)

(declare-fun e!172492 () Bool)

(assert (=> b!266654 (= e!172493 e!172492)))

(declare-fun res!130950 () Bool)

(assert (=> b!266654 (=> (not res!130950) (not e!172492))))

(declare-datatypes ((SeekEntryResult!1292 0))(
  ( (MissingZero!1292 (index!7338 (_ BitVec 32))) (Found!1292 (index!7339 (_ BitVec 32))) (Intermediate!1292 (undefined!2104 Bool) (index!7340 (_ BitVec 32)) (x!25641 (_ BitVec 32))) (Undefined!1292) (MissingVacant!1292 (index!7341 (_ BitVec 32))) )
))
(declare-fun lt!134488 () SeekEntryResult!1292)

(assert (=> b!266654 (= res!130950 (or (= lt!134488 (MissingZero!1292 i!1355)) (= lt!134488 (MissingVacant!1292 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12893 (_ BitVec 32)) SeekEntryResult!1292)

(assert (=> b!266654 (= lt!134488 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266655 () Bool)

(assert (=> b!266655 (= e!172492 false)))

(declare-fun lt!134487 () Bool)

(declare-datatypes ((List!3915 0))(
  ( (Nil!3912) (Cons!3911 (h!4578 (_ BitVec 64)) (t!8997 List!3915)) )
))
(declare-fun arrayNoDuplicates!0 (array!12893 (_ BitVec 32) List!3915) Bool)

(assert (=> b!266655 (= lt!134487 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3912))))

(declare-fun b!266656 () Bool)

(declare-fun res!130949 () Bool)

(assert (=> b!266656 (=> (not res!130949) (not e!172492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12893 (_ BitVec 32)) Bool)

(assert (=> b!266656 (= res!130949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266657 () Bool)

(declare-fun res!130953 () Bool)

(assert (=> b!266657 (=> (not res!130953) (not e!172493))))

(declare-fun arrayContainsKey!0 (array!12893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266657 (= res!130953 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25714 res!130951) b!266652))

(assert (= (and b!266652 res!130948) b!266653))

(assert (= (and b!266653 res!130952) b!266657))

(assert (= (and b!266657 res!130953) b!266654))

(assert (= (and b!266654 res!130950) b!266656))

(assert (= (and b!266656 res!130949) b!266655))

(declare-fun m!283203 () Bool)

(assert (=> b!266657 m!283203))

(declare-fun m!283205 () Bool)

(assert (=> b!266653 m!283205))

(declare-fun m!283207 () Bool)

(assert (=> b!266656 m!283207))

(declare-fun m!283209 () Bool)

(assert (=> b!266654 m!283209))

(declare-fun m!283211 () Bool)

(assert (=> start!25714 m!283211))

(declare-fun m!283213 () Bool)

(assert (=> start!25714 m!283213))

(declare-fun m!283215 () Bool)

(assert (=> b!266655 m!283215))

(push 1)

