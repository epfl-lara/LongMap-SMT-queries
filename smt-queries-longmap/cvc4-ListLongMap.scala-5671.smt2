; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73814 () Bool)

(assert start!73814)

(declare-fun b_free!14729 () Bool)

(declare-fun b_next!14729 () Bool)

(assert (=> start!73814 (= b_free!14729 (not b_next!14729))))

(declare-fun tp!51691 () Bool)

(declare-fun b_and!24437 () Bool)

(assert (=> start!73814 (= tp!51691 b_and!24437)))

(declare-fun b!866475 () Bool)

(declare-fun res!588731 () Bool)

(declare-fun e!482669 () Bool)

(assert (=> b!866475 (=> (not res!588731) (not e!482669))))

(declare-datatypes ((array!49890 0))(
  ( (array!49891 (arr!23976 (Array (_ BitVec 32) (_ BitVec 64))) (size!24416 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49890)

(declare-datatypes ((List!17045 0))(
  ( (Nil!17042) (Cons!17041 (h!18172 (_ BitVec 64)) (t!24040 List!17045)) )
))
(declare-fun arrayNoDuplicates!0 (array!49890 (_ BitVec 32) List!17045) Bool)

(assert (=> b!866475 (= res!588731 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17042))))

(declare-fun b!866476 () Bool)

(declare-fun e!482670 () Bool)

(declare-fun tp_is_empty!16865 () Bool)

(assert (=> b!866476 (= e!482670 tp_is_empty!16865)))

(declare-fun mapNonEmpty!26897 () Bool)

(declare-fun mapRes!26897 () Bool)

(declare-fun tp!51690 () Bool)

(assert (=> mapNonEmpty!26897 (= mapRes!26897 (and tp!51690 e!482670))))

(declare-datatypes ((V!27533 0))(
  ( (V!27534 (val!8480 Int)) )
))
(declare-datatypes ((ValueCell!7993 0))(
  ( (ValueCellFull!7993 (v!10905 V!27533)) (EmptyCell!7993) )
))
(declare-fun mapRest!26897 () (Array (_ BitVec 32) ValueCell!7993))

(declare-fun mapValue!26897 () ValueCell!7993)

(declare-datatypes ((array!49892 0))(
  ( (array!49893 (arr!23977 (Array (_ BitVec 32) ValueCell!7993)) (size!24417 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49892)

(declare-fun mapKey!26897 () (_ BitVec 32))

(assert (=> mapNonEmpty!26897 (= (arr!23977 _values!688) (store mapRest!26897 mapKey!26897 mapValue!26897))))

(declare-fun res!588734 () Bool)

(assert (=> start!73814 (=> (not res!588734) (not e!482669))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73814 (= res!588734 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24416 _keys!868))))))

(assert (=> start!73814 e!482669))

(assert (=> start!73814 tp_is_empty!16865))

(assert (=> start!73814 true))

(assert (=> start!73814 tp!51691))

(declare-fun array_inv!18946 (array!49890) Bool)

(assert (=> start!73814 (array_inv!18946 _keys!868)))

(declare-fun e!482673 () Bool)

(declare-fun array_inv!18947 (array!49892) Bool)

(assert (=> start!73814 (and (array_inv!18947 _values!688) e!482673)))

(declare-fun b!866477 () Bool)

(declare-fun res!588729 () Bool)

(assert (=> b!866477 (=> (not res!588729) (not e!482669))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866477 (= res!588729 (validKeyInArray!0 k!854))))

(declare-fun b!866478 () Bool)

(declare-fun e!482667 () Bool)

(assert (=> b!866478 (= e!482673 (and e!482667 mapRes!26897))))

(declare-fun condMapEmpty!26897 () Bool)

(declare-fun mapDefault!26897 () ValueCell!7993)

