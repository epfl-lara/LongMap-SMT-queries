; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78014 () Bool)

(assert start!78014)

(declare-fun b_free!16405 () Bool)

(declare-fun b_next!16405 () Bool)

(assert (=> start!78014 (= b_free!16405 (not b_next!16405))))

(declare-fun tp!57480 () Bool)

(declare-fun b_and!26977 () Bool)

(assert (=> start!78014 (= tp!57480 b_and!26977)))

(declare-fun mapNonEmpty!29950 () Bool)

(declare-fun mapRes!29950 () Bool)

(declare-fun tp!57481 () Bool)

(declare-fun e!510040 () Bool)

(assert (=> mapNonEmpty!29950 (= mapRes!29950 (and tp!57481 e!510040))))

(declare-datatypes ((V!30063 0))(
  ( (V!30064 (val!9462 Int)) )
))
(declare-datatypes ((ValueCell!8930 0))(
  ( (ValueCellFull!8930 (v!11966 V!30063)) (EmptyCell!8930) )
))
(declare-datatypes ((array!53721 0))(
  ( (array!53722 (arr!25814 (Array (_ BitVec 32) ValueCell!8930)) (size!26274 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53721)

(declare-fun mapValue!29950 () ValueCell!8930)

(declare-fun mapRest!29950 () (Array (_ BitVec 32) ValueCell!8930))

(declare-fun mapKey!29950 () (_ BitVec 32))

(assert (=> mapNonEmpty!29950 (= (arr!25814 _values!1152) (store mapRest!29950 mapKey!29950 mapValue!29950))))

(declare-fun b!909868 () Bool)

(declare-fun res!613874 () Bool)

(declare-fun e!510038 () Bool)

(assert (=> b!909868 (=> (not res!613874) (not e!510038))))

(declare-datatypes ((array!53723 0))(
  ( (array!53724 (arr!25815 (Array (_ BitVec 32) (_ BitVec 64))) (size!26275 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53723)

(declare-datatypes ((List!18100 0))(
  ( (Nil!18097) (Cons!18096 (h!19248 (_ BitVec 64)) (t!25669 List!18100)) )
))
(declare-fun arrayNoDuplicates!0 (array!53723 (_ BitVec 32) List!18100) Bool)

(assert (=> b!909868 (= res!613874 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18097))))

(declare-fun b!909869 () Bool)

(declare-fun res!613869 () Bool)

(declare-fun e!510044 () Bool)

(assert (=> b!909869 (=> (not res!613869) (not e!510044))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!909869 (= res!613869 (and (= (select (arr!25815 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909870 () Bool)

(declare-fun res!613876 () Bool)

(assert (=> b!909870 (=> (not res!613876) (not e!510038))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53723 (_ BitVec 32)) Bool)

(assert (=> b!909870 (= res!613876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909872 () Bool)

(declare-fun e!510043 () Bool)

(declare-fun e!510045 () Bool)

(assert (=> b!909872 (= e!510043 (and e!510045 mapRes!29950))))

(declare-fun condMapEmpty!29950 () Bool)

(declare-fun mapDefault!29950 () ValueCell!8930)

(assert (=> b!909872 (= condMapEmpty!29950 (= (arr!25814 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8930)) mapDefault!29950)))))

(declare-fun b!909873 () Bool)

(declare-fun tp_is_empty!18823 () Bool)

(assert (=> b!909873 (= e!510040 tp_is_empty!18823)))

(declare-fun b!909874 () Bool)

(declare-fun res!613871 () Bool)

(declare-fun e!510039 () Bool)

(assert (=> b!909874 (=> res!613871 e!510039)))

(declare-datatypes ((tuple2!12278 0))(
  ( (tuple2!12279 (_1!6150 (_ BitVec 64)) (_2!6150 V!30063)) )
))
(declare-datatypes ((List!18101 0))(
  ( (Nil!18098) (Cons!18097 (h!19249 tuple2!12278) (t!25670 List!18101)) )
))
(declare-datatypes ((ListLongMap!10977 0))(
  ( (ListLongMap!10978 (toList!5504 List!18101)) )
))
(declare-fun lt!410270 () ListLongMap!10977)

(declare-fun lt!410269 () V!30063)

(declare-fun apply!519 (ListLongMap!10977 (_ BitVec 64)) V!30063)

(assert (=> b!909874 (= res!613871 (not (= (apply!519 lt!410270 k0!1033) lt!410269)))))

(declare-fun b!909875 () Bool)

(declare-fun e!510042 () Bool)

(assert (=> b!909875 (= e!510042 e!510039)))

(declare-fun res!613868 () Bool)

(assert (=> b!909875 (=> res!613868 e!510039)))

(declare-fun contains!4555 (ListLongMap!10977 (_ BitVec 64)) Bool)

(assert (=> b!909875 (= res!613868 (not (contains!4555 lt!410270 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30063)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30063)

(declare-fun getCurrentListMap!2765 (array!53723 array!53721 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 32) Int) ListLongMap!10977)

(assert (=> b!909875 (= lt!410270 (getCurrentListMap!2765 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909876 () Bool)

(assert (=> b!909876 (= e!510045 tp_is_empty!18823)))

(declare-fun b!909877 () Bool)

(declare-fun res!613875 () Bool)

(assert (=> b!909877 (=> (not res!613875) (not e!510038))))

(assert (=> b!909877 (= res!613875 (and (= (size!26274 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26275 _keys!1386) (size!26274 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909878 () Bool)

(assert (=> b!909878 (= e!510044 (not e!510042))))

(declare-fun res!613873 () Bool)

(assert (=> b!909878 (=> res!613873 e!510042)))

(assert (=> b!909878 (= res!613873 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26275 _keys!1386))))))

(declare-fun get!13604 (ValueCell!8930 V!30063) V!30063)

(declare-fun dynLambda!1401 (Int (_ BitVec 64)) V!30063)

(assert (=> b!909878 (= lt!410269 (get!13604 (select (arr!25814 _values!1152) i!717) (dynLambda!1401 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909878 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30844 0))(
  ( (Unit!30845) )
))
(declare-fun lt!410267 () Unit!30844)

(declare-fun lemmaKeyInListMapIsInArray!260 (array!53723 array!53721 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 64) Int) Unit!30844)

(assert (=> b!909878 (= lt!410267 (lemmaKeyInListMapIsInArray!260 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!909879 () Bool)

(assert (=> b!909879 (= e!510039 true)))

(declare-fun lt!410268 () ListLongMap!10977)

(assert (=> b!909879 (= (apply!519 lt!410268 k0!1033) lt!410269)))

(declare-fun lt!410271 () Unit!30844)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!62 (array!53723 array!53721 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 64) V!30063 (_ BitVec 32) Int) Unit!30844)

(assert (=> b!909879 (= lt!410271 (lemmaListMapApplyFromThenApplyFromZero!62 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410269 i!717 defaultEntry!1160))))

(declare-fun res!613877 () Bool)

(assert (=> start!78014 (=> (not res!613877) (not e!510038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78014 (= res!613877 (validMask!0 mask!1756))))

(assert (=> start!78014 e!510038))

(declare-fun array_inv!20266 (array!53721) Bool)

(assert (=> start!78014 (and (array_inv!20266 _values!1152) e!510043)))

(assert (=> start!78014 tp!57480))

(assert (=> start!78014 true))

(assert (=> start!78014 tp_is_empty!18823))

(declare-fun array_inv!20267 (array!53723) Bool)

(assert (=> start!78014 (array_inv!20267 _keys!1386)))

(declare-fun b!909871 () Bool)

(declare-fun res!613870 () Bool)

(assert (=> b!909871 (=> (not res!613870) (not e!510044))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909871 (= res!613870 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29950 () Bool)

(assert (=> mapIsEmpty!29950 mapRes!29950))

(declare-fun b!909880 () Bool)

(assert (=> b!909880 (= e!510038 e!510044)))

(declare-fun res!613872 () Bool)

(assert (=> b!909880 (=> (not res!613872) (not e!510044))))

(assert (=> b!909880 (= res!613872 (contains!4555 lt!410268 k0!1033))))

(assert (=> b!909880 (= lt!410268 (getCurrentListMap!2765 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!78014 res!613877) b!909877))

(assert (= (and b!909877 res!613875) b!909870))

(assert (= (and b!909870 res!613876) b!909868))

(assert (= (and b!909868 res!613874) b!909880))

(assert (= (and b!909880 res!613872) b!909871))

(assert (= (and b!909871 res!613870) b!909869))

(assert (= (and b!909869 res!613869) b!909878))

(assert (= (and b!909878 (not res!613873)) b!909875))

(assert (= (and b!909875 (not res!613868)) b!909874))

(assert (= (and b!909874 (not res!613871)) b!909879))

(assert (= (and b!909872 condMapEmpty!29950) mapIsEmpty!29950))

(assert (= (and b!909872 (not condMapEmpty!29950)) mapNonEmpty!29950))

(get-info :version)

(assert (= (and mapNonEmpty!29950 ((_ is ValueCellFull!8930) mapValue!29950)) b!909873))

(assert (= (and b!909872 ((_ is ValueCellFull!8930) mapDefault!29950)) b!909876))

(assert (= start!78014 b!909872))

(declare-fun b_lambda!13303 () Bool)

(assert (=> (not b_lambda!13303) (not b!909878)))

(declare-fun t!25668 () Bool)

(declare-fun tb!5419 () Bool)

(assert (=> (and start!78014 (= defaultEntry!1160 defaultEntry!1160) t!25668) tb!5419))

(declare-fun result!10643 () Bool)

(assert (=> tb!5419 (= result!10643 tp_is_empty!18823)))

(assert (=> b!909878 t!25668))

(declare-fun b_and!26979 () Bool)

(assert (= b_and!26977 (and (=> t!25668 result!10643) b_and!26979)))

(declare-fun m!845583 () Bool)

(assert (=> b!909880 m!845583))

(declare-fun m!845585 () Bool)

(assert (=> b!909880 m!845585))

(declare-fun m!845587 () Bool)

(assert (=> b!909869 m!845587))

(declare-fun m!845589 () Bool)

(assert (=> b!909874 m!845589))

(declare-fun m!845591 () Bool)

(assert (=> b!909871 m!845591))

(declare-fun m!845593 () Bool)

(assert (=> b!909868 m!845593))

(declare-fun m!845595 () Bool)

(assert (=> b!909878 m!845595))

(declare-fun m!845597 () Bool)

(assert (=> b!909878 m!845597))

(declare-fun m!845599 () Bool)

(assert (=> b!909878 m!845599))

(declare-fun m!845601 () Bool)

(assert (=> b!909878 m!845601))

(assert (=> b!909878 m!845595))

(assert (=> b!909878 m!845599))

(declare-fun m!845603 () Bool)

(assert (=> b!909878 m!845603))

(declare-fun m!845605 () Bool)

(assert (=> b!909875 m!845605))

(declare-fun m!845607 () Bool)

(assert (=> b!909875 m!845607))

(declare-fun m!845609 () Bool)

(assert (=> b!909879 m!845609))

(declare-fun m!845611 () Bool)

(assert (=> b!909879 m!845611))

(declare-fun m!845613 () Bool)

(assert (=> start!78014 m!845613))

(declare-fun m!845615 () Bool)

(assert (=> start!78014 m!845615))

(declare-fun m!845617 () Bool)

(assert (=> start!78014 m!845617))

(declare-fun m!845619 () Bool)

(assert (=> mapNonEmpty!29950 m!845619))

(declare-fun m!845621 () Bool)

(assert (=> b!909870 m!845621))

(check-sat (not mapNonEmpty!29950) (not b!909878) tp_is_empty!18823 (not b!909868) (not b!909870) (not b_lambda!13303) (not b!909875) (not b!909871) (not b_next!16405) (not b!909874) b_and!26979 (not start!78014) (not b!909879) (not b!909880))
(check-sat b_and!26979 (not b_next!16405))
