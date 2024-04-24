; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36406 () Bool)

(assert start!36406)

(declare-fun b!364196 () Bool)

(declare-fun e!222977 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364196 (= e!222977 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun res!203403 () Bool)

(assert (=> start!36406 (=> (not res!203403) (not e!222977))))

(declare-datatypes ((array!20681 0))(
  ( (array!20682 (arr!9819 (Array (_ BitVec 32) (_ BitVec 64))) (size!10171 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20681)

(assert (=> start!36406 (= res!203403 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10171 a!4289))))))

(assert (=> start!36406 e!222977))

(assert (=> start!36406 true))

(declare-fun array_inv!7291 (array!20681) Bool)

(assert (=> start!36406 (array_inv!7291 a!4289)))

(declare-fun b!364197 () Bool)

(declare-fun res!203407 () Bool)

(assert (=> b!364197 (=> (not res!203407) (not e!222977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364197 (= res!203407 (not (validKeyInArray!0 (select (arr!9819 a!4289) i!1472))))))

(declare-fun b!364198 () Bool)

(declare-fun res!203405 () Bool)

(assert (=> b!364198 (=> (not res!203405) (not e!222977))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364198 (= res!203405 (= (arrayCountValidKeys!0 (array!20682 (store (arr!9819 a!4289) i!1472 k0!2974) (size!10171 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364199 () Bool)

(declare-fun res!203404 () Bool)

(assert (=> b!364199 (=> (not res!203404) (not e!222977))))

(assert (=> b!364199 (= res!203404 (validKeyInArray!0 k0!2974))))

(declare-fun b!364200 () Bool)

(declare-fun res!203406 () Bool)

(assert (=> b!364200 (=> (not res!203406) (not e!222977))))

(assert (=> b!364200 (= res!203406 (and (bvslt (size!10171 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10171 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36406 res!203403) b!364197))

(assert (= (and b!364197 res!203407) b!364199))

(assert (= (and b!364199 res!203404) b!364200))

(assert (= (and b!364200 res!203406) b!364198))

(assert (= (and b!364198 res!203405) b!364196))

(declare-fun m!361975 () Bool)

(assert (=> start!36406 m!361975))

(declare-fun m!361977 () Bool)

(assert (=> b!364197 m!361977))

(assert (=> b!364197 m!361977))

(declare-fun m!361979 () Bool)

(assert (=> b!364197 m!361979))

(declare-fun m!361981 () Bool)

(assert (=> b!364198 m!361981))

(declare-fun m!361983 () Bool)

(assert (=> b!364198 m!361983))

(declare-fun m!361985 () Bool)

(assert (=> b!364198 m!361985))

(declare-fun m!361987 () Bool)

(assert (=> b!364199 m!361987))

(check-sat (not b!364199) (not start!36406) (not b!364197) (not b!364198))
(check-sat)
