; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20992 () Bool)

(assert start!20992)

(declare-fun b_free!5563 () Bool)

(declare-fun b_next!5563 () Bool)

(assert (=> start!20992 (= b_free!5563 (not b_next!5563))))

(declare-fun tp!19742 () Bool)

(declare-fun b_and!12357 () Bool)

(assert (=> start!20992 (= tp!19742 b_and!12357)))

(declare-fun res!103019 () Bool)

(declare-fun e!137366 () Bool)

(assert (=> start!20992 (=> (not res!103019) (not e!137366))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20992 (= res!103019 (validMask!0 mask!1149))))

(assert (=> start!20992 e!137366))

(declare-datatypes ((V!6881 0))(
  ( (V!6882 (val!2757 Int)) )
))
(declare-datatypes ((ValueCell!2369 0))(
  ( (ValueCellFull!2369 (v!4743 V!6881)) (EmptyCell!2369) )
))
(declare-datatypes ((array!10049 0))(
  ( (array!10050 (arr!4771 (Array (_ BitVec 32) ValueCell!2369)) (size!5096 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10049)

(declare-fun e!137365 () Bool)

(declare-fun array_inv!3159 (array!10049) Bool)

(assert (=> start!20992 (and (array_inv!3159 _values!649) e!137365)))

(assert (=> start!20992 true))

(declare-fun tp_is_empty!5425 () Bool)

(assert (=> start!20992 tp_is_empty!5425))

(declare-datatypes ((array!10051 0))(
  ( (array!10052 (arr!4772 (Array (_ BitVec 32) (_ BitVec 64))) (size!5097 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10051)

(declare-fun array_inv!3160 (array!10051) Bool)

(assert (=> start!20992 (array_inv!3160 _keys!825)))

(assert (=> start!20992 tp!19742))

(declare-fun mapNonEmpty!9218 () Bool)

(declare-fun mapRes!9218 () Bool)

(declare-fun tp!19741 () Bool)

(declare-fun e!137364 () Bool)

(assert (=> mapNonEmpty!9218 (= mapRes!9218 (and tp!19741 e!137364))))

(declare-fun mapValue!9218 () ValueCell!2369)

(declare-fun mapKey!9218 () (_ BitVec 32))

(declare-fun mapRest!9218 () (Array (_ BitVec 32) ValueCell!2369))

(assert (=> mapNonEmpty!9218 (= (arr!4771 _values!649) (store mapRest!9218 mapKey!9218 mapValue!9218))))

(declare-fun b!210994 () Bool)

(declare-fun res!103018 () Bool)

(assert (=> b!210994 (=> (not res!103018) (not e!137366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10051 (_ BitVec 32)) Bool)

(assert (=> b!210994 (= res!103018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun e!137367 () Bool)

(declare-datatypes ((tuple2!4166 0))(
  ( (tuple2!4167 (_1!2094 (_ BitVec 64)) (_2!2094 V!6881)) )
))
(declare-datatypes ((List!3059 0))(
  ( (Nil!3056) (Cons!3055 (h!3697 tuple2!4166) (t!7998 List!3059)) )
))
(declare-datatypes ((ListLongMap!3079 0))(
  ( (ListLongMap!3080 (toList!1555 List!3059)) )
))
(declare-fun lt!108391 () ListLongMap!3079)

(declare-fun lt!108393 () ListLongMap!3079)

(declare-fun b!210995 () Bool)

(declare-fun zeroValue!615 () V!6881)

(declare-fun +!558 (ListLongMap!3079 tuple2!4166) ListLongMap!3079)

(assert (=> b!210995 (= e!137367 (= lt!108393 (+!558 lt!108391 (tuple2!4167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun b!210996 () Bool)

(declare-fun res!103020 () Bool)

(assert (=> b!210996 (=> (not res!103020) (not e!137366))))

(declare-datatypes ((List!3060 0))(
  ( (Nil!3057) (Cons!3056 (h!3698 (_ BitVec 64)) (t!7999 List!3060)) )
))
(declare-fun arrayNoDuplicates!0 (array!10051 (_ BitVec 32) List!3060) Bool)

(assert (=> b!210996 (= res!103020 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3057))))

(declare-fun b!210997 () Bool)

(declare-fun e!137368 () Bool)

(assert (=> b!210997 (= e!137368 tp_is_empty!5425)))

(declare-fun b!210998 () Bool)

(assert (=> b!210998 (= e!137366 (not e!137367))))

(declare-fun res!103022 () Bool)

(assert (=> b!210998 (=> res!103022 e!137367)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210998 (= res!103022 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!108394 () ListLongMap!3079)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6881)

(declare-fun getCurrentListMap!1089 (array!10051 array!10049 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) Int) ListLongMap!3079)

(assert (=> b!210998 (= lt!108394 (getCurrentListMap!1089 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108395 () array!10049)

(assert (=> b!210998 (= lt!108393 (getCurrentListMap!1089 _keys!825 lt!108395 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108390 () ListLongMap!3079)

(assert (=> b!210998 (and (= lt!108391 lt!108390) (= lt!108390 lt!108391))))

(declare-fun v!520 () V!6881)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!108392 () ListLongMap!3079)

(assert (=> b!210998 (= lt!108390 (+!558 lt!108392 (tuple2!4167 k!843 v!520)))))

(declare-datatypes ((Unit!6406 0))(
  ( (Unit!6407) )
))
(declare-fun lt!108396 () Unit!6406)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 (array!10051 array!10049 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) (_ BitVec 64) V!6881 (_ BitVec 32) Int) Unit!6406)

(assert (=> b!210998 (= lt!108396 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!491 (array!10051 array!10049 (_ BitVec 32) (_ BitVec 32) V!6881 V!6881 (_ BitVec 32) Int) ListLongMap!3079)

(assert (=> b!210998 (= lt!108391 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108395 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210998 (= lt!108395 (array!10050 (store (arr!4771 _values!649) i!601 (ValueCellFull!2369 v!520)) (size!5096 _values!649)))))

(assert (=> b!210998 (= lt!108392 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210999 () Bool)

(assert (=> b!210999 (= e!137365 (and e!137368 mapRes!9218))))

(declare-fun condMapEmpty!9218 () Bool)

(declare-fun mapDefault!9218 () ValueCell!2369)

