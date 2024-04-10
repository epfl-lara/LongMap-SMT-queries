; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73304 () Bool)

(assert start!73304)

(declare-fun b_free!14219 () Bool)

(declare-fun b_next!14219 () Bool)

(assert (=> start!73304 (= b_free!14219 (not b_next!14219))))

(declare-fun tp!50161 () Bool)

(declare-fun b_and!23575 () Bool)

(assert (=> start!73304 (= tp!50161 b_and!23575)))

(declare-fun res!580741 () Bool)

(declare-fun e!476786 () Bool)

(assert (=> start!73304 (=> (not res!580741) (not e!476786))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48906 0))(
  ( (array!48907 (arr!23484 (Array (_ BitVec 32) (_ BitVec 64))) (size!23924 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48906)

(assert (=> start!73304 (= res!580741 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23924 _keys!868))))))

(assert (=> start!73304 e!476786))

(declare-fun tp_is_empty!16355 () Bool)

(assert (=> start!73304 tp_is_empty!16355))

(assert (=> start!73304 true))

(assert (=> start!73304 tp!50161))

(declare-fun array_inv!18608 (array!48906) Bool)

(assert (=> start!73304 (array_inv!18608 _keys!868)))

(declare-datatypes ((V!26853 0))(
  ( (V!26854 (val!8225 Int)) )
))
(declare-datatypes ((ValueCell!7738 0))(
  ( (ValueCellFull!7738 (v!10650 V!26853)) (EmptyCell!7738) )
))
(declare-datatypes ((array!48908 0))(
  ( (array!48909 (arr!23485 (Array (_ BitVec 32) ValueCell!7738)) (size!23925 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48908)

(declare-fun e!476788 () Bool)

(declare-fun array_inv!18609 (array!48908) Bool)

(assert (=> start!73304 (and (array_inv!18609 _values!688) e!476788)))

(declare-fun b!855139 () Bool)

(declare-fun e!476787 () Bool)

(assert (=> b!855139 (= e!476787 tp_is_empty!16355)))

(declare-fun b!855140 () Bool)

(declare-fun res!580745 () Bool)

(assert (=> b!855140 (=> (not res!580745) (not e!476786))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855140 (= res!580745 (validKeyInArray!0 k!854))))

(declare-fun b!855141 () Bool)

(declare-fun res!580743 () Bool)

(assert (=> b!855141 (=> (not res!580743) (not e!476786))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!855141 (= res!580743 (and (= (size!23925 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23924 _keys!868) (size!23925 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855142 () Bool)

(declare-fun res!580740 () Bool)

(assert (=> b!855142 (=> (not res!580740) (not e!476786))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855142 (= res!580740 (and (= (select (arr!23484 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855143 () Bool)

(declare-fun e!476785 () Bool)

(assert (=> b!855143 (= e!476785 tp_is_empty!16355)))

(declare-fun b!855144 () Bool)

(assert (=> b!855144 (= e!476786 false)))

(declare-fun v!557 () V!26853)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10836 0))(
  ( (tuple2!10837 (_1!5429 (_ BitVec 64)) (_2!5429 V!26853)) )
))
(declare-datatypes ((List!16650 0))(
  ( (Nil!16647) (Cons!16646 (h!17777 tuple2!10836) (t!23291 List!16650)) )
))
(declare-datatypes ((ListLongMap!9605 0))(
  ( (ListLongMap!9606 (toList!4818 List!16650)) )
))
(declare-fun lt!385645 () ListLongMap!9605)

(declare-fun minValue!654 () V!26853)

(declare-fun zeroValue!654 () V!26853)

(declare-fun getCurrentListMapNoExtraKeys!2799 (array!48906 array!48908 (_ BitVec 32) (_ BitVec 32) V!26853 V!26853 (_ BitVec 32) Int) ListLongMap!9605)

(assert (=> b!855144 (= lt!385645 (getCurrentListMapNoExtraKeys!2799 _keys!868 (array!48909 (store (arr!23485 _values!688) i!612 (ValueCellFull!7738 v!557)) (size!23925 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385644 () ListLongMap!9605)

(assert (=> b!855144 (= lt!385644 (getCurrentListMapNoExtraKeys!2799 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855145 () Bool)

(declare-fun res!580738 () Bool)

(assert (=> b!855145 (=> (not res!580738) (not e!476786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48906 (_ BitVec 32)) Bool)

(assert (=> b!855145 (= res!580738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855146 () Bool)

(declare-fun mapRes!26132 () Bool)

(assert (=> b!855146 (= e!476788 (and e!476787 mapRes!26132))))

(declare-fun condMapEmpty!26132 () Bool)

(declare-fun mapDefault!26132 () ValueCell!7738)

