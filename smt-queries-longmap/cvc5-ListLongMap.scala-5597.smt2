; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73366 () Bool)

(assert start!73366)

(declare-fun b_free!14281 () Bool)

(declare-fun b_next!14281 () Bool)

(assert (=> start!73366 (= b_free!14281 (not b_next!14281))))

(declare-fun tp!50347 () Bool)

(declare-fun b_and!23637 () Bool)

(assert (=> start!73366 (= tp!50347 b_and!23637)))

(declare-fun b!856182 () Bool)

(declare-fun e!477271 () Bool)

(declare-fun e!477272 () Bool)

(assert (=> b!856182 (= e!477271 e!477272)))

(declare-fun res!581502 () Bool)

(assert (=> b!856182 (=> (not res!581502) (not e!477272))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856182 (= res!581502 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!26937 0))(
  ( (V!26938 (val!8256 Int)) )
))
(declare-datatypes ((ValueCell!7769 0))(
  ( (ValueCellFull!7769 (v!10681 V!26937)) (EmptyCell!7769) )
))
(declare-datatypes ((array!49026 0))(
  ( (array!49027 (arr!23544 (Array (_ BitVec 32) ValueCell!7769)) (size!23984 (_ BitVec 32))) )
))
(declare-fun lt!385870 () array!49026)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10882 0))(
  ( (tuple2!10883 (_1!5452 (_ BitVec 64)) (_2!5452 V!26937)) )
))
(declare-datatypes ((List!16694 0))(
  ( (Nil!16691) (Cons!16690 (h!17821 tuple2!10882) (t!23335 List!16694)) )
))
(declare-datatypes ((ListLongMap!9651 0))(
  ( (ListLongMap!9652 (toList!4841 List!16694)) )
))
(declare-fun lt!385871 () ListLongMap!9651)

(declare-datatypes ((array!49028 0))(
  ( (array!49029 (arr!23545 (Array (_ BitVec 32) (_ BitVec 64))) (size!23985 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49028)

(declare-fun minValue!654 () V!26937)

(declare-fun zeroValue!654 () V!26937)

(declare-fun getCurrentListMapNoExtraKeys!2822 (array!49028 array!49026 (_ BitVec 32) (_ BitVec 32) V!26937 V!26937 (_ BitVec 32) Int) ListLongMap!9651)

(assert (=> b!856182 (= lt!385871 (getCurrentListMapNoExtraKeys!2822 _keys!868 lt!385870 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26937)

(declare-fun _values!688 () array!49026)

(assert (=> b!856182 (= lt!385870 (array!49027 (store (arr!23544 _values!688) i!612 (ValueCellFull!7769 v!557)) (size!23984 _values!688)))))

(declare-fun lt!385872 () ListLongMap!9651)

(assert (=> b!856182 (= lt!385872 (getCurrentListMapNoExtraKeys!2822 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856183 () Bool)

(declare-fun res!581507 () Bool)

(assert (=> b!856183 (=> (not res!581507) (not e!477271))))

(declare-datatypes ((List!16695 0))(
  ( (Nil!16692) (Cons!16691 (h!17822 (_ BitVec 64)) (t!23336 List!16695)) )
))
(declare-fun arrayNoDuplicates!0 (array!49028 (_ BitVec 32) List!16695) Bool)

(assert (=> b!856183 (= res!581507 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16692))))

(declare-fun b!856184 () Bool)

(declare-fun e!477269 () Bool)

(declare-fun e!477270 () Bool)

(declare-fun mapRes!26225 () Bool)

(assert (=> b!856184 (= e!477269 (and e!477270 mapRes!26225))))

(declare-fun condMapEmpty!26225 () Bool)

(declare-fun mapDefault!26225 () ValueCell!7769)

