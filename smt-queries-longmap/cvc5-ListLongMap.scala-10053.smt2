; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118452 () Bool)

(assert start!118452)

(declare-fun b!1385294 () Bool)

(declare-fun res!926546 () Bool)

(declare-fun e!784921 () Bool)

(assert (=> b!1385294 (=> (not res!926546) (not e!784921))))

(declare-datatypes ((array!94728 0))(
  ( (array!94729 (arr!45740 (Array (_ BitVec 32) (_ BitVec 64))) (size!46290 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94728)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385294 (= res!926546 (validKeyInArray!0 (select (arr!45740 a!2938) i!1065)))))

(declare-fun res!926547 () Bool)

(assert (=> start!118452 (=> (not res!926547) (not e!784921))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118452 (= res!926547 (validMask!0 mask!2987))))

(assert (=> start!118452 e!784921))

(assert (=> start!118452 true))

(declare-fun array_inv!34768 (array!94728) Bool)

(assert (=> start!118452 (array_inv!34768 a!2938)))

(declare-fun b!1385295 () Bool)

(declare-fun res!926548 () Bool)

(assert (=> b!1385295 (=> (not res!926548) (not e!784921))))

(declare-datatypes ((List!32268 0))(
  ( (Nil!32265) (Cons!32264 (h!33473 (_ BitVec 64)) (t!46962 List!32268)) )
))
(declare-fun arrayNoDuplicates!0 (array!94728 (_ BitVec 32) List!32268) Bool)

(assert (=> b!1385295 (= res!926548 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32265))))

(declare-fun b!1385296 () Bool)

(declare-fun res!926545 () Bool)

(assert (=> b!1385296 (=> (not res!926545) (not e!784921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94728 (_ BitVec 32)) Bool)

(assert (=> b!1385296 (= res!926545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385297 () Bool)

(declare-fun res!926544 () Bool)

(assert (=> b!1385297 (=> (not res!926544) (not e!784921))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385297 (= res!926544 (and (= (size!46290 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46290 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46290 a!2938))))))

(declare-fun b!1385298 () Bool)

(assert (=> b!1385298 (= e!784921 (bvslt (bvsub (size!46290 a!2938) startIndex!16) #b00000000000000000000000000000000))))

(assert (= (and start!118452 res!926547) b!1385297))

(assert (= (and b!1385297 res!926544) b!1385294))

(assert (= (and b!1385294 res!926546) b!1385295))

(assert (= (and b!1385295 res!926548) b!1385296))

(assert (= (and b!1385296 res!926545) b!1385298))

(declare-fun m!1270593 () Bool)

(assert (=> b!1385294 m!1270593))

(assert (=> b!1385294 m!1270593))

(declare-fun m!1270595 () Bool)

(assert (=> b!1385294 m!1270595))

(declare-fun m!1270597 () Bool)

(assert (=> start!118452 m!1270597))

(declare-fun m!1270599 () Bool)

(assert (=> start!118452 m!1270599))

(declare-fun m!1270601 () Bool)

(assert (=> b!1385295 m!1270601))

(declare-fun m!1270603 () Bool)

(assert (=> b!1385296 m!1270603))

(push 1)

(assert (not b!1385296))

(assert (not start!118452))

(assert (not b!1385294))

(assert (not b!1385295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

