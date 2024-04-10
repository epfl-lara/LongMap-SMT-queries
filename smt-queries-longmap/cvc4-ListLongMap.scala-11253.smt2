; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131190 () Bool)

(assert start!131190)

(declare-fun b!1539063 () Bool)

(declare-fun res!1056045 () Bool)

(declare-fun e!856135 () Bool)

(assert (=> b!1539063 (=> (not res!1056045) (not e!856135))))

(declare-datatypes ((array!102255 0))(
  ( (array!102256 (arr!49342 (Array (_ BitVec 32) (_ BitVec 64))) (size!49892 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102255)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539063 (= res!1056045 (validKeyInArray!0 (select (arr!49342 a!2792) j!64)))))

(declare-fun b!1539064 () Bool)

(declare-fun res!1056043 () Bool)

(assert (=> b!1539064 (=> (not res!1056043) (not e!856135))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102255 (_ BitVec 32)) Bool)

(assert (=> b!1539064 (= res!1056043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539065 () Bool)

(declare-fun res!1056046 () Bool)

(assert (=> b!1539065 (=> (not res!1056046) (not e!856135))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539065 (= res!1056046 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49892 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49892 a!2792)) (= (select (arr!49342 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056041 () Bool)

(assert (=> start!131190 (=> (not res!1056041) (not e!856135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131190 (= res!1056041 (validMask!0 mask!2480))))

(assert (=> start!131190 e!856135))

(assert (=> start!131190 true))

(declare-fun array_inv!38370 (array!102255) Bool)

(assert (=> start!131190 (array_inv!38370 a!2792)))

(declare-fun b!1539066 () Bool)

(declare-fun res!1056047 () Bool)

(assert (=> b!1539066 (=> (not res!1056047) (not e!856135))))

(declare-datatypes ((SeekEntryResult!13468 0))(
  ( (MissingZero!13468 (index!56267 (_ BitVec 32))) (Found!13468 (index!56268 (_ BitVec 32))) (Intermediate!13468 (undefined!14280 Bool) (index!56269 (_ BitVec 32)) (x!137993 (_ BitVec 32))) (Undefined!13468) (MissingVacant!13468 (index!56270 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102255 (_ BitVec 32)) SeekEntryResult!13468)

(assert (=> b!1539066 (= res!1056047 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49342 a!2792) j!64) a!2792 mask!2480) (Found!13468 j!64)))))

(declare-fun b!1539067 () Bool)

(declare-fun res!1056049 () Bool)

(assert (=> b!1539067 (=> (not res!1056049) (not e!856135))))

(declare-datatypes ((List!35816 0))(
  ( (Nil!35813) (Cons!35812 (h!37257 (_ BitVec 64)) (t!50510 List!35816)) )
))
(declare-fun arrayNoDuplicates!0 (array!102255 (_ BitVec 32) List!35816) Bool)

(assert (=> b!1539067 (= res!1056049 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35813))))

(declare-fun b!1539068 () Bool)

(declare-fun res!1056044 () Bool)

(assert (=> b!1539068 (=> (not res!1056044) (not e!856135))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539068 (= res!1056044 (and (= (size!49892 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49892 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49892 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539069 () Bool)

(assert (=> b!1539069 (= e!856135 false)))

(declare-fun lt!664969 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539069 (= lt!664969 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539070 () Bool)

(declare-fun res!1056042 () Bool)

(assert (=> b!1539070 (=> (not res!1056042) (not e!856135))))

(assert (=> b!1539070 (= res!1056042 (validKeyInArray!0 (select (arr!49342 a!2792) i!951)))))

(declare-fun b!1539071 () Bool)

(declare-fun res!1056048 () Bool)

(assert (=> b!1539071 (=> (not res!1056048) (not e!856135))))

(assert (=> b!1539071 (= res!1056048 (not (= (select (arr!49342 a!2792) index!463) (select (arr!49342 a!2792) j!64))))))

(assert (= (and start!131190 res!1056041) b!1539068))

(assert (= (and b!1539068 res!1056044) b!1539070))

(assert (= (and b!1539070 res!1056042) b!1539063))

(assert (= (and b!1539063 res!1056045) b!1539064))

(assert (= (and b!1539064 res!1056043) b!1539067))

(assert (= (and b!1539067 res!1056049) b!1539065))

(assert (= (and b!1539065 res!1056046) b!1539066))

(assert (= (and b!1539066 res!1056047) b!1539071))

(assert (= (and b!1539071 res!1056048) b!1539069))

(declare-fun m!1421427 () Bool)

(assert (=> b!1539071 m!1421427))

(declare-fun m!1421429 () Bool)

(assert (=> b!1539071 m!1421429))

(declare-fun m!1421431 () Bool)

(assert (=> b!1539065 m!1421431))

(assert (=> b!1539063 m!1421429))

(assert (=> b!1539063 m!1421429))

(declare-fun m!1421433 () Bool)

(assert (=> b!1539063 m!1421433))

(declare-fun m!1421435 () Bool)

(assert (=> b!1539064 m!1421435))

(declare-fun m!1421437 () Bool)

(assert (=> b!1539067 m!1421437))

(assert (=> b!1539066 m!1421429))

(assert (=> b!1539066 m!1421429))

(declare-fun m!1421439 () Bool)

(assert (=> b!1539066 m!1421439))

(declare-fun m!1421441 () Bool)

(assert (=> b!1539070 m!1421441))

(assert (=> b!1539070 m!1421441))

(declare-fun m!1421443 () Bool)

(assert (=> b!1539070 m!1421443))

(declare-fun m!1421445 () Bool)

(assert (=> b!1539069 m!1421445))

(declare-fun m!1421447 () Bool)

(assert (=> start!131190 m!1421447))

(declare-fun m!1421449 () Bool)

(assert (=> start!131190 m!1421449))

(push 1)

(assert (not b!1539063))

(assert (not b!1539064))

(assert (not start!131190))

(assert (not b!1539067))

(assert (not b!1539069))

(assert (not b!1539066))

(assert (not b!1539070))

(check-sat)

