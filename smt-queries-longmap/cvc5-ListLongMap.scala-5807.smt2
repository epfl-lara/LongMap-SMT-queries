; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74914 () Bool)

(assert start!74914)

(declare-fun b_free!15433 () Bool)

(declare-fun b_next!15433 () Bool)

(assert (=> start!74914 (= b_free!15433 (not b_next!15433))))

(declare-fun tp!54001 () Bool)

(declare-fun b_and!25565 () Bool)

(assert (=> start!74914 (= tp!54001 b_and!25565)))

(declare-fun b!883367 () Bool)

(declare-fun res!600145 () Bool)

(declare-fun e!491629 () Bool)

(assert (=> b!883367 (=> (not res!600145) (not e!491629))))

(declare-datatypes ((array!51480 0))(
  ( (array!51481 (arr!24759 (Array (_ BitVec 32) (_ BitVec 64))) (size!25199 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51480)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51480 (_ BitVec 32)) Bool)

(assert (=> b!883367 (= res!600145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun e!491630 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!883368 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883368 (= e!491630 (not (= (select (arr!24759 _keys!868) from!1053) k!854)))))

(declare-datatypes ((Unit!30133 0))(
  ( (Unit!30134) )
))
(declare-fun lt!399803 () Unit!30133)

(declare-fun e!491632 () Unit!30133)

(assert (=> b!883368 (= lt!399803 e!491632)))

(declare-fun c!93055 () Bool)

(assert (=> b!883368 (= c!93055 (= (select (arr!24759 _keys!868) from!1053) k!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28617 0))(
  ( (V!28618 (val!8886 Int)) )
))
(declare-datatypes ((tuple2!11774 0))(
  ( (tuple2!11775 (_1!5898 (_ BitVec 64)) (_2!5898 V!28617)) )
))
(declare-datatypes ((List!17583 0))(
  ( (Nil!17580) (Cons!17579 (h!18710 tuple2!11774) (t!24818 List!17583)) )
))
(declare-datatypes ((ListLongMap!10543 0))(
  ( (ListLongMap!10544 (toList!5287 List!17583)) )
))
(declare-fun lt!399793 () ListLongMap!10543)

(declare-fun lt!399801 () ListLongMap!10543)

(declare-datatypes ((ValueCell!8399 0))(
  ( (ValueCellFull!8399 (v!11355 V!28617)) (EmptyCell!8399) )
))
(declare-datatypes ((array!51482 0))(
  ( (array!51483 (arr!24760 (Array (_ BitVec 32) ValueCell!8399)) (size!25200 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51482)

(declare-fun +!2556 (ListLongMap!10543 tuple2!11774) ListLongMap!10543)

(declare-fun get!13046 (ValueCell!8399 V!28617) V!28617)

(declare-fun dynLambda!1269 (Int (_ BitVec 64)) V!28617)

(assert (=> b!883368 (= lt!399801 (+!2556 lt!399793 (tuple2!11775 (select (arr!24759 _keys!868) from!1053) (get!13046 (select (arr!24760 _values!688) from!1053) (dynLambda!1269 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!28152 () Bool)

(declare-fun mapRes!28152 () Bool)

(declare-fun tp!54002 () Bool)

(declare-fun e!491633 () Bool)

(assert (=> mapNonEmpty!28152 (= mapRes!28152 (and tp!54002 e!491633))))

(declare-fun mapRest!28152 () (Array (_ BitVec 32) ValueCell!8399))

(declare-fun mapKey!28152 () (_ BitVec 32))

(declare-fun mapValue!28152 () ValueCell!8399)

(assert (=> mapNonEmpty!28152 (= (arr!24760 _values!688) (store mapRest!28152 mapKey!28152 mapValue!28152))))

(declare-fun b!883369 () Bool)

(declare-fun e!491631 () Bool)

(declare-fun e!491627 () Bool)

(assert (=> b!883369 (= e!491631 (and e!491627 mapRes!28152))))

(declare-fun condMapEmpty!28152 () Bool)

(declare-fun mapDefault!28152 () ValueCell!8399)

