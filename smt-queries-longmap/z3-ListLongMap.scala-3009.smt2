; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42374 () Bool)

(assert start!42374)

(declare-fun b_free!11863 () Bool)

(declare-fun b_next!11863 () Bool)

(assert (=> start!42374 (= b_free!11863 (not b_next!11863))))

(declare-fun tp!41623 () Bool)

(declare-fun b_and!20293 () Bool)

(assert (=> start!42374 (= tp!41623 b_and!20293)))

(declare-fun b!472657 () Bool)

(declare-fun e!277196 () Bool)

(declare-fun tp_is_empty!13291 () Bool)

(assert (=> b!472657 (= e!277196 tp_is_empty!13291)))

(declare-fun mapIsEmpty!21649 () Bool)

(declare-fun mapRes!21649 () Bool)

(assert (=> mapIsEmpty!21649 mapRes!21649))

(declare-fun b!472658 () Bool)

(declare-fun e!277197 () Bool)

(declare-fun e!277195 () Bool)

(assert (=> b!472658 (= e!277197 (not e!277195))))

(declare-fun res!282350 () Bool)

(assert (=> b!472658 (=> res!282350 e!277195)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472658 (= res!282350 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18827 0))(
  ( (V!18828 (val!6690 Int)) )
))
(declare-datatypes ((tuple2!8858 0))(
  ( (tuple2!8859 (_1!4440 (_ BitVec 64)) (_2!4440 V!18827)) )
))
(declare-datatypes ((List!8928 0))(
  ( (Nil!8925) (Cons!8924 (h!9780 tuple2!8858) (t!14889 List!8928)) )
))
(declare-datatypes ((ListLongMap!7761 0))(
  ( (ListLongMap!7762 (toList!3896 List!8928)) )
))
(declare-fun lt!214397 () ListLongMap!7761)

(declare-fun lt!214399 () ListLongMap!7761)

(assert (=> b!472658 (= lt!214397 lt!214399)))

