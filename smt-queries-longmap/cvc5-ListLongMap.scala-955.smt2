; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20826 () Bool)

(assert start!20826)

(declare-fun b_free!5479 () Bool)

(declare-fun b_next!5479 () Bool)

(assert (=> start!20826 (= b_free!5479 (not b_next!5479))))

(declare-fun tp!19478 () Bool)

(declare-fun b_and!12225 () Bool)

(assert (=> start!20826 (= tp!19478 b_and!12225)))

(declare-fun b!208850 () Bool)

(declare-fun res!101683 () Bool)

(declare-fun e!136150 () Bool)

(assert (=> b!208850 (=> (not res!101683) (not e!136150))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9885 0))(
  ( (array!9886 (arr!4693 (Array (_ BitVec 32) (_ BitVec 64))) (size!5018 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9885)

(assert (=> b!208850 (= res!101683 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5018 _keys!825))))))

(declare-fun b!208851 () Bool)

(declare-fun res!101688 () Bool)

(assert (=> b!208851 (=> (not res!101688) (not e!136150))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6769 0))(
  ( (V!6770 (val!2715 Int)) )
))
(declare-datatypes ((ValueCell!2327 0))(
  ( (ValueCellFull!2327 (v!4685 V!6769)) (EmptyCell!2327) )
))
(declare-datatypes ((array!9887 0))(
  ( (array!9888 (arr!4694 (Array (_ BitVec 32) ValueCell!2327)) (size!5019 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9887)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208851 (= res!101688 (and (= (size!5019 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5018 _keys!825) (size!5019 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208852 () Bool)

(declare-fun res!101687 () Bool)

(assert (=> b!208852 (=> (not res!101687) (not e!136150))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!208852 (= res!101687 (= (select (arr!4693 _keys!825) i!601) k!843))))

(declare-fun b!208853 () Bool)

(declare-fun res!101685 () Bool)

(assert (=> b!208853 (=> (not res!101685) (not e!136150))))

(declare-datatypes ((List!3006 0))(
  ( (Nil!3003) (Cons!3002 (h!3644 (_ BitVec 64)) (t!7937 List!3006)) )
))
(declare-fun arrayNoDuplicates!0 (array!9885 (_ BitVec 32) List!3006) Bool)

(assert (=> b!208853 (= res!101685 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3003))))

(declare-fun mapNonEmpty!9080 () Bool)

(declare-fun mapRes!9080 () Bool)

(declare-fun tp!19477 () Bool)

(declare-fun e!136152 () Bool)

(assert (=> mapNonEmpty!9080 (= mapRes!9080 (and tp!19477 e!136152))))

(declare-fun mapValue!9080 () ValueCell!2327)

(declare-fun mapRest!9080 () (Array (_ BitVec 32) ValueCell!2327))

(declare-fun mapKey!9080 () (_ BitVec 32))

(assert (=> mapNonEmpty!9080 (= (arr!4694 _values!649) (store mapRest!9080 mapKey!9080 mapValue!9080))))

(declare-fun b!208854 () Bool)

(assert (=> b!208854 (= e!136150 false)))

(declare-datatypes ((tuple2!4110 0))(
  ( (tuple2!4111 (_1!2066 (_ BitVec 64)) (_2!2066 V!6769)) )
))
(declare-datatypes ((List!3007 0))(
  ( (Nil!3004) (Cons!3003 (h!3645 tuple2!4110) (t!7938 List!3007)) )
))
(declare-datatypes ((ListLongMap!3023 0))(
  ( (ListLongMap!3024 (toList!1527 List!3007)) )
))
(declare-fun lt!106869 () ListLongMap!3023)

(declare-fun v!520 () V!6769)

(declare-fun zeroValue!615 () V!6769)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6769)

(declare-fun getCurrentListMapNoExtraKeys!468 (array!9885 array!9887 (_ BitVec 32) (_ BitVec 32) V!6769 V!6769 (_ BitVec 32) Int) ListLongMap!3023)

(assert (=> b!208854 (= lt!106869 (getCurrentListMapNoExtraKeys!468 _keys!825 (array!9888 (store (arr!4694 _values!649) i!601 (ValueCellFull!2327 v!520)) (size!5019 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106868 () ListLongMap!3023)

(assert (=> b!208854 (= lt!106868 (getCurrentListMapNoExtraKeys!468 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208855 () Bool)

(declare-fun e!136153 () Bool)

(declare-fun e!136151 () Bool)

(assert (=> b!208855 (= e!136153 (and e!136151 mapRes!9080))))

(declare-fun condMapEmpty!9080 () Bool)

(declare-fun mapDefault!9080 () ValueCell!2327)

