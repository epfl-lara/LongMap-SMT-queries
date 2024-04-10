; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44676 () Bool)

(assert start!44676)

(declare-fun b!490218 () Bool)

(declare-fun res!293156 () Bool)

(declare-fun e!288208 () Bool)

(assert (=> b!490218 (=> (not res!293156) (not e!288208))))

(declare-datatypes ((array!31735 0))(
  ( (array!31736 (arr!15255 (Array (_ BitVec 32) (_ BitVec 64))) (size!15619 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31735)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31735 (_ BitVec 32)) Bool)

(assert (=> b!490218 (= res!293156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490219 () Bool)

(declare-fun e!288209 () Bool)

(assert (=> b!490219 (= e!288209 e!288208)))

(declare-fun res!293154 () Bool)

(assert (=> b!490219 (=> (not res!293154) (not e!288208))))

(declare-datatypes ((SeekEntryResult!3722 0))(
  ( (MissingZero!3722 (index!17067 (_ BitVec 32))) (Found!3722 (index!17068 (_ BitVec 32))) (Intermediate!3722 (undefined!4534 Bool) (index!17069 (_ BitVec 32)) (x!46172 (_ BitVec 32))) (Undefined!3722) (MissingVacant!3722 (index!17070 (_ BitVec 32))) )
))
(declare-fun lt!221349 () SeekEntryResult!3722)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490219 (= res!293154 (or (= lt!221349 (MissingZero!3722 i!1204)) (= lt!221349 (MissingVacant!3722 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31735 (_ BitVec 32)) SeekEntryResult!3722)

(assert (=> b!490219 (= lt!221349 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!293160 () Bool)

(assert (=> start!44676 (=> (not res!293160) (not e!288209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44676 (= res!293160 (validMask!0 mask!3524))))

(assert (=> start!44676 e!288209))

(assert (=> start!44676 true))

(declare-fun array_inv!11051 (array!31735) Bool)

(assert (=> start!44676 (array_inv!11051 a!3235)))

(declare-fun b!490220 () Bool)

(declare-fun res!293162 () Bool)

(assert (=> b!490220 (=> (not res!293162) (not e!288209))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490220 (= res!293162 (and (= (size!15619 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15619 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15619 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490221 () Bool)

(declare-fun res!293159 () Bool)

(assert (=> b!490221 (=> (not res!293159) (not e!288208))))

(declare-datatypes ((List!9413 0))(
  ( (Nil!9410) (Cons!9409 (h!10271 (_ BitVec 64)) (t!15641 List!9413)) )
))
(declare-fun arrayNoDuplicates!0 (array!31735 (_ BitVec 32) List!9413) Bool)

(assert (=> b!490221 (= res!293159 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9410))))

(declare-fun b!490222 () Bool)

(declare-fun res!293161 () Bool)

(assert (=> b!490222 (=> (not res!293161) (not e!288209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490222 (= res!293161 (validKeyInArray!0 (select (arr!15255 a!3235) j!176)))))

(declare-fun b!490223 () Bool)

(declare-fun res!293155 () Bool)

(assert (=> b!490223 (=> (not res!293155) (not e!288209))))

(assert (=> b!490223 (= res!293155 (validKeyInArray!0 k!2280))))

(declare-fun b!490224 () Bool)

(declare-fun res!293157 () Bool)

(assert (=> b!490224 (=> (not res!293157) (not e!288209))))

(declare-fun arrayContainsKey!0 (array!31735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490224 (= res!293157 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun e!288207 () Bool)

(declare-fun b!490225 () Bool)

(assert (=> b!490225 (= e!288207 (= (seekEntryOrOpen!0 (select (arr!15255 a!3235) j!176) a!3235 mask!3524) (Found!3722 j!176)))))

(declare-fun b!490226 () Bool)

(assert (=> b!490226 (= e!288208 (not true))))

(declare-fun lt!221348 () (_ BitVec 32))

(declare-fun lt!221350 () SeekEntryResult!3722)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31735 (_ BitVec 32)) SeekEntryResult!3722)

(assert (=> b!490226 (= lt!221350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221348 (select (store (arr!15255 a!3235) i!1204 k!2280) j!176) (array!31736 (store (arr!15255 a!3235) i!1204 k!2280) (size!15619 a!3235)) mask!3524))))

(declare-fun lt!221347 () SeekEntryResult!3722)

(declare-fun lt!221346 () (_ BitVec 32))

(assert (=> b!490226 (= lt!221347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221346 (select (arr!15255 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490226 (= lt!221348 (toIndex!0 (select (store (arr!15255 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490226 (= lt!221346 (toIndex!0 (select (arr!15255 a!3235) j!176) mask!3524))))

(assert (=> b!490226 e!288207))

(declare-fun res!293158 () Bool)

(assert (=> b!490226 (=> (not res!293158) (not e!288207))))

(assert (=> b!490226 (= res!293158 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14390 0))(
  ( (Unit!14391) )
))
(declare-fun lt!221345 () Unit!14390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14390)

(assert (=> b!490226 (= lt!221345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44676 res!293160) b!490220))

(assert (= (and b!490220 res!293162) b!490222))

(assert (= (and b!490222 res!293161) b!490223))

(assert (= (and b!490223 res!293155) b!490224))

(assert (= (and b!490224 res!293157) b!490219))

(assert (= (and b!490219 res!293154) b!490218))

(assert (= (and b!490218 res!293156) b!490221))

(assert (= (and b!490221 res!293159) b!490226))

(assert (= (and b!490226 res!293158) b!490225))

(declare-fun m!470253 () Bool)

(assert (=> start!44676 m!470253))

(declare-fun m!470255 () Bool)

(assert (=> start!44676 m!470255))

(declare-fun m!470257 () Bool)

(assert (=> b!490218 m!470257))

(declare-fun m!470259 () Bool)

(assert (=> b!490223 m!470259))

(declare-fun m!470261 () Bool)

(assert (=> b!490225 m!470261))

(assert (=> b!490225 m!470261))

(declare-fun m!470263 () Bool)

(assert (=> b!490225 m!470263))

(declare-fun m!470265 () Bool)

(assert (=> b!490221 m!470265))

(assert (=> b!490222 m!470261))

(assert (=> b!490222 m!470261))

(declare-fun m!470267 () Bool)

(assert (=> b!490222 m!470267))

(declare-fun m!470269 () Bool)

(assert (=> b!490224 m!470269))

(declare-fun m!470271 () Bool)

(assert (=> b!490219 m!470271))

(declare-fun m!470273 () Bool)

(assert (=> b!490226 m!470273))

(declare-fun m!470275 () Bool)

(assert (=> b!490226 m!470275))

(declare-fun m!470277 () Bool)

(assert (=> b!490226 m!470277))

(declare-fun m!470279 () Bool)

(assert (=> b!490226 m!470279))

(assert (=> b!490226 m!470275))

(assert (=> b!490226 m!470261))

(declare-fun m!470281 () Bool)

(assert (=> b!490226 m!470281))

(assert (=> b!490226 m!470261))

(declare-fun m!470283 () Bool)

(assert (=> b!490226 m!470283))

(assert (=> b!490226 m!470261))

(declare-fun m!470285 () Bool)

(assert (=> b!490226 m!470285))

(assert (=> b!490226 m!470275))

(declare-fun m!470287 () Bool)

(assert (=> b!490226 m!470287))

(push 1)

(assert (not b!490223))

(assert (not b!490226))

(assert (not b!490225))

(assert (not b!490218))

(assert (not b!490219))

(assert (not b!490224))

(assert (not b!490221))

(assert (not start!44676))

(assert (not b!490222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

