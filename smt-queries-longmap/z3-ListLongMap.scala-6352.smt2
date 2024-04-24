; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82016 () Bool)

(assert start!82016)

(declare-fun b_free!18343 () Bool)

(declare-fun b_next!18343 () Bool)

(assert (=> start!82016 (= b_free!18343 (not b_next!18343))))

(declare-fun tp!63729 () Bool)

(declare-fun b_and!29839 () Bool)

(assert (=> start!82016 (= tp!63729 b_and!29839)))

(declare-fun b!955411 () Bool)

(declare-fun res!639526 () Bool)

(declare-fun e!538342 () Bool)

(assert (=> b!955411 (=> (not res!639526) (not e!538342))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57934 0))(
  ( (array!57935 (arr!27842 (Array (_ BitVec 32) (_ BitVec 64))) (size!28322 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57934)

(declare-datatypes ((V!32833 0))(
  ( (V!32834 (val!10494 Int)) )
))
(declare-datatypes ((ValueCell!9962 0))(
  ( (ValueCellFull!9962 (v!13046 V!32833)) (EmptyCell!9962) )
))
(declare-datatypes ((array!57936 0))(
  ( (array!57937 (arr!27843 (Array (_ BitVec 32) ValueCell!9962)) (size!28323 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57936)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955411 (= res!639526 (and (= (size!28323 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28322 _keys!1441) (size!28323 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955412 () Bool)

(declare-fun res!639529 () Bool)

(assert (=> b!955412 (=> (not res!639529) (not e!538342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57934 (_ BitVec 32)) Bool)

(assert (=> b!955412 (= res!639529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955413 () Bool)

(declare-fun e!538345 () Bool)

(declare-fun e!538341 () Bool)

(declare-fun mapRes!33292 () Bool)

(assert (=> b!955413 (= e!538345 (and e!538341 mapRes!33292))))

(declare-fun condMapEmpty!33292 () Bool)

(declare-fun mapDefault!33292 () ValueCell!9962)

(assert (=> b!955413 (= condMapEmpty!33292 (= (arr!27843 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9962)) mapDefault!33292)))))

(declare-fun res!639530 () Bool)

(assert (=> start!82016 (=> (not res!639530) (not e!538342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82016 (= res!639530 (validMask!0 mask!1823))))

(assert (=> start!82016 e!538342))

(assert (=> start!82016 true))

(declare-fun tp_is_empty!20887 () Bool)

(assert (=> start!82016 tp_is_empty!20887))

(declare-fun array_inv!21689 (array!57934) Bool)

(assert (=> start!82016 (array_inv!21689 _keys!1441)))

(declare-fun array_inv!21690 (array!57936) Bool)

(assert (=> start!82016 (and (array_inv!21690 _values!1197) e!538345)))

(assert (=> start!82016 tp!63729))

(declare-fun b!955414 () Bool)

(declare-fun res!639527 () Bool)

(assert (=> b!955414 (=> (not res!639527) (not e!538342))))

(declare-datatypes ((List!19393 0))(
  ( (Nil!19390) (Cons!19389 (h!20557 (_ BitVec 64)) (t!27746 List!19393)) )
))
(declare-fun arrayNoDuplicates!0 (array!57934 (_ BitVec 32) List!19393) Bool)

(assert (=> b!955414 (= res!639527 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19390))))

(declare-fun mapIsEmpty!33292 () Bool)

(assert (=> mapIsEmpty!33292 mapRes!33292))

(declare-fun b!955415 () Bool)

(assert (=> b!955415 (= e!538341 tp_is_empty!20887)))

(declare-fun b!955416 () Bool)

(declare-fun e!538344 () Bool)

(assert (=> b!955416 (= e!538344 tp_is_empty!20887)))

(declare-fun mapNonEmpty!33292 () Bool)

(declare-fun tp!63730 () Bool)

(assert (=> mapNonEmpty!33292 (= mapRes!33292 (and tp!63730 e!538344))))

(declare-fun mapRest!33292 () (Array (_ BitVec 32) ValueCell!9962))

(declare-fun mapValue!33292 () ValueCell!9962)

(declare-fun mapKey!33292 () (_ BitVec 32))

(assert (=> mapNonEmpty!33292 (= (arr!27843 _values!1197) (store mapRest!33292 mapKey!33292 mapValue!33292))))

(declare-fun b!955417 () Bool)

(declare-fun res!639528 () Bool)

(assert (=> b!955417 (=> (not res!639528) (not e!538342))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955417 (= res!639528 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28322 _keys!1441))))))

(declare-fun b!955418 () Bool)

(declare-fun res!639525 () Bool)

(assert (=> b!955418 (=> (not res!639525) (not e!538342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955418 (= res!639525 (validKeyInArray!0 (select (arr!27842 _keys!1441) i!735)))))

(declare-fun b!955419 () Bool)

(assert (=> b!955419 (= e!538342 false)))

(declare-fun zeroValue!1139 () V!32833)

(declare-fun lt!430269 () Bool)

(declare-fun minValue!1139 () V!32833)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13602 0))(
  ( (tuple2!13603 (_1!6812 (_ BitVec 64)) (_2!6812 V!32833)) )
))
(declare-datatypes ((List!19394 0))(
  ( (Nil!19391) (Cons!19390 (h!20558 tuple2!13602) (t!27747 List!19394)) )
))
(declare-datatypes ((ListLongMap!12301 0))(
  ( (ListLongMap!12302 (toList!6166 List!19394)) )
))
(declare-fun contains!5275 (ListLongMap!12301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3399 (array!57934 array!57936 (_ BitVec 32) (_ BitVec 32) V!32833 V!32833 (_ BitVec 32) Int) ListLongMap!12301)

(assert (=> b!955419 (= lt!430269 (contains!5275 (getCurrentListMap!3399 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27842 _keys!1441) i!735)))))

(assert (= (and start!82016 res!639530) b!955411))

(assert (= (and b!955411 res!639526) b!955412))

(assert (= (and b!955412 res!639529) b!955414))

(assert (= (and b!955414 res!639527) b!955417))

(assert (= (and b!955417 res!639528) b!955418))

(assert (= (and b!955418 res!639525) b!955419))

(assert (= (and b!955413 condMapEmpty!33292) mapIsEmpty!33292))

(assert (= (and b!955413 (not condMapEmpty!33292)) mapNonEmpty!33292))

(get-info :version)

(assert (= (and mapNonEmpty!33292 ((_ is ValueCellFull!9962) mapValue!33292)) b!955416))

(assert (= (and b!955413 ((_ is ValueCellFull!9962) mapDefault!33292)) b!955415))

(assert (= start!82016 b!955413))

(declare-fun m!887517 () Bool)

(assert (=> mapNonEmpty!33292 m!887517))

(declare-fun m!887519 () Bool)

(assert (=> b!955419 m!887519))

(declare-fun m!887521 () Bool)

(assert (=> b!955419 m!887521))

(assert (=> b!955419 m!887519))

(assert (=> b!955419 m!887521))

(declare-fun m!887523 () Bool)

(assert (=> b!955419 m!887523))

(declare-fun m!887525 () Bool)

(assert (=> b!955412 m!887525))

(declare-fun m!887527 () Bool)

(assert (=> start!82016 m!887527))

(declare-fun m!887529 () Bool)

(assert (=> start!82016 m!887529))

(declare-fun m!887531 () Bool)

(assert (=> start!82016 m!887531))

(assert (=> b!955418 m!887521))

(assert (=> b!955418 m!887521))

(declare-fun m!887533 () Bool)

(assert (=> b!955418 m!887533))

(declare-fun m!887535 () Bool)

(assert (=> b!955414 m!887535))

(check-sat (not mapNonEmpty!33292) (not b_next!18343) (not b!955412) (not b!955414) (not b!955418) b_and!29839 (not start!82016) tp_is_empty!20887 (not b!955419))
(check-sat b_and!29839 (not b_next!18343))
