; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48022 () Bool)

(assert start!48022)

(declare-fun b!528925 () Bool)

(declare-fun e!308224 () Bool)

(declare-fun e!308223 () Bool)

(assert (=> b!528925 (= e!308224 (not e!308223))))

(declare-fun res!324860 () Bool)

(assert (=> b!528925 (=> res!324860 e!308223)))

(declare-datatypes ((SeekEntryResult!4573 0))(
  ( (MissingZero!4573 (index!20516 (_ BitVec 32))) (Found!4573 (index!20517 (_ BitVec 32))) (Intermediate!4573 (undefined!5385 Bool) (index!20518 (_ BitVec 32)) (x!49485 (_ BitVec 32))) (Undefined!4573) (MissingVacant!4573 (index!20519 (_ BitVec 32))) )
))
(declare-fun lt!243722 () SeekEntryResult!4573)

(declare-fun lt!243716 () SeekEntryResult!4573)

(assert (=> b!528925 (= res!324860 (or (= lt!243722 lt!243716) (undefined!5385 lt!243722) (not (is-Intermediate!4573 lt!243722))))))

(declare-fun lt!243718 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!243721 () (_ BitVec 64))

(declare-datatypes ((array!33515 0))(
  ( (array!33516 (arr!16106 (Array (_ BitVec 32) (_ BitVec 64))) (size!16470 (_ BitVec 32))) )
))
(declare-fun lt!243725 () array!33515)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33515 (_ BitVec 32)) SeekEntryResult!4573)

(assert (=> b!528925 (= lt!243716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243718 lt!243721 lt!243725 mask!3524))))

(declare-fun lt!243723 () (_ BitVec 32))

