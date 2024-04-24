; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25640 () Bool)

(assert start!25640)

(declare-fun b!265925 () Bool)

(declare-fun res!130195 () Bool)

(declare-fun e!172165 () Bool)

(assert (=> b!265925 (=> (not res!130195) (not e!172165))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265925 (= res!130195 (validKeyInArray!0 k0!2698))))

(declare-fun b!265926 () Bool)

(declare-fun res!130200 () Bool)

(declare-fun e!172164 () Bool)

(assert (=> b!265926 (=> (not res!130200) (not e!172164))))

(declare-datatypes ((array!12814 0))(
  ( (array!12815 (arr!6061 (Array (_ BitVec 32) (_ BitVec 64))) (size!6413 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12814)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12814 (_ BitVec 32)) Bool)

(assert (=> b!265926 (= res!130200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130198 () Bool)

(assert (=> start!25640 (=> (not res!130198) (not e!172165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25640 (= res!130198 (validMask!0 mask!4002))))

(assert (=> start!25640 e!172165))

(assert (=> start!25640 true))

(declare-fun array_inv!4011 (array!12814) Bool)

(assert (=> start!25640 (array_inv!4011 a!3436)))

(declare-fun b!265927 () Bool)

(assert (=> b!265927 (= e!172164 false)))

(declare-fun lt!134313 () Bool)

(declare-datatypes ((List!3788 0))(
  ( (Nil!3785) (Cons!3784 (h!4451 (_ BitVec 64)) (t!8862 List!3788)) )
))
(declare-fun arrayNoDuplicates!0 (array!12814 (_ BitVec 32) List!3788) Bool)

(assert (=> b!265927 (= lt!134313 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3785))))

(declare-fun b!265928 () Bool)

(declare-fun res!130197 () Bool)

(assert (=> b!265928 (=> (not res!130197) (not e!172165))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265928 (= res!130197 (and (= (size!6413 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6413 a!3436))))))

(declare-fun b!265929 () Bool)

(assert (=> b!265929 (= e!172165 e!172164)))

(declare-fun res!130196 () Bool)

(assert (=> b!265929 (=> (not res!130196) (not e!172164))))

(declare-datatypes ((SeekEntryResult!1217 0))(
  ( (MissingZero!1217 (index!7038 (_ BitVec 32))) (Found!1217 (index!7039 (_ BitVec 32))) (Intermediate!1217 (undefined!2029 Bool) (index!7040 (_ BitVec 32)) (x!25462 (_ BitVec 32))) (Undefined!1217) (MissingVacant!1217 (index!7041 (_ BitVec 32))) )
))
(declare-fun lt!134312 () SeekEntryResult!1217)

(assert (=> b!265929 (= res!130196 (or (= lt!134312 (MissingZero!1217 i!1355)) (= lt!134312 (MissingVacant!1217 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12814 (_ BitVec 32)) SeekEntryResult!1217)

(assert (=> b!265929 (= lt!134312 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265930 () Bool)

(declare-fun res!130199 () Bool)

(assert (=> b!265930 (=> (not res!130199) (not e!172165))))

(declare-fun arrayContainsKey!0 (array!12814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265930 (= res!130199 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25640 res!130198) b!265928))

(assert (= (and b!265928 res!130197) b!265925))

(assert (= (and b!265925 res!130195) b!265930))

(assert (= (and b!265930 res!130199) b!265929))

(assert (= (and b!265929 res!130196) b!265926))

(assert (= (and b!265926 res!130200) b!265927))

(declare-fun m!282791 () Bool)

(assert (=> start!25640 m!282791))

(declare-fun m!282793 () Bool)

(assert (=> start!25640 m!282793))

(declare-fun m!282795 () Bool)

(assert (=> b!265926 m!282795))

(declare-fun m!282797 () Bool)

(assert (=> b!265927 m!282797))

(declare-fun m!282799 () Bool)

(assert (=> b!265929 m!282799))

(declare-fun m!282801 () Bool)

(assert (=> b!265925 m!282801))

(declare-fun m!282803 () Bool)

(assert (=> b!265930 m!282803))

(check-sat (not b!265926) (not start!25640) (not b!265925) (not b!265930) (not b!265927) (not b!265929))
(check-sat)
