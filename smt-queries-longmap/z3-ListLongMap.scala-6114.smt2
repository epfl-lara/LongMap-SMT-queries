; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78794 () Bool)

(assert start!78794)

(declare-fun b_free!17007 () Bool)

(declare-fun b_next!17007 () Bool)

(assert (=> start!78794 (= b_free!17007 (not b_next!17007))))

(declare-fun tp!59462 () Bool)

(declare-fun b_and!27751 () Bool)

(assert (=> start!78794 (= tp!59462 b_and!27751)))

(declare-fun b!919723 () Bool)

(declare-fun res!620172 () Bool)

(declare-fun e!516236 () Bool)

(assert (=> b!919723 (=> (not res!620172) (not e!516236))))

(declare-datatypes ((array!55012 0))(
  ( (array!55013 (arr!26451 (Array (_ BitVec 32) (_ BitVec 64))) (size!26910 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55012)

(declare-datatypes ((List!18552 0))(
  ( (Nil!18549) (Cons!18548 (h!19694 (_ BitVec 64)) (t!26289 List!18552)) )
))
(declare-fun arrayNoDuplicates!0 (array!55012 (_ BitVec 32) List!18552) Bool)

(assert (=> b!919723 (= res!620172 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18549))))

(declare-fun b!919724 () Bool)

(declare-fun e!516232 () Bool)

(declare-fun e!516235 () Bool)

(assert (=> b!919724 (= e!516232 e!516235)))

(declare-fun res!620177 () Bool)

(assert (=> b!919724 (=> (not res!620177) (not e!516235))))

(declare-fun lt!412853 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919724 (= res!620177 (validKeyInArray!0 lt!412853))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919724 (= lt!412853 (select (arr!26451 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!620174 () Bool)

(assert (=> start!78794 (=> (not res!620174) (not e!516236))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78794 (= res!620174 (validMask!0 mask!1881))))

(assert (=> start!78794 e!516236))

(assert (=> start!78794 true))

(declare-fun tp_is_empty!19515 () Bool)

(assert (=> start!78794 tp_is_empty!19515))

(declare-datatypes ((V!30985 0))(
  ( (V!30986 (val!9808 Int)) )
))
(declare-datatypes ((ValueCell!9276 0))(
  ( (ValueCellFull!9276 (v!12326 V!30985)) (EmptyCell!9276) )
))
(declare-datatypes ((array!55014 0))(
  ( (array!55015 (arr!26452 (Array (_ BitVec 32) ValueCell!9276)) (size!26911 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55014)

(declare-fun e!516234 () Bool)

(declare-fun array_inv!20618 (array!55014) Bool)

(assert (=> start!78794 (and (array_inv!20618 _values!1231) e!516234)))

(assert (=> start!78794 tp!59462))

(declare-fun array_inv!20619 (array!55012) Bool)

(assert (=> start!78794 (array_inv!20619 _keys!1487)))

(declare-fun mapIsEmpty!31029 () Bool)

(declare-fun mapRes!31029 () Bool)

(assert (=> mapIsEmpty!31029 mapRes!31029))

(declare-fun b!919725 () Bool)

(assert (=> b!919725 (= e!516236 e!516232)))

(declare-fun res!620178 () Bool)

(assert (=> b!919725 (=> (not res!620178) (not e!516232))))

(declare-datatypes ((tuple2!12748 0))(
  ( (tuple2!12749 (_1!6385 (_ BitVec 64)) (_2!6385 V!30985)) )
))
(declare-datatypes ((List!18553 0))(
  ( (Nil!18550) (Cons!18549 (h!19695 tuple2!12748) (t!26290 List!18553)) )
))
(declare-datatypes ((ListLongMap!11445 0))(
  ( (ListLongMap!11446 (toList!5738 List!18553)) )
))
(declare-fun lt!412849 () ListLongMap!11445)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4784 (ListLongMap!11445 (_ BitVec 64)) Bool)

(assert (=> b!919725 (= res!620178 (contains!4784 lt!412849 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30985)

(declare-fun minValue!1173 () V!30985)

(declare-fun getCurrentListMap!2994 (array!55012 array!55014 (_ BitVec 32) (_ BitVec 32) V!30985 V!30985 (_ BitVec 32) Int) ListLongMap!11445)

(assert (=> b!919725 (= lt!412849 (getCurrentListMap!2994 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919726 () Bool)

(assert (=> b!919726 (= e!516235 (not true))))

(assert (=> b!919726 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18549)))

(declare-datatypes ((Unit!31044 0))(
  ( (Unit!31045) )
))
(declare-fun lt!412852 () Unit!31044)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55012 (_ BitVec 32) (_ BitVec 32)) Unit!31044)

(assert (=> b!919726 (= lt!412852 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412855 () tuple2!12748)

(declare-fun +!2648 (ListLongMap!11445 tuple2!12748) ListLongMap!11445)

(assert (=> b!919726 (contains!4784 (+!2648 lt!412849 lt!412855) k0!1099)))

(declare-fun lt!412850 () V!30985)

(declare-fun lt!412851 () Unit!31044)

(declare-fun addStillContains!372 (ListLongMap!11445 (_ BitVec 64) V!30985 (_ BitVec 64)) Unit!31044)

(assert (=> b!919726 (= lt!412851 (addStillContains!372 lt!412849 lt!412853 lt!412850 k0!1099))))

(assert (=> b!919726 (= (getCurrentListMap!2994 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2648 (getCurrentListMap!2994 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412855))))

(assert (=> b!919726 (= lt!412855 (tuple2!12749 lt!412853 lt!412850))))

(declare-fun get!13873 (ValueCell!9276 V!30985) V!30985)

(declare-fun dynLambda!1437 (Int (_ BitVec 64)) V!30985)

(assert (=> b!919726 (= lt!412850 (get!13873 (select (arr!26452 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1437 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412854 () Unit!31044)

(declare-fun lemmaListMapRecursiveValidKeyArray!38 (array!55012 array!55014 (_ BitVec 32) (_ BitVec 32) V!30985 V!30985 (_ BitVec 32) Int) Unit!31044)

(assert (=> b!919726 (= lt!412854 (lemmaListMapRecursiveValidKeyArray!38 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919727 () Bool)

(declare-fun res!620171 () Bool)

(assert (=> b!919727 (=> (not res!620171) (not e!516232))))

(assert (=> b!919727 (= res!620171 (validKeyInArray!0 k0!1099))))

(declare-fun b!919728 () Bool)

(declare-fun res!620176 () Bool)

(assert (=> b!919728 (=> (not res!620176) (not e!516236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55012 (_ BitVec 32)) Bool)

(assert (=> b!919728 (= res!620176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919729 () Bool)

(declare-fun res!620175 () Bool)

(assert (=> b!919729 (=> (not res!620175) (not e!516232))))

(assert (=> b!919729 (= res!620175 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31029 () Bool)

(declare-fun tp!59461 () Bool)

(declare-fun e!516238 () Bool)

(assert (=> mapNonEmpty!31029 (= mapRes!31029 (and tp!59461 e!516238))))

(declare-fun mapRest!31029 () (Array (_ BitVec 32) ValueCell!9276))

(declare-fun mapValue!31029 () ValueCell!9276)

(declare-fun mapKey!31029 () (_ BitVec 32))

(assert (=> mapNonEmpty!31029 (= (arr!26452 _values!1231) (store mapRest!31029 mapKey!31029 mapValue!31029))))

(declare-fun b!919730 () Bool)

(assert (=> b!919730 (= e!516238 tp_is_empty!19515)))

(declare-fun b!919731 () Bool)

(declare-fun res!620179 () Bool)

(assert (=> b!919731 (=> (not res!620179) (not e!516236))))

(assert (=> b!919731 (= res!620179 (and (= (size!26911 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26910 _keys!1487) (size!26911 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919732 () Bool)

(declare-fun e!516233 () Bool)

(assert (=> b!919732 (= e!516234 (and e!516233 mapRes!31029))))

(declare-fun condMapEmpty!31029 () Bool)

(declare-fun mapDefault!31029 () ValueCell!9276)

(assert (=> b!919732 (= condMapEmpty!31029 (= (arr!26452 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9276)) mapDefault!31029)))))

(declare-fun b!919733 () Bool)

(declare-fun res!620173 () Bool)

(assert (=> b!919733 (=> (not res!620173) (not e!516232))))

(declare-fun v!791 () V!30985)

(declare-fun apply!581 (ListLongMap!11445 (_ BitVec 64)) V!30985)

(assert (=> b!919733 (= res!620173 (= (apply!581 lt!412849 k0!1099) v!791))))

(declare-fun b!919734 () Bool)

(declare-fun res!620170 () Bool)

(assert (=> b!919734 (=> (not res!620170) (not e!516236))))

(assert (=> b!919734 (= res!620170 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26910 _keys!1487))))))

(declare-fun b!919735 () Bool)

(assert (=> b!919735 (= e!516233 tp_is_empty!19515)))

(assert (= (and start!78794 res!620174) b!919731))

(assert (= (and b!919731 res!620179) b!919728))

(assert (= (and b!919728 res!620176) b!919723))

(assert (= (and b!919723 res!620172) b!919734))

(assert (= (and b!919734 res!620170) b!919725))

(assert (= (and b!919725 res!620178) b!919733))

(assert (= (and b!919733 res!620173) b!919729))

(assert (= (and b!919729 res!620175) b!919727))

(assert (= (and b!919727 res!620171) b!919724))

(assert (= (and b!919724 res!620177) b!919726))

(assert (= (and b!919732 condMapEmpty!31029) mapIsEmpty!31029))

(assert (= (and b!919732 (not condMapEmpty!31029)) mapNonEmpty!31029))

(get-info :version)

(assert (= (and mapNonEmpty!31029 ((_ is ValueCellFull!9276) mapValue!31029)) b!919730))

(assert (= (and b!919732 ((_ is ValueCellFull!9276) mapDefault!31029)) b!919735))

(assert (= start!78794 b!919732))

(declare-fun b_lambda!13509 () Bool)

(assert (=> (not b_lambda!13509) (not b!919726)))

(declare-fun t!26288 () Bool)

(declare-fun tb!5587 () Bool)

(assert (=> (and start!78794 (= defaultEntry!1235 defaultEntry!1235) t!26288) tb!5587))

(declare-fun result!10997 () Bool)

(assert (=> tb!5587 (= result!10997 tp_is_empty!19515)))

(assert (=> b!919726 t!26288))

(declare-fun b_and!27753 () Bool)

(assert (= b_and!27751 (and (=> t!26288 result!10997) b_and!27753)))

(declare-fun m!853551 () Bool)

(assert (=> b!919723 m!853551))

(declare-fun m!853553 () Bool)

(assert (=> b!919727 m!853553))

(declare-fun m!853555 () Bool)

(assert (=> b!919725 m!853555))

(declare-fun m!853557 () Bool)

(assert (=> b!919725 m!853557))

(declare-fun m!853559 () Bool)

(assert (=> start!78794 m!853559))

(declare-fun m!853561 () Bool)

(assert (=> start!78794 m!853561))

(declare-fun m!853563 () Bool)

(assert (=> start!78794 m!853563))

(declare-fun m!853565 () Bool)

(assert (=> b!919724 m!853565))

(declare-fun m!853567 () Bool)

(assert (=> b!919724 m!853567))

(declare-fun m!853569 () Bool)

(assert (=> mapNonEmpty!31029 m!853569))

(declare-fun m!853571 () Bool)

(assert (=> b!919733 m!853571))

(declare-fun m!853573 () Bool)

(assert (=> b!919726 m!853573))

(declare-fun m!853575 () Bool)

(assert (=> b!919726 m!853575))

(declare-fun m!853577 () Bool)

(assert (=> b!919726 m!853577))

(assert (=> b!919726 m!853573))

(assert (=> b!919726 m!853577))

(declare-fun m!853579 () Bool)

(assert (=> b!919726 m!853579))

(declare-fun m!853581 () Bool)

(assert (=> b!919726 m!853581))

(declare-fun m!853583 () Bool)

(assert (=> b!919726 m!853583))

(declare-fun m!853585 () Bool)

(assert (=> b!919726 m!853585))

(declare-fun m!853587 () Bool)

(assert (=> b!919726 m!853587))

(declare-fun m!853589 () Bool)

(assert (=> b!919726 m!853589))

(declare-fun m!853591 () Bool)

(assert (=> b!919726 m!853591))

(assert (=> b!919726 m!853583))

(declare-fun m!853593 () Bool)

(assert (=> b!919726 m!853593))

(assert (=> b!919726 m!853589))

(declare-fun m!853595 () Bool)

(assert (=> b!919726 m!853595))

(declare-fun m!853597 () Bool)

(assert (=> b!919728 m!853597))

(check-sat (not b!919728) (not b_lambda!13509) (not b_next!17007) (not b!919733) (not mapNonEmpty!31029) (not b!919723) tp_is_empty!19515 (not b!919724) (not b!919726) (not start!78794) (not b!919725) (not b!919727) b_and!27753)
(check-sat b_and!27753 (not b_next!17007))
