; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20620 () Bool)

(assert start!20620)

(declare-fun b_free!5275 () Bool)

(declare-fun b_next!5275 () Bool)

(assert (=> start!20620 (= b_free!5275 (not b_next!5275))))

(declare-fun tp!18857 () Bool)

(declare-fun b_and!11995 () Bool)

(assert (=> start!20620 (= tp!18857 b_and!11995)))

(declare-fun b!205450 () Bool)

(declare-fun e!134335 () Bool)

(declare-fun tp_is_empty!5131 () Bool)

(assert (=> b!205450 (= e!134335 tp_is_empty!5131)))

(declare-fun b!205451 () Bool)

(declare-fun res!99281 () Bool)

(declare-fun e!134338 () Bool)

(assert (=> b!205451 (=> (not res!99281) (not e!134338))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9461 0))(
  ( (array!9462 (arr!4480 (Array (_ BitVec 32) (_ BitVec 64))) (size!4806 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9461)

(assert (=> b!205451 (= res!99281 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4806 _keys!825))))))

(declare-fun b!205452 () Bool)

(declare-fun e!134339 () Bool)

(assert (=> b!205452 (= e!134338 (not e!134339))))

(declare-fun res!99286 () Bool)

(assert (=> b!205452 (=> res!99286 e!134339)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205452 (= res!99286 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6489 0))(
  ( (V!6490 (val!2610 Int)) )
))
(declare-datatypes ((ValueCell!2222 0))(
  ( (ValueCellFull!2222 (v!4574 V!6489)) (EmptyCell!2222) )
))
(declare-datatypes ((array!9463 0))(
  ( (array!9464 (arr!4481 (Array (_ BitVec 32) ValueCell!2222)) (size!4807 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9463)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6489)

(declare-datatypes ((tuple2!3944 0))(
  ( (tuple2!3945 (_1!1983 (_ BitVec 64)) (_2!1983 V!6489)) )
))
(declare-datatypes ((List!2845 0))(
  ( (Nil!2842) (Cons!2841 (h!3483 tuple2!3944) (t!7767 List!2845)) )
))
(declare-datatypes ((ListLongMap!2847 0))(
  ( (ListLongMap!2848 (toList!1439 List!2845)) )
))
(declare-fun lt!104549 () ListLongMap!2847)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6489)

(declare-fun getCurrentListMap!984 (array!9461 array!9463 (_ BitVec 32) (_ BitVec 32) V!6489 V!6489 (_ BitVec 32) Int) ListLongMap!2847)

(assert (=> b!205452 (= lt!104549 (getCurrentListMap!984 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104552 () ListLongMap!2847)

(declare-fun lt!104547 () array!9463)

(assert (=> b!205452 (= lt!104552 (getCurrentListMap!984 _keys!825 lt!104547 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104557 () ListLongMap!2847)

(declare-fun lt!104555 () ListLongMap!2847)

(assert (=> b!205452 (and (= lt!104557 lt!104555) (= lt!104555 lt!104557))))

(declare-fun lt!104548 () ListLongMap!2847)

(declare-fun lt!104553 () tuple2!3944)

(declare-fun +!488 (ListLongMap!2847 tuple2!3944) ListLongMap!2847)

(assert (=> b!205452 (= lt!104555 (+!488 lt!104548 lt!104553))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6489)

(assert (=> b!205452 (= lt!104553 (tuple2!3945 k0!843 v!520))))

(declare-datatypes ((Unit!6218 0))(
  ( (Unit!6219) )
))
(declare-fun lt!104551 () Unit!6218)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!143 (array!9461 array!9463 (_ BitVec 32) (_ BitVec 32) V!6489 V!6489 (_ BitVec 32) (_ BitVec 64) V!6489 (_ BitVec 32) Int) Unit!6218)

(assert (=> b!205452 (= lt!104551 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!143 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!394 (array!9461 array!9463 (_ BitVec 32) (_ BitVec 32) V!6489 V!6489 (_ BitVec 32) Int) ListLongMap!2847)

(assert (=> b!205452 (= lt!104557 (getCurrentListMapNoExtraKeys!394 _keys!825 lt!104547 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205452 (= lt!104547 (array!9464 (store (arr!4481 _values!649) i!601 (ValueCellFull!2222 v!520)) (size!4807 _values!649)))))

(assert (=> b!205452 (= lt!104548 (getCurrentListMapNoExtraKeys!394 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205453 () Bool)

(declare-fun e!134340 () Bool)

(assert (=> b!205453 (= e!134340 tp_is_empty!5131)))

(declare-fun b!205454 () Bool)

(declare-fun res!99282 () Bool)

(assert (=> b!205454 (=> (not res!99282) (not e!134338))))

(assert (=> b!205454 (= res!99282 (and (= (size!4807 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4806 _keys!825) (size!4807 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205455 () Bool)

(declare-fun e!134334 () Bool)

(declare-fun mapRes!8765 () Bool)

(assert (=> b!205455 (= e!134334 (and e!134335 mapRes!8765))))

(declare-fun condMapEmpty!8765 () Bool)

(declare-fun mapDefault!8765 () ValueCell!2222)

(assert (=> b!205455 (= condMapEmpty!8765 (= (arr!4481 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2222)) mapDefault!8765)))))

(declare-fun b!205456 () Bool)

(declare-fun res!99287 () Bool)

(assert (=> b!205456 (=> (not res!99287) (not e!134338))))

(declare-datatypes ((List!2846 0))(
  ( (Nil!2843) (Cons!2842 (h!3484 (_ BitVec 64)) (t!7768 List!2846)) )
))
(declare-fun arrayNoDuplicates!0 (array!9461 (_ BitVec 32) List!2846) Bool)

(assert (=> b!205456 (= res!99287 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2843))))

(declare-fun b!205457 () Bool)

(declare-fun e!134337 () Bool)

(assert (=> b!205457 (= e!134337 true)))

(declare-fun lt!104554 () ListLongMap!2847)

(declare-fun lt!104558 () ListLongMap!2847)

(assert (=> b!205457 (= lt!104554 (+!488 lt!104558 lt!104553))))

(declare-fun lt!104550 () Unit!6218)

(declare-fun addCommutativeForDiffKeys!176 (ListLongMap!2847 (_ BitVec 64) V!6489 (_ BitVec 64) V!6489) Unit!6218)

(assert (=> b!205457 (= lt!104550 (addCommutativeForDiffKeys!176 lt!104548 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!99284 () Bool)

(assert (=> start!20620 (=> (not res!99284) (not e!134338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20620 (= res!99284 (validMask!0 mask!1149))))

(assert (=> start!20620 e!134338))

(declare-fun array_inv!2945 (array!9463) Bool)

(assert (=> start!20620 (and (array_inv!2945 _values!649) e!134334)))

(assert (=> start!20620 true))

(assert (=> start!20620 tp_is_empty!5131))

(declare-fun array_inv!2946 (array!9461) Bool)

(assert (=> start!20620 (array_inv!2946 _keys!825)))

(assert (=> start!20620 tp!18857))

(declare-fun b!205449 () Bool)

(declare-fun res!99280 () Bool)

(assert (=> b!205449 (=> (not res!99280) (not e!134338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205449 (= res!99280 (validKeyInArray!0 k0!843))))

(declare-fun b!205458 () Bool)

(assert (=> b!205458 (= e!134339 e!134337)))

(declare-fun res!99283 () Bool)

(assert (=> b!205458 (=> res!99283 e!134337)))

(assert (=> b!205458 (= res!99283 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205458 (= lt!104549 lt!104558)))

(declare-fun lt!104556 () tuple2!3944)

(assert (=> b!205458 (= lt!104558 (+!488 lt!104548 lt!104556))))

(assert (=> b!205458 (= lt!104552 lt!104554)))

(assert (=> b!205458 (= lt!104554 (+!488 lt!104555 lt!104556))))

(assert (=> b!205458 (= lt!104552 (+!488 lt!104557 lt!104556))))

(assert (=> b!205458 (= lt!104556 (tuple2!3945 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205459 () Bool)

(declare-fun res!99279 () Bool)

(assert (=> b!205459 (=> (not res!99279) (not e!134338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9461 (_ BitVec 32)) Bool)

(assert (=> b!205459 (= res!99279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205460 () Bool)

(declare-fun res!99285 () Bool)

(assert (=> b!205460 (=> (not res!99285) (not e!134338))))

(assert (=> b!205460 (= res!99285 (= (select (arr!4480 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8765 () Bool)

(declare-fun tp!18856 () Bool)

(assert (=> mapNonEmpty!8765 (= mapRes!8765 (and tp!18856 e!134340))))

(declare-fun mapRest!8765 () (Array (_ BitVec 32) ValueCell!2222))

(declare-fun mapKey!8765 () (_ BitVec 32))

(declare-fun mapValue!8765 () ValueCell!2222)

(assert (=> mapNonEmpty!8765 (= (arr!4481 _values!649) (store mapRest!8765 mapKey!8765 mapValue!8765))))

(declare-fun mapIsEmpty!8765 () Bool)

(assert (=> mapIsEmpty!8765 mapRes!8765))

(assert (= (and start!20620 res!99284) b!205454))

(assert (= (and b!205454 res!99282) b!205459))

(assert (= (and b!205459 res!99279) b!205456))

(assert (= (and b!205456 res!99287) b!205451))

(assert (= (and b!205451 res!99281) b!205449))

(assert (= (and b!205449 res!99280) b!205460))

(assert (= (and b!205460 res!99285) b!205452))

(assert (= (and b!205452 (not res!99286)) b!205458))

(assert (= (and b!205458 (not res!99283)) b!205457))

(assert (= (and b!205455 condMapEmpty!8765) mapIsEmpty!8765))

(assert (= (and b!205455 (not condMapEmpty!8765)) mapNonEmpty!8765))

(get-info :version)

(assert (= (and mapNonEmpty!8765 ((_ is ValueCellFull!2222) mapValue!8765)) b!205453))

(assert (= (and b!205455 ((_ is ValueCellFull!2222) mapDefault!8765)) b!205450))

(assert (= start!20620 b!205455))

(declare-fun m!232623 () Bool)

(assert (=> mapNonEmpty!8765 m!232623))

(declare-fun m!232625 () Bool)

(assert (=> b!205449 m!232625))

(declare-fun m!232627 () Bool)

(assert (=> b!205459 m!232627))

(declare-fun m!232629 () Bool)

(assert (=> b!205456 m!232629))

(declare-fun m!232631 () Bool)

(assert (=> b!205457 m!232631))

(declare-fun m!232633 () Bool)

(assert (=> b!205457 m!232633))

(declare-fun m!232635 () Bool)

(assert (=> b!205460 m!232635))

(declare-fun m!232637 () Bool)

(assert (=> b!205452 m!232637))

(declare-fun m!232639 () Bool)

(assert (=> b!205452 m!232639))

(declare-fun m!232641 () Bool)

(assert (=> b!205452 m!232641))

(declare-fun m!232643 () Bool)

(assert (=> b!205452 m!232643))

(declare-fun m!232645 () Bool)

(assert (=> b!205452 m!232645))

(declare-fun m!232647 () Bool)

(assert (=> b!205452 m!232647))

(declare-fun m!232649 () Bool)

(assert (=> b!205452 m!232649))

(declare-fun m!232651 () Bool)

(assert (=> b!205458 m!232651))

(declare-fun m!232653 () Bool)

(assert (=> b!205458 m!232653))

(declare-fun m!232655 () Bool)

(assert (=> b!205458 m!232655))

(declare-fun m!232657 () Bool)

(assert (=> start!20620 m!232657))

(declare-fun m!232659 () Bool)

(assert (=> start!20620 m!232659))

(declare-fun m!232661 () Bool)

(assert (=> start!20620 m!232661))

(check-sat (not b!205449) (not b_next!5275) (not b!205459) (not b!205456) (not b!205452) (not start!20620) tp_is_empty!5131 (not b!205458) (not b!205457) (not mapNonEmpty!8765) b_and!11995)
(check-sat b_and!11995 (not b_next!5275))
