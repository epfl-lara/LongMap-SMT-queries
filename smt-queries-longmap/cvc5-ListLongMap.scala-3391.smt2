; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46758 () Bool)

(assert start!46758)

(declare-fun b!516370 () Bool)

(declare-fun res!315939 () Bool)

(declare-fun e!301370 () Bool)

(assert (=> b!516370 (=> res!315939 e!301370)))

(declare-datatypes ((SeekEntryResult!4370 0))(
  ( (MissingZero!4370 (index!19668 (_ BitVec 32))) (Found!4370 (index!19669 (_ BitVec 32))) (Intermediate!4370 (undefined!5182 Bool) (index!19670 (_ BitVec 32)) (x!48629 (_ BitVec 32))) (Undefined!4370) (MissingVacant!4370 (index!19671 (_ BitVec 32))) )
))
(declare-fun lt!236388 () SeekEntryResult!4370)

(assert (=> b!516370 (= res!315939 (or (undefined!5182 lt!236388) (not (is-Intermediate!4370 lt!236388))))))

(declare-fun b!516371 () Bool)

(declare-fun res!315944 () Bool)

(declare-fun e!301372 () Bool)

(assert (=> b!516371 (=> (not res!315944) (not e!301372))))

(declare-datatypes ((array!33070 0))(
  ( (array!33071 (arr!15903 (Array (_ BitVec 32) (_ BitVec 64))) (size!16267 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33070)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33070 (_ BitVec 32)) Bool)

(assert (=> b!516371 (= res!315944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516372 () Bool)

(declare-fun res!315938 () Bool)

(declare-fun e!301371 () Bool)

(assert (=> b!516372 (=> (not res!315938) (not e!301371))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516372 (= res!315938 (validKeyInArray!0 (select (arr!15903 a!3235) j!176)))))

(declare-fun b!516373 () Bool)

(declare-fun res!315942 () Bool)

(assert (=> b!516373 (=> (not res!315942) (not e!301371))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516373 (= res!315942 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516374 () Bool)

(assert (=> b!516374 (= e!301372 (not e!301370))))

(declare-fun res!315937 () Bool)

(assert (=> b!516374 (=> res!315937 e!301370)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236389 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33070 (_ BitVec 32)) SeekEntryResult!4370)

(assert (=> b!516374 (= res!315937 (= lt!236388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236389 (select (store (arr!15903 a!3235) i!1204 k!2280) j!176) (array!33071 (store (arr!15903 a!3235) i!1204 k!2280) (size!16267 a!3235)) mask!3524)))))

(declare-fun lt!236387 () (_ BitVec 32))

(assert (=> b!516374 (= lt!236388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236387 (select (arr!15903 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516374 (= lt!236389 (toIndex!0 (select (store (arr!15903 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516374 (= lt!236387 (toIndex!0 (select (arr!15903 a!3235) j!176) mask!3524))))

(declare-fun e!301373 () Bool)

(assert (=> b!516374 e!301373))

(declare-fun res!315941 () Bool)

(assert (=> b!516374 (=> (not res!315941) (not e!301373))))

(assert (=> b!516374 (= res!315941 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15998 0))(
  ( (Unit!15999) )
))
(declare-fun lt!236385 () Unit!15998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15998)

(assert (=> b!516374 (= lt!236385 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516375 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33070 (_ BitVec 32)) SeekEntryResult!4370)

(assert (=> b!516375 (= e!301373 (= (seekEntryOrOpen!0 (select (arr!15903 a!3235) j!176) a!3235 mask!3524) (Found!4370 j!176)))))

(declare-fun b!516376 () Bool)

(declare-fun res!315934 () Bool)

(assert (=> b!516376 (=> (not res!315934) (not e!301371))))

(assert (=> b!516376 (= res!315934 (validKeyInArray!0 k!2280))))

(declare-fun b!516377 () Bool)

(assert (=> b!516377 (= e!301370 true)))

(assert (=> b!516377 (and (bvslt (x!48629 lt!236388) #b01111111111111111111111111111110) (or (= (select (arr!15903 a!3235) (index!19670 lt!236388)) (select (arr!15903 a!3235) j!176)) (= (select (arr!15903 a!3235) (index!19670 lt!236388)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15903 a!3235) (index!19670 lt!236388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516378 () Bool)

(declare-fun res!315940 () Bool)

(assert (=> b!516378 (=> (not res!315940) (not e!301372))))

(declare-datatypes ((List!10061 0))(
  ( (Nil!10058) (Cons!10057 (h!10955 (_ BitVec 64)) (t!16289 List!10061)) )
))
(declare-fun arrayNoDuplicates!0 (array!33070 (_ BitVec 32) List!10061) Bool)

(assert (=> b!516378 (= res!315940 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10058))))

(declare-fun res!315936 () Bool)

(assert (=> start!46758 (=> (not res!315936) (not e!301371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46758 (= res!315936 (validMask!0 mask!3524))))

(assert (=> start!46758 e!301371))

(assert (=> start!46758 true))

(declare-fun array_inv!11699 (array!33070) Bool)

(assert (=> start!46758 (array_inv!11699 a!3235)))

(declare-fun b!516379 () Bool)

(assert (=> b!516379 (= e!301371 e!301372)))

(declare-fun res!315943 () Bool)

(assert (=> b!516379 (=> (not res!315943) (not e!301372))))

(declare-fun lt!236386 () SeekEntryResult!4370)

(assert (=> b!516379 (= res!315943 (or (= lt!236386 (MissingZero!4370 i!1204)) (= lt!236386 (MissingVacant!4370 i!1204))))))

(assert (=> b!516379 (= lt!236386 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516380 () Bool)

(declare-fun res!315935 () Bool)

(assert (=> b!516380 (=> (not res!315935) (not e!301371))))

(assert (=> b!516380 (= res!315935 (and (= (size!16267 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16267 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16267 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46758 res!315936) b!516380))

(assert (= (and b!516380 res!315935) b!516372))

(assert (= (and b!516372 res!315938) b!516376))

(assert (= (and b!516376 res!315934) b!516373))

(assert (= (and b!516373 res!315942) b!516379))

(assert (= (and b!516379 res!315943) b!516371))

(assert (= (and b!516371 res!315944) b!516378))

(assert (= (and b!516378 res!315940) b!516374))

(assert (= (and b!516374 res!315941) b!516375))

(assert (= (and b!516374 (not res!315937)) b!516370))

(assert (= (and b!516370 (not res!315939)) b!516377))

(declare-fun m!497847 () Bool)

(assert (=> b!516379 m!497847))

(declare-fun m!497849 () Bool)

(assert (=> b!516376 m!497849))

(declare-fun m!497851 () Bool)

(assert (=> b!516371 m!497851))

(declare-fun m!497853 () Bool)

(assert (=> b!516378 m!497853))

(declare-fun m!497855 () Bool)

(assert (=> b!516373 m!497855))

(declare-fun m!497857 () Bool)

(assert (=> b!516375 m!497857))

(assert (=> b!516375 m!497857))

(declare-fun m!497859 () Bool)

(assert (=> b!516375 m!497859))

(declare-fun m!497861 () Bool)

(assert (=> start!46758 m!497861))

(declare-fun m!497863 () Bool)

(assert (=> start!46758 m!497863))

(declare-fun m!497865 () Bool)

(assert (=> b!516377 m!497865))

(assert (=> b!516377 m!497857))

(declare-fun m!497867 () Bool)

(assert (=> b!516374 m!497867))

(declare-fun m!497869 () Bool)

(assert (=> b!516374 m!497869))

(declare-fun m!497871 () Bool)

(assert (=> b!516374 m!497871))

(declare-fun m!497873 () Bool)

(assert (=> b!516374 m!497873))

(assert (=> b!516374 m!497867))

(assert (=> b!516374 m!497857))

(declare-fun m!497875 () Bool)

(assert (=> b!516374 m!497875))

(assert (=> b!516374 m!497857))

(declare-fun m!497877 () Bool)

(assert (=> b!516374 m!497877))

(assert (=> b!516374 m!497857))

(declare-fun m!497879 () Bool)

(assert (=> b!516374 m!497879))

(assert (=> b!516374 m!497867))

(declare-fun m!497881 () Bool)

(assert (=> b!516374 m!497881))

(assert (=> b!516372 m!497857))

(assert (=> b!516372 m!497857))

(declare-fun m!497883 () Bool)

(assert (=> b!516372 m!497883))

(push 1)

