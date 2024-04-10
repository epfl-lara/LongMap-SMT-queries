; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44670 () Bool)

(assert start!44670)

(declare-fun b!490137 () Bool)

(declare-fun res!293076 () Bool)

(declare-fun e!288173 () Bool)

(assert (=> b!490137 (=> (not res!293076) (not e!288173))))

(declare-datatypes ((array!31729 0))(
  ( (array!31730 (arr!15252 (Array (_ BitVec 32) (_ BitVec 64))) (size!15616 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31729)

(declare-datatypes ((List!9410 0))(
  ( (Nil!9407) (Cons!9406 (h!10268 (_ BitVec 64)) (t!15638 List!9410)) )
))
(declare-fun arrayNoDuplicates!0 (array!31729 (_ BitVec 32) List!9410) Bool)

(assert (=> b!490137 (= res!293076 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9407))))

(declare-fun res!293073 () Bool)

(declare-fun e!288174 () Bool)

(assert (=> start!44670 (=> (not res!293073) (not e!288174))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44670 (= res!293073 (validMask!0 mask!3524))))

(assert (=> start!44670 e!288174))

(assert (=> start!44670 true))

(declare-fun array_inv!11048 (array!31729) Bool)

(assert (=> start!44670 (array_inv!11048 a!3235)))

(declare-fun b!490138 () Bool)

(declare-fun res!293074 () Bool)

(assert (=> b!490138 (=> (not res!293074) (not e!288174))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490138 (= res!293074 (validKeyInArray!0 (select (arr!15252 a!3235) j!176)))))

(declare-fun b!490139 () Bool)

(declare-fun res!293079 () Bool)

(assert (=> b!490139 (=> (not res!293079) (not e!288174))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!490139 (= res!293079 (validKeyInArray!0 k!2280))))

(declare-fun b!490140 () Bool)

(declare-fun e!288172 () Bool)

(declare-datatypes ((SeekEntryResult!3719 0))(
  ( (MissingZero!3719 (index!17055 (_ BitVec 32))) (Found!3719 (index!17056 (_ BitVec 32))) (Intermediate!3719 (undefined!4531 Bool) (index!17057 (_ BitVec 32)) (x!46161 (_ BitVec 32))) (Undefined!3719) (MissingVacant!3719 (index!17058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31729 (_ BitVec 32)) SeekEntryResult!3719)

(assert (=> b!490140 (= e!288172 (= (seekEntryOrOpen!0 (select (arr!15252 a!3235) j!176) a!3235 mask!3524) (Found!3719 j!176)))))

(declare-fun b!490141 () Bool)

(declare-fun res!293080 () Bool)

(assert (=> b!490141 (=> (not res!293080) (not e!288174))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490141 (= res!293080 (and (= (size!15616 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15616 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15616 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490142 () Bool)

(assert (=> b!490142 (= e!288174 e!288173)))

(declare-fun res!293081 () Bool)

(assert (=> b!490142 (=> (not res!293081) (not e!288173))))

(declare-fun lt!221296 () SeekEntryResult!3719)

(assert (=> b!490142 (= res!293081 (or (= lt!221296 (MissingZero!3719 i!1204)) (= lt!221296 (MissingVacant!3719 i!1204))))))

(assert (=> b!490142 (= lt!221296 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490143 () Bool)

(declare-fun res!293075 () Bool)

(assert (=> b!490143 (=> (not res!293075) (not e!288174))))

(declare-fun arrayContainsKey!0 (array!31729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490143 (= res!293075 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490144 () Bool)

(declare-fun res!293078 () Bool)

(assert (=> b!490144 (=> (not res!293078) (not e!288173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31729 (_ BitVec 32)) Bool)

(assert (=> b!490144 (= res!293078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490145 () Bool)

(assert (=> b!490145 (= e!288173 (not true))))

(declare-fun lt!221292 () (_ BitVec 32))

(declare-fun lt!221291 () SeekEntryResult!3719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31729 (_ BitVec 32)) SeekEntryResult!3719)

(assert (=> b!490145 (= lt!221291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221292 (select (store (arr!15252 a!3235) i!1204 k!2280) j!176) (array!31730 (store (arr!15252 a!3235) i!1204 k!2280) (size!15616 a!3235)) mask!3524))))

(declare-fun lt!221294 () SeekEntryResult!3719)

(declare-fun lt!221295 () (_ BitVec 32))

(assert (=> b!490145 (= lt!221294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221295 (select (arr!15252 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490145 (= lt!221292 (toIndex!0 (select (store (arr!15252 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490145 (= lt!221295 (toIndex!0 (select (arr!15252 a!3235) j!176) mask!3524))))

(assert (=> b!490145 e!288172))

(declare-fun res!293077 () Bool)

(assert (=> b!490145 (=> (not res!293077) (not e!288172))))

(assert (=> b!490145 (= res!293077 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14384 0))(
  ( (Unit!14385) )
))
(declare-fun lt!221293 () Unit!14384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14384)

(assert (=> b!490145 (= lt!221293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44670 res!293073) b!490141))

(assert (= (and b!490141 res!293080) b!490138))

(assert (= (and b!490138 res!293074) b!490139))

(assert (= (and b!490139 res!293079) b!490143))

(assert (= (and b!490143 res!293075) b!490142))

(assert (= (and b!490142 res!293081) b!490144))

(assert (= (and b!490144 res!293078) b!490137))

(assert (= (and b!490137 res!293076) b!490145))

(assert (= (and b!490145 res!293077) b!490140))

(declare-fun m!470145 () Bool)

(assert (=> b!490140 m!470145))

(assert (=> b!490140 m!470145))

(declare-fun m!470147 () Bool)

(assert (=> b!490140 m!470147))

(assert (=> b!490138 m!470145))

(assert (=> b!490138 m!470145))

(declare-fun m!470149 () Bool)

(assert (=> b!490138 m!470149))

(declare-fun m!470151 () Bool)

(assert (=> b!490143 m!470151))

(declare-fun m!470153 () Bool)

(assert (=> start!44670 m!470153))

(declare-fun m!470155 () Bool)

(assert (=> start!44670 m!470155))

(declare-fun m!470157 () Bool)

(assert (=> b!490144 m!470157))

(assert (=> b!490145 m!470145))

(declare-fun m!470159 () Bool)

(assert (=> b!490145 m!470159))

(declare-fun m!470161 () Bool)

(assert (=> b!490145 m!470161))

(declare-fun m!470163 () Bool)

(assert (=> b!490145 m!470163))

(declare-fun m!470165 () Bool)

(assert (=> b!490145 m!470165))

(assert (=> b!490145 m!470145))

(declare-fun m!470167 () Bool)

(assert (=> b!490145 m!470167))

(assert (=> b!490145 m!470145))

(declare-fun m!470169 () Bool)

(assert (=> b!490145 m!470169))

(assert (=> b!490145 m!470165))

(declare-fun m!470171 () Bool)

(assert (=> b!490145 m!470171))

(assert (=> b!490145 m!470165))

(declare-fun m!470173 () Bool)

(assert (=> b!490145 m!470173))

(declare-fun m!470175 () Bool)

(assert (=> b!490137 m!470175))

(declare-fun m!470177 () Bool)

(assert (=> b!490139 m!470177))

(declare-fun m!470179 () Bool)

(assert (=> b!490142 m!470179))

(push 1)

