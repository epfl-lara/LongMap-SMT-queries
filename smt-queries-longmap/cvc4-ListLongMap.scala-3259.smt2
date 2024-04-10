; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45430 () Bool)

(assert start!45430)

(declare-fun b!499638 () Bool)

(declare-datatypes ((Unit!14980 0))(
  ( (Unit!14981) )
))
(declare-fun e!292782 () Unit!14980)

(declare-fun Unit!14982 () Unit!14980)

(assert (=> b!499638 (= e!292782 Unit!14982)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32255 0))(
  ( (array!32256 (arr!15509 (Array (_ BitVec 32) (_ BitVec 64))) (size!15873 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32255)

(declare-fun lt!226581 () Unit!14980)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3976 0))(
  ( (MissingZero!3976 (index!18086 (_ BitVec 32))) (Found!3976 (index!18087 (_ BitVec 32))) (Intermediate!3976 (undefined!4788 Bool) (index!18088 (_ BitVec 32)) (x!47125 (_ BitVec 32))) (Undefined!3976) (MissingVacant!3976 (index!18089 (_ BitVec 32))) )
))
(declare-fun lt!226584 () SeekEntryResult!3976)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226588 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32255 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14980)

(assert (=> b!499638 (= lt!226581 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226588 #b00000000000000000000000000000000 (index!18088 lt!226584) (x!47125 lt!226584) mask!3524))))

(declare-fun lt!226583 () array!32255)

(declare-fun lt!226579 () (_ BitVec 64))

(declare-fun res!301576 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32255 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!499638 (= res!301576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226588 lt!226579 lt!226583 mask!3524) (Intermediate!3976 false (index!18088 lt!226584) (x!47125 lt!226584))))))

(declare-fun e!292775 () Bool)

(assert (=> b!499638 (=> (not res!301576) (not e!292775))))

(assert (=> b!499638 e!292775))

(declare-fun res!301574 () Bool)

(declare-fun e!292776 () Bool)

