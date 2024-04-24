; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48188 () Bool)

(assert start!48188)

(declare-fun b!530607 () Bool)

(declare-fun res!326367 () Bool)

(declare-fun e!309114 () Bool)

(assert (=> b!530607 (=> (not res!326367) (not e!309114))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530607 (= res!326367 (validKeyInArray!0 k!1998))))

(declare-fun b!530609 () Bool)

(declare-fun res!326370 () Bool)

(assert (=> b!530609 (=> (not res!326370) (not e!309114))))

(declare-datatypes ((array!33612 0))(
  ( (array!33613 (arr!16152 (Array (_ BitVec 32) (_ BitVec 64))) (size!16516 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33612)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530609 (= res!326370 (validKeyInArray!0 (select (arr!16152 a!3154) j!147)))))

(declare-fun b!530610 () Bool)

(declare-fun res!326368 () Bool)

(assert (=> b!530610 (=> (not res!326368) (not e!309114))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530610 (= res!326368 (and (= (size!16516 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16516 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16516 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530611 () Bool)

(assert (=> b!530611 (= e!309114 false)))

(declare-datatypes ((SeekEntryResult!4566 0))(
  ( (MissingZero!4566 (index!20488 (_ BitVec 32))) (Found!4566 (index!20489 (_ BitVec 32))) (Intermediate!4566 (undefined!5378 Bool) (index!20490 (_ BitVec 32)) (x!49617 (_ BitVec 32))) (Undefined!4566) (MissingVacant!4566 (index!20491 (_ BitVec 32))) )
))
(declare-fun lt!244786 () SeekEntryResult!4566)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33612 (_ BitVec 32)) SeekEntryResult!4566)

(assert (=> b!530611 (= lt!244786 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!326371 () Bool)

(assert (=> start!48188 (=> (not res!326371) (not e!309114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48188 (= res!326371 (validMask!0 mask!3216))))

(assert (=> start!48188 e!309114))

(assert (=> start!48188 true))

(declare-fun array_inv!12011 (array!33612) Bool)

(assert (=> start!48188 (array_inv!12011 a!3154)))

(declare-fun b!530608 () Bool)

(declare-fun res!326369 () Bool)

(assert (=> b!530608 (=> (not res!326369) (not e!309114))))

(declare-fun arrayContainsKey!0 (array!33612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530608 (= res!326369 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48188 res!326371) b!530610))

(assert (= (and b!530610 res!326368) b!530609))

(assert (= (and b!530609 res!326370) b!530607))

(assert (= (and b!530607 res!326367) b!530608))

(assert (= (and b!530608 res!326369) b!530611))

(declare-fun m!511409 () Bool)

(assert (=> b!530609 m!511409))

(assert (=> b!530609 m!511409))

(declare-fun m!511411 () Bool)

(assert (=> b!530609 m!511411))

(declare-fun m!511413 () Bool)

(assert (=> b!530607 m!511413))

(declare-fun m!511415 () Bool)

(assert (=> b!530608 m!511415))

(declare-fun m!511417 () Bool)

(assert (=> start!48188 m!511417))

(declare-fun m!511419 () Bool)

(assert (=> start!48188 m!511419))

(declare-fun m!511421 () Bool)

(assert (=> b!530611 m!511421))

(push 1)

(assert (not b!530611))

(assert (not b!530609))

(assert (not start!48188))

(assert (not b!530608))

(assert (not b!530607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

