; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127532 () Bool)

(assert start!127532)

(declare-fun b!1498308 () Bool)

(declare-fun res!1019387 () Bool)

(declare-fun e!838975 () Bool)

(assert (=> b!1498308 (=> (not res!1019387) (not e!838975))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99913 0))(
  ( (array!99914 (arr!48216 (Array (_ BitVec 32) (_ BitVec 64))) (size!48766 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99913)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498308 (= res!1019387 (and (= (size!48766 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48766 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48766 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019388 () Bool)

(assert (=> start!127532 (=> (not res!1019388) (not e!838975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127532 (= res!1019388 (validMask!0 mask!2661))))

(assert (=> start!127532 e!838975))

(assert (=> start!127532 true))

(declare-fun array_inv!37244 (array!99913) Bool)

(assert (=> start!127532 (array_inv!37244 a!2850)))

(declare-fun b!1498309 () Bool)

(declare-fun res!1019385 () Bool)

(assert (=> b!1498309 (=> (not res!1019385) (not e!838975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498309 (= res!1019385 (validKeyInArray!0 (select (arr!48216 a!2850) j!87)))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1498310 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498310 (= e!838975 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48766 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48766 a!2850)) (= (select (arr!48216 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48216 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48766 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantBefore!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498311 () Bool)

(declare-fun res!1019389 () Bool)

(assert (=> b!1498311 (=> (not res!1019389) (not e!838975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99913 (_ BitVec 32)) Bool)

(assert (=> b!1498311 (= res!1019389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498312 () Bool)

(declare-fun res!1019384 () Bool)

(assert (=> b!1498312 (=> (not res!1019384) (not e!838975))))

(declare-datatypes ((List!34708 0))(
  ( (Nil!34705) (Cons!34704 (h!36101 (_ BitVec 64)) (t!49402 List!34708)) )
))
(declare-fun arrayNoDuplicates!0 (array!99913 (_ BitVec 32) List!34708) Bool)

(assert (=> b!1498312 (= res!1019384 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34705))))

(declare-fun b!1498313 () Bool)

(declare-fun res!1019386 () Bool)

(assert (=> b!1498313 (=> (not res!1019386) (not e!838975))))

(assert (=> b!1498313 (= res!1019386 (validKeyInArray!0 (select (arr!48216 a!2850) i!996)))))

(assert (= (and start!127532 res!1019388) b!1498308))

(assert (= (and b!1498308 res!1019387) b!1498313))

(assert (= (and b!1498313 res!1019386) b!1498309))

(assert (= (and b!1498309 res!1019385) b!1498311))

(assert (= (and b!1498311 res!1019389) b!1498312))

(assert (= (and b!1498312 res!1019384) b!1498310))

(declare-fun m!1381403 () Bool)

(assert (=> b!1498311 m!1381403))

(declare-fun m!1381405 () Bool)

(assert (=> b!1498312 m!1381405))

(declare-fun m!1381407 () Bool)

(assert (=> b!1498313 m!1381407))

(assert (=> b!1498313 m!1381407))

(declare-fun m!1381409 () Bool)

(assert (=> b!1498313 m!1381409))

(declare-fun m!1381411 () Bool)

(assert (=> b!1498310 m!1381411))

(declare-fun m!1381413 () Bool)

(assert (=> b!1498310 m!1381413))

(declare-fun m!1381415 () Bool)

(assert (=> b!1498310 m!1381415))

(declare-fun m!1381417 () Bool)

(assert (=> b!1498309 m!1381417))

(assert (=> b!1498309 m!1381417))

(declare-fun m!1381419 () Bool)

(assert (=> b!1498309 m!1381419))

(declare-fun m!1381421 () Bool)

(assert (=> start!127532 m!1381421))

(declare-fun m!1381423 () Bool)

(assert (=> start!127532 m!1381423))

(check-sat (not b!1498312) (not b!1498309) (not start!127532) (not b!1498313) (not b!1498311))
(check-sat)
