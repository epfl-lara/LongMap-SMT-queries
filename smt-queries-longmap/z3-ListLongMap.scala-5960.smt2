; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77754 () Bool)

(assert start!77754)

(declare-fun b_free!16171 () Bool)

(declare-fun b_next!16171 () Bool)

(assert (=> start!77754 (= b_free!16171 (not b_next!16171))))

(declare-fun tp!56776 () Bool)

(declare-fun b_and!26547 () Bool)

(assert (=> start!77754 (= tp!56776 b_and!26547)))

(declare-fun b!905022 () Bool)

(declare-fun e!507194 () Bool)

(declare-fun tp_is_empty!18589 () Bool)

(assert (=> b!905022 (= e!507194 tp_is_empty!18589)))

(declare-fun res!610356 () Bool)

(declare-fun e!507191 () Bool)

(assert (=> start!77754 (=> (not res!610356) (not e!507191))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77754 (= res!610356 (validMask!0 mask!1756))))

(assert (=> start!77754 e!507191))

(declare-datatypes ((V!29751 0))(
  ( (V!29752 (val!9345 Int)) )
))
(declare-datatypes ((ValueCell!8813 0))(
  ( (ValueCellFull!8813 (v!11847 V!29751)) (EmptyCell!8813) )
))
(declare-datatypes ((array!53269 0))(
  ( (array!53270 (arr!25589 (Array (_ BitVec 32) ValueCell!8813)) (size!26049 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53269)

(declare-fun e!507189 () Bool)

(declare-fun array_inv!20112 (array!53269) Bool)

(assert (=> start!77754 (and (array_inv!20112 _values!1152) e!507189)))

(assert (=> start!77754 tp!56776))

(assert (=> start!77754 true))

(assert (=> start!77754 tp_is_empty!18589))

(declare-datatypes ((array!53271 0))(
  ( (array!53272 (arr!25590 (Array (_ BitVec 32) (_ BitVec 64))) (size!26050 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53271)

(declare-fun array_inv!20113 (array!53271) Bool)

(assert (=> start!77754 (array_inv!20113 _keys!1386)))

(declare-fun b!905023 () Bool)

(declare-fun e!507195 () Bool)

(assert (=> b!905023 (= e!507195 true)))

(declare-fun lt!408515 () V!29751)

(declare-datatypes ((tuple2!12070 0))(
  ( (tuple2!12071 (_1!6046 (_ BitVec 64)) (_2!6046 V!29751)) )
))
(declare-datatypes ((List!17921 0))(
  ( (Nil!17918) (Cons!17917 (h!19069 tuple2!12070) (t!25296 List!17921)) )
))
(declare-datatypes ((ListLongMap!10769 0))(
  ( (ListLongMap!10770 (toList!5400 List!17921)) )
))
(declare-fun lt!408516 () ListLongMap!10769)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!428 (ListLongMap!10769 (_ BitVec 64)) V!29751)

(assert (=> b!905023 (= lt!408515 (apply!428 lt!408516 k0!1033))))

(declare-fun b!905024 () Bool)

(declare-fun res!610359 () Bool)

(assert (=> b!905024 (=> (not res!610359) (not e!507191))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!905024 (= res!610359 (and (= (size!26049 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26050 _keys!1386) (size!26049 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29596 () Bool)

(declare-fun mapRes!29596 () Bool)

(assert (=> mapIsEmpty!29596 mapRes!29596))

(declare-fun b!905025 () Bool)

(declare-fun res!610357 () Bool)

(assert (=> b!905025 (=> (not res!610357) (not e!507191))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29751)

(declare-fun minValue!1094 () V!29751)

(declare-fun contains!4458 (ListLongMap!10769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2669 (array!53271 array!53269 (_ BitVec 32) (_ BitVec 32) V!29751 V!29751 (_ BitVec 32) Int) ListLongMap!10769)

(assert (=> b!905025 (= res!610357 (contains!4458 (getCurrentListMap!2669 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!905026 () Bool)

(declare-fun e!507193 () Bool)

(assert (=> b!905026 (= e!507193 tp_is_empty!18589)))

(declare-fun b!905027 () Bool)

(declare-fun e!507192 () Bool)

(assert (=> b!905027 (= e!507192 e!507195)))

(declare-fun res!610361 () Bool)

(assert (=> b!905027 (=> res!610361 e!507195)))

(assert (=> b!905027 (= res!610361 (not (contains!4458 lt!408516 k0!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905027 (= lt!408516 (getCurrentListMap!2669 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29596 () Bool)

(declare-fun tp!56775 () Bool)

(assert (=> mapNonEmpty!29596 (= mapRes!29596 (and tp!56775 e!507194))))

(declare-fun mapRest!29596 () (Array (_ BitVec 32) ValueCell!8813))

(declare-fun mapValue!29596 () ValueCell!8813)

(declare-fun mapKey!29596 () (_ BitVec 32))

(assert (=> mapNonEmpty!29596 (= (arr!25589 _values!1152) (store mapRest!29596 mapKey!29596 mapValue!29596))))

(declare-fun b!905028 () Bool)

(assert (=> b!905028 (= e!507191 (not e!507192))))

(declare-fun res!610360 () Bool)

(assert (=> b!905028 (=> res!610360 e!507192)))

(assert (=> b!905028 (= res!610360 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26050 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905028 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30666 0))(
  ( (Unit!30667) )
))
(declare-fun lt!408517 () Unit!30666)

(declare-fun lemmaKeyInListMapIsInArray!180 (array!53271 array!53269 (_ BitVec 32) (_ BitVec 32) V!29751 V!29751 (_ BitVec 64) Int) Unit!30666)

(assert (=> b!905028 (= lt!408517 (lemmaKeyInListMapIsInArray!180 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905029 () Bool)

(declare-fun res!610355 () Bool)

(assert (=> b!905029 (=> (not res!610355) (not e!507191))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905029 (= res!610355 (inRange!0 i!717 mask!1756))))

(declare-fun b!905030 () Bool)

(assert (=> b!905030 (= e!507189 (and e!507193 mapRes!29596))))

(declare-fun condMapEmpty!29596 () Bool)

(declare-fun mapDefault!29596 () ValueCell!8813)

(assert (=> b!905030 (= condMapEmpty!29596 (= (arr!25589 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8813)) mapDefault!29596)))))

(declare-fun b!905031 () Bool)

(declare-fun res!610358 () Bool)

(assert (=> b!905031 (=> (not res!610358) (not e!507191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53271 (_ BitVec 32)) Bool)

(assert (=> b!905031 (= res!610358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905032 () Bool)

(declare-fun res!610362 () Bool)

(assert (=> b!905032 (=> (not res!610362) (not e!507191))))

(assert (=> b!905032 (= res!610362 (and (= (select (arr!25590 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905033 () Bool)

(declare-fun res!610363 () Bool)

(assert (=> b!905033 (=> (not res!610363) (not e!507191))))

(declare-datatypes ((List!17922 0))(
  ( (Nil!17919) (Cons!17918 (h!19070 (_ BitVec 64)) (t!25297 List!17922)) )
))
(declare-fun arrayNoDuplicates!0 (array!53271 (_ BitVec 32) List!17922) Bool)

(assert (=> b!905033 (= res!610363 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17919))))

(assert (= (and start!77754 res!610356) b!905024))

(assert (= (and b!905024 res!610359) b!905031))

(assert (= (and b!905031 res!610358) b!905033))

(assert (= (and b!905033 res!610363) b!905025))

(assert (= (and b!905025 res!610357) b!905029))

(assert (= (and b!905029 res!610355) b!905032))

(assert (= (and b!905032 res!610362) b!905028))

(assert (= (and b!905028 (not res!610360)) b!905027))

(assert (= (and b!905027 (not res!610361)) b!905023))

(assert (= (and b!905030 condMapEmpty!29596) mapIsEmpty!29596))

(assert (= (and b!905030 (not condMapEmpty!29596)) mapNonEmpty!29596))

(get-info :version)

(assert (= (and mapNonEmpty!29596 ((_ is ValueCellFull!8813) mapValue!29596)) b!905022))

(assert (= (and b!905030 ((_ is ValueCellFull!8813) mapDefault!29596)) b!905026))

(assert (= start!77754 b!905030))

(declare-fun m!840959 () Bool)

(assert (=> b!905032 m!840959))

(declare-fun m!840961 () Bool)

(assert (=> b!905025 m!840961))

(assert (=> b!905025 m!840961))

(declare-fun m!840963 () Bool)

(assert (=> b!905025 m!840963))

(declare-fun m!840965 () Bool)

(assert (=> start!77754 m!840965))

(declare-fun m!840967 () Bool)

(assert (=> start!77754 m!840967))

(declare-fun m!840969 () Bool)

(assert (=> start!77754 m!840969))

(declare-fun m!840971 () Bool)

(assert (=> b!905029 m!840971))

(declare-fun m!840973 () Bool)

(assert (=> mapNonEmpty!29596 m!840973))

(declare-fun m!840975 () Bool)

(assert (=> b!905023 m!840975))

(declare-fun m!840977 () Bool)

(assert (=> b!905033 m!840977))

(declare-fun m!840979 () Bool)

(assert (=> b!905031 m!840979))

(declare-fun m!840981 () Bool)

(assert (=> b!905028 m!840981))

(declare-fun m!840983 () Bool)

(assert (=> b!905028 m!840983))

(declare-fun m!840985 () Bool)

(assert (=> b!905027 m!840985))

(declare-fun m!840987 () Bool)

(assert (=> b!905027 m!840987))

(check-sat (not b!905023) (not b!905033) (not mapNonEmpty!29596) (not b!905029) (not b!905025) (not start!77754) (not b_next!16171) (not b!905031) (not b!905027) b_and!26547 (not b!905028) tp_is_empty!18589)
(check-sat b_and!26547 (not b_next!16171))
