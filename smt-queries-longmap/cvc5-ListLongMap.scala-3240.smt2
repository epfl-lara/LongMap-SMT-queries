; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45246 () Bool)

(assert start!45246)

(declare-fun b!496882 () Bool)

(declare-fun e!291326 () Bool)

(assert (=> b!496882 (= e!291326 true)))

(declare-datatypes ((SeekEntryResult!3917 0))(
  ( (MissingZero!3917 (index!17847 (_ BitVec 32))) (Found!3917 (index!17848 (_ BitVec 32))) (Intermediate!3917 (undefined!4729 Bool) (index!17849 (_ BitVec 32)) (x!46905 (_ BitVec 32))) (Undefined!3917) (MissingVacant!3917 (index!17850 (_ BitVec 32))) )
))
(declare-fun lt!224947 () SeekEntryResult!3917)

(declare-datatypes ((array!32134 0))(
  ( (array!32135 (arr!15450 (Array (_ BitVec 32) (_ BitVec 64))) (size!15814 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32134)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496882 (and (bvslt (x!46905 lt!224947) #b01111111111111111111111111111110) (or (= (select (arr!15450 a!3235) (index!17849 lt!224947)) (select (arr!15450 a!3235) j!176)) (= (select (arr!15450 a!3235) (index!17849 lt!224947)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15450 a!3235) (index!17849 lt!224947)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496883 () Bool)

(declare-fun res!299275 () Bool)

(declare-fun e!291325 () Bool)

(assert (=> b!496883 (=> (not res!299275) (not e!291325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496883 (= res!299275 (validKeyInArray!0 (select (arr!15450 a!3235) j!176)))))

(declare-fun res!299269 () Bool)

(assert (=> start!45246 (=> (not res!299269) (not e!291325))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45246 (= res!299269 (validMask!0 mask!3524))))

(assert (=> start!45246 e!291325))

(assert (=> start!45246 true))

(declare-fun array_inv!11246 (array!32134) Bool)

(assert (=> start!45246 (array_inv!11246 a!3235)))

(declare-fun b!496884 () Bool)

(declare-fun res!299277 () Bool)

(assert (=> b!496884 (=> (not res!299277) (not e!291325))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!496884 (= res!299277 (validKeyInArray!0 k!2280))))

(declare-fun b!496885 () Bool)

(declare-fun e!291327 () Bool)

(assert (=> b!496885 (= e!291327 (not e!291326))))

(declare-fun res!299279 () Bool)

(assert (=> b!496885 (=> res!299279 e!291326)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224944 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32134 (_ BitVec 32)) SeekEntryResult!3917)

(assert (=> b!496885 (= res!299279 (= lt!224947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224944 (select (store (arr!15450 a!3235) i!1204 k!2280) j!176) (array!32135 (store (arr!15450 a!3235) i!1204 k!2280) (size!15814 a!3235)) mask!3524)))))

(declare-fun lt!224946 () (_ BitVec 32))

(assert (=> b!496885 (= lt!224947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224946 (select (arr!15450 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496885 (= lt!224944 (toIndex!0 (select (store (arr!15450 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496885 (= lt!224946 (toIndex!0 (select (arr!15450 a!3235) j!176) mask!3524))))

(declare-fun e!291323 () Bool)

(assert (=> b!496885 e!291323))

(declare-fun res!299276 () Bool)

(assert (=> b!496885 (=> (not res!299276) (not e!291323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32134 (_ BitVec 32)) Bool)

(assert (=> b!496885 (= res!299276 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14780 0))(
  ( (Unit!14781) )
))
(declare-fun lt!224945 () Unit!14780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14780)

(assert (=> b!496885 (= lt!224945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496886 () Bool)

(declare-fun res!299270 () Bool)

(assert (=> b!496886 (=> (not res!299270) (not e!291327))))

(declare-datatypes ((List!9608 0))(
  ( (Nil!9605) (Cons!9604 (h!10475 (_ BitVec 64)) (t!15836 List!9608)) )
))
(declare-fun arrayNoDuplicates!0 (array!32134 (_ BitVec 32) List!9608) Bool)

(assert (=> b!496886 (= res!299270 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9605))))

(declare-fun b!496887 () Bool)

(declare-fun res!299272 () Bool)

(assert (=> b!496887 (=> (not res!299272) (not e!291325))))

(assert (=> b!496887 (= res!299272 (and (= (size!15814 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15814 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15814 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496888 () Bool)

(assert (=> b!496888 (= e!291325 e!291327)))

(declare-fun res!299274 () Bool)

(assert (=> b!496888 (=> (not res!299274) (not e!291327))))

(declare-fun lt!224943 () SeekEntryResult!3917)

(assert (=> b!496888 (= res!299274 (or (= lt!224943 (MissingZero!3917 i!1204)) (= lt!224943 (MissingVacant!3917 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32134 (_ BitVec 32)) SeekEntryResult!3917)

(assert (=> b!496888 (= lt!224943 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496889 () Bool)

(assert (=> b!496889 (= e!291323 (= (seekEntryOrOpen!0 (select (arr!15450 a!3235) j!176) a!3235 mask!3524) (Found!3917 j!176)))))

(declare-fun b!496890 () Bool)

(declare-fun res!299278 () Bool)

(assert (=> b!496890 (=> (not res!299278) (not e!291327))))

(assert (=> b!496890 (= res!299278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496891 () Bool)

(declare-fun res!299271 () Bool)

(assert (=> b!496891 (=> (not res!299271) (not e!291325))))

(declare-fun arrayContainsKey!0 (array!32134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496891 (= res!299271 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496892 () Bool)

(declare-fun res!299273 () Bool)

(assert (=> b!496892 (=> res!299273 e!291326)))

(assert (=> b!496892 (= res!299273 (or (undefined!4729 lt!224947) (not (is-Intermediate!3917 lt!224947))))))

(assert (= (and start!45246 res!299269) b!496887))

(assert (= (and b!496887 res!299272) b!496883))

(assert (= (and b!496883 res!299275) b!496884))

(assert (= (and b!496884 res!299277) b!496891))

(assert (= (and b!496891 res!299271) b!496888))

(assert (= (and b!496888 res!299274) b!496890))

(assert (= (and b!496890 res!299278) b!496886))

(assert (= (and b!496886 res!299270) b!496885))

(assert (= (and b!496885 res!299276) b!496889))

(assert (= (and b!496885 (not res!299279)) b!496892))

(assert (= (and b!496892 (not res!299273)) b!496882))

(declare-fun m!478185 () Bool)

(assert (=> b!496891 m!478185))

(declare-fun m!478187 () Bool)

(assert (=> b!496889 m!478187))

(assert (=> b!496889 m!478187))

(declare-fun m!478189 () Bool)

(assert (=> b!496889 m!478189))

(declare-fun m!478191 () Bool)

(assert (=> start!45246 m!478191))

(declare-fun m!478193 () Bool)

(assert (=> start!45246 m!478193))

(declare-fun m!478195 () Bool)

(assert (=> b!496882 m!478195))

(assert (=> b!496882 m!478187))

(declare-fun m!478197 () Bool)

(assert (=> b!496886 m!478197))

(declare-fun m!478199 () Bool)

(assert (=> b!496888 m!478199))

(declare-fun m!478201 () Bool)

(assert (=> b!496890 m!478201))

(assert (=> b!496883 m!478187))

(assert (=> b!496883 m!478187))

(declare-fun m!478203 () Bool)

(assert (=> b!496883 m!478203))

(declare-fun m!478205 () Bool)

(assert (=> b!496885 m!478205))

(declare-fun m!478207 () Bool)

(assert (=> b!496885 m!478207))

(declare-fun m!478209 () Bool)

(assert (=> b!496885 m!478209))

(assert (=> b!496885 m!478187))

(declare-fun m!478211 () Bool)

(assert (=> b!496885 m!478211))

(assert (=> b!496885 m!478187))

(declare-fun m!478213 () Bool)

(assert (=> b!496885 m!478213))

(assert (=> b!496885 m!478209))

(declare-fun m!478215 () Bool)

(assert (=> b!496885 m!478215))

(assert (=> b!496885 m!478187))

(declare-fun m!478217 () Bool)

(assert (=> b!496885 m!478217))

(assert (=> b!496885 m!478209))

(declare-fun m!478219 () Bool)

(assert (=> b!496885 m!478219))

(declare-fun m!478221 () Bool)

(assert (=> b!496884 m!478221))

(push 1)

(assert (not b!496889))

(assert (not b!496888))

(assert (not b!496890))

(assert (not b!496891))

(assert (not b!496886))

(assert (not b!496883))

(assert (not start!45246))

(assert (not b!496884))

(assert (not b!496885))

(check-sat)

