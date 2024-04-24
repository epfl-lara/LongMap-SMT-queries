; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26910 () Bool)

(assert start!26910)

(declare-fun b!278945 () Bool)

(declare-fun res!142260 () Bool)

(declare-fun e!177883 () Bool)

(assert (=> b!278945 (=> (not res!142260) (not e!177883))))

(declare-datatypes ((array!13874 0))(
  ( (array!13875 (arr!6583 (Array (_ BitVec 32) (_ BitVec 64))) (size!6935 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13874)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13874 (_ BitVec 32)) Bool)

(assert (=> b!278945 (= res!142260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278946 () Bool)

(declare-fun res!142265 () Bool)

(declare-fun e!177882 () Bool)

(assert (=> b!278946 (=> (not res!142265) (not e!177882))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278946 (= res!142265 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278948 () Bool)

(declare-fun res!142263 () Bool)

(assert (=> b!278948 (=> (not res!142263) (not e!177882))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278948 (= res!142263 (and (= (size!6935 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6935 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6935 a!3325))))))

(declare-fun b!278949 () Bool)

(declare-fun res!142258 () Bool)

(assert (=> b!278949 (=> (not res!142258) (not e!177882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278949 (= res!142258 (validKeyInArray!0 k0!2581))))

(declare-fun b!278950 () Bool)

(declare-fun res!142259 () Bool)

(assert (=> b!278950 (=> (not res!142259) (not e!177883))))

(assert (=> b!278950 (= res!142259 (validKeyInArray!0 (select (arr!6583 a!3325) startIndex!26)))))

(declare-fun b!278951 () Bool)

(assert (=> b!278951 (= e!177882 e!177883)))

(declare-fun res!142266 () Bool)

(assert (=> b!278951 (=> (not res!142266) (not e!177883))))

(declare-datatypes ((SeekEntryResult!1706 0))(
  ( (MissingZero!1706 (index!8994 (_ BitVec 32))) (Found!1706 (index!8995 (_ BitVec 32))) (Intermediate!1706 (undefined!2518 Bool) (index!8996 (_ BitVec 32)) (x!27352 (_ BitVec 32))) (Undefined!1706) (MissingVacant!1706 (index!8997 (_ BitVec 32))) )
))
(declare-fun lt!138570 () SeekEntryResult!1706)

(assert (=> b!278951 (= res!142266 (or (= lt!138570 (MissingZero!1706 i!1267)) (= lt!138570 (MissingVacant!1706 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13874 (_ BitVec 32)) SeekEntryResult!1706)

(assert (=> b!278951 (= lt!138570 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278952 () Bool)

(declare-fun res!142261 () Bool)

(assert (=> b!278952 (=> (not res!142261) (not e!177883))))

(assert (=> b!278952 (= res!142261 (not (= startIndex!26 i!1267)))))

(declare-fun b!278953 () Bool)

(declare-fun res!142264 () Bool)

(assert (=> b!278953 (=> (not res!142264) (not e!177882))))

(declare-datatypes ((List!4304 0))(
  ( (Nil!4301) (Cons!4300 (h!4970 (_ BitVec 64)) (t!9378 List!4304)) )
))
(declare-fun arrayNoDuplicates!0 (array!13874 (_ BitVec 32) List!4304) Bool)

(assert (=> b!278953 (= res!142264 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4301))))

(declare-fun b!278947 () Bool)

(assert (=> b!278947 (= e!177883 (and (bvslt (size!6935 a!3325) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6935 a!3325))))))

(declare-fun res!142262 () Bool)

(assert (=> start!26910 (=> (not res!142262) (not e!177882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26910 (= res!142262 (validMask!0 mask!3868))))

(assert (=> start!26910 e!177882))

(declare-fun array_inv!4533 (array!13874) Bool)

(assert (=> start!26910 (array_inv!4533 a!3325)))

(assert (=> start!26910 true))

(assert (= (and start!26910 res!142262) b!278948))

(assert (= (and b!278948 res!142263) b!278949))

(assert (= (and b!278949 res!142258) b!278953))

(assert (= (and b!278953 res!142264) b!278946))

(assert (= (and b!278946 res!142265) b!278951))

(assert (= (and b!278951 res!142266) b!278945))

(assert (= (and b!278945 res!142260) b!278952))

(assert (= (and b!278952 res!142261) b!278950))

(assert (= (and b!278950 res!142259) b!278947))

(declare-fun m!294035 () Bool)

(assert (=> b!278950 m!294035))

(assert (=> b!278950 m!294035))

(declare-fun m!294037 () Bool)

(assert (=> b!278950 m!294037))

(declare-fun m!294039 () Bool)

(assert (=> b!278945 m!294039))

(declare-fun m!294041 () Bool)

(assert (=> b!278953 m!294041))

(declare-fun m!294043 () Bool)

(assert (=> start!26910 m!294043))

(declare-fun m!294045 () Bool)

(assert (=> start!26910 m!294045))

(declare-fun m!294047 () Bool)

(assert (=> b!278951 m!294047))

(declare-fun m!294049 () Bool)

(assert (=> b!278946 m!294049))

(declare-fun m!294051 () Bool)

(assert (=> b!278949 m!294051))

(check-sat (not b!278946) (not start!26910) (not b!278953) (not b!278951) (not b!278945) (not b!278949) (not b!278950))
(check-sat)