(declare-fun a!3235 () array!33515)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!528925 (= lt!243722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243723 (select (arr!16106 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528925 (= lt!243718 (toIndex!0 lt!243721 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!528925 (= lt!243721 (select (store (arr!16106 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528925 (= lt!243723 (toIndex!0 (select (arr!16106 a!3235) j!176) mask!3524))))

(assert (=> b!528925 (= lt!243725 (array!33516 (store (arr!16106 a!3235) i!1204 k!2280) (size!16470 a!3235)))))

(declare-fun lt!243720 () SeekEntryResult!4573)

(assert (=> b!528925 (= lt!243720 (Found!4573 j!176))))

(declare-fun e!308221 () Bool)

(assert (=> b!528925 e!308221))

(declare-fun res!324859 () Bool)

(assert (=> b!528925 (=> (not res!324859) (not e!308221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33515 (_ BitVec 32)) Bool)

(assert (=> b!528925 (= res!324859 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16744 0))(
  ( (Unit!16745) )
))
(declare-fun lt!243717 () Unit!16744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16744)

(assert (=> b!528925 (= lt!243717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528926 () Bool)

(declare-fun e!308228 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33515 (_ BitVec 32)) SeekEntryResult!4573)

(assert (=> b!528926 (= e!308228 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243723 (index!20518 lt!243722) (select (arr!16106 a!3235) j!176) a!3235 mask!3524) lt!243720)))))

(declare-fun b!528927 () Bool)

(declare-fun res!324856 () Bool)

(declare-fun e!308225 () Bool)

(assert (=> b!528927 (=> (not res!324856) (not e!308225))))

(declare-fun arrayContainsKey!0 (array!33515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528927 (= res!324856 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528928 () Bool)

(declare-fun res!324862 () Bool)

(declare-fun e!308229 () Bool)

(assert (=> b!528928 (=> res!324862 e!308229)))

(assert (=> b!528928 (= res!324862 e!308228)))

(declare-fun res!324855 () Bool)

(assert (=> b!528928 (=> (not res!324855) (not e!308228))))

(assert (=> b!528928 (= res!324855 (bvsgt #b00000000000000000000000000000000 (x!49485 lt!243722)))))

(declare-fun res!324866 () Bool)

(assert (=> start!48022 (=> (not res!324866) (not e!308225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48022 (= res!324866 (validMask!0 mask!3524))))

(assert (=> start!48022 e!308225))

(assert (=> start!48022 true))

(declare-fun array_inv!11902 (array!33515) Bool)

(assert (=> start!48022 (array_inv!11902 a!3235)))

(declare-fun b!528929 () Bool)

(assert (=> b!528929 (= e!308229 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33515 (_ BitVec 32)) SeekEntryResult!4573)

(assert (=> b!528929 (= (seekEntryOrOpen!0 lt!243721 lt!243725 mask!3524) lt!243720)))

(declare-fun lt!243719 () Unit!16744)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16744)

(assert (=> b!528929 (= lt!243719 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243723 #b00000000000000000000000000000000 (index!20518 lt!243722) (x!49485 lt!243722) mask!3524))))

(declare-fun b!528930 () Bool)

(declare-fun res!324861 () Bool)

(assert (=> b!528930 (=> (not res!324861) (not e!308224))))

(assert (=> b!528930 (= res!324861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528931 () Bool)

(declare-fun res!324864 () Bool)

(assert (=> b!528931 (=> (not res!324864) (not e!308225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528931 (= res!324864 (validKeyInArray!0 k!2280))))

(declare-fun b!528932 () Bool)

(declare-fun res!324865 () Bool)

(assert (=> b!528932 (=> (not res!324865) (not e!308224))))

(declare-datatypes ((List!10264 0))(
  ( (Nil!10261) (Cons!10260 (h!11197 (_ BitVec 64)) (t!16492 List!10264)) )
))
(declare-fun arrayNoDuplicates!0 (array!33515 (_ BitVec 32) List!10264) Bool)

(assert (=> b!528932 (= res!324865 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10261))))

(declare-fun b!528933 () Bool)

(declare-fun res!324857 () Bool)

(assert (=> b!528933 (=> (not res!324857) (not e!308225))))

(assert (=> b!528933 (= res!324857 (and (= (size!16470 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16470 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16470 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528934 () Bool)

(declare-fun res!324858 () Bool)

(assert (=> b!528934 (=> (not res!324858) (not e!308225))))

(assert (=> b!528934 (= res!324858 (validKeyInArray!0 (select (arr!16106 a!3235) j!176)))))

(declare-fun b!528935 () Bool)

(assert (=> b!528935 (= e!308221 (= (seekEntryOrOpen!0 (select (arr!16106 a!3235) j!176) a!3235 mask!3524) (Found!4573 j!176)))))

(declare-fun b!528936 () Bool)

(declare-fun e!308227 () Unit!16744)

(declare-fun Unit!16746 () Unit!16744)

(assert (=> b!528936 (= e!308227 Unit!16746)))

(declare-fun lt!243724 () Unit!16744)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16744)

(assert (=> b!528936 (= lt!243724 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243723 #b00000000000000000000000000000000 (index!20518 lt!243722) (x!49485 lt!243722) mask!3524))))

(declare-fun res!324853 () Bool)

(assert (=> b!528936 (= res!324853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243723 lt!243721 lt!243725 mask!3524) (Intermediate!4573 false (index!20518 lt!243722) (x!49485 lt!243722))))))

(declare-fun e!308222 () Bool)

(assert (=> b!528936 (=> (not res!324853) (not e!308222))))

(assert (=> b!528936 e!308222))

(declare-fun b!528937 () Bool)

(declare-fun res!324852 () Bool)

(assert (=> b!528937 (=> res!324852 e!308229)))

(assert (=> b!528937 (= res!324852 (not (= lt!243716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243723 lt!243721 lt!243725 mask!3524))))))

(declare-fun b!528938 () Bool)

(assert (=> b!528938 (= e!308225 e!308224)))

(declare-fun res!324863 () Bool)

(assert (=> b!528938 (=> (not res!324863) (not e!308224))))

(declare-fun lt!243727 () SeekEntryResult!4573)

(assert (=> b!528938 (= res!324863 (or (= lt!243727 (MissingZero!4573 i!1204)) (= lt!243727 (MissingVacant!4573 i!1204))))))

(assert (=> b!528938 (= lt!243727 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528939 () Bool)

(assert (=> b!528939 (= e!308223 e!308229)))

(declare-fun res!324854 () Bool)

(assert (=> b!528939 (=> res!324854 e!308229)))

(assert (=> b!528939 (= res!324854 (or (bvsgt (x!49485 lt!243722) #b01111111111111111111111111111110) (bvslt lt!243723 #b00000000000000000000000000000000) (bvsge lt!243723 (size!16470 a!3235)) (bvslt (index!20518 lt!243722) #b00000000000000000000000000000000) (bvsge (index!20518 lt!243722) (size!16470 a!3235)) (not (= lt!243722 (Intermediate!4573 false (index!20518 lt!243722) (x!49485 lt!243722))))))))

(assert (=> b!528939 (= (index!20518 lt!243722) i!1204)))

(declare-fun lt!243726 () Unit!16744)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16744)

(assert (=> b!528939 (= lt!243726 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243723 #b00000000000000000000000000000000 (index!20518 lt!243722) (x!49485 lt!243722) mask!3524))))

(assert (=> b!528939 (and (or (= (select (arr!16106 a!3235) (index!20518 lt!243722)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16106 a!3235) (index!20518 lt!243722)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16106 a!3235) (index!20518 lt!243722)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16106 a!3235) (index!20518 lt!243722)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243715 () Unit!16744)

(assert (=> b!528939 (= lt!243715 e!308227)))

(declare-fun c!62345 () Bool)

(assert (=> b!528939 (= c!62345 (= (select (arr!16106 a!3235) (index!20518 lt!243722)) (select (arr!16106 a!3235) j!176)))))

(assert (=> b!528939 (and (bvslt (x!49485 lt!243722) #b01111111111111111111111111111110) (or (= (select (arr!16106 a!3235) (index!20518 lt!243722)) (select (arr!16106 a!3235) j!176)) (= (select (arr!16106 a!3235) (index!20518 lt!243722)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16106 a!3235) (index!20518 lt!243722)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528940 () Bool)

(declare-fun Unit!16747 () Unit!16744)

(assert (=> b!528940 (= e!308227 Unit!16747)))

(declare-fun b!528941 () Bool)

(assert (=> b!528941 (= e!308222 false)))

(assert (= (and start!48022 res!324866) b!528933))

(assert (= (and b!528933 res!324857) b!528934))

(assert (= (and b!528934 res!324858) b!528931))

(assert (= (and b!528931 res!324864) b!528927))

(assert (= (and b!528927 res!324856) b!528938))

(assert (= (and b!528938 res!324863) b!528930))

(assert (= (and b!528930 res!324861) b!528932))

(assert (= (and b!528932 res!324865) b!528925))

(assert (= (and b!528925 res!324859) b!528935))

(assert (= (and b!528925 (not res!324860)) b!528939))

(assert (= (and b!528939 c!62345) b!528936))

(assert (= (and b!528939 (not c!62345)) b!528940))

(assert (= (and b!528936 res!324853) b!528941))

(assert (= (and b!528939 (not res!324854)) b!528928))

(assert (= (and b!528928 res!324855) b!528926))

(assert (= (and b!528928 (not res!324862)) b!528937))

(assert (= (and b!528937 (not res!324852)) b!528929))

(declare-fun m!509455 () Bool)

(assert (=> b!528925 m!509455))

(declare-fun m!509457 () Bool)

(assert (=> b!528925 m!509457))

(declare-fun m!509459 () Bool)

(assert (=> b!528925 m!509459))

(declare-fun m!509461 () Bool)

(assert (=> b!528925 m!509461))

(declare-fun m!509463 () Bool)

(assert (=> b!528925 m!509463))

(assert (=> b!528925 m!509461))

(declare-fun m!509465 () Bool)

(assert (=> b!528925 m!509465))

(assert (=> b!528925 m!509461))

(declare-fun m!509467 () Bool)

(assert (=> b!528925 m!509467))

(declare-fun m!509469 () Bool)

(assert (=> b!528925 m!509469))

(declare-fun m!509471 () Bool)

(assert (=> b!528925 m!509471))

(declare-fun m!509473 () Bool)

(assert (=> b!528927 m!509473))

(declare-fun m!509475 () Bool)

(assert (=> b!528930 m!509475))

(declare-fun m!509477 () Bool)

(assert (=> b!528938 m!509477))

(declare-fun m!509479 () Bool)

(assert (=> b!528936 m!509479))

(declare-fun m!509481 () Bool)

(assert (=> b!528936 m!509481))

(assert (=> b!528937 m!509481))

(assert (=> b!528926 m!509461))

(assert (=> b!528926 m!509461))

(declare-fun m!509483 () Bool)

(assert (=> b!528926 m!509483))

(declare-fun m!509485 () Bool)

(assert (=> b!528939 m!509485))

(declare-fun m!509487 () Bool)

(assert (=> b!528939 m!509487))

(assert (=> b!528939 m!509461))

(declare-fun m!509489 () Bool)

(assert (=> b!528932 m!509489))

(assert (=> b!528935 m!509461))

(assert (=> b!528935 m!509461))

(declare-fun m!509491 () Bool)

(assert (=> b!528935 m!509491))

(declare-fun m!509493 () Bool)

(assert (=> b!528929 m!509493))

(declare-fun m!509495 () Bool)

(assert (=> b!528929 m!509495))

(declare-fun m!509497 () Bool)

(assert (=> start!48022 m!509497))

(declare-fun m!509499 () Bool)

(assert (=> start!48022 m!509499))

(declare-fun m!509501 () Bool)

(assert (=> b!528931 m!509501))

(assert (=> b!528934 m!509461))

(assert (=> b!528934 m!509461))

(declare-fun m!509503 () Bool)

(assert (=> b!528934 m!509503))

(push 1)

