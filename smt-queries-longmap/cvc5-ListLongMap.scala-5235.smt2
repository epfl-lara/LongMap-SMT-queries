; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70490 () Bool)

(assert start!70490)

(declare-fun b_free!12817 () Bool)

(declare-fun b_next!12817 () Bool)

(assert (=> start!70490 (= b_free!12817 (not b_next!12817))))

(declare-fun tp!45184 () Bool)

(declare-fun b_and!21647 () Bool)

(assert (=> start!70490 (= tp!45184 b_and!21647)))

(declare-fun b!818787 () Bool)

(declare-fun e!454577 () Bool)

(declare-fun tp_is_empty!14527 () Bool)

(assert (=> b!818787 (= e!454577 tp_is_empty!14527)))

(declare-fun b!818788 () Bool)

(declare-fun e!454572 () Bool)

(assert (=> b!818788 (= e!454572 true)))

(declare-datatypes ((V!24371 0))(
  ( (V!24372 (val!7311 Int)) )
))
(declare-datatypes ((tuple2!9610 0))(
  ( (tuple2!9611 (_1!4816 (_ BitVec 64)) (_2!4816 V!24371)) )
))
(declare-datatypes ((List!15442 0))(
  ( (Nil!15439) (Cons!15438 (h!16567 tuple2!9610) (t!21771 List!15442)) )
))
(declare-datatypes ((ListLongMap!8433 0))(
  ( (ListLongMap!8434 (toList!4232 List!15442)) )
))
(declare-fun lt!367052 () ListLongMap!8433)

(declare-fun lt!367051 () tuple2!9610)

(declare-fun lt!367046 () tuple2!9610)

(declare-fun lt!367044 () ListLongMap!8433)

(declare-fun +!1829 (ListLongMap!8433 tuple2!9610) ListLongMap!8433)

(assert (=> b!818788 (= lt!367044 (+!1829 (+!1829 lt!367052 lt!367046) lt!367051))))

(declare-fun lt!367047 () ListLongMap!8433)

(declare-fun lt!367045 () ListLongMap!8433)

(assert (=> b!818788 (= (+!1829 lt!367047 lt!367051) (+!1829 lt!367045 lt!367051))))

(declare-fun zeroValueBefore!34 () V!24371)

(declare-fun zeroValueAfter!34 () V!24371)

(declare-datatypes ((Unit!27945 0))(
  ( (Unit!27946) )
))
(declare-fun lt!367048 () Unit!27945)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!170 (ListLongMap!8433 (_ BitVec 64) V!24371 V!24371) Unit!27945)

(assert (=> b!818788 (= lt!367048 (addSameAsAddTwiceSameKeyDiffValues!170 lt!367047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818788 (= lt!367051 (tuple2!9611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454571 () Bool)

(assert (=> b!818788 e!454571))

(declare-fun res!558758 () Bool)

(assert (=> b!818788 (=> (not res!558758) (not e!454571))))

(declare-fun lt!367043 () ListLongMap!8433)

(assert (=> b!818788 (= res!558758 (= lt!367043 lt!367045))))

(assert (=> b!818788 (= lt!367045 (+!1829 lt!367047 lt!367046))))

(assert (=> b!818788 (= lt!367046 (tuple2!9611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45252 0))(
  ( (array!45253 (arr!21680 (Array (_ BitVec 32) (_ BitVec 64))) (size!22101 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45252)

(declare-fun minValue!754 () V!24371)

(declare-datatypes ((ValueCell!6848 0))(
  ( (ValueCellFull!6848 (v!9740 V!24371)) (EmptyCell!6848) )
))
(declare-datatypes ((array!45254 0))(
  ( (array!45255 (arr!21681 (Array (_ BitVec 32) ValueCell!6848)) (size!22102 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45254)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!367050 () ListLongMap!8433)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2436 (array!45252 array!45254 (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 (_ BitVec 32) Int) ListLongMap!8433)

(assert (=> b!818788 (= lt!367050 (getCurrentListMap!2436 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818788 (= lt!367043 (getCurrentListMap!2436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818789 () Bool)

(declare-fun res!558757 () Bool)

(declare-fun e!454575 () Bool)

(assert (=> b!818789 (=> (not res!558757) (not e!454575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45252 (_ BitVec 32)) Bool)

(assert (=> b!818789 (= res!558757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818790 () Bool)

(declare-fun res!558760 () Bool)

(assert (=> b!818790 (=> (not res!558760) (not e!454575))))

(declare-datatypes ((List!15443 0))(
  ( (Nil!15440) (Cons!15439 (h!16568 (_ BitVec 64)) (t!21772 List!15443)) )
))
(declare-fun arrayNoDuplicates!0 (array!45252 (_ BitVec 32) List!15443) Bool)

(assert (=> b!818790 (= res!558760 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15440))))

(declare-fun b!818791 () Bool)

(assert (=> b!818791 (= e!454575 (not e!454572))))

(declare-fun res!558759 () Bool)

(assert (=> b!818791 (=> res!558759 e!454572)))

(assert (=> b!818791 (= res!558759 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818791 (= lt!367047 lt!367052)))

(declare-fun lt!367049 () Unit!27945)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!379 (array!45252 array!45254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 V!24371 V!24371 (_ BitVec 32) Int) Unit!27945)

(assert (=> b!818791 (= lt!367049 (lemmaNoChangeToArrayThenSameMapNoExtras!379 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2269 (array!45252 array!45254 (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 (_ BitVec 32) Int) ListLongMap!8433)

(assert (=> b!818791 (= lt!367052 (getCurrentListMapNoExtraKeys!2269 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818791 (= lt!367047 (getCurrentListMapNoExtraKeys!2269 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558761 () Bool)

(assert (=> start!70490 (=> (not res!558761) (not e!454575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70490 (= res!558761 (validMask!0 mask!1312))))

(assert (=> start!70490 e!454575))

(assert (=> start!70490 tp_is_empty!14527))

(declare-fun array_inv!17335 (array!45252) Bool)

(assert (=> start!70490 (array_inv!17335 _keys!976)))

(assert (=> start!70490 true))

(declare-fun e!454573 () Bool)

(declare-fun array_inv!17336 (array!45254) Bool)

(assert (=> start!70490 (and (array_inv!17336 _values!788) e!454573)))

(assert (=> start!70490 tp!45184))

(declare-fun mapIsEmpty!23389 () Bool)

(declare-fun mapRes!23389 () Bool)

(assert (=> mapIsEmpty!23389 mapRes!23389))

(declare-fun b!818792 () Bool)

(declare-fun res!558762 () Bool)

(assert (=> b!818792 (=> (not res!558762) (not e!454575))))

(assert (=> b!818792 (= res!558762 (and (= (size!22102 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22101 _keys!976) (size!22102 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818793 () Bool)

(assert (=> b!818793 (= e!454571 (= lt!367050 (+!1829 lt!367052 (tuple2!9611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818794 () Bool)

(declare-fun e!454576 () Bool)

(assert (=> b!818794 (= e!454576 tp_is_empty!14527)))

(declare-fun b!818795 () Bool)

(assert (=> b!818795 (= e!454573 (and e!454576 mapRes!23389))))

(declare-fun condMapEmpty!23389 () Bool)

(declare-fun mapDefault!23389 () ValueCell!6848)

