; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70284 () Bool)

(assert start!70284)

(declare-fun b_free!12659 () Bool)

(declare-fun b_next!12659 () Bool)

(assert (=> start!70284 (= b_free!12659 (not b_next!12659))))

(declare-fun tp!44700 () Bool)

(declare-fun b_and!21459 () Bool)

(assert (=> start!70284 (= tp!44700 b_and!21459)))

(declare-fun mapNonEmpty!23143 () Bool)

(declare-fun mapRes!23143 () Bool)

(declare-fun tp!44701 () Bool)

(declare-fun e!452951 () Bool)

(assert (=> mapNonEmpty!23143 (= mapRes!23143 (and tp!44701 e!452951))))

(declare-datatypes ((V!24159 0))(
  ( (V!24160 (val!7232 Int)) )
))
(declare-datatypes ((ValueCell!6769 0))(
  ( (ValueCellFull!6769 (v!9660 V!24159)) (EmptyCell!6769) )
))
(declare-datatypes ((array!44940 0))(
  ( (array!44941 (arr!21527 (Array (_ BitVec 32) ValueCell!6769)) (size!21948 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44940)

(declare-fun mapKey!23143 () (_ BitVec 32))

(declare-fun mapValue!23143 () ValueCell!6769)

(declare-fun mapRest!23143 () (Array (_ BitVec 32) ValueCell!6769))

(assert (=> mapNonEmpty!23143 (= (arr!21527 _values!788) (store mapRest!23143 mapKey!23143 mapValue!23143))))

(declare-fun b!816535 () Bool)

(declare-fun res!557465 () Bool)

(declare-fun e!452955 () Bool)

(assert (=> b!816535 (=> (not res!557465) (not e!452955))))

(declare-datatypes ((array!44942 0))(
  ( (array!44943 (arr!21528 (Array (_ BitVec 32) (_ BitVec 64))) (size!21949 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44942)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816535 (= res!557465 (and (= (size!21948 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21949 _keys!976) (size!21948 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816536 () Bool)

(declare-fun e!452956 () Bool)

(declare-fun tp_is_empty!14369 () Bool)

(assert (=> b!816536 (= e!452956 tp_is_empty!14369)))

(declare-fun b!816537 () Bool)

(declare-fun e!452953 () Bool)

(assert (=> b!816537 (= e!452953 true)))

(declare-fun zeroValueAfter!34 () V!24159)

(declare-fun minValue!754 () V!24159)

(declare-datatypes ((tuple2!9504 0))(
  ( (tuple2!9505 (_1!4763 (_ BitVec 64)) (_2!4763 V!24159)) )
))
(declare-datatypes ((List!15333 0))(
  ( (Nil!15330) (Cons!15329 (h!16458 tuple2!9504) (t!21656 List!15333)) )
))
(declare-datatypes ((ListLongMap!8327 0))(
  ( (ListLongMap!8328 (toList!4179 List!15333)) )
))
(declare-fun lt!365737 () ListLongMap!8327)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2404 (array!44942 array!44940 (_ BitVec 32) (_ BitVec 32) V!24159 V!24159 (_ BitVec 32) Int) ListLongMap!8327)

(assert (=> b!816537 (= lt!365737 (getCurrentListMap!2404 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24159)

(declare-fun lt!365733 () ListLongMap!8327)

(declare-fun +!1810 (ListLongMap!8327 tuple2!9504) ListLongMap!8327)

(assert (=> b!816537 (= lt!365733 (+!1810 (getCurrentListMap!2404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23143 () Bool)

(assert (=> mapIsEmpty!23143 mapRes!23143))

(declare-fun b!816538 () Bool)

(declare-fun e!452954 () Bool)

(assert (=> b!816538 (= e!452954 (and e!452956 mapRes!23143))))

(declare-fun condMapEmpty!23143 () Bool)

(declare-fun mapDefault!23143 () ValueCell!6769)

