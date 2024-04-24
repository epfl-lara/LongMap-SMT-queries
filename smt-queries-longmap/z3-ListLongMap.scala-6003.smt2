; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78038 () Bool)

(assert start!78038)

(declare-fun b_free!16429 () Bool)

(declare-fun b_next!16429 () Bool)

(assert (=> start!78038 (= b_free!16429 (not b_next!16429))))

(declare-fun tp!57553 () Bool)

(declare-fun b_and!27007 () Bool)

(assert (=> start!78038 (= tp!57553 b_and!27007)))

(declare-fun res!614055 () Bool)

(declare-fun e!510239 () Bool)

(assert (=> start!78038 (=> (not res!614055) (not e!510239))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78038 (= res!614055 (validMask!0 mask!1756))))

(assert (=> start!78038 e!510239))

(declare-datatypes ((V!30095 0))(
  ( (V!30096 (val!9474 Int)) )
))
(declare-datatypes ((ValueCell!8942 0))(
  ( (ValueCellFull!8942 (v!11978 V!30095)) (EmptyCell!8942) )
))
(declare-datatypes ((array!53769 0))(
  ( (array!53770 (arr!25838 (Array (_ BitVec 32) ValueCell!8942)) (size!26298 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53769)

(declare-fun e!510243 () Bool)

(declare-fun array_inv!20280 (array!53769) Bool)

(assert (=> start!78038 (and (array_inv!20280 _values!1152) e!510243)))

(assert (=> start!78038 tp!57553))

(assert (=> start!78038 true))

(declare-fun tp_is_empty!18847 () Bool)

(assert (=> start!78038 tp_is_empty!18847))

(declare-datatypes ((array!53771 0))(
  ( (array!53772 (arr!25839 (Array (_ BitVec 32) (_ BitVec 64))) (size!26299 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53771)

(declare-fun array_inv!20281 (array!53771) Bool)

(assert (=> start!78038 (array_inv!20281 _keys!1386)))

(declare-fun b!910168 () Bool)

(declare-fun e!510241 () Bool)

(assert (=> b!910168 (= e!510241 tp_is_empty!18847)))

(declare-fun b!910169 () Bool)

(declare-fun res!614056 () Bool)

(assert (=> b!910169 (=> (not res!614056) (not e!510239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53771 (_ BitVec 32)) Bool)

(assert (=> b!910169 (= res!614056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29986 () Bool)

(declare-fun mapRes!29986 () Bool)

(declare-fun tp!57552 () Bool)

(declare-fun e!510240 () Bool)

(assert (=> mapNonEmpty!29986 (= mapRes!29986 (and tp!57552 e!510240))))

(declare-fun mapValue!29986 () ValueCell!8942)

(declare-fun mapRest!29986 () (Array (_ BitVec 32) ValueCell!8942))

(declare-fun mapKey!29986 () (_ BitVec 32))

(assert (=> mapNonEmpty!29986 (= (arr!25838 _values!1152) (store mapRest!29986 mapKey!29986 mapValue!29986))))

(declare-fun b!910170 () Bool)

(declare-fun res!614057 () Bool)

(assert (=> b!910170 (=> (not res!614057) (not e!510239))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910170 (= res!614057 (and (= (size!26298 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26299 _keys!1386) (size!26298 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910171 () Bool)

(declare-fun res!614054 () Bool)

(assert (=> b!910171 (=> (not res!614054) (not e!510239))))

(declare-datatypes ((List!18120 0))(
  ( (Nil!18117) (Cons!18116 (h!19268 (_ BitVec 64)) (t!25693 List!18120)) )
))
(declare-fun arrayNoDuplicates!0 (array!53771 (_ BitVec 32) List!18120) Bool)

(assert (=> b!910171 (= res!614054 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18117))))

(declare-fun b!910172 () Bool)

(assert (=> b!910172 (= e!510239 false)))

(declare-fun zeroValue!1094 () V!30095)

(declare-fun lt!410331 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30095)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12300 0))(
  ( (tuple2!12301 (_1!6161 (_ BitVec 64)) (_2!6161 V!30095)) )
))
(declare-datatypes ((List!18121 0))(
  ( (Nil!18118) (Cons!18117 (h!19269 tuple2!12300) (t!25694 List!18121)) )
))
(declare-datatypes ((ListLongMap!10999 0))(
  ( (ListLongMap!11000 (toList!5515 List!18121)) )
))
(declare-fun contains!4566 (ListLongMap!10999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2776 (array!53771 array!53769 (_ BitVec 32) (_ BitVec 32) V!30095 V!30095 (_ BitVec 32) Int) ListLongMap!10999)

(assert (=> b!910172 (= lt!410331 (contains!4566 (getCurrentListMap!2776 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910173 () Bool)

(assert (=> b!910173 (= e!510243 (and e!510241 mapRes!29986))))

(declare-fun condMapEmpty!29986 () Bool)

(declare-fun mapDefault!29986 () ValueCell!8942)

(assert (=> b!910173 (= condMapEmpty!29986 (= (arr!25838 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8942)) mapDefault!29986)))))

(declare-fun mapIsEmpty!29986 () Bool)

(assert (=> mapIsEmpty!29986 mapRes!29986))

(declare-fun b!910174 () Bool)

(assert (=> b!910174 (= e!510240 tp_is_empty!18847)))

(assert (= (and start!78038 res!614055) b!910170))

(assert (= (and b!910170 res!614057) b!910169))

(assert (= (and b!910169 res!614056) b!910171))

(assert (= (and b!910171 res!614054) b!910172))

(assert (= (and b!910173 condMapEmpty!29986) mapIsEmpty!29986))

(assert (= (and b!910173 (not condMapEmpty!29986)) mapNonEmpty!29986))

(get-info :version)

(assert (= (and mapNonEmpty!29986 ((_ is ValueCellFull!8942) mapValue!29986)) b!910174))

(assert (= (and b!910173 ((_ is ValueCellFull!8942) mapDefault!29986)) b!910168))

(assert (= start!78038 b!910173))

(declare-fun m!845847 () Bool)

(assert (=> b!910172 m!845847))

(assert (=> b!910172 m!845847))

(declare-fun m!845849 () Bool)

(assert (=> b!910172 m!845849))

(declare-fun m!845851 () Bool)

(assert (=> start!78038 m!845851))

(declare-fun m!845853 () Bool)

(assert (=> start!78038 m!845853))

(declare-fun m!845855 () Bool)

(assert (=> start!78038 m!845855))

(declare-fun m!845857 () Bool)

(assert (=> mapNonEmpty!29986 m!845857))

(declare-fun m!845859 () Bool)

(assert (=> b!910169 m!845859))

(declare-fun m!845861 () Bool)

(assert (=> b!910171 m!845861))

(check-sat (not mapNonEmpty!29986) (not b!910171) (not b!910169) (not start!78038) b_and!27007 (not b_next!16429) tp_is_empty!18847 (not b!910172))
(check-sat b_and!27007 (not b_next!16429))
