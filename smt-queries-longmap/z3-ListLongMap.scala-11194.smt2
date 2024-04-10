; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130798 () Bool)

(assert start!130798)

(declare-fun b!1533977 () Bool)

(declare-fun res!1051069 () Bool)

(declare-fun e!854373 () Bool)

(assert (=> b!1533977 (=> (not res!1051069) (not e!854373))))

(declare-datatypes ((array!101896 0))(
  ( (array!101897 (arr!49164 (Array (_ BitVec 32) (_ BitVec 64))) (size!49714 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101896)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533977 (= res!1051069 (and (= (size!49714 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49714 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49714 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533978 () Bool)

(assert (=> b!1533978 (= e!854373 false)))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13296 0))(
  ( (MissingZero!13296 (index!55579 (_ BitVec 32))) (Found!13296 (index!55580 (_ BitVec 32))) (Intermediate!13296 (undefined!14108 Bool) (index!55581 (_ BitVec 32)) (x!137346 (_ BitVec 32))) (Undefined!13296) (MissingVacant!13296 (index!55582 (_ BitVec 32))) )
))
(declare-fun lt!663826 () SeekEntryResult!13296)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101896 (_ BitVec 32)) SeekEntryResult!13296)

(assert (=> b!1533978 (= lt!663826 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49164 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533979 () Bool)

(declare-fun res!1051068 () Bool)

(assert (=> b!1533979 (=> (not res!1051068) (not e!854373))))

(assert (=> b!1533979 (= res!1051068 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49714 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49714 a!2792)) (= (select (arr!49164 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533980 () Bool)

(declare-fun res!1051063 () Bool)

(assert (=> b!1533980 (=> (not res!1051063) (not e!854373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533980 (= res!1051063 (validKeyInArray!0 (select (arr!49164 a!2792) i!951)))))

(declare-fun res!1051065 () Bool)

(assert (=> start!130798 (=> (not res!1051065) (not e!854373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130798 (= res!1051065 (validMask!0 mask!2480))))

(assert (=> start!130798 e!854373))

(assert (=> start!130798 true))

(declare-fun array_inv!38192 (array!101896) Bool)

(assert (=> start!130798 (array_inv!38192 a!2792)))

(declare-fun b!1533981 () Bool)

(declare-fun res!1051067 () Bool)

(assert (=> b!1533981 (=> (not res!1051067) (not e!854373))))

(assert (=> b!1533981 (= res!1051067 (validKeyInArray!0 (select (arr!49164 a!2792) j!64)))))

(declare-fun b!1533982 () Bool)

(declare-fun res!1051064 () Bool)

(assert (=> b!1533982 (=> (not res!1051064) (not e!854373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101896 (_ BitVec 32)) Bool)

(assert (=> b!1533982 (= res!1051064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533983 () Bool)

(declare-fun res!1051066 () Bool)

(assert (=> b!1533983 (=> (not res!1051066) (not e!854373))))

(declare-datatypes ((List!35638 0))(
  ( (Nil!35635) (Cons!35634 (h!37079 (_ BitVec 64)) (t!50332 List!35638)) )
))
(declare-fun arrayNoDuplicates!0 (array!101896 (_ BitVec 32) List!35638) Bool)

(assert (=> b!1533983 (= res!1051066 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35635))))

(assert (= (and start!130798 res!1051065) b!1533977))

(assert (= (and b!1533977 res!1051069) b!1533980))

(assert (= (and b!1533980 res!1051063) b!1533981))

(assert (= (and b!1533981 res!1051067) b!1533982))

(assert (= (and b!1533982 res!1051064) b!1533983))

(assert (= (and b!1533983 res!1051066) b!1533979))

(assert (= (and b!1533979 res!1051068) b!1533978))

(declare-fun m!1416659 () Bool)

(assert (=> start!130798 m!1416659))

(declare-fun m!1416661 () Bool)

(assert (=> start!130798 m!1416661))

(declare-fun m!1416663 () Bool)

(assert (=> b!1533978 m!1416663))

(assert (=> b!1533978 m!1416663))

(declare-fun m!1416665 () Bool)

(assert (=> b!1533978 m!1416665))

(declare-fun m!1416667 () Bool)

(assert (=> b!1533980 m!1416667))

(assert (=> b!1533980 m!1416667))

(declare-fun m!1416669 () Bool)

(assert (=> b!1533980 m!1416669))

(assert (=> b!1533981 m!1416663))

(assert (=> b!1533981 m!1416663))

(declare-fun m!1416671 () Bool)

(assert (=> b!1533981 m!1416671))

(declare-fun m!1416673 () Bool)

(assert (=> b!1533979 m!1416673))

(declare-fun m!1416675 () Bool)

(assert (=> b!1533982 m!1416675))

(declare-fun m!1416677 () Bool)

(assert (=> b!1533983 m!1416677))

(check-sat (not b!1533983) (not b!1533980) (not b!1533978) (not b!1533982) (not b!1533981) (not start!130798))
