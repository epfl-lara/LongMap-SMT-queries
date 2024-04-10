; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45820 () Bool)

(assert start!45820)

(declare-fun e!296898 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32576 0))(
  ( (array!32577 (arr!15668 (Array (_ BitVec 32) (_ BitVec 64))) (size!16032 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32576)

(declare-fun b!507313 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4135 0))(
  ( (MissingZero!4135 (index!18728 (_ BitVec 32))) (Found!4135 (index!18729 (_ BitVec 32))) (Intermediate!4135 (undefined!4947 Bool) (index!18730 (_ BitVec 32)) (x!47720 (_ BitVec 32))) (Undefined!4135) (MissingVacant!4135 (index!18731 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32576 (_ BitVec 32)) SeekEntryResult!4135)

(assert (=> b!507313 (= e!296898 (= (seekEntryOrOpen!0 (select (arr!15668 a!3235) j!176) a!3235 mask!3524) (Found!4135 j!176)))))

(declare-fun b!507314 () Bool)

(declare-fun res!308282 () Bool)

(declare-fun e!296897 () Bool)

(assert (=> b!507314 (=> (not res!308282) (not e!296897))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507314 (= res!308282 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507315 () Bool)

(declare-fun res!308281 () Bool)

(assert (=> b!507315 (=> (not res!308281) (not e!296897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507315 (= res!308281 (validKeyInArray!0 k!2280))))

(declare-fun b!507316 () Bool)

(declare-fun e!296895 () Bool)

(assert (=> b!507316 (= e!296897 e!296895)))

(declare-fun res!308274 () Bool)

(assert (=> b!507316 (=> (not res!308274) (not e!296895))))

(declare-fun lt!231622 () SeekEntryResult!4135)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507316 (= res!308274 (or (= lt!231622 (MissingZero!4135 i!1204)) (= lt!231622 (MissingVacant!4135 i!1204))))))

(assert (=> b!507316 (= lt!231622 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507317 () Bool)

(declare-fun res!308275 () Bool)

(assert (=> b!507317 (=> (not res!308275) (not e!296895))))

(declare-datatypes ((List!9826 0))(
  ( (Nil!9823) (Cons!9822 (h!10699 (_ BitVec 64)) (t!16054 List!9826)) )
))
(declare-fun arrayNoDuplicates!0 (array!32576 (_ BitVec 32) List!9826) Bool)

(assert (=> b!507317 (= res!308275 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9823))))

(declare-fun b!507318 () Bool)

(declare-fun e!296896 () Bool)

(assert (=> b!507318 (= e!296896 true)))

(declare-fun lt!231621 () SeekEntryResult!4135)

(declare-fun lt!231626 () (_ BitVec 64))

(declare-fun lt!231627 () array!32576)

(assert (=> b!507318 (= lt!231621 (seekEntryOrOpen!0 lt!231626 lt!231627 mask!3524))))

(assert (=> b!507318 false))

(declare-fun res!308278 () Bool)

(assert (=> start!45820 (=> (not res!308278) (not e!296897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45820 (= res!308278 (validMask!0 mask!3524))))

(assert (=> start!45820 e!296897))

(assert (=> start!45820 true))

(declare-fun array_inv!11464 (array!32576) Bool)

(assert (=> start!45820 (array_inv!11464 a!3235)))

(declare-fun b!507319 () Bool)

(declare-fun res!308272 () Bool)

(assert (=> b!507319 (=> (not res!308272) (not e!296895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32576 (_ BitVec 32)) Bool)

(assert (=> b!507319 (= res!308272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507320 () Bool)

(declare-fun e!296894 () Bool)

(assert (=> b!507320 (= e!296895 (not e!296894))))

(declare-fun res!308279 () Bool)

(assert (=> b!507320 (=> res!308279 e!296894)))

(declare-fun lt!231623 () SeekEntryResult!4135)

(declare-fun lt!231624 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32576 (_ BitVec 32)) SeekEntryResult!4135)

(assert (=> b!507320 (= res!308279 (= lt!231623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231624 lt!231626 lt!231627 mask!3524)))))

(declare-fun lt!231625 () (_ BitVec 32))

(assert (=> b!507320 (= lt!231623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231625 (select (arr!15668 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507320 (= lt!231624 (toIndex!0 lt!231626 mask!3524))))

(assert (=> b!507320 (= lt!231626 (select (store (arr!15668 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507320 (= lt!231625 (toIndex!0 (select (arr!15668 a!3235) j!176) mask!3524))))

(assert (=> b!507320 (= lt!231627 (array!32577 (store (arr!15668 a!3235) i!1204 k!2280) (size!16032 a!3235)))))

(assert (=> b!507320 e!296898))

(declare-fun res!308277 () Bool)

(assert (=> b!507320 (=> (not res!308277) (not e!296898))))

(assert (=> b!507320 (= res!308277 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15558 0))(
  ( (Unit!15559) )
))
(declare-fun lt!231628 () Unit!15558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15558)

(assert (=> b!507320 (= lt!231628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507321 () Bool)

(declare-fun res!308273 () Bool)

(assert (=> b!507321 (=> (not res!308273) (not e!296897))))

(assert (=> b!507321 (= res!308273 (and (= (size!16032 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16032 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16032 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507322 () Bool)

(declare-fun res!308276 () Bool)

(assert (=> b!507322 (=> (not res!308276) (not e!296897))))

(assert (=> b!507322 (= res!308276 (validKeyInArray!0 (select (arr!15668 a!3235) j!176)))))

(declare-fun b!507323 () Bool)

(assert (=> b!507323 (= e!296894 e!296896)))

(declare-fun res!308280 () Bool)

(assert (=> b!507323 (=> res!308280 e!296896)))

(declare-fun lt!231620 () Bool)

(assert (=> b!507323 (= res!308280 (or (and (not lt!231620) (undefined!4947 lt!231623)) (and (not lt!231620) (not (undefined!4947 lt!231623)))))))

(assert (=> b!507323 (= lt!231620 (not (is-Intermediate!4135 lt!231623)))))

(assert (= (and start!45820 res!308278) b!507321))

(assert (= (and b!507321 res!308273) b!507322))

(assert (= (and b!507322 res!308276) b!507315))

(assert (= (and b!507315 res!308281) b!507314))

(assert (= (and b!507314 res!308282) b!507316))

(assert (= (and b!507316 res!308274) b!507319))

(assert (= (and b!507319 res!308272) b!507317))

(assert (= (and b!507317 res!308275) b!507320))

(assert (= (and b!507320 res!308277) b!507313))

(assert (= (and b!507320 (not res!308279)) b!507323))

(assert (= (and b!507323 (not res!308280)) b!507318))

(declare-fun m!488065 () Bool)

(assert (=> b!507316 m!488065))

(declare-fun m!488067 () Bool)

(assert (=> b!507322 m!488067))

(assert (=> b!507322 m!488067))

(declare-fun m!488069 () Bool)

(assert (=> b!507322 m!488069))

(declare-fun m!488071 () Bool)

(assert (=> b!507315 m!488071))

(declare-fun m!488073 () Bool)

(assert (=> b!507317 m!488073))

(assert (=> b!507313 m!488067))

(assert (=> b!507313 m!488067))

(declare-fun m!488075 () Bool)

(assert (=> b!507313 m!488075))

(declare-fun m!488077 () Bool)

(assert (=> start!45820 m!488077))

(declare-fun m!488079 () Bool)

(assert (=> start!45820 m!488079))

(assert (=> b!507320 m!488067))

(declare-fun m!488081 () Bool)

(assert (=> b!507320 m!488081))

(declare-fun m!488083 () Bool)

(assert (=> b!507320 m!488083))

(declare-fun m!488085 () Bool)

(assert (=> b!507320 m!488085))

(declare-fun m!488087 () Bool)

(assert (=> b!507320 m!488087))

(declare-fun m!488089 () Bool)

(assert (=> b!507320 m!488089))

(assert (=> b!507320 m!488067))

(declare-fun m!488091 () Bool)

(assert (=> b!507320 m!488091))

(assert (=> b!507320 m!488067))

(declare-fun m!488093 () Bool)

(assert (=> b!507320 m!488093))

(declare-fun m!488095 () Bool)

(assert (=> b!507320 m!488095))

(declare-fun m!488097 () Bool)

(assert (=> b!507318 m!488097))

(declare-fun m!488099 () Bool)

(assert (=> b!507319 m!488099))

(declare-fun m!488101 () Bool)

(assert (=> b!507314 m!488101))

(push 1)

