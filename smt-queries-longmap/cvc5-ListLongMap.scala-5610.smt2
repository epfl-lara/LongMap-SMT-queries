; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73444 () Bool)

(assert start!73444)

(declare-fun b_free!14359 () Bool)

(declare-fun b_next!14359 () Bool)

(assert (=> start!73444 (= b_free!14359 (not b_next!14359))))

(declare-fun tp!50581 () Bool)

(declare-fun b_and!23715 () Bool)

(assert (=> start!73444 (= tp!50581 b_and!23715)))

(declare-fun b!857586 () Bool)

(declare-fun res!582556 () Bool)

(declare-fun e!477973 () Bool)

(assert (=> b!857586 (=> (not res!582556) (not e!477973))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857586 (= res!582556 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26342 () Bool)

(declare-fun mapRes!26342 () Bool)

(declare-fun tp!50580 () Bool)

(declare-fun e!477972 () Bool)

(assert (=> mapNonEmpty!26342 (= mapRes!26342 (and tp!50580 e!477972))))

(declare-datatypes ((V!27041 0))(
  ( (V!27042 (val!8295 Int)) )
))
(declare-datatypes ((ValueCell!7808 0))(
  ( (ValueCellFull!7808 (v!10720 V!27041)) (EmptyCell!7808) )
))
(declare-fun mapRest!26342 () (Array (_ BitVec 32) ValueCell!7808))

(declare-fun mapValue!26342 () ValueCell!7808)

(declare-datatypes ((array!49180 0))(
  ( (array!49181 (arr!23621 (Array (_ BitVec 32) ValueCell!7808)) (size!24061 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49180)

(declare-fun mapKey!26342 () (_ BitVec 32))

(assert (=> mapNonEmpty!26342 (= (arr!23621 _values!688) (store mapRest!26342 mapKey!26342 mapValue!26342))))

(declare-fun res!582563 () Bool)

(assert (=> start!73444 (=> (not res!582563) (not e!477973))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49182 0))(
  ( (array!49183 (arr!23622 (Array (_ BitVec 32) (_ BitVec 64))) (size!24062 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49182)

(assert (=> start!73444 (= res!582563 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24062 _keys!868))))))

(assert (=> start!73444 e!477973))

(declare-fun tp_is_empty!16495 () Bool)

(assert (=> start!73444 tp_is_empty!16495))

(assert (=> start!73444 true))

(assert (=> start!73444 tp!50581))

(declare-fun array_inv!18706 (array!49182) Bool)

(assert (=> start!73444 (array_inv!18706 _keys!868)))

(declare-fun e!477971 () Bool)

(declare-fun array_inv!18707 (array!49180) Bool)

(assert (=> start!73444 (and (array_inv!18707 _values!688) e!477971)))

(declare-fun b!857587 () Bool)

(declare-fun res!582559 () Bool)

(assert (=> b!857587 (=> (not res!582559) (not e!477973))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857587 (= res!582559 (validMask!0 mask!1196))))

(declare-fun b!857588 () Bool)

(declare-fun e!477975 () Bool)

(assert (=> b!857588 (= e!477975 tp_is_empty!16495)))

(declare-fun b!857589 () Bool)

(declare-fun res!582561 () Bool)

(assert (=> b!857589 (=> (not res!582561) (not e!477973))))

(declare-datatypes ((List!16751 0))(
  ( (Nil!16748) (Cons!16747 (h!17878 (_ BitVec 64)) (t!23392 List!16751)) )
))
(declare-fun arrayNoDuplicates!0 (array!49182 (_ BitVec 32) List!16751) Bool)

(assert (=> b!857589 (= res!582561 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16748))))

(declare-fun b!857590 () Bool)

(assert (=> b!857590 (= e!477971 (and e!477975 mapRes!26342))))

(declare-fun condMapEmpty!26342 () Bool)

(declare-fun mapDefault!26342 () ValueCell!7808)

