; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130844 () Bool)

(assert start!130844)

(declare-fun b!1534493 () Bool)

(declare-fun e!854513 () Bool)

(assert (=> b!1534493 (= e!854513 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101942 0))(
  ( (array!101943 (arr!49187 (Array (_ BitVec 32) (_ BitVec 64))) (size!49737 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101942)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13319 0))(
  ( (MissingZero!13319 (index!55671 (_ BitVec 32))) (Found!13319 (index!55672 (_ BitVec 32))) (Intermediate!13319 (undefined!14131 Bool) (index!55673 (_ BitVec 32)) (x!137433 (_ BitVec 32))) (Undefined!13319) (MissingVacant!13319 (index!55674 (_ BitVec 32))) )
))
(declare-fun lt!663870 () SeekEntryResult!13319)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!663871 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101942 (_ BitVec 32)) SeekEntryResult!13319)

(assert (=> b!1534493 (= lt!663870 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663871 vacantIndex!5 (select (arr!49187 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534494 () Bool)

(declare-fun res!1051586 () Bool)

(declare-fun e!854514 () Bool)

(assert (=> b!1534494 (=> (not res!1051586) (not e!854514))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534494 (= res!1051586 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49187 a!2792) j!64) a!2792 mask!2480) (Found!13319 j!64)))))

(declare-fun b!1534495 () Bool)

(declare-fun res!1051588 () Bool)

(assert (=> b!1534495 (=> (not res!1051588) (not e!854514))))

(assert (=> b!1534495 (= res!1051588 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49737 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49737 a!2792)) (= (select (arr!49187 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534496 () Bool)

(declare-fun res!1051585 () Bool)

(assert (=> b!1534496 (=> (not res!1051585) (not e!854514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534496 (= res!1051585 (validKeyInArray!0 (select (arr!49187 a!2792) j!64)))))

(declare-fun b!1534497 () Bool)

(declare-fun res!1051581 () Bool)

(assert (=> b!1534497 (=> (not res!1051581) (not e!854514))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534497 (= res!1051581 (and (= (size!49737 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49737 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49737 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1051579 () Bool)

(assert (=> start!130844 (=> (not res!1051579) (not e!854514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130844 (= res!1051579 (validMask!0 mask!2480))))

(assert (=> start!130844 e!854514))

(assert (=> start!130844 true))

(declare-fun array_inv!38215 (array!101942) Bool)

(assert (=> start!130844 (array_inv!38215 a!2792)))

(declare-fun b!1534498 () Bool)

(declare-fun res!1051587 () Bool)

(assert (=> b!1534498 (=> (not res!1051587) (not e!854514))))

(assert (=> b!1534498 (= res!1051587 (validKeyInArray!0 (select (arr!49187 a!2792) i!951)))))

(declare-fun b!1534499 () Bool)

(assert (=> b!1534499 (= e!854514 e!854513)))

(declare-fun res!1051584 () Bool)

(assert (=> b!1534499 (=> (not res!1051584) (not e!854513))))

(assert (=> b!1534499 (= res!1051584 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663871 #b00000000000000000000000000000000) (bvslt lt!663871 (size!49737 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534499 (= lt!663871 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534500 () Bool)

(declare-fun res!1051580 () Bool)

(assert (=> b!1534500 (=> (not res!1051580) (not e!854514))))

(declare-datatypes ((List!35661 0))(
  ( (Nil!35658) (Cons!35657 (h!37102 (_ BitVec 64)) (t!50355 List!35661)) )
))
(declare-fun arrayNoDuplicates!0 (array!101942 (_ BitVec 32) List!35661) Bool)

(assert (=> b!1534500 (= res!1051580 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35658))))

(declare-fun b!1534501 () Bool)

(declare-fun res!1051583 () Bool)

(assert (=> b!1534501 (=> (not res!1051583) (not e!854514))))

(assert (=> b!1534501 (= res!1051583 (not (= (select (arr!49187 a!2792) index!463) (select (arr!49187 a!2792) j!64))))))

(declare-fun b!1534502 () Bool)

(declare-fun res!1051582 () Bool)

(assert (=> b!1534502 (=> (not res!1051582) (not e!854514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101942 (_ BitVec 32)) Bool)

(assert (=> b!1534502 (= res!1051582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130844 res!1051579) b!1534497))

(assert (= (and b!1534497 res!1051581) b!1534498))

(assert (= (and b!1534498 res!1051587) b!1534496))

(assert (= (and b!1534496 res!1051585) b!1534502))

(assert (= (and b!1534502 res!1051582) b!1534500))

(assert (= (and b!1534500 res!1051580) b!1534495))

(assert (= (and b!1534495 res!1051588) b!1534494))

(assert (= (and b!1534494 res!1051586) b!1534501))

(assert (= (and b!1534501 res!1051583) b!1534499))

(assert (= (and b!1534499 res!1051584) b!1534493))

(declare-fun m!1417137 () Bool)

(assert (=> b!1534494 m!1417137))

(assert (=> b!1534494 m!1417137))

(declare-fun m!1417139 () Bool)

(assert (=> b!1534494 m!1417139))

(declare-fun m!1417141 () Bool)

(assert (=> b!1534499 m!1417141))

(assert (=> b!1534493 m!1417137))

(assert (=> b!1534493 m!1417137))

(declare-fun m!1417143 () Bool)

(assert (=> b!1534493 m!1417143))

(assert (=> b!1534496 m!1417137))

(assert (=> b!1534496 m!1417137))

(declare-fun m!1417145 () Bool)

(assert (=> b!1534496 m!1417145))

(declare-fun m!1417147 () Bool)

(assert (=> b!1534495 m!1417147))

(declare-fun m!1417149 () Bool)

(assert (=> start!130844 m!1417149))

(declare-fun m!1417151 () Bool)

(assert (=> start!130844 m!1417151))

(declare-fun m!1417153 () Bool)

(assert (=> b!1534501 m!1417153))

(assert (=> b!1534501 m!1417137))

(declare-fun m!1417155 () Bool)

(assert (=> b!1534500 m!1417155))

(declare-fun m!1417157 () Bool)

(assert (=> b!1534498 m!1417157))

(assert (=> b!1534498 m!1417157))

(declare-fun m!1417159 () Bool)

(assert (=> b!1534498 m!1417159))

(declare-fun m!1417161 () Bool)

(assert (=> b!1534502 m!1417161))

(push 1)

