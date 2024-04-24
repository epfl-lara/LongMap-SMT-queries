; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132290 () Bool)

(assert start!132290)

(declare-fun mapNonEmpty!58504 () Bool)

(declare-fun mapRes!58504 () Bool)

(declare-fun tp!111031 () Bool)

(declare-fun e!860821 () Bool)

(assert (=> mapNonEmpty!58504 (= mapRes!58504 (and tp!111031 e!860821))))

(declare-fun mapKey!58504 () (_ BitVec 32))

(declare-datatypes ((V!58933 0))(
  ( (V!58934 (val!19011 Int)) )
))
(declare-datatypes ((ValueCell!18023 0))(
  ( (ValueCellFull!18023 (v!21804 V!58933)) (EmptyCell!18023) )
))
(declare-datatypes ((array!103068 0))(
  ( (array!103069 (arr!49729 (Array (_ BitVec 32) ValueCell!18023)) (size!50280 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103068)

(declare-fun mapValue!58504 () ValueCell!18023)

(declare-fun mapRest!58504 () (Array (_ BitVec 32) ValueCell!18023))

(assert (=> mapNonEmpty!58504 (= (arr!49729 _values!470) (store mapRest!58504 mapKey!58504 mapValue!58504))))

(declare-fun b!1546293 () Bool)

(declare-fun e!860823 () Bool)

(declare-fun tp_is_empty!37867 () Bool)

(assert (=> b!1546293 (= e!860823 tp_is_empty!37867)))

(declare-fun b!1546294 () Bool)

(declare-fun res!1060064 () Bool)

(declare-fun e!860822 () Bool)

(assert (=> b!1546294 (=> (not res!1060064) (not e!860822))))

(declare-datatypes ((array!103070 0))(
  ( (array!103071 (arr!49730 (Array (_ BitVec 32) (_ BitVec 64))) (size!50281 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103070)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1546294 (= res!1060064 (and (= (size!50280 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50281 _keys!618) (size!50280 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546295 () Bool)

(assert (=> b!1546295 (= e!860821 tp_is_empty!37867)))

(declare-fun b!1546296 () Bool)

(declare-fun e!860820 () Bool)

(assert (=> b!1546296 (= e!860820 (and e!860823 mapRes!58504))))

(declare-fun condMapEmpty!58504 () Bool)

(declare-fun mapDefault!58504 () ValueCell!18023)

(assert (=> b!1546296 (= condMapEmpty!58504 (= (arr!49729 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18023)) mapDefault!58504)))))

(declare-fun b!1546297 () Bool)

(declare-fun res!1060063 () Bool)

(assert (=> b!1546297 (=> (not res!1060063) (not e!860822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103070 (_ BitVec 32)) Bool)

(assert (=> b!1546297 (= res!1060063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546298 () Bool)

(assert (=> b!1546298 (= e!860822 false)))

(declare-fun lt!666961 () Bool)

(declare-datatypes ((List!35971 0))(
  ( (Nil!35968) (Cons!35967 (h!37430 (_ BitVec 64)) (t!50657 List!35971)) )
))
(declare-fun arrayNoDuplicates!0 (array!103070 (_ BitVec 32) List!35971) Bool)

(assert (=> b!1546298 (= lt!666961 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35968))))

(declare-fun mapIsEmpty!58504 () Bool)

(assert (=> mapIsEmpty!58504 mapRes!58504))

(declare-fun res!1060062 () Bool)

(assert (=> start!132290 (=> (not res!1060062) (not e!860822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132290 (= res!1060062 (validMask!0 mask!926))))

(assert (=> start!132290 e!860822))

(assert (=> start!132290 true))

(declare-fun array_inv!38947 (array!103068) Bool)

(assert (=> start!132290 (and (array_inv!38947 _values!470) e!860820)))

(declare-fun array_inv!38948 (array!103070) Bool)

(assert (=> start!132290 (array_inv!38948 _keys!618)))

(assert (= (and start!132290 res!1060062) b!1546294))

(assert (= (and b!1546294 res!1060064) b!1546297))

(assert (= (and b!1546297 res!1060063) b!1546298))

(assert (= (and b!1546296 condMapEmpty!58504) mapIsEmpty!58504))

(assert (= (and b!1546296 (not condMapEmpty!58504)) mapNonEmpty!58504))

(get-info :version)

(assert (= (and mapNonEmpty!58504 ((_ is ValueCellFull!18023) mapValue!58504)) b!1546295))

(assert (= (and b!1546296 ((_ is ValueCellFull!18023) mapDefault!58504)) b!1546293))

(assert (= start!132290 b!1546296))

(declare-fun m!1427283 () Bool)

(assert (=> mapNonEmpty!58504 m!1427283))

(declare-fun m!1427285 () Bool)

(assert (=> b!1546297 m!1427285))

(declare-fun m!1427287 () Bool)

(assert (=> b!1546298 m!1427287))

(declare-fun m!1427289 () Bool)

(assert (=> start!132290 m!1427289))

(declare-fun m!1427291 () Bool)

(assert (=> start!132290 m!1427291))

(declare-fun m!1427293 () Bool)

(assert (=> start!132290 m!1427293))

(check-sat (not b!1546298) tp_is_empty!37867 (not mapNonEmpty!58504) (not start!132290) (not b!1546297))
(check-sat)
