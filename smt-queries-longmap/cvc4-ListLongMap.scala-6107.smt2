; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78754 () Bool)

(assert start!78754)

(declare-fun b_free!16967 () Bool)

(declare-fun b_next!16967 () Bool)

(assert (=> start!78754 (= b_free!16967 (not b_next!16967))))

(declare-fun tp!59342 () Bool)

(declare-fun b_and!27671 () Bool)

(assert (=> start!78754 (= tp!59342 b_and!27671)))

(declare-fun b!918903 () Bool)

(declare-fun e!515815 () Bool)

(declare-fun e!515813 () Bool)

(assert (=> b!918903 (= e!515815 e!515813)))

(declare-fun res!619573 () Bool)

(assert (=> b!918903 (=> (not res!619573) (not e!515813))))

(declare-datatypes ((V!30931 0))(
  ( (V!30932 (val!9788 Int)) )
))
(declare-datatypes ((tuple2!12722 0))(
  ( (tuple2!12723 (_1!6372 (_ BitVec 64)) (_2!6372 V!30931)) )
))
(declare-datatypes ((List!18526 0))(
  ( (Nil!18523) (Cons!18522 (h!19668 tuple2!12722) (t!26223 List!18526)) )
))
(declare-datatypes ((ListLongMap!11419 0))(
  ( (ListLongMap!11420 (toList!5725 List!18526)) )
))
(declare-fun lt!412444 () ListLongMap!11419)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4771 (ListLongMap!11419 (_ BitVec 64)) Bool)

(assert (=> b!918903 (= res!619573 (contains!4771 lt!412444 k!1099))))

