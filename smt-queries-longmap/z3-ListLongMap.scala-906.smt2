; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20536 () Bool)

(assert start!20536)

(declare-fun b_free!5191 () Bool)

(declare-fun b_next!5191 () Bool)

(assert (=> start!20536 (= b_free!5191 (not b_next!5191))))

(declare-fun tp!18605 () Bool)

(declare-fun b_and!11911 () Bool)

(assert (=> start!20536 (= tp!18605 b_and!11911)))

(declare-fun mapIsEmpty!8639 () Bool)

(declare-fun mapRes!8639 () Bool)

(assert (=> mapIsEmpty!8639 mapRes!8639))

(declare-fun b!203928 () Bool)

(declare-fun res!98139 () Bool)

(declare-fun e!133452 () Bool)

(assert (=> b!203928 (=> (not res!98139) (not e!133452))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203928 (= res!98139 (validKeyInArray!0 k0!843))))

(declare-fun b!203929 () Bool)

(declare-fun e!133456 () Bool)

(declare-fun tp_is_empty!5047 () Bool)

(assert (=> b!203929 (= e!133456 tp_is_empty!5047)))

(declare-fun b!203930 () Bool)

(declare-fun e!133457 () Bool)

(declare-fun e!133455 () Bool)

(assert (=> b!203930 (= e!133457 e!133455)))

(declare-fun res!98137 () Bool)

(assert (=> b!203930 (=> res!98137 e!133455)))

(assert (=> b!203930 (= res!98137 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6377 0))(
  ( (V!6378 (val!2568 Int)) )
))
(declare-datatypes ((tuple2!3874 0))(
  ( (tuple2!3875 (_1!1948 (_ BitVec 64)) (_2!1948 V!6377)) )
))
(declare-datatypes ((List!2782 0))(
  ( (Nil!2779) (Cons!2778 (h!3420 tuple2!3874) (t!7704 List!2782)) )
))
(declare-datatypes ((ListLongMap!2777 0))(
  ( (ListLongMap!2778 (toList!1404 List!2782)) )
))
(declare-fun lt!103073 () ListLongMap!2777)

(declare-fun lt!103077 () ListLongMap!2777)

(assert (=> b!203930 (= lt!103073 lt!103077)))

(declare-fun lt!103079 () ListLongMap!2777)

(declare-fun lt!103081 () tuple2!3874)

(declare-fun +!453 (ListLongMap!2777 tuple2!3874) ListLongMap!2777)

(assert (=> b!203930 (= lt!103077 (+!453 lt!103079 lt!103081))))

(declare-fun lt!103071 () ListLongMap!2777)

(declare-fun lt!103078 () ListLongMap!2777)

(assert (=> b!203930 (= lt!103071 lt!103078)))

(declare-fun lt!103082 () ListLongMap!2777)

(assert (=> b!203930 (= lt!103078 (+!453 lt!103082 lt!103081))))

(declare-fun lt!103080 () ListLongMap!2777)

(assert (=> b!203930 (= lt!103073 (+!453 lt!103080 lt!103081))))

(declare-fun zeroValue!615 () V!6377)

