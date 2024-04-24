; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70434 () Bool)

(assert start!70434)

(declare-fun b_free!12643 () Bool)

(declare-fun b_next!12643 () Bool)

(assert (=> start!70434 (= b_free!12643 (not b_next!12643))))

(declare-fun tp!44652 () Bool)

(declare-fun b_and!21453 () Bool)

(assert (=> start!70434 (= tp!44652 b_and!21453)))

(declare-fun b!817237 () Bool)

(declare-fun e!453386 () Bool)

(declare-fun e!453388 () Bool)

(assert (=> b!817237 (= e!453386 (not e!453388))))

(declare-fun res!557689 () Bool)

(assert (=> b!817237 (=> res!557689 e!453388)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!817237 (= res!557689 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24139 0))(
  ( (V!24140 (val!7224 Int)) )
))
(declare-datatypes ((tuple2!9400 0))(
  ( (tuple2!9401 (_1!4711 (_ BitVec 64)) (_2!4711 V!24139)) )
))
(declare-datatypes ((List!15213 0))(
  ( (Nil!15210) (Cons!15209 (h!16344 tuple2!9400) (t!21528 List!15213)) )
))
(declare-datatypes ((ListLongMap!8225 0))(
  ( (ListLongMap!8226 (toList!4128 List!15213)) )
))
(declare-fun lt!365971 () ListLongMap!8225)

(declare-fun lt!365969 () ListLongMap!8225)

(assert (=> b!817237 (= lt!365971 lt!365969)))

(declare-fun zeroValueBefore!34 () V!24139)