(declare-fun minValueBefore!38 () V!18827)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30325 0))(
  ( (array!30326 (arr!14582 (Array (_ BitVec 32) (_ BitVec 64))) (size!14935 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30325)

(declare-datatypes ((ValueCell!6302 0))(
  ( (ValueCellFull!6302 (v!8975 V!18827)) (EmptyCell!6302) )
))
(declare-datatypes ((array!30327 0))(
  ( (array!30328 (arr!14583 (Array (_ BitVec 32) ValueCell!6302)) (size!14936 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30327)

(declare-fun zeroValue!794 () V!18827)

(declare-datatypes ((Unit!13886 0))(
  ( (Unit!13887) )
))
(declare-fun lt!214402 () Unit!13886)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18827)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!224 (array!30325 array!30327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 V!18827 V!18827 (_ BitVec 32) Int) Unit!13886)

(assert (=> b!472658 (= lt!214402 (lemmaNoChangeToArrayThenSameMapNoExtras!224 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2067 (array!30325 array!30327 (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 (_ BitVec 32) Int) ListLongMap!7761)

(assert (=> b!472658 (= lt!214399 (getCurrentListMapNoExtraKeys!2067 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472658 (= lt!214397 (getCurrentListMapNoExtraKeys!2067 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472659 () Bool)

(declare-fun res!282351 () Bool)

(assert (=> b!472659 (=> (not res!282351) (not e!277197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30325 (_ BitVec 32)) Bool)

(assert (=> b!472659 (= res!282351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472660 () Bool)

(declare-fun res!282352 () Bool)

(assert (=> b!472660 (=> (not res!282352) (not e!277197))))

(assert (=> b!472660 (= res!282352 (and (= (size!14936 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14935 _keys!1025) (size!14936 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472661 () Bool)

(declare-fun e!277194 () Bool)

(assert (=> b!472661 (= e!277194 tp_is_empty!13291)))

(declare-fun b!472662 () Bool)

(assert (=> b!472662 (= e!277195 true)))

(declare-fun lt!214400 () ListLongMap!7761)

(declare-fun lt!214396 () tuple2!8858)

(declare-fun +!1748 (ListLongMap!7761 tuple2!8858) ListLongMap!7761)

(assert (=> b!472662 (= (+!1748 lt!214400 lt!214396) (+!1748 (+!1748 lt!214400 (tuple2!8859 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214396))))

(assert (=> b!472662 (= lt!214396 (tuple2!8859 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214401 () Unit!13886)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!127 (ListLongMap!7761 (_ BitVec 64) V!18827 V!18827) Unit!13886)

(assert (=> b!472662 (= lt!214401 (addSameAsAddTwiceSameKeyDiffValues!127 lt!214400 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472662 (= lt!214400 (+!1748 lt!214397 (tuple2!8859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214398 () ListLongMap!7761)

(declare-fun getCurrentListMap!2200 (array!30325 array!30327 (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 (_ BitVec 32) Int) ListLongMap!7761)

(assert (=> b!472662 (= lt!214398 (getCurrentListMap!2200 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214395 () ListLongMap!7761)

(assert (=> b!472662 (= lt!214395 (getCurrentListMap!2200 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282349 () Bool)

(assert (=> start!42374 (=> (not res!282349) (not e!277197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42374 (= res!282349 (validMask!0 mask!1365))))

(assert (=> start!42374 e!277197))

(assert (=> start!42374 tp_is_empty!13291))

(assert (=> start!42374 tp!41623))

(assert (=> start!42374 true))

(declare-fun array_inv!10608 (array!30325) Bool)

(assert (=> start!42374 (array_inv!10608 _keys!1025)))

(declare-fun e!277199 () Bool)

(declare-fun array_inv!10609 (array!30327) Bool)

(assert (=> start!42374 (and (array_inv!10609 _values!833) e!277199)))

(declare-fun b!472663 () Bool)

(assert (=> b!472663 (= e!277199 (and e!277194 mapRes!21649))))

(declare-fun condMapEmpty!21649 () Bool)

(declare-fun mapDefault!21649 () ValueCell!6302)

(assert (=> b!472663 (= condMapEmpty!21649 (= (arr!14583 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6302)) mapDefault!21649)))))

(declare-fun mapNonEmpty!21649 () Bool)

(declare-fun tp!41622 () Bool)

(assert (=> mapNonEmpty!21649 (= mapRes!21649 (and tp!41622 e!277196))))

(declare-fun mapKey!21649 () (_ BitVec 32))

(declare-fun mapRest!21649 () (Array (_ BitVec 32) ValueCell!6302))

(declare-fun mapValue!21649 () ValueCell!6302)

(assert (=> mapNonEmpty!21649 (= (arr!14583 _values!833) (store mapRest!21649 mapKey!21649 mapValue!21649))))

(declare-fun b!472664 () Bool)

(declare-fun res!282348 () Bool)

(assert (=> b!472664 (=> (not res!282348) (not e!277197))))

(declare-datatypes ((List!8929 0))(
  ( (Nil!8926) (Cons!8925 (h!9781 (_ BitVec 64)) (t!14890 List!8929)) )
))
(declare-fun arrayNoDuplicates!0 (array!30325 (_ BitVec 32) List!8929) Bool)

(assert (=> b!472664 (= res!282348 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8926))))

(assert (= (and start!42374 res!282349) b!472660))

(assert (= (and b!472660 res!282352) b!472659))

(assert (= (and b!472659 res!282351) b!472664))

(assert (= (and b!472664 res!282348) b!472658))

(assert (= (and b!472658 (not res!282350)) b!472662))

(assert (= (and b!472663 condMapEmpty!21649) mapIsEmpty!21649))

(assert (= (and b!472663 (not condMapEmpty!21649)) mapNonEmpty!21649))

(get-info :version)

(assert (= (and mapNonEmpty!21649 ((_ is ValueCellFull!6302) mapValue!21649)) b!472657))

(assert (= (and b!472663 ((_ is ValueCellFull!6302) mapDefault!21649)) b!472661))

(assert (= start!42374 b!472663))

(declare-fun m!454075 () Bool)

(assert (=> mapNonEmpty!21649 m!454075))

(declare-fun m!454077 () Bool)

(assert (=> b!472659 m!454077))

(declare-fun m!454079 () Bool)

(assert (=> b!472658 m!454079))

(declare-fun m!454081 () Bool)

(assert (=> b!472658 m!454081))

(declare-fun m!454083 () Bool)

(assert (=> b!472658 m!454083))

(declare-fun m!454085 () Bool)

(assert (=> start!42374 m!454085))

(declare-fun m!454087 () Bool)

(assert (=> start!42374 m!454087))

(declare-fun m!454089 () Bool)

(assert (=> start!42374 m!454089))

(declare-fun m!454091 () Bool)

(assert (=> b!472662 m!454091))

(declare-fun m!454093 () Bool)

(assert (=> b!472662 m!454093))

(declare-fun m!454095 () Bool)

(assert (=> b!472662 m!454095))

(declare-fun m!454097 () Bool)

(assert (=> b!472662 m!454097))

(assert (=> b!472662 m!454091))

(declare-fun m!454099 () Bool)

(assert (=> b!472662 m!454099))

(declare-fun m!454101 () Bool)

(assert (=> b!472662 m!454101))

(declare-fun m!454103 () Bool)

(assert (=> b!472662 m!454103))

(declare-fun m!454105 () Bool)

(assert (=> b!472664 m!454105))

(check-sat tp_is_empty!13291 (not start!42374) (not b!472662) (not b!472664) (not b!472659) b_and!20293 (not b_next!11863) (not mapNonEmpty!21649) (not b!472658))
(check-sat b_and!20293 (not b_next!11863))
