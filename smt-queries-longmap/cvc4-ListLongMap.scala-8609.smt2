; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104902 () Bool)

(assert start!104902)

(declare-fun b_free!26693 () Bool)

(declare-fun b_next!26693 () Bool)

(assert (=> start!104902 (= b_free!26693 (not b_next!26693))))

(declare-fun tp!93572 () Bool)

(declare-fun b_and!44469 () Bool)

(assert (=> start!104902 (= tp!93572 b_and!44469)))

(declare-fun b!1250348 () Bool)

(declare-fun e!709807 () Bool)

(declare-fun e!709810 () Bool)

(assert (=> b!1250348 (= e!709807 e!709810)))

(declare-fun res!834008 () Bool)

(assert (=> b!1250348 (=> res!834008 e!709810)))

(declare-datatypes ((V!47491 0))(
  ( (V!47492 (val!15860 Int)) )
))
(declare-datatypes ((tuple2!20434 0))(
  ( (tuple2!20435 (_1!10228 (_ BitVec 64)) (_2!10228 V!47491)) )
))
(declare-datatypes ((List!27676 0))(
  ( (Nil!27673) (Cons!27672 (h!28881 tuple2!20434) (t!41149 List!27676)) )
))
(declare-datatypes ((ListLongMap!18307 0))(
  ( (ListLongMap!18308 (toList!9169 List!27676)) )
))
(declare-fun lt!564179 () ListLongMap!18307)

(declare-fun contains!7485 (ListLongMap!18307 (_ BitVec 64)) Bool)

(assert (=> b!1250348 (= res!834008 (contains!7485 lt!564179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47491)

(declare-datatypes ((array!80860 0))(
  ( (array!80861 (arr!38996 (Array (_ BitVec 32) (_ BitVec 64))) (size!39532 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80860)

(declare-datatypes ((ValueCell!15034 0))(
  ( (ValueCellFull!15034 (v!18556 V!47491)) (EmptyCell!15034) )
))
(declare-datatypes ((array!80862 0))(
  ( (array!80863 (arr!38997 (Array (_ BitVec 32) ValueCell!15034)) (size!39533 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80862)

(declare-fun minValueBefore!43 () V!47491)

(declare-fun getCurrentListMap!4446 (array!80860 array!80862 (_ BitVec 32) (_ BitVec 32) V!47491 V!47491 (_ BitVec 32) Int) ListLongMap!18307)

(assert (=> b!1250348 (= lt!564179 (getCurrentListMap!4446 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250349 () Bool)

(declare-fun e!709806 () Bool)

(declare-fun tp_is_empty!31595 () Bool)

(assert (=> b!1250349 (= e!709806 tp_is_empty!31595)))

(declare-fun mapIsEmpty!49156 () Bool)

(declare-fun mapRes!49156 () Bool)

(assert (=> mapIsEmpty!49156 mapRes!49156))

(declare-fun b!1250351 () Bool)

(declare-fun e!709811 () Bool)

(declare-fun e!709808 () Bool)

(assert (=> b!1250351 (= e!709811 (and e!709808 mapRes!49156))))

(declare-fun condMapEmpty!49156 () Bool)

(declare-fun mapDefault!49156 () ValueCell!15034)

