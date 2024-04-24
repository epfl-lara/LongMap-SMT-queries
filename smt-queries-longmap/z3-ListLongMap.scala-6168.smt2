; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79284 () Bool)

(assert start!79284)

(declare-fun b_free!17329 () Bool)

(declare-fun b_next!17329 () Bool)

(assert (=> start!79284 (= b_free!17329 (not b_next!17329))))

(declare-fun tp!60429 () Bool)

(declare-fun b_and!28405 () Bool)

(assert (=> start!79284 (= tp!60429 b_and!28405)))

(declare-fun b!929496 () Bool)

(declare-fun e!521969 () Bool)

(assert (=> b!929496 (= e!521969 false)))

(declare-datatypes ((V!31415 0))(
  ( (V!31416 (val!9969 Int)) )
))
(declare-fun lt!419254 () V!31415)

(declare-datatypes ((tuple2!13014 0))(
  ( (tuple2!13015 (_1!6518 (_ BitVec 64)) (_2!6518 V!31415)) )
))
(declare-datatypes ((List!18820 0))(
  ( (Nil!18817) (Cons!18816 (h!19968 tuple2!13014) (t!26869 List!18820)) )
))
(declare-datatypes ((ListLongMap!11713 0))(
  ( (ListLongMap!11714 (toList!5872 List!18820)) )
))
(declare-fun lt!419255 () ListLongMap!11713)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!722 (ListLongMap!11713 (_ BitVec 64)) V!31415)

(assert (=> b!929496 (= lt!419254 (apply!722 lt!419255 k0!1099))))

(declare-fun mapIsEmpty!31512 () Bool)

(declare-fun mapRes!31512 () Bool)

(assert (=> mapIsEmpty!31512 mapRes!31512))

(declare-fun b!929497 () Bool)

(declare-fun e!521968 () Bool)

(declare-fun tp_is_empty!19837 () Bool)

(assert (=> b!929497 (= e!521968 tp_is_empty!19837)))

(declare-fun b!929498 () Bool)

(declare-fun e!521966 () Bool)

(assert (=> b!929498 (= e!521966 tp_is_empty!19837)))

(declare-fun b!929499 () Bool)

(declare-fun res!625655 () Bool)

(declare-fun e!521970 () Bool)

(assert (=> b!929499 (=> (not res!625655) (not e!521970))))

