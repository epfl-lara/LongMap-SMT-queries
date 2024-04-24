; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49814 () Bool)

(assert start!49814)

(declare-fun b!547137 () Bool)

(declare-fun res!340746 () Bool)

(declare-fun e!316182 () Bool)

(assert (=> b!547137 (=> (not res!340746) (not e!316182))))

(declare-datatypes ((array!34498 0))(
  ( (array!34499 (arr!16573 (Array (_ BitVec 32) (_ BitVec 64))) (size!16937 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34498)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547137 (= res!340746 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547138 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4978 0))(
  ( (MissingZero!4978 (index!22139 (_ BitVec 32))) (Found!4978 (index!22140 (_ BitVec 32))) (Intermediate!4978 (undefined!5790 Bool) (index!22141 (_ BitVec 32)) (x!51241 (_ BitVec 32))) (Undefined!4978) (MissingVacant!4978 (index!22142 (_ BitVec 32))) )
))
(declare-fun lt!249505 () SeekEntryResult!4978)

(assert (=> b!547138 (= e!316182 (and (or (= lt!249505 (MissingZero!4978 i!1132)) (= lt!249505 (MissingVacant!4978 i!1132))) (bvsgt #b00000000000000000000000000000000 (size!16937 a!3118))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34498 (_ BitVec 32)) SeekEntryResult!4978)

(assert (=> b!547138 (= lt!249505 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!340748 () Bool)

(assert (=> start!49814 (=> (not res!340748) (not e!316182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49814 (= res!340748 (validMask!0 mask!3119))))

(assert (=> start!49814 e!316182))

(assert (=> start!49814 true))

(declare-fun array_inv!12432 (array!34498) Bool)

(assert (=> start!49814 (array_inv!12432 a!3118)))

(declare-fun b!547139 () Bool)

(declare-fun res!340747 () Bool)

(assert (=> b!547139 (=> (not res!340747) (not e!316182))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547139 (= res!340747 (validKeyInArray!0 (select (arr!16573 a!3118) j!142)))))

(declare-fun b!547140 () Bool)

(declare-fun res!340750 () Bool)

(assert (=> b!547140 (=> (not res!340750) (not e!316182))))

(assert (=> b!547140 (= res!340750 (and (= (size!16937 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16937 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16937 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547141 () Bool)

(declare-fun res!340749 () Bool)

(assert (=> b!547141 (=> (not res!340749) (not e!316182))))

(assert (=> b!547141 (= res!340749 (validKeyInArray!0 k0!1914))))

(assert (= (and start!49814 res!340748) b!547140))

(assert (= (and b!547140 res!340750) b!547139))

(assert (= (and b!547139 res!340747) b!547141))

(assert (= (and b!547141 res!340749) b!547137))

(assert (= (and b!547137 res!340746) b!547138))

(declare-fun m!524671 () Bool)

(assert (=> start!49814 m!524671))

(declare-fun m!524673 () Bool)

(assert (=> start!49814 m!524673))

(declare-fun m!524675 () Bool)

(assert (=> b!547141 m!524675))

(declare-fun m!524677 () Bool)

(assert (=> b!547137 m!524677))

(declare-fun m!524679 () Bool)

(assert (=> b!547139 m!524679))

(assert (=> b!547139 m!524679))

(declare-fun m!524681 () Bool)

(assert (=> b!547139 m!524681))

(declare-fun m!524683 () Bool)

(assert (=> b!547138 m!524683))

(check-sat (not start!49814) (not b!547139) (not b!547137) (not b!547141) (not b!547138))
(check-sat)
