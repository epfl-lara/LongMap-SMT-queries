; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70412 () Bool)

(assert start!70412)

(declare-fun b_free!12755 () Bool)

(declare-fun b_next!12755 () Bool)

(assert (=> start!70412 (= b_free!12755 (not b_next!12755))))

(declare-fun tp!44995 () Bool)

(declare-fun b_and!21575 () Bool)

(assert (=> start!70412 (= tp!44995 b_and!21575)))

(declare-fun b!817875 () Bool)

(declare-fun e!453903 () Bool)

(declare-fun tp_is_empty!14465 () Bool)

(assert (=> b!817875 (= e!453903 tp_is_empty!14465)))

(declare-fun mapIsEmpty!23293 () Bool)

(declare-fun mapRes!23293 () Bool)

(assert (=> mapIsEmpty!23293 mapRes!23293))

(declare-fun b!817877 () Bool)

(declare-fun res!558218 () Bool)

(declare-fun e!453901 () Bool)

(assert (=> b!817877 (=> (not res!558218) (not e!453901))))

(declare-datatypes ((array!45130 0))(
  ( (array!45131 (arr!21620 (Array (_ BitVec 32) (_ BitVec 64))) (size!22041 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45130)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45130 (_ BitVec 32)) Bool)

(assert (=> b!817877 (= res!558218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817878 () Bool)

(declare-fun e!453900 () Bool)

(assert (=> b!817878 (= e!453900 true)))

(declare-datatypes ((V!24287 0))(
  ( (V!24288 (val!7280 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24287)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24287)

(declare-datatypes ((ValueCell!6817 0))(
  ( (ValueCellFull!6817 (v!9709 V!24287)) (EmptyCell!6817) )
))
(declare-datatypes ((array!45132 0))(
  ( (array!45133 (arr!21621 (Array (_ BitVec 32) ValueCell!6817)) (size!22042 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45132)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9568 0))(
  ( (tuple2!9569 (_1!4795 (_ BitVec 64)) (_2!4795 V!24287)) )
))
(declare-datatypes ((List!15397 0))(
  ( (Nil!15394) (Cons!15393 (h!16522 tuple2!9568) (t!21724 List!15397)) )
))
(declare-datatypes ((ListLongMap!8391 0))(
  ( (ListLongMap!8392 (toList!4211 List!15397)) )
))
(declare-fun lt!366448 () ListLongMap!8391)

(declare-fun getCurrentListMap!2418 (array!45130 array!45132 (_ BitVec 32) (_ BitVec 32) V!24287 V!24287 (_ BitVec 32) Int) ListLongMap!8391)

(assert (=> b!817878 (= lt!366448 (getCurrentListMap!2418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817879 () Bool)

(assert (=> b!817879 (= e!453901 (not e!453900))))

(declare-fun res!558216 () Bool)

(assert (=> b!817879 (=> res!558216 e!453900)))

(assert (=> b!817879 (= res!558216 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366446 () ListLongMap!8391)

(declare-fun lt!366447 () ListLongMap!8391)

(assert (=> b!817879 (= lt!366446 lt!366447)))

(declare-fun zeroValueAfter!34 () V!24287)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27906 0))(
  ( (Unit!27907) )
))
(declare-fun lt!366445 () Unit!27906)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!362 (array!45130 array!45132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24287 V!24287 V!24287 V!24287 (_ BitVec 32) Int) Unit!27906)

(assert (=> b!817879 (= lt!366445 (lemmaNoChangeToArrayThenSameMapNoExtras!362 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2252 (array!45130 array!45132 (_ BitVec 32) (_ BitVec 32) V!24287 V!24287 (_ BitVec 32) Int) ListLongMap!8391)

(assert (=> b!817879 (= lt!366447 (getCurrentListMapNoExtraKeys!2252 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817879 (= lt!366446 (getCurrentListMapNoExtraKeys!2252 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817880 () Bool)

(declare-fun e!453904 () Bool)

(assert (=> b!817880 (= e!453904 tp_is_empty!14465)))

(declare-fun mapNonEmpty!23293 () Bool)

(declare-fun tp!44994 () Bool)

(assert (=> mapNonEmpty!23293 (= mapRes!23293 (and tp!44994 e!453904))))

(declare-fun mapKey!23293 () (_ BitVec 32))

(declare-fun mapRest!23293 () (Array (_ BitVec 32) ValueCell!6817))

(declare-fun mapValue!23293 () ValueCell!6817)

(assert (=> mapNonEmpty!23293 (= (arr!21621 _values!788) (store mapRest!23293 mapKey!23293 mapValue!23293))))

(declare-fun b!817876 () Bool)

(declare-fun res!558217 () Bool)

(assert (=> b!817876 (=> (not res!558217) (not e!453901))))

(declare-datatypes ((List!15398 0))(
  ( (Nil!15395) (Cons!15394 (h!16523 (_ BitVec 64)) (t!21725 List!15398)) )
))
(declare-fun arrayNoDuplicates!0 (array!45130 (_ BitVec 32) List!15398) Bool)

(assert (=> b!817876 (= res!558217 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15395))))

(declare-fun res!558214 () Bool)

(assert (=> start!70412 (=> (not res!558214) (not e!453901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70412 (= res!558214 (validMask!0 mask!1312))))

(assert (=> start!70412 e!453901))

(assert (=> start!70412 tp_is_empty!14465))

(declare-fun array_inv!17293 (array!45130) Bool)

(assert (=> start!70412 (array_inv!17293 _keys!976)))

(assert (=> start!70412 true))

(declare-fun e!453902 () Bool)

(declare-fun array_inv!17294 (array!45132) Bool)

(assert (=> start!70412 (and (array_inv!17294 _values!788) e!453902)))

(assert (=> start!70412 tp!44995))

(declare-fun b!817881 () Bool)

(assert (=> b!817881 (= e!453902 (and e!453903 mapRes!23293))))

(declare-fun condMapEmpty!23293 () Bool)

(declare-fun mapDefault!23293 () ValueCell!6817)

