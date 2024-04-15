; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20866 () Bool)

(assert start!20866)

(declare-fun b_free!5515 () Bool)

(declare-fun b_next!5515 () Bool)

(assert (=> start!20866 (= b_free!5515 (not b_next!5515))))

(declare-fun tp!19586 () Bool)

(declare-fun b_and!12235 () Bool)

(assert (=> start!20866 (= tp!19586 b_and!12235)))

(declare-fun b!209243 () Bool)

(declare-fun res!101968 () Bool)

(declare-fun e!136323 () Bool)

(assert (=> b!209243 (=> (not res!101968) (not e!136323))))

(declare-datatypes ((array!9943 0))(
  ( (array!9944 (arr!4721 (Array (_ BitVec 32) (_ BitVec 64))) (size!5047 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9943)

(declare-datatypes ((List!3021 0))(
  ( (Nil!3018) (Cons!3017 (h!3659 (_ BitVec 64)) (t!7943 List!3021)) )
))
(declare-fun arrayNoDuplicates!0 (array!9943 (_ BitVec 32) List!3021) Bool)

(assert (=> b!209243 (= res!101968 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3018))))

(declare-fun b!209244 () Bool)

(declare-fun res!101972 () Bool)

(assert (=> b!209244 (=> (not res!101972) (not e!136323))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209244 (= res!101972 (= (select (arr!4721 _keys!825) i!601) k0!843))))

(declare-fun b!209245 () Bool)

(declare-fun res!101969 () Bool)

(assert (=> b!209245 (=> (not res!101969) (not e!136323))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6817 0))(
  ( (V!6818 (val!2733 Int)) )
))
(declare-datatypes ((ValueCell!2345 0))(
  ( (ValueCellFull!2345 (v!4697 V!6817)) (EmptyCell!2345) )
))
(declare-datatypes ((array!9945 0))(
  ( (array!9946 (arr!4722 (Array (_ BitVec 32) ValueCell!2345)) (size!5048 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9945)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!209245 (= res!101969 (and (= (size!5048 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5047 _keys!825) (size!5048 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9134 () Bool)

(declare-fun mapRes!9134 () Bool)

(assert (=> mapIsEmpty!9134 mapRes!9134))

(declare-fun mapNonEmpty!9134 () Bool)

(declare-fun tp!19585 () Bool)

(declare-fun e!136322 () Bool)

(assert (=> mapNonEmpty!9134 (= mapRes!9134 (and tp!19585 e!136322))))

(declare-fun mapValue!9134 () ValueCell!2345)

(declare-fun mapKey!9134 () (_ BitVec 32))

(declare-fun mapRest!9134 () (Array (_ BitVec 32) ValueCell!2345))

(assert (=> mapNonEmpty!9134 (= (arr!4722 _values!649) (store mapRest!9134 mapKey!9134 mapValue!9134))))

(declare-fun b!209246 () Bool)

(declare-fun e!136320 () Bool)

(declare-fun e!136319 () Bool)

(assert (=> b!209246 (= e!136320 (and e!136319 mapRes!9134))))

(declare-fun condMapEmpty!9134 () Bool)

(declare-fun mapDefault!9134 () ValueCell!2345)

(assert (=> b!209246 (= condMapEmpty!9134 (= (arr!4722 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2345)) mapDefault!9134)))))

(declare-fun b!209247 () Bool)

(assert (=> b!209247 (= e!136323 (not (bvslt i!601 (size!5048 _values!649))))))

(declare-datatypes ((tuple2!4112 0))(
  ( (tuple2!4113 (_1!2067 (_ BitVec 64)) (_2!2067 V!6817)) )
))
(declare-datatypes ((List!3022 0))(
  ( (Nil!3019) (Cons!3018 (h!3660 tuple2!4112) (t!7944 List!3022)) )
))
(declare-datatypes ((ListLongMap!3015 0))(
  ( (ListLongMap!3016 (toList!1523 List!3022)) )
))
(declare-fun lt!106820 () ListLongMap!3015)

(declare-fun lt!106819 () ListLongMap!3015)

(assert (=> b!209247 (and (= lt!106820 lt!106819) (= lt!106819 lt!106820))))

(declare-fun lt!106817 () ListLongMap!3015)

(declare-fun v!520 () V!6817)

(declare-fun +!547 (ListLongMap!3015 tuple2!4112) ListLongMap!3015)

(assert (=> b!209247 (= lt!106819 (+!547 lt!106817 (tuple2!4113 k0!843 v!520)))))

(declare-datatypes ((Unit!6334 0))(
  ( (Unit!6335) )
))
(declare-fun lt!106818 () Unit!6334)

(declare-fun zeroValue!615 () V!6817)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6817)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!198 (array!9943 array!9945 (_ BitVec 32) (_ BitVec 32) V!6817 V!6817 (_ BitVec 32) (_ BitVec 64) V!6817 (_ BitVec 32) Int) Unit!6334)

(assert (=> b!209247 (= lt!106818 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!198 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!474 (array!9943 array!9945 (_ BitVec 32) (_ BitVec 32) V!6817 V!6817 (_ BitVec 32) Int) ListLongMap!3015)

(assert (=> b!209247 (= lt!106820 (getCurrentListMapNoExtraKeys!474 _keys!825 (array!9946 (store (arr!4722 _values!649) i!601 (ValueCellFull!2345 v!520)) (size!5048 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209247 (= lt!106817 (getCurrentListMapNoExtraKeys!474 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209248 () Bool)

(declare-fun res!101970 () Bool)

(assert (=> b!209248 (=> (not res!101970) (not e!136323))))

(assert (=> b!209248 (= res!101970 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5047 _keys!825))))))

(declare-fun b!209249 () Bool)

(declare-fun tp_is_empty!5377 () Bool)

(assert (=> b!209249 (= e!136319 tp_is_empty!5377)))

(declare-fun b!209250 () Bool)

(assert (=> b!209250 (= e!136322 tp_is_empty!5377)))

(declare-fun res!101966 () Bool)

(assert (=> start!20866 (=> (not res!101966) (not e!136323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20866 (= res!101966 (validMask!0 mask!1149))))

(assert (=> start!20866 e!136323))

(declare-fun array_inv!3101 (array!9945) Bool)

(assert (=> start!20866 (and (array_inv!3101 _values!649) e!136320)))

(assert (=> start!20866 true))

(assert (=> start!20866 tp_is_empty!5377))

(declare-fun array_inv!3102 (array!9943) Bool)

(assert (=> start!20866 (array_inv!3102 _keys!825)))

(assert (=> start!20866 tp!19586))

(declare-fun b!209251 () Bool)

(declare-fun res!101971 () Bool)

(assert (=> b!209251 (=> (not res!101971) (not e!136323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209251 (= res!101971 (validKeyInArray!0 k0!843))))

(declare-fun b!209252 () Bool)

(declare-fun res!101967 () Bool)

(assert (=> b!209252 (=> (not res!101967) (not e!136323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9943 (_ BitVec 32)) Bool)

(assert (=> b!209252 (= res!101967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20866 res!101966) b!209245))

(assert (= (and b!209245 res!101969) b!209252))

(assert (= (and b!209252 res!101967) b!209243))

(assert (= (and b!209243 res!101968) b!209248))

(assert (= (and b!209248 res!101970) b!209251))

(assert (= (and b!209251 res!101971) b!209244))

(assert (= (and b!209244 res!101972) b!209247))

(assert (= (and b!209246 condMapEmpty!9134) mapIsEmpty!9134))

(assert (= (and b!209246 (not condMapEmpty!9134)) mapNonEmpty!9134))

(get-info :version)

(assert (= (and mapNonEmpty!9134 ((_ is ValueCellFull!2345) mapValue!9134)) b!209250))

(assert (= (and b!209246 ((_ is ValueCellFull!2345) mapDefault!9134)) b!209249))

(assert (= start!20866 b!209246))

(declare-fun m!236163 () Bool)

(assert (=> mapNonEmpty!9134 m!236163))

(declare-fun m!236165 () Bool)

(assert (=> b!209252 m!236165))

(declare-fun m!236167 () Bool)

(assert (=> b!209247 m!236167))

(declare-fun m!236169 () Bool)

(assert (=> b!209247 m!236169))

(declare-fun m!236171 () Bool)

(assert (=> b!209247 m!236171))

(declare-fun m!236173 () Bool)

(assert (=> b!209247 m!236173))

(declare-fun m!236175 () Bool)

(assert (=> b!209247 m!236175))

(declare-fun m!236177 () Bool)

(assert (=> b!209243 m!236177))

(declare-fun m!236179 () Bool)

(assert (=> b!209251 m!236179))

(declare-fun m!236181 () Bool)

(assert (=> b!209244 m!236181))

(declare-fun m!236183 () Bool)

(assert (=> start!20866 m!236183))

(declare-fun m!236185 () Bool)

(assert (=> start!20866 m!236185))

(declare-fun m!236187 () Bool)

(assert (=> start!20866 m!236187))

(check-sat (not b!209251) (not b!209243) b_and!12235 (not b!209252) (not b_next!5515) (not start!20866) tp_is_empty!5377 (not b!209247) (not mapNonEmpty!9134))
(check-sat b_and!12235 (not b_next!5515))
