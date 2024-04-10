; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46734 () Bool)

(assert start!46734)

(declare-fun b!515974 () Bool)

(declare-fun res!315547 () Bool)

(declare-fun e!301193 () Bool)

(assert (=> b!515974 (=> (not res!315547) (not e!301193))))

(declare-datatypes ((array!33046 0))(
  ( (array!33047 (arr!15891 (Array (_ BitVec 32) (_ BitVec 64))) (size!16255 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33046)

(declare-datatypes ((List!10049 0))(
  ( (Nil!10046) (Cons!10045 (h!10943 (_ BitVec 64)) (t!16277 List!10049)) )
))
(declare-fun arrayNoDuplicates!0 (array!33046 (_ BitVec 32) List!10049) Bool)

(assert (=> b!515974 (= res!315547 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10046))))

(declare-fun b!515975 () Bool)

(declare-fun res!315546 () Bool)

(declare-fun e!301194 () Bool)

(assert (=> b!515975 (=> (not res!315546) (not e!301194))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515975 (= res!315546 (validKeyInArray!0 k!2280))))

(declare-fun b!515976 () Bool)

(declare-fun res!315544 () Bool)

(assert (=> b!515976 (=> (not res!315544) (not e!301194))))

(declare-fun arrayContainsKey!0 (array!33046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515976 (= res!315544 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515977 () Bool)

(declare-fun res!315538 () Bool)

(declare-fun e!301190 () Bool)

(assert (=> b!515977 (=> res!315538 e!301190)))

(declare-datatypes ((SeekEntryResult!4358 0))(
  ( (MissingZero!4358 (index!19620 (_ BitVec 32))) (Found!4358 (index!19621 (_ BitVec 32))) (Intermediate!4358 (undefined!5170 Bool) (index!19622 (_ BitVec 32)) (x!48585 (_ BitVec 32))) (Undefined!4358) (MissingVacant!4358 (index!19623 (_ BitVec 32))) )
))
(declare-fun lt!236207 () SeekEntryResult!4358)

(assert (=> b!515977 (= res!315538 (or (undefined!5170 lt!236207) (not (is-Intermediate!4358 lt!236207))))))

(declare-fun b!515978 () Bool)

(declare-fun res!315541 () Bool)

(assert (=> b!515978 (=> (not res!315541) (not e!301194))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515978 (= res!315541 (and (= (size!16255 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16255 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16255 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315545 () Bool)

(assert (=> start!46734 (=> (not res!315545) (not e!301194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46734 (= res!315545 (validMask!0 mask!3524))))

(assert (=> start!46734 e!301194))

(assert (=> start!46734 true))

(declare-fun array_inv!11687 (array!33046) Bool)

(assert (=> start!46734 (array_inv!11687 a!3235)))

(declare-fun b!515979 () Bool)

(assert (=> b!515979 (= e!301190 true)))

(assert (=> b!515979 (and (bvslt (x!48585 lt!236207) #b01111111111111111111111111111110) (or (= (select (arr!15891 a!3235) (index!19622 lt!236207)) (select (arr!15891 a!3235) j!176)) (= (select (arr!15891 a!3235) (index!19622 lt!236207)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15891 a!3235) (index!19622 lt!236207)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515980 () Bool)

(declare-fun res!315542 () Bool)

(assert (=> b!515980 (=> (not res!315542) (not e!301193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33046 (_ BitVec 32)) Bool)

(assert (=> b!515980 (= res!315542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515981 () Bool)

(assert (=> b!515981 (= e!301194 e!301193)))

(declare-fun res!315539 () Bool)

(assert (=> b!515981 (=> (not res!315539) (not e!301193))))

(declare-fun lt!236206 () SeekEntryResult!4358)

(assert (=> b!515981 (= res!315539 (or (= lt!236206 (MissingZero!4358 i!1204)) (= lt!236206 (MissingVacant!4358 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33046 (_ BitVec 32)) SeekEntryResult!4358)

(assert (=> b!515981 (= lt!236206 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515982 () Bool)

(assert (=> b!515982 (= e!301193 (not e!301190))))

(declare-fun res!315548 () Bool)

(assert (=> b!515982 (=> res!315548 e!301190)))

(declare-fun lt!236209 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33046 (_ BitVec 32)) SeekEntryResult!4358)

(assert (=> b!515982 (= res!315548 (= lt!236207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236209 (select (store (arr!15891 a!3235) i!1204 k!2280) j!176) (array!33047 (store (arr!15891 a!3235) i!1204 k!2280) (size!16255 a!3235)) mask!3524)))))

(declare-fun lt!236205 () (_ BitVec 32))

(assert (=> b!515982 (= lt!236207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236205 (select (arr!15891 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515982 (= lt!236209 (toIndex!0 (select (store (arr!15891 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515982 (= lt!236205 (toIndex!0 (select (arr!15891 a!3235) j!176) mask!3524))))

(declare-fun e!301191 () Bool)

(assert (=> b!515982 e!301191))

(declare-fun res!315540 () Bool)

(assert (=> b!515982 (=> (not res!315540) (not e!301191))))

(assert (=> b!515982 (= res!315540 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15974 0))(
  ( (Unit!15975) )
))
(declare-fun lt!236208 () Unit!15974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15974)

(assert (=> b!515982 (= lt!236208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515983 () Bool)

(declare-fun res!315543 () Bool)

(assert (=> b!515983 (=> (not res!315543) (not e!301194))))

(assert (=> b!515983 (= res!315543 (validKeyInArray!0 (select (arr!15891 a!3235) j!176)))))

(declare-fun b!515984 () Bool)

(assert (=> b!515984 (= e!301191 (= (seekEntryOrOpen!0 (select (arr!15891 a!3235) j!176) a!3235 mask!3524) (Found!4358 j!176)))))

(assert (= (and start!46734 res!315545) b!515978))

(assert (= (and b!515978 res!315541) b!515983))

(assert (= (and b!515983 res!315543) b!515975))

(assert (= (and b!515975 res!315546) b!515976))

(assert (= (and b!515976 res!315544) b!515981))

(assert (= (and b!515981 res!315539) b!515980))

(assert (= (and b!515980 res!315542) b!515974))

(assert (= (and b!515974 res!315547) b!515982))

(assert (= (and b!515982 res!315540) b!515984))

(assert (= (and b!515982 (not res!315548)) b!515977))

(assert (= (and b!515977 (not res!315538)) b!515979))

(declare-fun m!497391 () Bool)

(assert (=> b!515976 m!497391))

(declare-fun m!497393 () Bool)

(assert (=> b!515975 m!497393))

(declare-fun m!497395 () Bool)

(assert (=> b!515981 m!497395))

(declare-fun m!497397 () Bool)

(assert (=> b!515974 m!497397))

(declare-fun m!497399 () Bool)

(assert (=> start!46734 m!497399))

(declare-fun m!497401 () Bool)

(assert (=> start!46734 m!497401))

(declare-fun m!497403 () Bool)

(assert (=> b!515983 m!497403))

(assert (=> b!515983 m!497403))

(declare-fun m!497405 () Bool)

(assert (=> b!515983 m!497405))

(declare-fun m!497407 () Bool)

(assert (=> b!515980 m!497407))

(assert (=> b!515984 m!497403))

(assert (=> b!515984 m!497403))

(declare-fun m!497409 () Bool)

(assert (=> b!515984 m!497409))

(declare-fun m!497411 () Bool)

(assert (=> b!515979 m!497411))

(assert (=> b!515979 m!497403))

(declare-fun m!497413 () Bool)

(assert (=> b!515982 m!497413))

(declare-fun m!497415 () Bool)

(assert (=> b!515982 m!497415))

(declare-fun m!497417 () Bool)

(assert (=> b!515982 m!497417))

(declare-fun m!497419 () Bool)

(assert (=> b!515982 m!497419))

(assert (=> b!515982 m!497403))

(declare-fun m!497421 () Bool)

(assert (=> b!515982 m!497421))

(assert (=> b!515982 m!497403))

(declare-fun m!497423 () Bool)

(assert (=> b!515982 m!497423))

(assert (=> b!515982 m!497417))

(declare-fun m!497425 () Bool)

(assert (=> b!515982 m!497425))

(assert (=> b!515982 m!497403))

(declare-fun m!497427 () Bool)

(assert (=> b!515982 m!497427))

(assert (=> b!515982 m!497417))

(push 1)

