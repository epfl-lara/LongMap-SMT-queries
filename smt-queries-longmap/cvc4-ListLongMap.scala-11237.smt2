; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131474 () Bool)

(assert start!131474)

(declare-fun b!1540130 () Bool)

(declare-fun e!857242 () Bool)

(assert (=> b!1540130 (= e!857242 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102276 0))(
  ( (array!102277 (arr!49346 (Array (_ BitVec 32) (_ BitVec 64))) (size!49897 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102276)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13367 0))(
  ( (MissingZero!13367 (index!55863 (_ BitVec 32))) (Found!13367 (index!55864 (_ BitVec 32))) (Intermediate!13367 (undefined!14179 Bool) (index!55865 (_ BitVec 32)) (x!137811 (_ BitVec 32))) (Undefined!13367) (MissingVacant!13367 (index!55866 (_ BitVec 32))) )
))
(declare-fun lt!665682 () SeekEntryResult!13367)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102276 (_ BitVec 32)) SeekEntryResult!13367)

(assert (=> b!1540130 (= lt!665682 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49346 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1055643 () Bool)

(assert (=> start!131474 (=> (not res!1055643) (not e!857242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131474 (= res!1055643 (validMask!0 mask!2480))))

(assert (=> start!131474 e!857242))

(assert (=> start!131474 true))

(declare-fun array_inv!38627 (array!102276) Bool)

(assert (=> start!131474 (array_inv!38627 a!2792)))

(declare-fun b!1540131 () Bool)

(declare-fun res!1055642 () Bool)

(assert (=> b!1540131 (=> (not res!1055642) (not e!857242))))

(declare-datatypes ((List!35807 0))(
  ( (Nil!35804) (Cons!35803 (h!37266 (_ BitVec 64)) (t!50493 List!35807)) )
))
(declare-fun arrayNoDuplicates!0 (array!102276 (_ BitVec 32) List!35807) Bool)

(assert (=> b!1540131 (= res!1055642 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35804))))

(declare-fun b!1540132 () Bool)

(declare-fun res!1055640 () Bool)

(assert (=> b!1540132 (=> (not res!1055640) (not e!857242))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540132 (= res!1055640 (and (= (size!49897 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49897 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49897 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540133 () Bool)

(declare-fun res!1055641 () Bool)

(assert (=> b!1540133 (=> (not res!1055641) (not e!857242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540133 (= res!1055641 (validKeyInArray!0 (select (arr!49346 a!2792) i!951)))))

(declare-fun b!1540134 () Bool)

(declare-fun res!1055645 () Bool)

(assert (=> b!1540134 (=> (not res!1055645) (not e!857242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102276 (_ BitVec 32)) Bool)

(assert (=> b!1540134 (= res!1055645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540135 () Bool)

(declare-fun res!1055646 () Bool)

(assert (=> b!1540135 (=> (not res!1055646) (not e!857242))))

(assert (=> b!1540135 (= res!1055646 (validKeyInArray!0 (select (arr!49346 a!2792) j!64)))))

(declare-fun b!1540136 () Bool)

(declare-fun res!1055644 () Bool)

(assert (=> b!1540136 (=> (not res!1055644) (not e!857242))))

(assert (=> b!1540136 (= res!1055644 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49897 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49897 a!2792)) (= (select (arr!49346 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131474 res!1055643) b!1540132))

(assert (= (and b!1540132 res!1055640) b!1540133))

(assert (= (and b!1540133 res!1055641) b!1540135))

(assert (= (and b!1540135 res!1055646) b!1540134))

(assert (= (and b!1540134 res!1055645) b!1540131))

(assert (= (and b!1540131 res!1055642) b!1540136))

(assert (= (and b!1540136 res!1055644) b!1540130))

(declare-fun m!1422447 () Bool)

(assert (=> start!131474 m!1422447))

(declare-fun m!1422449 () Bool)

(assert (=> start!131474 m!1422449))

(declare-fun m!1422451 () Bool)

(assert (=> b!1540135 m!1422451))

(assert (=> b!1540135 m!1422451))

(declare-fun m!1422453 () Bool)

(assert (=> b!1540135 m!1422453))

(declare-fun m!1422455 () Bool)

(assert (=> b!1540136 m!1422455))

(assert (=> b!1540130 m!1422451))

(assert (=> b!1540130 m!1422451))

(declare-fun m!1422457 () Bool)

(assert (=> b!1540130 m!1422457))

(declare-fun m!1422459 () Bool)

(assert (=> b!1540133 m!1422459))

(assert (=> b!1540133 m!1422459))

(declare-fun m!1422461 () Bool)

(assert (=> b!1540133 m!1422461))

(declare-fun m!1422463 () Bool)

(assert (=> b!1540131 m!1422463))

(declare-fun m!1422465 () Bool)

(assert (=> b!1540134 m!1422465))

(push 1)

(assert (not start!131474))

(assert (not b!1540134))

(assert (not b!1540135))

(assert (not b!1540131))

(assert (not b!1540130))

(assert (not b!1540133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

