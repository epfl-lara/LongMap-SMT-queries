; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49686 () Bool)

(assert start!49686)

(declare-fun b!546259 () Bool)

(declare-fun res!340117 () Bool)

(declare-fun e!315716 () Bool)

(assert (=> b!546259 (=> (not res!340117) (not e!315716))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34446 0))(
  ( (array!34447 (arr!16550 (Array (_ BitVec 32) (_ BitVec 64))) (size!16915 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34446)

(assert (=> b!546259 (= res!340117 (and (= (size!16915 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16915 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16915 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340116 () Bool)

(assert (=> start!49686 (=> (not res!340116) (not e!315716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49686 (= res!340116 (validMask!0 mask!3119))))

(assert (=> start!49686 e!315716))

(assert (=> start!49686 true))

(declare-fun array_inv!12433 (array!34446) Bool)

(assert (=> start!49686 (array_inv!12433 a!3118)))

(declare-fun b!546262 () Bool)

(assert (=> b!546262 (= e!315716 (and (bvslt #b00000000000000000000000000000000 (size!16915 a!3118)) (bvsge (size!16915 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!546261 () Bool)

(declare-fun res!340118 () Bool)

(assert (=> b!546261 (=> (not res!340118) (not e!315716))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546261 (= res!340118 (validKeyInArray!0 k0!1914))))

(declare-fun b!546260 () Bool)

(declare-fun res!340115 () Bool)

(assert (=> b!546260 (=> (not res!340115) (not e!315716))))

(assert (=> b!546260 (= res!340115 (validKeyInArray!0 (select (arr!16550 a!3118) j!142)))))

(assert (= (and start!49686 res!340116) b!546259))

(assert (= (and b!546259 res!340117) b!546260))

(assert (= (and b!546260 res!340115) b!546261))

(assert (= (and b!546261 res!340118) b!546262))

(declare-fun m!523207 () Bool)

(assert (=> start!49686 m!523207))

(declare-fun m!523209 () Bool)

(assert (=> start!49686 m!523209))

(declare-fun m!523211 () Bool)

(assert (=> b!546261 m!523211))

(declare-fun m!523213 () Bool)

(assert (=> b!546260 m!523213))

(assert (=> b!546260 m!523213))

(declare-fun m!523215 () Bool)

(assert (=> b!546260 m!523215))

(check-sat (not start!49686) (not b!546260) (not b!546261))
(check-sat)
(get-model)

(declare-fun d!82151 () Bool)

(assert (=> d!82151 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49686 d!82151))

(declare-fun d!82163 () Bool)

(assert (=> d!82163 (= (array_inv!12433 a!3118) (bvsge (size!16915 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49686 d!82163))

(declare-fun d!82165 () Bool)

(assert (=> d!82165 (= (validKeyInArray!0 (select (arr!16550 a!3118) j!142)) (and (not (= (select (arr!16550 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16550 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546260 d!82165))

(declare-fun d!82167 () Bool)

(assert (=> d!82167 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546261 d!82167))

(check-sat)
