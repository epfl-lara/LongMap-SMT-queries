; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47688 () Bool)

(assert start!47688)

(declare-fun b!524240 () Bool)

(declare-fun e!305758 () Bool)

(declare-fun e!305756 () Bool)

(assert (=> b!524240 (= e!305758 e!305756)))

(declare-fun res!321180 () Bool)

(assert (=> b!524240 (=> (not res!321180) (not e!305756))))

(declare-datatypes ((SeekEntryResult!4481 0))(
  ( (MissingZero!4481 (index!20136 (_ BitVec 32))) (Found!4481 (index!20137 (_ BitVec 32))) (Intermediate!4481 (undefined!5293 Bool) (index!20138 (_ BitVec 32)) (x!49126 (_ BitVec 32))) (Undefined!4481) (MissingVacant!4481 (index!20139 (_ BitVec 32))) )
))
(declare-fun lt!240560 () SeekEntryResult!4481)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524240 (= res!321180 (or (= lt!240560 (MissingZero!4481 i!1204)) (= lt!240560 (MissingVacant!4481 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33325 0))(
  ( (array!33326 (arr!16014 (Array (_ BitVec 32) (_ BitVec 64))) (size!16378 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33325)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33325 (_ BitVec 32)) SeekEntryResult!4481)

(assert (=> b!524240 (= lt!240560 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524241 () Bool)

(declare-fun res!321178 () Bool)

(assert (=> b!524241 (=> (not res!321178) (not e!305756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33325 (_ BitVec 32)) Bool)

(assert (=> b!524241 (= res!321178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524242 () Bool)

(declare-fun res!321175 () Bool)

(declare-fun e!305760 () Bool)

(assert (=> b!524242 (=> res!321175 e!305760)))

(declare-fun lt!240562 () SeekEntryResult!4481)

(assert (=> b!524242 (= res!321175 (or (undefined!5293 lt!240562) (not (is-Intermediate!4481 lt!240562))))))

(declare-fun b!524243 () Bool)

(declare-fun res!321183 () Bool)

(assert (=> b!524243 (=> (not res!321183) (not e!305758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524243 (= res!321183 (validKeyInArray!0 k!2280))))

(declare-fun b!524244 () Bool)

(declare-fun res!321184 () Bool)

(assert (=> b!524244 (=> (not res!321184) (not e!305758))))

(declare-fun arrayContainsKey!0 (array!33325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524244 (= res!321184 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524245 () Bool)

(declare-fun res!321181 () Bool)

(assert (=> b!524245 (=> (not res!321181) (not e!305758))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524245 (= res!321181 (validKeyInArray!0 (select (arr!16014 a!3235) j!176)))))

(declare-fun b!524246 () Bool)

(declare-datatypes ((Unit!16376 0))(
  ( (Unit!16377) )
))
(declare-fun e!305759 () Unit!16376)

(declare-fun Unit!16378 () Unit!16376)

(assert (=> b!524246 (= e!305759 Unit!16378)))

(declare-fun lt!240565 () Unit!16376)

(declare-fun lt!240566 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16376)

(assert (=> b!524246 (= lt!240565 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240566 #b00000000000000000000000000000000 (index!20138 lt!240562) (x!49126 lt!240562) mask!3524))))

(declare-fun res!321177 () Bool)

(declare-fun lt!240568 () (_ BitVec 64))

(declare-fun lt!240561 () array!33325)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33325 (_ BitVec 32)) SeekEntryResult!4481)

(assert (=> b!524246 (= res!321177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240566 lt!240568 lt!240561 mask!3524) (Intermediate!4481 false (index!20138 lt!240562) (x!49126 lt!240562))))))

(declare-fun e!305754 () Bool)

(assert (=> b!524246 (=> (not res!321177) (not e!305754))))

(assert (=> b!524246 e!305754))

(declare-fun b!524239 () Bool)

(assert (=> b!524239 (= e!305754 false)))

(declare-fun res!321176 () Bool)

(assert (=> start!47688 (=> (not res!321176) (not e!305758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47688 (= res!321176 (validMask!0 mask!3524))))

(assert (=> start!47688 e!305758))

(assert (=> start!47688 true))

(declare-fun array_inv!11810 (array!33325) Bool)

(assert (=> start!47688 (array_inv!11810 a!3235)))

(declare-fun b!524247 () Bool)

(declare-fun e!305757 () Bool)

(assert (=> b!524247 (= e!305757 (= (seekEntryOrOpen!0 (select (arr!16014 a!3235) j!176) a!3235 mask!3524) (Found!4481 j!176)))))

(declare-fun b!524248 () Bool)

(assert (=> b!524248 (= e!305756 (not e!305760))))

(declare-fun res!321182 () Bool)

(assert (=> b!524248 (=> res!321182 e!305760)))

(declare-fun lt!240563 () (_ BitVec 32))

(assert (=> b!524248 (= res!321182 (= lt!240562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240563 lt!240568 lt!240561 mask!3524)))))

(assert (=> b!524248 (= lt!240562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240566 (select (arr!16014 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524248 (= lt!240563 (toIndex!0 lt!240568 mask!3524))))

(assert (=> b!524248 (= lt!240568 (select (store (arr!16014 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524248 (= lt!240566 (toIndex!0 (select (arr!16014 a!3235) j!176) mask!3524))))

(assert (=> b!524248 (= lt!240561 (array!33326 (store (arr!16014 a!3235) i!1204 k!2280) (size!16378 a!3235)))))

(assert (=> b!524248 e!305757))

(declare-fun res!321174 () Bool)

(assert (=> b!524248 (=> (not res!321174) (not e!305757))))

(assert (=> b!524248 (= res!321174 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240564 () Unit!16376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16376)

(assert (=> b!524248 (= lt!240564 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524249 () Bool)

(declare-fun Unit!16379 () Unit!16376)

(assert (=> b!524249 (= e!305759 Unit!16379)))

(declare-fun b!524250 () Bool)

(assert (=> b!524250 (= e!305760 (or (bvsgt #b00000000000000000000000000000000 (x!49126 lt!240562)) (bvsgt (x!49126 lt!240562) #b01111111111111111111111111111110) (bvslt lt!240566 #b00000000000000000000000000000000) (bvsge lt!240566 (size!16378 a!3235)) (bvslt (index!20138 lt!240562) #b00000000000000000000000000000000) (bvsge (index!20138 lt!240562) (size!16378 a!3235)) (= lt!240562 (Intermediate!4481 false (index!20138 lt!240562) (x!49126 lt!240562)))))))

(assert (=> b!524250 (and (or (= (select (arr!16014 a!3235) (index!20138 lt!240562)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16014 a!3235) (index!20138 lt!240562)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16014 a!3235) (index!20138 lt!240562)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16014 a!3235) (index!20138 lt!240562)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240567 () Unit!16376)

(assert (=> b!524250 (= lt!240567 e!305759)))

(declare-fun c!61838 () Bool)

(assert (=> b!524250 (= c!61838 (= (select (arr!16014 a!3235) (index!20138 lt!240562)) (select (arr!16014 a!3235) j!176)))))

(assert (=> b!524250 (and (bvslt (x!49126 lt!240562) #b01111111111111111111111111111110) (or (= (select (arr!16014 a!3235) (index!20138 lt!240562)) (select (arr!16014 a!3235) j!176)) (= (select (arr!16014 a!3235) (index!20138 lt!240562)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16014 a!3235) (index!20138 lt!240562)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524251 () Bool)

(declare-fun res!321179 () Bool)

(assert (=> b!524251 (=> (not res!321179) (not e!305758))))

(assert (=> b!524251 (= res!321179 (and (= (size!16378 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16378 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16378 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524252 () Bool)

(declare-fun res!321185 () Bool)

(assert (=> b!524252 (=> (not res!321185) (not e!305756))))

(declare-datatypes ((List!10172 0))(
  ( (Nil!10169) (Cons!10168 (h!11099 (_ BitVec 64)) (t!16400 List!10172)) )
))
(declare-fun arrayNoDuplicates!0 (array!33325 (_ BitVec 32) List!10172) Bool)

(assert (=> b!524252 (= res!321185 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10169))))

(assert (= (and start!47688 res!321176) b!524251))

(assert (= (and b!524251 res!321179) b!524245))

(assert (= (and b!524245 res!321181) b!524243))

(assert (= (and b!524243 res!321183) b!524244))

(assert (= (and b!524244 res!321184) b!524240))

(assert (= (and b!524240 res!321180) b!524241))

(assert (= (and b!524241 res!321178) b!524252))

(assert (= (and b!524252 res!321185) b!524248))

(assert (= (and b!524248 res!321174) b!524247))

(assert (= (and b!524248 (not res!321182)) b!524242))

(assert (= (and b!524242 (not res!321175)) b!524250))

(assert (= (and b!524250 c!61838) b!524246))

(assert (= (and b!524250 (not c!61838)) b!524249))

(assert (= (and b!524246 res!321177) b!524239))

(declare-fun m!504873 () Bool)

(assert (=> b!524252 m!504873))

(declare-fun m!504875 () Bool)

(assert (=> b!524248 m!504875))

(declare-fun m!504877 () Bool)

(assert (=> b!524248 m!504877))

(declare-fun m!504879 () Bool)

(assert (=> b!524248 m!504879))

(declare-fun m!504881 () Bool)

(assert (=> b!524248 m!504881))

(assert (=> b!524248 m!504879))

(declare-fun m!504883 () Bool)

(assert (=> b!524248 m!504883))

(declare-fun m!504885 () Bool)

(assert (=> b!524248 m!504885))

(declare-fun m!504887 () Bool)

(assert (=> b!524248 m!504887))

(assert (=> b!524248 m!504879))

(declare-fun m!504889 () Bool)

(assert (=> b!524248 m!504889))

(declare-fun m!504891 () Bool)

(assert (=> b!524248 m!504891))

(assert (=> b!524247 m!504879))

(assert (=> b!524247 m!504879))

(declare-fun m!504893 () Bool)

(assert (=> b!524247 m!504893))

(declare-fun m!504895 () Bool)

(assert (=> b!524250 m!504895))

(assert (=> b!524250 m!504879))

(declare-fun m!504897 () Bool)

(assert (=> b!524244 m!504897))

(declare-fun m!504899 () Bool)

(assert (=> b!524243 m!504899))

(declare-fun m!504901 () Bool)

(assert (=> b!524241 m!504901))

(declare-fun m!504903 () Bool)

(assert (=> b!524246 m!504903))

(declare-fun m!504905 () Bool)

(assert (=> b!524246 m!504905))

(declare-fun m!504907 () Bool)

(assert (=> start!47688 m!504907))

(declare-fun m!504909 () Bool)

(assert (=> start!47688 m!504909))

(assert (=> b!524245 m!504879))

(assert (=> b!524245 m!504879))

(declare-fun m!504911 () Bool)

(assert (=> b!524245 m!504911))

(declare-fun m!504913 () Bool)

(assert (=> b!524240 m!504913))

(push 1)

