; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31924 () Bool)

(assert start!31924)

(declare-fun b!318990 () Bool)

(declare-fun res!173377 () Bool)

(declare-fun e!198171 () Bool)

(assert (=> b!318990 (=> (not res!173377) (not e!198171))))

(declare-datatypes ((array!16244 0))(
  ( (array!16245 (arr!7686 (Array (_ BitVec 32) (_ BitVec 64))) (size!8038 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16244)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!318990 (= res!173377 (and (= (size!8038 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8038 a!3293))))))

(declare-fun b!318991 () Bool)

(declare-fun res!173380 () Bool)

(assert (=> b!318991 (=> (not res!173380) (not e!198171))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318991 (= res!173380 (validKeyInArray!0 k0!2441))))

(declare-fun b!318992 () Bool)

(declare-fun res!173374 () Bool)

(assert (=> b!318992 (=> (not res!173374) (not e!198171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16244 (_ BitVec 32)) Bool)

(assert (=> b!318992 (= res!173374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318993 () Bool)

(declare-fun e!198170 () Bool)

(declare-fun e!198168 () Bool)

(assert (=> b!318993 (= e!198170 e!198168)))

(declare-fun res!173381 () Bool)

(assert (=> b!318993 (=> (not res!173381) (not e!198168))))

(declare-datatypes ((SeekEntryResult!2826 0))(
  ( (MissingZero!2826 (index!13480 (_ BitVec 32))) (Found!2826 (index!13481 (_ BitVec 32))) (Intermediate!2826 (undefined!3638 Bool) (index!13482 (_ BitVec 32)) (x!31740 (_ BitVec 32))) (Undefined!2826) (MissingVacant!2826 (index!13483 (_ BitVec 32))) )
))
(declare-fun lt!155581 () SeekEntryResult!2826)

(declare-fun lt!155579 () SeekEntryResult!2826)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318993 (= res!173381 (and (= lt!155581 lt!155579) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7686 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16244 (_ BitVec 32)) SeekEntryResult!2826)

(assert (=> b!318993 (= lt!155581 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun lt!155583 () SeekEntryResult!2826)

(declare-fun b!318994 () Bool)

(declare-fun lt!155582 () (_ BitVec 32))

(assert (=> b!318994 (= e!198168 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155582 #b00000000000000000000000000000000) (bvsge lt!155582 (size!8038 a!3293)) (= lt!155583 lt!155579))))))

(declare-fun e!198172 () Bool)

(assert (=> b!318994 e!198172))

(declare-fun res!173382 () Bool)

(assert (=> b!318994 (=> (not res!173382) (not e!198172))))

(assert (=> b!318994 (= res!173382 (= lt!155581 lt!155583))))

(assert (=> b!318994 (= lt!155583 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155582 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318994 (= lt!155582 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318995 () Bool)

(assert (=> b!318995 (= e!198171 e!198170)))

(declare-fun res!173378 () Bool)

(assert (=> b!318995 (=> (not res!173378) (not e!198170))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318995 (= res!173378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155579))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318995 (= lt!155579 (Intermediate!2826 false resIndex!52 resX!52))))

(declare-fun b!318996 () Bool)

(declare-fun res!173375 () Bool)

(assert (=> b!318996 (=> (not res!173375) (not e!198171))))

(declare-fun arrayContainsKey!0 (array!16244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318996 (= res!173375 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318997 () Bool)

(declare-fun res!173379 () Bool)

(assert (=> b!318997 (=> (not res!173379) (not e!198170))))

(assert (=> b!318997 (= res!173379 (and (= (select (arr!7686 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8038 a!3293))))))

(declare-fun b!318998 () Bool)

(declare-fun res!173373 () Bool)

(assert (=> b!318998 (=> (not res!173373) (not e!198171))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16244 (_ BitVec 32)) SeekEntryResult!2826)

(assert (=> b!318998 (= res!173373 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2826 i!1240)))))

(declare-fun lt!155580 () array!16244)

(declare-fun b!318989 () Bool)

(assert (=> b!318989 (= e!198172 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155580 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155582 k0!2441 lt!155580 mask!3709)))))

(assert (=> b!318989 (= lt!155580 (array!16245 (store (arr!7686 a!3293) i!1240 k0!2441) (size!8038 a!3293)))))

(declare-fun res!173376 () Bool)

(assert (=> start!31924 (=> (not res!173376) (not e!198171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31924 (= res!173376 (validMask!0 mask!3709))))

(assert (=> start!31924 e!198171))

(declare-fun array_inv!5649 (array!16244) Bool)

(assert (=> start!31924 (array_inv!5649 a!3293)))

(assert (=> start!31924 true))

(assert (= (and start!31924 res!173376) b!318990))

(assert (= (and b!318990 res!173377) b!318991))

(assert (= (and b!318991 res!173380) b!318996))

(assert (= (and b!318996 res!173375) b!318998))

(assert (= (and b!318998 res!173373) b!318992))

(assert (= (and b!318992 res!173374) b!318995))

(assert (= (and b!318995 res!173378) b!318997))

(assert (= (and b!318997 res!173379) b!318993))

(assert (= (and b!318993 res!173381) b!318994))

(assert (= (and b!318994 res!173382) b!318989))

(declare-fun m!327583 () Bool)

(assert (=> b!318991 m!327583))

(declare-fun m!327585 () Bool)

(assert (=> b!318996 m!327585))

(declare-fun m!327587 () Bool)

(assert (=> b!318997 m!327587))

(declare-fun m!327589 () Bool)

(assert (=> b!318993 m!327589))

(declare-fun m!327591 () Bool)

(assert (=> b!318993 m!327591))

(declare-fun m!327593 () Bool)

(assert (=> b!318994 m!327593))

(declare-fun m!327595 () Bool)

(assert (=> b!318994 m!327595))

(declare-fun m!327597 () Bool)

(assert (=> b!318998 m!327597))

(declare-fun m!327599 () Bool)

(assert (=> start!31924 m!327599))

(declare-fun m!327601 () Bool)

(assert (=> start!31924 m!327601))

(declare-fun m!327603 () Bool)

(assert (=> b!318995 m!327603))

(assert (=> b!318995 m!327603))

(declare-fun m!327605 () Bool)

(assert (=> b!318995 m!327605))

(declare-fun m!327607 () Bool)

(assert (=> b!318992 m!327607))

(declare-fun m!327609 () Bool)

(assert (=> b!318989 m!327609))

(declare-fun m!327611 () Bool)

(assert (=> b!318989 m!327611))

(declare-fun m!327613 () Bool)

(assert (=> b!318989 m!327613))

(check-sat (not start!31924) (not b!318991) (not b!318994) (not b!318995) (not b!318996) (not b!318992) (not b!318993) (not b!318998) (not b!318989))
(check-sat)
