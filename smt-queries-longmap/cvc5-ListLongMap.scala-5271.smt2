; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70776 () Bool)

(assert start!70776)

(declare-fun b_free!13033 () Bool)

(declare-fun b_next!13033 () Bool)

(assert (=> start!70776 (= b_free!13033 (not b_next!13033))))

(declare-fun tp!45844 () Bool)

(declare-fun b_and!21905 () Bool)

(assert (=> start!70776 (= tp!45844 b_and!21905)))

(declare-fun b!822071 () Bool)

(declare-fun e!456987 () Bool)

(declare-fun tp_is_empty!14743 () Bool)

(assert (=> b!822071 (= e!456987 tp_is_empty!14743)))

(declare-fun mapNonEmpty!23725 () Bool)

(declare-fun mapRes!23725 () Bool)

(declare-fun tp!45843 () Bool)

(assert (=> mapNonEmpty!23725 (= mapRes!23725 (and tp!45843 e!456987))))

(declare-datatypes ((V!24659 0))(
  ( (V!24660 (val!7419 Int)) )
))
(declare-datatypes ((ValueCell!6956 0))(
  ( (ValueCellFull!6956 (v!9850 V!24659)) (EmptyCell!6956) )
))
(declare-fun mapValue!23725 () ValueCell!6956)

(declare-datatypes ((array!45682 0))(
  ( (array!45683 (arr!21891 (Array (_ BitVec 32) ValueCell!6956)) (size!22312 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45682)

(declare-fun mapRest!23725 () (Array (_ BitVec 32) ValueCell!6956))

(declare-fun mapKey!23725 () (_ BitVec 32))

(assert (=> mapNonEmpty!23725 (= (arr!21891 _values!788) (store mapRest!23725 mapKey!23725 mapValue!23725))))

(declare-fun b!822072 () Bool)

(declare-fun e!456985 () Bool)

(declare-fun e!456986 () Bool)

(assert (=> b!822072 (= e!456985 (not e!456986))))

(declare-fun res!560721 () Bool)

(assert (=> b!822072 (=> res!560721 e!456986)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822072 (= res!560721 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9794 0))(
  ( (tuple2!9795 (_1!4908 (_ BitVec 64)) (_2!4908 V!24659)) )
))
(declare-datatypes ((List!15610 0))(
  ( (Nil!15607) (Cons!15606 (h!16735 tuple2!9794) (t!21947 List!15610)) )
))
(declare-datatypes ((ListLongMap!8617 0))(
  ( (ListLongMap!8618 (toList!4324 List!15610)) )
))
(declare-fun lt!369648 () ListLongMap!8617)

(declare-fun lt!369652 () ListLongMap!8617)

(assert (=> b!822072 (= lt!369648 lt!369652)))

(declare-fun zeroValueBefore!34 () V!24659)

(declare-datatypes ((array!45684 0))(
  ( (array!45685 (arr!21892 (Array (_ BitVec 32) (_ BitVec 64))) (size!22313 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45684)

(declare-fun zeroValueAfter!34 () V!24659)

(declare-fun minValue!754 () V!24659)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28112 0))(
  ( (Unit!28113) )
))
(declare-fun lt!369649 () Unit!28112)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!453 (array!45684 array!45682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 V!24659 V!24659 (_ BitVec 32) Int) Unit!28112)

(assert (=> b!822072 (= lt!369649 (lemmaNoChangeToArrayThenSameMapNoExtras!453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2343 (array!45684 array!45682 (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 (_ BitVec 32) Int) ListLongMap!8617)

(assert (=> b!822072 (= lt!369652 (getCurrentListMapNoExtraKeys!2343 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822072 (= lt!369648 (getCurrentListMapNoExtraKeys!2343 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822073 () Bool)

(declare-fun e!456982 () Bool)

(declare-fun e!456984 () Bool)

(assert (=> b!822073 (= e!456982 (and e!456984 mapRes!23725))))

(declare-fun condMapEmpty!23725 () Bool)

(declare-fun mapDefault!23725 () ValueCell!6956)

