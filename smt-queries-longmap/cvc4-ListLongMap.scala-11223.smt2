; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130974 () Bool)

(assert start!130974)

(declare-fun b!1536496 () Bool)

(declare-fun e!855208 () Bool)

(declare-fun e!855204 () Bool)

(assert (=> b!1536496 (= e!855208 e!855204)))

(declare-fun res!1053585 () Bool)

(assert (=> b!1536496 (=> (not res!1053585) (not e!855204))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664369 () (_ BitVec 32))

(declare-datatypes ((array!102072 0))(
  ( (array!102073 (arr!49252 (Array (_ BitVec 32) (_ BitVec 64))) (size!49802 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102072)

(assert (=> b!1536496 (= res!1053585 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664369 #b00000000000000000000000000000000) (bvslt lt!664369 (size!49802 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536496 (= lt!664369 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536497 () Bool)

(declare-fun res!1053582 () Bool)

(declare-fun e!855207 () Bool)

(assert (=> b!1536497 (=> (not res!1053582) (not e!855207))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536497 (= res!1053582 (and (= (size!49802 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49802 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49802 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536498 () Bool)

(declare-fun res!1053583 () Bool)

(assert (=> b!1536498 (=> (not res!1053583) (not e!855207))))

(declare-datatypes ((List!35726 0))(
  ( (Nil!35723) (Cons!35722 (h!37167 (_ BitVec 64)) (t!50420 List!35726)) )
))
(declare-fun arrayNoDuplicates!0 (array!102072 (_ BitVec 32) List!35726) Bool)

(assert (=> b!1536498 (= res!1053583 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35723))))

(declare-fun b!1536499 () Bool)

(assert (=> b!1536499 (= e!855207 e!855208)))

(declare-fun res!1053591 () Bool)

(assert (=> b!1536499 (=> (not res!1053591) (not e!855208))))

(declare-datatypes ((SeekEntryResult!13384 0))(
  ( (MissingZero!13384 (index!55931 (_ BitVec 32))) (Found!13384 (index!55932 (_ BitVec 32))) (Intermediate!13384 (undefined!14196 Bool) (index!55933 (_ BitVec 32)) (x!137666 (_ BitVec 32))) (Undefined!13384) (MissingVacant!13384 (index!55934 (_ BitVec 32))) )
))
(declare-fun lt!664366 () SeekEntryResult!13384)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102072 (_ BitVec 32)) SeekEntryResult!13384)

(assert (=> b!1536499 (= res!1053591 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49252 a!2792) j!64) a!2792 mask!2480) lt!664366))))

(assert (=> b!1536499 (= lt!664366 (Found!13384 j!64))))

(declare-fun res!1053590 () Bool)

(assert (=> start!130974 (=> (not res!1053590) (not e!855207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130974 (= res!1053590 (validMask!0 mask!2480))))

(assert (=> start!130974 e!855207))

(assert (=> start!130974 true))

(declare-fun array_inv!38280 (array!102072) Bool)

(assert (=> start!130974 (array_inv!38280 a!2792)))

(declare-fun b!1536500 () Bool)

(declare-fun res!1053592 () Bool)

(assert (=> b!1536500 (=> (not res!1053592) (not e!855208))))

(assert (=> b!1536500 (= res!1053592 (not (= (select (arr!49252 a!2792) index!463) (select (arr!49252 a!2792) j!64))))))

(declare-fun e!855206 () Bool)

(declare-fun b!1536501 () Bool)

(assert (=> b!1536501 (= e!855206 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun lt!664367 () SeekEntryResult!13384)

(assert (=> b!1536501 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664369 vacantIndex!5 (select (store (arr!49252 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102073 (store (arr!49252 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49802 a!2792)) mask!2480) lt!664367)))

(declare-datatypes ((Unit!51340 0))(
  ( (Unit!51341) )
))
(declare-fun lt!664368 () Unit!51340)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51340)

(assert (=> b!1536501 (= lt!664368 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664369 vacantIndex!5 mask!2480))))

(declare-fun b!1536502 () Bool)

(declare-fun res!1053588 () Bool)

(assert (=> b!1536502 (=> (not res!1053588) (not e!855207))))

(assert (=> b!1536502 (= res!1053588 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49802 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49802 a!2792)) (= (select (arr!49252 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536503 () Bool)

(declare-fun res!1053584 () Bool)

(assert (=> b!1536503 (=> (not res!1053584) (not e!855207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102072 (_ BitVec 32)) Bool)

(assert (=> b!1536503 (= res!1053584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536504 () Bool)

(assert (=> b!1536504 (= e!855204 e!855206)))

(declare-fun res!1053587 () Bool)

(assert (=> b!1536504 (=> (not res!1053587) (not e!855206))))

(assert (=> b!1536504 (= res!1053587 (= lt!664367 lt!664366))))

(assert (=> b!1536504 (= lt!664367 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664369 vacantIndex!5 (select (arr!49252 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536505 () Bool)

(declare-fun res!1053589 () Bool)

(assert (=> b!1536505 (=> (not res!1053589) (not e!855207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536505 (= res!1053589 (validKeyInArray!0 (select (arr!49252 a!2792) i!951)))))

(declare-fun b!1536506 () Bool)

(declare-fun res!1053586 () Bool)

(assert (=> b!1536506 (=> (not res!1053586) (not e!855207))))

(assert (=> b!1536506 (= res!1053586 (validKeyInArray!0 (select (arr!49252 a!2792) j!64)))))

(assert (= (and start!130974 res!1053590) b!1536497))

(assert (= (and b!1536497 res!1053582) b!1536505))

(assert (= (and b!1536505 res!1053589) b!1536506))

(assert (= (and b!1536506 res!1053586) b!1536503))

(assert (= (and b!1536503 res!1053584) b!1536498))

(assert (= (and b!1536498 res!1053583) b!1536502))

(assert (= (and b!1536502 res!1053588) b!1536499))

(assert (= (and b!1536499 res!1053591) b!1536500))

(assert (= (and b!1536500 res!1053592) b!1536496))

(assert (= (and b!1536496 res!1053585) b!1536504))

(assert (= (and b!1536504 res!1053587) b!1536501))

(declare-fun m!1418963 () Bool)

(assert (=> b!1536496 m!1418963))

(declare-fun m!1418965 () Bool)

(assert (=> start!130974 m!1418965))

(declare-fun m!1418967 () Bool)

(assert (=> start!130974 m!1418967))

(declare-fun m!1418969 () Bool)

(assert (=> b!1536506 m!1418969))

(assert (=> b!1536506 m!1418969))

(declare-fun m!1418971 () Bool)

(assert (=> b!1536506 m!1418971))

(assert (=> b!1536499 m!1418969))

(assert (=> b!1536499 m!1418969))

(declare-fun m!1418973 () Bool)

(assert (=> b!1536499 m!1418973))

(declare-fun m!1418975 () Bool)

(assert (=> b!1536501 m!1418975))

(declare-fun m!1418977 () Bool)

(assert (=> b!1536501 m!1418977))

(assert (=> b!1536501 m!1418977))

(declare-fun m!1418979 () Bool)

(assert (=> b!1536501 m!1418979))

(declare-fun m!1418981 () Bool)

(assert (=> b!1536501 m!1418981))

(declare-fun m!1418983 () Bool)

(assert (=> b!1536498 m!1418983))

(declare-fun m!1418985 () Bool)

(assert (=> b!1536502 m!1418985))

(declare-fun m!1418987 () Bool)

(assert (=> b!1536503 m!1418987))

(declare-fun m!1418989 () Bool)

(assert (=> b!1536505 m!1418989))

(assert (=> b!1536505 m!1418989))

(declare-fun m!1418991 () Bool)

(assert (=> b!1536505 m!1418991))

(declare-fun m!1418993 () Bool)

(assert (=> b!1536500 m!1418993))

(assert (=> b!1536500 m!1418969))

(assert (=> b!1536504 m!1418969))

(assert (=> b!1536504 m!1418969))

(declare-fun m!1418995 () Bool)

(assert (=> b!1536504 m!1418995))

(push 1)

(assert (not b!1536496))

(assert (not b!1536501))

(assert (not b!1536499))

(assert (not b!1536503))

(assert (not start!130974))

(assert (not b!1536505))

(assert (not b!1536504))

(assert (not b!1536498))

(assert (not b!1536506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

