; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70972 () Bool)

(assert start!70972)

(declare-fun b_free!13063 () Bool)

(declare-fun b_next!13063 () Bool)

(assert (=> start!70972 (= b_free!13063 (not b_next!13063))))

(declare-fun tp!45934 () Bool)

(declare-fun b_and!21945 () Bool)

(assert (=> start!70972 (= tp!45934 b_and!21945)))

(declare-fun mapNonEmpty!23770 () Bool)

(declare-fun mapRes!23770 () Bool)

(declare-fun tp!45933 () Bool)

(declare-fun e!457835 () Bool)

(assert (=> mapNonEmpty!23770 (= mapRes!23770 (and tp!45933 e!457835))))

(declare-fun mapKey!23770 () (_ BitVec 32))

(declare-datatypes ((V!24699 0))(
  ( (V!24700 (val!7434 Int)) )
))
(declare-datatypes ((ValueCell!6971 0))(
  ( (ValueCellFull!6971 (v!9865 V!24699)) (EmptyCell!6971) )
))
(declare-fun mapRest!23770 () (Array (_ BitVec 32) ValueCell!6971))

(declare-datatypes ((array!45741 0))(
  ( (array!45742 (arr!21916 (Array (_ BitVec 32) ValueCell!6971)) (size!22336 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45741)

(declare-fun mapValue!23770 () ValueCell!6971)

(assert (=> mapNonEmpty!23770 (= (arr!21916 _values!788) (store mapRest!23770 mapKey!23770 mapValue!23770))))

(declare-fun b!823324 () Bool)

(declare-fun e!457830 () Bool)

(assert (=> b!823324 (= e!457830 true)))

(declare-datatypes ((tuple2!9740 0))(
  ( (tuple2!9741 (_1!4881 (_ BitVec 64)) (_2!4881 V!24699)) )
))
(declare-datatypes ((List!15526 0))(
  ( (Nil!15523) (Cons!15522 (h!16657 tuple2!9740) (t!21855 List!15526)) )
))
(declare-datatypes ((ListLongMap!8565 0))(
  ( (ListLongMap!8566 (toList!4298 List!15526)) )
))
(declare-fun lt!370458 () ListLongMap!8565)

(declare-fun lt!370456 () ListLongMap!8565)

(declare-fun lt!370461 () tuple2!9740)

(declare-fun +!1888 (ListLongMap!8565 tuple2!9740) ListLongMap!8565)

(assert (=> b!823324 (= lt!370458 (+!1888 lt!370456 lt!370461))))

(declare-fun lt!370455 () ListLongMap!8565)

(declare-fun zeroValueAfter!34 () V!24699)

(declare-fun minValue!754 () V!24699)

(declare-datatypes ((Unit!28145 0))(
  ( (Unit!28146) )
))
(declare-fun lt!370454 () Unit!28145)

(declare-fun addCommutativeForDiffKeys!446 (ListLongMap!8565 (_ BitVec 64) V!24699 (_ BitVec 64) V!24699) Unit!28145)

(assert (=> b!823324 (= lt!370454 (addCommutativeForDiffKeys!446 lt!370455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370457 () ListLongMap!8565)

(assert (=> b!823324 (= lt!370457 lt!370458)))

(declare-fun lt!370460 () tuple2!9740)

(assert (=> b!823324 (= lt!370458 (+!1888 (+!1888 lt!370455 lt!370461) lt!370460))))

(assert (=> b!823324 (= lt!370461 (tuple2!9741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370452 () ListLongMap!8565)

(assert (=> b!823324 (= lt!370452 lt!370456)))

(assert (=> b!823324 (= lt!370456 (+!1888 lt!370455 lt!370460))))

(assert (=> b!823324 (= lt!370460 (tuple2!9741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45743 0))(
  ( (array!45744 (arr!21917 (Array (_ BitVec 32) (_ BitVec 64))) (size!22337 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45743)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2452 (array!45743 array!45741 (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 (_ BitVec 32) Int) ListLongMap!8565)

(assert (=> b!823324 (= lt!370457 (getCurrentListMap!2452 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24699)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823324 (= lt!370452 (getCurrentListMap!2452 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823325 () Bool)

(declare-fun tp_is_empty!14773 () Bool)

(assert (=> b!823325 (= e!457835 tp_is_empty!14773)))

(declare-fun b!823326 () Bool)

(declare-fun res!561293 () Bool)

(declare-fun e!457831 () Bool)

(assert (=> b!823326 (=> (not res!561293) (not e!457831))))

(declare-datatypes ((List!15527 0))(
  ( (Nil!15524) (Cons!15523 (h!16658 (_ BitVec 64)) (t!21856 List!15527)) )
))
(declare-fun arrayNoDuplicates!0 (array!45743 (_ BitVec 32) List!15527) Bool)

(assert (=> b!823326 (= res!561293 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15524))))

(declare-fun b!823327 () Bool)

(declare-fun e!457832 () Bool)

(declare-fun e!457834 () Bool)

(assert (=> b!823327 (= e!457832 (and e!457834 mapRes!23770))))

(declare-fun condMapEmpty!23770 () Bool)

(declare-fun mapDefault!23770 () ValueCell!6971)

(assert (=> b!823327 (= condMapEmpty!23770 (= (arr!21916 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6971)) mapDefault!23770)))))

(declare-fun b!823328 () Bool)

(declare-fun res!561292 () Bool)

(assert (=> b!823328 (=> (not res!561292) (not e!457831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45743 (_ BitVec 32)) Bool)

(assert (=> b!823328 (= res!561292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823329 () Bool)

(assert (=> b!823329 (= e!457834 tp_is_empty!14773)))

(declare-fun b!823330 () Bool)

(declare-fun res!561294 () Bool)

(assert (=> b!823330 (=> (not res!561294) (not e!457831))))

(assert (=> b!823330 (= res!561294 (and (= (size!22336 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22337 _keys!976) (size!22336 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823331 () Bool)

(assert (=> b!823331 (= e!457831 (not e!457830))))

(declare-fun res!561295 () Bool)

(assert (=> b!823331 (=> res!561295 e!457830)))

(assert (=> b!823331 (= res!561295 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370453 () ListLongMap!8565)

(assert (=> b!823331 (= lt!370455 lt!370453)))

(declare-fun lt!370459 () Unit!28145)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!472 (array!45743 array!45741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 V!24699 V!24699 (_ BitVec 32) Int) Unit!28145)

(assert (=> b!823331 (= lt!370459 (lemmaNoChangeToArrayThenSameMapNoExtras!472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2384 (array!45743 array!45741 (_ BitVec 32) (_ BitVec 32) V!24699 V!24699 (_ BitVec 32) Int) ListLongMap!8565)

(assert (=> b!823331 (= lt!370453 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823331 (= lt!370455 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561291 () Bool)

(assert (=> start!70972 (=> (not res!561291) (not e!457831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70972 (= res!561291 (validMask!0 mask!1312))))

(assert (=> start!70972 e!457831))

(assert (=> start!70972 tp_is_empty!14773))

(declare-fun array_inv!17535 (array!45743) Bool)

(assert (=> start!70972 (array_inv!17535 _keys!976)))

(assert (=> start!70972 true))

(declare-fun array_inv!17536 (array!45741) Bool)

(assert (=> start!70972 (and (array_inv!17536 _values!788) e!457832)))

(assert (=> start!70972 tp!45934))

(declare-fun mapIsEmpty!23770 () Bool)

(assert (=> mapIsEmpty!23770 mapRes!23770))

(assert (= (and start!70972 res!561291) b!823330))

(assert (= (and b!823330 res!561294) b!823328))

(assert (= (and b!823328 res!561292) b!823326))

(assert (= (and b!823326 res!561293) b!823331))

(assert (= (and b!823331 (not res!561295)) b!823324))

(assert (= (and b!823327 condMapEmpty!23770) mapIsEmpty!23770))

(assert (= (and b!823327 (not condMapEmpty!23770)) mapNonEmpty!23770))

(get-info :version)

(assert (= (and mapNonEmpty!23770 ((_ is ValueCellFull!6971) mapValue!23770)) b!823325))

(assert (= (and b!823327 ((_ is ValueCellFull!6971) mapDefault!23770)) b!823329))

(assert (= start!70972 b!823327))

(declare-fun m!765563 () Bool)

(assert (=> b!823324 m!765563))

(declare-fun m!765565 () Bool)

(assert (=> b!823324 m!765565))

(declare-fun m!765567 () Bool)

(assert (=> b!823324 m!765567))

(declare-fun m!765569 () Bool)

(assert (=> b!823324 m!765569))

(declare-fun m!765571 () Bool)

(assert (=> b!823324 m!765571))

(declare-fun m!765573 () Bool)

(assert (=> b!823324 m!765573))

(assert (=> b!823324 m!765563))

(declare-fun m!765575 () Bool)

(assert (=> b!823324 m!765575))

(declare-fun m!765577 () Bool)

(assert (=> b!823328 m!765577))

(declare-fun m!765579 () Bool)

(assert (=> b!823326 m!765579))

(declare-fun m!765581 () Bool)

(assert (=> b!823331 m!765581))

(declare-fun m!765583 () Bool)

(assert (=> b!823331 m!765583))

(declare-fun m!765585 () Bool)

(assert (=> b!823331 m!765585))

(declare-fun m!765587 () Bool)

(assert (=> mapNonEmpty!23770 m!765587))

(declare-fun m!765589 () Bool)

(assert (=> start!70972 m!765589))

(declare-fun m!765591 () Bool)

(assert (=> start!70972 m!765591))

(declare-fun m!765593 () Bool)

(assert (=> start!70972 m!765593))

(check-sat tp_is_empty!14773 (not b!823326) (not b_next!13063) (not mapNonEmpty!23770) (not b!823328) (not start!70972) (not b!823324) b_and!21945 (not b!823331))
(check-sat b_and!21945 (not b_next!13063))
