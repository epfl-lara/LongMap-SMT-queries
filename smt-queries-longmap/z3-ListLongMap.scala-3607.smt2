; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49700 () Bool)

(assert start!49700)

(declare-fun b!546545 () Bool)

(declare-fun e!315896 () Bool)

(declare-datatypes ((array!34450 0))(
  ( (array!34451 (arr!16552 (Array (_ BitVec 32) (_ BitVec 64))) (size!16916 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34450)

(assert (=> b!546545 (= e!315896 (and (bvslt #b00000000000000000000000000000000 (size!16916 a!3118)) (bvsge (size!16916 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!546543 () Bool)

(declare-fun res!340258 () Bool)

(assert (=> b!546543 (=> (not res!340258) (not e!315896))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546543 (= res!340258 (validKeyInArray!0 (select (arr!16552 a!3118) j!142)))))

(declare-fun b!546544 () Bool)

(declare-fun res!340256 () Bool)

(assert (=> b!546544 (=> (not res!340256) (not e!315896))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!546544 (= res!340256 (validKeyInArray!0 k0!1914))))

(declare-fun res!340259 () Bool)

(assert (=> start!49700 (=> (not res!340259) (not e!315896))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49700 (= res!340259 (validMask!0 mask!3119))))

(assert (=> start!49700 e!315896))

(assert (=> start!49700 true))

(declare-fun array_inv!12348 (array!34450) Bool)

(assert (=> start!49700 (array_inv!12348 a!3118)))

(declare-fun b!546542 () Bool)

(declare-fun res!340257 () Bool)

(assert (=> b!546542 (=> (not res!340257) (not e!315896))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546542 (= res!340257 (and (= (size!16916 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16916 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16916 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49700 res!340259) b!546542))

(assert (= (and b!546542 res!340257) b!546543))

(assert (= (and b!546543 res!340258) b!546544))

(assert (= (and b!546544 res!340256) b!546545))

(declare-fun m!523969 () Bool)

(assert (=> b!546543 m!523969))

(assert (=> b!546543 m!523969))

(declare-fun m!523971 () Bool)

(assert (=> b!546543 m!523971))

(declare-fun m!523973 () Bool)

(assert (=> b!546544 m!523973))

(declare-fun m!523975 () Bool)

(assert (=> start!49700 m!523975))

(declare-fun m!523977 () Bool)

(assert (=> start!49700 m!523977))

(check-sat (not start!49700) (not b!546543) (not b!546544))
(check-sat)
(get-model)

(declare-fun d!82357 () Bool)

(assert (=> d!82357 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49700 d!82357))

(declare-fun d!82363 () Bool)

(assert (=> d!82363 (= (array_inv!12348 a!3118) (bvsge (size!16916 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49700 d!82363))

(declare-fun d!82365 () Bool)

(assert (=> d!82365 (= (validKeyInArray!0 (select (arr!16552 a!3118) j!142)) (and (not (= (select (arr!16552 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16552 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546543 d!82365))

(declare-fun d!82367 () Bool)

(assert (=> d!82367 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546544 d!82367))

(check-sat)
