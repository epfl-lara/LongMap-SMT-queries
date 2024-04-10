; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46194 () Bool)

(assert start!46194)

(declare-fun b!511400 () Bool)

(declare-fun res!312065 () Bool)

(declare-fun e!298849 () Bool)

(assert (=> b!511400 (=> (not res!312065) (not e!298849))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32848 0))(
  ( (array!32849 (arr!15801 (Array (_ BitVec 32) (_ BitVec 64))) (size!16165 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32848)

(assert (=> b!511400 (= res!312065 (and (= (size!16165 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16165 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16165 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511401 () Bool)

(declare-fun e!298850 () Bool)

(assert (=> b!511401 (= e!298850 true)))

(declare-datatypes ((SeekEntryResult!4268 0))(
  ( (MissingZero!4268 (index!19260 (_ BitVec 32))) (Found!4268 (index!19261 (_ BitVec 32))) (Intermediate!4268 (undefined!5080 Bool) (index!19262 (_ BitVec 32)) (x!48219 (_ BitVec 32))) (Undefined!4268) (MissingVacant!4268 (index!19263 (_ BitVec 32))) )
))
(declare-fun lt!233958 () SeekEntryResult!4268)

(assert (=> b!511401 (= lt!233958 Undefined!4268)))

(declare-fun b!511403 () Bool)

(declare-fun e!298851 () Bool)

(assert (=> b!511403 (= e!298849 e!298851)))

(declare-fun res!312062 () Bool)

(assert (=> b!511403 (=> (not res!312062) (not e!298851))))

(declare-fun lt!233962 () SeekEntryResult!4268)

(assert (=> b!511403 (= res!312062 (or (= lt!233962 (MissingZero!4268 i!1204)) (= lt!233962 (MissingVacant!4268 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32848 (_ BitVec 32)) SeekEntryResult!4268)

(assert (=> b!511403 (= lt!233962 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511404 () Bool)

(declare-fun res!312070 () Bool)

(assert (=> b!511404 (=> (not res!312070) (not e!298851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32848 (_ BitVec 32)) Bool)

(assert (=> b!511404 (= res!312070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511405 () Bool)

(declare-fun res!312071 () Bool)

(assert (=> b!511405 (=> (not res!312071) (not e!298849))))

(declare-fun arrayContainsKey!0 (array!32848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511405 (= res!312071 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312068 () Bool)

(assert (=> start!46194 (=> (not res!312068) (not e!298849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46194 (= res!312068 (validMask!0 mask!3524))))

(assert (=> start!46194 e!298849))

(assert (=> start!46194 true))

(declare-fun array_inv!11597 (array!32848) Bool)

(assert (=> start!46194 (array_inv!11597 a!3235)))

(declare-fun b!511402 () Bool)

(declare-fun res!312067 () Bool)

(assert (=> b!511402 (=> (not res!312067) (not e!298851))))

(declare-datatypes ((List!9959 0))(
  ( (Nil!9956) (Cons!9955 (h!10835 (_ BitVec 64)) (t!16187 List!9959)) )
))
(declare-fun arrayNoDuplicates!0 (array!32848 (_ BitVec 32) List!9959) Bool)

(assert (=> b!511402 (= res!312067 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9956))))

(declare-fun b!511406 () Bool)

(declare-fun res!312064 () Bool)

(assert (=> b!511406 (=> res!312064 e!298850)))

(declare-fun lt!233957 () SeekEntryResult!4268)

(assert (=> b!511406 (= res!312064 (or (not (is-Intermediate!4268 lt!233957)) (not (undefined!5080 lt!233957))))))

(declare-fun b!511407 () Bool)

(declare-fun res!312063 () Bool)

(assert (=> b!511407 (=> (not res!312063) (not e!298849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511407 (= res!312063 (validKeyInArray!0 k!2280))))

(declare-fun b!511408 () Bool)

(declare-fun res!312069 () Bool)

(assert (=> b!511408 (=> (not res!312069) (not e!298849))))

(assert (=> b!511408 (= res!312069 (validKeyInArray!0 (select (arr!15801 a!3235) j!176)))))

(declare-fun b!511409 () Bool)

(assert (=> b!511409 (= e!298851 (not e!298850))))

(declare-fun res!312066 () Bool)

(assert (=> b!511409 (=> res!312066 e!298850)))

(declare-fun lt!233960 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32848 (_ BitVec 32)) SeekEntryResult!4268)

(assert (=> b!511409 (= res!312066 (= lt!233957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233960 (select (store (arr!15801 a!3235) i!1204 k!2280) j!176) (array!32849 (store (arr!15801 a!3235) i!1204 k!2280) (size!16165 a!3235)) mask!3524)))))

(declare-fun lt!233959 () (_ BitVec 32))

(assert (=> b!511409 (= lt!233957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233959 (select (arr!15801 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511409 (= lt!233960 (toIndex!0 (select (store (arr!15801 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511409 (= lt!233959 (toIndex!0 (select (arr!15801 a!3235) j!176) mask!3524))))

(assert (=> b!511409 (= lt!233958 (Found!4268 j!176))))

(assert (=> b!511409 (= lt!233958 (seekEntryOrOpen!0 (select (arr!15801 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511409 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15794 0))(
  ( (Unit!15795) )
))
(declare-fun lt!233961 () Unit!15794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15794)

(assert (=> b!511409 (= lt!233961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46194 res!312068) b!511400))

(assert (= (and b!511400 res!312065) b!511408))

(assert (= (and b!511408 res!312069) b!511407))

(assert (= (and b!511407 res!312063) b!511405))

(assert (= (and b!511405 res!312071) b!511403))

(assert (= (and b!511403 res!312062) b!511404))

(assert (= (and b!511404 res!312070) b!511402))

(assert (= (and b!511402 res!312067) b!511409))

(assert (= (and b!511409 (not res!312066)) b!511406))

(assert (= (and b!511406 (not res!312064)) b!511401))

(declare-fun m!492849 () Bool)

(assert (=> b!511405 m!492849))

(declare-fun m!492851 () Bool)

(assert (=> b!511403 m!492851))

(declare-fun m!492853 () Bool)

(assert (=> b!511409 m!492853))

(declare-fun m!492855 () Bool)

(assert (=> b!511409 m!492855))

(declare-fun m!492857 () Bool)

(assert (=> b!511409 m!492857))

(declare-fun m!492859 () Bool)

(assert (=> b!511409 m!492859))

(declare-fun m!492861 () Bool)

(assert (=> b!511409 m!492861))

(assert (=> b!511409 m!492859))

(declare-fun m!492863 () Bool)

(assert (=> b!511409 m!492863))

(assert (=> b!511409 m!492859))

(declare-fun m!492865 () Bool)

(assert (=> b!511409 m!492865))

(assert (=> b!511409 m!492857))

(declare-fun m!492867 () Bool)

(assert (=> b!511409 m!492867))

(assert (=> b!511409 m!492859))

(declare-fun m!492869 () Bool)

(assert (=> b!511409 m!492869))

(assert (=> b!511409 m!492857))

(declare-fun m!492871 () Bool)

(assert (=> b!511409 m!492871))

(declare-fun m!492873 () Bool)

(assert (=> b!511404 m!492873))

(declare-fun m!492875 () Bool)

(assert (=> b!511407 m!492875))

(declare-fun m!492877 () Bool)

(assert (=> b!511402 m!492877))

(assert (=> b!511408 m!492859))

(assert (=> b!511408 m!492859))

(declare-fun m!492879 () Bool)

(assert (=> b!511408 m!492879))

(declare-fun m!492881 () Bool)

(assert (=> start!46194 m!492881))

(declare-fun m!492883 () Bool)

(assert (=> start!46194 m!492883))

(push 1)

