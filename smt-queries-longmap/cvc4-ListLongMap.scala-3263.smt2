; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45454 () Bool)

(assert start!45454)

(declare-fun b!500178 () Bool)

(declare-fun res!302049 () Bool)

(declare-fun e!293070 () Bool)

(assert (=> b!500178 (=> (not res!302049) (not e!293070))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500178 (= res!302049 (validKeyInArray!0 k!2280))))

(declare-fun b!500179 () Bool)

(declare-fun res!302042 () Bool)

(assert (=> b!500179 (=> (not res!302042) (not e!293070))))

(declare-datatypes ((array!32279 0))(
  ( (array!32280 (arr!15521 (Array (_ BitVec 32) (_ BitVec 64))) (size!15885 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32279)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500179 (= res!302042 (validKeyInArray!0 (select (arr!15521 a!3235) j!176)))))

(declare-fun b!500180 () Bool)

(declare-fun res!302047 () Bool)

(declare-fun e!293069 () Bool)

(assert (=> b!500180 (=> res!302047 e!293069)))

(declare-datatypes ((SeekEntryResult!3988 0))(
  ( (MissingZero!3988 (index!18134 (_ BitVec 32))) (Found!3988 (index!18135 (_ BitVec 32))) (Intermediate!3988 (undefined!4800 Bool) (index!18136 (_ BitVec 32)) (x!47169 (_ BitVec 32))) (Undefined!3988) (MissingVacant!3988 (index!18137 (_ BitVec 32))) )
))
(declare-fun lt!226940 () SeekEntryResult!3988)

(assert (=> b!500180 (= res!302047 (or (undefined!4800 lt!226940) (not (is-Intermediate!3988 lt!226940))))))

(declare-fun b!500181 () Bool)

(declare-datatypes ((Unit!15028 0))(
  ( (Unit!15029) )
))
(declare-fun e!293065 () Unit!15028)

(declare-fun Unit!15030 () Unit!15028)

(assert (=> b!500181 (= e!293065 Unit!15030)))

(declare-fun b!500182 () Bool)

(declare-fun e!293064 () Bool)

(assert (=> b!500182 (= e!293069 e!293064)))

(declare-fun res!302046 () Bool)

(assert (=> b!500182 (=> res!302046 e!293064)))

(declare-fun lt!226947 () (_ BitVec 32))

(assert (=> b!500182 (= res!302046 (or (bvsgt #b00000000000000000000000000000000 (x!47169 lt!226940)) (bvsgt (x!47169 lt!226940) #b01111111111111111111111111111110) (bvslt lt!226947 #b00000000000000000000000000000000) (bvsge lt!226947 (size!15885 a!3235)) (bvslt (index!18136 lt!226940) #b00000000000000000000000000000000) (bvsge (index!18136 lt!226940) (size!15885 a!3235)) (not (= lt!226940 (Intermediate!3988 false (index!18136 lt!226940) (x!47169 lt!226940))))))))

(assert (=> b!500182 (and (or (= (select (arr!15521 a!3235) (index!18136 lt!226940)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15521 a!3235) (index!18136 lt!226940)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15521 a!3235) (index!18136 lt!226940)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15521 a!3235) (index!18136 lt!226940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226943 () Unit!15028)

(assert (=> b!500182 (= lt!226943 e!293065)))

(declare-fun c!59345 () Bool)

(assert (=> b!500182 (= c!59345 (= (select (arr!15521 a!3235) (index!18136 lt!226940)) (select (arr!15521 a!3235) j!176)))))

(assert (=> b!500182 (and (bvslt (x!47169 lt!226940) #b01111111111111111111111111111110) (or (= (select (arr!15521 a!3235) (index!18136 lt!226940)) (select (arr!15521 a!3235) j!176)) (= (select (arr!15521 a!3235) (index!18136 lt!226940)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15521 a!3235) (index!18136 lt!226940)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500183 () Bool)

(declare-fun e!293068 () Bool)

(assert (=> b!500183 (= e!293068 (not e!293069))))

(declare-fun res!302045 () Bool)

(assert (=> b!500183 (=> res!302045 e!293069)))

(declare-fun lt!226939 () (_ BitVec 32))

(declare-fun lt!226946 () (_ BitVec 64))

(declare-fun lt!226941 () array!32279)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32279 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!500183 (= res!302045 (= lt!226940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226939 lt!226946 lt!226941 mask!3524)))))

(assert (=> b!500183 (= lt!226940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226947 (select (arr!15521 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500183 (= lt!226939 (toIndex!0 lt!226946 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500183 (= lt!226946 (select (store (arr!15521 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500183 (= lt!226947 (toIndex!0 (select (arr!15521 a!3235) j!176) mask!3524))))

(assert (=> b!500183 (= lt!226941 (array!32280 (store (arr!15521 a!3235) i!1204 k!2280) (size!15885 a!3235)))))

(declare-fun e!293063 () Bool)

(assert (=> b!500183 e!293063))

(declare-fun res!302048 () Bool)

(assert (=> b!500183 (=> (not res!302048) (not e!293063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32279 (_ BitVec 32)) Bool)

(assert (=> b!500183 (= res!302048 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226944 () Unit!15028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15028)

(assert (=> b!500183 (= lt!226944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500184 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32279 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!500184 (= e!293063 (= (seekEntryOrOpen!0 (select (arr!15521 a!3235) j!176) a!3235 mask!3524) (Found!3988 j!176)))))

(declare-fun b!500185 () Bool)

(declare-fun res!302051 () Bool)

(assert (=> b!500185 (=> (not res!302051) (not e!293070))))

(declare-fun arrayContainsKey!0 (array!32279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500185 (= res!302051 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500186 () Bool)

(declare-fun res!302054 () Bool)

(assert (=> b!500186 (=> (not res!302054) (not e!293068))))

(assert (=> b!500186 (= res!302054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500187 () Bool)

(declare-fun res!302044 () Bool)

(assert (=> b!500187 (=> (not res!302044) (not e!293070))))

(assert (=> b!500187 (= res!302044 (and (= (size!15885 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15885 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15885 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500188 () Bool)

(declare-fun res!302050 () Bool)

(assert (=> b!500188 (=> (not res!302050) (not e!293068))))

(declare-datatypes ((List!9679 0))(
  ( (Nil!9676) (Cons!9675 (h!10549 (_ BitVec 64)) (t!15907 List!9679)) )
))
(declare-fun arrayNoDuplicates!0 (array!32279 (_ BitVec 32) List!9679) Bool)

(assert (=> b!500188 (= res!302050 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9676))))

(declare-fun res!302053 () Bool)

(assert (=> start!45454 (=> (not res!302053) (not e!293070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45454 (= res!302053 (validMask!0 mask!3524))))

(assert (=> start!45454 e!293070))

(assert (=> start!45454 true))

(declare-fun array_inv!11317 (array!32279) Bool)

(assert (=> start!45454 (array_inv!11317 a!3235)))

(declare-fun b!500189 () Bool)

(assert (=> b!500189 (= e!293070 e!293068)))

(declare-fun res!302052 () Bool)

(assert (=> b!500189 (=> (not res!302052) (not e!293068))))

(declare-fun lt!226942 () SeekEntryResult!3988)

(assert (=> b!500189 (= res!302052 (or (= lt!226942 (MissingZero!3988 i!1204)) (= lt!226942 (MissingVacant!3988 i!1204))))))

(assert (=> b!500189 (= lt!226942 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500190 () Bool)

(declare-fun Unit!15031 () Unit!15028)

(assert (=> b!500190 (= e!293065 Unit!15031)))

(declare-fun lt!226945 () Unit!15028)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15028)

(assert (=> b!500190 (= lt!226945 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226947 #b00000000000000000000000000000000 (index!18136 lt!226940) (x!47169 lt!226940) mask!3524))))

(declare-fun res!302043 () Bool)

(assert (=> b!500190 (= res!302043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226947 lt!226946 lt!226941 mask!3524) (Intermediate!3988 false (index!18136 lt!226940) (x!47169 lt!226940))))))

(declare-fun e!293067 () Bool)

(assert (=> b!500190 (=> (not res!302043) (not e!293067))))

(assert (=> b!500190 e!293067))

(declare-fun b!500191 () Bool)

(assert (=> b!500191 (= e!293064 true)))

(declare-fun lt!226948 () SeekEntryResult!3988)

(assert (=> b!500191 (= lt!226948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226947 lt!226946 lt!226941 mask!3524))))

(declare-fun b!500192 () Bool)

(assert (=> b!500192 (= e!293067 false)))

(assert (= (and start!45454 res!302053) b!500187))

(assert (= (and b!500187 res!302044) b!500179))

(assert (= (and b!500179 res!302042) b!500178))

(assert (= (and b!500178 res!302049) b!500185))

(assert (= (and b!500185 res!302051) b!500189))

(assert (= (and b!500189 res!302052) b!500186))

(assert (= (and b!500186 res!302054) b!500188))

(assert (= (and b!500188 res!302050) b!500183))

(assert (= (and b!500183 res!302048) b!500184))

(assert (= (and b!500183 (not res!302045)) b!500180))

(assert (= (and b!500180 (not res!302047)) b!500182))

(assert (= (and b!500182 c!59345) b!500190))

(assert (= (and b!500182 (not c!59345)) b!500181))

(assert (= (and b!500190 res!302043) b!500192))

(assert (= (and b!500182 (not res!302046)) b!500191))

(declare-fun m!481329 () Bool)

(assert (=> b!500188 m!481329))

(declare-fun m!481331 () Bool)

(assert (=> b!500185 m!481331))

(declare-fun m!481333 () Bool)

(assert (=> b!500189 m!481333))

(declare-fun m!481335 () Bool)

(assert (=> b!500190 m!481335))

(declare-fun m!481337 () Bool)

(assert (=> b!500190 m!481337))

(assert (=> b!500191 m!481337))

(declare-fun m!481339 () Bool)

(assert (=> b!500186 m!481339))

(declare-fun m!481341 () Bool)

(assert (=> b!500178 m!481341))

(declare-fun m!481343 () Bool)

(assert (=> b!500183 m!481343))

(declare-fun m!481345 () Bool)

(assert (=> b!500183 m!481345))

(declare-fun m!481347 () Bool)

(assert (=> b!500183 m!481347))

(declare-fun m!481349 () Bool)

(assert (=> b!500183 m!481349))

(assert (=> b!500183 m!481347))

(declare-fun m!481351 () Bool)

(assert (=> b!500183 m!481351))

(declare-fun m!481353 () Bool)

(assert (=> b!500183 m!481353))

(assert (=> b!500183 m!481347))

(declare-fun m!481355 () Bool)

(assert (=> b!500183 m!481355))

(declare-fun m!481357 () Bool)

(assert (=> b!500183 m!481357))

(declare-fun m!481359 () Bool)

(assert (=> b!500183 m!481359))

(assert (=> b!500184 m!481347))

(assert (=> b!500184 m!481347))

(declare-fun m!481361 () Bool)

(assert (=> b!500184 m!481361))

(assert (=> b!500179 m!481347))

(assert (=> b!500179 m!481347))

(declare-fun m!481363 () Bool)

(assert (=> b!500179 m!481363))

(declare-fun m!481365 () Bool)

(assert (=> start!45454 m!481365))

(declare-fun m!481367 () Bool)

(assert (=> start!45454 m!481367))

(declare-fun m!481369 () Bool)

(assert (=> b!500182 m!481369))

(assert (=> b!500182 m!481347))

(push 1)

