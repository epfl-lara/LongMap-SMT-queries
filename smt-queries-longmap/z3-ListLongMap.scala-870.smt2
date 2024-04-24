; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20320 () Bool)

(assert start!20320)

(declare-fun b_free!4975 () Bool)

(declare-fun b_next!4975 () Bool)

(assert (=> start!20320 (= b_free!4975 (not b_next!4975))))

(declare-fun tp!17957 () Bool)

(declare-fun b_and!11735 () Bool)

(assert (=> start!20320 (= tp!17957 b_and!11735)))

(declare-fun mapNonEmpty!8315 () Bool)

(declare-fun mapRes!8315 () Bool)

(declare-fun tp!17956 () Bool)

(declare-fun e!131319 () Bool)

(assert (=> mapNonEmpty!8315 (= mapRes!8315 (and tp!17956 e!131319))))

(declare-datatypes ((V!6089 0))(
  ( (V!6090 (val!2460 Int)) )
))
(declare-datatypes ((ValueCell!2072 0))(
  ( (ValueCellFull!2072 (v!4431 V!6089)) (EmptyCell!2072) )
))
(declare-fun mapValue!8315 () ValueCell!2072)

(declare-datatypes ((array!8889 0))(
  ( (array!8890 (arr!4195 (Array (_ BitVec 32) ValueCell!2072)) (size!4520 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8889)

(declare-fun mapKey!8315 () (_ BitVec 32))

(declare-fun mapRest!8315 () (Array (_ BitVec 32) ValueCell!2072))

(assert (=> mapNonEmpty!8315 (= (arr!4195 _values!649) (store mapRest!8315 mapKey!8315 mapValue!8315))))

(declare-fun b!200227 () Bool)

(declare-fun res!95333 () Bool)

(declare-fun e!131320 () Bool)

(assert (=> b!200227 (=> (not res!95333) (not e!131320))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8891 0))(
  ( (array!8892 (arr!4196 (Array (_ BitVec 32) (_ BitVec 64))) (size!4521 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8891)

(assert (=> b!200227 (= res!95333 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4521 _keys!825))))))

(declare-fun b!200228 () Bool)

(declare-fun e!131323 () Bool)

(declare-fun e!131324 () Bool)

(assert (=> b!200228 (= e!131323 (and e!131324 mapRes!8315))))

(declare-fun condMapEmpty!8315 () Bool)

(declare-fun mapDefault!8315 () ValueCell!2072)

(assert (=> b!200228 (= condMapEmpty!8315 (= (arr!4195 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2072)) mapDefault!8315)))))

(declare-fun b!200229 () Bool)

(declare-fun tp_is_empty!4831 () Bool)

(assert (=> b!200229 (= e!131319 tp_is_empty!4831)))

(declare-fun b!200230 () Bool)

(declare-fun res!95336 () Bool)

(declare-fun e!131318 () Bool)

(assert (=> b!200230 (=> (not res!95336) (not e!131318))))

(declare-datatypes ((tuple2!3652 0))(
  ( (tuple2!3653 (_1!1837 (_ BitVec 64)) (_2!1837 V!6089)) )
))
(declare-fun lt!98828 () tuple2!3652)

(declare-datatypes ((List!2574 0))(
  ( (Nil!2571) (Cons!2570 (h!3212 tuple2!3652) (t!7497 List!2574)) )
))
(declare-datatypes ((ListLongMap!2567 0))(
  ( (ListLongMap!2568 (toList!1299 List!2574)) )
))
(declare-fun lt!98825 () ListLongMap!2567)

(declare-fun lt!98824 () ListLongMap!2567)

(declare-fun lt!98831 () tuple2!3652)

(declare-fun +!353 (ListLongMap!2567 tuple2!3652) ListLongMap!2567)

(assert (=> b!200230 (= res!95336 (= lt!98824 (+!353 (+!353 lt!98825 lt!98831) lt!98828)))))

(declare-fun b!200231 () Bool)

(declare-fun e!131322 () Bool)

(assert (=> b!200231 (= e!131320 (not e!131322))))

(declare-fun res!95329 () Bool)

(assert (=> b!200231 (=> res!95329 e!131322)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200231 (= res!95329 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6089)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6089)

(declare-fun getCurrentListMap!896 (array!8891 array!8889 (_ BitVec 32) (_ BitVec 32) V!6089 V!6089 (_ BitVec 32) Int) ListLongMap!2567)

(assert (=> b!200231 (= lt!98824 (getCurrentListMap!896 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98830 () ListLongMap!2567)

(declare-fun lt!98826 () array!8889)

(assert (=> b!200231 (= lt!98830 (getCurrentListMap!896 _keys!825 lt!98826 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98823 () ListLongMap!2567)

(declare-fun lt!98829 () ListLongMap!2567)

(assert (=> b!200231 (and (= lt!98823 lt!98829) (= lt!98829 lt!98823))))

(declare-fun v!520 () V!6089)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!200231 (= lt!98829 (+!353 lt!98825 (tuple2!3653 k0!843 v!520)))))

(declare-datatypes ((Unit!5992 0))(
  ( (Unit!5993) )
))
(declare-fun lt!98827 () Unit!5992)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!32 (array!8891 array!8889 (_ BitVec 32) (_ BitVec 32) V!6089 V!6089 (_ BitVec 32) (_ BitVec 64) V!6089 (_ BitVec 32) Int) Unit!5992)

(assert (=> b!200231 (= lt!98827 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!32 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!289 (array!8891 array!8889 (_ BitVec 32) (_ BitVec 32) V!6089 V!6089 (_ BitVec 32) Int) ListLongMap!2567)

(assert (=> b!200231 (= lt!98823 (getCurrentListMapNoExtraKeys!289 _keys!825 lt!98826 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200231 (= lt!98826 (array!8890 (store (arr!4195 _values!649) i!601 (ValueCellFull!2072 v!520)) (size!4520 _values!649)))))

(assert (=> b!200231 (= lt!98825 (getCurrentListMapNoExtraKeys!289 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200232 () Bool)

(assert (=> b!200232 (= e!131324 tp_is_empty!4831)))

(declare-fun b!200233 () Bool)

(declare-fun res!95330 () Bool)

(assert (=> b!200233 (=> (not res!95330) (not e!131320))))

(declare-datatypes ((List!2575 0))(
  ( (Nil!2572) (Cons!2571 (h!3213 (_ BitVec 64)) (t!7498 List!2575)) )
))
(declare-fun arrayNoDuplicates!0 (array!8891 (_ BitVec 32) List!2575) Bool)

(assert (=> b!200233 (= res!95330 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2572))))

(declare-fun b!200234 () Bool)

(declare-fun res!95338 () Bool)

(assert (=> b!200234 (=> (not res!95338) (not e!131320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200234 (= res!95338 (validKeyInArray!0 k0!843))))

(declare-fun b!200235 () Bool)

(declare-fun res!95334 () Bool)

(assert (=> b!200235 (=> (not res!95334) (not e!131320))))

(assert (=> b!200235 (= res!95334 (and (= (size!4520 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4521 _keys!825) (size!4520 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200236 () Bool)

(declare-fun res!95337 () Bool)

(assert (=> b!200236 (=> (not res!95337) (not e!131320))))

(assert (=> b!200236 (= res!95337 (= (select (arr!4196 _keys!825) i!601) k0!843))))

(declare-fun b!200237 () Bool)

(declare-fun res!95335 () Bool)

(assert (=> b!200237 (=> (not res!95335) (not e!131320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8891 (_ BitVec 32)) Bool)

(assert (=> b!200237 (= res!95335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200238 () Bool)

(assert (=> b!200238 (= e!131318 (= lt!98830 (+!353 (+!353 lt!98829 lt!98831) lt!98828)))))

(declare-fun b!200239 () Bool)

(assert (=> b!200239 (= e!131322 true)))

(assert (=> b!200239 e!131318))

(declare-fun res!95331 () Bool)

(assert (=> b!200239 (=> (not res!95331) (not e!131318))))

(assert (=> b!200239 (= res!95331 (= lt!98830 (+!353 (+!353 lt!98823 lt!98831) lt!98828)))))

(assert (=> b!200239 (= lt!98828 (tuple2!3653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200239 (= lt!98831 (tuple2!3653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8315 () Bool)

(assert (=> mapIsEmpty!8315 mapRes!8315))

(declare-fun res!95332 () Bool)

(assert (=> start!20320 (=> (not res!95332) (not e!131320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20320 (= res!95332 (validMask!0 mask!1149))))

(assert (=> start!20320 e!131320))

(declare-fun array_inv!2735 (array!8889) Bool)

(assert (=> start!20320 (and (array_inv!2735 _values!649) e!131323)))

(assert (=> start!20320 true))

(assert (=> start!20320 tp_is_empty!4831))

(declare-fun array_inv!2736 (array!8891) Bool)

(assert (=> start!20320 (array_inv!2736 _keys!825)))

(assert (=> start!20320 tp!17957))

(assert (= (and start!20320 res!95332) b!200235))

(assert (= (and b!200235 res!95334) b!200237))

(assert (= (and b!200237 res!95335) b!200233))

(assert (= (and b!200233 res!95330) b!200227))

(assert (= (and b!200227 res!95333) b!200234))

(assert (= (and b!200234 res!95338) b!200236))

(assert (= (and b!200236 res!95337) b!200231))

(assert (= (and b!200231 (not res!95329)) b!200239))

(assert (= (and b!200239 res!95331) b!200230))

(assert (= (and b!200230 res!95336) b!200238))

(assert (= (and b!200228 condMapEmpty!8315) mapIsEmpty!8315))

(assert (= (and b!200228 (not condMapEmpty!8315)) mapNonEmpty!8315))

(get-info :version)

(assert (= (and mapNonEmpty!8315 ((_ is ValueCellFull!2072) mapValue!8315)) b!200229))

(assert (= (and b!200228 ((_ is ValueCellFull!2072) mapDefault!8315)) b!200232))

(assert (= start!20320 b!200228))

(declare-fun m!226773 () Bool)

(assert (=> b!200237 m!226773))

(declare-fun m!226775 () Bool)

(assert (=> mapNonEmpty!8315 m!226775))

(declare-fun m!226777 () Bool)

(assert (=> b!200238 m!226777))

(assert (=> b!200238 m!226777))

(declare-fun m!226779 () Bool)

(assert (=> b!200238 m!226779))

(declare-fun m!226781 () Bool)

(assert (=> b!200233 m!226781))

(declare-fun m!226783 () Bool)

(assert (=> b!200236 m!226783))

(declare-fun m!226785 () Bool)

(assert (=> b!200231 m!226785))

(declare-fun m!226787 () Bool)

(assert (=> b!200231 m!226787))

(declare-fun m!226789 () Bool)

(assert (=> b!200231 m!226789))

(declare-fun m!226791 () Bool)

(assert (=> b!200231 m!226791))

(declare-fun m!226793 () Bool)

(assert (=> b!200231 m!226793))

(declare-fun m!226795 () Bool)

(assert (=> b!200231 m!226795))

(declare-fun m!226797 () Bool)

(assert (=> b!200231 m!226797))

(declare-fun m!226799 () Bool)

(assert (=> b!200230 m!226799))

(assert (=> b!200230 m!226799))

(declare-fun m!226801 () Bool)

(assert (=> b!200230 m!226801))

(declare-fun m!226803 () Bool)

(assert (=> start!20320 m!226803))

(declare-fun m!226805 () Bool)

(assert (=> start!20320 m!226805))

(declare-fun m!226807 () Bool)

(assert (=> start!20320 m!226807))

(declare-fun m!226809 () Bool)

(assert (=> b!200239 m!226809))

(assert (=> b!200239 m!226809))

(declare-fun m!226811 () Bool)

(assert (=> b!200239 m!226811))

(declare-fun m!226813 () Bool)

(assert (=> b!200234 m!226813))

(check-sat (not b_next!4975) (not b!200233) (not b!200237) (not b!200231) (not mapNonEmpty!8315) (not b!200234) (not start!20320) (not b!200230) b_and!11735 (not b!200238) (not b!200239) tp_is_empty!4831)
(check-sat b_and!11735 (not b_next!4975))
