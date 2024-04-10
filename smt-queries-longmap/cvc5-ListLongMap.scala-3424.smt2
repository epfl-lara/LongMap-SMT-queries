; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47532 () Bool)

(assert start!47532)

(declare-fun res!320500 () Bool)

(declare-fun e!305083 () Bool)

(assert (=> start!47532 (=> (not res!320500) (not e!305083))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47532 (= res!320500 (validMask!0 mask!3524))))

(assert (=> start!47532 e!305083))

(assert (=> start!47532 true))

(declare-datatypes ((array!33295 0))(
  ( (array!33296 (arr!16002 (Array (_ BitVec 32) (_ BitVec 64))) (size!16366 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33295)

(declare-fun array_inv!11798 (array!33295) Bool)

(assert (=> start!47532 (array_inv!11798 a!3235)))

(declare-fun b!523081 () Bool)

(declare-datatypes ((Unit!16328 0))(
  ( (Unit!16329) )
))
(declare-fun e!305087 () Unit!16328)

(declare-fun Unit!16330 () Unit!16328)

(assert (=> b!523081 (= e!305087 Unit!16330)))

(declare-fun b!523082 () Bool)

(declare-fun e!305082 () Bool)

(declare-fun e!305086 () Bool)

(assert (=> b!523082 (= e!305082 (not e!305086))))

(declare-fun res!320492 () Bool)

(assert (=> b!523082 (=> res!320492 e!305086)))

(declare-datatypes ((SeekEntryResult!4469 0))(
  ( (MissingZero!4469 (index!20082 (_ BitVec 32))) (Found!4469 (index!20083 (_ BitVec 32))) (Intermediate!4469 (undefined!5281 Bool) (index!20084 (_ BitVec 32)) (x!49064 (_ BitVec 32))) (Undefined!4469) (MissingVacant!4469 (index!20085 (_ BitVec 32))) )
))
(declare-fun lt!239950 () SeekEntryResult!4469)

(declare-fun lt!239953 () (_ BitVec 32))

(declare-fun lt!239952 () array!33295)

(declare-fun lt!239951 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33295 (_ BitVec 32)) SeekEntryResult!4469)

(assert (=> b!523082 (= res!320492 (= lt!239950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239953 lt!239951 lt!239952 mask!3524)))))

(declare-fun lt!239949 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523082 (= lt!239950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239949 (select (arr!16002 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523082 (= lt!239953 (toIndex!0 lt!239951 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523082 (= lt!239951 (select (store (arr!16002 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523082 (= lt!239949 (toIndex!0 (select (arr!16002 a!3235) j!176) mask!3524))))

(assert (=> b!523082 (= lt!239952 (array!33296 (store (arr!16002 a!3235) i!1204 k!2280) (size!16366 a!3235)))))

(declare-fun e!305085 () Bool)

(assert (=> b!523082 e!305085))

(declare-fun res!320499 () Bool)

(assert (=> b!523082 (=> (not res!320499) (not e!305085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33295 (_ BitVec 32)) Bool)

(assert (=> b!523082 (= res!320499 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239954 () Unit!16328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16328)

(assert (=> b!523082 (= lt!239954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523083 () Bool)

(declare-fun res!320497 () Bool)

(assert (=> b!523083 (=> (not res!320497) (not e!305082))))

(declare-datatypes ((List!10160 0))(
  ( (Nil!10157) (Cons!10156 (h!11081 (_ BitVec 64)) (t!16388 List!10160)) )
))
(declare-fun arrayNoDuplicates!0 (array!33295 (_ BitVec 32) List!10160) Bool)

(assert (=> b!523083 (= res!320497 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10157))))

(declare-fun b!523084 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33295 (_ BitVec 32)) SeekEntryResult!4469)

(assert (=> b!523084 (= e!305085 (= (seekEntryOrOpen!0 (select (arr!16002 a!3235) j!176) a!3235 mask!3524) (Found!4469 j!176)))))

(declare-fun b!523085 () Bool)

(declare-fun Unit!16331 () Unit!16328)

(assert (=> b!523085 (= e!305087 Unit!16331)))

(declare-fun lt!239948 () Unit!16328)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33295 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16328)

(assert (=> b!523085 (= lt!239948 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239949 #b00000000000000000000000000000000 (index!20084 lt!239950) (x!49064 lt!239950) mask!3524))))

(declare-fun res!320501 () Bool)

(assert (=> b!523085 (= res!320501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239949 lt!239951 lt!239952 mask!3524) (Intermediate!4469 false (index!20084 lt!239950) (x!49064 lt!239950))))))

(declare-fun e!305088 () Bool)

(assert (=> b!523085 (=> (not res!320501) (not e!305088))))

(assert (=> b!523085 e!305088))

(declare-fun b!523086 () Bool)

(assert (=> b!523086 (= e!305083 e!305082)))

(declare-fun res!320491 () Bool)

(assert (=> b!523086 (=> (not res!320491) (not e!305082))))

(declare-fun lt!239955 () SeekEntryResult!4469)

(assert (=> b!523086 (= res!320491 (or (= lt!239955 (MissingZero!4469 i!1204)) (= lt!239955 (MissingVacant!4469 i!1204))))))

(assert (=> b!523086 (= lt!239955 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523087 () Bool)

(declare-fun res!320498 () Bool)

(assert (=> b!523087 (=> (not res!320498) (not e!305083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523087 (= res!320498 (validKeyInArray!0 (select (arr!16002 a!3235) j!176)))))

(declare-fun b!523088 () Bool)

(declare-fun res!320495 () Bool)

(assert (=> b!523088 (=> (not res!320495) (not e!305083))))

(assert (=> b!523088 (= res!320495 (and (= (size!16366 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16366 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16366 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523089 () Bool)

(declare-fun res!320494 () Bool)

(assert (=> b!523089 (=> res!320494 e!305086)))

(assert (=> b!523089 (= res!320494 (or (undefined!5281 lt!239950) (not (is-Intermediate!4469 lt!239950))))))

(declare-fun b!523090 () Bool)

(assert (=> b!523090 (= e!305088 false)))

(declare-fun b!523091 () Bool)

(declare-fun res!320490 () Bool)

(assert (=> b!523091 (=> (not res!320490) (not e!305083))))

(assert (=> b!523091 (= res!320490 (validKeyInArray!0 k!2280))))

(declare-fun b!523092 () Bool)

(declare-fun res!320496 () Bool)

(assert (=> b!523092 (=> (not res!320496) (not e!305082))))

(assert (=> b!523092 (= res!320496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523093 () Bool)

(declare-fun res!320493 () Bool)

(assert (=> b!523093 (=> (not res!320493) (not e!305083))))

(declare-fun arrayContainsKey!0 (array!33295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523093 (= res!320493 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523094 () Bool)

(assert (=> b!523094 (= e!305086 true)))

(assert (=> b!523094 (and (or (= (select (arr!16002 a!3235) (index!20084 lt!239950)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16002 a!3235) (index!20084 lt!239950)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16002 a!3235) (index!20084 lt!239950)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16002 a!3235) (index!20084 lt!239950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239956 () Unit!16328)

(assert (=> b!523094 (= lt!239956 e!305087)))

(declare-fun c!61598 () Bool)

(assert (=> b!523094 (= c!61598 (= (select (arr!16002 a!3235) (index!20084 lt!239950)) (select (arr!16002 a!3235) j!176)))))

(assert (=> b!523094 (and (bvslt (x!49064 lt!239950) #b01111111111111111111111111111110) (or (= (select (arr!16002 a!3235) (index!20084 lt!239950)) (select (arr!16002 a!3235) j!176)) (= (select (arr!16002 a!3235) (index!20084 lt!239950)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16002 a!3235) (index!20084 lt!239950)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47532 res!320500) b!523088))

(assert (= (and b!523088 res!320495) b!523087))

(assert (= (and b!523087 res!320498) b!523091))

(assert (= (and b!523091 res!320490) b!523093))

(assert (= (and b!523093 res!320493) b!523086))

(assert (= (and b!523086 res!320491) b!523092))

(assert (= (and b!523092 res!320496) b!523083))

(assert (= (and b!523083 res!320497) b!523082))

(assert (= (and b!523082 res!320499) b!523084))

(assert (= (and b!523082 (not res!320492)) b!523089))

(assert (= (and b!523089 (not res!320494)) b!523094))

(assert (= (and b!523094 c!61598) b!523085))

(assert (= (and b!523094 (not c!61598)) b!523081))

(assert (= (and b!523085 res!320501) b!523090))

(declare-fun m!503901 () Bool)

(assert (=> b!523084 m!503901))

(assert (=> b!523084 m!503901))

(declare-fun m!503903 () Bool)

(assert (=> b!523084 m!503903))

(declare-fun m!503905 () Bool)

(assert (=> b!523092 m!503905))

(declare-fun m!503907 () Bool)

(assert (=> b!523085 m!503907))

(declare-fun m!503909 () Bool)

(assert (=> b!523085 m!503909))

(declare-fun m!503911 () Bool)

(assert (=> start!47532 m!503911))

(declare-fun m!503913 () Bool)

(assert (=> start!47532 m!503913))

(declare-fun m!503915 () Bool)

(assert (=> b!523083 m!503915))

(declare-fun m!503917 () Bool)

(assert (=> b!523094 m!503917))

(assert (=> b!523094 m!503901))

(assert (=> b!523087 m!503901))

(assert (=> b!523087 m!503901))

(declare-fun m!503919 () Bool)

(assert (=> b!523087 m!503919))

(declare-fun m!503921 () Bool)

(assert (=> b!523093 m!503921))

(declare-fun m!503923 () Bool)

(assert (=> b!523091 m!503923))

(assert (=> b!523082 m!503901))

(declare-fun m!503925 () Bool)

(assert (=> b!523082 m!503925))

(declare-fun m!503927 () Bool)

(assert (=> b!523082 m!503927))

(declare-fun m!503929 () Bool)

(assert (=> b!523082 m!503929))

(declare-fun m!503931 () Bool)

(assert (=> b!523082 m!503931))

(assert (=> b!523082 m!503901))

(declare-fun m!503933 () Bool)

(assert (=> b!523082 m!503933))

(assert (=> b!523082 m!503901))

(declare-fun m!503935 () Bool)

(assert (=> b!523082 m!503935))

(declare-fun m!503937 () Bool)

(assert (=> b!523082 m!503937))

(declare-fun m!503939 () Bool)

(assert (=> b!523082 m!503939))

(declare-fun m!503941 () Bool)

(assert (=> b!523086 m!503941))

(push 1)

