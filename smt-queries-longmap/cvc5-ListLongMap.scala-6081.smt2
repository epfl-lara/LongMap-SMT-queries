; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78594 () Bool)

(assert start!78594)

(declare-fun b_free!16807 () Bool)

(declare-fun b_next!16807 () Bool)

(assert (=> start!78594 (= b_free!16807 (not b_next!16807))))

(declare-fun tp!58862 () Bool)

(declare-fun b_and!27429 () Bool)

(assert (=> start!78594 (= tp!58862 b_and!27429)))

(declare-fun b!916177 () Bool)

(declare-fun e!514276 () Bool)

(declare-fun tp_is_empty!19315 () Bool)

(assert (=> b!916177 (= e!514276 tp_is_empty!19315)))

(declare-fun res!617650 () Bool)

(declare-fun e!514274 () Bool)

(assert (=> start!78594 (=> (not res!617650) (not e!514274))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78594 (= res!617650 (validMask!0 mask!1881))))

(assert (=> start!78594 e!514274))

(assert (=> start!78594 true))

(declare-datatypes ((V!30719 0))(
  ( (V!30720 (val!9708 Int)) )
))
(declare-datatypes ((ValueCell!9176 0))(
  ( (ValueCellFull!9176 (v!12226 V!30719)) (EmptyCell!9176) )
))
(declare-datatypes ((array!54622 0))(
  ( (array!54623 (arr!26256 (Array (_ BitVec 32) ValueCell!9176)) (size!26715 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54622)

(declare-fun e!514275 () Bool)

(declare-fun array_inv!20480 (array!54622) Bool)

(assert (=> start!78594 (and (array_inv!20480 _values!1231) e!514275)))

(assert (=> start!78594 tp!58862))

(declare-datatypes ((array!54624 0))(
  ( (array!54625 (arr!26257 (Array (_ BitVec 32) (_ BitVec 64))) (size!26716 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54624)

(declare-fun array_inv!20481 (array!54624) Bool)

(assert (=> start!78594 (array_inv!20481 _keys!1487)))

(assert (=> start!78594 tp_is_empty!19315))

(declare-fun b!916178 () Bool)

(declare-fun res!617649 () Bool)

(assert (=> b!916178 (=> (not res!617649) (not e!514274))))

(declare-datatypes ((List!18407 0))(
  ( (Nil!18404) (Cons!18403 (h!19549 (_ BitVec 64)) (t!26020 List!18407)) )
))
(declare-fun arrayNoDuplicates!0 (array!54624 (_ BitVec 32) List!18407) Bool)

(assert (=> b!916178 (= res!617649 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18404))))

(declare-fun b!916179 () Bool)

(declare-fun e!514272 () Bool)

(assert (=> b!916179 (= e!514272 tp_is_empty!19315)))

(declare-fun b!916180 () Bool)

(assert (=> b!916180 (= e!514274 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!411763 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30719)

(declare-fun minValue!1173 () V!30719)

(declare-datatypes ((tuple2!12594 0))(
  ( (tuple2!12595 (_1!6308 (_ BitVec 64)) (_2!6308 V!30719)) )
))
(declare-datatypes ((List!18408 0))(
  ( (Nil!18405) (Cons!18404 (h!19550 tuple2!12594) (t!26021 List!18408)) )
))
(declare-datatypes ((ListLongMap!11291 0))(
  ( (ListLongMap!11292 (toList!5661 List!18408)) )
))
(declare-fun contains!4715 (ListLongMap!11291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2922 (array!54624 array!54622 (_ BitVec 32) (_ BitVec 32) V!30719 V!30719 (_ BitVec 32) Int) ListLongMap!11291)

(assert (=> b!916180 (= lt!411763 (contains!4715 (getCurrentListMap!2922 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun mapNonEmpty!30729 () Bool)

(declare-fun mapRes!30729 () Bool)

(declare-fun tp!58861 () Bool)

(assert (=> mapNonEmpty!30729 (= mapRes!30729 (and tp!58861 e!514276))))

(declare-fun mapValue!30729 () ValueCell!9176)

(declare-fun mapRest!30729 () (Array (_ BitVec 32) ValueCell!9176))

(declare-fun mapKey!30729 () (_ BitVec 32))

(assert (=> mapNonEmpty!30729 (= (arr!26256 _values!1231) (store mapRest!30729 mapKey!30729 mapValue!30729))))

(declare-fun b!916181 () Bool)

(declare-fun res!617646 () Bool)

(assert (=> b!916181 (=> (not res!617646) (not e!514274))))

(assert (=> b!916181 (= res!617646 (and (= (size!26715 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26716 _keys!1487) (size!26715 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916182 () Bool)

(assert (=> b!916182 (= e!514275 (and e!514272 mapRes!30729))))

(declare-fun condMapEmpty!30729 () Bool)

(declare-fun mapDefault!30729 () ValueCell!9176)

