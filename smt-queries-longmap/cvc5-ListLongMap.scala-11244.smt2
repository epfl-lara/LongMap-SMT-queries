; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131132 () Bool)

(assert start!131132)

(declare-fun b!1538280 () Bool)

(declare-fun res!1055264 () Bool)

(declare-fun e!855960 () Bool)

(assert (=> b!1538280 (=> (not res!1055264) (not e!855960))))

(declare-datatypes ((array!102197 0))(
  ( (array!102198 (arr!49313 (Array (_ BitVec 32) (_ BitVec 64))) (size!49863 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102197)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102197 (_ BitVec 32)) Bool)

(assert (=> b!1538280 (= res!1055264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538281 () Bool)

(declare-fun res!1055258 () Bool)

(assert (=> b!1538281 (=> (not res!1055258) (not e!855960))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538281 (= res!1055258 (not (= (select (arr!49313 a!2792) index!463) (select (arr!49313 a!2792) j!64))))))

(declare-fun b!1538282 () Bool)

(declare-fun res!1055262 () Bool)

(assert (=> b!1538282 (=> (not res!1055262) (not e!855960))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538282 (= res!1055262 (validKeyInArray!0 (select (arr!49313 a!2792) i!951)))))

(declare-fun b!1538283 () Bool)

(declare-fun res!1055259 () Bool)

(assert (=> b!1538283 (=> (not res!1055259) (not e!855960))))

(assert (=> b!1538283 (= res!1055259 (validKeyInArray!0 (select (arr!49313 a!2792) j!64)))))

(declare-fun b!1538284 () Bool)

(declare-fun res!1055263 () Bool)

(assert (=> b!1538284 (=> (not res!1055263) (not e!855960))))

(declare-datatypes ((List!35787 0))(
  ( (Nil!35784) (Cons!35783 (h!37228 (_ BitVec 64)) (t!50481 List!35787)) )
))
(declare-fun arrayNoDuplicates!0 (array!102197 (_ BitVec 32) List!35787) Bool)

(assert (=> b!1538284 (= res!1055263 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35784))))

(declare-fun b!1538285 () Bool)

(declare-fun res!1055266 () Bool)

(assert (=> b!1538285 (=> (not res!1055266) (not e!855960))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13439 0))(
  ( (MissingZero!13439 (index!56151 (_ BitVec 32))) (Found!13439 (index!56152 (_ BitVec 32))) (Intermediate!13439 (undefined!14251 Bool) (index!56153 (_ BitVec 32)) (x!137892 (_ BitVec 32))) (Undefined!13439) (MissingVacant!13439 (index!56154 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102197 (_ BitVec 32)) SeekEntryResult!13439)

(assert (=> b!1538285 (= res!1055266 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49313 a!2792) j!64) a!2792 mask!2480) (Found!13439 j!64)))))

(declare-fun b!1538286 () Bool)

(declare-fun res!1055261 () Bool)

(assert (=> b!1538286 (=> (not res!1055261) (not e!855960))))

(assert (=> b!1538286 (= res!1055261 (and (= (size!49863 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49863 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49863 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538287 () Bool)

(assert (=> b!1538287 (= e!855960 false)))

(declare-fun lt!664882 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538287 (= lt!664882 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538288 () Bool)

(declare-fun res!1055265 () Bool)

(assert (=> b!1538288 (=> (not res!1055265) (not e!855960))))

(assert (=> b!1538288 (= res!1055265 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49863 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49863 a!2792)) (= (select (arr!49313 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055260 () Bool)

(assert (=> start!131132 (=> (not res!1055260) (not e!855960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131132 (= res!1055260 (validMask!0 mask!2480))))

(assert (=> start!131132 e!855960))

(assert (=> start!131132 true))

(declare-fun array_inv!38341 (array!102197) Bool)

(assert (=> start!131132 (array_inv!38341 a!2792)))

(assert (= (and start!131132 res!1055260) b!1538286))

(assert (= (and b!1538286 res!1055261) b!1538282))

(assert (= (and b!1538282 res!1055262) b!1538283))

(assert (= (and b!1538283 res!1055259) b!1538280))

(assert (= (and b!1538280 res!1055264) b!1538284))

(assert (= (and b!1538284 res!1055263) b!1538288))

(assert (= (and b!1538288 res!1055265) b!1538285))

(assert (= (and b!1538285 res!1055266) b!1538281))

(assert (= (and b!1538281 res!1055258) b!1538287))

(declare-fun m!1420731 () Bool)

(assert (=> b!1538288 m!1420731))

(declare-fun m!1420733 () Bool)

(assert (=> b!1538287 m!1420733))

(declare-fun m!1420735 () Bool)

(assert (=> b!1538281 m!1420735))

(declare-fun m!1420737 () Bool)

(assert (=> b!1538281 m!1420737))

(assert (=> b!1538285 m!1420737))

(assert (=> b!1538285 m!1420737))

(declare-fun m!1420739 () Bool)

(assert (=> b!1538285 m!1420739))

(declare-fun m!1420741 () Bool)

(assert (=> b!1538280 m!1420741))

(declare-fun m!1420743 () Bool)

(assert (=> start!131132 m!1420743))

(declare-fun m!1420745 () Bool)

(assert (=> start!131132 m!1420745))

(assert (=> b!1538283 m!1420737))

(assert (=> b!1538283 m!1420737))

(declare-fun m!1420747 () Bool)

(assert (=> b!1538283 m!1420747))

(declare-fun m!1420749 () Bool)

(assert (=> b!1538284 m!1420749))

(declare-fun m!1420751 () Bool)

(assert (=> b!1538282 m!1420751))

(assert (=> b!1538282 m!1420751))

(declare-fun m!1420753 () Bool)

(assert (=> b!1538282 m!1420753))

(push 1)

(assert (not b!1538287))

(assert (not start!131132))

(assert (not b!1538282))

(assert (not b!1538283))

(assert (not b!1538285))

(assert (not b!1538280))

(assert (not b!1538284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

