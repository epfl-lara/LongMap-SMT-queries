; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81826 () Bool)

(assert start!81826)

(declare-fun b_free!18321 () Bool)

(declare-fun b_next!18321 () Bool)

(assert (=> start!81826 (= b_free!18321 (not b_next!18321))))

(declare-fun tp!63663 () Bool)

(declare-fun b_and!29807 () Bool)

(assert (=> start!81826 (= tp!63663 b_and!29807)))

(declare-fun b!954211 () Bool)

(declare-fun res!638987 () Bool)

(declare-fun e!537597 () Bool)

(assert (=> b!954211 (=> (not res!638987) (not e!537597))))

(declare-datatypes ((array!57843 0))(
  ( (array!57844 (arr!27801 (Array (_ BitVec 32) (_ BitVec 64))) (size!28280 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57843)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57843 (_ BitVec 32)) Bool)

(assert (=> b!954211 (= res!638987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954212 () Bool)

(declare-fun res!638983 () Bool)

(assert (=> b!954212 (=> (not res!638983) (not e!537597))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954212 (= res!638983 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28280 _keys!1441))))))

(declare-fun mapIsEmpty!33259 () Bool)

(declare-fun mapRes!33259 () Bool)

(assert (=> mapIsEmpty!33259 mapRes!33259))

(declare-fun b!954213 () Bool)

(declare-fun e!537595 () Bool)

(declare-fun e!537596 () Bool)

(assert (=> b!954213 (= e!537595 (and e!537596 mapRes!33259))))

(declare-fun condMapEmpty!33259 () Bool)

(declare-datatypes ((V!32803 0))(
  ( (V!32804 (val!10483 Int)) )
))
(declare-datatypes ((ValueCell!9951 0))(
  ( (ValueCellFull!9951 (v!13038 V!32803)) (EmptyCell!9951) )
))
(declare-datatypes ((array!57845 0))(
  ( (array!57846 (arr!27802 (Array (_ BitVec 32) ValueCell!9951)) (size!28281 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57845)

(declare-fun mapDefault!33259 () ValueCell!9951)

(assert (=> b!954213 (= condMapEmpty!33259 (= (arr!27802 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9951)) mapDefault!33259)))))

(declare-fun b!954214 () Bool)

(declare-fun res!638984 () Bool)

(assert (=> b!954214 (=> (not res!638984) (not e!537597))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954214 (= res!638984 (and (= (size!28281 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28280 _keys!1441) (size!28281 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!638985 () Bool)

(assert (=> start!81826 (=> (not res!638985) (not e!537597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81826 (= res!638985 (validMask!0 mask!1823))))

(assert (=> start!81826 e!537597))

(assert (=> start!81826 true))

(declare-fun tp_is_empty!20865 () Bool)

(assert (=> start!81826 tp_is_empty!20865))

(declare-fun array_inv!21581 (array!57843) Bool)

(assert (=> start!81826 (array_inv!21581 _keys!1441)))

(declare-fun array_inv!21582 (array!57845) Bool)

(assert (=> start!81826 (and (array_inv!21582 _values!1197) e!537595)))

(assert (=> start!81826 tp!63663))

(declare-fun b!954215 () Bool)

(assert (=> b!954215 (= e!537597 false)))

(declare-fun zeroValue!1139 () V!32803)

(declare-fun lt!429875 () Bool)

(declare-fun minValue!1139 () V!32803)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13606 0))(
  ( (tuple2!13607 (_1!6814 (_ BitVec 64)) (_2!6814 V!32803)) )
))
(declare-datatypes ((List!19386 0))(
  ( (Nil!19383) (Cons!19382 (h!20544 tuple2!13606) (t!27747 List!19386)) )
))
(declare-datatypes ((ListLongMap!12303 0))(
  ( (ListLongMap!12304 (toList!6167 List!19386)) )
))
(declare-fun contains!5265 (ListLongMap!12303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3400 (array!57843 array!57845 (_ BitVec 32) (_ BitVec 32) V!32803 V!32803 (_ BitVec 32) Int) ListLongMap!12303)

(assert (=> b!954215 (= lt!429875 (contains!5265 (getCurrentListMap!3400 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27801 _keys!1441) i!735)))))

(declare-fun b!954216 () Bool)

(declare-fun res!638986 () Bool)

(assert (=> b!954216 (=> (not res!638986) (not e!537597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954216 (= res!638986 (validKeyInArray!0 (select (arr!27801 _keys!1441) i!735)))))

(declare-fun b!954217 () Bool)

(declare-fun res!638988 () Bool)

(assert (=> b!954217 (=> (not res!638988) (not e!537597))))

(declare-datatypes ((List!19387 0))(
  ( (Nil!19384) (Cons!19383 (h!20545 (_ BitVec 64)) (t!27748 List!19387)) )
))
(declare-fun arrayNoDuplicates!0 (array!57843 (_ BitVec 32) List!19387) Bool)

(assert (=> b!954217 (= res!638988 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19384))))

(declare-fun b!954218 () Bool)

(declare-fun e!537594 () Bool)

(assert (=> b!954218 (= e!537594 tp_is_empty!20865)))

(declare-fun mapNonEmpty!33259 () Bool)

(declare-fun tp!63662 () Bool)

(assert (=> mapNonEmpty!33259 (= mapRes!33259 (and tp!63662 e!537594))))

(declare-fun mapValue!33259 () ValueCell!9951)

(declare-fun mapRest!33259 () (Array (_ BitVec 32) ValueCell!9951))

(declare-fun mapKey!33259 () (_ BitVec 32))

(assert (=> mapNonEmpty!33259 (= (arr!27802 _values!1197) (store mapRest!33259 mapKey!33259 mapValue!33259))))

(declare-fun b!954219 () Bool)

(assert (=> b!954219 (= e!537596 tp_is_empty!20865)))

(assert (= (and start!81826 res!638985) b!954214))

(assert (= (and b!954214 res!638984) b!954211))

(assert (= (and b!954211 res!638987) b!954217))

(assert (= (and b!954217 res!638988) b!954212))

(assert (= (and b!954212 res!638983) b!954216))

(assert (= (and b!954216 res!638986) b!954215))

(assert (= (and b!954213 condMapEmpty!33259) mapIsEmpty!33259))

(assert (= (and b!954213 (not condMapEmpty!33259)) mapNonEmpty!33259))

(get-info :version)

(assert (= (and mapNonEmpty!33259 ((_ is ValueCellFull!9951) mapValue!33259)) b!954218))

(assert (= (and b!954213 ((_ is ValueCellFull!9951) mapDefault!33259)) b!954219))

(assert (= start!81826 b!954213))

(declare-fun m!886003 () Bool)

(assert (=> b!954215 m!886003))

(declare-fun m!886005 () Bool)

(assert (=> b!954215 m!886005))

(assert (=> b!954215 m!886003))

(assert (=> b!954215 m!886005))

(declare-fun m!886007 () Bool)

(assert (=> b!954215 m!886007))

(declare-fun m!886009 () Bool)

(assert (=> b!954211 m!886009))

(declare-fun m!886011 () Bool)

(assert (=> mapNonEmpty!33259 m!886011))

(declare-fun m!886013 () Bool)

(assert (=> b!954217 m!886013))

(assert (=> b!954216 m!886005))

(assert (=> b!954216 m!886005))

(declare-fun m!886015 () Bool)

(assert (=> b!954216 m!886015))

(declare-fun m!886017 () Bool)

(assert (=> start!81826 m!886017))

(declare-fun m!886019 () Bool)

(assert (=> start!81826 m!886019))

(declare-fun m!886021 () Bool)

(assert (=> start!81826 m!886021))

(check-sat tp_is_empty!20865 (not b!954216) (not b!954217) (not b_next!18321) b_and!29807 (not b!954215) (not mapNonEmpty!33259) (not b!954211) (not start!81826))
(check-sat b_and!29807 (not b_next!18321))
