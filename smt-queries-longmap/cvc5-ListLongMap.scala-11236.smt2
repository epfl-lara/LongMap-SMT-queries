; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131048 () Bool)

(assert start!131048)

(declare-fun b!1537611 () Bool)

(declare-fun res!1054699 () Bool)

(declare-fun e!855709 () Bool)

(assert (=> b!1537611 (=> (not res!1054699) (not e!855709))))

(declare-datatypes ((array!102146 0))(
  ( (array!102147 (arr!49289 (Array (_ BitVec 32) (_ BitVec 64))) (size!49839 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102146)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102146 (_ BitVec 32)) Bool)

(assert (=> b!1537611 (= res!1054699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537612 () Bool)

(declare-fun res!1054702 () Bool)

(assert (=> b!1537612 (=> (not res!1054702) (not e!855709))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537612 (= res!1054702 (and (= (size!49839 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49839 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49839 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537613 () Bool)

(declare-fun res!1054698 () Bool)

(assert (=> b!1537613 (=> (not res!1054698) (not e!855709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537613 (= res!1054698 (validKeyInArray!0 (select (arr!49289 a!2792) j!64)))))

(declare-fun b!1537614 () Bool)

(declare-fun res!1054701 () Bool)

(assert (=> b!1537614 (=> (not res!1054701) (not e!855709))))

(declare-datatypes ((List!35763 0))(
  ( (Nil!35760) (Cons!35759 (h!37204 (_ BitVec 64)) (t!50457 List!35763)) )
))
(declare-fun arrayNoDuplicates!0 (array!102146 (_ BitVec 32) List!35763) Bool)

(assert (=> b!1537614 (= res!1054701 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35760))))

(declare-fun res!1054696 () Bool)

(assert (=> start!131048 (=> (not res!1054696) (not e!855709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131048 (= res!1054696 (validMask!0 mask!2480))))

(assert (=> start!131048 e!855709))

(assert (=> start!131048 true))

(declare-fun array_inv!38317 (array!102146) Bool)

(assert (=> start!131048 (array_inv!38317 a!2792)))

(declare-fun b!1537610 () Bool)

(assert (=> b!1537610 (= e!855709 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13415 0))(
  ( (MissingZero!13415 (index!56055 (_ BitVec 32))) (Found!13415 (index!56056 (_ BitVec 32))) (Intermediate!13415 (undefined!14227 Bool) (index!56057 (_ BitVec 32)) (x!137801 (_ BitVec 32))) (Undefined!13415) (MissingVacant!13415 (index!56058 (_ BitVec 32))) )
))
(declare-fun lt!664759 () SeekEntryResult!13415)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102146 (_ BitVec 32)) SeekEntryResult!13415)

(assert (=> b!1537610 (= lt!664759 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49289 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537615 () Bool)

(declare-fun res!1054697 () Bool)

(assert (=> b!1537615 (=> (not res!1054697) (not e!855709))))

(assert (=> b!1537615 (= res!1054697 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49839 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49839 a!2792)) (= (select (arr!49289 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537616 () Bool)

(declare-fun res!1054700 () Bool)

(assert (=> b!1537616 (=> (not res!1054700) (not e!855709))))

(assert (=> b!1537616 (= res!1054700 (validKeyInArray!0 (select (arr!49289 a!2792) i!951)))))

(assert (= (and start!131048 res!1054696) b!1537612))

(assert (= (and b!1537612 res!1054702) b!1537616))

(assert (= (and b!1537616 res!1054700) b!1537613))

(assert (= (and b!1537613 res!1054698) b!1537611))

(assert (= (and b!1537611 res!1054699) b!1537614))

(assert (= (and b!1537614 res!1054701) b!1537615))

(assert (= (and b!1537615 res!1054697) b!1537610))

(declare-fun m!1420131 () Bool)

(assert (=> b!1537610 m!1420131))

(assert (=> b!1537610 m!1420131))

(declare-fun m!1420133 () Bool)

(assert (=> b!1537610 m!1420133))

(declare-fun m!1420135 () Bool)

(assert (=> start!131048 m!1420135))

(declare-fun m!1420137 () Bool)

(assert (=> start!131048 m!1420137))

(declare-fun m!1420139 () Bool)

(assert (=> b!1537614 m!1420139))

(declare-fun m!1420141 () Bool)

(assert (=> b!1537611 m!1420141))

(declare-fun m!1420143 () Bool)

(assert (=> b!1537616 m!1420143))

(assert (=> b!1537616 m!1420143))

(declare-fun m!1420145 () Bool)

(assert (=> b!1537616 m!1420145))

(declare-fun m!1420147 () Bool)

(assert (=> b!1537615 m!1420147))

(assert (=> b!1537613 m!1420131))

(assert (=> b!1537613 m!1420131))

(declare-fun m!1420149 () Bool)

(assert (=> b!1537613 m!1420149))

(push 1)

(assert (not start!131048))

(assert (not b!1537616))

(assert (not b!1537610))

(assert (not b!1537613))

(assert (not b!1537614))

(assert (not b!1537611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

