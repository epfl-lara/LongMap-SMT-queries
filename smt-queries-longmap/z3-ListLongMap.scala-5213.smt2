; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70476 () Bool)

(assert start!70476)

(declare-fun b_free!12685 () Bool)

(declare-fun b_next!12685 () Bool)

(assert (=> start!70476 (= b_free!12685 (not b_next!12685))))

(declare-fun tp!44778 () Bool)

(declare-fun b_and!21495 () Bool)

(assert (=> start!70476 (= tp!44778 b_and!21495)))

(declare-fun b!817741 () Bool)

(declare-fun e!453764 () Bool)

(declare-fun tp_is_empty!14395 () Bool)

(assert (=> b!817741 (= e!453764 tp_is_empty!14395)))

(declare-fun b!817742 () Bool)

(declare-fun res!558003 () Bool)

(declare-fun e!453767 () Bool)

(assert (=> b!817742 (=> (not res!558003) (not e!453767))))

(declare-datatypes ((array!44991 0))(
  ( (array!44992 (arr!21548 (Array (_ BitVec 32) (_ BitVec 64))) (size!21968 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44991)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24195 0))(
  ( (V!24196 (val!7245 Int)) )
))
(declare-datatypes ((ValueCell!6782 0))(
  ( (ValueCellFull!6782 (v!9673 V!24195)) (EmptyCell!6782) )
))
(declare-datatypes ((array!44993 0))(
  ( (array!44994 (arr!21549 (Array (_ BitVec 32) ValueCell!6782)) (size!21969 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44993)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817742 (= res!558003 (and (= (size!21969 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21968 _keys!976) (size!21969 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817743 () Bool)

(declare-fun res!558005 () Bool)

(assert (=> b!817743 (=> (not res!558005) (not e!453767))))

(declare-datatypes ((List!15244 0))(
  ( (Nil!15241) (Cons!15240 (h!16375 (_ BitVec 64)) (t!21559 List!15244)) )
))
(declare-fun arrayNoDuplicates!0 (array!44991 (_ BitVec 32) List!15244) Bool)

(assert (=> b!817743 (= res!558005 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15241))))

(declare-fun b!817744 () Bool)

(declare-fun e!453766 () Bool)

(assert (=> b!817744 (= e!453767 (not e!453766))))

(declare-fun res!558007 () Bool)

(assert (=> b!817744 (=> res!558007 e!453766)))

(assert (=> b!817744 (= res!558007 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9432 0))(
  ( (tuple2!9433 (_1!4727 (_ BitVec 64)) (_2!4727 V!24195)) )
))
(declare-datatypes ((List!15245 0))(
  ( (Nil!15242) (Cons!15241 (h!16376 tuple2!9432) (t!21560 List!15245)) )
))
(declare-datatypes ((ListLongMap!8257 0))(
  ( (ListLongMap!8258 (toList!4144 List!15245)) )
))
(declare-fun lt!366283 () ListLongMap!8257)

(declare-fun lt!366286 () ListLongMap!8257)

(assert (=> b!817744 (= lt!366283 lt!366286)))

(declare-fun zeroValueBefore!34 () V!24195)

(declare-fun zeroValueAfter!34 () V!24195)

(declare-fun minValue!754 () V!24195)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27841 0))(
  ( (Unit!27842) )
))
(declare-fun lt!366285 () Unit!27841)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!331 (array!44991 array!44993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 V!24195 V!24195 (_ BitVec 32) Int) Unit!27841)

(assert (=> b!817744 (= lt!366285 (lemmaNoChangeToArrayThenSameMapNoExtras!331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2243 (array!44991 array!44993 (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 (_ BitVec 32) Int) ListLongMap!8257)

(assert (=> b!817744 (= lt!366286 (getCurrentListMapNoExtraKeys!2243 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817744 (= lt!366283 (getCurrentListMapNoExtraKeys!2243 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558006 () Bool)

(assert (=> start!70476 (=> (not res!558006) (not e!453767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70476 (= res!558006 (validMask!0 mask!1312))))

(assert (=> start!70476 e!453767))

(assert (=> start!70476 tp_is_empty!14395))

(declare-fun array_inv!17269 (array!44991) Bool)

(assert (=> start!70476 (array_inv!17269 _keys!976)))

(assert (=> start!70476 true))

(declare-fun e!453763 () Bool)

(declare-fun array_inv!17270 (array!44993) Bool)

(assert (=> start!70476 (and (array_inv!17270 _values!788) e!453763)))

(assert (=> start!70476 tp!44778))

(declare-fun b!817745 () Bool)

(declare-fun res!558004 () Bool)

(assert (=> b!817745 (=> (not res!558004) (not e!453767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44991 (_ BitVec 32)) Bool)

(assert (=> b!817745 (= res!558004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817746 () Bool)

(declare-fun e!453768 () Bool)

(declare-fun mapRes!23182 () Bool)

(assert (=> b!817746 (= e!453763 (and e!453768 mapRes!23182))))

(declare-fun condMapEmpty!23182 () Bool)

(declare-fun mapDefault!23182 () ValueCell!6782)

(assert (=> b!817746 (= condMapEmpty!23182 (= (arr!21549 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6782)) mapDefault!23182)))))

(declare-fun b!817747 () Bool)

(assert (=> b!817747 (= e!453768 tp_is_empty!14395)))

(declare-fun mapIsEmpty!23182 () Bool)

(assert (=> mapIsEmpty!23182 mapRes!23182))

(declare-fun mapNonEmpty!23182 () Bool)

(declare-fun tp!44779 () Bool)

(assert (=> mapNonEmpty!23182 (= mapRes!23182 (and tp!44779 e!453764))))

(declare-fun mapRest!23182 () (Array (_ BitVec 32) ValueCell!6782))

(declare-fun mapKey!23182 () (_ BitVec 32))

(declare-fun mapValue!23182 () ValueCell!6782)

(assert (=> mapNonEmpty!23182 (= (arr!21549 _values!788) (store mapRest!23182 mapKey!23182 mapValue!23182))))

(declare-fun b!817748 () Bool)

(assert (=> b!817748 (= e!453766 true)))

(declare-fun lt!366284 () ListLongMap!8257)

(declare-fun getCurrentListMap!2360 (array!44991 array!44993 (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 (_ BitVec 32) Int) ListLongMap!8257)

(assert (=> b!817748 (= lt!366284 (getCurrentListMap!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366282 () ListLongMap!8257)

(declare-fun +!1820 (ListLongMap!8257 tuple2!9432) ListLongMap!8257)

(assert (=> b!817748 (= lt!366282 (+!1820 (getCurrentListMap!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70476 res!558006) b!817742))

(assert (= (and b!817742 res!558003) b!817745))

(assert (= (and b!817745 res!558004) b!817743))

(assert (= (and b!817743 res!558005) b!817744))

(assert (= (and b!817744 (not res!558007)) b!817748))

(assert (= (and b!817746 condMapEmpty!23182) mapIsEmpty!23182))

(assert (= (and b!817746 (not condMapEmpty!23182)) mapNonEmpty!23182))

(get-info :version)

(assert (= (and mapNonEmpty!23182 ((_ is ValueCellFull!6782) mapValue!23182)) b!817741))

(assert (= (and b!817746 ((_ is ValueCellFull!6782) mapDefault!23182)) b!817747))

(assert (= start!70476 b!817746))

(declare-fun m!759761 () Bool)

(assert (=> b!817745 m!759761))

(declare-fun m!759763 () Bool)

(assert (=> b!817743 m!759763))

(declare-fun m!759765 () Bool)

(assert (=> b!817748 m!759765))

(declare-fun m!759767 () Bool)

(assert (=> b!817748 m!759767))

(assert (=> b!817748 m!759767))

(declare-fun m!759769 () Bool)

(assert (=> b!817748 m!759769))

(declare-fun m!759771 () Bool)

(assert (=> mapNonEmpty!23182 m!759771))

(declare-fun m!759773 () Bool)

(assert (=> start!70476 m!759773))

(declare-fun m!759775 () Bool)

(assert (=> start!70476 m!759775))

(declare-fun m!759777 () Bool)

(assert (=> start!70476 m!759777))

(declare-fun m!759779 () Bool)

(assert (=> b!817744 m!759779))

(declare-fun m!759781 () Bool)

(assert (=> b!817744 m!759781))

(declare-fun m!759783 () Bool)

(assert (=> b!817744 m!759783))

(check-sat (not b!817744) (not b!817743) b_and!21495 (not b!817748) tp_is_empty!14395 (not mapNonEmpty!23182) (not b!817745) (not b_next!12685) (not start!70476))
(check-sat b_and!21495 (not b_next!12685))
