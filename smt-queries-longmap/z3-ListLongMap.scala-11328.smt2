; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132284 () Bool)

(assert start!132284)

(declare-fun res!1060036 () Bool)

(declare-fun e!860775 () Bool)

(assert (=> start!132284 (=> (not res!1060036) (not e!860775))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132284 (= res!1060036 (validMask!0 mask!926))))

(assert (=> start!132284 e!860775))

(assert (=> start!132284 true))

(declare-datatypes ((V!58925 0))(
  ( (V!58926 (val!19008 Int)) )
))
(declare-datatypes ((ValueCell!18020 0))(
  ( (ValueCellFull!18020 (v!21801 V!58925)) (EmptyCell!18020) )
))
(declare-datatypes ((array!103056 0))(
  ( (array!103057 (arr!49723 (Array (_ BitVec 32) ValueCell!18020)) (size!50274 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103056)

(declare-fun e!860774 () Bool)

(declare-fun array_inv!38941 (array!103056) Bool)

(assert (=> start!132284 (and (array_inv!38941 _values!470) e!860774)))

(declare-datatypes ((array!103058 0))(
  ( (array!103059 (arr!49724 (Array (_ BitVec 32) (_ BitVec 64))) (size!50275 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103058)

(declare-fun array_inv!38942 (array!103058) Bool)

(assert (=> start!132284 (array_inv!38942 _keys!618)))

(declare-fun mapIsEmpty!58495 () Bool)

(declare-fun mapRes!58495 () Bool)

(assert (=> mapIsEmpty!58495 mapRes!58495))

(declare-fun b!1546239 () Bool)

(declare-fun res!1060037 () Bool)

(assert (=> b!1546239 (=> (not res!1060037) (not e!860775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103058 (_ BitVec 32)) Bool)

(assert (=> b!1546239 (= res!1060037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546240 () Bool)

(declare-fun res!1060035 () Bool)

(assert (=> b!1546240 (=> (not res!1060035) (not e!860775))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546240 (= res!1060035 (and (= (size!50274 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50275 _keys!618) (size!50274 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546241 () Bool)

(declare-fun e!860778 () Bool)

(assert (=> b!1546241 (= e!860774 (and e!860778 mapRes!58495))))

(declare-fun condMapEmpty!58495 () Bool)

(declare-fun mapDefault!58495 () ValueCell!18020)

(assert (=> b!1546241 (= condMapEmpty!58495 (= (arr!49723 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18020)) mapDefault!58495)))))

(declare-fun b!1546242 () Bool)

(declare-fun tp_is_empty!37861 () Bool)

(assert (=> b!1546242 (= e!860778 tp_is_empty!37861)))

(declare-fun mapNonEmpty!58495 () Bool)

(declare-fun tp!111022 () Bool)

(declare-fun e!860777 () Bool)

(assert (=> mapNonEmpty!58495 (= mapRes!58495 (and tp!111022 e!860777))))

(declare-fun mapValue!58495 () ValueCell!18020)

(declare-fun mapRest!58495 () (Array (_ BitVec 32) ValueCell!18020))

(declare-fun mapKey!58495 () (_ BitVec 32))

(assert (=> mapNonEmpty!58495 (= (arr!49723 _values!470) (store mapRest!58495 mapKey!58495 mapValue!58495))))

(declare-fun b!1546243 () Bool)

(assert (=> b!1546243 (= e!860777 tp_is_empty!37861)))

(declare-fun b!1546244 () Bool)

(assert (=> b!1546244 (= e!860775 false)))

(declare-fun lt!666952 () Bool)

(declare-datatypes ((List!35968 0))(
  ( (Nil!35965) (Cons!35964 (h!37427 (_ BitVec 64)) (t!50654 List!35968)) )
))
(declare-fun arrayNoDuplicates!0 (array!103058 (_ BitVec 32) List!35968) Bool)

(assert (=> b!1546244 (= lt!666952 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35965))))

(assert (= (and start!132284 res!1060036) b!1546240))

(assert (= (and b!1546240 res!1060035) b!1546239))

(assert (= (and b!1546239 res!1060037) b!1546244))

(assert (= (and b!1546241 condMapEmpty!58495) mapIsEmpty!58495))

(assert (= (and b!1546241 (not condMapEmpty!58495)) mapNonEmpty!58495))

(get-info :version)

(assert (= (and mapNonEmpty!58495 ((_ is ValueCellFull!18020) mapValue!58495)) b!1546243))

(assert (= (and b!1546241 ((_ is ValueCellFull!18020) mapDefault!58495)) b!1546242))

(assert (= start!132284 b!1546241))

(declare-fun m!1427247 () Bool)

(assert (=> start!132284 m!1427247))

(declare-fun m!1427249 () Bool)

(assert (=> start!132284 m!1427249))

(declare-fun m!1427251 () Bool)

(assert (=> start!132284 m!1427251))

(declare-fun m!1427253 () Bool)

(assert (=> b!1546239 m!1427253))

(declare-fun m!1427255 () Bool)

(assert (=> mapNonEmpty!58495 m!1427255))

(declare-fun m!1427257 () Bool)

(assert (=> b!1546244 m!1427257))

(check-sat (not b!1546244) (not start!132284) tp_is_empty!37861 (not mapNonEmpty!58495) (not b!1546239))
(check-sat)
