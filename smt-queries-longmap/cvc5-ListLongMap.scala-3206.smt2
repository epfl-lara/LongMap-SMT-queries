; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44982 () Bool)

(assert start!44982)

(declare-fun b!493376 () Bool)

(declare-fun e!289758 () Bool)

(declare-fun e!289761 () Bool)

(assert (=> b!493376 (= e!289758 (not e!289761))))

(declare-fun res!295946 () Bool)

(assert (=> b!493376 (=> res!295946 e!289761)))

(declare-fun lt!223134 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31927 0))(
  ( (array!31928 (arr!15348 (Array (_ BitVec 32) (_ BitVec 64))) (size!15712 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31927)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3815 0))(
  ( (MissingZero!3815 (index!17439 (_ BitVec 32))) (Found!3815 (index!17440 (_ BitVec 32))) (Intermediate!3815 (undefined!4627 Bool) (index!17441 (_ BitVec 32)) (x!46525 (_ BitVec 32))) (Undefined!3815) (MissingVacant!3815 (index!17442 (_ BitVec 32))) )
))
(declare-fun lt!223138 () SeekEntryResult!3815)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31927 (_ BitVec 32)) SeekEntryResult!3815)

(assert (=> b!493376 (= res!295946 (= lt!223138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223134 (select (store (arr!15348 a!3235) i!1204 k!2280) j!176) (array!31928 (store (arr!15348 a!3235) i!1204 k!2280) (size!15712 a!3235)) mask!3524)))))

(declare-fun lt!223135 () (_ BitVec 32))

