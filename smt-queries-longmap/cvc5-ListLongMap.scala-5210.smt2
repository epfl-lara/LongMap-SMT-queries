; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70292 () Bool)

(assert start!70292)

(declare-fun b_free!12667 () Bool)

(declare-fun b_next!12667 () Bool)

(assert (=> start!70292 (= b_free!12667 (not b_next!12667))))

(declare-fun tp!44724 () Bool)

(declare-fun b_and!21467 () Bool)

(assert (=> start!70292 (= tp!44724 b_and!21467)))

(declare-fun b!816631 () Bool)

(declare-fun e!453028 () Bool)

(assert (=> b!816631 (= e!453028 true)))

(declare-datatypes ((array!44954 0))(
  ( (array!44955 (arr!21534 (Array (_ BitVec 32) (_ BitVec 64))) (size!21955 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44954)

(declare-datatypes ((V!24171 0))(
  ( (V!24172 (val!7236 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24171)

(declare-fun minValue!754 () V!24171)

(declare-datatypes ((ValueCell!6773 0))(
  ( (ValueCellFull!6773 (v!9664 V!24171)) (EmptyCell!6773) )
))
(declare-datatypes ((array!44956 0))(
  ( (array!44957 (arr!21535 (Array (_ BitVec 32) ValueCell!6773)) (size!21956 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44956)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9510 0))(
  ( (tuple2!9511 (_1!4766 (_ BitVec 64)) (_2!4766 V!24171)) )
))
(declare-datatypes ((List!15338 0))(
  ( (Nil!15335) (Cons!15334 (h!16463 tuple2!9510) (t!21661 List!15338)) )
))
(declare-datatypes ((ListLongMap!8333 0))(
  ( (ListLongMap!8334 (toList!4182 List!15338)) )
))
(declare-fun lt!365793 () ListLongMap!8333)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2407 (array!44954 array!44956 (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 (_ BitVec 32) Int) ListLongMap!8333)

(assert (=> b!816631 (= lt!365793 (getCurrentListMap!2407 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24171)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365797 () ListLongMap!8333)

(declare-fun +!1813 (ListLongMap!8333 tuple2!9510) ListLongMap!8333)

(assert (=> b!816631 (= lt!365797 (+!1813 (getCurrentListMap!2407 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816632 () Bool)

(declare-fun res!557525 () Bool)

(declare-fun e!453025 () Bool)

(assert (=> b!816632 (=> (not res!557525) (not e!453025))))

(assert (=> b!816632 (= res!557525 (and (= (size!21956 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21955 _keys!976) (size!21956 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557526 () Bool)

(assert (=> start!70292 (=> (not res!557526) (not e!453025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70292 (= res!557526 (validMask!0 mask!1312))))

(assert (=> start!70292 e!453025))

(declare-fun tp_is_empty!14377 () Bool)

(assert (=> start!70292 tp_is_empty!14377))

(declare-fun array_inv!17231 (array!44954) Bool)

(assert (=> start!70292 (array_inv!17231 _keys!976)))

(assert (=> start!70292 true))

(declare-fun e!453023 () Bool)

(declare-fun array_inv!17232 (array!44956) Bool)

(assert (=> start!70292 (and (array_inv!17232 _values!788) e!453023)))

(assert (=> start!70292 tp!44724))

(declare-fun mapNonEmpty!23155 () Bool)

(declare-fun mapRes!23155 () Bool)

(declare-fun tp!44725 () Bool)

(declare-fun e!453026 () Bool)

(assert (=> mapNonEmpty!23155 (= mapRes!23155 (and tp!44725 e!453026))))

(declare-fun mapRest!23155 () (Array (_ BitVec 32) ValueCell!6773))

(declare-fun mapKey!23155 () (_ BitVec 32))

(declare-fun mapValue!23155 () ValueCell!6773)

(assert (=> mapNonEmpty!23155 (= (arr!21535 _values!788) (store mapRest!23155 mapKey!23155 mapValue!23155))))

(declare-fun b!816633 () Bool)

(declare-fun res!557522 () Bool)

(assert (=> b!816633 (=> (not res!557522) (not e!453025))))

(declare-datatypes ((List!15339 0))(
  ( (Nil!15336) (Cons!15335 (h!16464 (_ BitVec 64)) (t!21662 List!15339)) )
))
(declare-fun arrayNoDuplicates!0 (array!44954 (_ BitVec 32) List!15339) Bool)

(assert (=> b!816633 (= res!557522 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15336))))

(declare-fun b!816634 () Bool)

(declare-fun e!453024 () Bool)

(assert (=> b!816634 (= e!453023 (and e!453024 mapRes!23155))))

(declare-fun condMapEmpty!23155 () Bool)

(declare-fun mapDefault!23155 () ValueCell!6773)

