; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44674 () Bool)

(assert start!44674)

(declare-fun b!490191 () Bool)

(declare-fun e!288195 () Bool)

(assert (=> b!490191 (= e!288195 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221331 () (_ BitVec 32))

(declare-datatypes ((array!31733 0))(
  ( (array!31734 (arr!15254 (Array (_ BitVec 32) (_ BitVec 64))) (size!15618 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31733)

(declare-datatypes ((SeekEntryResult!3721 0))(
  ( (MissingZero!3721 (index!17063 (_ BitVec 32))) (Found!3721 (index!17064 (_ BitVec 32))) (Intermediate!3721 (undefined!4533 Bool) (index!17065 (_ BitVec 32)) (x!46163 (_ BitVec 32))) (Undefined!3721) (MissingVacant!3721 (index!17066 (_ BitVec 32))) )
))
(declare-fun lt!221328 () SeekEntryResult!3721)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31733 (_ BitVec 32)) SeekEntryResult!3721)

(assert (=> b!490191 (= lt!221328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221331 (select (store (arr!15254 a!3235) i!1204 k!2280) j!176) (array!31734 (store (arr!15254 a!3235) i!1204 k!2280) (size!15618 a!3235)) mask!3524))))

(declare-fun lt!221327 () SeekEntryResult!3721)

(declare-fun lt!221329 () (_ BitVec 32))

(assert (=> b!490191 (= lt!221327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221329 (select (arr!15254 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490191 (= lt!221331 (toIndex!0 (select (store (arr!15254 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490191 (= lt!221329 (toIndex!0 (select (arr!15254 a!3235) j!176) mask!3524))))

(declare-fun e!288196 () Bool)

(assert (=> b!490191 e!288196))

(declare-fun res!293131 () Bool)

(assert (=> b!490191 (=> (not res!293131) (not e!288196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31733 (_ BitVec 32)) Bool)

(assert (=> b!490191 (= res!293131 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14388 0))(
  ( (Unit!14389) )
))
(declare-fun lt!221332 () Unit!14388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14388)

(assert (=> b!490191 (= lt!221332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490192 () Bool)

(declare-fun res!293134 () Bool)

(declare-fun e!288197 () Bool)

(assert (=> b!490192 (=> (not res!293134) (not e!288197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490192 (= res!293134 (validKeyInArray!0 (select (arr!15254 a!3235) j!176)))))

(declare-fun b!490193 () Bool)

(declare-fun res!293132 () Bool)

(assert (=> b!490193 (=> (not res!293132) (not e!288195))))

(declare-datatypes ((List!9412 0))(
  ( (Nil!9409) (Cons!9408 (h!10270 (_ BitVec 64)) (t!15640 List!9412)) )
))
(declare-fun arrayNoDuplicates!0 (array!31733 (_ BitVec 32) List!9412) Bool)

(assert (=> b!490193 (= res!293132 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9409))))

(declare-fun b!490194 () Bool)

(declare-fun res!293130 () Bool)

(assert (=> b!490194 (=> (not res!293130) (not e!288197))))

(assert (=> b!490194 (= res!293130 (validKeyInArray!0 k!2280))))

(declare-fun b!490195 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31733 (_ BitVec 32)) SeekEntryResult!3721)

(assert (=> b!490195 (= e!288196 (= (seekEntryOrOpen!0 (select (arr!15254 a!3235) j!176) a!3235 mask!3524) (Found!3721 j!176)))))

(declare-fun res!293133 () Bool)

(assert (=> start!44674 (=> (not res!293133) (not e!288197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44674 (= res!293133 (validMask!0 mask!3524))))

(assert (=> start!44674 e!288197))

(assert (=> start!44674 true))

(declare-fun array_inv!11050 (array!31733) Bool)

(assert (=> start!44674 (array_inv!11050 a!3235)))

(declare-fun b!490196 () Bool)

(assert (=> b!490196 (= e!288197 e!288195)))

(declare-fun res!293127 () Bool)

(assert (=> b!490196 (=> (not res!293127) (not e!288195))))

(declare-fun lt!221330 () SeekEntryResult!3721)

(assert (=> b!490196 (= res!293127 (or (= lt!221330 (MissingZero!3721 i!1204)) (= lt!221330 (MissingVacant!3721 i!1204))))))

(assert (=> b!490196 (= lt!221330 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490197 () Bool)

(declare-fun res!293135 () Bool)

(assert (=> b!490197 (=> (not res!293135) (not e!288197))))

(declare-fun arrayContainsKey!0 (array!31733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490197 (= res!293135 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490198 () Bool)

(declare-fun res!293128 () Bool)

(assert (=> b!490198 (=> (not res!293128) (not e!288195))))

(assert (=> b!490198 (= res!293128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490199 () Bool)

(declare-fun res!293129 () Bool)

(assert (=> b!490199 (=> (not res!293129) (not e!288197))))

(assert (=> b!490199 (= res!293129 (and (= (size!15618 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15618 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15618 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44674 res!293133) b!490199))

(assert (= (and b!490199 res!293129) b!490192))

(assert (= (and b!490192 res!293134) b!490194))

(assert (= (and b!490194 res!293130) b!490197))

(assert (= (and b!490197 res!293135) b!490196))

(assert (= (and b!490196 res!293127) b!490198))

(assert (= (and b!490198 res!293128) b!490193))

(assert (= (and b!490193 res!293132) b!490191))

(assert (= (and b!490191 res!293131) b!490195))

(declare-fun m!470217 () Bool)

(assert (=> b!490194 m!470217))

(declare-fun m!470219 () Bool)

(assert (=> b!490193 m!470219))

(declare-fun m!470221 () Bool)

(assert (=> b!490197 m!470221))

(declare-fun m!470223 () Bool)

(assert (=> b!490192 m!470223))

(assert (=> b!490192 m!470223))

(declare-fun m!470225 () Bool)

(assert (=> b!490192 m!470225))

(declare-fun m!470227 () Bool)

(assert (=> b!490191 m!470227))

(declare-fun m!470229 () Bool)

(assert (=> b!490191 m!470229))

(assert (=> b!490191 m!470223))

(declare-fun m!470231 () Bool)

(assert (=> b!490191 m!470231))

(assert (=> b!490191 m!470223))

(declare-fun m!470233 () Bool)

(assert (=> b!490191 m!470233))

(assert (=> b!490191 m!470229))

(declare-fun m!470235 () Bool)

(assert (=> b!490191 m!470235))

(assert (=> b!490191 m!470229))

(declare-fun m!470237 () Bool)

(assert (=> b!490191 m!470237))

(assert (=> b!490191 m!470223))

(declare-fun m!470239 () Bool)

(assert (=> b!490191 m!470239))

(declare-fun m!470241 () Bool)

(assert (=> b!490191 m!470241))

(declare-fun m!470243 () Bool)

(assert (=> start!44674 m!470243))

(declare-fun m!470245 () Bool)

(assert (=> start!44674 m!470245))

(declare-fun m!470247 () Bool)

(assert (=> b!490196 m!470247))

(assert (=> b!490195 m!470223))

(assert (=> b!490195 m!470223))

(declare-fun m!470249 () Bool)

(assert (=> b!490195 m!470249))

(declare-fun m!470251 () Bool)

(assert (=> b!490198 m!470251))

(push 1)

