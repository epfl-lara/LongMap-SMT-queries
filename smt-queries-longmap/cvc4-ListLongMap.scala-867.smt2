; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20302 () Bool)

(assert start!20302)

(declare-fun b_free!4961 () Bool)

(declare-fun b_next!4961 () Bool)

(assert (=> start!20302 (= b_free!4961 (not b_next!4961))))

(declare-fun tp!17914 () Bool)

(declare-fun b_and!11707 () Bool)

(assert (=> start!20302 (= tp!17914 b_and!11707)))

(declare-fun mapNonEmpty!8294 () Bool)

(declare-fun mapRes!8294 () Bool)

(declare-fun tp!17915 () Bool)

(declare-fun e!131188 () Bool)

(assert (=> mapNonEmpty!8294 (= mapRes!8294 (and tp!17915 e!131188))))

(declare-fun mapKey!8294 () (_ BitVec 32))

(declare-datatypes ((V!6069 0))(
  ( (V!6070 (val!2453 Int)) )
))
(declare-datatypes ((ValueCell!2065 0))(
  ( (ValueCellFull!2065 (v!4423 V!6069)) (EmptyCell!2065) )
))
(declare-fun mapValue!8294 () ValueCell!2065)

(declare-fun mapRest!8294 () (Array (_ BitVec 32) ValueCell!2065))

(declare-datatypes ((array!8871 0))(
  ( (array!8872 (arr!4186 (Array (_ BitVec 32) ValueCell!2065)) (size!4511 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8871)

(assert (=> mapNonEmpty!8294 (= (arr!4186 _values!649) (store mapRest!8294 mapKey!8294 mapValue!8294))))

(declare-fun b!199964 () Bool)

(declare-fun res!95160 () Bool)

(declare-fun e!131186 () Bool)

(assert (=> b!199964 (=> (not res!95160) (not e!131186))))

(declare-datatypes ((array!8873 0))(
  ( (array!8874 (arr!4187 (Array (_ BitVec 32) (_ BitVec 64))) (size!4512 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8873)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8873 (_ BitVec 32)) Bool)

(assert (=> b!199964 (= res!95160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8294 () Bool)

(assert (=> mapIsEmpty!8294 mapRes!8294))

(declare-fun b!199965 () Bool)

(declare-fun tp_is_empty!4817 () Bool)

(assert (=> b!199965 (= e!131188 tp_is_empty!4817)))

(declare-fun b!199966 () Bool)

(declare-fun e!131185 () Bool)

(assert (=> b!199966 (= e!131185 tp_is_empty!4817)))

(declare-fun b!199967 () Bool)

(assert (=> b!199967 (= e!131186 (not true))))

(declare-datatypes ((tuple2!3706 0))(
  ( (tuple2!3707 (_1!1864 (_ BitVec 64)) (_2!1864 V!6069)) )
))
(declare-datatypes ((List!2623 0))(
  ( (Nil!2620) (Cons!2619 (h!3261 tuple2!3706) (t!7554 List!2623)) )
))
(declare-datatypes ((ListLongMap!2619 0))(
  ( (ListLongMap!2620 (toList!1325 List!2623)) )
))
(declare-fun lt!98633 () ListLongMap!2619)

(declare-fun zeroValue!615 () V!6069)

(declare-fun lt!98635 () array!8871)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6069)

(declare-fun getCurrentListMap!916 (array!8873 array!8871 (_ BitVec 32) (_ BitVec 32) V!6069 V!6069 (_ BitVec 32) Int) ListLongMap!2619)

(assert (=> b!199967 (= lt!98633 (getCurrentListMap!916 _keys!825 lt!98635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98634 () ListLongMap!2619)

(declare-fun lt!98636 () ListLongMap!2619)

(assert (=> b!199967 (and (= lt!98634 lt!98636) (= lt!98636 lt!98634))))

(declare-fun lt!98637 () ListLongMap!2619)

(declare-fun v!520 () V!6069)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!352 (ListLongMap!2619 tuple2!3706) ListLongMap!2619)

(assert (=> b!199967 (= lt!98636 (+!352 lt!98637 (tuple2!3707 k!843 v!520)))))

(declare-datatypes ((Unit!6006 0))(
  ( (Unit!6007) )
))
(declare-fun lt!98632 () Unit!6006)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!29 (array!8873 array!8871 (_ BitVec 32) (_ BitVec 32) V!6069 V!6069 (_ BitVec 32) (_ BitVec 64) V!6069 (_ BitVec 32) Int) Unit!6006)

(assert (=> b!199967 (= lt!98632 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!29 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!290 (array!8873 array!8871 (_ BitVec 32) (_ BitVec 32) V!6069 V!6069 (_ BitVec 32) Int) ListLongMap!2619)

(assert (=> b!199967 (= lt!98634 (getCurrentListMapNoExtraKeys!290 _keys!825 lt!98635 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199967 (= lt!98635 (array!8872 (store (arr!4186 _values!649) i!601 (ValueCellFull!2065 v!520)) (size!4511 _values!649)))))

(assert (=> b!199967 (= lt!98637 (getCurrentListMapNoExtraKeys!290 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!95156 () Bool)

(assert (=> start!20302 (=> (not res!95156) (not e!131186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20302 (= res!95156 (validMask!0 mask!1149))))

(assert (=> start!20302 e!131186))

(declare-fun e!131187 () Bool)

(declare-fun array_inv!2753 (array!8871) Bool)

(assert (=> start!20302 (and (array_inv!2753 _values!649) e!131187)))

(assert (=> start!20302 true))

(assert (=> start!20302 tp_is_empty!4817))

(declare-fun array_inv!2754 (array!8873) Bool)

(assert (=> start!20302 (array_inv!2754 _keys!825)))

(assert (=> start!20302 tp!17914))

(declare-fun b!199968 () Bool)

(declare-fun res!95159 () Bool)

(assert (=> b!199968 (=> (not res!95159) (not e!131186))))

(declare-datatypes ((List!2624 0))(
  ( (Nil!2621) (Cons!2620 (h!3262 (_ BitVec 64)) (t!7555 List!2624)) )
))
(declare-fun arrayNoDuplicates!0 (array!8873 (_ BitVec 32) List!2624) Bool)

(assert (=> b!199968 (= res!95159 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2621))))

(declare-fun b!199969 () Bool)

(declare-fun res!95158 () Bool)

(assert (=> b!199969 (=> (not res!95158) (not e!131186))))

(assert (=> b!199969 (= res!95158 (= (select (arr!4187 _keys!825) i!601) k!843))))

(declare-fun b!199970 () Bool)

(declare-fun res!95161 () Bool)

(assert (=> b!199970 (=> (not res!95161) (not e!131186))))

(assert (=> b!199970 (= res!95161 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4512 _keys!825))))))

(declare-fun b!199971 () Bool)

(declare-fun res!95157 () Bool)

(assert (=> b!199971 (=> (not res!95157) (not e!131186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199971 (= res!95157 (validKeyInArray!0 k!843))))

(declare-fun b!199972 () Bool)

(assert (=> b!199972 (= e!131187 (and e!131185 mapRes!8294))))

(declare-fun condMapEmpty!8294 () Bool)

(declare-fun mapDefault!8294 () ValueCell!2065)

