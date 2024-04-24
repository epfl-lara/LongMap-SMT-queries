; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49820 () Bool)

(assert start!49820)

(declare-fun b!547186 () Bool)

(declare-fun res!340799 () Bool)

(declare-fun e!316203 () Bool)

(assert (=> b!547186 (=> (not res!340799) (not e!316203))))

(declare-datatypes ((array!34504 0))(
  ( (array!34505 (arr!16576 (Array (_ BitVec 32) (_ BitVec 64))) (size!16940 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34504)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547186 (= res!340799 (validKeyInArray!0 (select (arr!16576 a!3118) j!142)))))

(declare-fun b!547187 () Bool)

(declare-fun res!340798 () Bool)

(assert (=> b!547187 (=> (not res!340798) (not e!316203))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547187 (= res!340798 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547188 () Bool)

(declare-fun e!316202 () Bool)

(assert (=> b!547188 (= e!316202 (bvsgt #b00000000000000000000000000000000 (size!16940 a!3118)))))

(declare-fun b!547189 () Bool)

(declare-fun res!340795 () Bool)

(assert (=> b!547189 (=> (not res!340795) (not e!316203))))

(assert (=> b!547189 (= res!340795 (validKeyInArray!0 k0!1914))))

(declare-fun res!340796 () Bool)

(assert (=> start!49820 (=> (not res!340796) (not e!316203))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49820 (= res!340796 (validMask!0 mask!3119))))

(assert (=> start!49820 e!316203))

(assert (=> start!49820 true))

(declare-fun array_inv!12435 (array!34504) Bool)

(assert (=> start!49820 (array_inv!12435 a!3118)))

(declare-fun b!547190 () Bool)

(declare-fun res!340800 () Bool)

(assert (=> b!547190 (=> (not res!340800) (not e!316202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34504 (_ BitVec 32)) Bool)

(assert (=> b!547190 (= res!340800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547191 () Bool)

(assert (=> b!547191 (= e!316203 e!316202)))

(declare-fun res!340801 () Bool)

(assert (=> b!547191 (=> (not res!340801) (not e!316202))))

(declare-datatypes ((SeekEntryResult!4981 0))(
  ( (MissingZero!4981 (index!22151 (_ BitVec 32))) (Found!4981 (index!22152 (_ BitVec 32))) (Intermediate!4981 (undefined!5793 Bool) (index!22153 (_ BitVec 32)) (x!51252 (_ BitVec 32))) (Undefined!4981) (MissingVacant!4981 (index!22154 (_ BitVec 32))) )
))
(declare-fun lt!249514 () SeekEntryResult!4981)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547191 (= res!340801 (or (= lt!249514 (MissingZero!4981 i!1132)) (= lt!249514 (MissingVacant!4981 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34504 (_ BitVec 32)) SeekEntryResult!4981)

(assert (=> b!547191 (= lt!249514 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547192 () Bool)

(declare-fun res!340797 () Bool)

(assert (=> b!547192 (=> (not res!340797) (not e!316203))))

(assert (=> b!547192 (= res!340797 (and (= (size!16940 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16940 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16940 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49820 res!340796) b!547192))

(assert (= (and b!547192 res!340797) b!547186))

(assert (= (and b!547186 res!340799) b!547189))

(assert (= (and b!547189 res!340795) b!547187))

(assert (= (and b!547187 res!340798) b!547191))

(assert (= (and b!547191 res!340801) b!547190))

(assert (= (and b!547190 res!340800) b!547188))

(declare-fun m!524713 () Bool)

(assert (=> start!49820 m!524713))

(declare-fun m!524715 () Bool)

(assert (=> start!49820 m!524715))

(declare-fun m!524717 () Bool)

(assert (=> b!547187 m!524717))

(declare-fun m!524719 () Bool)

(assert (=> b!547189 m!524719))

(declare-fun m!524721 () Bool)

(assert (=> b!547191 m!524721))

(declare-fun m!524723 () Bool)

(assert (=> b!547186 m!524723))

(assert (=> b!547186 m!524723))

(declare-fun m!524725 () Bool)

(assert (=> b!547186 m!524725))

(declare-fun m!524727 () Bool)

(assert (=> b!547190 m!524727))

(check-sat (not b!547191) (not b!547189) (not b!547190) (not b!547187) (not start!49820) (not b!547186))
(check-sat)
