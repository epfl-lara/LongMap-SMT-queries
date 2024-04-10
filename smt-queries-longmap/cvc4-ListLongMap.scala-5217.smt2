; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70356 () Bool)

(assert start!70356)

(declare-fun b_free!12713 () Bool)

(declare-fun b_next!12713 () Bool)

(assert (=> start!70356 (= b_free!12713 (not b_next!12713))))

(declare-fun tp!44866 () Bool)

(declare-fun b_and!21525 () Bool)

(assert (=> start!70356 (= tp!44866 b_and!21525)))

(declare-fun mapNonEmpty!23227 () Bool)

(declare-fun mapRes!23227 () Bool)

(declare-fun tp!44865 () Bool)

(declare-fun e!453522 () Bool)

(assert (=> mapNonEmpty!23227 (= mapRes!23227 (and tp!44865 e!453522))))

(declare-fun mapKey!23227 () (_ BitVec 32))

(declare-datatypes ((V!24231 0))(
  ( (V!24232 (val!7259 Int)) )
))
(declare-datatypes ((ValueCell!6796 0))(
  ( (ValueCellFull!6796 (v!9688 V!24231)) (EmptyCell!6796) )
))
(declare-datatypes ((array!45046 0))(
  ( (array!45047 (arr!21579 (Array (_ BitVec 32) ValueCell!6796)) (size!22000 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45046)

(declare-fun mapRest!23227 () (Array (_ BitVec 32) ValueCell!6796))

(declare-fun mapValue!23227 () ValueCell!6796)

(assert (=> mapNonEmpty!23227 (= (arr!21579 _values!788) (store mapRest!23227 mapKey!23227 mapValue!23227))))

(declare-fun b!817341 () Bool)

(declare-fun res!557923 () Bool)

(declare-fun e!453525 () Bool)

(assert (=> b!817341 (=> (not res!557923) (not e!453525))))

(declare-datatypes ((array!45048 0))(
  ( (array!45049 (arr!21580 (Array (_ BitVec 32) (_ BitVec 64))) (size!22001 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45048)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817341 (= res!557923 (and (= (size!22000 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22001 _keys!976) (size!22000 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817342 () Bool)

(declare-fun res!557925 () Bool)

(assert (=> b!817342 (=> (not res!557925) (not e!453525))))

(declare-datatypes ((List!15367 0))(
  ( (Nil!15364) (Cons!15363 (h!16492 (_ BitVec 64)) (t!21692 List!15367)) )
))
(declare-fun arrayNoDuplicates!0 (array!45048 (_ BitVec 32) List!15367) Bool)

(assert (=> b!817342 (= res!557925 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15364))))

(declare-fun b!817343 () Bool)

(declare-fun tp_is_empty!14423 () Bool)

(assert (=> b!817343 (= e!453522 tp_is_empty!14423)))

(declare-fun b!817344 () Bool)

(assert (=> b!817344 (= e!453525 (not true))))

(declare-datatypes ((tuple2!9538 0))(
  ( (tuple2!9539 (_1!4780 (_ BitVec 64)) (_2!4780 V!24231)) )
))
(declare-datatypes ((List!15368 0))(
  ( (Nil!15365) (Cons!15364 (h!16493 tuple2!9538) (t!21693 List!15368)) )
))
(declare-datatypes ((ListLongMap!8361 0))(
  ( (ListLongMap!8362 (toList!4196 List!15368)) )
))
(declare-fun lt!366209 () ListLongMap!8361)

(declare-fun lt!366208 () ListLongMap!8361)

(assert (=> b!817344 (= lt!366209 lt!366208)))

(declare-fun zeroValueBefore!34 () V!24231)

(declare-fun zeroValueAfter!34 () V!24231)

(declare-fun minValue!754 () V!24231)

(declare-datatypes ((Unit!27876 0))(
  ( (Unit!27877) )
))
(declare-fun lt!366210 () Unit!27876)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!347 (array!45048 array!45046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24231 V!24231 V!24231 V!24231 (_ BitVec 32) Int) Unit!27876)

(assert (=> b!817344 (= lt!366210 (lemmaNoChangeToArrayThenSameMapNoExtras!347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2237 (array!45048 array!45046 (_ BitVec 32) (_ BitVec 32) V!24231 V!24231 (_ BitVec 32) Int) ListLongMap!8361)

(assert (=> b!817344 (= lt!366208 (getCurrentListMapNoExtraKeys!2237 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817344 (= lt!366209 (getCurrentListMapNoExtraKeys!2237 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817345 () Bool)

(declare-fun res!557924 () Bool)

(assert (=> b!817345 (=> (not res!557924) (not e!453525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45048 (_ BitVec 32)) Bool)

(assert (=> b!817345 (= res!557924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817346 () Bool)

(declare-fun e!453521 () Bool)

(assert (=> b!817346 (= e!453521 tp_is_empty!14423)))

(declare-fun res!557926 () Bool)

(assert (=> start!70356 (=> (not res!557926) (not e!453525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70356 (= res!557926 (validMask!0 mask!1312))))

(assert (=> start!70356 e!453525))

(assert (=> start!70356 tp_is_empty!14423))

(declare-fun array_inv!17267 (array!45048) Bool)

(assert (=> start!70356 (array_inv!17267 _keys!976)))

(assert (=> start!70356 true))

(declare-fun e!453523 () Bool)

(declare-fun array_inv!17268 (array!45046) Bool)

(assert (=> start!70356 (and (array_inv!17268 _values!788) e!453523)))

(assert (=> start!70356 tp!44866))

(declare-fun b!817347 () Bool)

(assert (=> b!817347 (= e!453523 (and e!453521 mapRes!23227))))

(declare-fun condMapEmpty!23227 () Bool)

(declare-fun mapDefault!23227 () ValueCell!6796)

