; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45046 () Bool)

(assert start!45046)

(declare-fun b!494336 () Bool)

(declare-fun res!296914 () Bool)

(declare-fun e!290145 () Bool)

(assert (=> b!494336 (=> (not res!296914) (not e!290145))))

(declare-datatypes ((array!31991 0))(
  ( (array!31992 (arr!15380 (Array (_ BitVec 32) (_ BitVec 64))) (size!15744 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31991)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31991 (_ BitVec 32)) Bool)

(assert (=> b!494336 (= res!296914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494337 () Bool)

(declare-fun res!296909 () Bool)

(declare-fun e!290143 () Bool)

(assert (=> b!494337 (=> (not res!296909) (not e!290143))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494337 (= res!296909 (validKeyInArray!0 k!2280))))

(declare-fun b!494338 () Bool)

(declare-fun res!296912 () Bool)

(assert (=> b!494338 (=> (not res!296912) (not e!290143))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494338 (= res!296912 (and (= (size!15744 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15744 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15744 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494339 () Bool)

(declare-fun res!296910 () Bool)

(assert (=> b!494339 (=> (not res!296910) (not e!290145))))

(declare-datatypes ((List!9538 0))(
  ( (Nil!9535) (Cons!9534 (h!10402 (_ BitVec 64)) (t!15766 List!9538)) )
))
(declare-fun arrayNoDuplicates!0 (array!31991 (_ BitVec 32) List!9538) Bool)

(assert (=> b!494339 (= res!296910 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9535))))

(declare-fun b!494340 () Bool)

(declare-fun res!296908 () Bool)

(declare-fun e!290142 () Bool)

(assert (=> b!494340 (=> res!296908 e!290142)))

(declare-datatypes ((SeekEntryResult!3847 0))(
  ( (MissingZero!3847 (index!17567 (_ BitVec 32))) (Found!3847 (index!17568 (_ BitVec 32))) (Intermediate!3847 (undefined!4659 Bool) (index!17569 (_ BitVec 32)) (x!46637 (_ BitVec 32))) (Undefined!3847) (MissingVacant!3847 (index!17570 (_ BitVec 32))) )
))
(declare-fun lt!223712 () SeekEntryResult!3847)

(assert (=> b!494340 (= res!296908 (or (not (is-Intermediate!3847 lt!223712)) (not (undefined!4659 lt!223712))))))

(declare-fun b!494341 () Bool)

(assert (=> b!494341 (= e!290142 true)))

(declare-fun lt!223711 () SeekEntryResult!3847)

(assert (=> b!494341 (= lt!223711 Undefined!3847)))

(declare-fun b!494342 () Bool)

(assert (=> b!494342 (= e!290145 (not e!290142))))

(declare-fun res!296906 () Bool)

(assert (=> b!494342 (=> res!296906 e!290142)))

(declare-fun lt!223710 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31991 (_ BitVec 32)) SeekEntryResult!3847)

(assert (=> b!494342 (= res!296906 (= lt!223712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223710 (select (store (arr!15380 a!3235) i!1204 k!2280) j!176) (array!31992 (store (arr!15380 a!3235) i!1204 k!2280) (size!15744 a!3235)) mask!3524)))))

(declare-fun lt!223713 () (_ BitVec 32))

(assert (=> b!494342 (= lt!223712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223713 (select (arr!15380 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494342 (= lt!223710 (toIndex!0 (select (store (arr!15380 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494342 (= lt!223713 (toIndex!0 (select (arr!15380 a!3235) j!176) mask!3524))))

(assert (=> b!494342 (= lt!223711 (Found!3847 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31991 (_ BitVec 32)) SeekEntryResult!3847)

(assert (=> b!494342 (= lt!223711 (seekEntryOrOpen!0 (select (arr!15380 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494342 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14640 0))(
  ( (Unit!14641) )
))
(declare-fun lt!223714 () Unit!14640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14640)

(assert (=> b!494342 (= lt!223714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494343 () Bool)

(assert (=> b!494343 (= e!290143 e!290145)))

(declare-fun res!296913 () Bool)

(assert (=> b!494343 (=> (not res!296913) (not e!290145))))

(declare-fun lt!223709 () SeekEntryResult!3847)

(assert (=> b!494343 (= res!296913 (or (= lt!223709 (MissingZero!3847 i!1204)) (= lt!223709 (MissingVacant!3847 i!1204))))))

(assert (=> b!494343 (= lt!223709 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494344 () Bool)

(declare-fun res!296911 () Bool)

(assert (=> b!494344 (=> (not res!296911) (not e!290143))))

(assert (=> b!494344 (= res!296911 (validKeyInArray!0 (select (arr!15380 a!3235) j!176)))))

(declare-fun b!494345 () Bool)

(declare-fun res!296907 () Bool)

(assert (=> b!494345 (=> (not res!296907) (not e!290143))))

(declare-fun arrayContainsKey!0 (array!31991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494345 (= res!296907 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!296915 () Bool)

(assert (=> start!45046 (=> (not res!296915) (not e!290143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45046 (= res!296915 (validMask!0 mask!3524))))

(assert (=> start!45046 e!290143))

(assert (=> start!45046 true))

(declare-fun array_inv!11176 (array!31991) Bool)

(assert (=> start!45046 (array_inv!11176 a!3235)))

(assert (= (and start!45046 res!296915) b!494338))

(assert (= (and b!494338 res!296912) b!494344))

(assert (= (and b!494344 res!296911) b!494337))

(assert (= (and b!494337 res!296909) b!494345))

(assert (= (and b!494345 res!296907) b!494343))

(assert (= (and b!494343 res!296913) b!494336))

(assert (= (and b!494336 res!296914) b!494339))

(assert (= (and b!494339 res!296910) b!494342))

(assert (= (and b!494342 (not res!296906)) b!494340))

(assert (= (and b!494340 (not res!296908)) b!494341))

(declare-fun m!475359 () Bool)

(assert (=> b!494342 m!475359))

(declare-fun m!475361 () Bool)

(assert (=> b!494342 m!475361))

(declare-fun m!475363 () Bool)

(assert (=> b!494342 m!475363))

(declare-fun m!475365 () Bool)

(assert (=> b!494342 m!475365))

(assert (=> b!494342 m!475359))

(declare-fun m!475367 () Bool)

(assert (=> b!494342 m!475367))

(declare-fun m!475369 () Bool)

(assert (=> b!494342 m!475369))

(assert (=> b!494342 m!475367))

(declare-fun m!475371 () Bool)

(assert (=> b!494342 m!475371))

(assert (=> b!494342 m!475367))

(declare-fun m!475373 () Bool)

(assert (=> b!494342 m!475373))

(assert (=> b!494342 m!475367))

(declare-fun m!475375 () Bool)

(assert (=> b!494342 m!475375))

(assert (=> b!494342 m!475359))

(declare-fun m!475377 () Bool)

(assert (=> b!494342 m!475377))

(declare-fun m!475379 () Bool)

(assert (=> b!494345 m!475379))

(declare-fun m!475381 () Bool)

(assert (=> b!494337 m!475381))

(declare-fun m!475383 () Bool)

(assert (=> b!494339 m!475383))

(declare-fun m!475385 () Bool)

(assert (=> b!494343 m!475385))

(declare-fun m!475387 () Bool)

(assert (=> start!45046 m!475387))

(declare-fun m!475389 () Bool)

(assert (=> start!45046 m!475389))

(assert (=> b!494344 m!475367))

(assert (=> b!494344 m!475367))

(declare-fun m!475391 () Bool)

(assert (=> b!494344 m!475391))

(declare-fun m!475393 () Bool)

(assert (=> b!494336 m!475393))

(push 1)

