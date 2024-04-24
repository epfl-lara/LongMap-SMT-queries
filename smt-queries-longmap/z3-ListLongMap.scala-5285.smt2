; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71046 () Bool)

(assert start!71046)

(declare-fun b_free!13117 () Bool)

(declare-fun b_next!13117 () Bool)

(assert (=> start!71046 (= b_free!13117 (not b_next!13117))))

(declare-fun tp!46099 () Bool)

(declare-fun b_and!22011 () Bool)

(assert (=> start!71046 (= tp!46099 b_and!22011)))

(declare-fun b!824153 () Bool)

(declare-fun e!458434 () Bool)

(assert (=> b!824153 (= e!458434 true)))

(declare-datatypes ((V!24771 0))(
  ( (V!24772 (val!7461 Int)) )
))
(declare-datatypes ((tuple2!9780 0))(
  ( (tuple2!9781 (_1!4901 (_ BitVec 64)) (_2!4901 V!24771)) )
))
(declare-datatypes ((List!15567 0))(
  ( (Nil!15564) (Cons!15563 (h!16698 tuple2!9780) (t!21898 List!15567)) )
))
(declare-datatypes ((ListLongMap!8605 0))(
  ( (ListLongMap!8606 (toList!4318 List!15567)) )
))
(declare-fun lt!371419 () ListLongMap!8605)

(declare-fun lt!371422 () ListLongMap!8605)

(declare-fun lt!371417 () tuple2!9780)

(declare-fun +!1907 (ListLongMap!8605 tuple2!9780) ListLongMap!8605)

(assert (=> b!824153 (= lt!371419 (+!1907 lt!371422 lt!371417))))

(declare-fun zeroValueAfter!34 () V!24771)

(declare-fun minValue!754 () V!24771)

(declare-fun lt!371426 () ListLongMap!8605)

(declare-datatypes ((Unit!28187 0))(
  ( (Unit!28188) )
))
(declare-fun lt!371425 () Unit!28187)

(declare-fun addCommutativeForDiffKeys!465 (ListLongMap!8605 (_ BitVec 64) V!24771 (_ BitVec 64) V!24771) Unit!28187)

