; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78748 () Bool)

(assert start!78748)

(declare-fun b_free!16961 () Bool)

(declare-fun b_next!16961 () Bool)

(assert (=> start!78748 (= b_free!16961 (not b_next!16961))))

(declare-fun tp!59323 () Bool)

(declare-fun b_and!27659 () Bool)

(assert (=> start!78748 (= tp!59323 b_and!27659)))

(declare-fun b!918780 () Bool)

(declare-fun res!619488 () Bool)

(declare-fun e!515753 () Bool)

(assert (=> b!918780 (=> (not res!619488) (not e!515753))))

(declare-datatypes ((array!54922 0))(
  ( (array!54923 (arr!26406 (Array (_ BitVec 32) (_ BitVec 64))) (size!26865 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54922)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54922 (_ BitVec 32)) Bool)

(assert (=> b!918780 (= res!619488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918781 () Bool)

(declare-fun res!619484 () Bool)

(declare-fun e!515749 () Bool)

(assert (=> b!918781 (=> (not res!619484) (not e!515749))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918781 (= res!619484 (validKeyInArray!0 k!1099))))

(declare-fun b!918782 () Bool)

(declare-fun res!619483 () Bool)

(assert (=> b!918782 (=> (not res!619483) (not e!515749))))

(declare-datatypes ((V!30923 0))(
  ( (V!30924 (val!9785 Int)) )
))
(declare-fun v!791 () V!30923)

(declare-datatypes ((tuple2!12716 0))(
  ( (tuple2!12717 (_1!6369 (_ BitVec 64)) (_2!6369 V!30923)) )
))
(declare-datatypes ((List!18521 0))(
  ( (Nil!18518) (Cons!18517 (h!19663 tuple2!12716) (t!26212 List!18521)) )
))
(declare-datatypes ((ListLongMap!11413 0))(
  ( (ListLongMap!11414 (toList!5722 List!18521)) )
))
(declare-fun lt!412385 () ListLongMap!11413)

(declare-fun apply!568 (ListLongMap!11413 (_ BitVec 64)) V!30923)

(assert (=> b!918782 (= res!619483 (= (apply!568 lt!412385 k!1099) v!791))))

(declare-fun b!918783 () Bool)

(declare-fun res!619487 () Bool)

(assert (=> b!918783 (=> (not res!619487) (not e!515753))))

(declare-datatypes ((List!18522 0))(
  ( (Nil!18519) (Cons!18518 (h!19664 (_ BitVec 64)) (t!26213 List!18522)) )
))
(declare-fun arrayNoDuplicates!0 (array!54922 (_ BitVec 32) List!18522) Bool)

(assert (=> b!918783 (= res!619487 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18519))))

(declare-fun b!918785 () Bool)

(declare-fun e!515751 () Bool)

(declare-fun tp_is_empty!19469 () Bool)

(assert (=> b!918785 (= e!515751 tp_is_empty!19469)))

(declare-fun mapNonEmpty!30960 () Bool)

(declare-fun mapRes!30960 () Bool)

(declare-fun tp!59324 () Bool)

(assert (=> mapNonEmpty!30960 (= mapRes!30960 (and tp!59324 e!515751))))

(declare-fun mapKey!30960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9253 0))(
  ( (ValueCellFull!9253 (v!12303 V!30923)) (EmptyCell!9253) )
))
(declare-fun mapRest!30960 () (Array (_ BitVec 32) ValueCell!9253))

(declare-fun mapValue!30960 () ValueCell!9253)

(declare-datatypes ((array!54924 0))(
  ( (array!54925 (arr!26407 (Array (_ BitVec 32) ValueCell!9253)) (size!26866 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54924)

(assert (=> mapNonEmpty!30960 (= (arr!26407 _values!1231) (store mapRest!30960 mapKey!30960 mapValue!30960))))

(declare-fun b!918786 () Bool)

(declare-fun e!515752 () Bool)

(assert (=> b!918786 (= e!515752 (not true))))

(declare-fun lt!412388 () tuple2!12716)

(declare-fun contains!4768 (ListLongMap!11413 (_ BitVec 64)) Bool)

(declare-fun +!2634 (ListLongMap!11413 tuple2!12716) ListLongMap!11413)

(assert (=> b!918786 (contains!4768 (+!2634 lt!412385 lt!412388) k!1099)))

(declare-fun lt!412387 () V!30923)

(declare-datatypes ((Unit!31016 0))(
  ( (Unit!31017) )
))
(declare-fun lt!412389 () Unit!31016)

(declare-fun lt!412390 () (_ BitVec 64))

(declare-fun addStillContains!358 (ListLongMap!11413 (_ BitVec 64) V!30923 (_ BitVec 64)) Unit!31016)

(assert (=> b!918786 (= lt!412389 (addStillContains!358 lt!412385 lt!412390 lt!412387 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30923)

(declare-fun minValue!1173 () V!30923)

(declare-fun getCurrentListMap!2978 (array!54922 array!54924 (_ BitVec 32) (_ BitVec 32) V!30923 V!30923 (_ BitVec 32) Int) ListLongMap!11413)

(assert (=> b!918786 (= (getCurrentListMap!2978 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2634 (getCurrentListMap!2978 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412388))))

(assert (=> b!918786 (= lt!412388 (tuple2!12717 lt!412390 lt!412387))))

(declare-fun get!13843 (ValueCell!9253 V!30923) V!30923)

(declare-fun dynLambda!1423 (Int (_ BitVec 64)) V!30923)

(assert (=> b!918786 (= lt!412387 (get!13843 (select (arr!26407 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1423 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412386 () Unit!31016)

(declare-fun lemmaListMapRecursiveValidKeyArray!24 (array!54922 array!54924 (_ BitVec 32) (_ BitVec 32) V!30923 V!30923 (_ BitVec 32) Int) Unit!31016)

(assert (=> b!918786 (= lt!412386 (lemmaListMapRecursiveValidKeyArray!24 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918787 () Bool)

(assert (=> b!918787 (= e!515753 e!515749)))

(declare-fun res!619480 () Bool)

(assert (=> b!918787 (=> (not res!619480) (not e!515749))))

(assert (=> b!918787 (= res!619480 (contains!4768 lt!412385 k!1099))))

(assert (=> b!918787 (= lt!412385 (getCurrentListMap!2978 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918788 () Bool)

(declare-fun res!619485 () Bool)

(assert (=> b!918788 (=> (not res!619485) (not e!515753))))

(assert (=> b!918788 (= res!619485 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26865 _keys!1487))))))

(declare-fun b!918789 () Bool)

(declare-fun res!619486 () Bool)

(assert (=> b!918789 (=> (not res!619486) (not e!515749))))

(assert (=> b!918789 (= res!619486 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918790 () Bool)

(assert (=> b!918790 (= e!515749 e!515752)))

(declare-fun res!619489 () Bool)

(assert (=> b!918790 (=> (not res!619489) (not e!515752))))

(assert (=> b!918790 (= res!619489 (validKeyInArray!0 lt!412390))))

(assert (=> b!918790 (= lt!412390 (select (arr!26406 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!30960 () Bool)

(assert (=> mapIsEmpty!30960 mapRes!30960))

(declare-fun b!918791 () Bool)

(declare-fun e!515755 () Bool)

(declare-fun e!515754 () Bool)

(assert (=> b!918791 (= e!515755 (and e!515754 mapRes!30960))))

(declare-fun condMapEmpty!30960 () Bool)

(declare-fun mapDefault!30960 () ValueCell!9253)

