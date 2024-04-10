; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70598 () Bool)

(assert start!70598)

(declare-fun b_free!12905 () Bool)

(declare-fun b_next!12905 () Bool)

(assert (=> start!70598 (= b_free!12905 (not b_next!12905))))

(declare-fun tp!45451 () Bool)

(declare-fun b_and!21747 () Bool)

(assert (=> start!70598 (= tp!45451 b_and!21747)))

(declare-fun mapNonEmpty!23524 () Bool)

(declare-fun mapRes!23524 () Bool)

(declare-fun tp!45450 () Bool)

(declare-fun e!455619 () Bool)

(assert (=> mapNonEmpty!23524 (= mapRes!23524 (and tp!45450 e!455619))))

(declare-datatypes ((V!24487 0))(
  ( (V!24488 (val!7355 Int)) )
))
(declare-datatypes ((ValueCell!6892 0))(
  ( (ValueCellFull!6892 (v!9785 V!24487)) (EmptyCell!6892) )
))
(declare-fun mapValue!23524 () ValueCell!6892)

(declare-datatypes ((array!45424 0))(
  ( (array!45425 (arr!21765 (Array (_ BitVec 32) ValueCell!6892)) (size!22186 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45424)

(declare-fun mapKey!23524 () (_ BitVec 32))

(declare-fun mapRest!23524 () (Array (_ BitVec 32) ValueCell!6892))

(assert (=> mapNonEmpty!23524 (= (arr!21765 _values!788) (store mapRest!23524 mapKey!23524 mapValue!23524))))

(declare-fun mapIsEmpty!23524 () Bool)

(assert (=> mapIsEmpty!23524 mapRes!23524))

(declare-fun b!820169 () Bool)

(declare-fun res!559643 () Bool)

(declare-fun e!455624 () Bool)

(assert (=> b!820169 (=> (not res!559643) (not e!455624))))

(declare-datatypes ((array!45426 0))(
  ( (array!45427 (arr!21766 (Array (_ BitVec 32) (_ BitVec 64))) (size!22187 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45426)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45426 (_ BitVec 32)) Bool)

(assert (=> b!820169 (= res!559643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820170 () Bool)

(declare-fun res!559642 () Bool)

(assert (=> b!820170 (=> (not res!559642) (not e!455624))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820170 (= res!559642 (and (= (size!22186 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22187 _keys!976) (size!22186 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9688 0))(
  ( (tuple2!9689 (_1!4855 (_ BitVec 64)) (_2!4855 V!24487)) )
))
(declare-datatypes ((List!15511 0))(
  ( (Nil!15508) (Cons!15507 (h!16636 tuple2!9688) (t!21842 List!15511)) )
))
(declare-datatypes ((ListLongMap!8511 0))(
  ( (ListLongMap!8512 (toList!4271 List!15511)) )
))
(declare-fun lt!368521 () ListLongMap!8511)

(declare-fun b!820171 () Bool)

(declare-fun zeroValueAfter!34 () V!24487)

(declare-fun lt!368525 () ListLongMap!8511)

(declare-fun e!455621 () Bool)

(declare-fun +!1866 (ListLongMap!8511 tuple2!9688) ListLongMap!8511)

(assert (=> b!820171 (= e!455621 (= lt!368521 (+!1866 lt!368525 (tuple2!9689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820172 () Bool)

(declare-fun e!455625 () Bool)

(assert (=> b!820172 (= e!455624 (not e!455625))))

(declare-fun res!559641 () Bool)

(assert (=> b!820172 (=> res!559641 e!455625)))

(assert (=> b!820172 (= res!559641 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!368520 () ListLongMap!8511)

(assert (=> b!820172 (= lt!368520 lt!368525)))

(declare-fun zeroValueBefore!34 () V!24487)

(declare-datatypes ((Unit!28019 0))(
  ( (Unit!28020) )
))
(declare-fun lt!368517 () Unit!28019)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24487)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!408 (array!45426 array!45424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24487 V!24487 V!24487 V!24487 (_ BitVec 32) Int) Unit!28019)

(assert (=> b!820172 (= lt!368517 (lemmaNoChangeToArrayThenSameMapNoExtras!408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2298 (array!45426 array!45424 (_ BitVec 32) (_ BitVec 32) V!24487 V!24487 (_ BitVec 32) Int) ListLongMap!8511)

(assert (=> b!820172 (= lt!368525 (getCurrentListMapNoExtraKeys!2298 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820172 (= lt!368520 (getCurrentListMapNoExtraKeys!2298 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559646 () Bool)

(assert (=> start!70598 (=> (not res!559646) (not e!455624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70598 (= res!559646 (validMask!0 mask!1312))))

(assert (=> start!70598 e!455624))

(declare-fun tp_is_empty!14615 () Bool)

(assert (=> start!70598 tp_is_empty!14615))

(declare-fun array_inv!17399 (array!45426) Bool)

(assert (=> start!70598 (array_inv!17399 _keys!976)))

(assert (=> start!70598 true))

(declare-fun e!455623 () Bool)

(declare-fun array_inv!17400 (array!45424) Bool)

(assert (=> start!70598 (and (array_inv!17400 _values!788) e!455623)))

(assert (=> start!70598 tp!45451))

(declare-fun b!820173 () Bool)

(assert (=> b!820173 (= e!455625 true)))

(declare-fun lt!368524 () tuple2!9688)

(declare-fun lt!368523 () tuple2!9688)

(declare-fun lt!368522 () ListLongMap!8511)

(assert (=> b!820173 (= lt!368522 (+!1866 (+!1866 lt!368525 lt!368523) lt!368524))))

(declare-fun lt!368526 () ListLongMap!8511)

(assert (=> b!820173 (= (+!1866 lt!368520 lt!368524) (+!1866 lt!368526 lt!368524))))

(declare-fun lt!368518 () Unit!28019)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!202 (ListLongMap!8511 (_ BitVec 64) V!24487 V!24487) Unit!28019)

(assert (=> b!820173 (= lt!368518 (addSameAsAddTwiceSameKeyDiffValues!202 lt!368520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820173 (= lt!368524 (tuple2!9689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820173 e!455621))

(declare-fun res!559644 () Bool)

(assert (=> b!820173 (=> (not res!559644) (not e!455621))))

(declare-fun lt!368519 () ListLongMap!8511)

(assert (=> b!820173 (= res!559644 (= lt!368519 lt!368526))))

(assert (=> b!820173 (= lt!368526 (+!1866 lt!368520 lt!368523))))

(assert (=> b!820173 (= lt!368523 (tuple2!9689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2468 (array!45426 array!45424 (_ BitVec 32) (_ BitVec 32) V!24487 V!24487 (_ BitVec 32) Int) ListLongMap!8511)

(assert (=> b!820173 (= lt!368521 (getCurrentListMap!2468 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820173 (= lt!368519 (getCurrentListMap!2468 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820174 () Bool)

(declare-fun res!559645 () Bool)

(assert (=> b!820174 (=> (not res!559645) (not e!455624))))

(declare-datatypes ((List!15512 0))(
  ( (Nil!15509) (Cons!15508 (h!16637 (_ BitVec 64)) (t!21843 List!15512)) )
))
(declare-fun arrayNoDuplicates!0 (array!45426 (_ BitVec 32) List!15512) Bool)

(assert (=> b!820174 (= res!559645 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15509))))

(declare-fun b!820175 () Bool)

(assert (=> b!820175 (= e!455619 tp_is_empty!14615)))

(declare-fun b!820176 () Bool)

(declare-fun e!455620 () Bool)

(assert (=> b!820176 (= e!455620 tp_is_empty!14615)))

(declare-fun b!820177 () Bool)

(assert (=> b!820177 (= e!455623 (and e!455620 mapRes!23524))))

(declare-fun condMapEmpty!23524 () Bool)

(declare-fun mapDefault!23524 () ValueCell!6892)

