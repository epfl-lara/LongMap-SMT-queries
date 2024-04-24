; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33006 () Bool)

(assert start!33006)

(declare-fun b!328832 () Bool)

(declare-fun res!181211 () Bool)

(declare-fun e!202059 () Bool)

(assert (=> b!328832 (=> (not res!181211) (not e!202059))))

(declare-datatypes ((array!16825 0))(
  ( (array!16826 (arr!7959 (Array (_ BitVec 32) (_ BitVec 64))) (size!8311 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16825)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328832 (= res!181211 (and (= (select (arr!7959 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8311 a!3305))))))

(declare-fun b!328833 () Bool)

(declare-fun res!181215 () Bool)

(assert (=> b!328833 (=> (not res!181215) (not e!202059))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328833 (= res!181215 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328834 () Bool)

(declare-fun res!181210 () Bool)

(assert (=> b!328834 (=> (not res!181210) (not e!202059))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3055 0))(
  ( (MissingZero!3055 (index!14396 (_ BitVec 32))) (Found!3055 (index!14397 (_ BitVec 32))) (Intermediate!3055 (undefined!3867 Bool) (index!14398 (_ BitVec 32)) (x!32763 (_ BitVec 32))) (Undefined!3055) (MissingVacant!3055 (index!14399 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16825 (_ BitVec 32)) SeekEntryResult!3055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328834 (= res!181210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3055 false resIndex!58 resX!58)))))

(declare-fun b!328835 () Bool)

(declare-fun res!181209 () Bool)

(assert (=> b!328835 (=> (not res!181209) (not e!202059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16825 (_ BitVec 32)) Bool)

(assert (=> b!328835 (= res!181209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328836 () Bool)

(declare-fun res!181208 () Bool)

(assert (=> b!328836 (=> (not res!181208) (not e!202059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328836 (= res!181208 (validKeyInArray!0 k!2497))))

(declare-fun b!328837 () Bool)

(declare-fun res!181213 () Bool)

(assert (=> b!328837 (=> (not res!181213) (not e!202059))))

(assert (=> b!328837 (= res!181213 (and (= (size!8311 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8311 a!3305))))))

(declare-fun res!181214 () Bool)

(assert (=> start!33006 (=> (not res!181214) (not e!202059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33006 (= res!181214 (validMask!0 mask!3777))))

(assert (=> start!33006 e!202059))

(declare-fun array_inv!5909 (array!16825) Bool)

(assert (=> start!33006 (array_inv!5909 a!3305)))

(assert (=> start!33006 true))

(declare-fun b!328838 () Bool)

(declare-fun res!181212 () Bool)

(assert (=> b!328838 (=> (not res!181212) (not e!202059))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16825 (_ BitVec 32)) SeekEntryResult!3055)

(assert (=> b!328838 (= res!181212 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3055 i!1250)))))

(declare-fun b!328839 () Bool)

(assert (=> b!328839 (= e!202059 false)))

(declare-fun lt!158055 () SeekEntryResult!3055)

(assert (=> b!328839 (= lt!158055 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!33006 res!181214) b!328837))

(assert (= (and b!328837 res!181213) b!328836))

(assert (= (and b!328836 res!181208) b!328833))

(assert (= (and b!328833 res!181215) b!328838))

(assert (= (and b!328838 res!181212) b!328835))

(assert (= (and b!328835 res!181209) b!328834))

(assert (= (and b!328834 res!181210) b!328832))

(assert (= (and b!328832 res!181211) b!328839))

(declare-fun m!334925 () Bool)

(assert (=> b!328832 m!334925))

(declare-fun m!334927 () Bool)

(assert (=> b!328836 m!334927))

(declare-fun m!334929 () Bool)

(assert (=> b!328838 m!334929))

(declare-fun m!334931 () Bool)

(assert (=> start!33006 m!334931))

(declare-fun m!334933 () Bool)

(assert (=> start!33006 m!334933))

(declare-fun m!334935 () Bool)

(assert (=> b!328835 m!334935))

(declare-fun m!334937 () Bool)

(assert (=> b!328834 m!334937))

(assert (=> b!328834 m!334937))

(declare-fun m!334939 () Bool)

(assert (=> b!328834 m!334939))

(declare-fun m!334941 () Bool)

(assert (=> b!328833 m!334941))

(declare-fun m!334943 () Bool)

(assert (=> b!328839 m!334943))

(push 1)

(assert (not b!328834))

(assert (not b!328836))

(assert (not b!328835))

(assert (not b!328838))

(assert (not b!328839))

(assert (not start!33006))

(assert (not b!328833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