(declare-datatypes ((array!44909 0))(
  ( (array!44910 (arr!21507 (Array (_ BitVec 32) (_ BitVec 64))) (size!21927 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44909)

(declare-fun zeroValueAfter!34 () V!24139)

(declare-fun minValue!754 () V!24139)

(declare-datatypes ((ValueCell!6761 0))(
  ( (ValueCellFull!6761 (v!9652 V!24139)) (EmptyCell!6761) )
))
(declare-datatypes ((array!44911 0))(
  ( (array!44912 (arr!21508 (Array (_ BitVec 32) ValueCell!6761)) (size!21928 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44911)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27817 0))(
  ( (Unit!27818) )
))
(declare-fun lt!365968 () Unit!27817)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!319 (array!44909 array!44911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 V!24139 V!24139 (_ BitVec 32) Int) Unit!27817)

(assert (=> b!817237 (= lt!365968 (lemmaNoChangeToArrayThenSameMapNoExtras!319 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2231 (array!44909 array!44911 (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 (_ BitVec 32) Int) ListLongMap!8225)

(assert (=> b!817237 (= lt!365969 (getCurrentListMapNoExtraKeys!2231 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817237 (= lt!365971 (getCurrentListMapNoExtraKeys!2231 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23119 () Bool)

(declare-fun mapRes!23119 () Bool)

(declare-fun tp!44653 () Bool)

(declare-fun e!453389 () Bool)

(assert (=> mapNonEmpty!23119 (= mapRes!23119 (and tp!44653 e!453389))))

(declare-fun mapRest!23119 () (Array (_ BitVec 32) ValueCell!6761))

(declare-fun mapKey!23119 () (_ BitVec 32))

(declare-fun mapValue!23119 () ValueCell!6761)

(assert (=> mapNonEmpty!23119 (= (arr!21508 _values!788) (store mapRest!23119 mapKey!23119 mapValue!23119))))

(declare-fun mapIsEmpty!23119 () Bool)

(assert (=> mapIsEmpty!23119 mapRes!23119))

(declare-fun b!817238 () Bool)

(declare-fun res!557690 () Bool)

(assert (=> b!817238 (=> (not res!557690) (not e!453386))))

(assert (=> b!817238 (= res!557690 (and (= (size!21928 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21927 _keys!976) (size!21928 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817239 () Bool)

(declare-fun res!557691 () Bool)

(assert (=> b!817239 (=> (not res!557691) (not e!453386))))

(declare-datatypes ((List!15214 0))(
  ( (Nil!15211) (Cons!15210 (h!16345 (_ BitVec 64)) (t!21529 List!15214)) )
))
(declare-fun arrayNoDuplicates!0 (array!44909 (_ BitVec 32) List!15214) Bool)

(assert (=> b!817239 (= res!557691 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15211))))

(declare-fun b!817240 () Bool)

(assert (=> b!817240 (= e!453388 true)))

(declare-fun lt!365970 () ListLongMap!8225)

(declare-fun getCurrentListMap!2347 (array!44909 array!44911 (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 (_ BitVec 32) Int) ListLongMap!8225)

(assert (=> b!817240 (= lt!365970 (getCurrentListMap!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365967 () ListLongMap!8225)

(declare-fun +!1807 (ListLongMap!8225 tuple2!9400) ListLongMap!8225)

(assert (=> b!817240 (= lt!365967 (+!1807 (getCurrentListMap!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!817241 () Bool)

(declare-fun tp_is_empty!14353 () Bool)

(assert (=> b!817241 (= e!453389 tp_is_empty!14353)))

(declare-fun b!817242 () Bool)

(declare-fun e!453390 () Bool)

(assert (=> b!817242 (= e!453390 tp_is_empty!14353)))

(declare-fun res!557688 () Bool)

(assert (=> start!70434 (=> (not res!557688) (not e!453386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70434 (= res!557688 (validMask!0 mask!1312))))

(assert (=> start!70434 e!453386))

(assert (=> start!70434 tp_is_empty!14353))

(declare-fun array_inv!17243 (array!44909) Bool)

(assert (=> start!70434 (array_inv!17243 _keys!976)))

(assert (=> start!70434 true))

(declare-fun e!453385 () Bool)

(declare-fun array_inv!17244 (array!44911) Bool)

(assert (=> start!70434 (and (array_inv!17244 _values!788) e!453385)))

(assert (=> start!70434 tp!44652))

(declare-fun b!817243 () Bool)

(declare-fun res!557692 () Bool)

(assert (=> b!817243 (=> (not res!557692) (not e!453386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44909 (_ BitVec 32)) Bool)

(assert (=> b!817243 (= res!557692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817244 () Bool)

(assert (=> b!817244 (= e!453385 (and e!453390 mapRes!23119))))

(declare-fun condMapEmpty!23119 () Bool)

(declare-fun mapDefault!23119 () ValueCell!6761)

(assert (=> b!817244 (= condMapEmpty!23119 (= (arr!21508 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6761)) mapDefault!23119)))))

(assert (= (and start!70434 res!557688) b!817238))

(assert (= (and b!817238 res!557690) b!817243))

(assert (= (and b!817243 res!557692) b!817239))

(assert (= (and b!817239 res!557691) b!817237))

(assert (= (and b!817237 (not res!557689)) b!817240))

(assert (= (and b!817244 condMapEmpty!23119) mapIsEmpty!23119))

(assert (= (and b!817244 (not condMapEmpty!23119)) mapNonEmpty!23119))

(get-info :version)

(assert (= (and mapNonEmpty!23119 ((_ is ValueCellFull!6761) mapValue!23119)) b!817241))

(assert (= (and b!817244 ((_ is ValueCellFull!6761) mapDefault!23119)) b!817242))

(assert (= start!70434 b!817244))

(declare-fun m!759257 () Bool)

(assert (=> start!70434 m!759257))

(declare-fun m!759259 () Bool)

(assert (=> start!70434 m!759259))

(declare-fun m!759261 () Bool)

(assert (=> start!70434 m!759261))

(declare-fun m!759263 () Bool)

(assert (=> b!817240 m!759263))

(declare-fun m!759265 () Bool)

(assert (=> b!817240 m!759265))

(assert (=> b!817240 m!759265))

(declare-fun m!759267 () Bool)

(assert (=> b!817240 m!759267))

(declare-fun m!759269 () Bool)

(assert (=> b!817239 m!759269))

(declare-fun m!759271 () Bool)

(assert (=> b!817243 m!759271))

(declare-fun m!759273 () Bool)

(assert (=> mapNonEmpty!23119 m!759273))

(declare-fun m!759275 () Bool)

(assert (=> b!817237 m!759275))

(declare-fun m!759277 () Bool)

(assert (=> b!817237 m!759277))

(declare-fun m!759279 () Bool)

(assert (=> b!817237 m!759279))

(check-sat (not b!817237) (not start!70434) (not b!817239) (not b!817240) (not b!817243) b_and!21453 tp_is_empty!14353 (not b_next!12643) (not mapNonEmpty!23119))
(check-sat b_and!21453 (not b_next!12643))
