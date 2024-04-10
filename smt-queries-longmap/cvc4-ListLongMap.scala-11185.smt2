; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130746 () Bool)

(assert start!130746)

(declare-fun b!1533376 () Bool)

(declare-fun res!1050466 () Bool)

(declare-fun e!854217 () Bool)

(assert (=> b!1533376 (=> (not res!1050466) (not e!854217))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101844 0))(
  ( (array!101845 (arr!49138 (Array (_ BitVec 32) (_ BitVec 64))) (size!49688 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101844)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13270 0))(
  ( (MissingZero!13270 (index!55475 (_ BitVec 32))) (Found!13270 (index!55476 (_ BitVec 32))) (Intermediate!13270 (undefined!14082 Bool) (index!55477 (_ BitVec 32)) (x!137248 (_ BitVec 32))) (Undefined!13270) (MissingVacant!13270 (index!55478 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101844 (_ BitVec 32)) SeekEntryResult!13270)

(assert (=> b!1533376 (= res!1050466 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49138 a!2792) j!64) a!2792 mask!2480) (Found!13270 j!64)))))

(declare-fun res!1050468 () Bool)

(assert (=> start!130746 (=> (not res!1050468) (not e!854217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130746 (= res!1050468 (validMask!0 mask!2480))))

(assert (=> start!130746 e!854217))

(assert (=> start!130746 true))

(declare-fun array_inv!38166 (array!101844) Bool)

(assert (=> start!130746 (array_inv!38166 a!2792)))

(declare-fun b!1533377 () Bool)

(declare-fun res!1050469 () Bool)

(assert (=> b!1533377 (=> (not res!1050469) (not e!854217))))

(assert (=> b!1533377 (= res!1050469 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49688 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49688 a!2792)) (= (select (arr!49138 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533378 () Bool)

(declare-fun res!1050464 () Bool)

(assert (=> b!1533378 (=> (not res!1050464) (not e!854217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101844 (_ BitVec 32)) Bool)

(assert (=> b!1533378 (= res!1050464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533379 () Bool)

(declare-fun res!1050465 () Bool)

(assert (=> b!1533379 (=> (not res!1050465) (not e!854217))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533379 (= res!1050465 (and (= (size!49688 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49688 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49688 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533380 () Bool)

(declare-fun res!1050462 () Bool)

(assert (=> b!1533380 (=> (not res!1050462) (not e!854217))))

(declare-datatypes ((List!35612 0))(
  ( (Nil!35609) (Cons!35608 (h!37053 (_ BitVec 64)) (t!50306 List!35612)) )
))
(declare-fun arrayNoDuplicates!0 (array!101844 (_ BitVec 32) List!35612) Bool)

(assert (=> b!1533380 (= res!1050462 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35609))))

(declare-fun b!1533381 () Bool)

(assert (=> b!1533381 (= e!854217 (and (= (select (arr!49138 a!2792) index!463) (select (arr!49138 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533382 () Bool)

(declare-fun res!1050467 () Bool)

(assert (=> b!1533382 (=> (not res!1050467) (not e!854217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533382 (= res!1050467 (validKeyInArray!0 (select (arr!49138 a!2792) i!951)))))

(declare-fun b!1533383 () Bool)

(declare-fun res!1050463 () Bool)

(assert (=> b!1533383 (=> (not res!1050463) (not e!854217))))

(assert (=> b!1533383 (= res!1050463 (validKeyInArray!0 (select (arr!49138 a!2792) j!64)))))

(assert (= (and start!130746 res!1050468) b!1533379))

(assert (= (and b!1533379 res!1050465) b!1533382))

(assert (= (and b!1533382 res!1050467) b!1533383))

(assert (= (and b!1533383 res!1050463) b!1533378))

(assert (= (and b!1533378 res!1050464) b!1533380))

(assert (= (and b!1533380 res!1050462) b!1533377))

(assert (= (and b!1533377 res!1050469) b!1533376))

(assert (= (and b!1533376 res!1050466) b!1533381))

(declare-fun m!1416071 () Bool)

(assert (=> start!130746 m!1416071))

(declare-fun m!1416073 () Bool)

(assert (=> start!130746 m!1416073))

(declare-fun m!1416075 () Bool)

(assert (=> b!1533376 m!1416075))

(assert (=> b!1533376 m!1416075))

(declare-fun m!1416077 () Bool)

(assert (=> b!1533376 m!1416077))

(assert (=> b!1533383 m!1416075))

(assert (=> b!1533383 m!1416075))

(declare-fun m!1416079 () Bool)

(assert (=> b!1533383 m!1416079))

(declare-fun m!1416081 () Bool)

(assert (=> b!1533382 m!1416081))

(assert (=> b!1533382 m!1416081))

(declare-fun m!1416083 () Bool)

(assert (=> b!1533382 m!1416083))

(declare-fun m!1416085 () Bool)

(assert (=> b!1533378 m!1416085))

(declare-fun m!1416087 () Bool)

(assert (=> b!1533377 m!1416087))

(declare-fun m!1416089 () Bool)

(assert (=> b!1533380 m!1416089))

(declare-fun m!1416091 () Bool)

(assert (=> b!1533381 m!1416091))

(assert (=> b!1533381 m!1416075))

(push 1)

(assert (not b!1533378))

(assert (not b!1533380))

(assert (not start!130746))

(assert (not b!1533382))

(assert (not b!1533376))

(assert (not b!1533383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

