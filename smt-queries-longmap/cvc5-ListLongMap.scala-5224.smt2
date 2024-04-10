; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70408 () Bool)

(assert start!70408)

(declare-fun b_free!12751 () Bool)

(declare-fun b_next!12751 () Bool)

(assert (=> start!70408 (= b_free!12751 (not b_next!12751))))

(declare-fun tp!44983 () Bool)

(declare-fun b_and!21571 () Bool)

(assert (=> start!70408 (= tp!44983 b_and!21571)))

(declare-fun b!817827 () Bool)

(declare-fun res!558186 () Bool)

(declare-fun e!453865 () Bool)

(assert (=> b!817827 (=> (not res!558186) (not e!453865))))

(declare-datatypes ((array!45122 0))(
  ( (array!45123 (arr!21616 (Array (_ BitVec 32) (_ BitVec 64))) (size!22037 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45122)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45122 (_ BitVec 32)) Bool)

(assert (=> b!817827 (= res!558186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817828 () Bool)

(declare-fun res!558184 () Bool)

(assert (=> b!817828 (=> (not res!558184) (not e!453865))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24283 0))(
  ( (V!24284 (val!7278 Int)) )
))
(declare-datatypes ((ValueCell!6815 0))(
  ( (ValueCellFull!6815 (v!9707 V!24283)) (EmptyCell!6815) )
))
(declare-datatypes ((array!45124 0))(
  ( (array!45125 (arr!21617 (Array (_ BitVec 32) ValueCell!6815)) (size!22038 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45124)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817828 (= res!558184 (and (= (size!22038 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22037 _keys!976) (size!22038 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!558187 () Bool)

(assert (=> start!70408 (=> (not res!558187) (not e!453865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70408 (= res!558187 (validMask!0 mask!1312))))

(assert (=> start!70408 e!453865))

(declare-fun tp_is_empty!14461 () Bool)

(assert (=> start!70408 tp_is_empty!14461))

(declare-fun array_inv!17289 (array!45122) Bool)

(assert (=> start!70408 (array_inv!17289 _keys!976)))

(assert (=> start!70408 true))

(declare-fun e!453867 () Bool)

(declare-fun array_inv!17290 (array!45124) Bool)

(assert (=> start!70408 (and (array_inv!17290 _values!788) e!453867)))

(assert (=> start!70408 tp!44983))

(declare-fun b!817829 () Bool)

(declare-fun e!453864 () Bool)

(assert (=> b!817829 (= e!453864 true)))

(declare-datatypes ((tuple2!9564 0))(
  ( (tuple2!9565 (_1!4793 (_ BitVec 64)) (_2!4793 V!24283)) )
))
(declare-datatypes ((List!15394 0))(
  ( (Nil!15391) (Cons!15390 (h!16519 tuple2!9564) (t!21721 List!15394)) )
))
(declare-datatypes ((ListLongMap!8387 0))(
  ( (ListLongMap!8388 (toList!4209 List!15394)) )
))
(declare-fun lt!366421 () ListLongMap!8387)

(declare-fun minValue!754 () V!24283)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24283)

(declare-fun getCurrentListMap!2416 (array!45122 array!45124 (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 (_ BitVec 32) Int) ListLongMap!8387)

(assert (=> b!817829 (= lt!366421 (getCurrentListMap!2416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23287 () Bool)

(declare-fun mapRes!23287 () Bool)

(assert (=> mapIsEmpty!23287 mapRes!23287))

(declare-fun b!817830 () Bool)

(declare-fun e!453863 () Bool)

(assert (=> b!817830 (= e!453863 tp_is_empty!14461)))

(declare-fun b!817831 () Bool)

(declare-fun e!453866 () Bool)

(assert (=> b!817831 (= e!453866 tp_is_empty!14461)))

(declare-fun b!817832 () Bool)

(assert (=> b!817832 (= e!453865 (not e!453864))))

(declare-fun res!558188 () Bool)

(assert (=> b!817832 (=> res!558188 e!453864)))

(assert (=> b!817832 (= res!558188 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366422 () ListLongMap!8387)

(declare-fun lt!366423 () ListLongMap!8387)

(assert (=> b!817832 (= lt!366422 lt!366423)))

(declare-fun zeroValueAfter!34 () V!24283)

(declare-datatypes ((Unit!27902 0))(
  ( (Unit!27903) )
))
(declare-fun lt!366424 () Unit!27902)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!360 (array!45122 array!45124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 V!24283 V!24283 (_ BitVec 32) Int) Unit!27902)

(assert (=> b!817832 (= lt!366424 (lemmaNoChangeToArrayThenSameMapNoExtras!360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2250 (array!45122 array!45124 (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 (_ BitVec 32) Int) ListLongMap!8387)

(assert (=> b!817832 (= lt!366423 (getCurrentListMapNoExtraKeys!2250 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817832 (= lt!366422 (getCurrentListMapNoExtraKeys!2250 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817833 () Bool)

(assert (=> b!817833 (= e!453867 (and e!453866 mapRes!23287))))

(declare-fun condMapEmpty!23287 () Bool)

(declare-fun mapDefault!23287 () ValueCell!6815)

