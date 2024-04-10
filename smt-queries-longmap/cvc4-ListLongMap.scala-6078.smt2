; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78580 () Bool)

(assert start!78580)

(declare-fun b_free!16793 () Bool)

(declare-fun b_next!16793 () Bool)

(assert (=> start!78580 (= b_free!16793 (not b_next!16793))))

(declare-fun tp!58820 () Bool)

(declare-fun b_and!27415 () Bool)

(assert (=> start!78580 (= tp!58820 b_and!27415)))

(declare-fun mapIsEmpty!30708 () Bool)

(declare-fun mapRes!30708 () Bool)

(assert (=> mapIsEmpty!30708 mapRes!30708))

(declare-fun b!916009 () Bool)

(declare-fun res!617543 () Bool)

(declare-fun e!514170 () Bool)

(assert (=> b!916009 (=> (not res!617543) (not e!514170))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54596 0))(
  ( (array!54597 (arr!26243 (Array (_ BitVec 32) (_ BitVec 64))) (size!26702 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54596)

(assert (=> b!916009 (= res!617543 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26702 _keys!1487))))))

(declare-fun b!916010 () Bool)

(declare-fun res!617544 () Bool)

(assert (=> b!916010 (=> (not res!617544) (not e!514170))))

(declare-datatypes ((List!18400 0))(
  ( (Nil!18397) (Cons!18396 (h!19542 (_ BitVec 64)) (t!26013 List!18400)) )
))
(declare-fun arrayNoDuplicates!0 (array!54596 (_ BitVec 32) List!18400) Bool)

(assert (=> b!916010 (= res!617544 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18397))))

(declare-fun b!916011 () Bool)

(declare-fun res!617542 () Bool)

(assert (=> b!916011 (=> (not res!617542) (not e!514170))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54596 (_ BitVec 32)) Bool)

(assert (=> b!916011 (= res!617542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30708 () Bool)

(declare-fun tp!58819 () Bool)

(declare-fun e!514167 () Bool)

(assert (=> mapNonEmpty!30708 (= mapRes!30708 (and tp!58819 e!514167))))

(declare-datatypes ((V!30699 0))(
  ( (V!30700 (val!9701 Int)) )
))
(declare-datatypes ((ValueCell!9169 0))(
  ( (ValueCellFull!9169 (v!12219 V!30699)) (EmptyCell!9169) )
))
(declare-fun mapValue!30708 () ValueCell!9169)

(declare-datatypes ((array!54598 0))(
  ( (array!54599 (arr!26244 (Array (_ BitVec 32) ValueCell!9169)) (size!26703 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54598)

(declare-fun mapRest!30708 () (Array (_ BitVec 32) ValueCell!9169))

(declare-fun mapKey!30708 () (_ BitVec 32))

(assert (=> mapNonEmpty!30708 (= (arr!26244 _values!1231) (store mapRest!30708 mapKey!30708 mapValue!30708))))

(declare-fun b!916012 () Bool)

(declare-fun e!514171 () Bool)

(declare-fun tp_is_empty!19301 () Bool)

(assert (=> b!916012 (= e!514171 tp_is_empty!19301)))

(declare-fun b!916013 () Bool)

(declare-fun e!514168 () Bool)

(assert (=> b!916013 (= e!514168 (and e!514171 mapRes!30708))))

(declare-fun condMapEmpty!30708 () Bool)

(declare-fun mapDefault!30708 () ValueCell!9169)