(assert (=> b!824153 (= lt!371425 (addCommutativeForDiffKeys!465 lt!371426 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371420 () ListLongMap!8605)

(assert (=> b!824153 (= lt!371420 lt!371419)))

(declare-fun lt!371423 () tuple2!9780)

(assert (=> b!824153 (= lt!371419 (+!1907 (+!1907 lt!371426 lt!371417) lt!371423))))

(assert (=> b!824153 (= lt!371417 (tuple2!9781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371418 () ListLongMap!8605)

(assert (=> b!824153 (= lt!371418 lt!371422)))

(assert (=> b!824153 (= lt!371422 (+!1907 lt!371426 lt!371423))))

(assert (=> b!824153 (= lt!371423 (tuple2!9781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((ValueCell!6998 0))(
  ( (ValueCellFull!6998 (v!9893 V!24771)) (EmptyCell!6998) )
))
(declare-datatypes ((array!45847 0))(
  ( (array!45848 (arr!21968 (Array (_ BitVec 32) ValueCell!6998)) (size!22388 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45847)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!45849 0))(
  ( (array!45850 (arr!21969 (Array (_ BitVec 32) (_ BitVec 64))) (size!22389 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45849)

(declare-fun getCurrentListMap!2471 (array!45849 array!45847 (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 (_ BitVec 32) Int) ListLongMap!8605)

(assert (=> b!824153 (= lt!371420 (getCurrentListMap!2471 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24771)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824153 (= lt!371418 (getCurrentListMap!2471 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824154 () Bool)

(declare-fun e!458433 () Bool)

(declare-fun tp_is_empty!14827 () Bool)

(assert (=> b!824154 (= e!458433 tp_is_empty!14827)))

(declare-fun b!824155 () Bool)

(declare-fun e!458429 () Bool)

(assert (=> b!824155 (= e!458429 tp_is_empty!14827)))

(declare-fun b!824156 () Bool)

(declare-fun res!561776 () Bool)

(declare-fun e!458430 () Bool)

(assert (=> b!824156 (=> (not res!561776) (not e!458430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45849 (_ BitVec 32)) Bool)

(assert (=> b!824156 (= res!561776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824157 () Bool)

(declare-fun res!561778 () Bool)

(assert (=> b!824157 (=> (not res!561778) (not e!458430))))

(assert (=> b!824157 (= res!561778 (and (= (size!22388 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22389 _keys!976) (size!22388 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824158 () Bool)

(declare-fun e!458432 () Bool)

(declare-fun mapRes!23854 () Bool)

(assert (=> b!824158 (= e!458432 (and e!458433 mapRes!23854))))

(declare-fun condMapEmpty!23854 () Bool)

(declare-fun mapDefault!23854 () ValueCell!6998)

(assert (=> b!824158 (= condMapEmpty!23854 (= (arr!21968 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6998)) mapDefault!23854)))))

(declare-fun b!824159 () Bool)

(declare-fun res!561779 () Bool)

(assert (=> b!824159 (=> (not res!561779) (not e!458430))))

(declare-datatypes ((List!15568 0))(
  ( (Nil!15565) (Cons!15564 (h!16699 (_ BitVec 64)) (t!21899 List!15568)) )
))
(declare-fun arrayNoDuplicates!0 (array!45849 (_ BitVec 32) List!15568) Bool)

(assert (=> b!824159 (= res!561779 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15565))))

(declare-fun mapIsEmpty!23854 () Bool)

(assert (=> mapIsEmpty!23854 mapRes!23854))

(declare-fun res!561777 () Bool)

(assert (=> start!71046 (=> (not res!561777) (not e!458430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71046 (= res!561777 (validMask!0 mask!1312))))

(assert (=> start!71046 e!458430))

(assert (=> start!71046 tp_is_empty!14827))

(declare-fun array_inv!17571 (array!45849) Bool)

(assert (=> start!71046 (array_inv!17571 _keys!976)))

(assert (=> start!71046 true))

(declare-fun array_inv!17572 (array!45847) Bool)

(assert (=> start!71046 (and (array_inv!17572 _values!788) e!458432)))

(assert (=> start!71046 tp!46099))

(declare-fun b!824160 () Bool)

(assert (=> b!824160 (= e!458430 (not e!458434))))

(declare-fun res!561775 () Bool)

(assert (=> b!824160 (=> res!561775 e!458434)))

(assert (=> b!824160 (= res!561775 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371424 () ListLongMap!8605)

(assert (=> b!824160 (= lt!371426 lt!371424)))

(declare-fun lt!371421 () Unit!28187)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!490 (array!45849 array!45847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 V!24771 V!24771 (_ BitVec 32) Int) Unit!28187)

(assert (=> b!824160 (= lt!371421 (lemmaNoChangeToArrayThenSameMapNoExtras!490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2402 (array!45849 array!45847 (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 (_ BitVec 32) Int) ListLongMap!8605)

(assert (=> b!824160 (= lt!371424 (getCurrentListMapNoExtraKeys!2402 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824160 (= lt!371426 (getCurrentListMapNoExtraKeys!2402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23854 () Bool)

(declare-fun tp!46098 () Bool)

(assert (=> mapNonEmpty!23854 (= mapRes!23854 (and tp!46098 e!458429))))

(declare-fun mapKey!23854 () (_ BitVec 32))

(declare-fun mapValue!23854 () ValueCell!6998)

(declare-fun mapRest!23854 () (Array (_ BitVec 32) ValueCell!6998))

(assert (=> mapNonEmpty!23854 (= (arr!21968 _values!788) (store mapRest!23854 mapKey!23854 mapValue!23854))))

(assert (= (and start!71046 res!561777) b!824157))

(assert (= (and b!824157 res!561778) b!824156))

(assert (= (and b!824156 res!561776) b!824159))

(assert (= (and b!824159 res!561779) b!824160))

(assert (= (and b!824160 (not res!561775)) b!824153))

(assert (= (and b!824158 condMapEmpty!23854) mapIsEmpty!23854))

(assert (= (and b!824158 (not condMapEmpty!23854)) mapNonEmpty!23854))

(get-info :version)

(assert (= (and mapNonEmpty!23854 ((_ is ValueCellFull!6998) mapValue!23854)) b!824155))

(assert (= (and b!824158 ((_ is ValueCellFull!6998) mapDefault!23854)) b!824154))

(assert (= start!71046 b!824158))

(declare-fun m!766643 () Bool)

(assert (=> b!824156 m!766643))

(declare-fun m!766645 () Bool)

(assert (=> b!824159 m!766645))

(declare-fun m!766647 () Bool)

(assert (=> b!824153 m!766647))

(declare-fun m!766649 () Bool)

(assert (=> b!824153 m!766649))

(declare-fun m!766651 () Bool)

(assert (=> b!824153 m!766651))

(declare-fun m!766653 () Bool)

(assert (=> b!824153 m!766653))

(declare-fun m!766655 () Bool)

(assert (=> b!824153 m!766655))

(declare-fun m!766657 () Bool)

(assert (=> b!824153 m!766657))

(assert (=> b!824153 m!766655))

(declare-fun m!766659 () Bool)

(assert (=> b!824153 m!766659))

(declare-fun m!766661 () Bool)

(assert (=> mapNonEmpty!23854 m!766661))

(declare-fun m!766663 () Bool)

(assert (=> start!71046 m!766663))

(declare-fun m!766665 () Bool)

(assert (=> start!71046 m!766665))

(declare-fun m!766667 () Bool)

(assert (=> start!71046 m!766667))

(declare-fun m!766669 () Bool)

(assert (=> b!824160 m!766669))

(declare-fun m!766671 () Bool)

(assert (=> b!824160 m!766671))

(declare-fun m!766673 () Bool)

(assert (=> b!824160 m!766673))

(check-sat (not start!71046) (not b_next!13117) (not b!824153) (not mapNonEmpty!23854) tp_is_empty!14827 (not b!824156) (not b!824160) (not b!824159) b_and!22011)
(check-sat b_and!22011 (not b_next!13117))
