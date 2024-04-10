; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135076 () Bool)

(assert start!135076)

(declare-fun res!1074505 () Bool)

(declare-fun e!876932 () Bool)

(assert (=> start!135076 (=> (not res!1074505) (not e!876932))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135076 (= res!1074505 (validMask!0 mask!889))))

(assert (=> start!135076 e!876932))

(assert (=> start!135076 true))

(declare-datatypes ((array!105038 0))(
  ( (array!105039 (arr!50681 (Array (_ BitVec 32) (_ BitVec 64))) (size!51231 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105038)

(declare-fun array_inv!39408 (array!105038) Bool)

(assert (=> start!135076 (array_inv!39408 _keys!600)))

(declare-fun b!1572643 () Bool)

(declare-fun res!1074507 () Bool)

(assert (=> b!1572643 (=> (not res!1074507) (not e!876932))))

(assert (=> b!1572643 (= res!1074507 (= (size!51231 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572644 () Bool)

(declare-fun res!1074506 () Bool)

(assert (=> b!1572644 (=> (not res!1074506) (not e!876932))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572644 (= res!1074506 (validKeyInArray!0 k0!754))))

(declare-fun b!1572645 () Bool)

(assert (=> b!1572645 (= e!876932 false)))

(declare-datatypes ((SeekEntryResult!13594 0))(
  ( (MissingZero!13594 (index!56774 (_ BitVec 32))) (Found!13594 (index!56775 (_ BitVec 32))) (Intermediate!13594 (undefined!14406 Bool) (index!56776 (_ BitVec 32)) (x!141556 (_ BitVec 32))) (Undefined!13594) (MissingVacant!13594 (index!56777 (_ BitVec 32))) )
))
(declare-fun lt!674071 () SeekEntryResult!13594)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105038 (_ BitVec 32)) SeekEntryResult!13594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572645 (= lt!674071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135076 res!1074505) b!1572643))

(assert (= (and b!1572643 res!1074507) b!1572644))

(assert (= (and b!1572644 res!1074506) b!1572645))

(declare-fun m!1446311 () Bool)

(assert (=> start!135076 m!1446311))

(declare-fun m!1446313 () Bool)

(assert (=> start!135076 m!1446313))

(declare-fun m!1446315 () Bool)

(assert (=> b!1572644 m!1446315))

(declare-fun m!1446317 () Bool)

(assert (=> b!1572645 m!1446317))

(assert (=> b!1572645 m!1446317))

(declare-fun m!1446319 () Bool)

(assert (=> b!1572645 m!1446319))

(check-sat (not start!135076) (not b!1572645) (not b!1572644))
(check-sat)
