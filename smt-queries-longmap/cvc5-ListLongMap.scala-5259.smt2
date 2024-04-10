; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70674 () Bool)

(assert start!70674)

(declare-fun b_free!12961 () Bool)

(declare-fun b_next!12961 () Bool)

(assert (=> start!70674 (= b_free!12961 (not b_next!12961))))

(declare-fun tp!45621 () Bool)

(declare-fun b_and!21815 () Bool)

(assert (=> start!70674 (= tp!45621 b_and!21815)))

(declare-fun mapIsEmpty!23611 () Bool)

(declare-fun mapRes!23611 () Bool)

(assert (=> mapIsEmpty!23611 mapRes!23611))

(declare-fun b!820971 () Bool)

(declare-fun e!456184 () Bool)

(declare-fun tp_is_empty!14671 () Bool)

(assert (=> b!820971 (= e!456184 tp_is_empty!14671)))

(declare-fun b!820972 () Bool)

(declare-fun e!456186 () Bool)

(assert (=> b!820972 (= e!456186 tp_is_empty!14671)))

(declare-fun mapNonEmpty!23611 () Bool)

(declare-fun tp!45622 () Bool)

(assert (=> mapNonEmpty!23611 (= mapRes!23611 (and tp!45622 e!456186))))

(declare-datatypes ((V!24563 0))(
  ( (V!24564 (val!7383 Int)) )
))
(declare-datatypes ((ValueCell!6920 0))(
  ( (ValueCellFull!6920 (v!9814 V!24563)) (EmptyCell!6920) )
))
(declare-datatypes ((array!45536 0))(
  ( (array!45537 (arr!21820 (Array (_ BitVec 32) ValueCell!6920)) (size!22241 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45536)

(declare-fun mapKey!23611 () (_ BitVec 32))

(declare-fun mapValue!23611 () ValueCell!6920)

(declare-fun mapRest!23611 () (Array (_ BitVec 32) ValueCell!6920))

(assert (=> mapNonEmpty!23611 (= (arr!21820 _values!788) (store mapRest!23611 mapKey!23611 mapValue!23611))))

(declare-fun res!560092 () Bool)

(declare-fun e!456187 () Bool)

(assert (=> start!70674 (=> (not res!560092) (not e!456187))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70674 (= res!560092 (validMask!0 mask!1312))))

(assert (=> start!70674 e!456187))

(assert (=> start!70674 tp_is_empty!14671))

(declare-datatypes ((array!45538 0))(
  ( (array!45539 (arr!21821 (Array (_ BitVec 32) (_ BitVec 64))) (size!22242 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45538)

(declare-fun array_inv!17441 (array!45538) Bool)

(assert (=> start!70674 (array_inv!17441 _keys!976)))

(assert (=> start!70674 true))

(declare-fun e!456185 () Bool)

(declare-fun array_inv!17442 (array!45536) Bool)

(assert (=> start!70674 (and (array_inv!17442 _values!788) e!456185)))

(assert (=> start!70674 tp!45621))

(declare-fun b!820973 () Bool)

(declare-fun res!560091 () Bool)

(assert (=> b!820973 (=> (not res!560091) (not e!456187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45538 (_ BitVec 32)) Bool)

(assert (=> b!820973 (= res!560091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820974 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820974 (= e!456187 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!22242 _keys!976)))))))

(declare-datatypes ((tuple2!9736 0))(
  ( (tuple2!9737 (_1!4879 (_ BitVec 64)) (_2!4879 V!24563)) )
))
(declare-datatypes ((List!15555 0))(
  ( (Nil!15552) (Cons!15551 (h!16680 tuple2!9736) (t!21888 List!15555)) )
))
(declare-datatypes ((ListLongMap!8559 0))(
  ( (ListLongMap!8560 (toList!4295 List!15555)) )
))
(declare-fun lt!368993 () ListLongMap!8559)

(declare-fun lt!368994 () ListLongMap!8559)

(assert (=> b!820974 (= lt!368993 lt!368994)))

(declare-fun zeroValueBefore!34 () V!24563)

(declare-fun zeroValueAfter!34 () V!24563)

(declare-fun minValue!754 () V!24563)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28067 0))(
  ( (Unit!28068) )
))
(declare-fun lt!368995 () Unit!28067)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!431 (array!45538 array!45536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 V!24563 V!24563 (_ BitVec 32) Int) Unit!28067)

(assert (=> b!820974 (= lt!368995 (lemmaNoChangeToArrayThenSameMapNoExtras!431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2321 (array!45538 array!45536 (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 (_ BitVec 32) Int) ListLongMap!8559)

(assert (=> b!820974 (= lt!368994 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820974 (= lt!368993 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820975 () Bool)

(declare-fun res!560090 () Bool)

(assert (=> b!820975 (=> (not res!560090) (not e!456187))))

(declare-datatypes ((List!15556 0))(
  ( (Nil!15553) (Cons!15552 (h!16681 (_ BitVec 64)) (t!21889 List!15556)) )
))
(declare-fun arrayNoDuplicates!0 (array!45538 (_ BitVec 32) List!15556) Bool)

(assert (=> b!820975 (= res!560090 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15553))))

(declare-fun b!820976 () Bool)

(assert (=> b!820976 (= e!456185 (and e!456184 mapRes!23611))))

(declare-fun condMapEmpty!23611 () Bool)

(declare-fun mapDefault!23611 () ValueCell!6920)

