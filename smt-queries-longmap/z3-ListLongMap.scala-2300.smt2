; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37248 () Bool)

(assert start!37248)

(declare-fun b_free!8389 () Bool)

(declare-fun b_next!8389 () Bool)

(assert (=> start!37248 (= b_free!8389 (not b_next!8389))))

(declare-fun tp!29883 () Bool)

(declare-fun b_and!15605 () Bool)

(assert (=> start!37248 (= tp!29883 b_and!15605)))

(declare-fun b!376925 () Bool)

(declare-fun e!229491 () Bool)

(declare-fun e!229495 () Bool)

(declare-fun mapRes!15120 () Bool)

(assert (=> b!376925 (= e!229491 (and e!229495 mapRes!15120))))

(declare-fun condMapEmpty!15120 () Bool)

(declare-datatypes ((V!13155 0))(
  ( (V!13156 (val!4563 Int)) )
))
(declare-datatypes ((ValueCell!4175 0))(
  ( (ValueCellFull!4175 (v!6754 V!13155)) (EmptyCell!4175) )
))
(declare-datatypes ((array!21985 0))(
  ( (array!21986 (arr!10461 (Array (_ BitVec 32) ValueCell!4175)) (size!10814 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21985)

(declare-fun mapDefault!15120 () ValueCell!4175)

(assert (=> b!376925 (= condMapEmpty!15120 (= (arr!10461 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4175)) mapDefault!15120)))))

(declare-fun b!376926 () Bool)

(declare-fun e!229489 () Bool)

(declare-fun tp_is_empty!9037 () Bool)

(assert (=> b!376926 (= e!229489 tp_is_empty!9037)))

(declare-fun b!376927 () Bool)

(declare-fun res!213225 () Bool)

(declare-fun e!229493 () Bool)

(assert (=> b!376927 (=> (not res!213225) (not e!229493))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21987 0))(
  ( (array!21988 (arr!10462 (Array (_ BitVec 32) (_ BitVec 64))) (size!10815 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21987)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376927 (= res!213225 (and (= (size!10814 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10815 _keys!658) (size!10814 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376928 () Bool)

(declare-fun res!213233 () Bool)

(assert (=> b!376928 (=> (not res!213233) (not e!229493))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376928 (= res!213233 (validKeyInArray!0 k0!778))))

(declare-fun b!376929 () Bool)

(declare-fun res!213232 () Bool)

(assert (=> b!376929 (=> (not res!213232) (not e!229493))))

(declare-fun arrayContainsKey!0 (array!21987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376929 (= res!213232 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376930 () Bool)

(declare-fun res!213231 () Bool)

(assert (=> b!376930 (=> (not res!213231) (not e!229493))))

(declare-datatypes ((List!5894 0))(
  ( (Nil!5891) (Cons!5890 (h!6746 (_ BitVec 64)) (t!11035 List!5894)) )
))
(declare-fun arrayNoDuplicates!0 (array!21987 (_ BitVec 32) List!5894) Bool)

(assert (=> b!376930 (= res!213231 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5891))))

(declare-fun b!376931 () Bool)

(declare-fun res!213223 () Bool)

(assert (=> b!376931 (=> (not res!213223) (not e!229493))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376931 (= res!213223 (or (= (select (arr!10462 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10462 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15120 () Bool)

(assert (=> mapIsEmpty!15120 mapRes!15120))

(declare-fun b!376932 () Bool)

(assert (=> b!376932 (= e!229495 tp_is_empty!9037)))

(declare-fun mapNonEmpty!15120 () Bool)

(declare-fun tp!29882 () Bool)

(assert (=> mapNonEmpty!15120 (= mapRes!15120 (and tp!29882 e!229489))))

(declare-fun mapKey!15120 () (_ BitVec 32))

(declare-fun mapValue!15120 () ValueCell!4175)

(declare-fun mapRest!15120 () (Array (_ BitVec 32) ValueCell!4175))

(assert (=> mapNonEmpty!15120 (= (arr!10461 _values!506) (store mapRest!15120 mapKey!15120 mapValue!15120))))

(declare-fun b!376933 () Bool)

(declare-fun res!213227 () Bool)

(assert (=> b!376933 (=> (not res!213227) (not e!229493))))

(assert (=> b!376933 (= res!213227 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10815 _keys!658))))))

(declare-fun b!376934 () Bool)

(declare-fun e!229494 () Bool)

(declare-fun e!229490 () Bool)

(assert (=> b!376934 (= e!229494 (not e!229490))))

(declare-fun res!213228 () Bool)

(assert (=> b!376934 (=> res!213228 e!229490)))

(assert (=> b!376934 (= res!213228 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6064 0))(
  ( (tuple2!6065 (_1!3043 (_ BitVec 64)) (_2!3043 V!13155)) )
))
(declare-datatypes ((List!5895 0))(
  ( (Nil!5892) (Cons!5891 (h!6747 tuple2!6064) (t!11036 List!5895)) )
))
(declare-datatypes ((ListLongMap!4967 0))(
  ( (ListLongMap!4968 (toList!2499 List!5895)) )
))
(declare-fun lt!175053 () ListLongMap!4967)

(declare-fun zeroValue!472 () V!13155)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13155)

(declare-fun getCurrentListMap!1908 (array!21987 array!21985 (_ BitVec 32) (_ BitVec 32) V!13155 V!13155 (_ BitVec 32) Int) ListLongMap!4967)

(assert (=> b!376934 (= lt!175053 (getCurrentListMap!1908 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175052 () array!21987)

(declare-fun lt!175059 () array!21985)

(declare-fun lt!175062 () ListLongMap!4967)

(assert (=> b!376934 (= lt!175062 (getCurrentListMap!1908 lt!175052 lt!175059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175058 () ListLongMap!4967)

(declare-fun lt!175057 () ListLongMap!4967)

(assert (=> b!376934 (and (= lt!175058 lt!175057) (= lt!175057 lt!175058))))

(declare-fun lt!175061 () ListLongMap!4967)

(declare-fun lt!175050 () tuple2!6064)

(declare-fun +!867 (ListLongMap!4967 tuple2!6064) ListLongMap!4967)

(assert (=> b!376934 (= lt!175057 (+!867 lt!175061 lt!175050))))

(declare-fun v!373 () V!13155)

(assert (=> b!376934 (= lt!175050 (tuple2!6065 k0!778 v!373))))

(declare-datatypes ((Unit!11604 0))(
  ( (Unit!11605) )
))
(declare-fun lt!175051 () Unit!11604)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!101 (array!21987 array!21985 (_ BitVec 32) (_ BitVec 32) V!13155 V!13155 (_ BitVec 32) (_ BitVec 64) V!13155 (_ BitVec 32) Int) Unit!11604)

(assert (=> b!376934 (= lt!175051 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!101 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!773 (array!21987 array!21985 (_ BitVec 32) (_ BitVec 32) V!13155 V!13155 (_ BitVec 32) Int) ListLongMap!4967)

(assert (=> b!376934 (= lt!175058 (getCurrentListMapNoExtraKeys!773 lt!175052 lt!175059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376934 (= lt!175059 (array!21986 (store (arr!10461 _values!506) i!548 (ValueCellFull!4175 v!373)) (size!10814 _values!506)))))

(assert (=> b!376934 (= lt!175061 (getCurrentListMapNoExtraKeys!773 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!213226 () Bool)

(assert (=> start!37248 (=> (not res!213226) (not e!229493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37248 (= res!213226 (validMask!0 mask!970))))

(assert (=> start!37248 e!229493))

(declare-fun array_inv!7710 (array!21985) Bool)

(assert (=> start!37248 (and (array_inv!7710 _values!506) e!229491)))

(assert (=> start!37248 tp!29883))

(assert (=> start!37248 true))

(assert (=> start!37248 tp_is_empty!9037))

(declare-fun array_inv!7711 (array!21987) Bool)

(assert (=> start!37248 (array_inv!7711 _keys!658)))

(declare-fun b!376935 () Bool)

(declare-fun e!229496 () Bool)

(assert (=> b!376935 (= e!229496 true)))

(declare-fun lt!175054 () ListLongMap!4967)

(declare-fun lt!175056 () ListLongMap!4967)

(assert (=> b!376935 (= lt!175054 (+!867 lt!175056 lt!175050))))

(declare-fun lt!175060 () Unit!11604)

(declare-fun addCommutativeForDiffKeys!274 (ListLongMap!4967 (_ BitVec 64) V!13155 (_ BitVec 64) V!13155) Unit!11604)

(assert (=> b!376935 (= lt!175060 (addCommutativeForDiffKeys!274 lt!175061 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376936 () Bool)

(declare-fun res!213230 () Bool)

(assert (=> b!376936 (=> (not res!213230) (not e!229494))))

(assert (=> b!376936 (= res!213230 (arrayNoDuplicates!0 lt!175052 #b00000000000000000000000000000000 Nil!5891))))

(declare-fun b!376937 () Bool)

(assert (=> b!376937 (= e!229493 e!229494)))

(declare-fun res!213224 () Bool)

(assert (=> b!376937 (=> (not res!213224) (not e!229494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21987 (_ BitVec 32)) Bool)

(assert (=> b!376937 (= res!213224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175052 mask!970))))

(assert (=> b!376937 (= lt!175052 (array!21988 (store (arr!10462 _keys!658) i!548 k0!778) (size!10815 _keys!658)))))

(declare-fun b!376938 () Bool)

(declare-fun res!213222 () Bool)

(assert (=> b!376938 (=> (not res!213222) (not e!229493))))

(assert (=> b!376938 (= res!213222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376939 () Bool)

(assert (=> b!376939 (= e!229490 e!229496)))

(declare-fun res!213229 () Bool)

(assert (=> b!376939 (=> res!213229 e!229496)))

(assert (=> b!376939 (= res!213229 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376939 (= lt!175062 lt!175054)))

(declare-fun lt!175055 () tuple2!6064)

(assert (=> b!376939 (= lt!175054 (+!867 lt!175057 lt!175055))))

(assert (=> b!376939 (= lt!175053 lt!175056)))

(assert (=> b!376939 (= lt!175056 (+!867 lt!175061 lt!175055))))

(assert (=> b!376939 (= lt!175062 (+!867 lt!175058 lt!175055))))

(assert (=> b!376939 (= lt!175055 (tuple2!6065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37248 res!213226) b!376927))

(assert (= (and b!376927 res!213225) b!376938))

(assert (= (and b!376938 res!213222) b!376930))

(assert (= (and b!376930 res!213231) b!376933))

(assert (= (and b!376933 res!213227) b!376928))

(assert (= (and b!376928 res!213233) b!376931))

(assert (= (and b!376931 res!213223) b!376929))

(assert (= (and b!376929 res!213232) b!376937))

(assert (= (and b!376937 res!213224) b!376936))

(assert (= (and b!376936 res!213230) b!376934))

(assert (= (and b!376934 (not res!213228)) b!376939))

(assert (= (and b!376939 (not res!213229)) b!376935))

(assert (= (and b!376925 condMapEmpty!15120) mapIsEmpty!15120))

(assert (= (and b!376925 (not condMapEmpty!15120)) mapNonEmpty!15120))

(get-info :version)

(assert (= (and mapNonEmpty!15120 ((_ is ValueCellFull!4175) mapValue!15120)) b!376926))

(assert (= (and b!376925 ((_ is ValueCellFull!4175) mapDefault!15120)) b!376932))

(assert (= start!37248 b!376925))

(declare-fun m!373223 () Bool)

(assert (=> b!376929 m!373223))

(declare-fun m!373225 () Bool)

(assert (=> b!376939 m!373225))

(declare-fun m!373227 () Bool)

(assert (=> b!376939 m!373227))

(declare-fun m!373229 () Bool)

(assert (=> b!376939 m!373229))

(declare-fun m!373231 () Bool)

(assert (=> b!376936 m!373231))

(declare-fun m!373233 () Bool)

(assert (=> b!376931 m!373233))

(declare-fun m!373235 () Bool)

(assert (=> b!376930 m!373235))

(declare-fun m!373237 () Bool)

(assert (=> b!376935 m!373237))

(declare-fun m!373239 () Bool)

(assert (=> b!376935 m!373239))

(declare-fun m!373241 () Bool)

(assert (=> b!376937 m!373241))

(declare-fun m!373243 () Bool)

(assert (=> b!376937 m!373243))

(declare-fun m!373245 () Bool)

(assert (=> mapNonEmpty!15120 m!373245))

(declare-fun m!373247 () Bool)

(assert (=> b!376938 m!373247))

(declare-fun m!373249 () Bool)

(assert (=> b!376928 m!373249))

(declare-fun m!373251 () Bool)

(assert (=> start!37248 m!373251))

(declare-fun m!373253 () Bool)

(assert (=> start!37248 m!373253))

(declare-fun m!373255 () Bool)

(assert (=> start!37248 m!373255))

(declare-fun m!373257 () Bool)

(assert (=> b!376934 m!373257))

(declare-fun m!373259 () Bool)

(assert (=> b!376934 m!373259))

(declare-fun m!373261 () Bool)

(assert (=> b!376934 m!373261))

(declare-fun m!373263 () Bool)

(assert (=> b!376934 m!373263))

(declare-fun m!373265 () Bool)

(assert (=> b!376934 m!373265))

(declare-fun m!373267 () Bool)

(assert (=> b!376934 m!373267))

(declare-fun m!373269 () Bool)

(assert (=> b!376934 m!373269))

(check-sat tp_is_empty!9037 (not b!376937) (not b!376936) (not mapNonEmpty!15120) (not b!376938) (not start!37248) (not b_next!8389) b_and!15605 (not b!376935) (not b!376930) (not b!376928) (not b!376939) (not b!376934) (not b!376929))
(check-sat b_and!15605 (not b_next!8389))
