; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78704 () Bool)

(assert start!78704)

(declare-fun b_free!16917 () Bool)

(declare-fun b_next!16917 () Bool)

(assert (=> start!78704 (= b_free!16917 (not b_next!16917))))

(declare-fun tp!59191 () Bool)

(declare-fun b_and!27571 () Bool)

(assert (=> start!78704 (= tp!59191 b_and!27571)))

(declare-fun b!917878 () Bool)

(declare-fun e!515290 () Bool)

(declare-fun tp_is_empty!19425 () Bool)

(assert (=> b!917878 (= e!515290 tp_is_empty!19425)))

(declare-fun b!917879 () Bool)

(declare-fun res!618825 () Bool)

(declare-fun e!515289 () Bool)

(assert (=> b!917879 (=> (not res!618825) (not e!515289))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54834 0))(
  ( (array!54835 (arr!26362 (Array (_ BitVec 32) (_ BitVec 64))) (size!26821 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54834)

(assert (=> b!917879 (= res!618825 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26821 _keys!1487))))))

(declare-fun b!917880 () Bool)

(declare-fun e!515287 () Bool)

(declare-fun e!515293 () Bool)

(assert (=> b!917880 (= e!515287 e!515293)))

(declare-fun res!618826 () Bool)

(assert (=> b!917880 (=> (not res!618826) (not e!515293))))

(declare-fun lt!412109 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917880 (= res!618826 (validKeyInArray!0 lt!412109))))

