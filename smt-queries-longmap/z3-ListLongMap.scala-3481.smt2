; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48230 () Bool)

(assert start!48230)

(declare-fun b!530933 () Bool)

(declare-fun res!326643 () Bool)

(declare-fun e!309259 () Bool)

(assert (=> b!530933 (=> (not res!326643) (not e!309259))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530933 (= res!326643 (validKeyInArray!0 k0!1998))))

(declare-fun b!530934 () Bool)

(declare-fun e!309260 () Bool)

(assert (=> b!530934 (= e!309259 e!309260)))

(declare-fun res!326645 () Bool)

(assert (=> b!530934 (=> (not res!326645) (not e!309260))))

(declare-datatypes ((SeekEntryResult!4632 0))(
  ( (MissingZero!4632 (index!20752 (_ BitVec 32))) (Found!4632 (index!20753 (_ BitVec 32))) (Intermediate!4632 (undefined!5444 Bool) (index!20754 (_ BitVec 32)) (x!49734 (_ BitVec 32))) (Undefined!4632) (MissingVacant!4632 (index!20755 (_ BitVec 32))) )
))
(declare-fun lt!244825 () SeekEntryResult!4632)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530934 (= res!326645 (or (= lt!244825 (MissingZero!4632 i!1153)) (= lt!244825 (MissingVacant!4632 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!33655 0))(
  ( (array!33656 (arr!16174 (Array (_ BitVec 32) (_ BitVec 64))) (size!16538 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33655)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33655 (_ BitVec 32)) SeekEntryResult!4632)

(assert (=> b!530934 (= lt!244825 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530935 () Bool)

(assert (=> b!530935 (= e!309260 (bvsgt #b00000000000000000000000000000000 (size!16538 a!3154)))))

(declare-fun res!326641 () Bool)

(assert (=> start!48230 (=> (not res!326641) (not e!309259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48230 (= res!326641 (validMask!0 mask!3216))))

(assert (=> start!48230 e!309259))

(assert (=> start!48230 true))

(declare-fun array_inv!11970 (array!33655) Bool)

(assert (=> start!48230 (array_inv!11970 a!3154)))

(declare-fun b!530936 () Bool)

(declare-fun res!326642 () Bool)

(assert (=> b!530936 (=> (not res!326642) (not e!309260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33655 (_ BitVec 32)) Bool)

(assert (=> b!530936 (= res!326642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530937 () Bool)

(declare-fun res!326644 () Bool)

(assert (=> b!530937 (=> (not res!326644) (not e!309259))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530937 (= res!326644 (and (= (size!16538 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16538 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16538 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530938 () Bool)

(declare-fun res!326640 () Bool)

(assert (=> b!530938 (=> (not res!326640) (not e!309259))))

(declare-fun arrayContainsKey!0 (array!33655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530938 (= res!326640 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530939 () Bool)

(declare-fun res!326639 () Bool)

(assert (=> b!530939 (=> (not res!326639) (not e!309259))))

(assert (=> b!530939 (= res!326639 (validKeyInArray!0 (select (arr!16174 a!3154) j!147)))))

(assert (= (and start!48230 res!326641) b!530937))

(assert (= (and b!530937 res!326644) b!530939))

(assert (= (and b!530939 res!326639) b!530933))

(assert (= (and b!530933 res!326643) b!530938))

(assert (= (and b!530938 res!326640) b!530934))

(assert (= (and b!530934 res!326645) b!530936))

(assert (= (and b!530936 res!326642) b!530935))

(declare-fun m!511465 () Bool)

(assert (=> b!530939 m!511465))

(assert (=> b!530939 m!511465))

(declare-fun m!511467 () Bool)

(assert (=> b!530939 m!511467))

(declare-fun m!511469 () Bool)

(assert (=> b!530934 m!511469))

(declare-fun m!511471 () Bool)

(assert (=> start!48230 m!511471))

(declare-fun m!511473 () Bool)

(assert (=> start!48230 m!511473))

(declare-fun m!511475 () Bool)

(assert (=> b!530933 m!511475))

(declare-fun m!511477 () Bool)

(assert (=> b!530938 m!511477))

(declare-fun m!511479 () Bool)

(assert (=> b!530936 m!511479))

(check-sat (not start!48230) (not b!530938) (not b!530933) (not b!530936) (not b!530934) (not b!530939))
(check-sat)
