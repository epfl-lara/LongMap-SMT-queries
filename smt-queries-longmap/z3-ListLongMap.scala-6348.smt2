; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81806 () Bool)

(assert start!81806)

(declare-fun b_free!18319 () Bool)

(declare-fun b_next!18319 () Bool)

(assert (=> start!81806 (= b_free!18319 (not b_next!18319))))

(declare-fun tp!63658 () Bool)

(declare-fun b_and!29779 () Bool)

(assert (=> start!81806 (= tp!63658 b_and!29779)))

(declare-fun b!953945 () Bool)

(declare-fun e!537434 () Bool)

(declare-fun tp_is_empty!20863 () Bool)

(assert (=> b!953945 (= e!537434 tp_is_empty!20863)))

(declare-fun res!638859 () Bool)

(declare-fun e!537431 () Bool)

(assert (=> start!81806 (=> (not res!638859) (not e!537431))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81806 (= res!638859 (validMask!0 mask!1823))))

(assert (=> start!81806 e!537431))

(assert (=> start!81806 true))

(assert (=> start!81806 tp_is_empty!20863))

(declare-datatypes ((array!57800 0))(
  ( (array!57801 (arr!27780 (Array (_ BitVec 32) (_ BitVec 64))) (size!28261 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57800)

(declare-fun array_inv!21627 (array!57800) Bool)

(assert (=> start!81806 (array_inv!21627 _keys!1441)))

(declare-datatypes ((V!32801 0))(
  ( (V!32802 (val!10482 Int)) )
))
(declare-datatypes ((ValueCell!9950 0))(
  ( (ValueCellFull!9950 (v!13036 V!32801)) (EmptyCell!9950) )
))
(declare-datatypes ((array!57802 0))(
  ( (array!57803 (arr!27781 (Array (_ BitVec 32) ValueCell!9950)) (size!28262 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57802)

(declare-fun e!537433 () Bool)

(declare-fun array_inv!21628 (array!57802) Bool)

(assert (=> start!81806 (and (array_inv!21628 _values!1197) e!537433)))

(assert (=> start!81806 tp!63658))

(declare-fun b!953946 () Bool)

(declare-fun res!638855 () Bool)

(assert (=> b!953946 (=> (not res!638855) (not e!537431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57800 (_ BitVec 32)) Bool)

(assert (=> b!953946 (= res!638855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953947 () Bool)

(declare-fun res!638858 () Bool)

(assert (=> b!953947 (=> (not res!638858) (not e!537431))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!953947 (= res!638858 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28261 _keys!1441))))))

(declare-fun b!953948 () Bool)

(declare-fun res!638860 () Bool)

(assert (=> b!953948 (=> (not res!638860) (not e!537431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953948 (= res!638860 (validKeyInArray!0 (select (arr!27780 _keys!1441) i!735)))))

(declare-fun b!953949 () Bool)

(declare-fun res!638857 () Bool)

(assert (=> b!953949 (=> (not res!638857) (not e!537431))))

(declare-datatypes ((List!19391 0))(
  ( (Nil!19388) (Cons!19387 (h!20549 (_ BitVec 64)) (t!27743 List!19391)) )
))
(declare-fun arrayNoDuplicates!0 (array!57800 (_ BitVec 32) List!19391) Bool)

(assert (=> b!953949 (= res!638857 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19388))))

(declare-fun b!953950 () Bool)

(assert (=> b!953950 (= e!537431 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun lt!429636 () Bool)

(declare-fun zeroValue!1139 () V!32801)

(declare-fun minValue!1139 () V!32801)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13652 0))(
  ( (tuple2!13653 (_1!6837 (_ BitVec 64)) (_2!6837 V!32801)) )
))
(declare-datatypes ((List!19392 0))(
  ( (Nil!19389) (Cons!19388 (h!20550 tuple2!13652) (t!27744 List!19392)) )
))
(declare-datatypes ((ListLongMap!12339 0))(
  ( (ListLongMap!12340 (toList!6185 List!19392)) )
))
(declare-fun contains!5226 (ListLongMap!12339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3347 (array!57800 array!57802 (_ BitVec 32) (_ BitVec 32) V!32801 V!32801 (_ BitVec 32) Int) ListLongMap!12339)

(assert (=> b!953950 (= lt!429636 (contains!5226 (getCurrentListMap!3347 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27780 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33256 () Bool)

(declare-fun mapRes!33256 () Bool)

(assert (=> mapIsEmpty!33256 mapRes!33256))

(declare-fun b!953951 () Bool)

(declare-fun e!537435 () Bool)

(assert (=> b!953951 (= e!537433 (and e!537435 mapRes!33256))))

(declare-fun condMapEmpty!33256 () Bool)

(declare-fun mapDefault!33256 () ValueCell!9950)

(assert (=> b!953951 (= condMapEmpty!33256 (= (arr!27781 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9950)) mapDefault!33256)))))

(declare-fun b!953952 () Bool)

(declare-fun res!638856 () Bool)

(assert (=> b!953952 (=> (not res!638856) (not e!537431))))

(assert (=> b!953952 (= res!638856 (and (= (size!28262 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28261 _keys!1441) (size!28262 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953953 () Bool)

(assert (=> b!953953 (= e!537435 tp_is_empty!20863)))

(declare-fun mapNonEmpty!33256 () Bool)

(declare-fun tp!63657 () Bool)

(assert (=> mapNonEmpty!33256 (= mapRes!33256 (and tp!63657 e!537434))))

(declare-fun mapValue!33256 () ValueCell!9950)

(declare-fun mapRest!33256 () (Array (_ BitVec 32) ValueCell!9950))

(declare-fun mapKey!33256 () (_ BitVec 32))

(assert (=> mapNonEmpty!33256 (= (arr!27781 _values!1197) (store mapRest!33256 mapKey!33256 mapValue!33256))))

(assert (= (and start!81806 res!638859) b!953952))

(assert (= (and b!953952 res!638856) b!953946))

(assert (= (and b!953946 res!638855) b!953949))

(assert (= (and b!953949 res!638857) b!953947))

(assert (= (and b!953947 res!638858) b!953948))

(assert (= (and b!953948 res!638860) b!953950))

(assert (= (and b!953951 condMapEmpty!33256) mapIsEmpty!33256))

(assert (= (and b!953951 (not condMapEmpty!33256)) mapNonEmpty!33256))

(get-info :version)

(assert (= (and mapNonEmpty!33256 ((_ is ValueCellFull!9950) mapValue!33256)) b!953945))

(assert (= (and b!953951 ((_ is ValueCellFull!9950) mapDefault!33256)) b!953953))

(assert (= start!81806 b!953951))

(declare-fun m!885225 () Bool)

(assert (=> b!953946 m!885225))

(declare-fun m!885227 () Bool)

(assert (=> b!953950 m!885227))

(declare-fun m!885229 () Bool)

(assert (=> b!953950 m!885229))

(assert (=> b!953950 m!885227))

(assert (=> b!953950 m!885229))

(declare-fun m!885231 () Bool)

(assert (=> b!953950 m!885231))

(declare-fun m!885233 () Bool)

(assert (=> mapNonEmpty!33256 m!885233))

(declare-fun m!885235 () Bool)

(assert (=> start!81806 m!885235))

(declare-fun m!885237 () Bool)

(assert (=> start!81806 m!885237))

(declare-fun m!885239 () Bool)

(assert (=> start!81806 m!885239))

(assert (=> b!953948 m!885229))

(assert (=> b!953948 m!885229))

(declare-fun m!885241 () Bool)

(assert (=> b!953948 m!885241))

(declare-fun m!885243 () Bool)

(assert (=> b!953949 m!885243))

(check-sat (not b_next!18319) (not mapNonEmpty!33256) b_and!29779 (not b!953946) (not b!953949) (not b!953948) (not start!81806) (not b!953950) tp_is_empty!20863)
(check-sat b_and!29779 (not b_next!18319))
