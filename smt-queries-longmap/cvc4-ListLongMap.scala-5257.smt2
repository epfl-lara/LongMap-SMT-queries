; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70666 () Bool)

(assert start!70666)

(declare-fun b_free!12953 () Bool)

(declare-fun b_next!12953 () Bool)

(assert (=> start!70666 (= b_free!12953 (not b_next!12953))))

(declare-fun tp!45597 () Bool)

(declare-fun b_and!21807 () Bool)

(assert (=> start!70666 (= tp!45597 b_and!21807)))

(declare-fun b!820887 () Bool)

(declare-fun e!456125 () Bool)

(assert (=> b!820887 (= e!456125 (not true))))

(declare-datatypes ((V!24551 0))(
  ( (V!24552 (val!7379 Int)) )
))
(declare-datatypes ((tuple2!9728 0))(
  ( (tuple2!9729 (_1!4875 (_ BitVec 64)) (_2!4875 V!24551)) )
))
(declare-datatypes ((List!15548 0))(
  ( (Nil!15545) (Cons!15544 (h!16673 tuple2!9728) (t!21881 List!15548)) )
))
(declare-datatypes ((ListLongMap!8551 0))(
  ( (ListLongMap!8552 (toList!4291 List!15548)) )
))
(declare-fun lt!368957 () ListLongMap!8551)

(declare-fun lt!368958 () ListLongMap!8551)

(assert (=> b!820887 (= lt!368957 lt!368958)))

(declare-fun zeroValueBefore!34 () V!24551)

(declare-datatypes ((array!45520 0))(
  ( (array!45521 (arr!21812 (Array (_ BitVec 32) (_ BitVec 64))) (size!22233 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45520)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24551)

(declare-fun minValue!754 () V!24551)

(declare-datatypes ((ValueCell!6916 0))(
  ( (ValueCellFull!6916 (v!9810 V!24551)) (EmptyCell!6916) )
))
(declare-datatypes ((array!45522 0))(
  ( (array!45523 (arr!21813 (Array (_ BitVec 32) ValueCell!6916)) (size!22234 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45522)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28059 0))(
  ( (Unit!28060) )
))
(declare-fun lt!368959 () Unit!28059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!427 (array!45520 array!45522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24551 V!24551 V!24551 V!24551 (_ BitVec 32) Int) Unit!28059)

(assert (=> b!820887 (= lt!368959 (lemmaNoChangeToArrayThenSameMapNoExtras!427 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2317 (array!45520 array!45522 (_ BitVec 32) (_ BitVec 32) V!24551 V!24551 (_ BitVec 32) Int) ListLongMap!8551)

(assert (=> b!820887 (= lt!368958 (getCurrentListMapNoExtraKeys!2317 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820887 (= lt!368957 (getCurrentListMapNoExtraKeys!2317 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820888 () Bool)

(declare-fun e!456123 () Bool)

(declare-fun tp_is_empty!14663 () Bool)

(assert (=> b!820888 (= e!456123 tp_is_empty!14663)))

(declare-fun b!820889 () Bool)

(declare-fun e!456124 () Bool)

(declare-fun mapRes!23599 () Bool)

(assert (=> b!820889 (= e!456124 (and e!456123 mapRes!23599))))

(declare-fun condMapEmpty!23599 () Bool)

(declare-fun mapDefault!23599 () ValueCell!6916)

