; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32006 () Bool)

(assert start!32006)

(declare-fun b!319590 () Bool)

(declare-fun res!173974 () Bool)

(declare-fun e!198466 () Bool)

(assert (=> b!319590 (=> (not res!173974) (not e!198466))))

(declare-datatypes ((array!16313 0))(
  ( (array!16314 (arr!7720 (Array (_ BitVec 32) (_ BitVec 64))) (size!8072 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16313)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16313 (_ BitVec 32)) Bool)

(assert (=> b!319590 (= res!173974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319591 () Bool)

(declare-fun res!173976 () Bool)

(assert (=> b!319591 (=> (not res!173976) (not e!198466))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319591 (= res!173976 (validKeyInArray!0 k!2497))))

(declare-fun b!319592 () Bool)

(declare-fun res!173975 () Bool)

(assert (=> b!319592 (=> (not res!173975) (not e!198466))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319592 (= res!173975 (and (= (size!8072 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8072 a!3305))))))

(declare-fun b!319593 () Bool)

(declare-fun res!173978 () Bool)

(assert (=> b!319593 (=> (not res!173978) (not e!198466))))

(declare-fun arrayContainsKey!0 (array!16313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319593 (= res!173978 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173977 () Bool)

(assert (=> start!32006 (=> (not res!173977) (not e!198466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32006 (= res!173977 (validMask!0 mask!3777))))

(assert (=> start!32006 e!198466))

(assert (=> start!32006 true))

(declare-fun array_inv!5683 (array!16313) Bool)

(assert (=> start!32006 (array_inv!5683 a!3305)))

(declare-fun b!319594 () Bool)

(assert (=> b!319594 (= e!198466 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319595 () Bool)

(declare-fun res!173979 () Bool)

(assert (=> b!319595 (=> (not res!173979) (not e!198466))))

(declare-datatypes ((SeekEntryResult!2851 0))(
  ( (MissingZero!2851 (index!13580 (_ BitVec 32))) (Found!2851 (index!13581 (_ BitVec 32))) (Intermediate!2851 (undefined!3663 Bool) (index!13582 (_ BitVec 32)) (x!31853 (_ BitVec 32))) (Undefined!2851) (MissingVacant!2851 (index!13583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16313 (_ BitVec 32)) SeekEntryResult!2851)

(assert (=> b!319595 (= res!173979 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2851 i!1250)))))

(assert (= (and start!32006 res!173977) b!319592))

(assert (= (and b!319592 res!173975) b!319591))

(assert (= (and b!319591 res!173976) b!319593))

(assert (= (and b!319593 res!173978) b!319595))

(assert (= (and b!319595 res!173979) b!319590))

(assert (= (and b!319590 res!173974) b!319594))

(declare-fun m!328151 () Bool)

(assert (=> b!319593 m!328151))

(declare-fun m!328153 () Bool)

(assert (=> b!319590 m!328153))

(declare-fun m!328155 () Bool)

(assert (=> start!32006 m!328155))

(declare-fun m!328157 () Bool)

(assert (=> start!32006 m!328157))

(declare-fun m!328159 () Bool)

(assert (=> b!319591 m!328159))

(declare-fun m!328161 () Bool)

(assert (=> b!319595 m!328161))

(push 1)

(assert (not b!319593))

(assert (not b!319591))

(assert (not start!32006))

(assert (not b!319595))

(assert (not b!319590))

(check-sat)

