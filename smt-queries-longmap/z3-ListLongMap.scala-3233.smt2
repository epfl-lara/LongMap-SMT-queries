; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45194 () Bool)

(assert start!45194)

(declare-fun b!496128 () Bool)

(declare-fun res!298578 () Bool)

(declare-fun e!290973 () Bool)

(assert (=> b!496128 (=> res!298578 e!290973)))

(declare-datatypes ((SeekEntryResult!3847 0))(
  ( (MissingZero!3847 (index!17567 (_ BitVec 32))) (Found!3847 (index!17568 (_ BitVec 32))) (Intermediate!3847 (undefined!4659 Bool) (index!17569 (_ BitVec 32)) (x!46776 (_ BitVec 32))) (Undefined!3847) (MissingVacant!3847 (index!17570 (_ BitVec 32))) )
))
(declare-fun lt!224642 () SeekEntryResult!3847)

(get-info :version)

(assert (=> b!496128 (= res!298578 (or (undefined!4659 lt!224642) (not ((_ is Intermediate!3847) lt!224642))))))

(declare-fun b!496129 () Bool)

(declare-fun res!298572 () Bool)

(declare-fun e!290970 () Bool)

(assert (=> b!496129 (=> (not res!298572) (not e!290970))))

(declare-datatypes ((array!32083 0))(
  ( (array!32084 (arr!15424 (Array (_ BitVec 32) (_ BitVec 64))) (size!15788 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32083)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496129 (= res!298572 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496130 () Bool)

(declare-fun e!290971 () Bool)

(assert (=> b!496130 (= e!290970 e!290971)))

(declare-fun res!298569 () Bool)

(assert (=> b!496130 (=> (not res!298569) (not e!290971))))

(declare-fun lt!224644 () SeekEntryResult!3847)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496130 (= res!298569 (or (= lt!224644 (MissingZero!3847 i!1204)) (= lt!224644 (MissingVacant!3847 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32083 (_ BitVec 32)) SeekEntryResult!3847)

(assert (=> b!496130 (= lt!224644 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496131 () Bool)

(declare-fun e!290972 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496131 (= e!290972 (= (seekEntryOrOpen!0 (select (arr!15424 a!3235) j!176) a!3235 mask!3524) (Found!3847 j!176)))))

(declare-fun b!496132 () Bool)

(declare-fun res!298570 () Bool)

(assert (=> b!496132 (=> (not res!298570) (not e!290970))))

(assert (=> b!496132 (= res!298570 (and (= (size!15788 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15788 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15788 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496133 () Bool)

(assert (=> b!496133 (= e!290971 (not e!290973))))

(declare-fun res!298571 () Bool)

(assert (=> b!496133 (=> res!298571 e!290973)))

(declare-fun lt!224641 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32083 (_ BitVec 32)) SeekEntryResult!3847)

(assert (=> b!496133 (= res!298571 (= lt!224642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224641 (select (store (arr!15424 a!3235) i!1204 k0!2280) j!176) (array!32084 (store (arr!15424 a!3235) i!1204 k0!2280) (size!15788 a!3235)) mask!3524)))))

(declare-fun lt!224643 () (_ BitVec 32))

(assert (=> b!496133 (= lt!224642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224643 (select (arr!15424 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496133 (= lt!224641 (toIndex!0 (select (store (arr!15424 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496133 (= lt!224643 (toIndex!0 (select (arr!15424 a!3235) j!176) mask!3524))))

(assert (=> b!496133 e!290972))

(declare-fun res!298577 () Bool)

(assert (=> b!496133 (=> (not res!298577) (not e!290972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32083 (_ BitVec 32)) Bool)

(assert (=> b!496133 (= res!298577 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14701 0))(
  ( (Unit!14702) )
))
(declare-fun lt!224640 () Unit!14701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14701)

(assert (=> b!496133 (= lt!224640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496134 () Bool)

(declare-fun res!298573 () Bool)

(assert (=> b!496134 (=> (not res!298573) (not e!290971))))

(assert (=> b!496134 (= res!298573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!298579 () Bool)

(assert (=> start!45194 (=> (not res!298579) (not e!290970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45194 (= res!298579 (validMask!0 mask!3524))))

(assert (=> start!45194 e!290970))

(assert (=> start!45194 true))

(declare-fun array_inv!11283 (array!32083) Bool)

(assert (=> start!45194 (array_inv!11283 a!3235)))

(declare-fun b!496135 () Bool)

(assert (=> b!496135 (= e!290973 true)))

(assert (=> b!496135 (and (bvslt (x!46776 lt!224642) #b01111111111111111111111111111110) (or (= (select (arr!15424 a!3235) (index!17569 lt!224642)) (select (arr!15424 a!3235) j!176)) (= (select (arr!15424 a!3235) (index!17569 lt!224642)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15424 a!3235) (index!17569 lt!224642)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496136 () Bool)

(declare-fun res!298575 () Bool)

(assert (=> b!496136 (=> (not res!298575) (not e!290971))))

(declare-datatypes ((List!9489 0))(
  ( (Nil!9486) (Cons!9485 (h!10356 (_ BitVec 64)) (t!15709 List!9489)) )
))
(declare-fun arrayNoDuplicates!0 (array!32083 (_ BitVec 32) List!9489) Bool)

(assert (=> b!496136 (= res!298575 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9486))))

(declare-fun b!496137 () Bool)

(declare-fun res!298576 () Bool)

(assert (=> b!496137 (=> (not res!298576) (not e!290970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496137 (= res!298576 (validKeyInArray!0 (select (arr!15424 a!3235) j!176)))))

(declare-fun b!496138 () Bool)

(declare-fun res!298574 () Bool)

(assert (=> b!496138 (=> (not res!298574) (not e!290970))))

(assert (=> b!496138 (= res!298574 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45194 res!298579) b!496132))

(assert (= (and b!496132 res!298570) b!496137))

(assert (= (and b!496137 res!298576) b!496138))

(assert (= (and b!496138 res!298574) b!496129))

(assert (= (and b!496129 res!298572) b!496130))

(assert (= (and b!496130 res!298569) b!496134))

(assert (= (and b!496134 res!298573) b!496136))

(assert (= (and b!496136 res!298575) b!496133))

(assert (= (and b!496133 res!298577) b!496131))

(assert (= (and b!496133 (not res!298571)) b!496128))

(assert (= (and b!496128 (not res!298578)) b!496135))

(declare-fun m!477571 () Bool)

(assert (=> b!496135 m!477571))

(declare-fun m!477573 () Bool)

(assert (=> b!496135 m!477573))

(declare-fun m!477575 () Bool)

(assert (=> b!496136 m!477575))

(declare-fun m!477577 () Bool)

(assert (=> b!496133 m!477577))

(declare-fun m!477579 () Bool)

(assert (=> b!496133 m!477579))

(declare-fun m!477581 () Bool)

(assert (=> b!496133 m!477581))

(assert (=> b!496133 m!477573))

(declare-fun m!477583 () Bool)

(assert (=> b!496133 m!477583))

(assert (=> b!496133 m!477573))

(declare-fun m!477585 () Bool)

(assert (=> b!496133 m!477585))

(assert (=> b!496133 m!477573))

(declare-fun m!477587 () Bool)

(assert (=> b!496133 m!477587))

(assert (=> b!496133 m!477581))

(declare-fun m!477589 () Bool)

(assert (=> b!496133 m!477589))

(assert (=> b!496133 m!477581))

(declare-fun m!477591 () Bool)

(assert (=> b!496133 m!477591))

(declare-fun m!477593 () Bool)

(assert (=> b!496130 m!477593))

(assert (=> b!496131 m!477573))

(assert (=> b!496131 m!477573))

(declare-fun m!477595 () Bool)

(assert (=> b!496131 m!477595))

(declare-fun m!477597 () Bool)

(assert (=> b!496134 m!477597))

(declare-fun m!477599 () Bool)

(assert (=> b!496129 m!477599))

(declare-fun m!477601 () Bool)

(assert (=> b!496138 m!477601))

(assert (=> b!496137 m!477573))

(assert (=> b!496137 m!477573))

(declare-fun m!477603 () Bool)

(assert (=> b!496137 m!477603))

(declare-fun m!477605 () Bool)

(assert (=> start!45194 m!477605))

(declare-fun m!477607 () Bool)

(assert (=> start!45194 m!477607))

(check-sat (not b!496137) (not b!496134) (not b!496136) (not b!496131) (not b!496129) (not b!496130) (not b!496138) (not start!45194) (not b!496133))
(check-sat)
