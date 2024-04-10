; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48138 () Bool)

(assert start!48138)

(declare-fun res!325945 () Bool)

(declare-fun e!308954 () Bool)

(assert (=> start!48138 (=> (not res!325945) (not e!308954))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48138 (= res!325945 (validMask!0 mask!3524))))

(assert (=> start!48138 e!308954))

(assert (=> start!48138 true))

(declare-datatypes ((array!33574 0))(
  ( (array!33575 (arr!16134 (Array (_ BitVec 32) (_ BitVec 64))) (size!16498 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33574)

(declare-fun array_inv!11930 (array!33574) Bool)

(assert (=> start!48138 (array_inv!11930 a!3235)))

(declare-fun b!530236 () Bool)

(declare-fun e!308950 () Bool)

(assert (=> b!530236 (= e!308954 e!308950)))

(declare-fun res!325948 () Bool)

(assert (=> b!530236 (=> (not res!325948) (not e!308950))))

(declare-datatypes ((SeekEntryResult!4601 0))(
  ( (MissingZero!4601 (index!20628 (_ BitVec 32))) (Found!4601 (index!20629 (_ BitVec 32))) (Intermediate!4601 (undefined!5413 Bool) (index!20630 (_ BitVec 32)) (x!49599 (_ BitVec 32))) (Undefined!4601) (MissingVacant!4601 (index!20631 (_ BitVec 32))) )
))
(declare-fun lt!244617 () SeekEntryResult!4601)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530236 (= res!325948 (or (= lt!244617 (MissingZero!4601 i!1204)) (= lt!244617 (MissingVacant!4601 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33574 (_ BitVec 32)) SeekEntryResult!4601)

(assert (=> b!530236 (= lt!244617 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530237 () Bool)

(declare-fun res!325943 () Bool)

(assert (=> b!530237 (=> (not res!325943) (not e!308954))))

(declare-fun arrayContainsKey!0 (array!33574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530237 (= res!325943 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530238 () Bool)

(declare-fun res!325944 () Bool)

(assert (=> b!530238 (=> (not res!325944) (not e!308954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530238 (= res!325944 (validKeyInArray!0 k!2280))))

(declare-fun b!530239 () Bool)

(declare-fun e!308953 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530239 (= e!308953 (= (seekEntryOrOpen!0 (select (arr!16134 a!3235) j!176) a!3235 mask!3524) (Found!4601 j!176)))))

(declare-fun b!530240 () Bool)

(declare-fun res!325951 () Bool)

(assert (=> b!530240 (=> (not res!325951) (not e!308954))))

(assert (=> b!530240 (= res!325951 (validKeyInArray!0 (select (arr!16134 a!3235) j!176)))))

(declare-fun b!530241 () Bool)

(declare-fun e!308951 () Bool)

(declare-fun e!308952 () Bool)

(assert (=> b!530241 (= e!308951 e!308952)))

(declare-fun res!325946 () Bool)

(assert (=> b!530241 (=> res!325946 e!308952)))

(declare-fun lt!244613 () Bool)

(declare-fun lt!244620 () SeekEntryResult!4601)

(assert (=> b!530241 (= res!325946 (or (and (not lt!244613) (undefined!5413 lt!244620)) (and (not lt!244613) (not (undefined!5413 lt!244620)))))))

(assert (=> b!530241 (= lt!244613 (not (is-Intermediate!4601 lt!244620)))))

(declare-fun b!530242 () Bool)

(declare-fun res!325950 () Bool)

(assert (=> b!530242 (=> (not res!325950) (not e!308950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33574 (_ BitVec 32)) Bool)

(assert (=> b!530242 (= res!325950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530243 () Bool)

(assert (=> b!530243 (= e!308952 true)))

(declare-fun lt!244615 () array!33574)

(declare-fun lt!244618 () SeekEntryResult!4601)

(declare-fun lt!244614 () (_ BitVec 64))

(assert (=> b!530243 (= lt!244618 (seekEntryOrOpen!0 lt!244614 lt!244615 mask!3524))))

(assert (=> b!530243 false))

(declare-fun b!530244 () Bool)

(assert (=> b!530244 (= e!308950 (not e!308951))))

(declare-fun res!325942 () Bool)

(assert (=> b!530244 (=> res!325942 e!308951)))

(declare-fun lt!244616 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33574 (_ BitVec 32)) SeekEntryResult!4601)

(assert (=> b!530244 (= res!325942 (= lt!244620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244616 lt!244614 lt!244615 mask!3524)))))

(declare-fun lt!244621 () (_ BitVec 32))

(assert (=> b!530244 (= lt!244620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244621 (select (arr!16134 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530244 (= lt!244616 (toIndex!0 lt!244614 mask!3524))))

(assert (=> b!530244 (= lt!244614 (select (store (arr!16134 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530244 (= lt!244621 (toIndex!0 (select (arr!16134 a!3235) j!176) mask!3524))))

(assert (=> b!530244 (= lt!244615 (array!33575 (store (arr!16134 a!3235) i!1204 k!2280) (size!16498 a!3235)))))

(assert (=> b!530244 e!308953))

(declare-fun res!325949 () Bool)

(assert (=> b!530244 (=> (not res!325949) (not e!308953))))

(assert (=> b!530244 (= res!325949 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16814 0))(
  ( (Unit!16815) )
))
(declare-fun lt!244619 () Unit!16814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16814)

(assert (=> b!530244 (= lt!244619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530245 () Bool)

(declare-fun res!325947 () Bool)

(assert (=> b!530245 (=> (not res!325947) (not e!308950))))

(declare-datatypes ((List!10292 0))(
  ( (Nil!10289) (Cons!10288 (h!11228 (_ BitVec 64)) (t!16520 List!10292)) )
))
(declare-fun arrayNoDuplicates!0 (array!33574 (_ BitVec 32) List!10292) Bool)

(assert (=> b!530245 (= res!325947 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10289))))

(declare-fun b!530246 () Bool)

(declare-fun res!325952 () Bool)

(assert (=> b!530246 (=> (not res!325952) (not e!308954))))

(assert (=> b!530246 (= res!325952 (and (= (size!16498 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16498 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16498 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!48138 res!325945) b!530246))

(assert (= (and b!530246 res!325952) b!530240))

(assert (= (and b!530240 res!325951) b!530238))

(assert (= (and b!530238 res!325944) b!530237))

(assert (= (and b!530237 res!325943) b!530236))

(assert (= (and b!530236 res!325948) b!530242))

(assert (= (and b!530242 res!325950) b!530245))

(assert (= (and b!530245 res!325947) b!530244))

(assert (= (and b!530244 res!325949) b!530239))

(assert (= (and b!530244 (not res!325942)) b!530241))

(assert (= (and b!530241 (not res!325946)) b!530243))

(declare-fun m!510789 () Bool)

(assert (=> b!530244 m!510789))

(declare-fun m!510791 () Bool)

(assert (=> b!530244 m!510791))

(declare-fun m!510793 () Bool)

(assert (=> b!530244 m!510793))

(declare-fun m!510795 () Bool)

(assert (=> b!530244 m!510795))

(declare-fun m!510797 () Bool)

(assert (=> b!530244 m!510797))

(declare-fun m!510799 () Bool)

(assert (=> b!530244 m!510799))

(assert (=> b!530244 m!510797))

(declare-fun m!510801 () Bool)

(assert (=> b!530244 m!510801))

(assert (=> b!530244 m!510797))

(declare-fun m!510803 () Bool)

(assert (=> b!530244 m!510803))

(declare-fun m!510805 () Bool)

(assert (=> b!530244 m!510805))

(declare-fun m!510807 () Bool)

(assert (=> b!530243 m!510807))

(declare-fun m!510809 () Bool)

(assert (=> b!530242 m!510809))

(declare-fun m!510811 () Bool)

(assert (=> b!530237 m!510811))

(declare-fun m!510813 () Bool)

(assert (=> start!48138 m!510813))

(declare-fun m!510815 () Bool)

(assert (=> start!48138 m!510815))

(declare-fun m!510817 () Bool)

(assert (=> b!530236 m!510817))

(assert (=> b!530239 m!510797))

(assert (=> b!530239 m!510797))

(declare-fun m!510819 () Bool)

(assert (=> b!530239 m!510819))

(declare-fun m!510821 () Bool)

(assert (=> b!530245 m!510821))

(assert (=> b!530240 m!510797))

(assert (=> b!530240 m!510797))

(declare-fun m!510823 () Bool)

(assert (=> b!530240 m!510823))

(declare-fun m!510825 () Bool)

(assert (=> b!530238 m!510825))

(push 1)

