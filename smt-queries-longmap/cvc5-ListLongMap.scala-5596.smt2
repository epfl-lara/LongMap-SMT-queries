; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73360 () Bool)

(assert start!73360)

(declare-fun b_free!14275 () Bool)

(declare-fun b_next!14275 () Bool)

(assert (=> start!73360 (= b_free!14275 (not b_next!14275))))

(declare-fun tp!50328 () Bool)

(declare-fun b_and!23631 () Bool)

(assert (=> start!73360 (= tp!50328 b_and!23631)))

(declare-fun b!856074 () Bool)

(declare-fun res!581421 () Bool)

(declare-fun e!477219 () Bool)

(assert (=> b!856074 (=> (not res!581421) (not e!477219))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49016 0))(
  ( (array!49017 (arr!23539 (Array (_ BitVec 32) (_ BitVec 64))) (size!23979 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49016)

(declare-datatypes ((V!26929 0))(
  ( (V!26930 (val!8253 Int)) )
))
(declare-datatypes ((ValueCell!7766 0))(
  ( (ValueCellFull!7766 (v!10678 V!26929)) (EmptyCell!7766) )
))
(declare-datatypes ((array!49018 0))(
  ( (array!49019 (arr!23540 (Array (_ BitVec 32) ValueCell!7766)) (size!23980 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49018)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!856074 (= res!581421 (and (= (size!23980 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23979 _keys!868) (size!23980 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26216 () Bool)

(declare-fun mapRes!26216 () Bool)

(declare-fun tp!50329 () Bool)

(declare-fun e!477215 () Bool)

(assert (=> mapNonEmpty!26216 (= mapRes!26216 (and tp!50329 e!477215))))

(declare-fun mapKey!26216 () (_ BitVec 32))

(declare-fun mapValue!26216 () ValueCell!7766)

(declare-fun mapRest!26216 () (Array (_ BitVec 32) ValueCell!7766))

(assert (=> mapNonEmpty!26216 (= (arr!23540 _values!688) (store mapRest!26216 mapKey!26216 mapValue!26216))))

(declare-fun b!856075 () Bool)

(declare-fun res!581425 () Bool)

(assert (=> b!856075 (=> (not res!581425) (not e!477219))))

(declare-datatypes ((List!16690 0))(
  ( (Nil!16687) (Cons!16686 (h!17817 (_ BitVec 64)) (t!23331 List!16690)) )
))
(declare-fun arrayNoDuplicates!0 (array!49016 (_ BitVec 32) List!16690) Bool)

(assert (=> b!856075 (= res!581425 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16687))))

(declare-fun b!856076 () Bool)

(declare-fun res!581422 () Bool)

(assert (=> b!856076 (=> (not res!581422) (not e!477219))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!856076 (= res!581422 (and (= (select (arr!23539 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856077 () Bool)

(declare-fun res!581426 () Bool)

(assert (=> b!856077 (=> (not res!581426) (not e!477219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856077 (= res!581426 (validKeyInArray!0 k!854))))

(declare-fun b!856078 () Bool)

(declare-fun e!477218 () Bool)

(assert (=> b!856078 (= e!477219 e!477218)))

(declare-fun res!581428 () Bool)

(assert (=> b!856078 (=> (not res!581428) (not e!477218))))

(assert (=> b!856078 (= res!581428 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385834 () array!49018)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10878 0))(
  ( (tuple2!10879 (_1!5450 (_ BitVec 64)) (_2!5450 V!26929)) )
))
(declare-datatypes ((List!16691 0))(
  ( (Nil!16688) (Cons!16687 (h!17818 tuple2!10878) (t!23332 List!16691)) )
))
(declare-datatypes ((ListLongMap!9647 0))(
  ( (ListLongMap!9648 (toList!4839 List!16691)) )
))
(declare-fun lt!385836 () ListLongMap!9647)

(declare-fun minValue!654 () V!26929)

(declare-fun zeroValue!654 () V!26929)

(declare-fun getCurrentListMapNoExtraKeys!2820 (array!49016 array!49018 (_ BitVec 32) (_ BitVec 32) V!26929 V!26929 (_ BitVec 32) Int) ListLongMap!9647)

(assert (=> b!856078 (= lt!385836 (getCurrentListMapNoExtraKeys!2820 _keys!868 lt!385834 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26929)

(assert (=> b!856078 (= lt!385834 (array!49019 (store (arr!23540 _values!688) i!612 (ValueCellFull!7766 v!557)) (size!23980 _values!688)))))

(declare-fun lt!385835 () ListLongMap!9647)

(assert (=> b!856078 (= lt!385835 (getCurrentListMapNoExtraKeys!2820 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856079 () Bool)

(declare-fun e!477216 () Bool)

(declare-fun e!477217 () Bool)

(assert (=> b!856079 (= e!477216 (and e!477217 mapRes!26216))))

(declare-fun condMapEmpty!26216 () Bool)

(declare-fun mapDefault!26216 () ValueCell!7766)