(assert (=> start!45430 (=> (not res!301574) (not e!292776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45430 (= res!301574 (validMask!0 mask!3524))))

(assert (=> start!45430 e!292776))

(assert (=> start!45430 true))

(declare-fun array_inv!11305 (array!32255) Bool)

(assert (=> start!45430 (array_inv!11305 a!3235)))

(declare-fun b!499639 () Bool)

(declare-fun res!301585 () Bool)

(declare-fun e!292778 () Bool)

(assert (=> b!499639 (=> (not res!301585) (not e!292778))))

(declare-datatypes ((List!9667 0))(
  ( (Nil!9664) (Cons!9663 (h!10537 (_ BitVec 64)) (t!15895 List!9667)) )
))
(declare-fun arrayNoDuplicates!0 (array!32255 (_ BitVec 32) List!9667) Bool)

(assert (=> b!499639 (= res!301585 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9664))))

(declare-fun b!499640 () Bool)

(declare-fun res!301579 () Bool)

(declare-fun e!292781 () Bool)

(assert (=> b!499640 (=> res!301579 e!292781)))

(assert (=> b!499640 (= res!301579 (or (undefined!4788 lt!226584) (not (is-Intermediate!3976 lt!226584))))))

(declare-fun b!499641 () Bool)

(declare-fun res!301577 () Bool)

(assert (=> b!499641 (=> (not res!301577) (not e!292776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499641 (= res!301577 (validKeyInArray!0 (select (arr!15509 a!3235) j!176)))))

(declare-fun b!499642 () Bool)

(assert (=> b!499642 (= e!292776 e!292778)))

(declare-fun res!301581 () Bool)

(assert (=> b!499642 (=> (not res!301581) (not e!292778))))

(declare-fun lt!226582 () SeekEntryResult!3976)

(assert (=> b!499642 (= res!301581 (or (= lt!226582 (MissingZero!3976 i!1204)) (= lt!226582 (MissingVacant!3976 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32255 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!499642 (= lt!226582 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499643 () Bool)

(declare-fun e!292777 () Bool)

(assert (=> b!499643 (= e!292777 (= (seekEntryOrOpen!0 (select (arr!15509 a!3235) j!176) a!3235 mask!3524) (Found!3976 j!176)))))

(declare-fun b!499644 () Bool)

(declare-fun res!301586 () Bool)

(assert (=> b!499644 (=> (not res!301586) (not e!292776))))

(assert (=> b!499644 (= res!301586 (and (= (size!15873 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15873 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15873 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499645 () Bool)

(declare-fun Unit!14983 () Unit!14980)

(assert (=> b!499645 (= e!292782 Unit!14983)))

(declare-fun b!499646 () Bool)

(assert (=> b!499646 (= e!292775 false)))

(declare-fun b!499647 () Bool)

(declare-fun res!301580 () Bool)

(assert (=> b!499647 (=> (not res!301580) (not e!292778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32255 (_ BitVec 32)) Bool)

(assert (=> b!499647 (= res!301580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499648 () Bool)

(declare-fun e!292780 () Bool)

(assert (=> b!499648 (= e!292780 true)))

(declare-fun lt!226580 () SeekEntryResult!3976)

(assert (=> b!499648 (= lt!226580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226588 lt!226579 lt!226583 mask!3524))))

(declare-fun b!499649 () Bool)

(assert (=> b!499649 (= e!292781 e!292780)))

(declare-fun res!301578 () Bool)

(assert (=> b!499649 (=> res!301578 e!292780)))

(assert (=> b!499649 (= res!301578 (or (bvsgt #b00000000000000000000000000000000 (x!47125 lt!226584)) (bvsgt (x!47125 lt!226584) #b01111111111111111111111111111110) (bvslt lt!226588 #b00000000000000000000000000000000) (bvsge lt!226588 (size!15873 a!3235)) (bvslt (index!18088 lt!226584) #b00000000000000000000000000000000) (bvsge (index!18088 lt!226584) (size!15873 a!3235)) (not (= lt!226584 (Intermediate!3976 false (index!18088 lt!226584) (x!47125 lt!226584))))))))

(assert (=> b!499649 (and (or (= (select (arr!15509 a!3235) (index!18088 lt!226584)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15509 a!3235) (index!18088 lt!226584)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15509 a!3235) (index!18088 lt!226584)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15509 a!3235) (index!18088 lt!226584)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226586 () Unit!14980)

(assert (=> b!499649 (= lt!226586 e!292782)))

(declare-fun c!59309 () Bool)

(assert (=> b!499649 (= c!59309 (= (select (arr!15509 a!3235) (index!18088 lt!226584)) (select (arr!15509 a!3235) j!176)))))

(assert (=> b!499649 (and (bvslt (x!47125 lt!226584) #b01111111111111111111111111111110) (or (= (select (arr!15509 a!3235) (index!18088 lt!226584)) (select (arr!15509 a!3235) j!176)) (= (select (arr!15509 a!3235) (index!18088 lt!226584)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15509 a!3235) (index!18088 lt!226584)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499650 () Bool)

(assert (=> b!499650 (= e!292778 (not e!292781))))

(declare-fun res!301582 () Bool)

(assert (=> b!499650 (=> res!301582 e!292781)))

(declare-fun lt!226587 () (_ BitVec 32))

(assert (=> b!499650 (= res!301582 (= lt!226584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226587 lt!226579 lt!226583 mask!3524)))))

(assert (=> b!499650 (= lt!226584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226588 (select (arr!15509 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499650 (= lt!226587 (toIndex!0 lt!226579 mask!3524))))

(assert (=> b!499650 (= lt!226579 (select (store (arr!15509 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499650 (= lt!226588 (toIndex!0 (select (arr!15509 a!3235) j!176) mask!3524))))

(assert (=> b!499650 (= lt!226583 (array!32256 (store (arr!15509 a!3235) i!1204 k!2280) (size!15873 a!3235)))))

(assert (=> b!499650 e!292777))

(declare-fun res!301583 () Bool)

(assert (=> b!499650 (=> (not res!301583) (not e!292777))))

(assert (=> b!499650 (= res!301583 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226585 () Unit!14980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14980)

(assert (=> b!499650 (= lt!226585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499651 () Bool)

(declare-fun res!301575 () Bool)

(assert (=> b!499651 (=> (not res!301575) (not e!292776))))

(declare-fun arrayContainsKey!0 (array!32255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499651 (= res!301575 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499652 () Bool)

(declare-fun res!301584 () Bool)

(assert (=> b!499652 (=> (not res!301584) (not e!292776))))

(assert (=> b!499652 (= res!301584 (validKeyInArray!0 k!2280))))

(assert (= (and start!45430 res!301574) b!499644))

(assert (= (and b!499644 res!301586) b!499641))

(assert (= (and b!499641 res!301577) b!499652))

(assert (= (and b!499652 res!301584) b!499651))

(assert (= (and b!499651 res!301575) b!499642))

(assert (= (and b!499642 res!301581) b!499647))

(assert (= (and b!499647 res!301580) b!499639))

(assert (= (and b!499639 res!301585) b!499650))

(assert (= (and b!499650 res!301583) b!499643))

(assert (= (and b!499650 (not res!301582)) b!499640))

(assert (= (and b!499640 (not res!301579)) b!499649))

(assert (= (and b!499649 c!59309) b!499638))

(assert (= (and b!499649 (not c!59309)) b!499645))

(assert (= (and b!499638 res!301576) b!499646))

(assert (= (and b!499649 (not res!301578)) b!499648))

(declare-fun m!480825 () Bool)

(assert (=> b!499641 m!480825))

(assert (=> b!499641 m!480825))

(declare-fun m!480827 () Bool)

(assert (=> b!499641 m!480827))

(declare-fun m!480829 () Bool)

(assert (=> b!499639 m!480829))

(declare-fun m!480831 () Bool)

(assert (=> b!499647 m!480831))

(declare-fun m!480833 () Bool)

(assert (=> start!45430 m!480833))

(declare-fun m!480835 () Bool)

(assert (=> start!45430 m!480835))

(declare-fun m!480837 () Bool)

(assert (=> b!499650 m!480837))

(declare-fun m!480839 () Bool)

(assert (=> b!499650 m!480839))

(assert (=> b!499650 m!480825))

(declare-fun m!480841 () Bool)

(assert (=> b!499650 m!480841))

(assert (=> b!499650 m!480825))

(declare-fun m!480843 () Bool)

(assert (=> b!499650 m!480843))

(declare-fun m!480845 () Bool)

(assert (=> b!499650 m!480845))

(declare-fun m!480847 () Bool)

(assert (=> b!499650 m!480847))

(assert (=> b!499650 m!480825))

(declare-fun m!480849 () Bool)

(assert (=> b!499650 m!480849))

(declare-fun m!480851 () Bool)

(assert (=> b!499650 m!480851))

(assert (=> b!499643 m!480825))

(assert (=> b!499643 m!480825))

(declare-fun m!480853 () Bool)

(assert (=> b!499643 m!480853))

(declare-fun m!480855 () Bool)

(assert (=> b!499648 m!480855))

(declare-fun m!480857 () Bool)

(assert (=> b!499642 m!480857))

(declare-fun m!480859 () Bool)

(assert (=> b!499649 m!480859))

(assert (=> b!499649 m!480825))

(declare-fun m!480861 () Bool)

(assert (=> b!499652 m!480861))

(declare-fun m!480863 () Bool)

(assert (=> b!499638 m!480863))

(assert (=> b!499638 m!480855))

(declare-fun m!480865 () Bool)

(assert (=> b!499651 m!480865))

(push 1)

