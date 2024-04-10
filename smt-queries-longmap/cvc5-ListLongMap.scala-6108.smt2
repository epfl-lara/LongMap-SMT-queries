; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78756 () Bool)

(assert start!78756)

(declare-fun b_free!16969 () Bool)

(declare-fun b_next!16969 () Bool)

(assert (=> start!78756 (= b_free!16969 (not b_next!16969))))

(declare-fun tp!59347 () Bool)

(declare-fun b_and!27675 () Bool)

(assert (=> start!78756 (= tp!59347 b_and!27675)))

(declare-fun b!918944 () Bool)

(declare-fun e!515836 () Bool)

(declare-fun tp_is_empty!19477 () Bool)

(assert (=> b!918944 (= e!515836 tp_is_empty!19477)))

(declare-fun b!918945 () Bool)

(declare-fun res!619605 () Bool)

(declare-fun e!515833 () Bool)

(assert (=> b!918945 (=> (not res!619605) (not e!515833))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54938 0))(
  ( (array!54939 (arr!26414 (Array (_ BitVec 32) (_ BitVec 64))) (size!26873 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54938)

(assert (=> b!918945 (= res!619605 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26873 _keys!1487))))))

(declare-fun b!918946 () Bool)

(declare-fun res!619602 () Bool)

(assert (=> b!918946 (=> (not res!619602) (not e!515833))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54938 (_ BitVec 32)) Bool)

