; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41800 () Bool)

(assert start!41800)

(declare-fun b_free!11421 () Bool)

(declare-fun b_next!11421 () Bool)

(assert (=> start!41800 (= b_free!11421 (not b_next!11421))))

(declare-fun tp!40269 () Bool)

(declare-fun b_and!19789 () Bool)

(assert (=> start!41800 (= tp!40269 b_and!19789)))

(declare-fun b!466770 () Bool)

(declare-fun res!279012 () Bool)

(declare-fun e!272977 () Bool)

(assert (=> b!466770 (=> (not res!279012) (not e!272977))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29479 0))(
  ( (array!29480 (arr!14168 (Array (_ BitVec 32) (_ BitVec 64))) (size!14520 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29479)

(declare-datatypes ((V!18237 0))(
  ( (V!18238 (val!6469 Int)) )
))
(declare-datatypes ((ValueCell!6081 0))(
  ( (ValueCellFull!6081 (v!8757 V!18237)) (EmptyCell!6081) )
))
(declare-datatypes ((array!29481 0))(
  ( (array!29482 (arr!14169 (Array (_ BitVec 32) ValueCell!6081)) (size!14521 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29481)

(assert (=> b!466770 (= res!279012 (and (= (size!14521 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14520 _keys!1025) (size!14521 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20959 () Bool)

(declare-fun mapRes!20959 () Bool)

(declare-fun tp!40270 () Bool)

(declare-fun e!272973 () Bool)

(assert (=> mapNonEmpty!20959 (= mapRes!20959 (and tp!40270 e!272973))))

(declare-fun mapValue!20959 () ValueCell!6081)

(declare-fun mapKey!20959 () (_ BitVec 32))

(declare-fun mapRest!20959 () (Array (_ BitVec 32) ValueCell!6081))

(assert (=> mapNonEmpty!20959 (= (arr!14169 _values!833) (store mapRest!20959 mapKey!20959 mapValue!20959))))

(declare-fun mapIsEmpty!20959 () Bool)

(assert (=> mapIsEmpty!20959 mapRes!20959))

(declare-fun b!466771 () Bool)

(declare-fun res!279011 () Bool)

(assert (=> b!466771 (=> (not res!279011) (not e!272977))))

(declare-datatypes ((List!8574 0))(
  ( (Nil!8571) (Cons!8570 (h!9426 (_ BitVec 64)) (t!14526 List!8574)) )
))
(declare-fun arrayNoDuplicates!0 (array!29479 (_ BitVec 32) List!8574) Bool)

(assert (=> b!466771 (= res!279011 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8571))))

(declare-fun b!466772 () Bool)

(declare-fun tp_is_empty!12849 () Bool)

(assert (=> b!466772 (= e!272973 tp_is_empty!12849)))

(declare-fun b!466773 () Bool)

(declare-fun res!279013 () Bool)

(assert (=> b!466773 (=> (not res!279013) (not e!272977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29479 (_ BitVec 32)) Bool)

(assert (=> b!466773 (= res!279013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466774 () Bool)

(declare-fun e!272974 () Bool)

(declare-fun e!272975 () Bool)

(assert (=> b!466774 (= e!272974 (and e!272975 mapRes!20959))))

(declare-fun condMapEmpty!20959 () Bool)

(declare-fun mapDefault!20959 () ValueCell!6081)

(assert (=> b!466774 (= condMapEmpty!20959 (= (arr!14169 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6081)) mapDefault!20959)))))

(declare-fun b!466775 () Bool)

(declare-fun e!272972 () Bool)

(assert (=> b!466775 (= e!272977 (not e!272972))))

(declare-fun res!279014 () Bool)

(assert (=> b!466775 (=> res!279014 e!272972)))

(assert (=> b!466775 (= res!279014 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8484 0))(
  ( (tuple2!8485 (_1!4253 (_ BitVec 64)) (_2!4253 V!18237)) )
))
(declare-datatypes ((List!8575 0))(
  ( (Nil!8572) (Cons!8571 (h!9427 tuple2!8484) (t!14527 List!8575)) )
))
(declare-datatypes ((ListLongMap!7397 0))(
  ( (ListLongMap!7398 (toList!3714 List!8575)) )
))
(declare-fun lt!211001 () ListLongMap!7397)

(declare-fun lt!210998 () ListLongMap!7397)

(assert (=> b!466775 (= lt!211001 lt!210998)))

(declare-fun minValueBefore!38 () V!18237)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18237)

(declare-datatypes ((Unit!13590 0))(
  ( (Unit!13591) )
))
(declare-fun lt!211000 () Unit!13590)

(declare-fun minValueAfter!38 () V!18237)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!70 (array!29479 array!29481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18237 V!18237 V!18237 V!18237 (_ BitVec 32) Int) Unit!13590)

(assert (=> b!466775 (= lt!211000 (lemmaNoChangeToArrayThenSameMapNoExtras!70 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1890 (array!29479 array!29481 (_ BitVec 32) (_ BitVec 32) V!18237 V!18237 (_ BitVec 32) Int) ListLongMap!7397)

(assert (=> b!466775 (= lt!210998 (getCurrentListMapNoExtraKeys!1890 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466775 (= lt!211001 (getCurrentListMapNoExtraKeys!1890 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466777 () Bool)

(assert (=> b!466777 (= e!272972 true)))

(declare-fun lt!211002 () ListLongMap!7397)

(declare-fun getCurrentListMap!2163 (array!29479 array!29481 (_ BitVec 32) (_ BitVec 32) V!18237 V!18237 (_ BitVec 32) Int) ListLongMap!7397)

(assert (=> b!466777 (= lt!211002 (getCurrentListMap!2163 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210999 () ListLongMap!7397)

(declare-fun +!1669 (ListLongMap!7397 tuple2!8484) ListLongMap!7397)

(assert (=> b!466777 (= lt!210999 (+!1669 (getCurrentListMap!2163 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8485 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!279010 () Bool)

(assert (=> start!41800 (=> (not res!279010) (not e!272977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41800 (= res!279010 (validMask!0 mask!1365))))

(assert (=> start!41800 e!272977))

(assert (=> start!41800 tp_is_empty!12849))

(assert (=> start!41800 tp!40269))

(assert (=> start!41800 true))

(declare-fun array_inv!10228 (array!29479) Bool)

(assert (=> start!41800 (array_inv!10228 _keys!1025)))

(declare-fun array_inv!10229 (array!29481) Bool)

(assert (=> start!41800 (and (array_inv!10229 _values!833) e!272974)))

(declare-fun b!466776 () Bool)

(assert (=> b!466776 (= e!272975 tp_is_empty!12849)))

(assert (= (and start!41800 res!279010) b!466770))

(assert (= (and b!466770 res!279012) b!466773))

(assert (= (and b!466773 res!279013) b!466771))

(assert (= (and b!466771 res!279011) b!466775))

(assert (= (and b!466775 (not res!279014)) b!466777))

(assert (= (and b!466774 condMapEmpty!20959) mapIsEmpty!20959))

(assert (= (and b!466774 (not condMapEmpty!20959)) mapNonEmpty!20959))

(get-info :version)

(assert (= (and mapNonEmpty!20959 ((_ is ValueCellFull!6081) mapValue!20959)) b!466772))

(assert (= (and b!466774 ((_ is ValueCellFull!6081) mapDefault!20959)) b!466776))

(assert (= start!41800 b!466774))

(declare-fun m!448987 () Bool)

(assert (=> b!466775 m!448987))

(declare-fun m!448989 () Bool)

(assert (=> b!466775 m!448989))

(declare-fun m!448991 () Bool)

(assert (=> b!466775 m!448991))

(declare-fun m!448993 () Bool)

(assert (=> b!466777 m!448993))

(declare-fun m!448995 () Bool)

(assert (=> b!466777 m!448995))

(assert (=> b!466777 m!448995))

(declare-fun m!448997 () Bool)

(assert (=> b!466777 m!448997))

(declare-fun m!448999 () Bool)

(assert (=> b!466773 m!448999))

(declare-fun m!449001 () Bool)

(assert (=> mapNonEmpty!20959 m!449001))

(declare-fun m!449003 () Bool)

(assert (=> b!466771 m!449003))

(declare-fun m!449005 () Bool)

(assert (=> start!41800 m!449005))

(declare-fun m!449007 () Bool)

(assert (=> start!41800 m!449007))

(declare-fun m!449009 () Bool)

(assert (=> start!41800 m!449009))

(check-sat (not b!466773) b_and!19789 (not b_next!11421) (not b!466771) (not b!466775) (not start!41800) tp_is_empty!12849 (not b!466777) (not mapNonEmpty!20959))
(check-sat b_and!19789 (not b_next!11421))
