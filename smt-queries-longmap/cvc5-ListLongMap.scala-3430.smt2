; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47700 () Bool)

(assert start!47700)

(declare-fun b!524491 () Bool)

(declare-fun res!321395 () Bool)

(declare-fun e!305885 () Bool)

(assert (=> b!524491 (=> (not res!321395) (not e!305885))))

(declare-datatypes ((array!33337 0))(
  ( (array!33338 (arr!16020 (Array (_ BitVec 32) (_ BitVec 64))) (size!16384 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33337)

(declare-datatypes ((List!10178 0))(
  ( (Nil!10175) (Cons!10174 (h!11105 (_ BitVec 64)) (t!16406 List!10178)) )
))
(declare-fun arrayNoDuplicates!0 (array!33337 (_ BitVec 32) List!10178) Bool)

(assert (=> b!524491 (= res!321395 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10175))))

(declare-fun b!524492 () Bool)

(declare-fun e!305883 () Bool)

(assert (=> b!524492 (= e!305883 true)))

(declare-datatypes ((SeekEntryResult!4487 0))(
  ( (MissingZero!4487 (index!20160 (_ BitVec 32))) (Found!4487 (index!20161 (_ BitVec 32))) (Intermediate!4487 (undefined!5299 Bool) (index!20162 (_ BitVec 32)) (x!49148 (_ BitVec 32))) (Undefined!4487) (MissingVacant!4487 (index!20163 (_ BitVec 32))) )
))
(declare-fun lt!240723 () SeekEntryResult!4487)

(assert (=> b!524492 (and (or (= (select (arr!16020 a!3235) (index!20162 lt!240723)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16020 a!3235) (index!20162 lt!240723)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16020 a!3235) (index!20162 lt!240723)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16020 a!3235) (index!20162 lt!240723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16400 0))(
  ( (Unit!16401) )
))
(declare-fun lt!240729 () Unit!16400)

(declare-fun e!305881 () Unit!16400)

(assert (=> b!524492 (= lt!240729 e!305881)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61856 () Bool)

(assert (=> b!524492 (= c!61856 (= (select (arr!16020 a!3235) (index!20162 lt!240723)) (select (arr!16020 a!3235) j!176)))))

(assert (=> b!524492 (and (bvslt (x!49148 lt!240723) #b01111111111111111111111111111110) (or (= (select (arr!16020 a!3235) (index!20162 lt!240723)) (select (arr!16020 a!3235) j!176)) (= (select (arr!16020 a!3235) (index!20162 lt!240723)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16020 a!3235) (index!20162 lt!240723)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524493 () Bool)

(declare-fun res!321396 () Bool)

(assert (=> b!524493 (=> (not res!321396) (not e!305885))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33337 (_ BitVec 32)) Bool)

(assert (=> b!524493 (= res!321396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!321391 () Bool)

(declare-fun e!305886 () Bool)

(assert (=> start!47700 (=> (not res!321391) (not e!305886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47700 (= res!321391 (validMask!0 mask!3524))))

(assert (=> start!47700 e!305886))

(assert (=> start!47700 true))

(declare-fun array_inv!11816 (array!33337) Bool)

(assert (=> start!47700 (array_inv!11816 a!3235)))

(declare-fun b!524494 () Bool)

(declare-fun res!321397 () Bool)

(assert (=> b!524494 (=> (not res!321397) (not e!305886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524494 (= res!321397 (validKeyInArray!0 (select (arr!16020 a!3235) j!176)))))

(declare-fun b!524495 () Bool)

(declare-fun res!321390 () Bool)

(assert (=> b!524495 (=> (not res!321390) (not e!305886))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!524495 (= res!321390 (validKeyInArray!0 k!2280))))

(declare-fun b!524496 () Bool)

(assert (=> b!524496 (= e!305886 e!305885)))

(declare-fun res!321400 () Bool)

(assert (=> b!524496 (=> (not res!321400) (not e!305885))))

(declare-fun lt!240724 () SeekEntryResult!4487)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524496 (= res!321400 (or (= lt!240724 (MissingZero!4487 i!1204)) (= lt!240724 (MissingVacant!4487 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33337 (_ BitVec 32)) SeekEntryResult!4487)

(assert (=> b!524496 (= lt!240724 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524497 () Bool)

(declare-fun Unit!16402 () Unit!16400)

(assert (=> b!524497 (= e!305881 Unit!16402)))

(declare-fun lt!240726 () Unit!16400)

(declare-fun lt!240728 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16400)

(assert (=> b!524497 (= lt!240726 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240728 #b00000000000000000000000000000000 (index!20162 lt!240723) (x!49148 lt!240723) mask!3524))))

(declare-fun lt!240727 () (_ BitVec 64))

(declare-fun lt!240730 () array!33337)

(declare-fun res!321401 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33337 (_ BitVec 32)) SeekEntryResult!4487)

(assert (=> b!524497 (= res!321401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240728 lt!240727 lt!240730 mask!3524) (Intermediate!4487 false (index!20162 lt!240723) (x!49148 lt!240723))))))

(declare-fun e!305884 () Bool)

(assert (=> b!524497 (=> (not res!321401) (not e!305884))))

(assert (=> b!524497 e!305884))

(declare-fun b!524498 () Bool)

(assert (=> b!524498 (= e!305885 (not e!305883))))

(declare-fun res!321393 () Bool)

(assert (=> b!524498 (=> res!321393 e!305883)))

(declare-fun lt!240722 () (_ BitVec 32))

(assert (=> b!524498 (= res!321393 (= lt!240723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240722 lt!240727 lt!240730 mask!3524)))))

(assert (=> b!524498 (= lt!240723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240728 (select (arr!16020 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524498 (= lt!240722 (toIndex!0 lt!240727 mask!3524))))

(assert (=> b!524498 (= lt!240727 (select (store (arr!16020 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524498 (= lt!240728 (toIndex!0 (select (arr!16020 a!3235) j!176) mask!3524))))

(assert (=> b!524498 (= lt!240730 (array!33338 (store (arr!16020 a!3235) i!1204 k!2280) (size!16384 a!3235)))))

(declare-fun e!305880 () Bool)

(assert (=> b!524498 e!305880))

(declare-fun res!321398 () Bool)

(assert (=> b!524498 (=> (not res!321398) (not e!305880))))

(assert (=> b!524498 (= res!321398 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240725 () Unit!16400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16400)

(assert (=> b!524498 (= lt!240725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524499 () Bool)

(declare-fun Unit!16403 () Unit!16400)

(assert (=> b!524499 (= e!305881 Unit!16403)))

(declare-fun b!524500 () Bool)

(assert (=> b!524500 (= e!305880 (= (seekEntryOrOpen!0 (select (arr!16020 a!3235) j!176) a!3235 mask!3524) (Found!4487 j!176)))))

(declare-fun b!524501 () Bool)

(declare-fun res!321392 () Bool)

(assert (=> b!524501 (=> res!321392 e!305883)))

(assert (=> b!524501 (= res!321392 (or (undefined!5299 lt!240723) (not (is-Intermediate!4487 lt!240723))))))

(declare-fun b!524502 () Bool)

(declare-fun res!321399 () Bool)

(assert (=> b!524502 (=> (not res!321399) (not e!305886))))

(assert (=> b!524502 (= res!321399 (and (= (size!16384 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16384 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16384 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524503 () Bool)

(declare-fun res!321394 () Bool)

(assert (=> b!524503 (=> (not res!321394) (not e!305886))))

(declare-fun arrayContainsKey!0 (array!33337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524503 (= res!321394 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524504 () Bool)

(assert (=> b!524504 (= e!305884 false)))

(assert (= (and start!47700 res!321391) b!524502))

(assert (= (and b!524502 res!321399) b!524494))

(assert (= (and b!524494 res!321397) b!524495))

(assert (= (and b!524495 res!321390) b!524503))

(assert (= (and b!524503 res!321394) b!524496))

(assert (= (and b!524496 res!321400) b!524493))

(assert (= (and b!524493 res!321396) b!524491))

(assert (= (and b!524491 res!321395) b!524498))

(assert (= (and b!524498 res!321398) b!524500))

(assert (= (and b!524498 (not res!321393)) b!524501))

(assert (= (and b!524501 (not res!321392)) b!524492))

(assert (= (and b!524492 c!61856) b!524497))

(assert (= (and b!524492 (not c!61856)) b!524499))

(assert (= (and b!524497 res!321401) b!524504))

(declare-fun m!505125 () Bool)

(assert (=> start!47700 m!505125))

(declare-fun m!505127 () Bool)

(assert (=> start!47700 m!505127))

(declare-fun m!505129 () Bool)

(assert (=> b!524495 m!505129))

(declare-fun m!505131 () Bool)

(assert (=> b!524492 m!505131))

(declare-fun m!505133 () Bool)

(assert (=> b!524492 m!505133))

(declare-fun m!505135 () Bool)

(assert (=> b!524498 m!505135))

(declare-fun m!505137 () Bool)

(assert (=> b!524498 m!505137))

(declare-fun m!505139 () Bool)

(assert (=> b!524498 m!505139))

(declare-fun m!505141 () Bool)

(assert (=> b!524498 m!505141))

(assert (=> b!524498 m!505133))

(declare-fun m!505143 () Bool)

(assert (=> b!524498 m!505143))

(assert (=> b!524498 m!505133))

(declare-fun m!505145 () Bool)

(assert (=> b!524498 m!505145))

(assert (=> b!524498 m!505133))

(declare-fun m!505147 () Bool)

(assert (=> b!524498 m!505147))

(declare-fun m!505149 () Bool)

(assert (=> b!524498 m!505149))

(declare-fun m!505151 () Bool)

(assert (=> b!524497 m!505151))

(declare-fun m!505153 () Bool)

(assert (=> b!524497 m!505153))

(declare-fun m!505155 () Bool)

(assert (=> b!524491 m!505155))

(assert (=> b!524500 m!505133))

(assert (=> b!524500 m!505133))

(declare-fun m!505157 () Bool)

(assert (=> b!524500 m!505157))

(declare-fun m!505159 () Bool)

(assert (=> b!524496 m!505159))

(declare-fun m!505161 () Bool)

(assert (=> b!524493 m!505161))

(assert (=> b!524494 m!505133))

(assert (=> b!524494 m!505133))

(declare-fun m!505163 () Bool)

(assert (=> b!524494 m!505163))

(declare-fun m!505165 () Bool)

(assert (=> b!524503 m!505165))

(push 1)