(assert (=> b!493376 (= lt!223138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223135 (select (arr!15348 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493376 (= lt!223134 (toIndex!0 (select (store (arr!15348 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493376 (= lt!223135 (toIndex!0 (select (arr!15348 a!3235) j!176) mask!3524))))

(declare-fun lt!223136 () SeekEntryResult!3815)

(assert (=> b!493376 (= lt!223136 (Found!3815 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31927 (_ BitVec 32)) SeekEntryResult!3815)

(assert (=> b!493376 (= lt!223136 (seekEntryOrOpen!0 (select (arr!15348 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31927 (_ BitVec 32)) Bool)

(assert (=> b!493376 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14576 0))(
  ( (Unit!14577) )
))
(declare-fun lt!223133 () Unit!14576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14576)

(assert (=> b!493376 (= lt!223133 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493378 () Bool)

(declare-fun res!295955 () Bool)

(declare-fun e!289760 () Bool)

(assert (=> b!493378 (=> (not res!295955) (not e!289760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493378 (= res!295955 (validKeyInArray!0 k!2280))))

(declare-fun b!493379 () Bool)

(declare-fun res!295952 () Bool)

(assert (=> b!493379 (=> res!295952 e!289761)))

(assert (=> b!493379 (= res!295952 (or (not (is-Intermediate!3815 lt!223138)) (not (undefined!4627 lt!223138))))))

(declare-fun b!493380 () Bool)

(declare-fun res!295950 () Bool)

(assert (=> b!493380 (=> (not res!295950) (not e!289760))))

(assert (=> b!493380 (= res!295950 (validKeyInArray!0 (select (arr!15348 a!3235) j!176)))))

(declare-fun b!493381 () Bool)

(declare-fun res!295949 () Bool)

(assert (=> b!493381 (=> (not res!295949) (not e!289758))))

(assert (=> b!493381 (= res!295949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493382 () Bool)

(declare-fun res!295947 () Bool)

(assert (=> b!493382 (=> (not res!295947) (not e!289760))))

(declare-fun arrayContainsKey!0 (array!31927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493382 (= res!295947 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493383 () Bool)

(declare-fun res!295954 () Bool)

(assert (=> b!493383 (=> (not res!295954) (not e!289760))))

(assert (=> b!493383 (= res!295954 (and (= (size!15712 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15712 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15712 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493377 () Bool)

(assert (=> b!493377 (= e!289761 true)))

(assert (=> b!493377 (= lt!223136 Undefined!3815)))

(declare-fun res!295953 () Bool)

(assert (=> start!44982 (=> (not res!295953) (not e!289760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44982 (= res!295953 (validMask!0 mask!3524))))

(assert (=> start!44982 e!289760))

(assert (=> start!44982 true))

(declare-fun array_inv!11144 (array!31927) Bool)

(assert (=> start!44982 (array_inv!11144 a!3235)))

(declare-fun b!493384 () Bool)

(declare-fun res!295948 () Bool)

(assert (=> b!493384 (=> (not res!295948) (not e!289758))))

(declare-datatypes ((List!9506 0))(
  ( (Nil!9503) (Cons!9502 (h!10370 (_ BitVec 64)) (t!15734 List!9506)) )
))
(declare-fun arrayNoDuplicates!0 (array!31927 (_ BitVec 32) List!9506) Bool)

(assert (=> b!493384 (= res!295948 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9503))))

(declare-fun b!493385 () Bool)

(assert (=> b!493385 (= e!289760 e!289758)))

(declare-fun res!295951 () Bool)

(assert (=> b!493385 (=> (not res!295951) (not e!289758))))

(declare-fun lt!223137 () SeekEntryResult!3815)

(assert (=> b!493385 (= res!295951 (or (= lt!223137 (MissingZero!3815 i!1204)) (= lt!223137 (MissingVacant!3815 i!1204))))))

(assert (=> b!493385 (= lt!223137 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44982 res!295953) b!493383))

(assert (= (and b!493383 res!295954) b!493380))

(assert (= (and b!493380 res!295950) b!493378))

(assert (= (and b!493378 res!295955) b!493382))

(assert (= (and b!493382 res!295947) b!493385))

(assert (= (and b!493385 res!295951) b!493381))

(assert (= (and b!493381 res!295949) b!493384))

(assert (= (and b!493384 res!295948) b!493376))

(assert (= (and b!493376 (not res!295946)) b!493379))

(assert (= (and b!493379 (not res!295952)) b!493377))

(declare-fun m!474207 () Bool)

(assert (=> b!493380 m!474207))

(assert (=> b!493380 m!474207))

(declare-fun m!474209 () Bool)

(assert (=> b!493380 m!474209))

(declare-fun m!474211 () Bool)

(assert (=> start!44982 m!474211))

(declare-fun m!474213 () Bool)

(assert (=> start!44982 m!474213))

(declare-fun m!474215 () Bool)

(assert (=> b!493378 m!474215))

(declare-fun m!474217 () Bool)

(assert (=> b!493376 m!474217))

(declare-fun m!474219 () Bool)

(assert (=> b!493376 m!474219))

(declare-fun m!474221 () Bool)

(assert (=> b!493376 m!474221))

(assert (=> b!493376 m!474221))

(declare-fun m!474223 () Bool)

(assert (=> b!493376 m!474223))

(assert (=> b!493376 m!474207))

(declare-fun m!474225 () Bool)

(assert (=> b!493376 m!474225))

(assert (=> b!493376 m!474207))

(declare-fun m!474227 () Bool)

(assert (=> b!493376 m!474227))

(assert (=> b!493376 m!474207))

(declare-fun m!474229 () Bool)

(assert (=> b!493376 m!474229))

(assert (=> b!493376 m!474207))

(declare-fun m!474231 () Bool)

(assert (=> b!493376 m!474231))

(assert (=> b!493376 m!474221))

(declare-fun m!474233 () Bool)

(assert (=> b!493376 m!474233))

(declare-fun m!474235 () Bool)

(assert (=> b!493385 m!474235))

(declare-fun m!474237 () Bool)

(assert (=> b!493382 m!474237))

(declare-fun m!474239 () Bool)

(assert (=> b!493384 m!474239))

(declare-fun m!474241 () Bool)

(assert (=> b!493381 m!474241))

(push 1)

(assert (not b!493381))

(assert (not b!493384))

(assert (not b!493385))

(assert (not b!493378))

(assert (not b!493382))

(assert (not start!44982))

(assert (not b!493376))