(declare-datatypes ((array!54934 0))(
  ( (array!54935 (arr!26412 (Array (_ BitVec 32) (_ BitVec 64))) (size!26871 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54934)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9256 0))(
  ( (ValueCellFull!9256 (v!12306 V!30931)) (EmptyCell!9256) )
))
(declare-datatypes ((array!54936 0))(
  ( (array!54937 (arr!26413 (Array (_ BitVec 32) ValueCell!9256)) (size!26872 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54936)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30931)

(declare-fun minValue!1173 () V!30931)

(declare-fun getCurrentListMap!2981 (array!54934 array!54936 (_ BitVec 32) (_ BitVec 32) V!30931 V!30931 (_ BitVec 32) Int) ListLongMap!11419)

(assert (=> b!918903 (= lt!412444 (getCurrentListMap!2981 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!619575 () Bool)

(assert (=> start!78754 (=> (not res!619575) (not e!515815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78754 (= res!619575 (validMask!0 mask!1881))))

(assert (=> start!78754 e!515815))

(assert (=> start!78754 true))

(declare-fun tp_is_empty!19475 () Bool)

(assert (=> start!78754 tp_is_empty!19475))

(declare-fun e!515818 () Bool)

(declare-fun array_inv!20586 (array!54936) Bool)

(assert (=> start!78754 (and (array_inv!20586 _values!1231) e!515818)))

(assert (=> start!78754 tp!59342))

(declare-fun array_inv!20587 (array!54934) Bool)

(assert (=> start!78754 (array_inv!20587 _keys!1487)))

(declare-fun b!918904 () Bool)

(declare-fun e!515816 () Bool)

(assert (=> b!918904 (= e!515816 tp_is_empty!19475)))

(declare-fun b!918905 () Bool)

(declare-fun res!619574 () Bool)

(assert (=> b!918905 (=> (not res!619574) (not e!515815))))

(assert (=> b!918905 (= res!619574 (and (= (size!26872 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26871 _keys!1487) (size!26872 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918906 () Bool)

(declare-fun e!515812 () Bool)

(assert (=> b!918906 (= e!515812 (not true))))

(declare-fun lt!412441 () tuple2!12722)

(declare-fun +!2636 (ListLongMap!11419 tuple2!12722) ListLongMap!11419)

(assert (=> b!918906 (contains!4771 (+!2636 lt!412444 lt!412441) k!1099)))

(declare-fun lt!412442 () V!30931)

(declare-datatypes ((Unit!31020 0))(
  ( (Unit!31021) )
))
(declare-fun lt!412443 () Unit!31020)

(declare-fun lt!412439 () (_ BitVec 64))

(declare-fun addStillContains!360 (ListLongMap!11419 (_ BitVec 64) V!30931 (_ BitVec 64)) Unit!31020)

(assert (=> b!918906 (= lt!412443 (addStillContains!360 lt!412444 lt!412439 lt!412442 k!1099))))

(assert (=> b!918906 (= (getCurrentListMap!2981 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2636 (getCurrentListMap!2981 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412441))))

(assert (=> b!918906 (= lt!412441 (tuple2!12723 lt!412439 lt!412442))))

(declare-fun get!13847 (ValueCell!9256 V!30931) V!30931)

(declare-fun dynLambda!1425 (Int (_ BitVec 64)) V!30931)

(assert (=> b!918906 (= lt!412442 (get!13847 (select (arr!26413 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1425 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412440 () Unit!31020)

(declare-fun lemmaListMapRecursiveValidKeyArray!26 (array!54934 array!54936 (_ BitVec 32) (_ BitVec 32) V!30931 V!30931 (_ BitVec 32) Int) Unit!31020)

(assert (=> b!918906 (= lt!412440 (lemmaListMapRecursiveValidKeyArray!26 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918907 () Bool)

(declare-fun e!515817 () Bool)

(assert (=> b!918907 (= e!515817 tp_is_empty!19475)))

(declare-fun b!918908 () Bool)

(declare-fun res!619578 () Bool)

(assert (=> b!918908 (=> (not res!619578) (not e!515815))))

(assert (=> b!918908 (= res!619578 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26871 _keys!1487))))))

(declare-fun b!918909 () Bool)

(declare-fun res!619570 () Bool)

(assert (=> b!918909 (=> (not res!619570) (not e!515815))))

(declare-datatypes ((List!18527 0))(
  ( (Nil!18524) (Cons!18523 (h!19669 (_ BitVec 64)) (t!26224 List!18527)) )
))
(declare-fun arrayNoDuplicates!0 (array!54934 (_ BitVec 32) List!18527) Bool)

(assert (=> b!918909 (= res!619570 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18524))))

(declare-fun b!918910 () Bool)

(declare-fun res!619576 () Bool)

(assert (=> b!918910 (=> (not res!619576) (not e!515813))))

(assert (=> b!918910 (= res!619576 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918911 () Bool)

(declare-fun res!619571 () Bool)

(assert (=> b!918911 (=> (not res!619571) (not e!515815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54934 (_ BitVec 32)) Bool)

(assert (=> b!918911 (= res!619571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30969 () Bool)

(declare-fun mapRes!30969 () Bool)

(declare-fun tp!59341 () Bool)

(assert (=> mapNonEmpty!30969 (= mapRes!30969 (and tp!59341 e!515816))))

(declare-fun mapValue!30969 () ValueCell!9256)

(declare-fun mapRest!30969 () (Array (_ BitVec 32) ValueCell!9256))

(declare-fun mapKey!30969 () (_ BitVec 32))

(assert (=> mapNonEmpty!30969 (= (arr!26413 _values!1231) (store mapRest!30969 mapKey!30969 mapValue!30969))))

(declare-fun b!918912 () Bool)

(declare-fun res!619579 () Bool)

(assert (=> b!918912 (=> (not res!619579) (not e!515813))))

(declare-fun v!791 () V!30931)

(declare-fun apply!571 (ListLongMap!11419 (_ BitVec 64)) V!30931)

(assert (=> b!918912 (= res!619579 (= (apply!571 lt!412444 k!1099) v!791))))

(declare-fun mapIsEmpty!30969 () Bool)

(assert (=> mapIsEmpty!30969 mapRes!30969))

(declare-fun b!918913 () Bool)

(assert (=> b!918913 (= e!515813 e!515812)))

(declare-fun res!619577 () Bool)

(assert (=> b!918913 (=> (not res!619577) (not e!515812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918913 (= res!619577 (validKeyInArray!0 lt!412439))))

(assert (=> b!918913 (= lt!412439 (select (arr!26412 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918914 () Bool)

(assert (=> b!918914 (= e!515818 (and e!515817 mapRes!30969))))

(declare-fun condMapEmpty!30969 () Bool)

(declare-fun mapDefault!30969 () ValueCell!9256)

