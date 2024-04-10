; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45282 () Bool)

(assert start!45282)

(declare-fun b!497483 () Bool)

(declare-datatypes ((Unit!14816 0))(
  ( (Unit!14817) )
))
(declare-fun e!291597 () Unit!14816)

(declare-fun Unit!14818 () Unit!14816)

(assert (=> b!497483 (= e!291597 Unit!14818)))

(declare-datatypes ((SeekEntryResult!3935 0))(
  ( (MissingZero!3935 (index!17919 (_ BitVec 32))) (Found!3935 (index!17920 (_ BitVec 32))) (Intermediate!3935 (undefined!4747 Bool) (index!17921 (_ BitVec 32)) (x!46971 (_ BitVec 32))) (Undefined!3935) (MissingVacant!3935 (index!17922 (_ BitVec 32))) )
))
(declare-fun lt!225229 () SeekEntryResult!3935)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225226 () (_ BitVec 32))

(declare-datatypes ((array!32170 0))(
  ( (array!32171 (arr!15468 (Array (_ BitVec 32) (_ BitVec 64))) (size!15832 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32170)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225228 () Unit!14816)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32170 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14816)

(assert (=> b!497483 (= lt!225228 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225226 #b00000000000000000000000000000000 (index!17921 lt!225229) (x!46971 lt!225229) mask!3524))))

(declare-fun lt!225221 () array!32170)

(declare-fun res!299874 () Bool)

(declare-fun lt!225227 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32170 (_ BitVec 32)) SeekEntryResult!3935)

(assert (=> b!497483 (= res!299874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225226 lt!225227 lt!225221 mask!3524) (Intermediate!3935 false (index!17921 lt!225229) (x!46971 lt!225229))))))

(declare-fun e!291603 () Bool)

(assert (=> b!497483 (=> (not res!299874) (not e!291603))))

(assert (=> b!497483 e!291603))

(declare-fun b!497484 () Bool)

(declare-fun res!299875 () Bool)

(declare-fun e!291599 () Bool)

(assert (=> b!497484 (=> (not res!299875) (not e!291599))))

(assert (=> b!497484 (= res!299875 (and (= (size!15832 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15832 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15832 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497485 () Bool)

(assert (=> b!497485 (= e!291603 false)))

(declare-fun b!497486 () Bool)

(declare-fun res!299866 () Bool)

(assert (=> b!497486 (=> (not res!299866) (not e!291599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497486 (= res!299866 (validKeyInArray!0 k!2280))))

(declare-fun e!291601 () Bool)

(declare-fun b!497487 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32170 (_ BitVec 32)) SeekEntryResult!3935)

(assert (=> b!497487 (= e!291601 (= (seekEntryOrOpen!0 (select (arr!15468 a!3235) j!176) a!3235 mask!3524) (Found!3935 j!176)))))

(declare-fun b!497488 () Bool)

(declare-fun res!299876 () Bool)

(assert (=> b!497488 (=> (not res!299876) (not e!291599))))

(declare-fun arrayContainsKey!0 (array!32170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497488 (= res!299876 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497489 () Bool)

(declare-fun e!291602 () Bool)

(assert (=> b!497489 (= e!291599 e!291602)))

(declare-fun res!299873 () Bool)

(assert (=> b!497489 (=> (not res!299873) (not e!291602))))

(declare-fun lt!225224 () SeekEntryResult!3935)

(assert (=> b!497489 (= res!299873 (or (= lt!225224 (MissingZero!3935 i!1204)) (= lt!225224 (MissingVacant!3935 i!1204))))))

(assert (=> b!497489 (= lt!225224 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497490 () Bool)

(declare-fun res!299871 () Bool)

(assert (=> b!497490 (=> (not res!299871) (not e!291599))))

(assert (=> b!497490 (= res!299871 (validKeyInArray!0 (select (arr!15468 a!3235) j!176)))))

(declare-fun b!497491 () Bool)

(declare-fun e!291600 () Bool)

(assert (=> b!497491 (= e!291602 (not e!291600))))

(declare-fun res!299872 () Bool)

(assert (=> b!497491 (=> res!299872 e!291600)))

(declare-fun lt!225225 () (_ BitVec 32))

(assert (=> b!497491 (= res!299872 (= lt!225229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225225 lt!225227 lt!225221 mask!3524)))))

(assert (=> b!497491 (= lt!225229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225226 (select (arr!15468 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497491 (= lt!225225 (toIndex!0 lt!225227 mask!3524))))

(assert (=> b!497491 (= lt!225227 (select (store (arr!15468 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!497491 (= lt!225226 (toIndex!0 (select (arr!15468 a!3235) j!176) mask!3524))))

(assert (=> b!497491 (= lt!225221 (array!32171 (store (arr!15468 a!3235) i!1204 k!2280) (size!15832 a!3235)))))

(assert (=> b!497491 e!291601))

(declare-fun res!299865 () Bool)

(assert (=> b!497491 (=> (not res!299865) (not e!291601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32170 (_ BitVec 32)) Bool)

(assert (=> b!497491 (= res!299865 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225223 () Unit!14816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14816)

(assert (=> b!497491 (= lt!225223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497492 () Bool)

(declare-fun res!299868 () Bool)

(assert (=> b!497492 (=> (not res!299868) (not e!291602))))

(assert (=> b!497492 (= res!299868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497493 () Bool)

(declare-fun res!299870 () Bool)

(assert (=> b!497493 (=> res!299870 e!291600)))

(assert (=> b!497493 (= res!299870 (or (undefined!4747 lt!225229) (not (is-Intermediate!3935 lt!225229))))))

(declare-fun b!497482 () Bool)

(declare-fun res!299867 () Bool)

(assert (=> b!497482 (=> (not res!299867) (not e!291602))))

(declare-datatypes ((List!9626 0))(
  ( (Nil!9623) (Cons!9622 (h!10493 (_ BitVec 64)) (t!15854 List!9626)) )
))
(declare-fun arrayNoDuplicates!0 (array!32170 (_ BitVec 32) List!9626) Bool)

(assert (=> b!497482 (= res!299867 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9623))))

(declare-fun res!299869 () Bool)

(assert (=> start!45282 (=> (not res!299869) (not e!291599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45282 (= res!299869 (validMask!0 mask!3524))))

(assert (=> start!45282 e!291599))

(assert (=> start!45282 true))

(declare-fun array_inv!11264 (array!32170) Bool)

(assert (=> start!45282 (array_inv!11264 a!3235)))

(declare-fun b!497494 () Bool)

(declare-fun Unit!14819 () Unit!14816)

(assert (=> b!497494 (= e!291597 Unit!14819)))

(declare-fun b!497495 () Bool)

(assert (=> b!497495 (= e!291600 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!497495 (and (or (= (select (arr!15468 a!3235) (index!17921 lt!225229)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15468 a!3235) (index!17921 lt!225229)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15468 a!3235) (index!17921 lt!225229)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15468 a!3235) (index!17921 lt!225229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225222 () Unit!14816)

(assert (=> b!497495 (= lt!225222 e!291597)))

(declare-fun c!59084 () Bool)

(assert (=> b!497495 (= c!59084 (= (select (arr!15468 a!3235) (index!17921 lt!225229)) (select (arr!15468 a!3235) j!176)))))

(assert (=> b!497495 (and (bvslt (x!46971 lt!225229) #b01111111111111111111111111111110) (or (= (select (arr!15468 a!3235) (index!17921 lt!225229)) (select (arr!15468 a!3235) j!176)) (= (select (arr!15468 a!3235) (index!17921 lt!225229)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15468 a!3235) (index!17921 lt!225229)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45282 res!299869) b!497484))

(assert (= (and b!497484 res!299875) b!497490))

(assert (= (and b!497490 res!299871) b!497486))

(assert (= (and b!497486 res!299866) b!497488))

(assert (= (and b!497488 res!299876) b!497489))

(assert (= (and b!497489 res!299873) b!497492))

(assert (= (and b!497492 res!299868) b!497482))

(assert (= (and b!497482 res!299867) b!497491))

(assert (= (and b!497491 res!299865) b!497487))

(assert (= (and b!497491 (not res!299872)) b!497493))

(assert (= (and b!497493 (not res!299870)) b!497495))

(assert (= (and b!497495 c!59084) b!497483))

(assert (= (and b!497495 (not c!59084)) b!497494))

(assert (= (and b!497483 res!299874) b!497485))

(declare-fun m!478869 () Bool)

(assert (=> b!497488 m!478869))

(declare-fun m!478871 () Bool)

(assert (=> b!497489 m!478871))

(declare-fun m!478873 () Bool)

(assert (=> b!497495 m!478873))

(declare-fun m!478875 () Bool)

(assert (=> b!497495 m!478875))

(declare-fun m!478877 () Bool)

(assert (=> start!45282 m!478877))

(declare-fun m!478879 () Bool)

(assert (=> start!45282 m!478879))

(declare-fun m!478881 () Bool)

(assert (=> b!497491 m!478881))

(declare-fun m!478883 () Bool)

(assert (=> b!497491 m!478883))

(declare-fun m!478885 () Bool)

(assert (=> b!497491 m!478885))

(assert (=> b!497491 m!478875))

(declare-fun m!478887 () Bool)

(assert (=> b!497491 m!478887))

(declare-fun m!478889 () Bool)

(assert (=> b!497491 m!478889))

(assert (=> b!497491 m!478875))

(declare-fun m!478891 () Bool)

(assert (=> b!497491 m!478891))

(assert (=> b!497491 m!478875))

(declare-fun m!478893 () Bool)

(assert (=> b!497491 m!478893))

(declare-fun m!478895 () Bool)

(assert (=> b!497491 m!478895))

(declare-fun m!478897 () Bool)

(assert (=> b!497486 m!478897))

(declare-fun m!478899 () Bool)

(assert (=> b!497482 m!478899))

(assert (=> b!497487 m!478875))

(assert (=> b!497487 m!478875))

(declare-fun m!478901 () Bool)

(assert (=> b!497487 m!478901))

(declare-fun m!478903 () Bool)

(assert (=> b!497492 m!478903))

(declare-fun m!478905 () Bool)

(assert (=> b!497483 m!478905))

(declare-fun m!478907 () Bool)

(assert (=> b!497483 m!478907))

(assert (=> b!497490 m!478875))

(assert (=> b!497490 m!478875))

(declare-fun m!478909 () Bool)

(assert (=> b!497490 m!478909))

(push 1)

