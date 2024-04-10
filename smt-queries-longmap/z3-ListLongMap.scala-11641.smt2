; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135878 () Bool)

(assert start!135878)

(declare-fun res!1076484 () Bool)

(declare-fun e!878686 () Bool)

(assert (=> start!135878 (=> (not res!1076484) (not e!878686))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135878 (= res!1076484 (validMask!0 mask!898))))

(assert (=> start!135878 e!878686))

(assert (=> start!135878 true))

(declare-datatypes ((array!105410 0))(
  ( (array!105411 (arr!50843 (Array (_ BitVec 32) (_ BitVec 64))) (size!51393 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105410)

(declare-fun array_inv!39570 (array!105410) Bool)

(assert (=> start!135878 (array_inv!39570 _keys!605)))

(declare-fun b!1575442 () Bool)

(declare-fun res!1076482 () Bool)

(assert (=> b!1575442 (=> (not res!1076482) (not e!878686))))

(assert (=> b!1575442 (= res!1076482 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51393 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575443 () Bool)

(declare-fun res!1076483 () Bool)

(assert (=> b!1575443 (=> (not res!1076483) (not e!878686))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575443 (= res!1076483 (validKeyInArray!0 k0!761))))

(declare-fun b!1575444 () Bool)

(assert (=> b!1575444 (= e!878686 false)))

(declare-datatypes ((SeekEntryResult!13708 0))(
  ( (MissingZero!13708 (index!57230 (_ BitVec 32))) (Found!13708 (index!57231 (_ BitVec 32))) (Intermediate!13708 (undefined!14520 Bool) (index!57232 (_ BitVec 32)) (x!142192 (_ BitVec 32))) (Undefined!13708) (MissingVacant!13708 (index!57233 (_ BitVec 32))) )
))
(declare-fun lt!675196 () SeekEntryResult!13708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105410 (_ BitVec 32)) SeekEntryResult!13708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575444 (= lt!675196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135878 res!1076484) b!1575442))

(assert (= (and b!1575442 res!1076482) b!1575443))

(assert (= (and b!1575443 res!1076483) b!1575444))

(declare-fun m!1448459 () Bool)

(assert (=> start!135878 m!1448459))

(declare-fun m!1448461 () Bool)

(assert (=> start!135878 m!1448461))

(declare-fun m!1448463 () Bool)

(assert (=> b!1575443 m!1448463))

(declare-fun m!1448465 () Bool)

(assert (=> b!1575444 m!1448465))

(assert (=> b!1575444 m!1448465))

(declare-fun m!1448467 () Bool)

(assert (=> b!1575444 m!1448467))

(check-sat (not b!1575444) (not start!135878) (not b!1575443))
(check-sat)
