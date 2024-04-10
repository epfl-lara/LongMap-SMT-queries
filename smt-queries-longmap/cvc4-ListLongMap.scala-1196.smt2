; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25646 () Bool)

(assert start!25646)

(declare-fun b!265968 () Bool)

(declare-fun res!130267 () Bool)

(declare-fun e!172186 () Bool)

(assert (=> b!265968 (=> (not res!130267) (not e!172186))))

(declare-datatypes ((array!12825 0))(
  ( (array!12826 (arr!6067 (Array (_ BitVec 32) (_ BitVec 64))) (size!6419 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12825)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265968 (= res!130267 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265969 () Bool)

(declare-fun res!130265 () Bool)

(assert (=> b!265969 (=> (not res!130265) (not e!172186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265969 (= res!130265 (validKeyInArray!0 k!2698))))

(declare-fun b!265970 () Bool)

(declare-fun res!130269 () Bool)

(assert (=> b!265970 (=> (not res!130269) (not e!172186))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265970 (= res!130269 (and (= (size!6419 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6419 a!3436))))))

(declare-fun res!130264 () Bool)

(assert (=> start!25646 (=> (not res!130264) (not e!172186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25646 (= res!130264 (validMask!0 mask!4002))))

(assert (=> start!25646 e!172186))

(assert (=> start!25646 true))

(declare-fun array_inv!4030 (array!12825) Bool)

(assert (=> start!25646 (array_inv!4030 a!3436)))

(declare-fun b!265971 () Bool)

(declare-fun res!130266 () Bool)

(declare-fun e!172185 () Bool)

(assert (=> b!265971 (=> (not res!130266) (not e!172185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12825 (_ BitVec 32)) Bool)

(assert (=> b!265971 (= res!130266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265972 () Bool)

(assert (=> b!265972 (= e!172186 e!172185)))

(declare-fun res!130268 () Bool)

(assert (=> b!265972 (=> (not res!130268) (not e!172185))))

(declare-datatypes ((SeekEntryResult!1258 0))(
  ( (MissingZero!1258 (index!7202 (_ BitVec 32))) (Found!1258 (index!7203 (_ BitVec 32))) (Intermediate!1258 (undefined!2070 Bool) (index!7204 (_ BitVec 32)) (x!25511 (_ BitVec 32))) (Undefined!1258) (MissingVacant!1258 (index!7205 (_ BitVec 32))) )
))
(declare-fun lt!134283 () SeekEntryResult!1258)

(assert (=> b!265972 (= res!130268 (or (= lt!134283 (MissingZero!1258 i!1355)) (= lt!134283 (MissingVacant!1258 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12825 (_ BitVec 32)) SeekEntryResult!1258)

(assert (=> b!265972 (= lt!134283 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265973 () Bool)

(assert (=> b!265973 (= e!172185 false)))

(declare-fun lt!134284 () Bool)

(declare-datatypes ((List!3881 0))(
  ( (Nil!3878) (Cons!3877 (h!4544 (_ BitVec 64)) (t!8963 List!3881)) )
))
(declare-fun arrayNoDuplicates!0 (array!12825 (_ BitVec 32) List!3881) Bool)

(assert (=> b!265973 (= lt!134284 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3878))))

(assert (= (and start!25646 res!130264) b!265970))

(assert (= (and b!265970 res!130269) b!265969))

(assert (= (and b!265969 res!130265) b!265968))

(assert (= (and b!265968 res!130267) b!265972))

(assert (= (and b!265972 res!130268) b!265971))

(assert (= (and b!265971 res!130266) b!265973))

(declare-fun m!282655 () Bool)

(assert (=> b!265973 m!282655))

(declare-fun m!282657 () Bool)

(assert (=> b!265972 m!282657))

(declare-fun m!282659 () Bool)

(assert (=> b!265969 m!282659))

(declare-fun m!282661 () Bool)

(assert (=> start!25646 m!282661))

(declare-fun m!282663 () Bool)

(assert (=> start!25646 m!282663))

(declare-fun m!282665 () Bool)

(assert (=> b!265971 m!282665))

(declare-fun m!282667 () Bool)

(assert (=> b!265968 m!282667))

(push 1)

