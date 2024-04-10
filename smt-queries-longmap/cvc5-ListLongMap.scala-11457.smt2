; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133540 () Bool)

(assert start!133540)

(declare-fun b_free!31957 () Bool)

(declare-fun b_next!31957 () Bool)

(assert (=> start!133540 (= b_free!31957 (not b_next!31957))))

(declare-fun tp!112995 () Bool)

(declare-fun b_and!51425 () Bool)

(assert (=> start!133540 (= tp!112995 b_and!51425)))

(declare-fun b!1561152 () Bool)

(declare-fun res!1067451 () Bool)

(declare-fun e!870003 () Bool)

(assert (=> b!1561152 (=> (not res!1067451) (not e!870003))))

(declare-datatypes ((array!103964 0))(
  ( (array!103965 (arr!50174 (Array (_ BitVec 32) (_ BitVec 64))) (size!50724 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103964)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103964 (_ BitVec 32)) Bool)

(assert (=> b!1561152 (= res!1067451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561153 () Bool)

(assert (=> b!1561153 (= e!870003 (not true))))

(declare-datatypes ((V!59705 0))(
  ( (V!59706 (val!19395 Int)) )
))
(declare-datatypes ((tuple2!25052 0))(
  ( (tuple2!25053 (_1!12537 (_ BitVec 64)) (_2!12537 V!59705)) )
))
(declare-datatypes ((List!36425 0))(
  ( (Nil!36422) (Cons!36421 (h!37867 tuple2!25052) (t!51172 List!36425)) )
))
(declare-datatypes ((ListLongMap!22487 0))(
  ( (ListLongMap!22488 (toList!11259 List!36425)) )
))
(declare-fun lt!671122 () ListLongMap!22487)

(declare-fun lt!671123 () V!59705)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun contains!10249 (ListLongMap!22487 (_ BitVec 64)) Bool)

(declare-fun +!5029 (ListLongMap!22487 tuple2!25052) ListLongMap!22487)

(assert (=> b!1561153 (not (contains!10249 (+!5029 lt!671122 (tuple2!25053 (select (arr!50174 _keys!637) from!782) lt!671123)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51912 0))(
  ( (Unit!51913) )
))
(declare-fun lt!671124 () Unit!51912)

(declare-fun addStillNotContains!519 (ListLongMap!22487 (_ BitVec 64) V!59705 (_ BitVec 64)) Unit!51912)

(assert (=> b!1561153 (= lt!671124 (addStillNotContains!519 lt!671122 (select (arr!50174 _keys!637) from!782) lt!671123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18281 0))(
  ( (ValueCellFull!18281 (v!22147 V!59705)) (EmptyCell!18281) )
))
(declare-datatypes ((array!103966 0))(
  ( (array!103967 (arr!50175 (Array (_ BitVec 32) ValueCell!18281)) (size!50725 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103966)

(declare-fun get!26192 (ValueCell!18281 V!59705) V!59705)

(declare-fun dynLambda!3813 (Int (_ BitVec 64)) V!59705)

(assert (=> b!1561153 (= lt!671123 (get!26192 (select (arr!50175 _values!487) from!782) (dynLambda!3813 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59705)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59705)

(declare-fun getCurrentListMapNoExtraKeys!6643 (array!103964 array!103966 (_ BitVec 32) (_ BitVec 32) V!59705 V!59705 (_ BitVec 32) Int) ListLongMap!22487)

(assert (=> b!1561153 (= lt!671122 (getCurrentListMapNoExtraKeys!6643 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1067447 () Bool)

(assert (=> start!133540 (=> (not res!1067447) (not e!870003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133540 (= res!1067447 (validMask!0 mask!947))))

(assert (=> start!133540 e!870003))

(assert (=> start!133540 tp!112995))

(declare-fun tp_is_empty!38623 () Bool)

(assert (=> start!133540 tp_is_empty!38623))

(assert (=> start!133540 true))

(declare-fun array_inv!39001 (array!103964) Bool)

(assert (=> start!133540 (array_inv!39001 _keys!637)))

(declare-fun e!870004 () Bool)

(declare-fun array_inv!39002 (array!103966) Bool)

(assert (=> start!133540 (and (array_inv!39002 _values!487) e!870004)))

(declare-fun b!1561154 () Bool)

(declare-fun e!870002 () Bool)

(declare-fun mapRes!59310 () Bool)

(assert (=> b!1561154 (= e!870004 (and e!870002 mapRes!59310))))

(declare-fun condMapEmpty!59310 () Bool)

(declare-fun mapDefault!59310 () ValueCell!18281)

