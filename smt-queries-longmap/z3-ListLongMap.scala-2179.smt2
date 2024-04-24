; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36394 () Bool)

(assert start!36394)

(declare-fun b!364115 () Bool)

(declare-fun res!203323 () Bool)

(declare-fun e!222940 () Bool)

(assert (=> b!364115 (=> (not res!203323) (not e!222940))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364115 (= res!203323 (validKeyInArray!0 k0!2974))))

(declare-fun b!364116 () Bool)

(declare-fun res!203325 () Bool)

(assert (=> b!364116 (=> (not res!203325) (not e!222940))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20669 0))(
  ( (array!20670 (arr!9813 (Array (_ BitVec 32) (_ BitVec 64))) (size!10165 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20669)

(assert (=> b!364116 (= res!203325 (and (bvslt (size!10165 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10165 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364117 () Bool)

(declare-fun res!203322 () Bool)

(assert (=> b!364117 (=> (not res!203322) (not e!222940))))

(declare-fun arrayCountValidKeys!0 (array!20669 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364117 (= res!203322 (= (arrayCountValidKeys!0 (array!20670 (store (arr!9813 a!4289) i!1472 k0!2974) (size!10165 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364118 () Bool)

(assert (=> b!364118 (= e!222940 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun b!364119 () Bool)

(declare-fun res!203324 () Bool)

(assert (=> b!364119 (=> (not res!203324) (not e!222940))))

(assert (=> b!364119 (= res!203324 (not (validKeyInArray!0 (select (arr!9813 a!4289) i!1472))))))

(declare-fun res!203326 () Bool)

(assert (=> start!36394 (=> (not res!203326) (not e!222940))))

(assert (=> start!36394 (= res!203326 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10165 a!4289))))))

(assert (=> start!36394 e!222940))

(assert (=> start!36394 true))

(declare-fun array_inv!7285 (array!20669) Bool)

(assert (=> start!36394 (array_inv!7285 a!4289)))

(assert (= (and start!36394 res!203326) b!364119))

(assert (= (and b!364119 res!203324) b!364115))

(assert (= (and b!364115 res!203323) b!364116))

(assert (= (and b!364116 res!203325) b!364117))

(assert (= (and b!364117 res!203322) b!364118))

(declare-fun m!361891 () Bool)

(assert (=> b!364115 m!361891))

(declare-fun m!361893 () Bool)

(assert (=> b!364117 m!361893))

(declare-fun m!361895 () Bool)

(assert (=> b!364117 m!361895))

(declare-fun m!361897 () Bool)

(assert (=> b!364117 m!361897))

(declare-fun m!361899 () Bool)

(assert (=> b!364119 m!361899))

(assert (=> b!364119 m!361899))

(declare-fun m!361901 () Bool)

(assert (=> b!364119 m!361901))

(declare-fun m!361903 () Bool)

(assert (=> start!36394 m!361903))

(check-sat (not start!36394) (not b!364115) (not b!364117) (not b!364119))
(check-sat)
