; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41770 () Bool)

(assert start!41770)

(declare-fun b_free!11391 () Bool)

(declare-fun b_next!11391 () Bool)

(assert (=> start!41770 (= b_free!11391 (not b_next!11391))))

(declare-fun tp!40180 () Bool)

(declare-fun b_and!19759 () Bool)

(assert (=> start!41770 (= tp!40180 b_and!19759)))

(declare-fun b!466410 () Bool)

(declare-fun e!272703 () Bool)

(declare-fun tp_is_empty!12819 () Bool)

(assert (=> b!466410 (= e!272703 tp_is_empty!12819)))

(declare-fun b!466411 () Bool)

(declare-fun e!272704 () Bool)

(assert (=> b!466411 (= e!272704 tp_is_empty!12819)))

(declare-fun b!466412 () Bool)

(declare-fun res!278785 () Bool)

(declare-fun e!272702 () Bool)

(assert (=> b!466412 (=> (not res!278785) (not e!272702))))

(declare-datatypes ((array!29421 0))(
  ( (array!29422 (arr!14139 (Array (_ BitVec 32) (_ BitVec 64))) (size!14491 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29421)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29421 (_ BitVec 32)) Bool)

(assert (=> b!466412 (= res!278785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466413 () Bool)

(declare-fun e!272706 () Bool)

(declare-fun mapRes!20914 () Bool)

(assert (=> b!466413 (= e!272706 (and e!272704 mapRes!20914))))

(declare-fun condMapEmpty!20914 () Bool)

(declare-datatypes ((V!18197 0))(
  ( (V!18198 (val!6454 Int)) )
))
(declare-datatypes ((ValueCell!6066 0))(
  ( (ValueCellFull!6066 (v!8742 V!18197)) (EmptyCell!6066) )
))
(declare-datatypes ((array!29423 0))(
  ( (array!29424 (arr!14140 (Array (_ BitVec 32) ValueCell!6066)) (size!14492 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29423)

(declare-fun mapDefault!20914 () ValueCell!6066)

(assert (=> b!466413 (= condMapEmpty!20914 (= (arr!14140 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6066)) mapDefault!20914)))))

(declare-fun res!278787 () Bool)

(assert (=> start!41770 (=> (not res!278787) (not e!272702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41770 (= res!278787 (validMask!0 mask!1365))))

(assert (=> start!41770 e!272702))

(assert (=> start!41770 tp_is_empty!12819))

(assert (=> start!41770 tp!40180))

(assert (=> start!41770 true))

(declare-fun array_inv!10210 (array!29421) Bool)

(assert (=> start!41770 (array_inv!10210 _keys!1025)))

(declare-fun array_inv!10211 (array!29423) Bool)

(assert (=> start!41770 (and (array_inv!10211 _values!833) e!272706)))

(declare-fun mapNonEmpty!20914 () Bool)

(declare-fun tp!40179 () Bool)

(assert (=> mapNonEmpty!20914 (= mapRes!20914 (and tp!40179 e!272703))))

(declare-fun mapValue!20914 () ValueCell!6066)

(declare-fun mapKey!20914 () (_ BitVec 32))

(declare-fun mapRest!20914 () (Array (_ BitVec 32) ValueCell!6066))

(assert (=> mapNonEmpty!20914 (= (arr!14140 _values!833) (store mapRest!20914 mapKey!20914 mapValue!20914))))

(declare-fun mapIsEmpty!20914 () Bool)

(assert (=> mapIsEmpty!20914 mapRes!20914))

(declare-fun b!466414 () Bool)

(declare-fun e!272707 () Bool)

(assert (=> b!466414 (= e!272702 (not e!272707))))

(declare-fun res!278789 () Bool)

(assert (=> b!466414 (=> res!278789 e!272707)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466414 (= res!278789 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8462 0))(
  ( (tuple2!8463 (_1!4242 (_ BitVec 64)) (_2!4242 V!18197)) )
))
(declare-datatypes ((List!8553 0))(
  ( (Nil!8550) (Cons!8549 (h!9405 tuple2!8462) (t!14505 List!8553)) )
))
(declare-datatypes ((ListLongMap!7375 0))(
  ( (ListLongMap!7376 (toList!3703 List!8553)) )
))
(declare-fun lt!210774 () ListLongMap!7375)

(declare-fun lt!210776 () ListLongMap!7375)

(assert (=> b!466414 (= lt!210774 lt!210776)))

(declare-fun minValueBefore!38 () V!18197)

(declare-fun zeroValue!794 () V!18197)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13570 0))(
  ( (Unit!13571) )
))
(declare-fun lt!210773 () Unit!13570)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18197)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!60 (array!29421 array!29423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18197 V!18197 V!18197 V!18197 (_ BitVec 32) Int) Unit!13570)

(assert (=> b!466414 (= lt!210773 (lemmaNoChangeToArrayThenSameMapNoExtras!60 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1880 (array!29421 array!29423 (_ BitVec 32) (_ BitVec 32) V!18197 V!18197 (_ BitVec 32) Int) ListLongMap!7375)

(assert (=> b!466414 (= lt!210776 (getCurrentListMapNoExtraKeys!1880 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466414 (= lt!210774 (getCurrentListMapNoExtraKeys!1880 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466415 () Bool)

(assert (=> b!466415 (= e!272707 true)))

(declare-fun lt!210777 () ListLongMap!7375)

(declare-fun getCurrentListMap!2153 (array!29421 array!29423 (_ BitVec 32) (_ BitVec 32) V!18197 V!18197 (_ BitVec 32) Int) ListLongMap!7375)

(assert (=> b!466415 (= lt!210777 (getCurrentListMap!2153 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210775 () ListLongMap!7375)

(declare-fun +!1659 (ListLongMap!7375 tuple2!8462) ListLongMap!7375)

(assert (=> b!466415 (= lt!210775 (+!1659 (getCurrentListMap!2153 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8463 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466416 () Bool)

(declare-fun res!278788 () Bool)

(assert (=> b!466416 (=> (not res!278788) (not e!272702))))

(declare-datatypes ((List!8554 0))(
  ( (Nil!8551) (Cons!8550 (h!9406 (_ BitVec 64)) (t!14506 List!8554)) )
))
(declare-fun arrayNoDuplicates!0 (array!29421 (_ BitVec 32) List!8554) Bool)

(assert (=> b!466416 (= res!278788 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8551))))

(declare-fun b!466417 () Bool)

(declare-fun res!278786 () Bool)

(assert (=> b!466417 (=> (not res!278786) (not e!272702))))

(assert (=> b!466417 (= res!278786 (and (= (size!14492 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14491 _keys!1025) (size!14492 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41770 res!278787) b!466417))

(assert (= (and b!466417 res!278786) b!466412))

(assert (= (and b!466412 res!278785) b!466416))

(assert (= (and b!466416 res!278788) b!466414))

(assert (= (and b!466414 (not res!278789)) b!466415))

(assert (= (and b!466413 condMapEmpty!20914) mapIsEmpty!20914))

(assert (= (and b!466413 (not condMapEmpty!20914)) mapNonEmpty!20914))

(get-info :version)

(assert (= (and mapNonEmpty!20914 ((_ is ValueCellFull!6066) mapValue!20914)) b!466410))

(assert (= (and b!466413 ((_ is ValueCellFull!6066) mapDefault!20914)) b!466411))

(assert (= start!41770 b!466413))

(declare-fun m!448627 () Bool)

(assert (=> b!466415 m!448627))

(declare-fun m!448629 () Bool)

(assert (=> b!466415 m!448629))

(assert (=> b!466415 m!448629))

(declare-fun m!448631 () Bool)

(assert (=> b!466415 m!448631))

(declare-fun m!448633 () Bool)

(assert (=> b!466416 m!448633))

(declare-fun m!448635 () Bool)

(assert (=> b!466412 m!448635))

(declare-fun m!448637 () Bool)

(assert (=> b!466414 m!448637))

(declare-fun m!448639 () Bool)

(assert (=> b!466414 m!448639))

(declare-fun m!448641 () Bool)

(assert (=> b!466414 m!448641))

(declare-fun m!448643 () Bool)

(assert (=> start!41770 m!448643))

(declare-fun m!448645 () Bool)

(assert (=> start!41770 m!448645))

(declare-fun m!448647 () Bool)

(assert (=> start!41770 m!448647))

(declare-fun m!448649 () Bool)

(assert (=> mapNonEmpty!20914 m!448649))

(check-sat (not mapNonEmpty!20914) (not b!466415) (not b!466416) tp_is_empty!12819 (not start!41770) (not b_next!11391) (not b!466414) (not b!466412) b_and!19759)
(check-sat b_and!19759 (not b_next!11391))
