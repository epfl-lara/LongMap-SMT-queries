; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28674 () Bool)

(assert start!28674)

(declare-fun b!293091 () Bool)

(declare-fun e!185350 () Bool)

(assert (=> b!293091 (= e!185350 false)))

(declare-datatypes ((array!14853 0))(
  ( (array!14854 (arr!7049 (Array (_ BitVec 32) (_ BitVec 64))) (size!7401 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14853)

(declare-datatypes ((SeekEntryResult!2198 0))(
  ( (MissingZero!2198 (index!10962 (_ BitVec 32))) (Found!2198 (index!10963 (_ BitVec 32))) (Intermediate!2198 (undefined!3010 Bool) (index!10964 (_ BitVec 32)) (x!29141 (_ BitVec 32))) (Undefined!2198) (MissingVacant!2198 (index!10965 (_ BitVec 32))) )
))
(declare-fun lt!145272 () SeekEntryResult!2198)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14853 (_ BitVec 32)) SeekEntryResult!2198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293091 (= lt!145272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293092 () Bool)

(declare-fun res!154151 () Bool)

(assert (=> b!293092 (=> (not res!154151) (not e!185350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14853 (_ BitVec 32)) Bool)

(assert (=> b!293092 (= res!154151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293093 () Bool)

(declare-fun res!154152 () Bool)

(declare-fun e!185349 () Bool)

(assert (=> b!293093 (=> (not res!154152) (not e!185349))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293093 (= res!154152 (and (= (size!7401 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7401 a!3312))))))

(declare-fun b!293094 () Bool)

(assert (=> b!293094 (= e!185349 e!185350)))

(declare-fun res!154149 () Bool)

(assert (=> b!293094 (=> (not res!154149) (not e!185350))))

(declare-fun lt!145273 () SeekEntryResult!2198)

(assert (=> b!293094 (= res!154149 (or (= lt!145273 (MissingZero!2198 i!1256)) (= lt!145273 (MissingVacant!2198 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14853 (_ BitVec 32)) SeekEntryResult!2198)

(assert (=> b!293094 (= lt!145273 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!293096 () Bool)

(declare-fun res!154150 () Bool)

(assert (=> b!293096 (=> (not res!154150) (not e!185349))))

(declare-fun arrayContainsKey!0 (array!14853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293096 (= res!154150 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154147 () Bool)

(assert (=> start!28674 (=> (not res!154147) (not e!185349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28674 (= res!154147 (validMask!0 mask!3809))))

(assert (=> start!28674 e!185349))

(assert (=> start!28674 true))

(declare-fun array_inv!5012 (array!14853) Bool)

(assert (=> start!28674 (array_inv!5012 a!3312)))

(declare-fun b!293095 () Bool)

(declare-fun res!154148 () Bool)

(assert (=> b!293095 (=> (not res!154148) (not e!185349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293095 (= res!154148 (validKeyInArray!0 k!2524))))

(assert (= (and start!28674 res!154147) b!293093))

(assert (= (and b!293093 res!154152) b!293095))

(assert (= (and b!293095 res!154148) b!293096))

(assert (= (and b!293096 res!154150) b!293094))

(assert (= (and b!293094 res!154149) b!293092))

(assert (= (and b!293092 res!154151) b!293091))

(declare-fun m!306897 () Bool)

(assert (=> start!28674 m!306897))

(declare-fun m!306899 () Bool)

(assert (=> start!28674 m!306899))

(declare-fun m!306901 () Bool)

(assert (=> b!293092 m!306901))

(declare-fun m!306903 () Bool)

(assert (=> b!293091 m!306903))

(assert (=> b!293091 m!306903))

(declare-fun m!306905 () Bool)

(assert (=> b!293091 m!306905))

(declare-fun m!306907 () Bool)

(assert (=> b!293094 m!306907))

(declare-fun m!306909 () Bool)

(assert (=> b!293095 m!306909))

(declare-fun m!306911 () Bool)

(assert (=> b!293096 m!306911))

(push 1)

