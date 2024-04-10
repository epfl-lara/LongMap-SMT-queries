; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69996 () Bool)

(assert start!69996)

(declare-fun b_free!12417 () Bool)

(declare-fun b_next!12417 () Bool)

(assert (=> start!69996 (= b_free!12417 (not b_next!12417))))

(declare-fun tp!43965 () Bool)

(declare-fun b_and!21189 () Bool)

(assert (=> start!69996 (= tp!43965 b_and!21189)))

(declare-fun b!813533 () Bool)

(declare-fun res!555760 () Bool)

(declare-fun e!450813 () Bool)

(assert (=> b!813533 (=> (not res!555760) (not e!450813))))

(declare-datatypes ((array!44462 0))(
  ( (array!44463 (arr!21291 (Array (_ BitVec 32) (_ BitVec 64))) (size!21712 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44462)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44462 (_ BitVec 32)) Bool)

(assert (=> b!813533 (= res!555760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22771 () Bool)

(declare-fun mapRes!22771 () Bool)

(declare-fun tp!43966 () Bool)

(declare-fun e!450810 () Bool)

(assert (=> mapNonEmpty!22771 (= mapRes!22771 (and tp!43966 e!450810))))

(declare-datatypes ((V!23837 0))(
  ( (V!23838 (val!7111 Int)) )
))
(declare-datatypes ((ValueCell!6648 0))(
  ( (ValueCellFull!6648 (v!9538 V!23837)) (EmptyCell!6648) )
))
(declare-fun mapRest!22771 () (Array (_ BitVec 32) ValueCell!6648))

(declare-fun mapValue!22771 () ValueCell!6648)

(declare-datatypes ((array!44464 0))(
  ( (array!44465 (arr!21292 (Array (_ BitVec 32) ValueCell!6648)) (size!21713 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44464)

(declare-fun mapKey!22771 () (_ BitVec 32))

(assert (=> mapNonEmpty!22771 (= (arr!21292 _values!788) (store mapRest!22771 mapKey!22771 mapValue!22771))))

(declare-fun mapIsEmpty!22771 () Bool)

(assert (=> mapIsEmpty!22771 mapRes!22771))

(declare-fun b!813534 () Bool)

(declare-fun res!555759 () Bool)

(assert (=> b!813534 (=> (not res!555759) (not e!450813))))

(declare-datatypes ((List!15142 0))(
  ( (Nil!15139) (Cons!15138 (h!16267 (_ BitVec 64)) (t!21459 List!15142)) )
))
(declare-fun arrayNoDuplicates!0 (array!44462 (_ BitVec 32) List!15142) Bool)

(assert (=> b!813534 (= res!555759 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15139))))

(declare-fun res!555762 () Bool)

(assert (=> start!69996 (=> (not res!555762) (not e!450813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69996 (= res!555762 (validMask!0 mask!1312))))

(assert (=> start!69996 e!450813))

(declare-fun tp_is_empty!14127 () Bool)

(assert (=> start!69996 tp_is_empty!14127))

(declare-fun array_inv!17051 (array!44462) Bool)

(assert (=> start!69996 (array_inv!17051 _keys!976)))

(assert (=> start!69996 true))

(declare-fun e!450812 () Bool)

(declare-fun array_inv!17052 (array!44464) Bool)

(assert (=> start!69996 (and (array_inv!17052 _values!788) e!450812)))

(assert (=> start!69996 tp!43965))

(declare-fun b!813535 () Bool)

(assert (=> b!813535 (= e!450813 false)))

(declare-datatypes ((tuple2!9310 0))(
  ( (tuple2!9311 (_1!4666 (_ BitVec 64)) (_2!4666 V!23837)) )
))
(declare-datatypes ((List!15143 0))(
  ( (Nil!15140) (Cons!15139 (h!16268 tuple2!9310) (t!21460 List!15143)) )
))
(declare-datatypes ((ListLongMap!8133 0))(
  ( (ListLongMap!8134 (toList!4082 List!15143)) )
))
(declare-fun lt!364322 () ListLongMap!8133)

(declare-fun zeroValueAfter!34 () V!23837)

(declare-fun minValue!754 () V!23837)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2132 (array!44462 array!44464 (_ BitVec 32) (_ BitVec 32) V!23837 V!23837 (_ BitVec 32) Int) ListLongMap!8133)

(assert (=> b!813535 (= lt!364322 (getCurrentListMapNoExtraKeys!2132 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23837)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364323 () ListLongMap!8133)

(assert (=> b!813535 (= lt!364323 (getCurrentListMapNoExtraKeys!2132 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813536 () Bool)

(assert (=> b!813536 (= e!450810 tp_is_empty!14127)))

(declare-fun b!813537 () Bool)

(declare-fun res!555761 () Bool)

(assert (=> b!813537 (=> (not res!555761) (not e!450813))))

(assert (=> b!813537 (= res!555761 (and (= (size!21713 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21712 _keys!976) (size!21713 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813538 () Bool)

(declare-fun e!450809 () Bool)

(assert (=> b!813538 (= e!450809 tp_is_empty!14127)))

(declare-fun b!813539 () Bool)

(assert (=> b!813539 (= e!450812 (and e!450809 mapRes!22771))))

(declare-fun condMapEmpty!22771 () Bool)

(declare-fun mapDefault!22771 () ValueCell!6648)

(assert (=> b!813539 (= condMapEmpty!22771 (= (arr!21292 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6648)) mapDefault!22771)))))

(assert (= (and start!69996 res!555762) b!813537))

(assert (= (and b!813537 res!555761) b!813533))

(assert (= (and b!813533 res!555760) b!813534))

(assert (= (and b!813534 res!555759) b!813535))

(assert (= (and b!813539 condMapEmpty!22771) mapIsEmpty!22771))

(assert (= (and b!813539 (not condMapEmpty!22771)) mapNonEmpty!22771))

(get-info :version)

(assert (= (and mapNonEmpty!22771 ((_ is ValueCellFull!6648) mapValue!22771)) b!813536))

(assert (= (and b!813539 ((_ is ValueCellFull!6648) mapDefault!22771)) b!813538))

(assert (= start!69996 b!813539))

(declare-fun m!755541 () Bool)

(assert (=> mapNonEmpty!22771 m!755541))

(declare-fun m!755543 () Bool)

(assert (=> b!813533 m!755543))

(declare-fun m!755545 () Bool)

(assert (=> start!69996 m!755545))

(declare-fun m!755547 () Bool)

(assert (=> start!69996 m!755547))

(declare-fun m!755549 () Bool)

(assert (=> start!69996 m!755549))

(declare-fun m!755551 () Bool)

(assert (=> b!813534 m!755551))

(declare-fun m!755553 () Bool)

(assert (=> b!813535 m!755553))

(declare-fun m!755555 () Bool)

(assert (=> b!813535 m!755555))

(check-sat (not start!69996) (not b!813534) tp_is_empty!14127 (not b!813533) (not b_next!12417) (not b!813535) b_and!21189 (not mapNonEmpty!22771))
(check-sat b_and!21189 (not b_next!12417))
