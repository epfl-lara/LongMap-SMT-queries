; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70662 () Bool)

(assert start!70662)

(declare-fun b_free!12823 () Bool)

(declare-fun b_next!12823 () Bool)

(assert (=> start!70662 (= b_free!12823 (not b_next!12823))))

(declare-fun tp!45201 () Bool)

(declare-fun b_and!21663 () Bool)

(assert (=> start!70662 (= tp!45201 b_and!21663)))

(declare-fun b!819762 () Bool)

(declare-fun e!455214 () Bool)

(declare-fun e!455217 () Bool)

(assert (=> b!819762 (= e!455214 (not e!455217))))

(declare-fun res!559159 () Bool)

(assert (=> b!819762 (=> res!559159 e!455217)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819762 (= res!559159 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24379 0))(
  ( (V!24380 (val!7314 Int)) )
))
(declare-datatypes ((tuple2!9530 0))(
  ( (tuple2!9531 (_1!4776 (_ BitVec 64)) (_2!4776 V!24379)) )
))
(declare-datatypes ((List!15337 0))(
  ( (Nil!15334) (Cons!15333 (h!16468 tuple2!9530) (t!21658 List!15337)) )
))
(declare-datatypes ((ListLongMap!8355 0))(
  ( (ListLongMap!8356 (toList!4193 List!15337)) )
))
(declare-fun lt!367495 () ListLongMap!8355)

(declare-fun lt!367487 () ListLongMap!8355)

(assert (=> b!819762 (= lt!367495 lt!367487)))

