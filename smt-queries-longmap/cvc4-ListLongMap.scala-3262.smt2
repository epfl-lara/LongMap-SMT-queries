; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45448 () Bool)

(assert start!45448)

(declare-fun b!500043 () Bool)

(declare-fun res!301933 () Bool)

(declare-fun e!292992 () Bool)

(assert (=> b!500043 (=> (not res!301933) (not e!292992))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500043 (= res!301933 (validKeyInArray!0 k!2280))))

(declare-fun b!500044 () Bool)

(declare-fun e!292991 () Bool)

(assert (=> b!500044 (= e!292992 e!292991)))

(declare-fun res!301926 () Bool)

(assert (=> b!500044 (=> (not res!301926) (not e!292991))))

(declare-datatypes ((SeekEntryResult!3985 0))(
  ( (MissingZero!3985 (index!18122 (_ BitVec 32))) (Found!3985 (index!18123 (_ BitVec 32))) (Intermediate!3985 (undefined!4797 Bool) (index!18124 (_ BitVec 32)) (x!47158 (_ BitVec 32))) (Undefined!3985) (MissingVacant!3985 (index!18125 (_ BitVec 32))) )
))
(declare-fun lt!226858 () SeekEntryResult!3985)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500044 (= res!301926 (or (= lt!226858 (MissingZero!3985 i!1204)) (= lt!226858 (MissingVacant!3985 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32273 0))(
  ( (array!32274 (arr!15518 (Array (_ BitVec 32) (_ BitVec 64))) (size!15882 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32273)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32273 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!500044 (= lt!226858 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500045 () Bool)

(declare-fun e!292997 () Bool)

(assert (=> b!500045 (= e!292997 false)))

(declare-fun b!500046 () Bool)

(declare-fun e!292996 () Bool)

(assert (=> b!500046 (= e!292996 true)))

(declare-fun lt!226857 () (_ BitVec 32))

(declare-fun lt!226852 () array!32273)

(declare-fun lt!226854 () SeekEntryResult!3985)

(declare-fun lt!226850 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32273 (_ BitVec 32)) SeekEntryResult!3985)

(assert (=> b!500046 (= lt!226854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226857 lt!226850 lt!226852 mask!3524))))

(declare-fun b!500047 () Bool)

(declare-fun res!301928 () Bool)

(assert (=> b!500047 (=> (not res!301928) (not e!292991))))

(declare-datatypes ((List!9676 0))(
  ( (Nil!9673) (Cons!9672 (h!10546 (_ BitVec 64)) (t!15904 List!9676)) )
))
(declare-fun arrayNoDuplicates!0 (array!32273 (_ BitVec 32) List!9676) Bool)

(assert (=> b!500047 (= res!301928 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9673))))

(declare-fun b!500048 () Bool)

(declare-datatypes ((Unit!15016 0))(
  ( (Unit!15017) )
))
(declare-fun e!292994 () Unit!15016)

(declare-fun Unit!15018 () Unit!15016)

(assert (=> b!500048 (= e!292994 Unit!15018)))

(declare-fun res!301934 () Bool)

(assert (=> start!45448 (=> (not res!301934) (not e!292992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45448 (= res!301934 (validMask!0 mask!3524))))

(assert (=> start!45448 e!292992))

(assert (=> start!45448 true))

(declare-fun array_inv!11314 (array!32273) Bool)

(assert (=> start!45448 (array_inv!11314 a!3235)))

(declare-fun b!500049 () Bool)

(declare-fun Unit!15019 () Unit!15016)

(assert (=> b!500049 (= e!292994 Unit!15019)))

(declare-fun lt!226851 () Unit!15016)

(declare-fun lt!226856 () SeekEntryResult!3985)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15016)

(assert (=> b!500049 (= lt!226851 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226857 #b00000000000000000000000000000000 (index!18124 lt!226856) (x!47158 lt!226856) mask!3524))))

(declare-fun res!301925 () Bool)

(assert (=> b!500049 (= res!301925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226857 lt!226850 lt!226852 mask!3524) (Intermediate!3985 false (index!18124 lt!226856) (x!47158 lt!226856))))))

(assert (=> b!500049 (=> (not res!301925) (not e!292997))))

(assert (=> b!500049 e!292997))

(declare-fun b!500050 () Bool)

(declare-fun res!301937 () Bool)

(assert (=> b!500050 (=> (not res!301937) (not e!292992))))

(declare-fun arrayContainsKey!0 (array!32273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500050 (= res!301937 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500051 () Bool)

(declare-fun e!292993 () Bool)

(assert (=> b!500051 (= e!292991 (not e!292993))))

(declare-fun res!301935 () Bool)

(assert (=> b!500051 (=> res!301935 e!292993)))

(declare-fun lt!226849 () (_ BitVec 32))

(assert (=> b!500051 (= res!301935 (= lt!226856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226849 lt!226850 lt!226852 mask!3524)))))

(assert (=> b!500051 (= lt!226856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226857 (select (arr!15518 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500051 (= lt!226849 (toIndex!0 lt!226850 mask!3524))))

(assert (=> b!500051 (= lt!226850 (select (store (arr!15518 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500051 (= lt!226857 (toIndex!0 (select (arr!15518 a!3235) j!176) mask!3524))))

(assert (=> b!500051 (= lt!226852 (array!32274 (store (arr!15518 a!3235) i!1204 k!2280) (size!15882 a!3235)))))

(declare-fun e!292998 () Bool)

(assert (=> b!500051 e!292998))

(declare-fun res!301936 () Bool)

(assert (=> b!500051 (=> (not res!301936) (not e!292998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32273 (_ BitVec 32)) Bool)

(assert (=> b!500051 (= res!301936 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226853 () Unit!15016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15016)

(assert (=> b!500051 (= lt!226853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500052 () Bool)

(declare-fun res!301930 () Bool)

(assert (=> b!500052 (=> (not res!301930) (not e!292992))))

(assert (=> b!500052 (= res!301930 (and (= (size!15882 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15882 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15882 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500053 () Bool)

(assert (=> b!500053 (= e!292993 e!292996)))

(declare-fun res!301932 () Bool)

(assert (=> b!500053 (=> res!301932 e!292996)))

(assert (=> b!500053 (= res!301932 (or (bvsgt #b00000000000000000000000000000000 (x!47158 lt!226856)) (bvsgt (x!47158 lt!226856) #b01111111111111111111111111111110) (bvslt lt!226857 #b00000000000000000000000000000000) (bvsge lt!226857 (size!15882 a!3235)) (bvslt (index!18124 lt!226856) #b00000000000000000000000000000000) (bvsge (index!18124 lt!226856) (size!15882 a!3235)) (not (= lt!226856 (Intermediate!3985 false (index!18124 lt!226856) (x!47158 lt!226856))))))))

(assert (=> b!500053 (and (or (= (select (arr!15518 a!3235) (index!18124 lt!226856)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15518 a!3235) (index!18124 lt!226856)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15518 a!3235) (index!18124 lt!226856)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15518 a!3235) (index!18124 lt!226856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226855 () Unit!15016)

(assert (=> b!500053 (= lt!226855 e!292994)))

(declare-fun c!59336 () Bool)

(assert (=> b!500053 (= c!59336 (= (select (arr!15518 a!3235) (index!18124 lt!226856)) (select (arr!15518 a!3235) j!176)))))

(assert (=> b!500053 (and (bvslt (x!47158 lt!226856) #b01111111111111111111111111111110) (or (= (select (arr!15518 a!3235) (index!18124 lt!226856)) (select (arr!15518 a!3235) j!176)) (= (select (arr!15518 a!3235) (index!18124 lt!226856)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15518 a!3235) (index!18124 lt!226856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500054 () Bool)

(declare-fun res!301929 () Bool)

(assert (=> b!500054 (=> (not res!301929) (not e!292991))))

(assert (=> b!500054 (= res!301929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500055 () Bool)

(assert (=> b!500055 (= e!292998 (= (seekEntryOrOpen!0 (select (arr!15518 a!3235) j!176) a!3235 mask!3524) (Found!3985 j!176)))))

(declare-fun b!500056 () Bool)

(declare-fun res!301927 () Bool)

(assert (=> b!500056 (=> (not res!301927) (not e!292992))))

(assert (=> b!500056 (= res!301927 (validKeyInArray!0 (select (arr!15518 a!3235) j!176)))))

(declare-fun b!500057 () Bool)

(declare-fun res!301931 () Bool)

(assert (=> b!500057 (=> res!301931 e!292993)))

(assert (=> b!500057 (= res!301931 (or (undefined!4797 lt!226856) (not (is-Intermediate!3985 lt!226856))))))

(assert (= (and start!45448 res!301934) b!500052))

(assert (= (and b!500052 res!301930) b!500056))

(assert (= (and b!500056 res!301927) b!500043))

(assert (= (and b!500043 res!301933) b!500050))

(assert (= (and b!500050 res!301937) b!500044))

(assert (= (and b!500044 res!301926) b!500054))

(assert (= (and b!500054 res!301929) b!500047))

(assert (= (and b!500047 res!301928) b!500051))

(assert (= (and b!500051 res!301936) b!500055))

(assert (= (and b!500051 (not res!301935)) b!500057))

(assert (= (and b!500057 (not res!301931)) b!500053))

(assert (= (and b!500053 c!59336) b!500049))

(assert (= (and b!500053 (not c!59336)) b!500048))

(assert (= (and b!500049 res!301925) b!500045))

(assert (= (and b!500053 (not res!301932)) b!500046))

(declare-fun m!481203 () Bool)

(assert (=> b!500043 m!481203))

(declare-fun m!481205 () Bool)

(assert (=> b!500044 m!481205))

(declare-fun m!481207 () Bool)

(assert (=> b!500055 m!481207))

(assert (=> b!500055 m!481207))

(declare-fun m!481209 () Bool)

(assert (=> b!500055 m!481209))

(assert (=> b!500056 m!481207))

(assert (=> b!500056 m!481207))

(declare-fun m!481211 () Bool)

(assert (=> b!500056 m!481211))

(declare-fun m!481213 () Bool)

(assert (=> b!500051 m!481213))

(declare-fun m!481215 () Bool)

(assert (=> b!500051 m!481215))

(declare-fun m!481217 () Bool)

(assert (=> b!500051 m!481217))

(declare-fun m!481219 () Bool)

(assert (=> b!500051 m!481219))

(assert (=> b!500051 m!481207))

(declare-fun m!481221 () Bool)

(assert (=> b!500051 m!481221))

(assert (=> b!500051 m!481207))

(declare-fun m!481223 () Bool)

(assert (=> b!500051 m!481223))

(assert (=> b!500051 m!481207))

(declare-fun m!481225 () Bool)

(assert (=> b!500051 m!481225))

(declare-fun m!481227 () Bool)

(assert (=> b!500051 m!481227))

(declare-fun m!481229 () Bool)

(assert (=> b!500046 m!481229))

(declare-fun m!481231 () Bool)

(assert (=> b!500047 m!481231))

(declare-fun m!481233 () Bool)

(assert (=> b!500054 m!481233))

(declare-fun m!481235 () Bool)

(assert (=> b!500053 m!481235))

(assert (=> b!500053 m!481207))

(declare-fun m!481237 () Bool)

(assert (=> b!500049 m!481237))

(assert (=> b!500049 m!481229))

(declare-fun m!481239 () Bool)

(assert (=> start!45448 m!481239))

(declare-fun m!481241 () Bool)

(assert (=> start!45448 m!481241))

(declare-fun m!481243 () Bool)

(assert (=> b!500050 m!481243))

(push 1)

