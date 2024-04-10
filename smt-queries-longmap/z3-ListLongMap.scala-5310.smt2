; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71082 () Bool)

(assert start!71082)

(declare-fun b_free!13269 () Bool)

(declare-fun b_next!13269 () Bool)

(assert (=> start!71082 (= b_free!13269 (not b_next!13269))))

(declare-fun tp!46563 () Bool)

(declare-fun b_and!22183 () Bool)

(assert (=> start!71082 (= tp!46563 b_and!22183)))

(declare-fun e!459488 () Bool)

(declare-datatypes ((V!24973 0))(
  ( (V!24974 (val!7537 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24973)

(declare-fun b!825498 () Bool)

(declare-datatypes ((tuple2!9978 0))(
  ( (tuple2!9979 (_1!5000 (_ BitVec 64)) (_2!5000 V!24973)) )
))
(declare-fun lt!372762 () tuple2!9978)

(declare-datatypes ((List!15783 0))(
  ( (Nil!15780) (Cons!15779 (h!16908 tuple2!9978) (t!22128 List!15783)) )
))
(declare-datatypes ((ListLongMap!8801 0))(
  ( (ListLongMap!8802 (toList!4416 List!15783)) )
))
(declare-fun lt!372756 () ListLongMap!8801)

(declare-fun lt!372755 () ListLongMap!8801)

(declare-fun +!1923 (ListLongMap!8801 tuple2!9978) ListLongMap!8801)

(assert (=> b!825498 (= e!459488 (= lt!372755 (+!1923 (+!1923 lt!372756 (tuple2!9979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372762)))))

(declare-fun b!825499 () Bool)

(declare-fun res!562738 () Bool)

(declare-fun e!459485 () Bool)

(assert (=> b!825499 (=> (not res!562738) (not e!459485))))

(declare-datatypes ((array!46142 0))(
  ( (array!46143 (arr!22117 (Array (_ BitVec 32) (_ BitVec 64))) (size!22538 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46142)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7074 0))(
  ( (ValueCellFull!7074 (v!9970 V!24973)) (EmptyCell!7074) )
))
(declare-datatypes ((array!46144 0))(
  ( (array!46145 (arr!22118 (Array (_ BitVec 32) ValueCell!7074)) (size!22539 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46144)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825499 (= res!562738 (and (= (size!22539 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22538 _keys!976) (size!22539 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825500 () Bool)

(declare-fun res!562740 () Bool)

(assert (=> b!825500 (=> (not res!562740) (not e!459485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46142 (_ BitVec 32)) Bool)

(assert (=> b!825500 (= res!562740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825501 () Bool)

(declare-fun e!459489 () Bool)

(assert (=> b!825501 (= e!459489 true)))

(declare-fun lt!372766 () ListLongMap!8801)

(declare-fun lt!372764 () ListLongMap!8801)

(declare-fun lt!372757 () tuple2!9978)

(assert (=> b!825501 (= lt!372766 (+!1923 (+!1923 lt!372764 lt!372757) lt!372762))))

(declare-fun lt!372761 () ListLongMap!8801)

(declare-fun lt!372768 () ListLongMap!8801)

(assert (=> b!825501 (and (= lt!372761 lt!372768) (= lt!372755 lt!372768) (= lt!372755 lt!372761))))

(declare-fun lt!372765 () ListLongMap!8801)

(assert (=> b!825501 (= lt!372768 (+!1923 lt!372765 lt!372757))))

(declare-fun lt!372759 () ListLongMap!8801)

(assert (=> b!825501 (= lt!372761 (+!1923 lt!372759 lt!372757))))

(declare-fun zeroValueBefore!34 () V!24973)

(declare-datatypes ((Unit!28295 0))(
  ( (Unit!28296) )
))
(declare-fun lt!372760 () Unit!28295)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!209 (ListLongMap!8801 (_ BitVec 64) V!24973 V!24973) Unit!28295)

(assert (=> b!825501 (= lt!372760 (addSameAsAddTwiceSameKeyDiffValues!209 lt!372759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459486 () Bool)

(assert (=> b!825501 e!459486))

(declare-fun res!562741 () Bool)

(assert (=> b!825501 (=> (not res!562741) (not e!459486))))

(declare-fun lt!372763 () ListLongMap!8801)

(assert (=> b!825501 (= res!562741 (= lt!372763 lt!372765))))

(declare-fun lt!372767 () tuple2!9978)

(assert (=> b!825501 (= lt!372765 (+!1923 lt!372759 lt!372767))))

(assert (=> b!825501 (= lt!372759 (+!1923 lt!372764 lt!372762))))

(assert (=> b!825501 (= lt!372757 (tuple2!9979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825501 e!459488))

(declare-fun res!562743 () Bool)

(assert (=> b!825501 (=> (not res!562743) (not e!459488))))

(assert (=> b!825501 (= res!562743 (= lt!372763 (+!1923 (+!1923 lt!372764 lt!372767) lt!372762)))))

(declare-fun minValue!754 () V!24973)

(assert (=> b!825501 (= lt!372762 (tuple2!9979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825501 (= lt!372767 (tuple2!9979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2549 (array!46142 array!46144 (_ BitVec 32) (_ BitVec 32) V!24973 V!24973 (_ BitVec 32) Int) ListLongMap!8801)

(assert (=> b!825501 (= lt!372755 (getCurrentListMap!2549 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825501 (= lt!372763 (getCurrentListMap!2549 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825502 () Bool)

(assert (=> b!825502 (= e!459486 (= lt!372755 (+!1923 (+!1923 lt!372756 lt!372762) lt!372757)))))

(declare-fun b!825503 () Bool)

(declare-fun res!562739 () Bool)

(assert (=> b!825503 (=> (not res!562739) (not e!459485))))

(declare-datatypes ((List!15784 0))(
  ( (Nil!15781) (Cons!15780 (h!16909 (_ BitVec 64)) (t!22129 List!15784)) )
))
(declare-fun arrayNoDuplicates!0 (array!46142 (_ BitVec 32) List!15784) Bool)

(assert (=> b!825503 (= res!562739 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15781))))

(declare-fun b!825504 () Bool)

(assert (=> b!825504 (= e!459485 (not e!459489))))

(declare-fun res!562744 () Bool)

(assert (=> b!825504 (=> res!562744 e!459489)))

(assert (=> b!825504 (= res!562744 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825504 (= lt!372764 lt!372756)))

(declare-fun lt!372758 () Unit!28295)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!537 (array!46142 array!46144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24973 V!24973 V!24973 V!24973 (_ BitVec 32) Int) Unit!28295)

(assert (=> b!825504 (= lt!372758 (lemmaNoChangeToArrayThenSameMapNoExtras!537 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2427 (array!46142 array!46144 (_ BitVec 32) (_ BitVec 32) V!24973 V!24973 (_ BitVec 32) Int) ListLongMap!8801)

(assert (=> b!825504 (= lt!372756 (getCurrentListMapNoExtraKeys!2427 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825504 (= lt!372764 (getCurrentListMapNoExtraKeys!2427 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825505 () Bool)

(declare-fun e!459484 () Bool)

(declare-fun tp_is_empty!14979 () Bool)

(assert (=> b!825505 (= e!459484 tp_is_empty!14979)))

(declare-fun b!825506 () Bool)

(declare-fun e!459487 () Bool)

(declare-fun mapRes!24091 () Bool)

(assert (=> b!825506 (= e!459487 (and e!459484 mapRes!24091))))

(declare-fun condMapEmpty!24091 () Bool)

(declare-fun mapDefault!24091 () ValueCell!7074)

(assert (=> b!825506 (= condMapEmpty!24091 (= (arr!22118 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7074)) mapDefault!24091)))))

(declare-fun res!562742 () Bool)

(assert (=> start!71082 (=> (not res!562742) (not e!459485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71082 (= res!562742 (validMask!0 mask!1312))))

(assert (=> start!71082 e!459485))

(assert (=> start!71082 tp_is_empty!14979))

(declare-fun array_inv!17631 (array!46142) Bool)

(assert (=> start!71082 (array_inv!17631 _keys!976)))

(assert (=> start!71082 true))

(declare-fun array_inv!17632 (array!46144) Bool)

(assert (=> start!71082 (and (array_inv!17632 _values!788) e!459487)))

(assert (=> start!71082 tp!46563))

(declare-fun mapIsEmpty!24091 () Bool)

(assert (=> mapIsEmpty!24091 mapRes!24091))

(declare-fun b!825507 () Bool)

(declare-fun e!459483 () Bool)

(assert (=> b!825507 (= e!459483 tp_is_empty!14979)))

(declare-fun mapNonEmpty!24091 () Bool)

(declare-fun tp!46564 () Bool)

(assert (=> mapNonEmpty!24091 (= mapRes!24091 (and tp!46564 e!459483))))

(declare-fun mapKey!24091 () (_ BitVec 32))

(declare-fun mapValue!24091 () ValueCell!7074)

(declare-fun mapRest!24091 () (Array (_ BitVec 32) ValueCell!7074))

(assert (=> mapNonEmpty!24091 (= (arr!22118 _values!788) (store mapRest!24091 mapKey!24091 mapValue!24091))))

(assert (= (and start!71082 res!562742) b!825499))

(assert (= (and b!825499 res!562738) b!825500))

(assert (= (and b!825500 res!562740) b!825503))

(assert (= (and b!825503 res!562739) b!825504))

(assert (= (and b!825504 (not res!562744)) b!825501))

(assert (= (and b!825501 res!562743) b!825498))

(assert (= (and b!825501 res!562741) b!825502))

(assert (= (and b!825506 condMapEmpty!24091) mapIsEmpty!24091))

(assert (= (and b!825506 (not condMapEmpty!24091)) mapNonEmpty!24091))

(get-info :version)

(assert (= (and mapNonEmpty!24091 ((_ is ValueCellFull!7074) mapValue!24091)) b!825507))

(assert (= (and b!825506 ((_ is ValueCellFull!7074) mapDefault!24091)) b!825505))

(assert (= start!71082 b!825506))

(declare-fun m!767693 () Bool)

(assert (=> b!825502 m!767693))

(assert (=> b!825502 m!767693))

(declare-fun m!767695 () Bool)

(assert (=> b!825502 m!767695))

(declare-fun m!767697 () Bool)

(assert (=> b!825504 m!767697))

(declare-fun m!767699 () Bool)

(assert (=> b!825504 m!767699))

(declare-fun m!767701 () Bool)

(assert (=> b!825504 m!767701))

(declare-fun m!767703 () Bool)

(assert (=> b!825498 m!767703))

(assert (=> b!825498 m!767703))

(declare-fun m!767705 () Bool)

(assert (=> b!825498 m!767705))

(declare-fun m!767707 () Bool)

(assert (=> b!825500 m!767707))

(declare-fun m!767709 () Bool)

(assert (=> b!825501 m!767709))

(declare-fun m!767711 () Bool)

(assert (=> b!825501 m!767711))

(declare-fun m!767713 () Bool)

(assert (=> b!825501 m!767713))

(declare-fun m!767715 () Bool)

(assert (=> b!825501 m!767715))

(declare-fun m!767717 () Bool)

(assert (=> b!825501 m!767717))

(assert (=> b!825501 m!767715))

(declare-fun m!767719 () Bool)

(assert (=> b!825501 m!767719))

(declare-fun m!767721 () Bool)

(assert (=> b!825501 m!767721))

(declare-fun m!767723 () Bool)

(assert (=> b!825501 m!767723))

(declare-fun m!767725 () Bool)

(assert (=> b!825501 m!767725))

(declare-fun m!767727 () Bool)

(assert (=> b!825501 m!767727))

(assert (=> b!825501 m!767711))

(declare-fun m!767729 () Bool)

(assert (=> b!825501 m!767729))

(declare-fun m!767731 () Bool)

(assert (=> b!825503 m!767731))

(declare-fun m!767733 () Bool)

(assert (=> mapNonEmpty!24091 m!767733))

(declare-fun m!767735 () Bool)

(assert (=> start!71082 m!767735))

(declare-fun m!767737 () Bool)

(assert (=> start!71082 m!767737))

(declare-fun m!767739 () Bool)

(assert (=> start!71082 m!767739))

(check-sat (not b!825500) (not b!825501) (not start!71082) (not b!825498) (not b!825502) (not b!825503) (not b!825504) tp_is_empty!14979 b_and!22183 (not mapNonEmpty!24091) (not b_next!13269))
(check-sat b_and!22183 (not b_next!13269))