(assert (=> b!918946 (= res!619602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918947 () Bool)

(declare-fun res!619607 () Bool)

(declare-fun e!515839 () Bool)

(assert (=> b!918947 (=> (not res!619607) (not e!515839))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!30935 0))(
  ( (V!30936 (val!9789 Int)) )
))
(declare-fun v!791 () V!30935)

(declare-datatypes ((tuple2!12724 0))(
  ( (tuple2!12725 (_1!6373 (_ BitVec 64)) (_2!6373 V!30935)) )
))
(declare-datatypes ((List!18528 0))(
  ( (Nil!18525) (Cons!18524 (h!19670 tuple2!12724) (t!26227 List!18528)) )
))
(declare-datatypes ((ListLongMap!11421 0))(
  ( (ListLongMap!11422 (toList!5726 List!18528)) )
))
(declare-fun lt!412457 () ListLongMap!11421)

(declare-fun apply!572 (ListLongMap!11421 (_ BitVec 64)) V!30935)

(assert (=> b!918947 (= res!619607 (= (apply!572 lt!412457 k!1099) v!791))))

(declare-fun b!918948 () Bool)

(assert (=> b!918948 (= e!515833 e!515839)))

(declare-fun res!619606 () Bool)

(assert (=> b!918948 (=> (not res!619606) (not e!515839))))

(declare-fun contains!4772 (ListLongMap!11421 (_ BitVec 64)) Bool)

(assert (=> b!918948 (= res!619606 (contains!4772 lt!412457 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9257 0))(
  ( (ValueCellFull!9257 (v!12307 V!30935)) (EmptyCell!9257) )
))
(declare-datatypes ((array!54940 0))(
  ( (array!54941 (arr!26415 (Array (_ BitVec 32) ValueCell!9257)) (size!26874 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54940)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30935)

(declare-fun minValue!1173 () V!30935)

(declare-fun getCurrentListMap!2982 (array!54938 array!54940 (_ BitVec 32) (_ BitVec 32) V!30935 V!30935 (_ BitVec 32) Int) ListLongMap!11421)

(assert (=> b!918948 (= lt!412457 (getCurrentListMap!2982 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918949 () Bool)

(declare-fun res!619601 () Bool)

(assert (=> b!918949 (=> (not res!619601) (not e!515839))))

(assert (=> b!918949 (= res!619601 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918950 () Bool)

(declare-fun res!619608 () Bool)

(assert (=> b!918950 (=> (not res!619608) (not e!515833))))

(assert (=> b!918950 (= res!619608 (and (= (size!26874 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26873 _keys!1487) (size!26874 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918952 () Bool)

(declare-fun e!515838 () Bool)

(assert (=> b!918952 (= e!515838 (not true))))

(declare-fun lt!412458 () tuple2!12724)

(declare-fun +!2637 (ListLongMap!11421 tuple2!12724) ListLongMap!11421)

(assert (=> b!918952 (contains!4772 (+!2637 lt!412457 lt!412458) k!1099)))

(declare-fun lt!412462 () (_ BitVec 64))

(declare-datatypes ((Unit!31022 0))(
  ( (Unit!31023) )
))
(declare-fun lt!412460 () Unit!31022)

(declare-fun lt!412461 () V!30935)

(declare-fun addStillContains!361 (ListLongMap!11421 (_ BitVec 64) V!30935 (_ BitVec 64)) Unit!31022)

(assert (=> b!918952 (= lt!412460 (addStillContains!361 lt!412457 lt!412462 lt!412461 k!1099))))

(assert (=> b!918952 (= (getCurrentListMap!2982 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2637 (getCurrentListMap!2982 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412458))))

(assert (=> b!918952 (= lt!412458 (tuple2!12725 lt!412462 lt!412461))))

(declare-fun get!13850 (ValueCell!9257 V!30935) V!30935)

(declare-fun dynLambda!1426 (Int (_ BitVec 64)) V!30935)

(assert (=> b!918952 (= lt!412461 (get!13850 (select (arr!26415 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1426 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412459 () Unit!31022)

(declare-fun lemmaListMapRecursiveValidKeyArray!27 (array!54938 array!54940 (_ BitVec 32) (_ BitVec 32) V!30935 V!30935 (_ BitVec 32) Int) Unit!31022)

(assert (=> b!918952 (= lt!412459 (lemmaListMapRecursiveValidKeyArray!27 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!30972 () Bool)

(declare-fun mapRes!30972 () Bool)

(declare-fun tp!59348 () Bool)

(declare-fun e!515834 () Bool)

(assert (=> mapNonEmpty!30972 (= mapRes!30972 (and tp!59348 e!515834))))

(declare-fun mapValue!30972 () ValueCell!9257)

(declare-fun mapRest!30972 () (Array (_ BitVec 32) ValueCell!9257))

(declare-fun mapKey!30972 () (_ BitVec 32))

(assert (=> mapNonEmpty!30972 (= (arr!26415 _values!1231) (store mapRest!30972 mapKey!30972 mapValue!30972))))

(declare-fun b!918953 () Bool)

(assert (=> b!918953 (= e!515834 tp_is_empty!19477)))

(declare-fun mapIsEmpty!30972 () Bool)

(assert (=> mapIsEmpty!30972 mapRes!30972))

(declare-fun b!918954 () Bool)

(assert (=> b!918954 (= e!515839 e!515838)))

(declare-fun res!619609 () Bool)

(assert (=> b!918954 (=> (not res!619609) (not e!515838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918954 (= res!619609 (validKeyInArray!0 lt!412462))))

(assert (=> b!918954 (= lt!412462 (select (arr!26414 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918955 () Bool)

(declare-fun res!619604 () Bool)

(assert (=> b!918955 (=> (not res!619604) (not e!515833))))

(declare-datatypes ((List!18529 0))(
  ( (Nil!18526) (Cons!18525 (h!19671 (_ BitVec 64)) (t!26228 List!18529)) )
))
(declare-fun arrayNoDuplicates!0 (array!54938 (_ BitVec 32) List!18529) Bool)

(assert (=> b!918955 (= res!619604 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18526))))

(declare-fun b!918956 () Bool)

(declare-fun e!515837 () Bool)

(assert (=> b!918956 (= e!515837 (and e!515836 mapRes!30972))))

(declare-fun condMapEmpty!30972 () Bool)

(declare-fun mapDefault!30972 () ValueCell!9257)