(declare-datatypes ((array!55687 0))(
  ( (array!55688 (arr!26784 (Array (_ BitVec 32) (_ BitVec 64))) (size!27244 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55687)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55687 (_ BitVec 32)) Bool)

(assert (=> b!929499 (= res!625655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929500 () Bool)

(assert (=> b!929500 (= e!521970 e!521969)))

(declare-fun res!625656 () Bool)

(assert (=> b!929500 (=> (not res!625656) (not e!521969))))

(declare-fun contains!4944 (ListLongMap!11713 (_ BitVec 64)) Bool)

(assert (=> b!929500 (= res!625656 (contains!4944 lt!419255 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9437 0))(
  ( (ValueCellFull!9437 (v!12484 V!31415)) (EmptyCell!9437) )
))
(declare-datatypes ((array!55689 0))(
  ( (array!55690 (arr!26785 (Array (_ BitVec 32) ValueCell!9437)) (size!27245 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55689)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31415)

(declare-fun minValue!1173 () V!31415)

(declare-fun getCurrentListMap!3122 (array!55687 array!55689 (_ BitVec 32) (_ BitVec 32) V!31415 V!31415 (_ BitVec 32) Int) ListLongMap!11713)

(assert (=> b!929500 (= lt!419255 (getCurrentListMap!3122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!625654 () Bool)

(assert (=> start!79284 (=> (not res!625654) (not e!521970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79284 (= res!625654 (validMask!0 mask!1881))))

(assert (=> start!79284 e!521970))

(assert (=> start!79284 true))

(declare-fun e!521967 () Bool)

(declare-fun array_inv!20958 (array!55689) Bool)

(assert (=> start!79284 (and (array_inv!20958 _values!1231) e!521967)))

(assert (=> start!79284 tp!60429))

(declare-fun array_inv!20959 (array!55687) Bool)

(assert (=> start!79284 (array_inv!20959 _keys!1487)))

(assert (=> start!79284 tp_is_empty!19837))

(declare-fun mapNonEmpty!31512 () Bool)

(declare-fun tp!60428 () Bool)

(assert (=> mapNonEmpty!31512 (= mapRes!31512 (and tp!60428 e!521968))))

(declare-fun mapValue!31512 () ValueCell!9437)

(declare-fun mapRest!31512 () (Array (_ BitVec 32) ValueCell!9437))

(declare-fun mapKey!31512 () (_ BitVec 32))

(assert (=> mapNonEmpty!31512 (= (arr!26785 _values!1231) (store mapRest!31512 mapKey!31512 mapValue!31512))))

(declare-fun b!929501 () Bool)

(declare-fun res!625652 () Bool)

(assert (=> b!929501 (=> (not res!625652) (not e!521970))))

(assert (=> b!929501 (= res!625652 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27244 _keys!1487))))))

(declare-fun b!929502 () Bool)

(declare-fun res!625653 () Bool)

(assert (=> b!929502 (=> (not res!625653) (not e!521970))))

(declare-datatypes ((List!18821 0))(
  ( (Nil!18818) (Cons!18817 (h!19969 (_ BitVec 64)) (t!26870 List!18821)) )
))
(declare-fun arrayNoDuplicates!0 (array!55687 (_ BitVec 32) List!18821) Bool)

(assert (=> b!929502 (= res!625653 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18818))))

(declare-fun b!929503 () Bool)

(assert (=> b!929503 (= e!521967 (and e!521966 mapRes!31512))))

(declare-fun condMapEmpty!31512 () Bool)

(declare-fun mapDefault!31512 () ValueCell!9437)

(assert (=> b!929503 (= condMapEmpty!31512 (= (arr!26785 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9437)) mapDefault!31512)))))

(declare-fun b!929504 () Bool)

(declare-fun res!625651 () Bool)

(assert (=> b!929504 (=> (not res!625651) (not e!521970))))

(assert (=> b!929504 (= res!625651 (and (= (size!27245 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27244 _keys!1487) (size!27245 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79284 res!625654) b!929504))

(assert (= (and b!929504 res!625651) b!929499))

(assert (= (and b!929499 res!625655) b!929502))

(assert (= (and b!929502 res!625653) b!929501))

(assert (= (and b!929501 res!625652) b!929500))

(assert (= (and b!929500 res!625656) b!929496))

(assert (= (and b!929503 condMapEmpty!31512) mapIsEmpty!31512))

(assert (= (and b!929503 (not condMapEmpty!31512)) mapNonEmpty!31512))

(get-info :version)

(assert (= (and mapNonEmpty!31512 ((_ is ValueCellFull!9437) mapValue!31512)) b!929497))

(assert (= (and b!929503 ((_ is ValueCellFull!9437) mapDefault!31512)) b!929498))

(assert (= start!79284 b!929503))

(declare-fun m!864739 () Bool)

(assert (=> b!929502 m!864739))

(declare-fun m!864741 () Bool)

(assert (=> b!929499 m!864741))

(declare-fun m!864743 () Bool)

(assert (=> mapNonEmpty!31512 m!864743))

(declare-fun m!864745 () Bool)

(assert (=> b!929496 m!864745))

(declare-fun m!864747 () Bool)

(assert (=> b!929500 m!864747))

(declare-fun m!864749 () Bool)

(assert (=> b!929500 m!864749))

(declare-fun m!864751 () Bool)

(assert (=> start!79284 m!864751))

(declare-fun m!864753 () Bool)

(assert (=> start!79284 m!864753))

(declare-fun m!864755 () Bool)

(assert (=> start!79284 m!864755))

(check-sat (not b_next!17329) (not b!929496) b_and!28405 (not mapNonEmpty!31512) (not b!929502) tp_is_empty!19837 (not start!79284) (not b!929499) (not b!929500))
(check-sat b_and!28405 (not b_next!17329))
