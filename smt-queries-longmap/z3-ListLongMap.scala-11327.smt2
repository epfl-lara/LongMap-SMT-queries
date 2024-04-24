; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132278 () Bool)

(assert start!132278)

(declare-fun b!1546185 () Bool)

(declare-fun res!1060008 () Bool)

(declare-fun e!860730 () Bool)

(assert (=> b!1546185 (=> (not res!1060008) (not e!860730))))

(declare-datatypes ((array!103046 0))(
  ( (array!103047 (arr!49718 (Array (_ BitVec 32) (_ BitVec 64))) (size!50269 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103046)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103046 (_ BitVec 32)) Bool)

(assert (=> b!1546185 (= res!1060008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546186 () Bool)

(declare-fun res!1060010 () Bool)

(assert (=> b!1546186 (=> (not res!1060010) (not e!860730))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58917 0))(
  ( (V!58918 (val!19005 Int)) )
))
(declare-datatypes ((ValueCell!18017 0))(
  ( (ValueCellFull!18017 (v!21798 V!58917)) (EmptyCell!18017) )
))
(declare-datatypes ((array!103048 0))(
  ( (array!103049 (arr!49719 (Array (_ BitVec 32) ValueCell!18017)) (size!50270 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103048)

(assert (=> b!1546186 (= res!1060010 (and (= (size!50270 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50269 _keys!618) (size!50270 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546187 () Bool)

(declare-fun e!860731 () Bool)

(declare-fun tp_is_empty!37855 () Bool)

(assert (=> b!1546187 (= e!860731 tp_is_empty!37855)))

(declare-fun res!1060009 () Bool)

(assert (=> start!132278 (=> (not res!1060009) (not e!860730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132278 (= res!1060009 (validMask!0 mask!926))))

(assert (=> start!132278 e!860730))

(assert (=> start!132278 true))

(declare-fun e!860729 () Bool)

(declare-fun array_inv!38937 (array!103048) Bool)

(assert (=> start!132278 (and (array_inv!38937 _values!470) e!860729)))

(declare-fun array_inv!38938 (array!103046) Bool)

(assert (=> start!132278 (array_inv!38938 _keys!618)))

(declare-fun mapNonEmpty!58486 () Bool)

(declare-fun mapRes!58486 () Bool)

(declare-fun tp!111013 () Bool)

(declare-fun e!860732 () Bool)

(assert (=> mapNonEmpty!58486 (= mapRes!58486 (and tp!111013 e!860732))))

(declare-fun mapKey!58486 () (_ BitVec 32))

(declare-fun mapRest!58486 () (Array (_ BitVec 32) ValueCell!18017))

(declare-fun mapValue!58486 () ValueCell!18017)

(assert (=> mapNonEmpty!58486 (= (arr!49719 _values!470) (store mapRest!58486 mapKey!58486 mapValue!58486))))

(declare-fun mapIsEmpty!58486 () Bool)

(assert (=> mapIsEmpty!58486 mapRes!58486))

(declare-fun b!1546188 () Bool)

(assert (=> b!1546188 (= e!860730 false)))

(declare-fun lt!666943 () Bool)

(declare-datatypes ((List!35966 0))(
  ( (Nil!35963) (Cons!35962 (h!37425 (_ BitVec 64)) (t!50652 List!35966)) )
))
(declare-fun arrayNoDuplicates!0 (array!103046 (_ BitVec 32) List!35966) Bool)

(assert (=> b!1546188 (= lt!666943 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35963))))

(declare-fun b!1546189 () Bool)

(assert (=> b!1546189 (= e!860732 tp_is_empty!37855)))

(declare-fun b!1546190 () Bool)

(assert (=> b!1546190 (= e!860729 (and e!860731 mapRes!58486))))

(declare-fun condMapEmpty!58486 () Bool)

(declare-fun mapDefault!58486 () ValueCell!18017)

(assert (=> b!1546190 (= condMapEmpty!58486 (= (arr!49719 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18017)) mapDefault!58486)))))

(assert (= (and start!132278 res!1060009) b!1546186))

(assert (= (and b!1546186 res!1060010) b!1546185))

(assert (= (and b!1546185 res!1060008) b!1546188))

(assert (= (and b!1546190 condMapEmpty!58486) mapIsEmpty!58486))

(assert (= (and b!1546190 (not condMapEmpty!58486)) mapNonEmpty!58486))

(get-info :version)

(assert (= (and mapNonEmpty!58486 ((_ is ValueCellFull!18017) mapValue!58486)) b!1546189))

(assert (= (and b!1546190 ((_ is ValueCellFull!18017) mapDefault!58486)) b!1546187))

(assert (= start!132278 b!1546190))

(declare-fun m!1427211 () Bool)

(assert (=> b!1546185 m!1427211))

(declare-fun m!1427213 () Bool)

(assert (=> start!132278 m!1427213))

(declare-fun m!1427215 () Bool)

(assert (=> start!132278 m!1427215))

(declare-fun m!1427217 () Bool)

(assert (=> start!132278 m!1427217))

(declare-fun m!1427219 () Bool)

(assert (=> mapNonEmpty!58486 m!1427219))

(declare-fun m!1427221 () Bool)

(assert (=> b!1546188 m!1427221))

(check-sat (not mapNonEmpty!58486) (not start!132278) tp_is_empty!37855 (not b!1546188) (not b!1546185))
(check-sat)
