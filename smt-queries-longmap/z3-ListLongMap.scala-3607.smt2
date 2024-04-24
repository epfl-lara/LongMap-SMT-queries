; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49744 () Bool)

(assert start!49744)

(declare-fun res!340340 () Bool)

(declare-fun e!316020 () Bool)

(assert (=> start!49744 (=> (not res!340340) (not e!316020))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49744 (= res!340340 (validMask!0 mask!3119))))

(assert (=> start!49744 e!316020))

(assert (=> start!49744 true))

(declare-datatypes ((array!34442 0))(
  ( (array!34443 (arr!16546 (Array (_ BitVec 32) (_ BitVec 64))) (size!16910 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34442)

(declare-fun array_inv!12405 (array!34442) Bool)

(assert (=> start!49744 (array_inv!12405 a!3118)))

(declare-fun b!546730 () Bool)

(declare-fun res!340339 () Bool)

(assert (=> b!546730 (=> (not res!340339) (not e!316020))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546730 (= res!340339 (and (= (size!16910 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16910 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16910 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546733 () Bool)

(assert (=> b!546733 (= e!316020 (and (bvslt #b00000000000000000000000000000000 (size!16910 a!3118)) (bvsge (size!16910 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!546731 () Bool)

(declare-fun res!340341 () Bool)

(assert (=> b!546731 (=> (not res!340341) (not e!316020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546731 (= res!340341 (validKeyInArray!0 (select (arr!16546 a!3118) j!142)))))

(declare-fun b!546732 () Bool)

(declare-fun res!340342 () Bool)

(assert (=> b!546732 (=> (not res!340342) (not e!316020))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!546732 (= res!340342 (validKeyInArray!0 k0!1914))))

(assert (= (and start!49744 res!340340) b!546730))

(assert (= (and b!546730 res!340339) b!546731))

(assert (= (and b!546731 res!340341) b!546732))

(assert (= (and b!546732 res!340342) b!546733))

(declare-fun m!524311 () Bool)

(assert (=> start!49744 m!524311))

(declare-fun m!524313 () Bool)

(assert (=> start!49744 m!524313))

(declare-fun m!524315 () Bool)

(assert (=> b!546731 m!524315))

(assert (=> b!546731 m!524315))

(declare-fun m!524317 () Bool)

(assert (=> b!546731 m!524317))

(declare-fun m!524319 () Bool)

(assert (=> b!546732 m!524319))

(check-sat (not start!49744) (not b!546732) (not b!546731))
(check-sat)
(get-model)

(declare-fun d!82465 () Bool)

(assert (=> d!82465 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49744 d!82465))

(declare-fun d!82477 () Bool)

(assert (=> d!82477 (= (array_inv!12405 a!3118) (bvsge (size!16910 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49744 d!82477))

(declare-fun d!82479 () Bool)

(assert (=> d!82479 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546732 d!82479))

(declare-fun d!82481 () Bool)

(assert (=> d!82481 (= (validKeyInArray!0 (select (arr!16546 a!3118) j!142)) (and (not (= (select (arr!16546 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16546 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546731 d!82481))

(check-sat)
