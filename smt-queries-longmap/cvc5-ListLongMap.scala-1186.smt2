; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25456 () Bool)

(assert start!25456)

(declare-fun b!264972 () Bool)

(declare-fun res!129484 () Bool)

(declare-fun e!171614 () Bool)

(assert (=> b!264972 (=> (not res!129484) (not e!171614))))

(declare-datatypes ((array!12752 0))(
  ( (array!12753 (arr!6035 (Array (_ BitVec 32) (_ BitVec 64))) (size!6387 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12752)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12752 (_ BitVec 32)) Bool)

(assert (=> b!264972 (= res!129484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!264973 () Bool)

(declare-fun res!129489 () Bool)

(declare-fun e!171613 () Bool)

(assert (=> b!264973 (=> (not res!129489) (not e!171613))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264973 (= res!129489 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264974 () Bool)

(declare-fun res!129488 () Bool)

(assert (=> b!264974 (=> (not res!129488) (not e!171613))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264974 (= res!129488 (and (= (size!6387 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6387 a!3436))))))

(declare-fun b!264975 () Bool)

(declare-fun res!129487 () Bool)

(assert (=> b!264975 (=> (not res!129487) (not e!171613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264975 (= res!129487 (validKeyInArray!0 k!2698))))

(declare-fun res!129485 () Bool)

(assert (=> start!25456 (=> (not res!129485) (not e!171613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25456 (= res!129485 (validMask!0 mask!4002))))

(assert (=> start!25456 e!171613))

(assert (=> start!25456 true))

(declare-fun array_inv!3998 (array!12752) Bool)

(assert (=> start!25456 (array_inv!3998 a!3436)))

(declare-fun b!264976 () Bool)

(assert (=> b!264976 (= e!171613 e!171614)))

(declare-fun res!129486 () Bool)

(assert (=> b!264976 (=> (not res!129486) (not e!171614))))

(declare-datatypes ((SeekEntryResult!1226 0))(
  ( (MissingZero!1226 (index!7074 (_ BitVec 32))) (Found!1226 (index!7075 (_ BitVec 32))) (Intermediate!1226 (undefined!2038 Bool) (index!7076 (_ BitVec 32)) (x!25399 (_ BitVec 32))) (Undefined!1226) (MissingVacant!1226 (index!7077 (_ BitVec 32))) )
))
(declare-fun lt!133951 () SeekEntryResult!1226)

(assert (=> b!264976 (= res!129486 (or (= lt!133951 (MissingZero!1226 i!1355)) (= lt!133951 (MissingVacant!1226 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12752 (_ BitVec 32)) SeekEntryResult!1226)

(assert (=> b!264976 (= lt!133951 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!264977 () Bool)

(assert (=> b!264977 (= e!171614 (bvsgt #b00000000000000000000000000000000 (size!6387 a!3436)))))

(assert (= (and start!25456 res!129485) b!264974))

(assert (= (and b!264974 res!129488) b!264975))

(assert (= (and b!264975 res!129487) b!264973))

(assert (= (and b!264973 res!129489) b!264976))

(assert (= (and b!264976 res!129486) b!264972))

(assert (= (and b!264972 res!129484) b!264977))

(declare-fun m!281925 () Bool)

(assert (=> b!264973 m!281925))

(declare-fun m!281927 () Bool)

(assert (=> b!264976 m!281927))

(declare-fun m!281929 () Bool)

(assert (=> start!25456 m!281929))

(declare-fun m!281931 () Bool)

(assert (=> start!25456 m!281931))

(declare-fun m!281933 () Bool)

(assert (=> b!264975 m!281933))

(declare-fun m!281935 () Bool)

(assert (=> b!264972 m!281935))

(push 1)