(declare-datatypes ((array!45265 0))(
  ( (array!45266 (arr!21682 (Array (_ BitVec 32) (_ BitVec 64))) (size!22102 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45265)

(declare-fun zeroValueAfter!34 () V!24379)

(declare-fun minValue!754 () V!24379)

(declare-datatypes ((ValueCell!6851 0))(
  ( (ValueCellFull!6851 (v!9743 V!24379)) (EmptyCell!6851) )
))
(declare-datatypes ((array!45267 0))(
  ( (array!45268 (arr!21683 (Array (_ BitVec 32) ValueCell!6851)) (size!22103 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45267)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27936 0))(
  ( (Unit!27937) )
))
(declare-fun lt!367490 () Unit!27936)

(declare-fun zeroValueBefore!34 () V!24379)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!377 (array!45265 array!45267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 V!24379 V!24379 (_ BitVec 32) Int) Unit!27936)

(assert (=> b!819762 (= lt!367490 (lemmaNoChangeToArrayThenSameMapNoExtras!377 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2289 (array!45265 array!45267 (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 (_ BitVec 32) Int) ListLongMap!8355)

(assert (=> b!819762 (= lt!367487 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819762 (= lt!367495 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819763 () Bool)

(declare-fun res!559161 () Bool)

(assert (=> b!819763 (=> (not res!559161) (not e!455214))))

(declare-datatypes ((List!15338 0))(
  ( (Nil!15335) (Cons!15334 (h!16469 (_ BitVec 64)) (t!21659 List!15338)) )
))
(declare-fun arrayNoDuplicates!0 (array!45265 (_ BitVec 32) List!15338) Bool)

(assert (=> b!819763 (= res!559161 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15335))))

(declare-fun res!559162 () Bool)

(assert (=> start!70662 (=> (not res!559162) (not e!455214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70662 (= res!559162 (validMask!0 mask!1312))))

(assert (=> start!70662 e!455214))

(declare-fun tp_is_empty!14533 () Bool)

(assert (=> start!70662 tp_is_empty!14533))

(declare-fun array_inv!17361 (array!45265) Bool)

(assert (=> start!70662 (array_inv!17361 _keys!976)))

(assert (=> start!70662 true))

(declare-fun e!455215 () Bool)

(declare-fun array_inv!17362 (array!45267) Bool)

(assert (=> start!70662 (and (array_inv!17362 _values!788) e!455215)))

(assert (=> start!70662 tp!45201))

(declare-fun b!819764 () Bool)

(declare-fun e!455218 () Bool)

(assert (=> b!819764 (= e!455218 tp_is_empty!14533)))

(declare-fun mapIsEmpty!23398 () Bool)

(declare-fun mapRes!23398 () Bool)

(assert (=> mapIsEmpty!23398 mapRes!23398))

(declare-fun b!819765 () Bool)

(declare-fun e!455212 () Bool)

(assert (=> b!819765 (= e!455212 tp_is_empty!14533)))

(declare-fun b!819766 () Bool)

(assert (=> b!819766 (= e!455217 true)))

(declare-fun lt!367488 () tuple2!9530)

(declare-fun lt!367491 () ListLongMap!8355)

(declare-fun lt!367492 () tuple2!9530)

(declare-fun +!1832 (ListLongMap!8355 tuple2!9530) ListLongMap!8355)

(assert (=> b!819766 (= lt!367491 (+!1832 (+!1832 lt!367487 lt!367492) lt!367488))))

(declare-fun lt!367489 () ListLongMap!8355)

(assert (=> b!819766 (= (+!1832 lt!367495 lt!367488) (+!1832 lt!367489 lt!367488))))

(declare-fun lt!367496 () Unit!27936)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!173 (ListLongMap!8355 (_ BitVec 64) V!24379 V!24379) Unit!27936)

(assert (=> b!819766 (= lt!367496 (addSameAsAddTwiceSameKeyDiffValues!173 lt!367495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819766 (= lt!367488 (tuple2!9531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455216 () Bool)

(assert (=> b!819766 e!455216))

(declare-fun res!559158 () Bool)

(assert (=> b!819766 (=> (not res!559158) (not e!455216))))

(declare-fun lt!367493 () ListLongMap!8355)

(assert (=> b!819766 (= res!559158 (= lt!367493 lt!367489))))

(assert (=> b!819766 (= lt!367489 (+!1832 lt!367495 lt!367492))))

(assert (=> b!819766 (= lt!367492 (tuple2!9531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!367494 () ListLongMap!8355)

(declare-fun getCurrentListMap!2386 (array!45265 array!45267 (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 (_ BitVec 32) Int) ListLongMap!8355)

(assert (=> b!819766 (= lt!367494 (getCurrentListMap!2386 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819766 (= lt!367493 (getCurrentListMap!2386 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819767 () Bool)

(declare-fun res!559160 () Bool)

(assert (=> b!819767 (=> (not res!559160) (not e!455214))))

(assert (=> b!819767 (= res!559160 (and (= (size!22103 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22102 _keys!976) (size!22103 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819768 () Bool)

(assert (=> b!819768 (= e!455216 (= lt!367494 (+!1832 lt!367487 (tuple2!9531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapNonEmpty!23398 () Bool)

(declare-fun tp!45202 () Bool)

(assert (=> mapNonEmpty!23398 (= mapRes!23398 (and tp!45202 e!455212))))

(declare-fun mapKey!23398 () (_ BitVec 32))

(declare-fun mapValue!23398 () ValueCell!6851)

(declare-fun mapRest!23398 () (Array (_ BitVec 32) ValueCell!6851))

(assert (=> mapNonEmpty!23398 (= (arr!21683 _values!788) (store mapRest!23398 mapKey!23398 mapValue!23398))))

(declare-fun b!819769 () Bool)

(declare-fun res!559157 () Bool)

(assert (=> b!819769 (=> (not res!559157) (not e!455214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45265 (_ BitVec 32)) Bool)

(assert (=> b!819769 (= res!559157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819770 () Bool)

(assert (=> b!819770 (= e!455215 (and e!455218 mapRes!23398))))

(declare-fun condMapEmpty!23398 () Bool)

(declare-fun mapDefault!23398 () ValueCell!6851)

(assert (=> b!819770 (= condMapEmpty!23398 (= (arr!21683 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6851)) mapDefault!23398)))))

(assert (= (and start!70662 res!559162) b!819767))

(assert (= (and b!819767 res!559160) b!819769))

(assert (= (and b!819769 res!559157) b!819763))

(assert (= (and b!819763 res!559161) b!819762))

(assert (= (and b!819762 (not res!559159)) b!819766))

(assert (= (and b!819766 res!559158) b!819768))

(assert (= (and b!819770 condMapEmpty!23398) mapIsEmpty!23398))

(assert (= (and b!819770 (not condMapEmpty!23398)) mapNonEmpty!23398))

(get-info :version)

(assert (= (and mapNonEmpty!23398 ((_ is ValueCellFull!6851) mapValue!23398)) b!819765))

(assert (= (and b!819770 ((_ is ValueCellFull!6851) mapDefault!23398)) b!819764))

(assert (= start!70662 b!819770))

(declare-fun m!761603 () Bool)

(assert (=> mapNonEmpty!23398 m!761603))

(declare-fun m!761605 () Bool)

(assert (=> b!819766 m!761605))

(declare-fun m!761607 () Bool)

(assert (=> b!819766 m!761607))

(declare-fun m!761609 () Bool)

(assert (=> b!819766 m!761609))

(declare-fun m!761611 () Bool)

(assert (=> b!819766 m!761611))

(declare-fun m!761613 () Bool)

(assert (=> b!819766 m!761613))

(declare-fun m!761615 () Bool)

(assert (=> b!819766 m!761615))

(assert (=> b!819766 m!761611))

(declare-fun m!761617 () Bool)

(assert (=> b!819766 m!761617))

(declare-fun m!761619 () Bool)

(assert (=> b!819766 m!761619))

(declare-fun m!761621 () Bool)

(assert (=> b!819763 m!761621))

(declare-fun m!761623 () Bool)

(assert (=> b!819769 m!761623))

(declare-fun m!761625 () Bool)

(assert (=> b!819768 m!761625))

(declare-fun m!761627 () Bool)

(assert (=> b!819762 m!761627))

(declare-fun m!761629 () Bool)

(assert (=> b!819762 m!761629))

(declare-fun m!761631 () Bool)

(assert (=> b!819762 m!761631))

(declare-fun m!761633 () Bool)

(assert (=> start!70662 m!761633))

(declare-fun m!761635 () Bool)

(assert (=> start!70662 m!761635))

(declare-fun m!761637 () Bool)

(assert (=> start!70662 m!761637))

(check-sat (not b!819762) tp_is_empty!14533 (not b!819768) b_and!21663 (not mapNonEmpty!23398) (not start!70662) (not b!819766) (not b!819763) (not b!819769) (not b_next!12823))
(check-sat b_and!21663 (not b_next!12823))
