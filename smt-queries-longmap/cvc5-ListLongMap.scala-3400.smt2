; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46992 () Bool)

(assert start!46992)

(declare-fun b!518134 () Bool)

(declare-fun e!302335 () Bool)

(assert (=> b!518134 (= e!302335 true)))

(declare-datatypes ((SeekEntryResult!4397 0))(
  ( (MissingZero!4397 (index!19776 (_ BitVec 32))) (Found!4397 (index!19777 (_ BitVec 32))) (Intermediate!4397 (undefined!5209 Bool) (index!19778 (_ BitVec 32)) (x!48746 (_ BitVec 32))) (Undefined!4397) (MissingVacant!4397 (index!19779 (_ BitVec 32))) )
))
(declare-fun lt!237177 () SeekEntryResult!4397)

(declare-datatypes ((array!33133 0))(
  ( (array!33134 (arr!15930 (Array (_ BitVec 32) (_ BitVec 64))) (size!16294 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33133)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518134 (and (bvslt (x!48746 lt!237177) #b01111111111111111111111111111110) (or (= (select (arr!15930 a!3235) (index!19778 lt!237177)) (select (arr!15930 a!3235) j!176)) (= (select (arr!15930 a!3235) (index!19778 lt!237177)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15930 a!3235) (index!19778 lt!237177)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518135 () Bool)

(declare-fun e!302336 () Bool)

(declare-fun e!302333 () Bool)

(assert (=> b!518135 (= e!302336 e!302333)))

(declare-fun res!317151 () Bool)

(assert (=> b!518135 (=> (not res!317151) (not e!302333))))

(declare-fun lt!237179 () SeekEntryResult!4397)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518135 (= res!317151 (or (= lt!237179 (MissingZero!4397 i!1204)) (= lt!237179 (MissingVacant!4397 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33133 (_ BitVec 32)) SeekEntryResult!4397)

(assert (=> b!518135 (= lt!237179 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518136 () Bool)

(declare-fun res!317156 () Bool)

(assert (=> b!518136 (=> (not res!317156) (not e!302336))))

(declare-fun arrayContainsKey!0 (array!33133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518136 (= res!317156 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518137 () Bool)

(declare-fun res!317155 () Bool)

(assert (=> b!518137 (=> (not res!317155) (not e!302336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518137 (= res!317155 (validKeyInArray!0 (select (arr!15930 a!3235) j!176)))))

(declare-fun res!317152 () Bool)

(assert (=> start!46992 (=> (not res!317152) (not e!302336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46992 (= res!317152 (validMask!0 mask!3524))))

(assert (=> start!46992 e!302336))

(assert (=> start!46992 true))

(declare-fun array_inv!11726 (array!33133) Bool)

(assert (=> start!46992 (array_inv!11726 a!3235)))

(declare-fun b!518138 () Bool)

(declare-fun res!317153 () Bool)

(assert (=> b!518138 (=> (not res!317153) (not e!302333))))

(declare-datatypes ((List!10088 0))(
  ( (Nil!10085) (Cons!10084 (h!10991 (_ BitVec 64)) (t!16316 List!10088)) )
))
(declare-fun arrayNoDuplicates!0 (array!33133 (_ BitVec 32) List!10088) Bool)

(assert (=> b!518138 (= res!317153 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10085))))

(declare-fun b!518139 () Bool)

(declare-fun res!317158 () Bool)

(assert (=> b!518139 (=> (not res!317158) (not e!302333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33133 (_ BitVec 32)) Bool)

(assert (=> b!518139 (= res!317158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!302337 () Bool)

(declare-fun b!518140 () Bool)

(assert (=> b!518140 (= e!302337 (= (seekEntryOrOpen!0 (select (arr!15930 a!3235) j!176) a!3235 mask!3524) (Found!4397 j!176)))))

(declare-fun b!518141 () Bool)

(assert (=> b!518141 (= e!302333 (not e!302335))))

(declare-fun res!317157 () Bool)

(assert (=> b!518141 (=> res!317157 e!302335)))

(declare-fun lt!237180 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33133 (_ BitVec 32)) SeekEntryResult!4397)

(assert (=> b!518141 (= res!317157 (= lt!237177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237180 (select (store (arr!15930 a!3235) i!1204 k!2280) j!176) (array!33134 (store (arr!15930 a!3235) i!1204 k!2280) (size!16294 a!3235)) mask!3524)))))

(declare-fun lt!237178 () (_ BitVec 32))

(assert (=> b!518141 (= lt!237177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237178 (select (arr!15930 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518141 (= lt!237180 (toIndex!0 (select (store (arr!15930 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!518141 (= lt!237178 (toIndex!0 (select (arr!15930 a!3235) j!176) mask!3524))))

(assert (=> b!518141 e!302337))

(declare-fun res!317159 () Bool)

(assert (=> b!518141 (=> (not res!317159) (not e!302337))))

(assert (=> b!518141 (= res!317159 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16052 0))(
  ( (Unit!16053) )
))
(declare-fun lt!237181 () Unit!16052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16052)

(assert (=> b!518141 (= lt!237181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518142 () Bool)

(declare-fun res!317154 () Bool)

(assert (=> b!518142 (=> res!317154 e!302335)))

(assert (=> b!518142 (= res!317154 (or (undefined!5209 lt!237177) (not (is-Intermediate!4397 lt!237177))))))

(declare-fun b!518143 () Bool)

(declare-fun res!317150 () Bool)

(assert (=> b!518143 (=> (not res!317150) (not e!302336))))

(assert (=> b!518143 (= res!317150 (and (= (size!16294 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16294 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16294 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518144 () Bool)

(declare-fun res!317149 () Bool)

(assert (=> b!518144 (=> (not res!317149) (not e!302336))))

(assert (=> b!518144 (= res!317149 (validKeyInArray!0 k!2280))))

(assert (= (and start!46992 res!317152) b!518143))

(assert (= (and b!518143 res!317150) b!518137))

(assert (= (and b!518137 res!317155) b!518144))

(assert (= (and b!518144 res!317149) b!518136))

(assert (= (and b!518136 res!317156) b!518135))

(assert (= (and b!518135 res!317151) b!518139))

(assert (= (and b!518139 res!317158) b!518138))

(assert (= (and b!518138 res!317153) b!518141))

(assert (= (and b!518141 res!317159) b!518140))

(assert (= (and b!518141 (not res!317157)) b!518142))

(assert (= (and b!518142 (not res!317154)) b!518134))

(declare-fun m!499485 () Bool)

(assert (=> b!518134 m!499485))

(declare-fun m!499487 () Bool)

(assert (=> b!518134 m!499487))

(declare-fun m!499489 () Bool)

(assert (=> b!518139 m!499489))

(assert (=> b!518140 m!499487))

(assert (=> b!518140 m!499487))

(declare-fun m!499491 () Bool)

(assert (=> b!518140 m!499491))

(declare-fun m!499493 () Bool)

(assert (=> start!46992 m!499493))

(declare-fun m!499495 () Bool)

(assert (=> start!46992 m!499495))

(declare-fun m!499497 () Bool)

(assert (=> b!518144 m!499497))

(declare-fun m!499499 () Bool)

(assert (=> b!518136 m!499499))

(declare-fun m!499501 () Bool)

(assert (=> b!518138 m!499501))

(declare-fun m!499503 () Bool)

(assert (=> b!518135 m!499503))

(declare-fun m!499505 () Bool)

(assert (=> b!518141 m!499505))

(declare-fun m!499507 () Bool)

(assert (=> b!518141 m!499507))

(declare-fun m!499509 () Bool)

(assert (=> b!518141 m!499509))

(assert (=> b!518141 m!499509))

(declare-fun m!499511 () Bool)

(assert (=> b!518141 m!499511))

(assert (=> b!518141 m!499487))

(declare-fun m!499513 () Bool)

(assert (=> b!518141 m!499513))

(declare-fun m!499515 () Bool)

(assert (=> b!518141 m!499515))

(assert (=> b!518141 m!499509))

(declare-fun m!499517 () Bool)

(assert (=> b!518141 m!499517))

(assert (=> b!518141 m!499487))

(declare-fun m!499519 () Bool)

(assert (=> b!518141 m!499519))

(assert (=> b!518141 m!499487))

(assert (=> b!518137 m!499487))

(assert (=> b!518137 m!499487))

(declare-fun m!499521 () Bool)

(assert (=> b!518137 m!499521))

(push 1)

