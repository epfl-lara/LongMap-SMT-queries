; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71174 () Bool)

(assert start!71174)

(declare-fun b_free!13341 () Bool)

(declare-fun b_next!13341 () Bool)

(assert (=> start!71174 (= b_free!13341 (not b_next!13341))))

(declare-fun tp!46782 () Bool)

(declare-fun b_and!22267 () Bool)

(assert (=> start!71174 (= tp!46782 b_and!22267)))

(declare-fun b!826784 () Bool)

(declare-fun e!460476 () Bool)

(declare-fun tp_is_empty!15051 () Bool)

(assert (=> b!826784 (= e!460476 tp_is_empty!15051)))

(declare-fun b!826785 () Bool)

(declare-fun res!563604 () Bool)

(declare-fun e!460479 () Bool)

(assert (=> b!826785 (=> (not res!563604) (not e!460479))))

(declare-datatypes ((array!46280 0))(
  ( (array!46281 (arr!22185 (Array (_ BitVec 32) (_ BitVec 64))) (size!22606 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46280)

(declare-datatypes ((List!15834 0))(
  ( (Nil!15831) (Cons!15830 (h!16959 (_ BitVec 64)) (t!22181 List!15834)) )
))
(declare-fun arrayNoDuplicates!0 (array!46280 (_ BitVec 32) List!15834) Bool)

(assert (=> b!826785 (= res!563604 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15831))))

(declare-fun mapNonEmpty!24202 () Bool)

(declare-fun mapRes!24202 () Bool)

(declare-fun tp!46783 () Bool)

(assert (=> mapNonEmpty!24202 (= mapRes!24202 (and tp!46783 e!460476))))

(declare-datatypes ((V!25069 0))(
  ( (V!25070 (val!7573 Int)) )
))
(declare-datatypes ((ValueCell!7110 0))(
  ( (ValueCellFull!7110 (v!10007 V!25069)) (EmptyCell!7110) )
))
(declare-fun mapValue!24202 () ValueCell!7110)

(declare-datatypes ((array!46282 0))(
  ( (array!46283 (arr!22186 (Array (_ BitVec 32) ValueCell!7110)) (size!22607 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46282)

(declare-fun mapRest!24202 () (Array (_ BitVec 32) ValueCell!7110))

(declare-fun mapKey!24202 () (_ BitVec 32))

(assert (=> mapNonEmpty!24202 (= (arr!22186 _values!788) (store mapRest!24202 mapKey!24202 mapValue!24202))))

(declare-fun mapIsEmpty!24202 () Bool)

(assert (=> mapIsEmpty!24202 mapRes!24202))

(declare-fun b!826787 () Bool)

(declare-fun e!460483 () Bool)

(assert (=> b!826787 (= e!460483 tp_is_empty!15051)))

(declare-fun b!826788 () Bool)

(declare-fun e!460481 () Bool)

(assert (=> b!826788 (= e!460481 (and e!460483 mapRes!24202))))

(declare-fun condMapEmpty!24202 () Bool)

(declare-fun mapDefault!24202 () ValueCell!7110)

(assert (=> b!826788 (= condMapEmpty!24202 (= (arr!22186 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7110)) mapDefault!24202)))))

(declare-datatypes ((tuple2!10036 0))(
  ( (tuple2!10037 (_1!5029 (_ BitVec 64)) (_2!5029 V!25069)) )
))
(declare-fun lt!374451 () tuple2!10036)

(declare-fun lt!374449 () tuple2!10036)

(declare-fun b!826789 () Bool)

(declare-datatypes ((List!15835 0))(
  ( (Nil!15832) (Cons!15831 (h!16960 tuple2!10036) (t!22182 List!15835)) )
))
(declare-datatypes ((ListLongMap!8859 0))(
  ( (ListLongMap!8860 (toList!4445 List!15835)) )
))
(declare-fun lt!374453 () ListLongMap!8859)

(declare-fun e!460480 () Bool)

(declare-fun lt!374456 () ListLongMap!8859)

(declare-fun +!1952 (ListLongMap!8859 tuple2!10036) ListLongMap!8859)

(assert (=> b!826789 (= e!460480 (= lt!374453 (+!1952 (+!1952 lt!374456 lt!374449) lt!374451)))))

(declare-fun b!826790 () Bool)

(declare-fun e!460477 () Bool)

(assert (=> b!826790 (= e!460479 (not e!460477))))

(declare-fun res!563598 () Bool)

(assert (=> b!826790 (=> res!563598 e!460477)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826790 (= res!563598 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374450 () ListLongMap!8859)

(assert (=> b!826790 (= lt!374450 lt!374456)))

(declare-datatypes ((Unit!28351 0))(
  ( (Unit!28352) )
))
(declare-fun lt!374455 () Unit!28351)

(declare-fun zeroValueBefore!34 () V!25069)

(declare-fun zeroValueAfter!34 () V!25069)

(declare-fun minValue!754 () V!25069)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!560 (array!46280 array!46282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25069 V!25069 V!25069 V!25069 (_ BitVec 32) Int) Unit!28351)

(assert (=> b!826790 (= lt!374455 (lemmaNoChangeToArrayThenSameMapNoExtras!560 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2450 (array!46280 array!46282 (_ BitVec 32) (_ BitVec 32) V!25069 V!25069 (_ BitVec 32) Int) ListLongMap!8859)

(assert (=> b!826790 (= lt!374456 (getCurrentListMapNoExtraKeys!2450 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826790 (= lt!374450 (getCurrentListMapNoExtraKeys!2450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563601 () Bool)

(assert (=> start!71174 (=> (not res!563601) (not e!460479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71174 (= res!563601 (validMask!0 mask!1312))))

(assert (=> start!71174 e!460479))

(assert (=> start!71174 tp_is_empty!15051))

(declare-fun array_inv!17681 (array!46280) Bool)

(assert (=> start!71174 (array_inv!17681 _keys!976)))

(assert (=> start!71174 true))

(declare-fun array_inv!17682 (array!46282) Bool)

(assert (=> start!71174 (and (array_inv!17682 _values!788) e!460481)))

(assert (=> start!71174 tp!46782))

(declare-fun b!826786 () Bool)

(assert (=> b!826786 (= e!460477 true)))

(declare-fun lt!374454 () ListLongMap!8859)

(assert (=> b!826786 (= lt!374454 (+!1952 (+!1952 lt!374450 lt!374451) lt!374449))))

(declare-fun lt!374445 () ListLongMap!8859)

(declare-fun lt!374457 () ListLongMap!8859)

(assert (=> b!826786 (and (= lt!374445 lt!374457) (= lt!374453 lt!374457) (= lt!374453 lt!374445))))

(declare-fun lt!374448 () ListLongMap!8859)

(assert (=> b!826786 (= lt!374457 (+!1952 lt!374448 lt!374451))))

(declare-fun lt!374458 () ListLongMap!8859)

(assert (=> b!826786 (= lt!374445 (+!1952 lt!374458 lt!374451))))

(declare-fun lt!374452 () Unit!28351)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!234 (ListLongMap!8859 (_ BitVec 64) V!25069 V!25069) Unit!28351)

(assert (=> b!826786 (= lt!374452 (addSameAsAddTwiceSameKeyDiffValues!234 lt!374458 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826786 e!460480))

(declare-fun res!563600 () Bool)

(assert (=> b!826786 (=> (not res!563600) (not e!460480))))

(declare-fun lt!374447 () ListLongMap!8859)

(assert (=> b!826786 (= res!563600 (= lt!374447 lt!374448))))

(declare-fun lt!374446 () tuple2!10036)

(assert (=> b!826786 (= lt!374448 (+!1952 lt!374458 lt!374446))))

(assert (=> b!826786 (= lt!374458 (+!1952 lt!374450 lt!374449))))

(assert (=> b!826786 (= lt!374451 (tuple2!10037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460478 () Bool)

(assert (=> b!826786 e!460478))

(declare-fun res!563599 () Bool)

(assert (=> b!826786 (=> (not res!563599) (not e!460478))))

(assert (=> b!826786 (= res!563599 (= lt!374447 (+!1952 (+!1952 lt!374450 lt!374446) lt!374449)))))

(assert (=> b!826786 (= lt!374449 (tuple2!10037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826786 (= lt!374446 (tuple2!10037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2574 (array!46280 array!46282 (_ BitVec 32) (_ BitVec 32) V!25069 V!25069 (_ BitVec 32) Int) ListLongMap!8859)

(assert (=> b!826786 (= lt!374453 (getCurrentListMap!2574 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826786 (= lt!374447 (getCurrentListMap!2574 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826791 () Bool)

(assert (=> b!826791 (= e!460478 (= lt!374453 (+!1952 (+!1952 lt!374456 (tuple2!10037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374449)))))

(declare-fun b!826792 () Bool)

(declare-fun res!563602 () Bool)

(assert (=> b!826792 (=> (not res!563602) (not e!460479))))

(assert (=> b!826792 (= res!563602 (and (= (size!22607 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22606 _keys!976) (size!22607 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826793 () Bool)

(declare-fun res!563603 () Bool)

(assert (=> b!826793 (=> (not res!563603) (not e!460479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46280 (_ BitVec 32)) Bool)

(assert (=> b!826793 (= res!563603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71174 res!563601) b!826792))

(assert (= (and b!826792 res!563602) b!826793))

(assert (= (and b!826793 res!563603) b!826785))

(assert (= (and b!826785 res!563604) b!826790))

(assert (= (and b!826790 (not res!563598)) b!826786))

(assert (= (and b!826786 res!563599) b!826791))

(assert (= (and b!826786 res!563600) b!826789))

(assert (= (and b!826788 condMapEmpty!24202) mapIsEmpty!24202))

(assert (= (and b!826788 (not condMapEmpty!24202)) mapNonEmpty!24202))

(get-info :version)

(assert (= (and mapNonEmpty!24202 ((_ is ValueCellFull!7110) mapValue!24202)) b!826784))

(assert (= (and b!826788 ((_ is ValueCellFull!7110) mapDefault!24202)) b!826787))

(assert (= start!71174 b!826788))

(declare-fun m!769731 () Bool)

(assert (=> start!71174 m!769731))

(declare-fun m!769733 () Bool)

(assert (=> start!71174 m!769733))

(declare-fun m!769735 () Bool)

(assert (=> start!71174 m!769735))

(declare-fun m!769737 () Bool)

(assert (=> mapNonEmpty!24202 m!769737))

(declare-fun m!769739 () Bool)

(assert (=> b!826789 m!769739))

(assert (=> b!826789 m!769739))

(declare-fun m!769741 () Bool)

(assert (=> b!826789 m!769741))

(declare-fun m!769743 () Bool)

(assert (=> b!826786 m!769743))

(declare-fun m!769745 () Bool)

(assert (=> b!826786 m!769745))

(declare-fun m!769747 () Bool)

(assert (=> b!826786 m!769747))

(declare-fun m!769749 () Bool)

(assert (=> b!826786 m!769749))

(declare-fun m!769751 () Bool)

(assert (=> b!826786 m!769751))

(assert (=> b!826786 m!769749))

(declare-fun m!769753 () Bool)

(assert (=> b!826786 m!769753))

(declare-fun m!769755 () Bool)

(assert (=> b!826786 m!769755))

(declare-fun m!769757 () Bool)

(assert (=> b!826786 m!769757))

(assert (=> b!826786 m!769755))

(declare-fun m!769759 () Bool)

(assert (=> b!826786 m!769759))

(declare-fun m!769761 () Bool)

(assert (=> b!826786 m!769761))

(declare-fun m!769763 () Bool)

(assert (=> b!826786 m!769763))

(declare-fun m!769765 () Bool)

(assert (=> b!826785 m!769765))

(declare-fun m!769767 () Bool)

(assert (=> b!826793 m!769767))

(declare-fun m!769769 () Bool)

(assert (=> b!826790 m!769769))

(declare-fun m!769771 () Bool)

(assert (=> b!826790 m!769771))

(declare-fun m!769773 () Bool)

(assert (=> b!826790 m!769773))

(declare-fun m!769775 () Bool)

(assert (=> b!826791 m!769775))

(assert (=> b!826791 m!769775))

(declare-fun m!769777 () Bool)

(assert (=> b!826791 m!769777))

(check-sat (not b!826790) b_and!22267 (not start!71174) tp_is_empty!15051 (not b!826785) (not b!826789) (not b_next!13341) (not mapNonEmpty!24202) (not b!826791) (not b!826793) (not b!826786))
(check-sat b_and!22267 (not b_next!13341))
