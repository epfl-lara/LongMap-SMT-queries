; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78648 () Bool)

(assert start!78648)

(declare-fun b_free!16861 () Bool)

(declare-fun b_next!16861 () Bool)

(assert (=> start!78648 (= b_free!16861 (not b_next!16861))))

(declare-fun tp!59023 () Bool)

(declare-fun b_and!27483 () Bool)

(assert (=> start!78648 (= tp!59023 b_and!27483)))

(declare-fun mapIsEmpty!30810 () Bool)

(declare-fun mapRes!30810 () Bool)

(assert (=> mapIsEmpty!30810 mapRes!30810))

(declare-fun b!916890 () Bool)

(declare-fun res!618119 () Bool)

(declare-fun e!514736 () Bool)

(assert (=> b!916890 (=> (not res!618119) (not e!514736))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54724 0))(
  ( (array!54725 (arr!26307 (Array (_ BitVec 32) (_ BitVec 64))) (size!26766 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54724)

(assert (=> b!916890 (= res!618119 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26766 _keys!1487))))))

(declare-fun b!916891 () Bool)

(declare-fun e!514737 () Bool)

(assert (=> b!916891 (= e!514736 e!514737)))

(declare-fun res!618117 () Bool)

(assert (=> b!916891 (=> (not res!618117) (not e!514737))))

(declare-datatypes ((V!30791 0))(
  ( (V!30792 (val!9735 Int)) )
))
(declare-datatypes ((tuple2!12634 0))(
  ( (tuple2!12635 (_1!6328 (_ BitVec 64)) (_2!6328 V!30791)) )
))
(declare-datatypes ((List!18445 0))(
  ( (Nil!18442) (Cons!18441 (h!19587 tuple2!12634) (t!26058 List!18445)) )
))
(declare-datatypes ((ListLongMap!11331 0))(
  ( (ListLongMap!11332 (toList!5681 List!18445)) )
))
(declare-fun lt!411891 () ListLongMap!11331)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4733 (ListLongMap!11331 (_ BitVec 64)) Bool)

(assert (=> b!916891 (= res!618117 (contains!4733 lt!411891 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9203 0))(
  ( (ValueCellFull!9203 (v!12253 V!30791)) (EmptyCell!9203) )
))
(declare-datatypes ((array!54726 0))(
  ( (array!54727 (arr!26308 (Array (_ BitVec 32) ValueCell!9203)) (size!26767 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54726)

(declare-fun zeroValue!1173 () V!30791)

(declare-fun minValue!1173 () V!30791)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2940 (array!54724 array!54726 (_ BitVec 32) (_ BitVec 32) V!30791 V!30791 (_ BitVec 32) Int) ListLongMap!11331)

(assert (=> b!916891 (= lt!411891 (getCurrentListMap!2940 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916892 () Bool)

(declare-fun res!618120 () Bool)

(assert (=> b!916892 (=> (not res!618120) (not e!514736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54724 (_ BitVec 32)) Bool)

(assert (=> b!916892 (= res!618120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916893 () Bool)

(declare-fun res!618121 () Bool)

(assert (=> b!916893 (=> (not res!618121) (not e!514736))))

(declare-datatypes ((List!18446 0))(
  ( (Nil!18443) (Cons!18442 (h!19588 (_ BitVec 64)) (t!26059 List!18446)) )
))
(declare-fun arrayNoDuplicates!0 (array!54724 (_ BitVec 32) List!18446) Bool)

(assert (=> b!916893 (= res!618121 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18443))))

(declare-fun b!916894 () Bool)

(declare-fun res!618118 () Bool)

(assert (=> b!916894 (=> (not res!618118) (not e!514736))))

(assert (=> b!916894 (= res!618118 (and (= (size!26767 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26766 _keys!1487) (size!26767 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916895 () Bool)

(declare-fun e!514733 () Bool)

(declare-fun tp_is_empty!19369 () Bool)

(assert (=> b!916895 (= e!514733 tp_is_empty!19369)))

(declare-fun mapNonEmpty!30810 () Bool)

(declare-fun tp!59024 () Bool)

(declare-fun e!514734 () Bool)

(assert (=> mapNonEmpty!30810 (= mapRes!30810 (and tp!59024 e!514734))))

(declare-fun mapRest!30810 () (Array (_ BitVec 32) ValueCell!9203))

(declare-fun mapValue!30810 () ValueCell!9203)

(declare-fun mapKey!30810 () (_ BitVec 32))

(assert (=> mapNonEmpty!30810 (= (arr!26308 _values!1231) (store mapRest!30810 mapKey!30810 mapValue!30810))))

(declare-fun b!916897 () Bool)

(declare-fun e!514735 () Bool)

(assert (=> b!916897 (= e!514735 (and e!514733 mapRes!30810))))

(declare-fun condMapEmpty!30810 () Bool)

(declare-fun mapDefault!30810 () ValueCell!9203)

