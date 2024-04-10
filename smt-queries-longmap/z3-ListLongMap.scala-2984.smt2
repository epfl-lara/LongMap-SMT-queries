; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42196 () Bool)

(assert start!42196)

(declare-fun b_free!11715 () Bool)

(declare-fun b_next!11715 () Bool)

(assert (=> start!42196 (= b_free!11715 (not b_next!11715))))

(declare-fun tp!41170 () Bool)

(declare-fun b_and!20145 () Bool)

(assert (=> start!42196 (= tp!41170 b_and!20145)))

(declare-fun mapIsEmpty!21418 () Bool)

(declare-fun mapRes!21418 () Bool)

(assert (=> mapIsEmpty!21418 mapRes!21418))

(declare-fun res!281386 () Bool)

(declare-fun e!275975 () Bool)

(assert (=> start!42196 (=> (not res!281386) (not e!275975))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42196 (= res!281386 (validMask!0 mask!1365))))

(assert (=> start!42196 e!275975))

(declare-fun tp_is_empty!13143 () Bool)

(assert (=> start!42196 tp_is_empty!13143))

(assert (=> start!42196 tp!41170))

(assert (=> start!42196 true))

(declare-datatypes ((array!30055 0))(
  ( (array!30056 (arr!14450 (Array (_ BitVec 32) (_ BitVec 64))) (size!14802 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30055)

(declare-fun array_inv!10424 (array!30055) Bool)

(assert (=> start!42196 (array_inv!10424 _keys!1025)))

(declare-datatypes ((V!18629 0))(
  ( (V!18630 (val!6616 Int)) )
))
(declare-datatypes ((ValueCell!6228 0))(
  ( (ValueCellFull!6228 (v!8907 V!18629)) (EmptyCell!6228) )
))
(declare-datatypes ((array!30057 0))(
  ( (array!30058 (arr!14451 (Array (_ BitVec 32) ValueCell!6228)) (size!14803 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30057)

(declare-fun e!275973 () Bool)

(declare-fun array_inv!10425 (array!30057) Bool)

(assert (=> start!42196 (and (array_inv!10425 _values!833) e!275973)))

(declare-fun b!470973 () Bool)

(declare-fun e!275971 () Bool)

(assert (=> b!470973 (= e!275971 tp_is_empty!13143)))

(declare-fun b!470974 () Bool)

(declare-fun res!281387 () Bool)

(assert (=> b!470974 (=> (not res!281387) (not e!275975))))

(declare-datatypes ((List!8795 0))(
  ( (Nil!8792) (Cons!8791 (h!9647 (_ BitVec 64)) (t!14759 List!8795)) )
))
(declare-fun arrayNoDuplicates!0 (array!30055 (_ BitVec 32) List!8795) Bool)

(assert (=> b!470974 (= res!281387 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8792))))

(declare-fun mapNonEmpty!21418 () Bool)

(declare-fun tp!41169 () Bool)

(declare-fun e!275972 () Bool)

(assert (=> mapNonEmpty!21418 (= mapRes!21418 (and tp!41169 e!275972))))

(declare-fun mapValue!21418 () ValueCell!6228)

(declare-fun mapKey!21418 () (_ BitVec 32))

(declare-fun mapRest!21418 () (Array (_ BitVec 32) ValueCell!6228))

(assert (=> mapNonEmpty!21418 (= (arr!14451 _values!833) (store mapRest!21418 mapKey!21418 mapValue!21418))))

(declare-fun b!470975 () Bool)

(assert (=> b!470975 (= e!275975 (not true))))

(declare-datatypes ((tuple2!8716 0))(
  ( (tuple2!8717 (_1!4369 (_ BitVec 64)) (_2!4369 V!18629)) )
))
(declare-datatypes ((List!8796 0))(
  ( (Nil!8793) (Cons!8792 (h!9648 tuple2!8716) (t!14760 List!8796)) )
))
(declare-datatypes ((ListLongMap!7629 0))(
  ( (ListLongMap!7630 (toList!3830 List!8796)) )
))
(declare-fun lt!213688 () ListLongMap!7629)

(declare-fun lt!213686 () ListLongMap!7629)

(assert (=> b!470975 (= lt!213688 lt!213686)))

(declare-fun minValueBefore!38 () V!18629)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18629)

(declare-datatypes ((Unit!13819 0))(
  ( (Unit!13820) )
))
(declare-fun lt!213687 () Unit!13819)

(declare-fun minValueAfter!38 () V!18629)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!173 (array!30055 array!30057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18629 V!18629 V!18629 V!18629 (_ BitVec 32) Int) Unit!13819)

(assert (=> b!470975 (= lt!213687 (lemmaNoChangeToArrayThenSameMapNoExtras!173 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1993 (array!30055 array!30057 (_ BitVec 32) (_ BitVec 32) V!18629 V!18629 (_ BitVec 32) Int) ListLongMap!7629)

(assert (=> b!470975 (= lt!213686 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470975 (= lt!213688 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470976 () Bool)

(declare-fun res!281388 () Bool)

(assert (=> b!470976 (=> (not res!281388) (not e!275975))))

(assert (=> b!470976 (= res!281388 (and (= (size!14803 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14802 _keys!1025) (size!14803 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470977 () Bool)

(assert (=> b!470977 (= e!275972 tp_is_empty!13143)))

(declare-fun b!470978 () Bool)

(declare-fun res!281389 () Bool)

(assert (=> b!470978 (=> (not res!281389) (not e!275975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30055 (_ BitVec 32)) Bool)

(assert (=> b!470978 (= res!281389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470979 () Bool)

(assert (=> b!470979 (= e!275973 (and e!275971 mapRes!21418))))

(declare-fun condMapEmpty!21418 () Bool)

(declare-fun mapDefault!21418 () ValueCell!6228)

(assert (=> b!470979 (= condMapEmpty!21418 (= (arr!14451 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6228)) mapDefault!21418)))))

(assert (= (and start!42196 res!281386) b!470976))

(assert (= (and b!470976 res!281388) b!470978))

(assert (= (and b!470978 res!281389) b!470974))

(assert (= (and b!470974 res!281387) b!470975))

(assert (= (and b!470979 condMapEmpty!21418) mapIsEmpty!21418))

(assert (= (and b!470979 (not condMapEmpty!21418)) mapNonEmpty!21418))

(get-info :version)

(assert (= (and mapNonEmpty!21418 ((_ is ValueCellFull!6228) mapValue!21418)) b!470977))

(assert (= (and b!470979 ((_ is ValueCellFull!6228) mapDefault!21418)) b!470973))

(assert (= start!42196 b!470979))

(declare-fun m!453179 () Bool)

(assert (=> start!42196 m!453179))

(declare-fun m!453181 () Bool)

(assert (=> start!42196 m!453181))

(declare-fun m!453183 () Bool)

(assert (=> start!42196 m!453183))

(declare-fun m!453185 () Bool)

(assert (=> b!470975 m!453185))

(declare-fun m!453187 () Bool)

(assert (=> b!470975 m!453187))

(declare-fun m!453189 () Bool)

(assert (=> b!470975 m!453189))

(declare-fun m!453191 () Bool)

(assert (=> b!470974 m!453191))

(declare-fun m!453193 () Bool)

(assert (=> mapNonEmpty!21418 m!453193))

(declare-fun m!453195 () Bool)

(assert (=> b!470978 m!453195))

(check-sat tp_is_empty!13143 (not start!42196) b_and!20145 (not b!470974) (not b_next!11715) (not mapNonEmpty!21418) (not b!470975) (not b!470978))
(check-sat b_and!20145 (not b_next!11715))
