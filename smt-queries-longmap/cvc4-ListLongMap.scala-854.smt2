; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20224 () Bool)

(assert start!20224)

(declare-fun b_free!4883 () Bool)

(declare-fun b_next!4883 () Bool)

(assert (=> start!20224 (= b_free!4883 (not b_next!4883))))

(declare-fun tp!17680 () Bool)

(declare-fun b_and!11629 () Bool)

(assert (=> start!20224 (= tp!17680 b_and!11629)))

(declare-fun b!198794 () Bool)

(declare-fun res!94338 () Bool)

(declare-fun e!130604 () Bool)

(assert (=> b!198794 (=> (not res!94338) (not e!130604))))

(declare-datatypes ((array!8719 0))(
  ( (array!8720 (arr!4110 (Array (_ BitVec 32) (_ BitVec 64))) (size!4435 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8719)

(declare-datatypes ((List!2572 0))(
  ( (Nil!2569) (Cons!2568 (h!3210 (_ BitVec 64)) (t!7503 List!2572)) )
))
(declare-fun arrayNoDuplicates!0 (array!8719 (_ BitVec 32) List!2572) Bool)

(assert (=> b!198794 (= res!94338 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2569))))

(declare-fun b!198795 () Bool)

(declare-fun res!94337 () Bool)

(assert (=> b!198795 (=> (not res!94337) (not e!130604))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198795 (= res!94337 (= (select (arr!4110 _keys!825) i!601) k!843))))

(declare-fun b!198796 () Bool)

(declare-fun res!94340 () Bool)

(assert (=> b!198796 (=> (not res!94340) (not e!130604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198796 (= res!94340 (validKeyInArray!0 k!843))))

(declare-fun b!198797 () Bool)

(declare-fun res!94341 () Bool)

(assert (=> b!198797 (=> (not res!94341) (not e!130604))))

(assert (=> b!198797 (= res!94341 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4435 _keys!825))))))

(declare-fun b!198798 () Bool)

(assert (=> b!198798 (= e!130604 (not true))))

(declare-datatypes ((V!5965 0))(
  ( (V!5966 (val!2414 Int)) )
))
(declare-datatypes ((tuple2!3658 0))(
  ( (tuple2!3659 (_1!1840 (_ BitVec 64)) (_2!1840 V!5965)) )
))
(declare-datatypes ((List!2573 0))(
  ( (Nil!2570) (Cons!2569 (h!3211 tuple2!3658) (t!7504 List!2573)) )
))
(declare-datatypes ((ListLongMap!2571 0))(
  ( (ListLongMap!2572 (toList!1301 List!2573)) )
))
(declare-fun lt!98041 () ListLongMap!2571)

(declare-fun lt!98042 () ListLongMap!2571)

(assert (=> b!198798 (and (= lt!98041 lt!98042) (= lt!98042 lt!98041))))

(declare-fun v!520 () V!5965)

(declare-fun lt!98043 () ListLongMap!2571)

(declare-fun +!328 (ListLongMap!2571 tuple2!3658) ListLongMap!2571)

(assert (=> b!198798 (= lt!98042 (+!328 lt!98043 (tuple2!3659 k!843 v!520)))))

(declare-datatypes ((Unit!5958 0))(
  ( (Unit!5959) )
))
(declare-fun lt!98040 () Unit!5958)

(declare-datatypes ((ValueCell!2026 0))(
  ( (ValueCellFull!2026 (v!4384 V!5965)) (EmptyCell!2026) )
))
(declare-datatypes ((array!8721 0))(
  ( (array!8722 (arr!4111 (Array (_ BitVec 32) ValueCell!2026)) (size!4436 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8721)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5965)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5965)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!5 (array!8719 array!8721 (_ BitVec 32) (_ BitVec 32) V!5965 V!5965 (_ BitVec 32) (_ BitVec 64) V!5965 (_ BitVec 32) Int) Unit!5958)

(assert (=> b!198798 (= lt!98040 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!5 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!266 (array!8719 array!8721 (_ BitVec 32) (_ BitVec 32) V!5965 V!5965 (_ BitVec 32) Int) ListLongMap!2571)

(assert (=> b!198798 (= lt!98041 (getCurrentListMapNoExtraKeys!266 _keys!825 (array!8722 (store (arr!4111 _values!649) i!601 (ValueCellFull!2026 v!520)) (size!4436 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198798 (= lt!98043 (getCurrentListMapNoExtraKeys!266 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198799 () Bool)

(declare-fun res!94342 () Bool)

(assert (=> b!198799 (=> (not res!94342) (not e!130604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8719 (_ BitVec 32)) Bool)

(assert (=> b!198799 (= res!94342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198800 () Bool)

(declare-fun e!130600 () Bool)

(declare-fun e!130602 () Bool)

(declare-fun mapRes!8177 () Bool)

(assert (=> b!198800 (= e!130600 (and e!130602 mapRes!8177))))

(declare-fun condMapEmpty!8177 () Bool)

(declare-fun mapDefault!8177 () ValueCell!2026)

