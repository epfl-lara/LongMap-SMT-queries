; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78790 () Bool)

(assert start!78790)

(declare-fun b_free!17003 () Bool)

(declare-fun b_next!17003 () Bool)

(assert (=> start!78790 (= b_free!17003 (not b_next!17003))))

(declare-fun tp!59449 () Bool)

(declare-fun b_and!27743 () Bool)

(assert (=> start!78790 (= tp!59449 b_and!27743)))

(declare-fun b!919642 () Bool)

(declare-fun e!516191 () Bool)

(declare-fun e!516192 () Bool)

(assert (=> b!919642 (= e!516191 e!516192)))

(declare-fun res!620114 () Bool)

(assert (=> b!919642 (=> (not res!620114) (not e!516192))))

(declare-fun lt!412811 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919642 (= res!620114 (validKeyInArray!0 lt!412811))))

(declare-datatypes ((array!55006 0))(
  ( (array!55007 (arr!26448 (Array (_ BitVec 32) (_ BitVec 64))) (size!26907 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55006)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919642 (= lt!412811 (select (arr!26448 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919643 () Bool)

(declare-fun res!620118 () Bool)

(assert (=> b!919643 (=> (not res!620118) (not e!516191))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!919643 (= res!620118 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31023 () Bool)

(declare-fun mapRes!31023 () Bool)

(declare-fun tp!59450 () Bool)

(declare-fun e!516196 () Bool)

(assert (=> mapNonEmpty!31023 (= mapRes!31023 (and tp!59450 e!516196))))

(declare-datatypes ((V!30979 0))(
  ( (V!30980 (val!9806 Int)) )
))
(declare-datatypes ((ValueCell!9274 0))(
  ( (ValueCellFull!9274 (v!12324 V!30979)) (EmptyCell!9274) )
))
(declare-fun mapValue!31023 () ValueCell!9274)

(declare-fun mapRest!31023 () (Array (_ BitVec 32) ValueCell!9274))

(declare-datatypes ((array!55008 0))(
  ( (array!55009 (arr!26449 (Array (_ BitVec 32) ValueCell!9274)) (size!26908 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55008)

(declare-fun mapKey!31023 () (_ BitVec 32))

(assert (=> mapNonEmpty!31023 (= (arr!26449 _values!1231) (store mapRest!31023 mapKey!31023 mapValue!31023))))

(declare-fun b!919644 () Bool)

(assert (=> b!919644 (= e!516192 (not true))))

(declare-datatypes ((List!18550 0))(
  ( (Nil!18547) (Cons!18546 (h!19692 (_ BitVec 64)) (t!26283 List!18550)) )
))
(declare-fun arrayNoDuplicates!0 (array!55006 (_ BitVec 32) List!18550) Bool)

(assert (=> b!919644 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18547)))

(declare-datatypes ((Unit!31042 0))(
  ( (Unit!31043) )
))
(declare-fun lt!412813 () Unit!31042)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55006 (_ BitVec 32) (_ BitVec 32)) Unit!31042)

(assert (=> b!919644 (= lt!412813 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12746 0))(
  ( (tuple2!12747 (_1!6384 (_ BitVec 64)) (_2!6384 V!30979)) )
))
(declare-datatypes ((List!18551 0))(
  ( (Nil!18548) (Cons!18547 (h!19693 tuple2!12746) (t!26284 List!18551)) )
))
(declare-datatypes ((ListLongMap!11443 0))(
  ( (ListLongMap!11444 (toList!5737 List!18551)) )
))
(declare-fun lt!412812 () ListLongMap!11443)

(declare-fun lt!412808 () tuple2!12746)

(declare-fun contains!4783 (ListLongMap!11443 (_ BitVec 64)) Bool)

(declare-fun +!2647 (ListLongMap!11443 tuple2!12746) ListLongMap!11443)

(assert (=> b!919644 (contains!4783 (+!2647 lt!412812 lt!412808) k!1099)))

(declare-fun lt!412810 () Unit!31042)

(declare-fun lt!412809 () V!30979)

(declare-fun addStillContains!371 (ListLongMap!11443 (_ BitVec 64) V!30979 (_ BitVec 64)) Unit!31042)

(assert (=> b!919644 (= lt!412810 (addStillContains!371 lt!412812 lt!412811 lt!412809 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30979)

(declare-fun minValue!1173 () V!30979)

(declare-fun getCurrentListMap!2993 (array!55006 array!55008 (_ BitVec 32) (_ BitVec 32) V!30979 V!30979 (_ BitVec 32) Int) ListLongMap!11443)

(assert (=> b!919644 (= (getCurrentListMap!2993 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2647 (getCurrentListMap!2993 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412808))))

(assert (=> b!919644 (= lt!412808 (tuple2!12747 lt!412811 lt!412809))))

(declare-fun get!13870 (ValueCell!9274 V!30979) V!30979)

(declare-fun dynLambda!1436 (Int (_ BitVec 64)) V!30979)

(assert (=> b!919644 (= lt!412809 (get!13870 (select (arr!26449 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1436 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412807 () Unit!31042)

(declare-fun lemmaListMapRecursiveValidKeyArray!37 (array!55006 array!55008 (_ BitVec 32) (_ BitVec 32) V!30979 V!30979 (_ BitVec 32) Int) Unit!31042)

(assert (=> b!919644 (= lt!412807 (lemmaListMapRecursiveValidKeyArray!37 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919645 () Bool)

(declare-fun res!620113 () Bool)

(declare-fun e!516193 () Bool)

(assert (=> b!919645 (=> (not res!620113) (not e!516193))))

(assert (=> b!919645 (= res!620113 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26907 _keys!1487))))))

(declare-fun b!919646 () Bool)

(declare-fun res!620115 () Bool)

(assert (=> b!919646 (=> (not res!620115) (not e!516193))))

(assert (=> b!919646 (= res!620115 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18547))))

(declare-fun b!919647 () Bool)

(declare-fun res!620117 () Bool)

(assert (=> b!919647 (=> (not res!620117) (not e!516193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55006 (_ BitVec 32)) Bool)

(assert (=> b!919647 (= res!620117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!620116 () Bool)

(assert (=> start!78790 (=> (not res!620116) (not e!516193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78790 (= res!620116 (validMask!0 mask!1881))))

(assert (=> start!78790 e!516193))

(assert (=> start!78790 true))

(declare-fun tp_is_empty!19511 () Bool)

(assert (=> start!78790 tp_is_empty!19511))

(declare-fun e!516194 () Bool)

(declare-fun array_inv!20616 (array!55008) Bool)

(assert (=> start!78790 (and (array_inv!20616 _values!1231) e!516194)))

(assert (=> start!78790 tp!59449))

(declare-fun array_inv!20617 (array!55006) Bool)

(assert (=> start!78790 (array_inv!20617 _keys!1487)))

(declare-fun b!919641 () Bool)

(assert (=> b!919641 (= e!516196 tp_is_empty!19511)))

(declare-fun b!919648 () Bool)

(declare-fun e!516190 () Bool)

(assert (=> b!919648 (= e!516190 tp_is_empty!19511)))

(declare-fun b!919649 () Bool)

(declare-fun res!620119 () Bool)

(assert (=> b!919649 (=> (not res!620119) (not e!516191))))

(declare-fun v!791 () V!30979)

(declare-fun apply!580 (ListLongMap!11443 (_ BitVec 64)) V!30979)

(assert (=> b!919649 (= res!620119 (= (apply!580 lt!412812 k!1099) v!791))))

(declare-fun mapIsEmpty!31023 () Bool)

(assert (=> mapIsEmpty!31023 mapRes!31023))

(declare-fun b!919650 () Bool)

(declare-fun res!620111 () Bool)

(assert (=> b!919650 (=> (not res!620111) (not e!516193))))

(assert (=> b!919650 (= res!620111 (and (= (size!26908 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26907 _keys!1487) (size!26908 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919651 () Bool)

(assert (=> b!919651 (= e!516194 (and e!516190 mapRes!31023))))

(declare-fun condMapEmpty!31023 () Bool)

(declare-fun mapDefault!31023 () ValueCell!9274)

