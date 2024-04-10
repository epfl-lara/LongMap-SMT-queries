; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45258 () Bool)

(assert start!45258)

(declare-fun b!497080 () Bool)

(declare-fun res!299477 () Bool)

(declare-fun e!291413 () Bool)

(assert (=> b!497080 (=> (not res!299477) (not e!291413))))

(declare-datatypes ((array!32146 0))(
  ( (array!32147 (arr!15456 (Array (_ BitVec 32) (_ BitVec 64))) (size!15820 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32146)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497080 (= res!299477 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497082 () Bool)

(declare-fun res!299476 () Bool)

(declare-fun e!291416 () Bool)

(assert (=> b!497082 (=> (not res!299476) (not e!291416))))

(declare-datatypes ((List!9614 0))(
  ( (Nil!9611) (Cons!9610 (h!10481 (_ BitVec 64)) (t!15842 List!9614)) )
))
(declare-fun arrayNoDuplicates!0 (array!32146 (_ BitVec 32) List!9614) Bool)

(assert (=> b!497082 (= res!299476 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9611))))

(declare-fun b!497083 () Bool)

(declare-fun res!299467 () Bool)

(assert (=> b!497083 (=> (not res!299467) (not e!291416))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32146 (_ BitVec 32)) Bool)

(assert (=> b!497083 (= res!299467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497084 () Bool)

(declare-fun e!291414 () Bool)

(assert (=> b!497084 (= e!291416 (not e!291414))))

(declare-fun res!299469 () Bool)

(assert (=> b!497084 (=> res!299469 e!291414)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3923 0))(
  ( (MissingZero!3923 (index!17871 (_ BitVec 32))) (Found!3923 (index!17872 (_ BitVec 32))) (Intermediate!3923 (undefined!4735 Bool) (index!17873 (_ BitVec 32)) (x!46927 (_ BitVec 32))) (Undefined!3923) (MissingVacant!3923 (index!17874 (_ BitVec 32))) )
))
(declare-fun lt!225033 () SeekEntryResult!3923)

(declare-fun lt!225036 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32146 (_ BitVec 32)) SeekEntryResult!3923)

(assert (=> b!497084 (= res!299469 (= lt!225033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225036 (select (store (arr!15456 a!3235) i!1204 k!2280) j!176) (array!32147 (store (arr!15456 a!3235) i!1204 k!2280) (size!15820 a!3235)) mask!3524)))))

(declare-fun lt!225035 () (_ BitVec 32))

(assert (=> b!497084 (= lt!225033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225035 (select (arr!15456 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497084 (= lt!225036 (toIndex!0 (select (store (arr!15456 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497084 (= lt!225035 (toIndex!0 (select (arr!15456 a!3235) j!176) mask!3524))))

(declare-fun e!291415 () Bool)

(assert (=> b!497084 e!291415))

(declare-fun res!299470 () Bool)

(assert (=> b!497084 (=> (not res!299470) (not e!291415))))

(assert (=> b!497084 (= res!299470 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14792 0))(
  ( (Unit!14793) )
))
(declare-fun lt!225034 () Unit!14792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14792)

(assert (=> b!497084 (= lt!225034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497085 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32146 (_ BitVec 32)) SeekEntryResult!3923)

(assert (=> b!497085 (= e!291415 (= (seekEntryOrOpen!0 (select (arr!15456 a!3235) j!176) a!3235 mask!3524) (Found!3923 j!176)))))

(declare-fun b!497086 () Bool)

(assert (=> b!497086 (= e!291414 true)))

(assert (=> b!497086 (and (bvslt (x!46927 lt!225033) #b01111111111111111111111111111110) (or (= (select (arr!15456 a!3235) (index!17873 lt!225033)) (select (arr!15456 a!3235) j!176)) (= (select (arr!15456 a!3235) (index!17873 lt!225033)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15456 a!3235) (index!17873 lt!225033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497087 () Bool)

(declare-fun res!299472 () Bool)

(assert (=> b!497087 (=> (not res!299472) (not e!291413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497087 (= res!299472 (validKeyInArray!0 k!2280))))

(declare-fun b!497088 () Bool)

(declare-fun res!299475 () Bool)

(assert (=> b!497088 (=> (not res!299475) (not e!291413))))

(assert (=> b!497088 (= res!299475 (and (= (size!15820 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15820 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15820 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299468 () Bool)

(assert (=> start!45258 (=> (not res!299468) (not e!291413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45258 (= res!299468 (validMask!0 mask!3524))))

(assert (=> start!45258 e!291413))

(assert (=> start!45258 true))

(declare-fun array_inv!11252 (array!32146) Bool)

(assert (=> start!45258 (array_inv!11252 a!3235)))

(declare-fun b!497081 () Bool)

(assert (=> b!497081 (= e!291413 e!291416)))

(declare-fun res!299473 () Bool)

(assert (=> b!497081 (=> (not res!299473) (not e!291416))))

(declare-fun lt!225037 () SeekEntryResult!3923)

(assert (=> b!497081 (= res!299473 (or (= lt!225037 (MissingZero!3923 i!1204)) (= lt!225037 (MissingVacant!3923 i!1204))))))

(assert (=> b!497081 (= lt!225037 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497089 () Bool)

(declare-fun res!299471 () Bool)

(assert (=> b!497089 (=> (not res!299471) (not e!291413))))

(assert (=> b!497089 (= res!299471 (validKeyInArray!0 (select (arr!15456 a!3235) j!176)))))

(declare-fun b!497090 () Bool)

(declare-fun res!299474 () Bool)

(assert (=> b!497090 (=> res!299474 e!291414)))

(assert (=> b!497090 (= res!299474 (or (undefined!4735 lt!225033) (not (is-Intermediate!3923 lt!225033))))))

(assert (= (and start!45258 res!299468) b!497088))

(assert (= (and b!497088 res!299475) b!497089))

(assert (= (and b!497089 res!299471) b!497087))

(assert (= (and b!497087 res!299472) b!497080))

(assert (= (and b!497080 res!299477) b!497081))

(assert (= (and b!497081 res!299473) b!497083))

(assert (= (and b!497083 res!299467) b!497082))

(assert (= (and b!497082 res!299476) b!497084))

(assert (= (and b!497084 res!299470) b!497085))

(assert (= (and b!497084 (not res!299469)) b!497090))

(assert (= (and b!497090 (not res!299474)) b!497086))

(declare-fun m!478413 () Bool)

(assert (=> b!497081 m!478413))

(declare-fun m!478415 () Bool)

(assert (=> b!497084 m!478415))

(declare-fun m!478417 () Bool)

(assert (=> b!497084 m!478417))

(declare-fun m!478419 () Bool)

(assert (=> b!497084 m!478419))

(declare-fun m!478421 () Bool)

(assert (=> b!497084 m!478421))

(declare-fun m!478423 () Bool)

(assert (=> b!497084 m!478423))

(declare-fun m!478425 () Bool)

(assert (=> b!497084 m!478425))

(assert (=> b!497084 m!478423))

(assert (=> b!497084 m!478419))

(declare-fun m!478427 () Bool)

(assert (=> b!497084 m!478427))

(assert (=> b!497084 m!478419))

(declare-fun m!478429 () Bool)

(assert (=> b!497084 m!478429))

(assert (=> b!497084 m!478423))

(declare-fun m!478431 () Bool)

(assert (=> b!497084 m!478431))

(declare-fun m!478433 () Bool)

(assert (=> b!497083 m!478433))

(assert (=> b!497085 m!478419))

(assert (=> b!497085 m!478419))

(declare-fun m!478435 () Bool)

(assert (=> b!497085 m!478435))

(declare-fun m!478437 () Bool)

(assert (=> b!497082 m!478437))

(declare-fun m!478439 () Bool)

(assert (=> b!497086 m!478439))

(assert (=> b!497086 m!478419))

(assert (=> b!497089 m!478419))

(assert (=> b!497089 m!478419))

(declare-fun m!478441 () Bool)

(assert (=> b!497089 m!478441))

(declare-fun m!478443 () Bool)

(assert (=> b!497080 m!478443))

(declare-fun m!478445 () Bool)

(assert (=> start!45258 m!478445))

(declare-fun m!478447 () Bool)

(assert (=> start!45258 m!478447))

(declare-fun m!478449 () Bool)

(assert (=> b!497087 m!478449))

(push 1)

