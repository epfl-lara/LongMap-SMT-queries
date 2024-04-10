; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36434 () Bool)

(assert start!36434)

(declare-fun b!364337 () Bool)

(declare-fun res!203498 () Bool)

(declare-fun e!223050 () Bool)

(assert (=> b!364337 (=> (not res!203498) (not e!223050))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364337 (= res!203498 (validKeyInArray!0 k0!2974))))

(declare-fun res!203500 () Bool)

(assert (=> start!36434 (=> (not res!203500) (not e!223050))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20714 0))(
  ( (array!20715 (arr!9836 (Array (_ BitVec 32) (_ BitVec 64))) (size!10188 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20714)

(assert (=> start!36434 (= res!203500 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10188 a!4289))))))

(assert (=> start!36434 e!223050))

(assert (=> start!36434 true))

(declare-fun array_inv!7278 (array!20714) Bool)

(assert (=> start!36434 (array_inv!7278 a!4289)))

(declare-fun b!364339 () Bool)

(assert (=> b!364339 (= e!223050 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168474 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20714 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364339 (= lt!168474 (arrayCountValidKeys!0 (array!20715 (store (arr!9836 a!4289) i!1472 k0!2974) (size!10188 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168475 () (_ BitVec 32))

(assert (=> b!364339 (= lt!168475 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364336 () Bool)

(declare-fun res!203497 () Bool)

(assert (=> b!364336 (=> (not res!203497) (not e!223050))))

(assert (=> b!364336 (= res!203497 (not (validKeyInArray!0 (select (arr!9836 a!4289) i!1472))))))

(declare-fun b!364338 () Bool)

(declare-fun res!203499 () Bool)

(assert (=> b!364338 (=> (not res!203499) (not e!223050))))

(assert (=> b!364338 (= res!203499 (and (bvslt (size!10188 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10188 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36434 res!203500) b!364336))

(assert (= (and b!364336 res!203497) b!364337))

(assert (= (and b!364337 res!203498) b!364338))

(assert (= (and b!364338 res!203499) b!364339))

(declare-fun m!361843 () Bool)

(assert (=> b!364337 m!361843))

(declare-fun m!361845 () Bool)

(assert (=> start!36434 m!361845))

(declare-fun m!361847 () Bool)

(assert (=> b!364339 m!361847))

(declare-fun m!361849 () Bool)

(assert (=> b!364339 m!361849))

(declare-fun m!361851 () Bool)

(assert (=> b!364339 m!361851))

(declare-fun m!361853 () Bool)

(assert (=> b!364336 m!361853))

(assert (=> b!364336 m!361853))

(declare-fun m!361855 () Bool)

(assert (=> b!364336 m!361855))

(check-sat (not b!364336) (not start!36434) (not b!364339) (not b!364337))
