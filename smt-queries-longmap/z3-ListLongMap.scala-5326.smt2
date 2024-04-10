; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71218 () Bool)

(assert start!71218)

(declare-fun b_free!13365 () Bool)

(declare-fun b_next!13365 () Bool)

(assert (=> start!71218 (= b_free!13365 (not b_next!13365))))

(declare-fun tp!46857 () Bool)

(declare-fun b_and!22303 () Bool)

(assert (=> start!71218 (= tp!46857 b_and!22303)))

(declare-fun mapNonEmpty!24241 () Bool)

(declare-fun mapRes!24241 () Bool)

(declare-fun tp!46858 () Bool)

(declare-fun e!460826 () Bool)

(assert (=> mapNonEmpty!24241 (= mapRes!24241 (and tp!46858 e!460826))))

(declare-datatypes ((V!25101 0))(
  ( (V!25102 (val!7585 Int)) )
))
(declare-datatypes ((ValueCell!7122 0))(
  ( (ValueCellFull!7122 (v!10020 V!25101)) (EmptyCell!7122) )
))
(declare-fun mapRest!24241 () (Array (_ BitVec 32) ValueCell!7122))

(declare-datatypes ((array!46328 0))(
  ( (array!46329 (arr!22208 (Array (_ BitVec 32) ValueCell!7122)) (size!22629 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46328)

(declare-fun mapValue!24241 () ValueCell!7122)

(declare-fun mapKey!24241 () (_ BitVec 32))

(assert (=> mapNonEmpty!24241 (= (arr!22208 _values!788) (store mapRest!24241 mapKey!24241 mapValue!24241))))

(declare-fun b!827281 () Bool)

(declare-fun e!460825 () Bool)

(declare-fun tp_is_empty!15075 () Bool)

(assert (=> b!827281 (= e!460825 tp_is_empty!15075)))

(declare-fun b!827282 () Bool)

(declare-fun res!563885 () Bool)

(declare-fun e!460829 () Bool)

(assert (=> b!827282 (=> (not res!563885) (not e!460829))))

(declare-datatypes ((array!46330 0))(
  ( (array!46331 (arr!22209 (Array (_ BitVec 32) (_ BitVec 64))) (size!22630 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46330)

(declare-datatypes ((List!15852 0))(
  ( (Nil!15849) (Cons!15848 (h!16977 (_ BitVec 64)) (t!22201 List!15852)) )
))
(declare-fun arrayNoDuplicates!0 (array!46330 (_ BitVec 32) List!15852) Bool)

(assert (=> b!827282 (= res!563885 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15849))))

(declare-fun b!827283 () Bool)

(declare-fun res!563887 () Bool)

(assert (=> b!827283 (=> (not res!563887) (not e!460829))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827283 (= res!563887 (and (= (size!22629 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22630 _keys!976) (size!22629 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827285 () Bool)

(assert (=> b!827285 (= e!460826 tp_is_empty!15075)))

(declare-fun mapIsEmpty!24241 () Bool)

(assert (=> mapIsEmpty!24241 mapRes!24241))

(declare-fun b!827286 () Bool)

(assert (=> b!827286 (= e!460829 false)))

(declare-fun zeroValueAfter!34 () V!25101)

(declare-fun minValue!754 () V!25101)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10056 0))(
  ( (tuple2!10057 (_1!5039 (_ BitVec 64)) (_2!5039 V!25101)) )
))
(declare-datatypes ((List!15853 0))(
  ( (Nil!15850) (Cons!15849 (h!16978 tuple2!10056) (t!22202 List!15853)) )
))
(declare-datatypes ((ListLongMap!8879 0))(
  ( (ListLongMap!8880 (toList!4455 List!15853)) )
))
(declare-fun lt!374861 () ListLongMap!8879)

(declare-fun getCurrentListMapNoExtraKeys!2457 (array!46330 array!46328 (_ BitVec 32) (_ BitVec 32) V!25101 V!25101 (_ BitVec 32) Int) ListLongMap!8879)

(assert (=> b!827286 (= lt!374861 (getCurrentListMapNoExtraKeys!2457 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25101)

(declare-fun lt!374860 () ListLongMap!8879)

(assert (=> b!827286 (= lt!374860 (getCurrentListMapNoExtraKeys!2457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827287 () Bool)

(declare-fun res!563888 () Bool)

(assert (=> b!827287 (=> (not res!563888) (not e!460829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46330 (_ BitVec 32)) Bool)

(assert (=> b!827287 (= res!563888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827284 () Bool)

(declare-fun e!460827 () Bool)

(assert (=> b!827284 (= e!460827 (and e!460825 mapRes!24241))))

(declare-fun condMapEmpty!24241 () Bool)

(declare-fun mapDefault!24241 () ValueCell!7122)

(assert (=> b!827284 (= condMapEmpty!24241 (= (arr!22208 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7122)) mapDefault!24241)))))

(declare-fun res!563886 () Bool)

(assert (=> start!71218 (=> (not res!563886) (not e!460829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71218 (= res!563886 (validMask!0 mask!1312))))

(assert (=> start!71218 e!460829))

(assert (=> start!71218 tp_is_empty!15075))

(declare-fun array_inv!17699 (array!46330) Bool)

(assert (=> start!71218 (array_inv!17699 _keys!976)))

(assert (=> start!71218 true))

(declare-fun array_inv!17700 (array!46328) Bool)

(assert (=> start!71218 (and (array_inv!17700 _values!788) e!460827)))

(assert (=> start!71218 tp!46857))

(assert (= (and start!71218 res!563886) b!827283))

(assert (= (and b!827283 res!563887) b!827287))

(assert (= (and b!827287 res!563888) b!827282))

(assert (= (and b!827282 res!563885) b!827286))

(assert (= (and b!827284 condMapEmpty!24241) mapIsEmpty!24241))

(assert (= (and b!827284 (not condMapEmpty!24241)) mapNonEmpty!24241))

(get-info :version)

(assert (= (and mapNonEmpty!24241 ((_ is ValueCellFull!7122) mapValue!24241)) b!827285))

(assert (= (and b!827284 ((_ is ValueCellFull!7122) mapDefault!24241)) b!827281))

(assert (= start!71218 b!827284))

(declare-fun m!770399 () Bool)

(assert (=> b!827282 m!770399))

(declare-fun m!770401 () Bool)

(assert (=> start!71218 m!770401))

(declare-fun m!770403 () Bool)

(assert (=> start!71218 m!770403))

(declare-fun m!770405 () Bool)

(assert (=> start!71218 m!770405))

(declare-fun m!770407 () Bool)

(assert (=> b!827286 m!770407))

(declare-fun m!770409 () Bool)

(assert (=> b!827286 m!770409))

(declare-fun m!770411 () Bool)

(assert (=> mapNonEmpty!24241 m!770411))

(declare-fun m!770413 () Bool)

(assert (=> b!827287 m!770413))

(check-sat (not b_next!13365) (not start!71218) (not b!827287) (not b!827282) tp_is_empty!15075 b_and!22303 (not b!827286) (not mapNonEmpty!24241))
(check-sat b_and!22303 (not b_next!13365))
