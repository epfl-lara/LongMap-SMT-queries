; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46254 () Bool)

(assert start!46254)

(declare-fun b!512300 () Bool)

(declare-fun res!312969 () Bool)

(declare-fun e!299210 () Bool)

(assert (=> b!512300 (=> (not res!312969) (not e!299210))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512300 (= res!312969 (validKeyInArray!0 k!2280))))

(declare-fun b!512301 () Bool)

(declare-fun res!312971 () Bool)

(declare-fun e!299208 () Bool)

(assert (=> b!512301 (=> (not res!312971) (not e!299208))))

(declare-datatypes ((array!32908 0))(
  ( (array!32909 (arr!15831 (Array (_ BitVec 32) (_ BitVec 64))) (size!16195 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32908)

(declare-datatypes ((List!9989 0))(
  ( (Nil!9986) (Cons!9985 (h!10865 (_ BitVec 64)) (t!16217 List!9989)) )
))
(declare-fun arrayNoDuplicates!0 (array!32908 (_ BitVec 32) List!9989) Bool)

(assert (=> b!512301 (= res!312971 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9986))))

(declare-fun b!512302 () Bool)

(declare-fun res!312964 () Bool)

(assert (=> b!512302 (=> (not res!312964) (not e!299210))))

(declare-fun arrayContainsKey!0 (array!32908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512302 (= res!312964 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512303 () Bool)

(declare-fun res!312965 () Bool)

(declare-fun e!299209 () Bool)

(assert (=> b!512303 (=> res!312965 e!299209)))

(declare-datatypes ((SeekEntryResult!4298 0))(
  ( (MissingZero!4298 (index!19380 (_ BitVec 32))) (Found!4298 (index!19381 (_ BitVec 32))) (Intermediate!4298 (undefined!5110 Bool) (index!19382 (_ BitVec 32)) (x!48329 (_ BitVec 32))) (Undefined!4298) (MissingVacant!4298 (index!19383 (_ BitVec 32))) )
))
(declare-fun lt!234500 () SeekEntryResult!4298)

(assert (=> b!512303 (= res!312965 (or (not (is-Intermediate!4298 lt!234500)) (not (undefined!5110 lt!234500))))))

(declare-fun res!312968 () Bool)

(assert (=> start!46254 (=> (not res!312968) (not e!299210))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46254 (= res!312968 (validMask!0 mask!3524))))

(assert (=> start!46254 e!299210))

(assert (=> start!46254 true))

(declare-fun array_inv!11627 (array!32908) Bool)

(assert (=> start!46254 (array_inv!11627 a!3235)))

(declare-fun b!512304 () Bool)

(declare-fun res!312966 () Bool)

(assert (=> b!512304 (=> (not res!312966) (not e!299208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32908 (_ BitVec 32)) Bool)

(assert (=> b!512304 (= res!312966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512305 () Bool)

(assert (=> b!512305 (= e!299209 true)))

(declare-fun lt!234501 () SeekEntryResult!4298)

(assert (=> b!512305 (= lt!234501 Undefined!4298)))

(declare-fun b!512306 () Bool)

(declare-fun res!312962 () Bool)

(assert (=> b!512306 (=> (not res!312962) (not e!299210))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512306 (= res!312962 (validKeyInArray!0 (select (arr!15831 a!3235) j!176)))))

(declare-fun b!512307 () Bool)

(assert (=> b!512307 (= e!299210 e!299208)))

(declare-fun res!312963 () Bool)

(assert (=> b!512307 (=> (not res!312963) (not e!299208))))

(declare-fun lt!234502 () SeekEntryResult!4298)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512307 (= res!312963 (or (= lt!234502 (MissingZero!4298 i!1204)) (= lt!234502 (MissingVacant!4298 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32908 (_ BitVec 32)) SeekEntryResult!4298)

(assert (=> b!512307 (= lt!234502 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512308 () Bool)

(assert (=> b!512308 (= e!299208 (not e!299209))))

(declare-fun res!312967 () Bool)

(assert (=> b!512308 (=> res!312967 e!299209)))

(declare-fun lt!234499 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32908 (_ BitVec 32)) SeekEntryResult!4298)

(assert (=> b!512308 (= res!312967 (= lt!234500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234499 (select (store (arr!15831 a!3235) i!1204 k!2280) j!176) (array!32909 (store (arr!15831 a!3235) i!1204 k!2280) (size!16195 a!3235)) mask!3524)))))

(declare-fun lt!234497 () (_ BitVec 32))

(assert (=> b!512308 (= lt!234500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234497 (select (arr!15831 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512308 (= lt!234499 (toIndex!0 (select (store (arr!15831 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512308 (= lt!234497 (toIndex!0 (select (arr!15831 a!3235) j!176) mask!3524))))

(assert (=> b!512308 (= lt!234501 (Found!4298 j!176))))

(assert (=> b!512308 (= lt!234501 (seekEntryOrOpen!0 (select (arr!15831 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512308 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15854 0))(
  ( (Unit!15855) )
))
(declare-fun lt!234498 () Unit!15854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15854)

(assert (=> b!512308 (= lt!234498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512309 () Bool)

(declare-fun res!312970 () Bool)

(assert (=> b!512309 (=> (not res!312970) (not e!299210))))

(assert (=> b!512309 (= res!312970 (and (= (size!16195 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16195 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16195 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46254 res!312968) b!512309))

(assert (= (and b!512309 res!312970) b!512306))

(assert (= (and b!512306 res!312962) b!512300))

(assert (= (and b!512300 res!312969) b!512302))

(assert (= (and b!512302 res!312964) b!512307))

(assert (= (and b!512307 res!312963) b!512304))

(assert (= (and b!512304 res!312966) b!512301))

(assert (= (and b!512301 res!312971) b!512308))

(assert (= (and b!512308 (not res!312967)) b!512303))

(assert (= (and b!512303 (not res!312965)) b!512305))

(declare-fun m!493929 () Bool)

(assert (=> b!512306 m!493929))

(assert (=> b!512306 m!493929))

(declare-fun m!493931 () Bool)

(assert (=> b!512306 m!493931))

(declare-fun m!493933 () Bool)

(assert (=> b!512307 m!493933))

(declare-fun m!493935 () Bool)

(assert (=> b!512300 m!493935))

(declare-fun m!493937 () Bool)

(assert (=> b!512301 m!493937))

(declare-fun m!493939 () Bool)

(assert (=> start!46254 m!493939))

(declare-fun m!493941 () Bool)

(assert (=> start!46254 m!493941))

(declare-fun m!493943 () Bool)

(assert (=> b!512302 m!493943))

(declare-fun m!493945 () Bool)

(assert (=> b!512304 m!493945))

(declare-fun m!493947 () Bool)

(assert (=> b!512308 m!493947))

(declare-fun m!493949 () Bool)

(assert (=> b!512308 m!493949))

(declare-fun m!493951 () Bool)

(assert (=> b!512308 m!493951))

(assert (=> b!512308 m!493929))

(declare-fun m!493953 () Bool)

(assert (=> b!512308 m!493953))

(assert (=> b!512308 m!493929))

(declare-fun m!493955 () Bool)

(assert (=> b!512308 m!493955))

(assert (=> b!512308 m!493929))

(assert (=> b!512308 m!493951))

(declare-fun m!493957 () Bool)

(assert (=> b!512308 m!493957))

(declare-fun m!493959 () Bool)

(assert (=> b!512308 m!493959))

(assert (=> b!512308 m!493929))

(declare-fun m!493961 () Bool)

(assert (=> b!512308 m!493961))

(assert (=> b!512308 m!493951))

(declare-fun m!493963 () Bool)

(assert (=> b!512308 m!493963))

(push 1)

