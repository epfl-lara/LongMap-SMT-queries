; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70644 () Bool)

(assert start!70644)

(declare-fun b_free!12931 () Bool)

(declare-fun b_next!12931 () Bool)

(assert (=> start!70644 (= b_free!12931 (not b_next!12931))))

(declare-fun tp!45532 () Bool)

(declare-fun b_and!21785 () Bool)

(assert (=> start!70644 (= tp!45532 b_and!21785)))

(declare-fun res!559910 () Bool)

(declare-fun e!455958 () Bool)

(assert (=> start!70644 (=> (not res!559910) (not e!455958))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70644 (= res!559910 (validMask!0 mask!1312))))

(assert (=> start!70644 e!455958))

(declare-fun tp_is_empty!14641 () Bool)

(assert (=> start!70644 tp_is_empty!14641))

(declare-datatypes ((array!45476 0))(
  ( (array!45477 (arr!21790 (Array (_ BitVec 32) (_ BitVec 64))) (size!22211 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45476)

(declare-fun array_inv!17415 (array!45476) Bool)

(assert (=> start!70644 (array_inv!17415 _keys!976)))

(assert (=> start!70644 true))

(declare-datatypes ((V!24523 0))(
  ( (V!24524 (val!7368 Int)) )
))
(declare-datatypes ((ValueCell!6905 0))(
  ( (ValueCellFull!6905 (v!9799 V!24523)) (EmptyCell!6905) )
))
(declare-datatypes ((array!45478 0))(
  ( (array!45479 (arr!21791 (Array (_ BitVec 32) ValueCell!6905)) (size!22212 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45478)

(declare-fun e!455960 () Bool)

(declare-fun array_inv!17416 (array!45478) Bool)

(assert (=> start!70644 (and (array_inv!17416 _values!788) e!455960)))

(assert (=> start!70644 tp!45532))

(declare-fun b!820656 () Bool)

(declare-fun e!455962 () Bool)

(assert (=> b!820656 (= e!455962 tp_is_empty!14641)))

(declare-fun b!820657 () Bool)

(assert (=> b!820657 (= e!455958 (not true))))

(declare-datatypes ((tuple2!9708 0))(
  ( (tuple2!9709 (_1!4865 (_ BitVec 64)) (_2!4865 V!24523)) )
))
(declare-datatypes ((List!15528 0))(
  ( (Nil!15525) (Cons!15524 (h!16653 tuple2!9708) (t!21861 List!15528)) )
))
(declare-datatypes ((ListLongMap!8531 0))(
  ( (ListLongMap!8532 (toList!4281 List!15528)) )
))
(declare-fun lt!368860 () ListLongMap!8531)

(declare-fun lt!368858 () ListLongMap!8531)

(assert (=> b!820657 (= lt!368860 lt!368858)))

(declare-fun zeroValueBefore!34 () V!24523)

(declare-datatypes ((Unit!28039 0))(
  ( (Unit!28040) )
))
(declare-fun lt!368859 () Unit!28039)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24523)

(declare-fun minValue!754 () V!24523)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!417 (array!45476 array!45478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24523 V!24523 V!24523 V!24523 (_ BitVec 32) Int) Unit!28039)

(assert (=> b!820657 (= lt!368859 (lemmaNoChangeToArrayThenSameMapNoExtras!417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2307 (array!45476 array!45478 (_ BitVec 32) (_ BitVec 32) V!24523 V!24523 (_ BitVec 32) Int) ListLongMap!8531)

(assert (=> b!820657 (= lt!368858 (getCurrentListMapNoExtraKeys!2307 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820657 (= lt!368860 (getCurrentListMapNoExtraKeys!2307 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23566 () Bool)

(declare-fun mapRes!23566 () Bool)

(assert (=> mapIsEmpty!23566 mapRes!23566))

(declare-fun b!820658 () Bool)

(declare-fun res!559912 () Bool)

(assert (=> b!820658 (=> (not res!559912) (not e!455958))))

(assert (=> b!820658 (= res!559912 (and (= (size!22212 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22211 _keys!976) (size!22212 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23566 () Bool)

(declare-fun tp!45531 () Bool)

(declare-fun e!455961 () Bool)

(assert (=> mapNonEmpty!23566 (= mapRes!23566 (and tp!45531 e!455961))))

(declare-fun mapRest!23566 () (Array (_ BitVec 32) ValueCell!6905))

(declare-fun mapKey!23566 () (_ BitVec 32))

(declare-fun mapValue!23566 () ValueCell!6905)

(assert (=> mapNonEmpty!23566 (= (arr!21791 _values!788) (store mapRest!23566 mapKey!23566 mapValue!23566))))

(declare-fun b!820659 () Bool)

(assert (=> b!820659 (= e!455961 tp_is_empty!14641)))

(declare-fun b!820660 () Bool)

(assert (=> b!820660 (= e!455960 (and e!455962 mapRes!23566))))

(declare-fun condMapEmpty!23566 () Bool)

(declare-fun mapDefault!23566 () ValueCell!6905)

