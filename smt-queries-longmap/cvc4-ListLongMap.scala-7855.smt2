; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97878 () Bool)

(assert start!97878)

(declare-fun b_free!23579 () Bool)

(declare-fun b_next!23579 () Bool)

(assert (=> start!97878 (= b_free!23579 (not b_next!23579))))

(declare-fun tp!83441 () Bool)

(declare-fun b_and!37941 () Bool)

(assert (=> start!97878 (= tp!83441 b_and!37941)))

(declare-datatypes ((array!73099 0))(
  ( (array!73100 (arr!35202 (Array (_ BitVec 32) (_ BitVec 64))) (size!35738 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73099)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42605 0))(
  ( (V!42606 (val!14111 Int)) )
))
(declare-datatypes ((ValueCell!13345 0))(
  ( (ValueCellFull!13345 (v!16744 V!42605)) (EmptyCell!13345) )
))
(declare-datatypes ((array!73101 0))(
  ( (array!73102 (arr!35203 (Array (_ BitVec 32) ValueCell!13345)) (size!35739 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73101)

(declare-fun minValue!944 () V!42605)

(declare-fun bm!47016 () Bool)

(declare-datatypes ((tuple2!17706 0))(
  ( (tuple2!17707 (_1!8864 (_ BitVec 64)) (_2!8864 V!42605)) )
))
(declare-datatypes ((List!24491 0))(
  ( (Nil!24488) (Cons!24487 (h!25696 tuple2!17706) (t!35062 List!24491)) )
))
(declare-datatypes ((ListLongMap!15675 0))(
  ( (ListLongMap!15676 (toList!7853 List!24491)) )
))
(declare-fun call!47019 () ListLongMap!15675)

(declare-fun zeroValue!944 () V!42605)

(declare-fun getCurrentListMapNoExtraKeys!4343 (array!73099 array!73101 (_ BitVec 32) (_ BitVec 32) V!42605 V!42605 (_ BitVec 32) Int) ListLongMap!15675)

(assert (=> bm!47016 (= call!47019 (getCurrentListMapNoExtraKeys!4343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120686 () Bool)

(declare-fun e!638138 () Bool)

(declare-fun e!638132 () Bool)

(declare-fun mapRes!43981 () Bool)

(assert (=> b!1120686 (= e!638138 (and e!638132 mapRes!43981))))

(declare-fun condMapEmpty!43981 () Bool)

(declare-fun mapDefault!43981 () ValueCell!13345)

