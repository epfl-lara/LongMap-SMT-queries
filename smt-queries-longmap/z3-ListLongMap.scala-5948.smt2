; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77516 () Bool)

(assert start!77516)

(declare-fun b_free!16101 () Bool)

(declare-fun b_next!16101 () Bool)

(assert (=> start!77516 (= b_free!16101 (not b_next!16101))))

(declare-fun tp!56565 () Bool)

(declare-fun b_and!26467 () Bool)

(assert (=> start!77516 (= tp!56565 b_and!26467)))

(declare-fun b!903194 () Bool)

(declare-fun res!609404 () Bool)

(declare-fun e!506007 () Bool)

(assert (=> b!903194 (=> (not res!609404) (not e!506007))))

(declare-datatypes ((array!53096 0))(
  ( (array!53097 (arr!25507 (Array (_ BitVec 32) (_ BitVec 64))) (size!25966 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53096)

(declare-datatypes ((List!17909 0))(
  ( (Nil!17906) (Cons!17905 (h!19051 (_ BitVec 64)) (t!25292 List!17909)) )
))
(declare-fun arrayNoDuplicates!0 (array!53096 (_ BitVec 32) List!17909) Bool)

(assert (=> b!903194 (= res!609404 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17906))))

(declare-fun b!903195 () Bool)

(declare-fun res!609403 () Bool)

(assert (=> b!903195 (=> (not res!609403) (not e!506007))))

(declare-datatypes ((V!29657 0))(
  ( (V!29658 (val!9310 Int)) )
))
(declare-datatypes ((ValueCell!8778 0))(
  ( (ValueCellFull!8778 (v!11815 V!29657)) (EmptyCell!8778) )
))
(declare-datatypes ((array!53098 0))(
  ( (array!53099 (arr!25508 (Array (_ BitVec 32) ValueCell!8778)) (size!25967 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53098)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903195 (= res!609403 (and (= (size!25967 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25966 _keys!1386) (size!25967 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903196 () Bool)

(declare-fun e!506008 () Bool)

(declare-fun tp_is_empty!18519 () Bool)

(assert (=> b!903196 (= e!506008 tp_is_empty!18519)))

(declare-fun b!903197 () Bool)

(declare-fun e!506010 () Bool)

(assert (=> b!903197 (= e!506010 tp_is_empty!18519)))

(declare-fun mapNonEmpty!29491 () Bool)

(declare-fun mapRes!29491 () Bool)

(declare-fun tp!56564 () Bool)

(assert (=> mapNonEmpty!29491 (= mapRes!29491 (and tp!56564 e!506010))))

(declare-fun mapValue!29491 () ValueCell!8778)

(declare-fun mapKey!29491 () (_ BitVec 32))

(declare-fun mapRest!29491 () (Array (_ BitVec 32) ValueCell!8778))

(assert (=> mapNonEmpty!29491 (= (arr!25508 _values!1152) (store mapRest!29491 mapKey!29491 mapValue!29491))))

(declare-fun b!903198 () Bool)

(declare-fun e!506006 () Bool)

(assert (=> b!903198 (= e!506006 (and e!506008 mapRes!29491))))

(declare-fun condMapEmpty!29491 () Bool)

(declare-fun mapDefault!29491 () ValueCell!8778)

(assert (=> b!903198 (= condMapEmpty!29491 (= (arr!25508 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8778)) mapDefault!29491)))))

(declare-fun mapIsEmpty!29491 () Bool)

(assert (=> mapIsEmpty!29491 mapRes!29491))

(declare-fun b!903200 () Bool)

(assert (=> b!903200 (= e!506007 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29657)

(declare-fun lt!407973 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29657)

(declare-datatypes ((tuple2!12088 0))(
  ( (tuple2!12089 (_1!6055 (_ BitVec 64)) (_2!6055 V!29657)) )
))
(declare-datatypes ((List!17910 0))(
  ( (Nil!17907) (Cons!17906 (h!19052 tuple2!12088) (t!25293 List!17910)) )
))
(declare-datatypes ((ListLongMap!10785 0))(
  ( (ListLongMap!10786 (toList!5408 List!17910)) )
))
(declare-fun contains!4456 (ListLongMap!10785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2677 (array!53096 array!53098 (_ BitVec 32) (_ BitVec 32) V!29657 V!29657 (_ BitVec 32) Int) ListLongMap!10785)

(assert (=> b!903200 (= lt!407973 (contains!4456 (getCurrentListMap!2677 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903199 () Bool)

(declare-fun res!609402 () Bool)

(assert (=> b!903199 (=> (not res!609402) (not e!506007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53096 (_ BitVec 32)) Bool)

(assert (=> b!903199 (= res!609402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609401 () Bool)

(assert (=> start!77516 (=> (not res!609401) (not e!506007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77516 (= res!609401 (validMask!0 mask!1756))))

(assert (=> start!77516 e!506007))

(declare-fun array_inv!19996 (array!53098) Bool)

(assert (=> start!77516 (and (array_inv!19996 _values!1152) e!506006)))

(assert (=> start!77516 tp!56565))

(assert (=> start!77516 true))

(assert (=> start!77516 tp_is_empty!18519))

(declare-fun array_inv!19997 (array!53096) Bool)

(assert (=> start!77516 (array_inv!19997 _keys!1386)))

(assert (= (and start!77516 res!609401) b!903195))

(assert (= (and b!903195 res!609403) b!903199))

(assert (= (and b!903199 res!609402) b!903194))

(assert (= (and b!903194 res!609404) b!903200))

(assert (= (and b!903198 condMapEmpty!29491) mapIsEmpty!29491))

(assert (= (and b!903198 (not condMapEmpty!29491)) mapNonEmpty!29491))

(get-info :version)

(assert (= (and mapNonEmpty!29491 ((_ is ValueCellFull!8778) mapValue!29491)) b!903197))

(assert (= (and b!903198 ((_ is ValueCellFull!8778) mapDefault!29491)) b!903196))

(assert (= start!77516 b!903198))

(declare-fun m!838937 () Bool)

(assert (=> b!903200 m!838937))

(assert (=> b!903200 m!838937))

(declare-fun m!838939 () Bool)

(assert (=> b!903200 m!838939))

(declare-fun m!838941 () Bool)

(assert (=> b!903194 m!838941))

(declare-fun m!838943 () Bool)

(assert (=> b!903199 m!838943))

(declare-fun m!838945 () Bool)

(assert (=> start!77516 m!838945))

(declare-fun m!838947 () Bool)

(assert (=> start!77516 m!838947))

(declare-fun m!838949 () Bool)

(assert (=> start!77516 m!838949))

(declare-fun m!838951 () Bool)

(assert (=> mapNonEmpty!29491 m!838951))

(check-sat (not b!903194) (not b_next!16101) (not mapNonEmpty!29491) tp_is_empty!18519 (not b!903200) b_and!26467 (not start!77516) (not b!903199))
(check-sat b_and!26467 (not b_next!16101))