(assert (=> b!917880 (= lt!412109 (select (arr!26362 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917881 () Bool)

(declare-fun res!618829 () Bool)

(assert (=> b!917881 (=> (not res!618829) (not e!515287))))

(assert (=> b!917881 (= res!618829 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!30894 () Bool)

(declare-fun mapRes!30894 () Bool)

(assert (=> mapIsEmpty!30894 mapRes!30894))

(declare-fun res!618828 () Bool)

(assert (=> start!78704 (=> (not res!618828) (not e!515289))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78704 (= res!618828 (validMask!0 mask!1881))))

(assert (=> start!78704 e!515289))

(assert (=> start!78704 true))

(assert (=> start!78704 tp_is_empty!19425))

(declare-datatypes ((V!30865 0))(
  ( (V!30866 (val!9763 Int)) )
))
(declare-datatypes ((ValueCell!9231 0))(
  ( (ValueCellFull!9231 (v!12281 V!30865)) (EmptyCell!9231) )
))
(declare-datatypes ((array!54836 0))(
  ( (array!54837 (arr!26363 (Array (_ BitVec 32) ValueCell!9231)) (size!26822 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54836)

(declare-fun e!515292 () Bool)

(declare-fun array_inv!20556 (array!54836) Bool)

(assert (=> start!78704 (and (array_inv!20556 _values!1231) e!515292)))

(assert (=> start!78704 tp!59191))

(declare-fun array_inv!20557 (array!54834) Bool)

(assert (=> start!78704 (array_inv!20557 _keys!1487)))

(declare-fun b!917882 () Bool)

(declare-fun res!618822 () Bool)

(assert (=> b!917882 (=> (not res!618822) (not e!515289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54834 (_ BitVec 32)) Bool)

(assert (=> b!917882 (= res!618822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917883 () Bool)

(declare-fun res!618827 () Bool)

(assert (=> b!917883 (=> (not res!618827) (not e!515289))))

(declare-datatypes ((List!18490 0))(
  ( (Nil!18487) (Cons!18486 (h!19632 (_ BitVec 64)) (t!26137 List!18490)) )
))
(declare-fun arrayNoDuplicates!0 (array!54834 (_ BitVec 32) List!18490) Bool)

(assert (=> b!917883 (= res!618827 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18487))))

(declare-fun b!917884 () Bool)

(declare-fun res!618821 () Bool)

(assert (=> b!917884 (=> (not res!618821) (not e!515287))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30865)

(declare-datatypes ((tuple2!12682 0))(
  ( (tuple2!12683 (_1!6352 (_ BitVec 64)) (_2!6352 V!30865)) )
))
(declare-datatypes ((List!18491 0))(
  ( (Nil!18488) (Cons!18487 (h!19633 tuple2!12682) (t!26138 List!18491)) )
))
(declare-datatypes ((ListLongMap!11379 0))(
  ( (ListLongMap!11380 (toList!5705 List!18491)) )
))
(declare-fun lt!412110 () ListLongMap!11379)

(declare-fun apply!556 (ListLongMap!11379 (_ BitVec 64)) V!30865)

(assert (=> b!917884 (= res!618821 (= (apply!556 lt!412110 k0!1099) v!791))))

(declare-fun mapNonEmpty!30894 () Bool)

(declare-fun tp!59192 () Bool)

(declare-fun e!515291 () Bool)

(assert (=> mapNonEmpty!30894 (= mapRes!30894 (and tp!59192 e!515291))))

(declare-fun mapKey!30894 () (_ BitVec 32))

(declare-fun mapValue!30894 () ValueCell!9231)

(declare-fun mapRest!30894 () (Array (_ BitVec 32) ValueCell!9231))

(assert (=> mapNonEmpty!30894 (= (arr!26363 _values!1231) (store mapRest!30894 mapKey!30894 mapValue!30894))))

(declare-fun b!917885 () Bool)

(declare-fun res!618824 () Bool)

(assert (=> b!917885 (=> (not res!618824) (not e!515289))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917885 (= res!618824 (and (= (size!26822 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26821 _keys!1487) (size!26822 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917886 () Bool)

(assert (=> b!917886 (= e!515292 (and e!515290 mapRes!30894))))

(declare-fun condMapEmpty!30894 () Bool)

(declare-fun mapDefault!30894 () ValueCell!9231)

(assert (=> b!917886 (= condMapEmpty!30894 (= (arr!26363 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9231)) mapDefault!30894)))))

(declare-fun b!917887 () Bool)

(assert (=> b!917887 (= e!515293 (not true))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30865)

(declare-fun minValue!1173 () V!30865)

(declare-fun getCurrentListMap!2963 (array!54834 array!54836 (_ BitVec 32) (_ BitVec 32) V!30865 V!30865 (_ BitVec 32) Int) ListLongMap!11379)

(declare-fun +!2619 (ListLongMap!11379 tuple2!12682) ListLongMap!11379)

(declare-fun get!13814 (ValueCell!9231 V!30865) V!30865)

(declare-fun dynLambda!1408 (Int (_ BitVec 64)) V!30865)

(assert (=> b!917887 (= (getCurrentListMap!2963 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2619 (getCurrentListMap!2963 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12683 lt!412109 (get!13814 (select (arr!26363 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1408 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30986 0))(
  ( (Unit!30987) )
))
(declare-fun lt!412111 () Unit!30986)

(declare-fun lemmaListMapRecursiveValidKeyArray!9 (array!54834 array!54836 (_ BitVec 32) (_ BitVec 32) V!30865 V!30865 (_ BitVec 32) Int) Unit!30986)

(assert (=> b!917887 (= lt!412111 (lemmaListMapRecursiveValidKeyArray!9 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917888 () Bool)

(assert (=> b!917888 (= e!515289 e!515287)))

(declare-fun res!618823 () Bool)

(assert (=> b!917888 (=> (not res!618823) (not e!515287))))

(declare-fun contains!4756 (ListLongMap!11379 (_ BitVec 64)) Bool)

(assert (=> b!917888 (= res!618823 (contains!4756 lt!412110 k0!1099))))

(assert (=> b!917888 (= lt!412110 (getCurrentListMap!2963 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917889 () Bool)

(assert (=> b!917889 (= e!515291 tp_is_empty!19425)))

(declare-fun b!917890 () Bool)

(declare-fun res!618820 () Bool)

(assert (=> b!917890 (=> (not res!618820) (not e!515287))))

(assert (=> b!917890 (= res!618820 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78704 res!618828) b!917885))

(assert (= (and b!917885 res!618824) b!917882))

(assert (= (and b!917882 res!618822) b!917883))

(assert (= (and b!917883 res!618827) b!917879))

(assert (= (and b!917879 res!618825) b!917888))

(assert (= (and b!917888 res!618823) b!917884))

(assert (= (and b!917884 res!618821) b!917881))

(assert (= (and b!917881 res!618829) b!917890))

(assert (= (and b!917890 res!618820) b!917880))

(assert (= (and b!917880 res!618826) b!917887))

(assert (= (and b!917886 condMapEmpty!30894) mapIsEmpty!30894))

(assert (= (and b!917886 (not condMapEmpty!30894)) mapNonEmpty!30894))

(get-info :version)

(assert (= (and mapNonEmpty!30894 ((_ is ValueCellFull!9231) mapValue!30894)) b!917889))

(assert (= (and b!917886 ((_ is ValueCellFull!9231) mapDefault!30894)) b!917878))

(assert (= start!78704 b!917886))

(declare-fun b_lambda!13419 () Bool)

(assert (=> (not b_lambda!13419) (not b!917887)))

(declare-fun t!26136 () Bool)

(declare-fun tb!5497 () Bool)

(assert (=> (and start!78704 (= defaultEntry!1235 defaultEntry!1235) t!26136) tb!5497))

(declare-fun result!10817 () Bool)

(assert (=> tb!5497 (= result!10817 tp_is_empty!19425)))

(assert (=> b!917887 t!26136))

(declare-fun b_and!27573 () Bool)

(assert (= b_and!27571 (and (=> t!26136 result!10817) b_and!27573)))

(declare-fun m!851591 () Bool)

(assert (=> b!917880 m!851591))

(declare-fun m!851593 () Bool)

(assert (=> b!917880 m!851593))

(declare-fun m!851595 () Bool)

(assert (=> b!917884 m!851595))

(declare-fun m!851597 () Bool)

(assert (=> mapNonEmpty!30894 m!851597))

(declare-fun m!851599 () Bool)

(assert (=> b!917883 m!851599))

(declare-fun m!851601 () Bool)

(assert (=> b!917888 m!851601))

(declare-fun m!851603 () Bool)

(assert (=> b!917888 m!851603))

(declare-fun m!851605 () Bool)

(assert (=> b!917890 m!851605))

(declare-fun m!851607 () Bool)

(assert (=> b!917887 m!851607))

(declare-fun m!851609 () Bool)

(assert (=> b!917887 m!851609))

(declare-fun m!851611 () Bool)

(assert (=> b!917887 m!851611))

(declare-fun m!851613 () Bool)

(assert (=> b!917887 m!851613))

(assert (=> b!917887 m!851607))

(assert (=> b!917887 m!851609))

(declare-fun m!851615 () Bool)

(assert (=> b!917887 m!851615))

(declare-fun m!851617 () Bool)

(assert (=> b!917887 m!851617))

(assert (=> b!917887 m!851611))

(declare-fun m!851619 () Bool)

(assert (=> b!917887 m!851619))

(declare-fun m!851621 () Bool)

(assert (=> start!78704 m!851621))

(declare-fun m!851623 () Bool)

(assert (=> start!78704 m!851623))

(declare-fun m!851625 () Bool)

(assert (=> start!78704 m!851625))

(declare-fun m!851627 () Bool)

(assert (=> b!917882 m!851627))

(check-sat (not b!917887) (not b!917888) (not b!917884) (not mapNonEmpty!30894) (not b_lambda!13419) (not b!917883) (not b_next!16917) (not b!917882) tp_is_empty!19425 (not b!917880) b_and!27573 (not start!78704) (not b!917890))
(check-sat b_and!27573 (not b_next!16917))
