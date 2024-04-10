; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92448 () Bool)

(assert start!92448)

(declare-fun b!1051134 () Bool)

(declare-fun res!700262 () Bool)

(declare-fun e!596613 () Bool)

(assert (=> b!1051134 (=> (not res!700262) (not e!596613))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051134 (= res!700262 (validKeyInArray!0 k!2747))))

(declare-fun res!700260 () Bool)

(assert (=> start!92448 (=> (not res!700260) (not e!596613))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66249 0))(
  ( (array!66250 (arr!31864 (Array (_ BitVec 32) (_ BitVec 64))) (size!32400 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66249)

(assert (=> start!92448 (= res!700260 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32400 a!3488)) (bvslt (size!32400 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92448 e!596613))

(assert (=> start!92448 true))

(declare-fun array_inv!24644 (array!66249) Bool)

(assert (=> start!92448 (array_inv!24644 a!3488)))

(declare-fun b!1051135 () Bool)

(declare-fun e!596611 () Bool)

(declare-fun arrayContainsKey!0 (array!66249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051135 (= e!596611 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051136 () Bool)

(declare-fun res!700261 () Bool)

(assert (=> b!1051136 (=> (not res!700261) (not e!596613))))

(assert (=> b!1051136 (= res!700261 (= (select (arr!31864 a!3488) i!1381) k!2747))))

(declare-fun b!1051137 () Bool)

(declare-fun e!596612 () Bool)

(assert (=> b!1051137 (= e!596612 e!596611)))

(declare-fun res!700267 () Bool)

(assert (=> b!1051137 (=> res!700267 e!596611)))

(declare-fun lt!464172 () (_ BitVec 32))

(assert (=> b!1051137 (= res!700267 (or (bvsgt lt!464172 i!1381) (bvsle i!1381 lt!464172)))))

(declare-fun b!1051138 () Bool)

(declare-fun e!596617 () Bool)

(declare-fun e!596616 () Bool)

(assert (=> b!1051138 (= e!596617 e!596616)))

(declare-fun res!700264 () Bool)

(assert (=> b!1051138 (=> (not res!700264) (not e!596616))))

(assert (=> b!1051138 (= res!700264 (not (= lt!464172 i!1381)))))

(declare-fun lt!464171 () array!66249)

(declare-fun arrayScanForKey!0 (array!66249 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051138 (= lt!464172 (arrayScanForKey!0 lt!464171 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051139 () Bool)

(declare-fun res!700266 () Bool)

(assert (=> b!1051139 (=> (not res!700266) (not e!596613))))

(declare-datatypes ((List!22176 0))(
  ( (Nil!22173) (Cons!22172 (h!23381 (_ BitVec 64)) (t!31483 List!22176)) )
))
(declare-fun arrayNoDuplicates!0 (array!66249 (_ BitVec 32) List!22176) Bool)

(assert (=> b!1051139 (= res!700266 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22173))))

(declare-fun b!1051140 () Bool)

(declare-fun e!596614 () Bool)

(assert (=> b!1051140 (= e!596614 true)))

(assert (=> b!1051140 (arrayNoDuplicates!0 a!3488 lt!464172 Nil!22173)))

(declare-datatypes ((Unit!34400 0))(
  ( (Unit!34401) )
))
(declare-fun lt!464170 () Unit!34400)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66249 (_ BitVec 32) (_ BitVec 32)) Unit!34400)

(assert (=> b!1051140 (= lt!464170 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464172))))

(declare-fun b!1051141 () Bool)

(assert (=> b!1051141 (= e!596616 (not e!596614))))

(declare-fun res!700265 () Bool)

(assert (=> b!1051141 (=> res!700265 e!596614)))

(assert (=> b!1051141 (= res!700265 (or (bvsgt lt!464172 i!1381) (bvsle i!1381 lt!464172)))))

(assert (=> b!1051141 e!596612))

(declare-fun res!700268 () Bool)

(assert (=> b!1051141 (=> (not res!700268) (not e!596612))))

(assert (=> b!1051141 (= res!700268 (= (select (store (arr!31864 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464172) k!2747))))

(declare-fun b!1051142 () Bool)

(assert (=> b!1051142 (= e!596613 e!596617)))

(declare-fun res!700263 () Bool)

(assert (=> b!1051142 (=> (not res!700263) (not e!596617))))

(assert (=> b!1051142 (= res!700263 (arrayContainsKey!0 lt!464171 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051142 (= lt!464171 (array!66250 (store (arr!31864 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32400 a!3488)))))

(assert (= (and start!92448 res!700260) b!1051139))

(assert (= (and b!1051139 res!700266) b!1051134))

(assert (= (and b!1051134 res!700262) b!1051136))

(assert (= (and b!1051136 res!700261) b!1051142))

(assert (= (and b!1051142 res!700263) b!1051138))

(assert (= (and b!1051138 res!700264) b!1051141))

(assert (= (and b!1051141 res!700268) b!1051137))

(assert (= (and b!1051137 (not res!700267)) b!1051135))

(assert (= (and b!1051141 (not res!700265)) b!1051140))

(declare-fun m!971693 () Bool)

(assert (=> b!1051134 m!971693))

(declare-fun m!971695 () Bool)

(assert (=> b!1051142 m!971695))

(declare-fun m!971697 () Bool)

(assert (=> b!1051142 m!971697))

(declare-fun m!971699 () Bool)

(assert (=> b!1051136 m!971699))

(declare-fun m!971701 () Bool)

(assert (=> b!1051138 m!971701))

(declare-fun m!971703 () Bool)

(assert (=> b!1051139 m!971703))

(declare-fun m!971705 () Bool)

(assert (=> b!1051140 m!971705))

(declare-fun m!971707 () Bool)

(assert (=> b!1051140 m!971707))

(declare-fun m!971709 () Bool)

(assert (=> start!92448 m!971709))

(declare-fun m!971711 () Bool)

(assert (=> b!1051135 m!971711))

(assert (=> b!1051141 m!971697))

(declare-fun m!971713 () Bool)

(assert (=> b!1051141 m!971713))

(push 1)

