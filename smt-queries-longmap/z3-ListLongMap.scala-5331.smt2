; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71412 () Bool)

(assert start!71412)

(declare-fun b_free!13393 () Bool)

(declare-fun b_next!13393 () Bool)

(assert (=> start!71412 (= b_free!13393 (not b_next!13393))))

(declare-fun tp!46941 () Bool)

(declare-fun b_and!22341 () Bool)

(assert (=> start!71412 (= tp!46941 b_and!22341)))

(declare-fun res!564399 () Bool)

(declare-fun e!461613 () Bool)

(assert (=> start!71412 (=> (not res!564399) (not e!461613))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71412 (= res!564399 (validMask!0 mask!1312))))

(assert (=> start!71412 e!461613))

(declare-fun tp_is_empty!15103 () Bool)

(assert (=> start!71412 tp_is_empty!15103))

(declare-datatypes ((array!46383 0))(
  ( (array!46384 (arr!22231 (Array (_ BitVec 32) (_ BitVec 64))) (size!22651 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46383)

(declare-fun array_inv!17761 (array!46383) Bool)

(assert (=> start!71412 (array_inv!17761 _keys!976)))

(assert (=> start!71412 true))

(declare-datatypes ((V!25139 0))(
  ( (V!25140 (val!7599 Int)) )
))
(declare-datatypes ((ValueCell!7136 0))(
  ( (ValueCellFull!7136 (v!10034 V!25139)) (EmptyCell!7136) )
))
(declare-datatypes ((array!46385 0))(
  ( (array!46386 (arr!22232 (Array (_ BitVec 32) ValueCell!7136)) (size!22652 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46385)

(declare-fun e!461615 () Bool)

(declare-fun array_inv!17762 (array!46385) Bool)

(assert (=> start!71412 (and (array_inv!17762 _values!788) e!461615)))

(assert (=> start!71412 tp!46941))

(declare-fun b!828469 () Bool)

(declare-fun e!461614 () Bool)

(assert (=> b!828469 (= e!461614 tp_is_empty!15103)))

(declare-fun mapIsEmpty!24283 () Bool)

(declare-fun mapRes!24283 () Bool)

(assert (=> mapIsEmpty!24283 mapRes!24283))

(declare-fun b!828470 () Bool)

(declare-fun res!564400 () Bool)

(assert (=> b!828470 (=> (not res!564400) (not e!461613))))

(declare-datatypes ((List!15774 0))(
  ( (Nil!15771) (Cons!15770 (h!16905 (_ BitVec 64)) (t!22115 List!15774)) )
))
(declare-fun arrayNoDuplicates!0 (array!46383 (_ BitVec 32) List!15774) Bool)

(assert (=> b!828470 (= res!564400 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15771))))

(declare-fun b!828471 () Bool)

(assert (=> b!828471 (= e!461615 (and e!461614 mapRes!24283))))

(declare-fun condMapEmpty!24283 () Bool)

(declare-fun mapDefault!24283 () ValueCell!7136)

(assert (=> b!828471 (= condMapEmpty!24283 (= (arr!22232 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7136)) mapDefault!24283)))))

(declare-fun b!828472 () Bool)

(assert (=> b!828472 (= e!461613 false)))

(declare-datatypes ((tuple2!10000 0))(
  ( (tuple2!10001 (_1!5011 (_ BitVec 64)) (_2!5011 V!25139)) )
))
(declare-datatypes ((List!15775 0))(
  ( (Nil!15772) (Cons!15771 (h!16906 tuple2!10000) (t!22116 List!15775)) )
))
(declare-datatypes ((ListLongMap!8825 0))(
  ( (ListLongMap!8826 (toList!4428 List!15775)) )
))
(declare-fun lt!375299 () ListLongMap!8825)

(declare-fun zeroValueAfter!34 () V!25139)

(declare-fun minValue!754 () V!25139)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2505 (array!46383 array!46385 (_ BitVec 32) (_ BitVec 32) V!25139 V!25139 (_ BitVec 32) Int) ListLongMap!8825)

(assert (=> b!828472 (= lt!375299 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25139)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375298 () ListLongMap!8825)

(assert (=> b!828472 (= lt!375298 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828473 () Bool)

(declare-fun e!461617 () Bool)

(assert (=> b!828473 (= e!461617 tp_is_empty!15103)))

(declare-fun b!828474 () Bool)

(declare-fun res!564402 () Bool)

(assert (=> b!828474 (=> (not res!564402) (not e!461613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46383 (_ BitVec 32)) Bool)

(assert (=> b!828474 (= res!564402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24283 () Bool)

(declare-fun tp!46942 () Bool)

(assert (=> mapNonEmpty!24283 (= mapRes!24283 (and tp!46942 e!461617))))

(declare-fun mapRest!24283 () (Array (_ BitVec 32) ValueCell!7136))

(declare-fun mapValue!24283 () ValueCell!7136)

(declare-fun mapKey!24283 () (_ BitVec 32))

(assert (=> mapNonEmpty!24283 (= (arr!22232 _values!788) (store mapRest!24283 mapKey!24283 mapValue!24283))))

(declare-fun b!828475 () Bool)

(declare-fun res!564401 () Bool)

(assert (=> b!828475 (=> (not res!564401) (not e!461613))))

(assert (=> b!828475 (= res!564401 (and (= (size!22652 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22651 _keys!976) (size!22652 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71412 res!564399) b!828475))

(assert (= (and b!828475 res!564401) b!828474))

(assert (= (and b!828474 res!564402) b!828470))

(assert (= (and b!828470 res!564400) b!828472))

(assert (= (and b!828471 condMapEmpty!24283) mapIsEmpty!24283))

(assert (= (and b!828471 (not condMapEmpty!24283)) mapNonEmpty!24283))

(get-info :version)

(assert (= (and mapNonEmpty!24283 ((_ is ValueCellFull!7136) mapValue!24283)) b!828473))

(assert (= (and b!828471 ((_ is ValueCellFull!7136) mapDefault!24283)) b!828469))

(assert (= start!71412 b!828471))

(declare-fun m!771905 () Bool)

(assert (=> start!71412 m!771905))

(declare-fun m!771907 () Bool)

(assert (=> start!71412 m!771907))

(declare-fun m!771909 () Bool)

(assert (=> start!71412 m!771909))

(declare-fun m!771911 () Bool)

(assert (=> b!828474 m!771911))

(declare-fun m!771913 () Bool)

(assert (=> b!828470 m!771913))

(declare-fun m!771915 () Bool)

(assert (=> b!828472 m!771915))

(declare-fun m!771917 () Bool)

(assert (=> b!828472 m!771917))

(declare-fun m!771919 () Bool)

(assert (=> mapNonEmpty!24283 m!771919))

(check-sat (not b!828470) (not start!71412) (not b!828474) b_and!22341 (not mapNonEmpty!24283) tp_is_empty!15103 (not b!828472) (not b_next!13393))
(check-sat b_and!22341 (not b_next!13393))
