; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78726 () Bool)

(assert start!78726)

(declare-fun b_free!16957 () Bool)

(declare-fun b_next!16957 () Bool)

(assert (=> start!78726 (= b_free!16957 (not b_next!16957))))

(declare-fun tp!59313 () Bool)

(declare-fun b_and!27625 () Bool)

(assert (=> start!78726 (= tp!59313 b_and!27625)))

(declare-fun b!918459 () Bool)

(declare-fun res!619315 () Bool)

(declare-fun e!515562 () Bool)

(assert (=> b!918459 (=> (not res!619315) (not e!515562))))

(declare-datatypes ((array!54897 0))(
  ( (array!54898 (arr!26394 (Array (_ BitVec 32) (_ BitVec 64))) (size!26855 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54897)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30919 0))(
  ( (V!30920 (val!9783 Int)) )
))
(declare-datatypes ((ValueCell!9251 0))(
  ( (ValueCellFull!9251 (v!12300 V!30919)) (EmptyCell!9251) )
))
(declare-datatypes ((array!54899 0))(
  ( (array!54900 (arr!26395 (Array (_ BitVec 32) ValueCell!9251)) (size!26856 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54899)

(assert (=> b!918459 (= res!619315 (and (= (size!26856 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26855 _keys!1487) (size!26856 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918460 () Bool)

(declare-fun res!619318 () Bool)

(assert (=> b!918460 (=> (not res!619318) (not e!515562))))

(declare-datatypes ((List!18550 0))(
  ( (Nil!18547) (Cons!18546 (h!19692 (_ BitVec 64)) (t!26228 List!18550)) )
))
(declare-fun arrayNoDuplicates!0 (array!54897 (_ BitVec 32) List!18550) Bool)

(assert (=> b!918460 (= res!619318 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18547))))

(declare-fun b!918461 () Bool)

(declare-fun res!619310 () Bool)

(declare-fun e!515561 () Bool)

(assert (=> b!918461 (=> (not res!619310) (not e!515561))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918461 (= res!619310 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!30954 () Bool)

(declare-fun mapRes!30954 () Bool)

(declare-fun tp!59312 () Bool)

(declare-fun e!515559 () Bool)

(assert (=> mapNonEmpty!30954 (= mapRes!30954 (and tp!59312 e!515559))))

(declare-fun mapKey!30954 () (_ BitVec 32))

(declare-fun mapValue!30954 () ValueCell!9251)

(declare-fun mapRest!30954 () (Array (_ BitVec 32) ValueCell!9251))

(assert (=> mapNonEmpty!30954 (= (arr!26395 _values!1231) (store mapRest!30954 mapKey!30954 mapValue!30954))))

(declare-fun b!918463 () Bool)

(declare-fun res!619319 () Bool)

(assert (=> b!918463 (=> (not res!619319) (not e!515561))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918463 (= res!619319 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918464 () Bool)

(declare-fun e!515560 () Bool)

(assert (=> b!918464 (= e!515561 e!515560)))

(declare-fun res!619313 () Bool)

(assert (=> b!918464 (=> (not res!619313) (not e!515560))))

(declare-fun lt!412117 () (_ BitVec 64))

(assert (=> b!918464 (= res!619313 (validKeyInArray!0 lt!412117))))

(assert (=> b!918464 (= lt!412117 (select (arr!26394 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918465 () Bool)

(declare-fun e!515565 () Bool)

(declare-fun e!515563 () Bool)

(assert (=> b!918465 (= e!515565 (and e!515563 mapRes!30954))))

(declare-fun condMapEmpty!30954 () Bool)

(declare-fun mapDefault!30954 () ValueCell!9251)

(assert (=> b!918465 (= condMapEmpty!30954 (= (arr!26395 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9251)) mapDefault!30954)))))

(declare-fun b!918466 () Bool)

(declare-fun res!619317 () Bool)

(assert (=> b!918466 (=> (not res!619317) (not e!515561))))

(declare-datatypes ((tuple2!12762 0))(
  ( (tuple2!12763 (_1!6392 (_ BitVec 64)) (_2!6392 V!30919)) )
))
(declare-datatypes ((List!18551 0))(
  ( (Nil!18548) (Cons!18547 (h!19693 tuple2!12762) (t!26229 List!18551)) )
))
(declare-datatypes ((ListLongMap!11449 0))(
  ( (ListLongMap!11450 (toList!5740 List!18551)) )
))
(declare-fun lt!412118 () ListLongMap!11449)

(declare-fun v!791 () V!30919)

(declare-fun apply!572 (ListLongMap!11449 (_ BitVec 64)) V!30919)

(assert (=> b!918466 (= res!619317 (= (apply!572 lt!412118 k0!1099) v!791))))

(declare-fun b!918467 () Bool)

(declare-fun tp_is_empty!19465 () Bool)

(assert (=> b!918467 (= e!515563 tp_is_empty!19465)))

(declare-fun res!619314 () Bool)

(assert (=> start!78726 (=> (not res!619314) (not e!515562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78726 (= res!619314 (validMask!0 mask!1881))))

(assert (=> start!78726 e!515562))

(assert (=> start!78726 true))

(assert (=> start!78726 tp_is_empty!19465))

(declare-fun array_inv!20658 (array!54899) Bool)

(assert (=> start!78726 (and (array_inv!20658 _values!1231) e!515565)))

(assert (=> start!78726 tp!59313))

(declare-fun array_inv!20659 (array!54897) Bool)

(assert (=> start!78726 (array_inv!20659 _keys!1487)))

(declare-fun b!918462 () Bool)

(declare-fun res!619316 () Bool)

(assert (=> b!918462 (=> (not res!619316) (not e!515562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54897 (_ BitVec 32)) Bool)

(assert (=> b!918462 (= res!619316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918468 () Bool)

(declare-fun res!619312 () Bool)

(assert (=> b!918468 (=> (not res!619312) (not e!515562))))

(assert (=> b!918468 (= res!619312 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26855 _keys!1487))))))

(declare-fun b!918469 () Bool)

(assert (=> b!918469 (= e!515560 (not true))))

(declare-fun lt!412115 () tuple2!12762)

(declare-fun contains!4741 (ListLongMap!11449 (_ BitVec 64)) Bool)

(declare-fun +!2660 (ListLongMap!11449 tuple2!12762) ListLongMap!11449)

(assert (=> b!918469 (contains!4741 (+!2660 lt!412118 lt!412115) k0!1099)))

(declare-fun lt!412116 () V!30919)

(declare-datatypes ((Unit!30932 0))(
  ( (Unit!30933) )
))
(declare-fun lt!412113 () Unit!30932)

(declare-fun addStillContains!357 (ListLongMap!11449 (_ BitVec 64) V!30919 (_ BitVec 64)) Unit!30932)

(assert (=> b!918469 (= lt!412113 (addStillContains!357 lt!412118 lt!412117 lt!412116 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30919)

(declare-fun minValue!1173 () V!30919)

(declare-fun getCurrentListMap!2933 (array!54897 array!54899 (_ BitVec 32) (_ BitVec 32) V!30919 V!30919 (_ BitVec 32) Int) ListLongMap!11449)

(assert (=> b!918469 (= (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2660 (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412115))))

(assert (=> b!918469 (= lt!412115 (tuple2!12763 lt!412117 lt!412116))))

(declare-fun get!13841 (ValueCell!9251 V!30919) V!30919)

(declare-fun dynLambda!1416 (Int (_ BitVec 64)) V!30919)

(assert (=> b!918469 (= lt!412116 (get!13841 (select (arr!26395 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1416 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412114 () Unit!30932)

(declare-fun lemmaListMapRecursiveValidKeyArray!24 (array!54897 array!54899 (_ BitVec 32) (_ BitVec 32) V!30919 V!30919 (_ BitVec 32) Int) Unit!30932)

(assert (=> b!918469 (= lt!412114 (lemmaListMapRecursiveValidKeyArray!24 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918470 () Bool)

(assert (=> b!918470 (= e!515562 e!515561)))

(declare-fun res!619311 () Bool)

(assert (=> b!918470 (=> (not res!619311) (not e!515561))))

(assert (=> b!918470 (= res!619311 (contains!4741 lt!412118 k0!1099))))

(assert (=> b!918470 (= lt!412118 (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918471 () Bool)

(assert (=> b!918471 (= e!515559 tp_is_empty!19465)))

(declare-fun mapIsEmpty!30954 () Bool)

(assert (=> mapIsEmpty!30954 mapRes!30954))

(assert (= (and start!78726 res!619314) b!918459))

(assert (= (and b!918459 res!619315) b!918462))

(assert (= (and b!918462 res!619316) b!918460))

(assert (= (and b!918460 res!619318) b!918468))

(assert (= (and b!918468 res!619312) b!918470))

(assert (= (and b!918470 res!619311) b!918466))

(assert (= (and b!918466 res!619317) b!918463))

(assert (= (and b!918463 res!619319) b!918461))

(assert (= (and b!918461 res!619310) b!918464))

(assert (= (and b!918464 res!619313) b!918469))

(assert (= (and b!918465 condMapEmpty!30954) mapIsEmpty!30954))

(assert (= (and b!918465 (not condMapEmpty!30954)) mapNonEmpty!30954))

(get-info :version)

(assert (= (and mapNonEmpty!30954 ((_ is ValueCellFull!9251) mapValue!30954)) b!918471))

(assert (= (and b!918465 ((_ is ValueCellFull!9251) mapDefault!30954)) b!918467))

(assert (= start!78726 b!918465))

(declare-fun b_lambda!13441 () Bool)

(assert (=> (not b_lambda!13441) (not b!918469)))

(declare-fun t!26227 () Bool)

(declare-fun tb!5529 () Bool)

(assert (=> (and start!78726 (= defaultEntry!1235 defaultEntry!1235) t!26227) tb!5529))

(declare-fun result!10889 () Bool)

(assert (=> tb!5529 (= result!10889 tp_is_empty!19465)))

(assert (=> b!918469 t!26227))

(declare-fun b_and!27627 () Bool)

(assert (= b_and!27625 (and (=> t!26227 result!10889) b_and!27627)))

(declare-fun m!851629 () Bool)

(assert (=> b!918462 m!851629))

(declare-fun m!851631 () Bool)

(assert (=> b!918466 m!851631))

(declare-fun m!851633 () Bool)

(assert (=> start!78726 m!851633))

(declare-fun m!851635 () Bool)

(assert (=> start!78726 m!851635))

(declare-fun m!851637 () Bool)

(assert (=> start!78726 m!851637))

(declare-fun m!851639 () Bool)

(assert (=> b!918469 m!851639))

(declare-fun m!851641 () Bool)

(assert (=> b!918469 m!851641))

(declare-fun m!851643 () Bool)

(assert (=> b!918469 m!851643))

(declare-fun m!851645 () Bool)

(assert (=> b!918469 m!851645))

(declare-fun m!851647 () Bool)

(assert (=> b!918469 m!851647))

(declare-fun m!851649 () Bool)

(assert (=> b!918469 m!851649))

(assert (=> b!918469 m!851645))

(declare-fun m!851651 () Bool)

(assert (=> b!918469 m!851651))

(assert (=> b!918469 m!851649))

(assert (=> b!918469 m!851651))

(declare-fun m!851653 () Bool)

(assert (=> b!918469 m!851653))

(declare-fun m!851655 () Bool)

(assert (=> b!918469 m!851655))

(assert (=> b!918469 m!851641))

(declare-fun m!851657 () Bool)

(assert (=> b!918469 m!851657))

(declare-fun m!851659 () Bool)

(assert (=> b!918460 m!851659))

(declare-fun m!851661 () Bool)

(assert (=> b!918461 m!851661))

(declare-fun m!851663 () Bool)

(assert (=> b!918464 m!851663))

(declare-fun m!851665 () Bool)

(assert (=> b!918464 m!851665))

(declare-fun m!851667 () Bool)

(assert (=> mapNonEmpty!30954 m!851667))

(declare-fun m!851669 () Bool)

(assert (=> b!918470 m!851669))

(declare-fun m!851671 () Bool)

(assert (=> b!918470 m!851671))

(check-sat (not b!918469) (not b!918461) (not b_next!16957) b_and!27627 tp_is_empty!19465 (not b!918466) (not b!918460) (not b!918462) (not start!78726) (not mapNonEmpty!30954) (not b!918470) (not b_lambda!13441) (not b!918464))
(check-sat b_and!27627 (not b_next!16957))
