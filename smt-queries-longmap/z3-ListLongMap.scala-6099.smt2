; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78684 () Bool)

(assert start!78684)

(declare-fun b_free!16915 () Bool)

(declare-fun b_next!16915 () Bool)

(assert (=> start!78684 (= b_free!16915 (not b_next!16915))))

(declare-fun tp!59186 () Bool)

(declare-fun b_and!27541 () Bool)

(assert (=> start!78684 (= tp!59186 b_and!27541)))

(declare-fun b!917598 () Bool)

(declare-fun e!515122 () Bool)

(assert (=> b!917598 (= e!515122 (not true))))

(declare-datatypes ((array!54817 0))(
  ( (array!54818 (arr!26354 (Array (_ BitVec 32) (_ BitVec 64))) (size!26815 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54817)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!411866 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30863 0))(
  ( (V!30864 (val!9762 Int)) )
))
(declare-datatypes ((ValueCell!9230 0))(
  ( (ValueCellFull!9230 (v!12279 V!30863)) (EmptyCell!9230) )
))
(declare-datatypes ((array!54819 0))(
  ( (array!54820 (arr!26355 (Array (_ BitVec 32) ValueCell!9230)) (size!26816 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54819)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30863)

(declare-fun minValue!1173 () V!30863)

(declare-datatypes ((tuple2!12726 0))(
  ( (tuple2!12727 (_1!6374 (_ BitVec 64)) (_2!6374 V!30863)) )
))
(declare-datatypes ((List!18515 0))(
  ( (Nil!18512) (Cons!18511 (h!19657 tuple2!12726) (t!26151 List!18515)) )
))
(declare-datatypes ((ListLongMap!11413 0))(
  ( (ListLongMap!11414 (toList!5722 List!18515)) )
))
(declare-fun getCurrentListMap!2915 (array!54817 array!54819 (_ BitVec 32) (_ BitVec 32) V!30863 V!30863 (_ BitVec 32) Int) ListLongMap!11413)

(declare-fun +!2646 (ListLongMap!11413 tuple2!12726) ListLongMap!11413)

(declare-fun get!13813 (ValueCell!9230 V!30863) V!30863)

(declare-fun dynLambda!1402 (Int (_ BitVec 64)) V!30863)

(assert (=> b!917598 (= (getCurrentListMap!2915 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2646 (getCurrentListMap!2915 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12727 lt!411866 (get!13813 (select (arr!26355 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1402 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30904 0))(
  ( (Unit!30905) )
))
(declare-fun lt!411864 () Unit!30904)

(declare-fun lemmaListMapRecursiveValidKeyArray!10 (array!54817 array!54819 (_ BitVec 32) (_ BitVec 32) V!30863 V!30863 (_ BitVec 32) Int) Unit!30904)

(assert (=> b!917598 (= lt!411864 (lemmaListMapRecursiveValidKeyArray!10 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!618687 () Bool)

(declare-fun e!515124 () Bool)

(assert (=> start!78684 (=> (not res!618687) (not e!515124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78684 (= res!618687 (validMask!0 mask!1881))))

(assert (=> start!78684 e!515124))

(assert (=> start!78684 true))

(declare-fun tp_is_empty!19423 () Bool)

(assert (=> start!78684 tp_is_empty!19423))

(declare-fun e!515123 () Bool)

(declare-fun array_inv!20628 (array!54819) Bool)

(assert (=> start!78684 (and (array_inv!20628 _values!1231) e!515123)))

(assert (=> start!78684 tp!59186))

(declare-fun array_inv!20629 (array!54817) Bool)

(assert (=> start!78684 (array_inv!20629 _keys!1487)))

(declare-fun b!917599 () Bool)

(declare-fun e!515119 () Bool)

(assert (=> b!917599 (= e!515124 e!515119)))

(declare-fun res!618680 () Bool)

(assert (=> b!917599 (=> (not res!618680) (not e!515119))))

(declare-fun lt!411865 () ListLongMap!11413)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4724 (ListLongMap!11413 (_ BitVec 64)) Bool)

(assert (=> b!917599 (= res!618680 (contains!4724 lt!411865 k0!1099))))

(assert (=> b!917599 (= lt!411865 (getCurrentListMap!2915 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917600 () Bool)

(declare-fun e!515118 () Bool)

(declare-fun mapRes!30891 () Bool)

(assert (=> b!917600 (= e!515123 (and e!515118 mapRes!30891))))

(declare-fun condMapEmpty!30891 () Bool)

(declare-fun mapDefault!30891 () ValueCell!9230)

(assert (=> b!917600 (= condMapEmpty!30891 (= (arr!26355 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9230)) mapDefault!30891)))))

(declare-fun mapIsEmpty!30891 () Bool)

(assert (=> mapIsEmpty!30891 mapRes!30891))

(declare-fun b!917601 () Bool)

(declare-fun res!618683 () Bool)

(assert (=> b!917601 (=> (not res!618683) (not e!515124))))

(assert (=> b!917601 (= res!618683 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26815 _keys!1487))))))

(declare-fun b!917602 () Bool)

(assert (=> b!917602 (= e!515119 e!515122)))

(declare-fun res!618686 () Bool)

(assert (=> b!917602 (=> (not res!618686) (not e!515122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917602 (= res!618686 (validKeyInArray!0 lt!411866))))

(assert (=> b!917602 (= lt!411866 (select (arr!26354 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917603 () Bool)

(declare-fun res!618684 () Bool)

(assert (=> b!917603 (=> (not res!618684) (not e!515124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54817 (_ BitVec 32)) Bool)

(assert (=> b!917603 (= res!618684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917604 () Bool)

(declare-fun res!618685 () Bool)

(assert (=> b!917604 (=> (not res!618685) (not e!515119))))

(declare-fun v!791 () V!30863)

(declare-fun apply!559 (ListLongMap!11413 (_ BitVec 64)) V!30863)

(assert (=> b!917604 (= res!618685 (= (apply!559 lt!411865 k0!1099) v!791))))

(declare-fun b!917605 () Bool)

(assert (=> b!917605 (= e!515118 tp_is_empty!19423)))

(declare-fun b!917606 () Bool)

(declare-fun res!618681 () Bool)

(assert (=> b!917606 (=> (not res!618681) (not e!515119))))

(assert (=> b!917606 (= res!618681 (validKeyInArray!0 k0!1099))))

(declare-fun b!917607 () Bool)

(declare-fun res!618682 () Bool)

(assert (=> b!917607 (=> (not res!618682) (not e!515124))))

(assert (=> b!917607 (= res!618682 (and (= (size!26816 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26815 _keys!1487) (size!26816 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917608 () Bool)

(declare-fun e!515120 () Bool)

(assert (=> b!917608 (= e!515120 tp_is_empty!19423)))

(declare-fun b!917609 () Bool)

(declare-fun res!618689 () Bool)

(assert (=> b!917609 (=> (not res!618689) (not e!515124))))

(declare-datatypes ((List!18516 0))(
  ( (Nil!18513) (Cons!18512 (h!19658 (_ BitVec 64)) (t!26152 List!18516)) )
))
(declare-fun arrayNoDuplicates!0 (array!54817 (_ BitVec 32) List!18516) Bool)

(assert (=> b!917609 (= res!618689 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18513))))

(declare-fun b!917610 () Bool)

(declare-fun res!618688 () Bool)

(assert (=> b!917610 (=> (not res!618688) (not e!515119))))

(assert (=> b!917610 (= res!618688 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!30891 () Bool)

(declare-fun tp!59187 () Bool)

(assert (=> mapNonEmpty!30891 (= mapRes!30891 (and tp!59187 e!515120))))

(declare-fun mapValue!30891 () ValueCell!9230)

(declare-fun mapKey!30891 () (_ BitVec 32))

(declare-fun mapRest!30891 () (Array (_ BitVec 32) ValueCell!9230))

(assert (=> mapNonEmpty!30891 (= (arr!26355 _values!1231) (store mapRest!30891 mapKey!30891 mapValue!30891))))

(assert (= (and start!78684 res!618687) b!917607))

(assert (= (and b!917607 res!618682) b!917603))

(assert (= (and b!917603 res!618684) b!917609))

(assert (= (and b!917609 res!618689) b!917601))

(assert (= (and b!917601 res!618683) b!917599))

(assert (= (and b!917599 res!618680) b!917604))

(assert (= (and b!917604 res!618685) b!917610))

(assert (= (and b!917610 res!618688) b!917606))

(assert (= (and b!917606 res!618681) b!917602))

(assert (= (and b!917602 res!618686) b!917598))

(assert (= (and b!917600 condMapEmpty!30891) mapIsEmpty!30891))

(assert (= (and b!917600 (not condMapEmpty!30891)) mapNonEmpty!30891))

(get-info :version)

(assert (= (and mapNonEmpty!30891 ((_ is ValueCellFull!9230) mapValue!30891)) b!917608))

(assert (= (and b!917600 ((_ is ValueCellFull!9230) mapDefault!30891)) b!917605))

(assert (= start!78684 b!917600))

(declare-fun b_lambda!13399 () Bool)

(assert (=> (not b_lambda!13399) (not b!917598)))

(declare-fun t!26150 () Bool)

(declare-fun tb!5487 () Bool)

(assert (=> (and start!78684 (= defaultEntry!1235 defaultEntry!1235) t!26150) tb!5487))

(declare-fun result!10805 () Bool)

(assert (=> tb!5487 (= result!10805 tp_is_empty!19423)))

(assert (=> b!917598 t!26150))

(declare-fun b_and!27543 () Bool)

(assert (= b_and!27541 (and (=> t!26150 result!10805) b_and!27543)))

(declare-fun m!850795 () Bool)

(assert (=> start!78684 m!850795))

(declare-fun m!850797 () Bool)

(assert (=> start!78684 m!850797))

(declare-fun m!850799 () Bool)

(assert (=> start!78684 m!850799))

(declare-fun m!850801 () Bool)

(assert (=> b!917599 m!850801))

(declare-fun m!850803 () Bool)

(assert (=> b!917599 m!850803))

(declare-fun m!850805 () Bool)

(assert (=> b!917602 m!850805))

(declare-fun m!850807 () Bool)

(assert (=> b!917602 m!850807))

(declare-fun m!850809 () Bool)

(assert (=> mapNonEmpty!30891 m!850809))

(declare-fun m!850811 () Bool)

(assert (=> b!917603 m!850811))

(declare-fun m!850813 () Bool)

(assert (=> b!917604 m!850813))

(declare-fun m!850815 () Bool)

(assert (=> b!917609 m!850815))

(declare-fun m!850817 () Bool)

(assert (=> b!917606 m!850817))

(declare-fun m!850819 () Bool)

(assert (=> b!917598 m!850819))

(declare-fun m!850821 () Bool)

(assert (=> b!917598 m!850821))

(assert (=> b!917598 m!850819))

(assert (=> b!917598 m!850821))

(declare-fun m!850823 () Bool)

(assert (=> b!917598 m!850823))

(declare-fun m!850825 () Bool)

(assert (=> b!917598 m!850825))

(declare-fun m!850827 () Bool)

(assert (=> b!917598 m!850827))

(assert (=> b!917598 m!850827))

(declare-fun m!850829 () Bool)

(assert (=> b!917598 m!850829))

(declare-fun m!850831 () Bool)

(assert (=> b!917598 m!850831))

(check-sat b_and!27543 (not b!917602) tp_is_empty!19423 (not b_next!16915) (not b!917603) (not b!917609) (not b!917598) (not b_lambda!13399) (not start!78684) (not mapNonEmpty!30891) (not b!917606) (not b!917604) (not b!917599))
(check-sat b_and!27543 (not b_next!16915))
