; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131192 () Bool)

(assert start!131192)

(declare-fun b!1539090 () Bool)

(declare-fun res!1056072 () Bool)

(declare-fun e!856140 () Bool)

(assert (=> b!1539090 (=> (not res!1056072) (not e!856140))))

(declare-datatypes ((array!102257 0))(
  ( (array!102258 (arr!49343 (Array (_ BitVec 32) (_ BitVec 64))) (size!49893 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102257)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102257 (_ BitVec 32)) Bool)

(assert (=> b!1539090 (= res!1056072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539091 () Bool)

(declare-fun res!1056073 () Bool)

(assert (=> b!1539091 (=> (not res!1056073) (not e!856140))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13469 0))(
  ( (MissingZero!13469 (index!56271 (_ BitVec 32))) (Found!13469 (index!56272 (_ BitVec 32))) (Intermediate!13469 (undefined!14281 Bool) (index!56273 (_ BitVec 32)) (x!138002 (_ BitVec 32))) (Undefined!13469) (MissingVacant!13469 (index!56274 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102257 (_ BitVec 32)) SeekEntryResult!13469)

(assert (=> b!1539091 (= res!1056073 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49343 a!2792) j!64) a!2792 mask!2480) (Found!13469 j!64)))))

(declare-fun b!1539092 () Bool)

(assert (=> b!1539092 (= e!856140 false)))

(declare-fun lt!664972 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539092 (= lt!664972 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539093 () Bool)

(declare-fun res!1056070 () Bool)

(assert (=> b!1539093 (=> (not res!1056070) (not e!856140))))

(declare-datatypes ((List!35817 0))(
  ( (Nil!35814) (Cons!35813 (h!37258 (_ BitVec 64)) (t!50511 List!35817)) )
))
(declare-fun arrayNoDuplicates!0 (array!102257 (_ BitVec 32) List!35817) Bool)

(assert (=> b!1539093 (= res!1056070 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35814))))

(declare-fun b!1539094 () Bool)

(declare-fun res!1056075 () Bool)

(assert (=> b!1539094 (=> (not res!1056075) (not e!856140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539094 (= res!1056075 (validKeyInArray!0 (select (arr!49343 a!2792) j!64)))))

(declare-fun res!1056069 () Bool)

(assert (=> start!131192 (=> (not res!1056069) (not e!856140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131192 (= res!1056069 (validMask!0 mask!2480))))

(assert (=> start!131192 e!856140))

(assert (=> start!131192 true))

(declare-fun array_inv!38371 (array!102257) Bool)

(assert (=> start!131192 (array_inv!38371 a!2792)))

(declare-fun b!1539095 () Bool)

(declare-fun res!1056071 () Bool)

(assert (=> b!1539095 (=> (not res!1056071) (not e!856140))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539095 (= res!1056071 (validKeyInArray!0 (select (arr!49343 a!2792) i!951)))))

(declare-fun b!1539096 () Bool)

(declare-fun res!1056068 () Bool)

(assert (=> b!1539096 (=> (not res!1056068) (not e!856140))))

(assert (=> b!1539096 (= res!1056068 (and (= (size!49893 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49893 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49893 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539097 () Bool)

(declare-fun res!1056074 () Bool)

(assert (=> b!1539097 (=> (not res!1056074) (not e!856140))))

(assert (=> b!1539097 (= res!1056074 (not (= (select (arr!49343 a!2792) index!463) (select (arr!49343 a!2792) j!64))))))

(declare-fun b!1539098 () Bool)

(declare-fun res!1056076 () Bool)

(assert (=> b!1539098 (=> (not res!1056076) (not e!856140))))

(assert (=> b!1539098 (= res!1056076 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49893 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49893 a!2792)) (= (select (arr!49343 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131192 res!1056069) b!1539096))

(assert (= (and b!1539096 res!1056068) b!1539095))

(assert (= (and b!1539095 res!1056071) b!1539094))

(assert (= (and b!1539094 res!1056075) b!1539090))

(assert (= (and b!1539090 res!1056072) b!1539093))

(assert (= (and b!1539093 res!1056070) b!1539098))

(assert (= (and b!1539098 res!1056076) b!1539091))

(assert (= (and b!1539091 res!1056073) b!1539097))

(assert (= (and b!1539097 res!1056074) b!1539092))

(declare-fun m!1421451 () Bool)

(assert (=> b!1539094 m!1421451))

(assert (=> b!1539094 m!1421451))

(declare-fun m!1421453 () Bool)

(assert (=> b!1539094 m!1421453))

(declare-fun m!1421455 () Bool)

(assert (=> b!1539092 m!1421455))

(declare-fun m!1421457 () Bool)

(assert (=> b!1539098 m!1421457))

(declare-fun m!1421459 () Bool)

(assert (=> b!1539090 m!1421459))

(declare-fun m!1421461 () Bool)

(assert (=> b!1539093 m!1421461))

(declare-fun m!1421463 () Bool)

(assert (=> b!1539097 m!1421463))

(assert (=> b!1539097 m!1421451))

(assert (=> b!1539091 m!1421451))

(assert (=> b!1539091 m!1421451))

(declare-fun m!1421465 () Bool)

(assert (=> b!1539091 m!1421465))

(declare-fun m!1421467 () Bool)

(assert (=> start!131192 m!1421467))

(declare-fun m!1421469 () Bool)

(assert (=> start!131192 m!1421469))

(declare-fun m!1421471 () Bool)

(assert (=> b!1539095 m!1421471))

(assert (=> b!1539095 m!1421471))

(declare-fun m!1421473 () Bool)

(assert (=> b!1539095 m!1421473))

(push 1)

(assert (not b!1539091))

(assert (not b!1539092))

(assert (not b!1539095))

(assert (not start!131192))

(assert (not b!1539093))

(assert (not b!1539094))

(assert (not b!1539090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

