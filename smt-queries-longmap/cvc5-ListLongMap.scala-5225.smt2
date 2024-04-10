; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70414 () Bool)

(assert start!70414)

(declare-fun b_free!12757 () Bool)

(declare-fun b_next!12757 () Bool)

(assert (=> start!70414 (= b_free!12757 (not b_next!12757))))

(declare-fun tp!45000 () Bool)

(declare-fun b_and!21577 () Bool)

(assert (=> start!70414 (= tp!45000 b_and!21577)))

(declare-fun b!817899 () Bool)

(declare-fun res!558230 () Bool)

(declare-fun e!453922 () Bool)

(assert (=> b!817899 (=> (not res!558230) (not e!453922))))

(declare-datatypes ((array!45134 0))(
  ( (array!45135 (arr!21622 (Array (_ BitVec 32) (_ BitVec 64))) (size!22043 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45134)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45134 (_ BitVec 32)) Bool)

(assert (=> b!817899 (= res!558230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817900 () Bool)

(declare-fun e!453920 () Bool)

(declare-fun tp_is_empty!14467 () Bool)

(assert (=> b!817900 (= e!453920 tp_is_empty!14467)))

(declare-fun b!817901 () Bool)

(declare-fun e!453921 () Bool)

(assert (=> b!817901 (= e!453921 tp_is_empty!14467)))

(declare-fun mapIsEmpty!23296 () Bool)

(declare-fun mapRes!23296 () Bool)

(assert (=> mapIsEmpty!23296 mapRes!23296))

(declare-fun mapNonEmpty!23296 () Bool)

(declare-fun tp!45001 () Bool)

(assert (=> mapNonEmpty!23296 (= mapRes!23296 (and tp!45001 e!453920))))

(declare-datatypes ((V!24291 0))(
  ( (V!24292 (val!7281 Int)) )
))
(declare-datatypes ((ValueCell!6818 0))(
  ( (ValueCellFull!6818 (v!9710 V!24291)) (EmptyCell!6818) )
))
(declare-fun mapValue!23296 () ValueCell!6818)

(declare-datatypes ((array!45136 0))(
  ( (array!45137 (arr!21623 (Array (_ BitVec 32) ValueCell!6818)) (size!22044 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45136)

(declare-fun mapKey!23296 () (_ BitVec 32))

(declare-fun mapRest!23296 () (Array (_ BitVec 32) ValueCell!6818))

(assert (=> mapNonEmpty!23296 (= (arr!21623 _values!788) (store mapRest!23296 mapKey!23296 mapValue!23296))))

(declare-fun b!817902 () Bool)

(declare-fun res!558232 () Bool)

(assert (=> b!817902 (=> (not res!558232) (not e!453922))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817902 (= res!558232 (and (= (size!22044 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22043 _keys!976) (size!22044 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!558233 () Bool)

(assert (=> start!70414 (=> (not res!558233) (not e!453922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70414 (= res!558233 (validMask!0 mask!1312))))

(assert (=> start!70414 e!453922))

(assert (=> start!70414 tp_is_empty!14467))

(declare-fun array_inv!17295 (array!45134) Bool)

(assert (=> start!70414 (array_inv!17295 _keys!976)))

(assert (=> start!70414 true))

(declare-fun e!453918 () Bool)

(declare-fun array_inv!17296 (array!45136) Bool)

(assert (=> start!70414 (and (array_inv!17296 _values!788) e!453918)))

(assert (=> start!70414 tp!45000))

(declare-fun b!817903 () Bool)

(declare-fun e!453917 () Bool)

(assert (=> b!817903 (= e!453922 (not e!453917))))

(declare-fun res!558231 () Bool)

(assert (=> b!817903 (=> res!558231 e!453917)))

(assert (=> b!817903 (= res!558231 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9570 0))(
  ( (tuple2!9571 (_1!4796 (_ BitVec 64)) (_2!4796 V!24291)) )
))
(declare-datatypes ((List!15399 0))(
  ( (Nil!15396) (Cons!15395 (h!16524 tuple2!9570) (t!21726 List!15399)) )
))
(declare-datatypes ((ListLongMap!8393 0))(
  ( (ListLongMap!8394 (toList!4212 List!15399)) )
))
(declare-fun lt!366457 () ListLongMap!8393)

(declare-fun lt!366460 () ListLongMap!8393)

(assert (=> b!817903 (= lt!366457 lt!366460)))

(declare-fun zeroValueBefore!34 () V!24291)

(declare-fun zeroValueAfter!34 () V!24291)

(declare-fun minValue!754 () V!24291)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27908 0))(
  ( (Unit!27909) )
))
(declare-fun lt!366458 () Unit!27908)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!363 (array!45134 array!45136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 V!24291 V!24291 (_ BitVec 32) Int) Unit!27908)

(assert (=> b!817903 (= lt!366458 (lemmaNoChangeToArrayThenSameMapNoExtras!363 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2253 (array!45134 array!45136 (_ BitVec 32) (_ BitVec 32) V!24291 V!24291 (_ BitVec 32) Int) ListLongMap!8393)

(assert (=> b!817903 (= lt!366460 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817903 (= lt!366457 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817904 () Bool)

(assert (=> b!817904 (= e!453918 (and e!453921 mapRes!23296))))

(declare-fun condMapEmpty!23296 () Bool)

(declare-fun mapDefault!23296 () ValueCell!6818)

