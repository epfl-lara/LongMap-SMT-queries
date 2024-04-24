; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131614 () Bool)

(assert start!131614)

(declare-fun b!1541580 () Bool)

(declare-fun res!1056988 () Bool)

(declare-fun e!857662 () Bool)

(assert (=> b!1541580 (=> (not res!1056988) (not e!857662))))

(declare-datatypes ((array!102383 0))(
  ( (array!102384 (arr!49398 (Array (_ BitVec 32) (_ BitVec 64))) (size!49949 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102383)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1541580 (= res!1056988 (not (= (select (arr!49398 a!2792) index!463) (select (arr!49398 a!2792) j!64))))))

(declare-fun b!1541581 () Bool)

(declare-fun res!1056987 () Bool)

(assert (=> b!1541581 (=> (not res!1056987) (not e!857662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541581 (= res!1056987 (validKeyInArray!0 (select (arr!49398 a!2792) j!64)))))

(declare-fun b!1541582 () Bool)

(declare-fun res!1056983 () Bool)

(assert (=> b!1541582 (=> (not res!1056983) (not e!857662))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1541582 (= res!1056983 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49949 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49949 a!2792)) (= (select (arr!49398 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1541583 () Bool)

(declare-fun res!1056985 () Bool)

(assert (=> b!1541583 (=> (not res!1056985) (not e!857662))))

(declare-datatypes ((List!35859 0))(
  ( (Nil!35856) (Cons!35855 (h!37318 (_ BitVec 64)) (t!50545 List!35859)) )
))
(declare-fun arrayNoDuplicates!0 (array!102383 (_ BitVec 32) List!35859) Bool)

(assert (=> b!1541583 (= res!1056985 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35856))))

(declare-fun b!1541584 () Bool)

(declare-fun res!1056984 () Bool)

(assert (=> b!1541584 (=> (not res!1056984) (not e!857662))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102383 (_ BitVec 32)) Bool)

(assert (=> b!1541584 (= res!1056984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541585 () Bool)

(declare-fun res!1056986 () Bool)

(assert (=> b!1541585 (=> (not res!1056986) (not e!857662))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1541585 (= res!1056986 (validKeyInArray!0 (select (arr!49398 a!2792) i!951)))))

(declare-fun b!1541586 () Bool)

(declare-fun res!1056982 () Bool)

(assert (=> b!1541586 (=> (not res!1056982) (not e!857662))))

(assert (=> b!1541586 (= res!1056982 (and (= (size!49949 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49949 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49949 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1056989 () Bool)

(assert (=> start!131614 (=> (not res!1056989) (not e!857662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131614 (= res!1056989 (validMask!0 mask!2480))))

(assert (=> start!131614 e!857662))

(assert (=> start!131614 true))

(declare-fun array_inv!38679 (array!102383) Bool)

(assert (=> start!131614 (array_inv!38679 a!2792)))

(declare-fun b!1541587 () Bool)

(assert (=> b!1541587 (= e!857662 false)))

(declare-fun lt!665889 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541587 (= lt!665889 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541588 () Bool)

(declare-fun res!1056990 () Bool)

(assert (=> b!1541588 (=> (not res!1056990) (not e!857662))))

(declare-datatypes ((SeekEntryResult!13419 0))(
  ( (MissingZero!13419 (index!56071 (_ BitVec 32))) (Found!13419 (index!56072 (_ BitVec 32))) (Intermediate!13419 (undefined!14231 Bool) (index!56073 (_ BitVec 32)) (x!138002 (_ BitVec 32))) (Undefined!13419) (MissingVacant!13419 (index!56074 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102383 (_ BitVec 32)) SeekEntryResult!13419)

(assert (=> b!1541588 (= res!1056990 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49398 a!2792) j!64) a!2792 mask!2480) (Found!13419 j!64)))))

(assert (= (and start!131614 res!1056989) b!1541586))

(assert (= (and b!1541586 res!1056982) b!1541585))

(assert (= (and b!1541585 res!1056986) b!1541581))

(assert (= (and b!1541581 res!1056987) b!1541584))

(assert (= (and b!1541584 res!1056984) b!1541583))

(assert (= (and b!1541583 res!1056985) b!1541582))

(assert (= (and b!1541582 res!1056983) b!1541588))

(assert (= (and b!1541588 res!1056990) b!1541580))

(assert (= (and b!1541580 res!1056988) b!1541587))

(declare-fun m!1423735 () Bool)

(assert (=> b!1541582 m!1423735))

(declare-fun m!1423737 () Bool)

(assert (=> start!131614 m!1423737))

(declare-fun m!1423739 () Bool)

(assert (=> start!131614 m!1423739))

(declare-fun m!1423741 () Bool)

(assert (=> b!1541580 m!1423741))

(declare-fun m!1423743 () Bool)

(assert (=> b!1541580 m!1423743))

(declare-fun m!1423745 () Bool)

(assert (=> b!1541584 m!1423745))

(declare-fun m!1423747 () Bool)

(assert (=> b!1541587 m!1423747))

(declare-fun m!1423749 () Bool)

(assert (=> b!1541585 m!1423749))

(assert (=> b!1541585 m!1423749))

(declare-fun m!1423751 () Bool)

(assert (=> b!1541585 m!1423751))

(assert (=> b!1541588 m!1423743))

(assert (=> b!1541588 m!1423743))

(declare-fun m!1423753 () Bool)

(assert (=> b!1541588 m!1423753))

(declare-fun m!1423755 () Bool)

(assert (=> b!1541583 m!1423755))

(assert (=> b!1541581 m!1423743))

(assert (=> b!1541581 m!1423743))

(declare-fun m!1423757 () Bool)

(assert (=> b!1541581 m!1423757))

(push 1)

(assert (not b!1541587))

(assert (not b!1541588))

(assert (not b!1541585))

(assert (not b!1541581))

(assert (not b!1541584))

(assert (not b!1541583))

(assert (not start!131614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

