; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41712 () Bool)

(assert start!41712)

(declare-fun b_free!11365 () Bool)

(declare-fun b_next!11365 () Bool)

(assert (=> start!41712 (= b_free!11365 (not b_next!11365))))

(declare-fun tp!40099 () Bool)

(declare-fun b_and!19695 () Bool)

(assert (=> start!41712 (= tp!40099 b_and!19695)))

(declare-fun b!465643 () Bool)

(declare-fun res!278381 () Bool)

(declare-fun e!272188 () Bool)

(assert (=> b!465643 (=> (not res!278381) (not e!272188))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29363 0))(
  ( (array!29364 (arr!14111 (Array (_ BitVec 32) (_ BitVec 64))) (size!14464 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29363)

(declare-datatypes ((V!18163 0))(
  ( (V!18164 (val!6441 Int)) )
))
(declare-datatypes ((ValueCell!6053 0))(
  ( (ValueCellFull!6053 (v!8722 V!18163)) (EmptyCell!6053) )
))
(declare-datatypes ((array!29365 0))(
  ( (array!29366 (arr!14112 (Array (_ BitVec 32) ValueCell!6053)) (size!14465 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29365)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465643 (= res!278381 (and (= (size!14465 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14464 _keys!1025) (size!14465 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465644 () Bool)

(declare-fun e!272189 () Bool)

(declare-fun tp_is_empty!12793 () Bool)

(assert (=> b!465644 (= e!272189 tp_is_empty!12793)))

(declare-fun b!465645 () Bool)

(declare-fun res!278379 () Bool)

(assert (=> b!465645 (=> (not res!278379) (not e!272188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29363 (_ BitVec 32)) Bool)

(assert (=> b!465645 (= res!278379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465646 () Bool)

(declare-fun res!278382 () Bool)

(assert (=> b!465646 (=> (not res!278382) (not e!272188))))

(declare-datatypes ((List!8570 0))(
  ( (Nil!8567) (Cons!8566 (h!9422 (_ BitVec 64)) (t!14511 List!8570)) )
))
(declare-fun arrayNoDuplicates!0 (array!29363 (_ BitVec 32) List!8570) Bool)

(assert (=> b!465646 (= res!278382 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8567))))

(declare-fun b!465647 () Bool)

(declare-fun e!272185 () Bool)

(assert (=> b!465647 (= e!272185 tp_is_empty!12793)))

(declare-fun b!465648 () Bool)

(declare-fun e!272184 () Bool)

(assert (=> b!465648 (= e!272188 (not e!272184))))

(declare-fun res!278383 () Bool)

(assert (=> b!465648 (=> res!278383 e!272184)))

(assert (=> b!465648 (= res!278383 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8486 0))(
  ( (tuple2!8487 (_1!4254 (_ BitVec 64)) (_2!4254 V!18163)) )
))
(declare-datatypes ((List!8571 0))(
  ( (Nil!8568) (Cons!8567 (h!9423 tuple2!8486) (t!14512 List!8571)) )
))
(declare-datatypes ((ListLongMap!7389 0))(
  ( (ListLongMap!7390 (toList!3710 List!8571)) )
))
(declare-fun lt!210226 () ListLongMap!7389)

(declare-fun lt!210222 () ListLongMap!7389)

(assert (=> b!465648 (= lt!210226 lt!210222)))

(declare-fun minValueBefore!38 () V!18163)

(declare-fun zeroValue!794 () V!18163)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13530 0))(
  ( (Unit!13531) )
))
(declare-fun lt!210223 () Unit!13530)

(declare-fun minValueAfter!38 () V!18163)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!56 (array!29363 array!29365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 V!18163 V!18163 (_ BitVec 32) Int) Unit!13530)

(assert (=> b!465648 (= lt!210223 (lemmaNoChangeToArrayThenSameMapNoExtras!56 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1899 (array!29363 array!29365 (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 (_ BitVec 32) Int) ListLongMap!7389)

(assert (=> b!465648 (= lt!210222 (getCurrentListMapNoExtraKeys!1899 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465648 (= lt!210226 (getCurrentListMapNoExtraKeys!1899 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20872 () Bool)

(declare-fun mapRes!20872 () Bool)

(declare-fun tp!40098 () Bool)

(assert (=> mapNonEmpty!20872 (= mapRes!20872 (and tp!40098 e!272189))))

(declare-fun mapRest!20872 () (Array (_ BitVec 32) ValueCell!6053))

(declare-fun mapKey!20872 () (_ BitVec 32))

(declare-fun mapValue!20872 () ValueCell!6053)

(assert (=> mapNonEmpty!20872 (= (arr!14112 _values!833) (store mapRest!20872 mapKey!20872 mapValue!20872))))

(declare-fun b!465649 () Bool)

(declare-fun e!272186 () Bool)

(assert (=> b!465649 (= e!272186 (and e!272185 mapRes!20872))))

(declare-fun condMapEmpty!20872 () Bool)

(declare-fun mapDefault!20872 () ValueCell!6053)

(assert (=> b!465649 (= condMapEmpty!20872 (= (arr!14112 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6053)) mapDefault!20872)))))

(declare-fun b!465650 () Bool)

(assert (=> b!465650 (= e!272184 true)))

(declare-fun lt!210225 () ListLongMap!7389)

(declare-fun getCurrentListMap!2103 (array!29363 array!29365 (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 (_ BitVec 32) Int) ListLongMap!7389)

(assert (=> b!465650 (= lt!210225 (getCurrentListMap!2103 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210224 () ListLongMap!7389)

(declare-fun +!1684 (ListLongMap!7389 tuple2!8486) ListLongMap!7389)

(assert (=> b!465650 (= lt!210224 (+!1684 (getCurrentListMap!2103 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8487 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278380 () Bool)

(assert (=> start!41712 (=> (not res!278380) (not e!272188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41712 (= res!278380 (validMask!0 mask!1365))))

(assert (=> start!41712 e!272188))

(assert (=> start!41712 tp_is_empty!12793))

(assert (=> start!41712 tp!40099))

(assert (=> start!41712 true))

(declare-fun array_inv!10270 (array!29363) Bool)

(assert (=> start!41712 (array_inv!10270 _keys!1025)))

(declare-fun array_inv!10271 (array!29365) Bool)

(assert (=> start!41712 (and (array_inv!10271 _values!833) e!272186)))

(declare-fun mapIsEmpty!20872 () Bool)

(assert (=> mapIsEmpty!20872 mapRes!20872))

(assert (= (and start!41712 res!278380) b!465643))

(assert (= (and b!465643 res!278381) b!465645))

(assert (= (and b!465645 res!278379) b!465646))

(assert (= (and b!465646 res!278382) b!465648))

(assert (= (and b!465648 (not res!278383)) b!465650))

(assert (= (and b!465649 condMapEmpty!20872) mapIsEmpty!20872))

(assert (= (and b!465649 (not condMapEmpty!20872)) mapNonEmpty!20872))

(get-info :version)

(assert (= (and mapNonEmpty!20872 ((_ is ValueCellFull!6053) mapValue!20872)) b!465644))

(assert (= (and b!465649 ((_ is ValueCellFull!6053) mapDefault!20872)) b!465647))

(assert (= start!41712 b!465649))

(declare-fun m!447411 () Bool)

(assert (=> b!465648 m!447411))

(declare-fun m!447413 () Bool)

(assert (=> b!465648 m!447413))

(declare-fun m!447415 () Bool)

(assert (=> b!465648 m!447415))

(declare-fun m!447417 () Bool)

(assert (=> b!465645 m!447417))

(declare-fun m!447419 () Bool)

(assert (=> b!465646 m!447419))

(declare-fun m!447421 () Bool)

(assert (=> start!41712 m!447421))

(declare-fun m!447423 () Bool)

(assert (=> start!41712 m!447423))

(declare-fun m!447425 () Bool)

(assert (=> start!41712 m!447425))

(declare-fun m!447427 () Bool)

(assert (=> mapNonEmpty!20872 m!447427))

(declare-fun m!447429 () Bool)

(assert (=> b!465650 m!447429))

(declare-fun m!447431 () Bool)

(assert (=> b!465650 m!447431))

(assert (=> b!465650 m!447431))

(declare-fun m!447433 () Bool)

(assert (=> b!465650 m!447433))

(check-sat tp_is_empty!12793 (not b_next!11365) (not mapNonEmpty!20872) b_and!19695 (not b!465645) (not start!41712) (not b!465650) (not b!465646) (not b!465648))
(check-sat b_and!19695 (not b_next!11365))
