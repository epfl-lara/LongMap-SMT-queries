; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135632 () Bool)

(assert start!135632)

(declare-fun res!1075900 () Bool)

(declare-fun e!878173 () Bool)

(assert (=> start!135632 (=> (not res!1075900) (not e!878173))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135632 (= res!1075900 (validMask!0 mask!898))))

(assert (=> start!135632 e!878173))

(assert (=> start!135632 true))

(declare-datatypes ((array!105299 0))(
  ( (array!105300 (arr!50795 (Array (_ BitVec 32) (_ BitVec 64))) (size!51345 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105299)

(declare-fun array_inv!39522 (array!105299) Bool)

(assert (=> start!135632 (array_inv!39522 _keys!605)))

(declare-fun b!1574605 () Bool)

(declare-fun res!1075901 () Bool)

(assert (=> b!1574605 (=> (not res!1075901) (not e!878173))))

(assert (=> b!1574605 (= res!1075901 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51345 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574606 () Bool)

(declare-fun res!1075902 () Bool)

(assert (=> b!1574606 (=> (not res!1075902) (not e!878173))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574606 (= res!1075902 (validKeyInArray!0 k0!761))))

(declare-fun b!1574607 () Bool)

(assert (=> b!1574607 (= e!878173 false)))

(declare-datatypes ((SeekEntryResult!13660 0))(
  ( (MissingZero!13660 (index!57038 (_ BitVec 32))) (Found!13660 (index!57039 (_ BitVec 32))) (Intermediate!13660 (undefined!14472 Bool) (index!57040 (_ BitVec 32)) (x!141986 (_ BitVec 32))) (Undefined!13660) (MissingVacant!13660 (index!57041 (_ BitVec 32))) )
))
(declare-fun lt!674872 () SeekEntryResult!13660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105299 (_ BitVec 32)) SeekEntryResult!13660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574607 (= lt!674872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135632 res!1075900) b!1574605))

(assert (= (and b!1574605 res!1075901) b!1574606))

(assert (= (and b!1574606 res!1075902) b!1574607))

(declare-fun m!1447835 () Bool)

(assert (=> start!135632 m!1447835))

(declare-fun m!1447837 () Bool)

(assert (=> start!135632 m!1447837))

(declare-fun m!1447839 () Bool)

(assert (=> b!1574606 m!1447839))

(declare-fun m!1447841 () Bool)

(assert (=> b!1574607 m!1447841))

(assert (=> b!1574607 m!1447841))

(declare-fun m!1447843 () Bool)

(assert (=> b!1574607 m!1447843))

(check-sat (not b!1574607) (not start!135632) (not b!1574606))