(assert (=> b!203930 (= lt!103081 (tuple2!3875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203931 () Bool)

(assert (=> b!203931 (= e!133452 (not e!133457))))

(declare-fun res!98138 () Bool)

(assert (=> b!203931 (=> res!98138 e!133457)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203931 (= res!98138 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2180 0))(
  ( (ValueCellFull!2180 (v!4532 V!6377)) (EmptyCell!2180) )
))
(declare-datatypes ((array!9299 0))(
  ( (array!9300 (arr!4399 (Array (_ BitVec 32) ValueCell!2180)) (size!4725 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9299)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9301 0))(
  ( (array!9302 (arr!4400 (Array (_ BitVec 32) (_ BitVec 64))) (size!4726 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9301)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6377)

(declare-fun getCurrentListMap!953 (array!9301 array!9299 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) Int) ListLongMap!2777)

(assert (=> b!203931 (= lt!103071 (getCurrentListMap!953 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103076 () array!9299)

(assert (=> b!203931 (= lt!103073 (getCurrentListMap!953 _keys!825 lt!103076 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203931 (and (= lt!103080 lt!103079) (= lt!103079 lt!103080))))

(declare-fun lt!103072 () tuple2!3874)

(assert (=> b!203931 (= lt!103079 (+!453 lt!103082 lt!103072))))

(declare-fun v!520 () V!6377)

(assert (=> b!203931 (= lt!103072 (tuple2!3875 k0!843 v!520))))

(declare-datatypes ((Unit!6150 0))(
  ( (Unit!6151) )
))
(declare-fun lt!103075 () Unit!6150)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!112 (array!9301 array!9299 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) (_ BitVec 64) V!6377 (_ BitVec 32) Int) Unit!6150)

(assert (=> b!203931 (= lt!103075 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!112 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!363 (array!9301 array!9299 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) Int) ListLongMap!2777)

(assert (=> b!203931 (= lt!103080 (getCurrentListMapNoExtraKeys!363 _keys!825 lt!103076 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203931 (= lt!103076 (array!9300 (store (arr!4399 _values!649) i!601 (ValueCellFull!2180 v!520)) (size!4725 _values!649)))))

(assert (=> b!203931 (= lt!103082 (getCurrentListMapNoExtraKeys!363 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203932 () Bool)

(declare-fun res!98141 () Bool)

(assert (=> b!203932 (=> (not res!98141) (not e!133452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9301 (_ BitVec 32)) Bool)

(assert (=> b!203932 (= res!98141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203933 () Bool)

(declare-fun res!98144 () Bool)

(assert (=> b!203933 (=> (not res!98144) (not e!133452))))

(assert (=> b!203933 (= res!98144 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4726 _keys!825))))))

(declare-fun b!203934 () Bool)

(assert (=> b!203934 (= e!133455 true)))

(assert (=> b!203934 (= lt!103077 (+!453 lt!103078 lt!103072))))

(declare-fun lt!103074 () Unit!6150)

(declare-fun addCommutativeForDiffKeys!147 (ListLongMap!2777 (_ BitVec 64) V!6377 (_ BitVec 64) V!6377) Unit!6150)

(assert (=> b!203934 (= lt!103074 (addCommutativeForDiffKeys!147 lt!103082 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203935 () Bool)

(declare-fun res!98140 () Bool)

(assert (=> b!203935 (=> (not res!98140) (not e!133452))))

(assert (=> b!203935 (= res!98140 (= (select (arr!4400 _keys!825) i!601) k0!843))))

(declare-fun b!203937 () Bool)

(declare-fun e!133454 () Bool)

(declare-fun e!133458 () Bool)

(assert (=> b!203937 (= e!133454 (and e!133458 mapRes!8639))))

(declare-fun condMapEmpty!8639 () Bool)

(declare-fun mapDefault!8639 () ValueCell!2180)

(assert (=> b!203937 (= condMapEmpty!8639 (= (arr!4399 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2180)) mapDefault!8639)))))

(declare-fun mapNonEmpty!8639 () Bool)

(declare-fun tp!18604 () Bool)

(assert (=> mapNonEmpty!8639 (= mapRes!8639 (and tp!18604 e!133456))))

(declare-fun mapValue!8639 () ValueCell!2180)

(declare-fun mapKey!8639 () (_ BitVec 32))

(declare-fun mapRest!8639 () (Array (_ BitVec 32) ValueCell!2180))

(assert (=> mapNonEmpty!8639 (= (arr!4399 _values!649) (store mapRest!8639 mapKey!8639 mapValue!8639))))

(declare-fun b!203938 () Bool)

(assert (=> b!203938 (= e!133458 tp_is_empty!5047)))

(declare-fun b!203939 () Bool)

(declare-fun res!98136 () Bool)

(assert (=> b!203939 (=> (not res!98136) (not e!133452))))

(assert (=> b!203939 (= res!98136 (and (= (size!4725 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4726 _keys!825) (size!4725 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!98142 () Bool)

(assert (=> start!20536 (=> (not res!98142) (not e!133452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20536 (= res!98142 (validMask!0 mask!1149))))

(assert (=> start!20536 e!133452))

(declare-fun array_inv!2887 (array!9299) Bool)

(assert (=> start!20536 (and (array_inv!2887 _values!649) e!133454)))

(assert (=> start!20536 true))

(assert (=> start!20536 tp_is_empty!5047))

(declare-fun array_inv!2888 (array!9301) Bool)

(assert (=> start!20536 (array_inv!2888 _keys!825)))

(assert (=> start!20536 tp!18605))

(declare-fun b!203936 () Bool)

(declare-fun res!98143 () Bool)

(assert (=> b!203936 (=> (not res!98143) (not e!133452))))

(declare-datatypes ((List!2783 0))(
  ( (Nil!2780) (Cons!2779 (h!3421 (_ BitVec 64)) (t!7705 List!2783)) )
))
(declare-fun arrayNoDuplicates!0 (array!9301 (_ BitVec 32) List!2783) Bool)

(assert (=> b!203936 (= res!98143 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2780))))

(assert (= (and start!20536 res!98142) b!203939))

(assert (= (and b!203939 res!98136) b!203932))

(assert (= (and b!203932 res!98141) b!203936))

(assert (= (and b!203936 res!98143) b!203933))

(assert (= (and b!203933 res!98144) b!203928))

(assert (= (and b!203928 res!98139) b!203935))

(assert (= (and b!203935 res!98140) b!203931))

(assert (= (and b!203931 (not res!98138)) b!203930))

(assert (= (and b!203930 (not res!98137)) b!203934))

(assert (= (and b!203937 condMapEmpty!8639) mapIsEmpty!8639))

(assert (= (and b!203937 (not condMapEmpty!8639)) mapNonEmpty!8639))

(get-info :version)

(assert (= (and mapNonEmpty!8639 ((_ is ValueCellFull!2180) mapValue!8639)) b!203929))

(assert (= (and b!203937 ((_ is ValueCellFull!2180) mapDefault!8639)) b!203938))

(assert (= start!20536 b!203937))

(declare-fun m!230955 () Bool)

(assert (=> b!203934 m!230955))

(declare-fun m!230957 () Bool)

(assert (=> b!203934 m!230957))

(declare-fun m!230959 () Bool)

(assert (=> b!203930 m!230959))

(declare-fun m!230961 () Bool)

(assert (=> b!203930 m!230961))

(declare-fun m!230963 () Bool)

(assert (=> b!203930 m!230963))

(declare-fun m!230965 () Bool)

(assert (=> b!203931 m!230965))

(declare-fun m!230967 () Bool)

(assert (=> b!203931 m!230967))

(declare-fun m!230969 () Bool)

(assert (=> b!203931 m!230969))

(declare-fun m!230971 () Bool)

(assert (=> b!203931 m!230971))

(declare-fun m!230973 () Bool)

(assert (=> b!203931 m!230973))

(declare-fun m!230975 () Bool)

(assert (=> b!203931 m!230975))

(declare-fun m!230977 () Bool)

(assert (=> b!203931 m!230977))

(declare-fun m!230979 () Bool)

(assert (=> start!20536 m!230979))

(declare-fun m!230981 () Bool)

(assert (=> start!20536 m!230981))

(declare-fun m!230983 () Bool)

(assert (=> start!20536 m!230983))

(declare-fun m!230985 () Bool)

(assert (=> b!203935 m!230985))

(declare-fun m!230987 () Bool)

(assert (=> b!203932 m!230987))

(declare-fun m!230989 () Bool)

(assert (=> b!203936 m!230989))

(declare-fun m!230991 () Bool)

(assert (=> mapNonEmpty!8639 m!230991))

(declare-fun m!230993 () Bool)

(assert (=> b!203928 m!230993))

(check-sat (not mapNonEmpty!8639) b_and!11911 tp_is_empty!5047 (not start!20536) (not b!203928) (not b!203934) (not b!203932) (not b_next!5191) (not b!203936) (not b!203930) (not b!203931))
(check-sat b_and!11911 (not b_next!5191))
