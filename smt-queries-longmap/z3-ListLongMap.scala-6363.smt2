; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81896 () Bool)

(assert start!81896)

(declare-fun b_free!18409 () Bool)

(declare-fun b_next!18409 () Bool)

(assert (=> start!81896 (= b_free!18409 (not b_next!18409))))

(declare-fun tp!63928 () Bool)

(declare-fun b_and!29869 () Bool)

(assert (=> start!81896 (= tp!63928 b_and!29869)))

(declare-fun mapNonEmpty!33391 () Bool)

(declare-fun mapRes!33391 () Bool)

(declare-fun tp!63927 () Bool)

(declare-fun e!538107 () Bool)

(assert (=> mapNonEmpty!33391 (= mapRes!33391 (and tp!63927 e!538107))))

(declare-datatypes ((V!32921 0))(
  ( (V!32922 (val!10527 Int)) )
))
(declare-datatypes ((ValueCell!9995 0))(
  ( (ValueCellFull!9995 (v!13081 V!32921)) (EmptyCell!9995) )
))
(declare-datatypes ((array!57966 0))(
  ( (array!57967 (arr!27863 (Array (_ BitVec 32) ValueCell!9995)) (size!28344 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57966)

(declare-fun mapKey!33391 () (_ BitVec 32))

(declare-fun mapRest!33391 () (Array (_ BitVec 32) ValueCell!9995))

(declare-fun mapValue!33391 () ValueCell!9995)

(assert (=> mapNonEmpty!33391 (= (arr!27863 _values!1197) (store mapRest!33391 mapKey!33391 mapValue!33391))))

(declare-fun b!955198 () Bool)

(declare-fun e!538106 () Bool)

(assert (=> b!955198 (= e!538106 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32921)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57968 0))(
  ( (array!57969 (arr!27864 (Array (_ BitVec 32) (_ BitVec 64))) (size!28345 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57968)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32921)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13708 0))(
  ( (tuple2!13709 (_1!6865 (_ BitVec 64)) (_2!6865 V!32921)) )
))
(declare-datatypes ((List!19447 0))(
  ( (Nil!19444) (Cons!19443 (h!20605 tuple2!13708) (t!27799 List!19447)) )
))
(declare-datatypes ((ListLongMap!12395 0))(
  ( (ListLongMap!12396 (toList!6213 List!19447)) )
))
(declare-fun contains!5254 (ListLongMap!12395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3375 (array!57968 array!57966 (_ BitVec 32) (_ BitVec 32) V!32921 V!32921 (_ BitVec 32) Int) ListLongMap!12395)

(assert (=> b!955198 (contains!5254 (getCurrentListMap!3375 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27864 _keys!1441) i!735))))

(declare-datatypes ((Unit!31976 0))(
  ( (Unit!31977) )
))
(declare-fun lt!429771 () Unit!31976)

(declare-fun lemmaInListMapFromThenFromZero!7 (array!57968 array!57966 (_ BitVec 32) (_ BitVec 32) V!32921 V!32921 (_ BitVec 32) (_ BitVec 32) Int) Unit!31976)

(assert (=> b!955198 (= lt!429771 (lemmaInListMapFromThenFromZero!7 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapIsEmpty!33391 () Bool)

(assert (=> mapIsEmpty!33391 mapRes!33391))

(declare-fun b!955199 () Bool)

(declare-fun res!639708 () Bool)

(assert (=> b!955199 (=> (not res!639708) (not e!538106))))

(assert (=> b!955199 (= res!639708 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28345 _keys!1441))))))

(declare-fun b!955200 () Bool)

(declare-fun res!639707 () Bool)

(assert (=> b!955200 (=> (not res!639707) (not e!538106))))

(assert (=> b!955200 (= res!639707 (and (= (size!28344 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28345 _keys!1441) (size!28344 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639706 () Bool)

(assert (=> start!81896 (=> (not res!639706) (not e!538106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81896 (= res!639706 (validMask!0 mask!1823))))

(assert (=> start!81896 e!538106))

(assert (=> start!81896 true))

(declare-fun tp_is_empty!20953 () Bool)

(assert (=> start!81896 tp_is_empty!20953))

(declare-fun array_inv!21687 (array!57968) Bool)

(assert (=> start!81896 (array_inv!21687 _keys!1441)))

(declare-fun e!538110 () Bool)

(declare-fun array_inv!21688 (array!57966) Bool)

(assert (=> start!81896 (and (array_inv!21688 _values!1197) e!538110)))

(assert (=> start!81896 tp!63928))

(declare-fun b!955201 () Bool)

(assert (=> b!955201 (= e!538107 tp_is_empty!20953)))

(declare-fun b!955202 () Bool)

(declare-fun e!538108 () Bool)

(assert (=> b!955202 (= e!538108 tp_is_empty!20953)))

(declare-fun b!955203 () Bool)

(declare-fun res!639703 () Bool)

(assert (=> b!955203 (=> (not res!639703) (not e!538106))))

(assert (=> b!955203 (= res!639703 (contains!5254 (getCurrentListMap!3375 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27864 _keys!1441) i!735)))))

(declare-fun b!955204 () Bool)

(declare-fun res!639705 () Bool)

(assert (=> b!955204 (=> (not res!639705) (not e!538106))))

(declare-datatypes ((List!19448 0))(
  ( (Nil!19445) (Cons!19444 (h!20606 (_ BitVec 64)) (t!27800 List!19448)) )
))
(declare-fun arrayNoDuplicates!0 (array!57968 (_ BitVec 32) List!19448) Bool)

(assert (=> b!955204 (= res!639705 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19445))))

(declare-fun b!955205 () Bool)

(declare-fun res!639704 () Bool)

(assert (=> b!955205 (=> (not res!639704) (not e!538106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57968 (_ BitVec 32)) Bool)

(assert (=> b!955205 (= res!639704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955206 () Bool)

(assert (=> b!955206 (= e!538110 (and e!538108 mapRes!33391))))

(declare-fun condMapEmpty!33391 () Bool)

(declare-fun mapDefault!33391 () ValueCell!9995)

(assert (=> b!955206 (= condMapEmpty!33391 (= (arr!27863 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9995)) mapDefault!33391)))))

(declare-fun b!955207 () Bool)

(declare-fun res!639709 () Bool)

(assert (=> b!955207 (=> (not res!639709) (not e!538106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955207 (= res!639709 (validKeyInArray!0 (select (arr!27864 _keys!1441) i!735)))))

(assert (= (and start!81896 res!639706) b!955200))

(assert (= (and b!955200 res!639707) b!955205))

(assert (= (and b!955205 res!639704) b!955204))

(assert (= (and b!955204 res!639705) b!955199))

(assert (= (and b!955199 res!639708) b!955207))

(assert (= (and b!955207 res!639709) b!955203))

(assert (= (and b!955203 res!639703) b!955198))

(assert (= (and b!955206 condMapEmpty!33391) mapIsEmpty!33391))

(assert (= (and b!955206 (not condMapEmpty!33391)) mapNonEmpty!33391))

(get-info :version)

(assert (= (and mapNonEmpty!33391 ((_ is ValueCellFull!9995) mapValue!33391)) b!955201))

(assert (= (and b!955206 ((_ is ValueCellFull!9995) mapDefault!33391)) b!955202))

(assert (= start!81896 b!955206))

(declare-fun m!886197 () Bool)

(assert (=> b!955204 m!886197))

(declare-fun m!886199 () Bool)

(assert (=> start!81896 m!886199))

(declare-fun m!886201 () Bool)

(assert (=> start!81896 m!886201))

(declare-fun m!886203 () Bool)

(assert (=> start!81896 m!886203))

(declare-fun m!886205 () Bool)

(assert (=> b!955198 m!886205))

(declare-fun m!886207 () Bool)

(assert (=> b!955198 m!886207))

(assert (=> b!955198 m!886205))

(assert (=> b!955198 m!886207))

(declare-fun m!886209 () Bool)

(assert (=> b!955198 m!886209))

(declare-fun m!886211 () Bool)

(assert (=> b!955198 m!886211))

(declare-fun m!886213 () Bool)

(assert (=> b!955205 m!886213))

(declare-fun m!886215 () Bool)

(assert (=> b!955203 m!886215))

(assert (=> b!955203 m!886207))

(assert (=> b!955203 m!886215))

(assert (=> b!955203 m!886207))

(declare-fun m!886217 () Bool)

(assert (=> b!955203 m!886217))

(declare-fun m!886219 () Bool)

(assert (=> mapNonEmpty!33391 m!886219))

(assert (=> b!955207 m!886207))

(assert (=> b!955207 m!886207))

(declare-fun m!886221 () Bool)

(assert (=> b!955207 m!886221))

(check-sat (not b!955205) (not mapNonEmpty!33391) tp_is_empty!20953 (not b!955204) (not b!955203) (not start!81896) (not b_next!18409) (not b!955198) b_and!29869 (not b!955207))
(check-sat b_and!29869 (not b_next!18409))
