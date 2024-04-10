; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33290 () Bool)

(assert start!33290)

(declare-fun b!331016 () Bool)

(declare-fun res!182418 () Bool)

(declare-fun e!203122 () Bool)

(assert (=> b!331016 (=> (not res!182418) (not e!203122))))

(declare-datatypes ((array!16898 0))(
  ( (array!16899 (arr!7990 (Array (_ BitVec 32) (_ BitVec 64))) (size!8342 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16898)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!331016 (= res!182418 (and (= (select (arr!7990 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8342 a!3305))))))

(declare-fun b!331017 () Bool)

(declare-fun res!182422 () Bool)

(declare-fun e!203121 () Bool)

(assert (=> b!331017 (=> (not res!182422) (not e!203121))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3121 0))(
  ( (MissingZero!3121 (index!14660 (_ BitVec 32))) (Found!3121 (index!14661 (_ BitVec 32))) (Intermediate!3121 (undefined!3933 Bool) (index!14662 (_ BitVec 32)) (x!32945 (_ BitVec 32))) (Undefined!3121) (MissingVacant!3121 (index!14663 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16898 (_ BitVec 32)) SeekEntryResult!3121)

(assert (=> b!331017 (= res!182422 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3121 i!1250)))))

(declare-fun b!331018 () Bool)

(declare-fun res!182425 () Bool)

(assert (=> b!331018 (=> (not res!182425) (not e!203121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16898 (_ BitVec 32)) Bool)

(assert (=> b!331018 (= res!182425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331019 () Bool)

(declare-fun res!182420 () Bool)

(assert (=> b!331019 (=> (not res!182420) (not e!203121))))

(assert (=> b!331019 (= res!182420 (and (= (size!8342 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8342 a!3305))))))

(declare-fun res!182421 () Bool)

(assert (=> start!33290 (=> (not res!182421) (not e!203121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33290 (= res!182421 (validMask!0 mask!3777))))

(assert (=> start!33290 e!203121))

(declare-fun array_inv!5953 (array!16898) Bool)

(assert (=> start!33290 (array_inv!5953 a!3305)))

(assert (=> start!33290 true))

(declare-fun b!331020 () Bool)

(declare-fun res!182426 () Bool)

(assert (=> b!331020 (=> (not res!182426) (not e!203122))))

(assert (=> b!331020 (= res!182426 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7990 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!331021 () Bool)

(declare-fun res!182423 () Bool)

(assert (=> b!331021 (=> (not res!182423) (not e!203121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331021 (= res!182423 (validKeyInArray!0 k!2497))))

(declare-fun b!331022 () Bool)

(assert (=> b!331022 (= e!203121 e!203122)))

(declare-fun res!182427 () Bool)

(assert (=> b!331022 (=> (not res!182427) (not e!203122))))

(declare-fun lt!158697 () SeekEntryResult!3121)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16898 (_ BitVec 32)) SeekEntryResult!3121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331022 (= res!182427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158697))))

(assert (=> b!331022 (= lt!158697 (Intermediate!3121 false resIndex!58 resX!58))))

(declare-fun b!331023 () Bool)

(assert (=> b!331023 (= e!203122 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1490)) (bvsub #b01111111111111111111111111111110 x!1490)))))

(declare-fun lt!158696 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331023 (= lt!158696 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!331024 () Bool)

(declare-fun res!182419 () Bool)

(assert (=> b!331024 (=> (not res!182419) (not e!203122))))

(assert (=> b!331024 (= res!182419 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158697))))

(declare-fun b!331025 () Bool)

(declare-fun res!182424 () Bool)

(assert (=> b!331025 (=> (not res!182424) (not e!203121))))

(declare-fun arrayContainsKey!0 (array!16898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331025 (= res!182424 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33290 res!182421) b!331019))

(assert (= (and b!331019 res!182420) b!331021))

(assert (= (and b!331021 res!182423) b!331025))

(assert (= (and b!331025 res!182424) b!331017))

(assert (= (and b!331017 res!182422) b!331018))

(assert (= (and b!331018 res!182425) b!331022))

(assert (= (and b!331022 res!182427) b!331016))

(assert (= (and b!331016 res!182418) b!331024))

(assert (= (and b!331024 res!182419) b!331020))

(assert (= (and b!331020 res!182426) b!331023))

(declare-fun m!336029 () Bool)

(assert (=> b!331025 m!336029))

(declare-fun m!336031 () Bool)

(assert (=> b!331018 m!336031))

(declare-fun m!336033 () Bool)

(assert (=> start!33290 m!336033))

(declare-fun m!336035 () Bool)

(assert (=> start!33290 m!336035))

(declare-fun m!336037 () Bool)

(assert (=> b!331021 m!336037))

(declare-fun m!336039 () Bool)

(assert (=> b!331017 m!336039))

(declare-fun m!336041 () Bool)

(assert (=> b!331016 m!336041))

(declare-fun m!336043 () Bool)

(assert (=> b!331024 m!336043))

(declare-fun m!336045 () Bool)

(assert (=> b!331023 m!336045))

(declare-fun m!336047 () Bool)

(assert (=> b!331022 m!336047))

(assert (=> b!331022 m!336047))

(declare-fun m!336049 () Bool)

(assert (=> b!331022 m!336049))

(declare-fun m!336051 () Bool)

(assert (=> b!331020 m!336051))

(push 1)

(assert (not b!331025))

(assert (not b!331017))

(assert (not b!331023))

(assert (not b!331021))

(assert (not b!331022))

(assert (not b!331024))

(assert (not start!33290))

(assert (not b!331018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

