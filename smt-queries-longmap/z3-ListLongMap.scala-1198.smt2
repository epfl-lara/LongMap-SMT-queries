; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25658 () Bool)

(assert start!25658)

(declare-fun b!266087 () Bool)

(declare-fun e!172246 () Bool)

(assert (=> b!266087 (= e!172246 false)))

(declare-fun lt!134366 () Bool)

(declare-datatypes ((array!12832 0))(
  ( (array!12833 (arr!6070 (Array (_ BitVec 32) (_ BitVec 64))) (size!6422 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12832)

(declare-datatypes ((List!3797 0))(
  ( (Nil!3794) (Cons!3793 (h!4460 (_ BitVec 64)) (t!8871 List!3797)) )
))
(declare-fun arrayNoDuplicates!0 (array!12832 (_ BitVec 32) List!3797) Bool)

(assert (=> b!266087 (= lt!134366 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3794))))

(declare-fun res!130357 () Bool)

(declare-fun e!172245 () Bool)

(assert (=> start!25658 (=> (not res!130357) (not e!172245))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25658 (= res!130357 (validMask!0 mask!4002))))

(assert (=> start!25658 e!172245))

(assert (=> start!25658 true))

(declare-fun array_inv!4020 (array!12832) Bool)

(assert (=> start!25658 (array_inv!4020 a!3436)))

(declare-fun b!266088 () Bool)

(declare-fun res!130361 () Bool)

(assert (=> b!266088 (=> (not res!130361) (not e!172245))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266088 (= res!130361 (and (= (size!6422 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6422 a!3436))))))

(declare-fun b!266089 () Bool)

(declare-fun res!130360 () Bool)

(assert (=> b!266089 (=> (not res!130360) (not e!172245))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266089 (= res!130360 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266090 () Bool)

(declare-fun res!130358 () Bool)

(assert (=> b!266090 (=> (not res!130358) (not e!172246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12832 (_ BitVec 32)) Bool)

(assert (=> b!266090 (= res!130358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266091 () Bool)

(assert (=> b!266091 (= e!172245 e!172246)))

(declare-fun res!130359 () Bool)

(assert (=> b!266091 (=> (not res!130359) (not e!172246))))

(declare-datatypes ((SeekEntryResult!1226 0))(
  ( (MissingZero!1226 (index!7074 (_ BitVec 32))) (Found!1226 (index!7075 (_ BitVec 32))) (Intermediate!1226 (undefined!2038 Bool) (index!7076 (_ BitVec 32)) (x!25495 (_ BitVec 32))) (Undefined!1226) (MissingVacant!1226 (index!7077 (_ BitVec 32))) )
))
(declare-fun lt!134367 () SeekEntryResult!1226)

(assert (=> b!266091 (= res!130359 (or (= lt!134367 (MissingZero!1226 i!1355)) (= lt!134367 (MissingVacant!1226 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12832 (_ BitVec 32)) SeekEntryResult!1226)

(assert (=> b!266091 (= lt!134367 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266092 () Bool)

(declare-fun res!130362 () Bool)

(assert (=> b!266092 (=> (not res!130362) (not e!172245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266092 (= res!130362 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25658 res!130357) b!266088))

(assert (= (and b!266088 res!130361) b!266092))

(assert (= (and b!266092 res!130362) b!266089))

(assert (= (and b!266089 res!130360) b!266091))

(assert (= (and b!266091 res!130359) b!266090))

(assert (= (and b!266090 res!130358) b!266087))

(declare-fun m!282917 () Bool)

(assert (=> start!25658 m!282917))

(declare-fun m!282919 () Bool)

(assert (=> start!25658 m!282919))

(declare-fun m!282921 () Bool)

(assert (=> b!266087 m!282921))

(declare-fun m!282923 () Bool)

(assert (=> b!266092 m!282923))

(declare-fun m!282925 () Bool)

(assert (=> b!266089 m!282925))

(declare-fun m!282927 () Bool)

(assert (=> b!266091 m!282927))

(declare-fun m!282929 () Bool)

(assert (=> b!266090 m!282929))

(check-sat (not b!266090) (not b!266089) (not b!266087) (not start!25658) (not b!266091) (not b!266092))
(check-sat)
