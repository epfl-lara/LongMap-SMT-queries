; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78906 () Bool)

(assert start!78906)

(declare-fun b_free!16951 () Bool)

(declare-fun b_next!16951 () Bool)

(assert (=> start!78906 (= b_free!16951 (not b_next!16951))))

(declare-fun tp!59295 () Bool)

(declare-fun b_and!27649 () Bool)

(assert (=> start!78906 (= tp!59295 b_and!27649)))

(declare-fun mapNonEmpty!30945 () Bool)

(declare-fun mapRes!30945 () Bool)

(declare-fun tp!59294 () Bool)

(declare-fun e!516229 () Bool)

(assert (=> mapNonEmpty!30945 (= mapRes!30945 (and tp!59294 e!516229))))

(declare-fun mapKey!30945 () (_ BitVec 32))

(declare-datatypes ((V!30911 0))(
  ( (V!30912 (val!9780 Int)) )
))
(declare-datatypes ((ValueCell!9248 0))(
  ( (ValueCellFull!9248 (v!12295 V!30911)) (EmptyCell!9248) )
))
(declare-datatypes ((array!54947 0))(
  ( (array!54948 (arr!26414 (Array (_ BitVec 32) ValueCell!9248)) (size!26874 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54947)

(declare-fun mapValue!30945 () ValueCell!9248)

(declare-fun mapRest!30945 () (Array (_ BitVec 32) ValueCell!9248))

(assert (=> mapNonEmpty!30945 (= (arr!26414 _values!1231) (store mapRest!30945 mapKey!30945 mapValue!30945))))

(declare-fun b!919478 () Bool)

(declare-fun res!619681 () Bool)

(declare-fun e!516226 () Bool)

(assert (=> b!919478 (=> (not res!619681) (not e!516226))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54949 0))(
  ( (array!54950 (arr!26415 (Array (_ BitVec 32) (_ BitVec 64))) (size!26875 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54949)

(assert (=> b!919478 (= res!619681 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26875 _keys!1487))))))

(declare-fun b!919479 () Bool)

(declare-fun res!619683 () Bool)

(declare-fun e!516230 () Bool)

(assert (=> b!919479 (=> (not res!619683) (not e!516230))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((tuple2!12678 0))(
  ( (tuple2!12679 (_1!6350 (_ BitVec 64)) (_2!6350 V!30911)) )
))
(declare-datatypes ((List!18498 0))(
  ( (Nil!18495) (Cons!18494 (h!19646 tuple2!12678) (t!26171 List!18498)) )
))
(declare-datatypes ((ListLongMap!11377 0))(
  ( (ListLongMap!11378 (toList!5704 List!18498)) )
))
(declare-fun lt!412659 () ListLongMap!11377)

(declare-fun v!791 () V!30911)

(declare-fun apply!579 (ListLongMap!11377 (_ BitVec 64)) V!30911)

(assert (=> b!919479 (= res!619683 (= (apply!579 lt!412659 k0!1099) v!791))))

(declare-fun b!919480 () Bool)

(declare-fun res!619674 () Bool)

(assert (=> b!919480 (=> (not res!619674) (not e!516230))))

(assert (=> b!919480 (= res!619674 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919481 () Bool)

(declare-fun e!516227 () Bool)

(assert (=> b!919481 (= e!516230 e!516227)))

(declare-fun res!619677 () Bool)

(assert (=> b!919481 (=> (not res!619677) (not e!516227))))

(declare-fun lt!412660 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919481 (= res!619677 (validKeyInArray!0 lt!412660))))

(assert (=> b!919481 (= lt!412660 (select (arr!26415 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919482 () Bool)

(declare-fun res!619680 () Bool)

(assert (=> b!919482 (=> (not res!619680) (not e!516226))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54949 (_ BitVec 32)) Bool)

(assert (=> b!919482 (= res!619680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!619675 () Bool)

(assert (=> start!78906 (=> (not res!619675) (not e!516226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78906 (= res!619675 (validMask!0 mask!1881))))

(assert (=> start!78906 e!516226))

(assert (=> start!78906 true))

(declare-fun tp_is_empty!19459 () Bool)

(assert (=> start!78906 tp_is_empty!19459))

(declare-fun e!516228 () Bool)

(declare-fun array_inv!20686 (array!54947) Bool)

(assert (=> start!78906 (and (array_inv!20686 _values!1231) e!516228)))

(assert (=> start!78906 tp!59295))

(declare-fun array_inv!20687 (array!54949) Bool)

(assert (=> start!78906 (array_inv!20687 _keys!1487)))

(declare-fun b!919483 () Bool)

(assert (=> b!919483 (= e!516226 e!516230)))

(declare-fun res!619682 () Bool)

(assert (=> b!919483 (=> (not res!619682) (not e!516230))))

(declare-fun contains!4758 (ListLongMap!11377 (_ BitVec 64)) Bool)

(assert (=> b!919483 (= res!619682 (contains!4758 lt!412659 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30911)

(declare-fun minValue!1173 () V!30911)

(declare-fun getCurrentListMap!2958 (array!54949 array!54947 (_ BitVec 32) (_ BitVec 32) V!30911 V!30911 (_ BitVec 32) Int) ListLongMap!11377)

(assert (=> b!919483 (= lt!412659 (getCurrentListMap!2958 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919484 () Bool)

(assert (=> b!919484 (= e!516229 tp_is_empty!19459)))

(declare-fun mapIsEmpty!30945 () Bool)

(assert (=> mapIsEmpty!30945 mapRes!30945))

(declare-fun b!919485 () Bool)

(declare-fun e!516232 () Bool)

(assert (=> b!919485 (= e!516228 (and e!516232 mapRes!30945))))

(declare-fun condMapEmpty!30945 () Bool)

(declare-fun mapDefault!30945 () ValueCell!9248)

(assert (=> b!919485 (= condMapEmpty!30945 (= (arr!26414 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9248)) mapDefault!30945)))))

(declare-fun b!919486 () Bool)

(assert (=> b!919486 (= e!516232 tp_is_empty!19459)))

(declare-fun b!919487 () Bool)

(declare-fun res!619679 () Bool)

(assert (=> b!919487 (=> (not res!619679) (not e!516230))))

(assert (=> b!919487 (= res!619679 (validKeyInArray!0 k0!1099))))

(declare-fun b!919488 () Bool)

(declare-fun res!619676 () Bool)

(assert (=> b!919488 (=> (not res!619676) (not e!516226))))

(declare-datatypes ((List!18499 0))(
  ( (Nil!18496) (Cons!18495 (h!19647 (_ BitVec 64)) (t!26172 List!18499)) )
))
(declare-fun arrayNoDuplicates!0 (array!54949 (_ BitVec 32) List!18499) Bool)

(assert (=> b!919488 (= res!619676 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18496))))

(declare-fun b!919489 () Bool)

(declare-fun res!619678 () Bool)

(assert (=> b!919489 (=> (not res!619678) (not e!516226))))

(assert (=> b!919489 (= res!619678 (and (= (size!26874 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26875 _keys!1487) (size!26874 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919490 () Bool)

(assert (=> b!919490 (= e!516227 (not true))))

(declare-fun lt!412657 () tuple2!12678)

(declare-fun +!2646 (ListLongMap!11377 tuple2!12678) ListLongMap!11377)

(assert (=> b!919490 (contains!4758 (+!2646 lt!412659 lt!412657) k0!1099)))

(declare-datatypes ((Unit!31004 0))(
  ( (Unit!31005) )
))
(declare-fun lt!412661 () Unit!31004)

(declare-fun lt!412658 () V!30911)

(declare-fun addStillContains!355 (ListLongMap!11377 (_ BitVec 64) V!30911 (_ BitVec 64)) Unit!31004)

(assert (=> b!919490 (= lt!412661 (addStillContains!355 lt!412659 lt!412660 lt!412658 k0!1099))))

(assert (=> b!919490 (= (getCurrentListMap!2958 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2646 (getCurrentListMap!2958 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412657))))

(assert (=> b!919490 (= lt!412657 (tuple2!12679 lt!412660 lt!412658))))

(declare-fun get!13865 (ValueCell!9248 V!30911) V!30911)

(declare-fun dynLambda!1443 (Int (_ BitVec 64)) V!30911)

(assert (=> b!919490 (= lt!412658 (get!13865 (select (arr!26414 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1443 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412656 () Unit!31004)

(declare-fun lemmaListMapRecursiveValidKeyArray!26 (array!54949 array!54947 (_ BitVec 32) (_ BitVec 32) V!30911 V!30911 (_ BitVec 32) Int) Unit!31004)

(assert (=> b!919490 (= lt!412656 (lemmaListMapRecursiveValidKeyArray!26 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78906 res!619675) b!919489))

(assert (= (and b!919489 res!619678) b!919482))

(assert (= (and b!919482 res!619680) b!919488))

(assert (= (and b!919488 res!619676) b!919478))

(assert (= (and b!919478 res!619681) b!919483))

(assert (= (and b!919483 res!619682) b!919479))

(assert (= (and b!919479 res!619683) b!919480))

(assert (= (and b!919480 res!619674) b!919487))

(assert (= (and b!919487 res!619679) b!919481))

(assert (= (and b!919481 res!619677) b!919490))

(assert (= (and b!919485 condMapEmpty!30945) mapIsEmpty!30945))

(assert (= (and b!919485 (not condMapEmpty!30945)) mapNonEmpty!30945))

(get-info :version)

(assert (= (and mapNonEmpty!30945 ((_ is ValueCellFull!9248) mapValue!30945)) b!919484))

(assert (= (and b!919485 ((_ is ValueCellFull!9248) mapDefault!30945)) b!919486))

(assert (= start!78906 b!919485))

(declare-fun b_lambda!13467 () Bool)

(assert (=> (not b_lambda!13467) (not b!919490)))

(declare-fun t!26170 () Bool)

(declare-fun tb!5523 () Bool)

(assert (=> (and start!78906 (= defaultEntry!1235 defaultEntry!1235) t!26170) tb!5523))

(declare-fun result!10877 () Bool)

(assert (=> tb!5523 (= result!10877 tp_is_empty!19459)))

(assert (=> b!919490 t!26170))

(declare-fun b_and!27651 () Bool)

(assert (= b_and!27649 (and (=> t!26170 result!10877) b_and!27651)))

(declare-fun m!853549 () Bool)

(assert (=> b!919488 m!853549))

(declare-fun m!853551 () Bool)

(assert (=> b!919479 m!853551))

(declare-fun m!853553 () Bool)

(assert (=> start!78906 m!853553))

(declare-fun m!853555 () Bool)

(assert (=> start!78906 m!853555))

(declare-fun m!853557 () Bool)

(assert (=> start!78906 m!853557))

(declare-fun m!853559 () Bool)

(assert (=> b!919483 m!853559))

(declare-fun m!853561 () Bool)

(assert (=> b!919483 m!853561))

(declare-fun m!853563 () Bool)

(assert (=> mapNonEmpty!30945 m!853563))

(declare-fun m!853565 () Bool)

(assert (=> b!919482 m!853565))

(declare-fun m!853567 () Bool)

(assert (=> b!919481 m!853567))

(declare-fun m!853569 () Bool)

(assert (=> b!919481 m!853569))

(declare-fun m!853571 () Bool)

(assert (=> b!919487 m!853571))

(declare-fun m!853573 () Bool)

(assert (=> b!919490 m!853573))

(declare-fun m!853575 () Bool)

(assert (=> b!919490 m!853575))

(declare-fun m!853577 () Bool)

(assert (=> b!919490 m!853577))

(declare-fun m!853579 () Bool)

(assert (=> b!919490 m!853579))

(assert (=> b!919490 m!853577))

(assert (=> b!919490 m!853579))

(declare-fun m!853581 () Bool)

(assert (=> b!919490 m!853581))

(declare-fun m!853583 () Bool)

(assert (=> b!919490 m!853583))

(declare-fun m!853585 () Bool)

(assert (=> b!919490 m!853585))

(declare-fun m!853587 () Bool)

(assert (=> b!919490 m!853587))

(declare-fun m!853589 () Bool)

(assert (=> b!919490 m!853589))

(declare-fun m!853591 () Bool)

(assert (=> b!919490 m!853591))

(assert (=> b!919490 m!853573))

(assert (=> b!919490 m!853587))

(check-sat (not b!919482) (not b!919481) (not mapNonEmpty!30945) (not b_next!16951) (not b_lambda!13467) (not b!919488) tp_is_empty!19459 (not b!919487) (not b!919483) (not start!78906) b_and!27651 (not b!919479) (not b!919490))
(check-sat b_and!27651 (not b_next!16951))
