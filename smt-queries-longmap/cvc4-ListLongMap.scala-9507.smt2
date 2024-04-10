; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112738 () Bool)

(assert start!112738)

(declare-fun b_free!31049 () Bool)

(declare-fun b_next!31049 () Bool)

(assert (=> start!112738 (= b_free!31049 (not b_next!31049))))

(declare-fun tp!108791 () Bool)

(declare-fun b_and!50031 () Bool)

(assert (=> start!112738 (= tp!108791 b_and!50031)))

(declare-fun mapIsEmpty!57119 () Bool)

(declare-fun mapRes!57119 () Bool)

(assert (=> mapIsEmpty!57119 mapRes!57119))

(declare-fun b!1337375 () Bool)

(declare-fun res!887508 () Bool)

(declare-fun e!761513 () Bool)

(assert (=> b!1337375 (=> (not res!887508) (not e!761513))))

(declare-datatypes ((array!90774 0))(
  ( (array!90775 (arr!43851 (Array (_ BitVec 32) (_ BitVec 64))) (size!44401 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90774)

(declare-datatypes ((List!31076 0))(
  ( (Nil!31073) (Cons!31072 (h!32281 (_ BitVec 64)) (t!45394 List!31076)) )
))
(declare-fun arrayNoDuplicates!0 (array!90774 (_ BitVec 32) List!31076) Bool)

(assert (=> b!1337375 (= res!887508 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31073))))

(declare-datatypes ((V!54381 0))(
  ( (V!54382 (val!18554 Int)) )
))
(declare-datatypes ((ValueCell!17581 0))(
  ( (ValueCellFull!17581 (v!21195 V!54381)) (EmptyCell!17581) )
))
(declare-datatypes ((array!90776 0))(
  ( (array!90777 (arr!43852 (Array (_ BitVec 32) ValueCell!17581)) (size!44402 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90776)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun b!1337377 () Bool)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54381)

(declare-fun zeroValue!1262 () V!54381)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23934 0))(
  ( (tuple2!23935 (_1!11978 (_ BitVec 64)) (_2!11978 V!54381)) )
))
(declare-datatypes ((List!31077 0))(
  ( (Nil!31074) (Cons!31073 (h!32282 tuple2!23934) (t!45395 List!31077)) )
))
(declare-datatypes ((ListLongMap!21591 0))(
  ( (ListLongMap!21592 (toList!10811 List!31077)) )
))
(declare-fun contains!8978 (ListLongMap!21591 (_ BitVec 64)) Bool)

(declare-fun +!4747 (ListLongMap!21591 tuple2!23934) ListLongMap!21591)

(declare-fun getCurrentListMapNoExtraKeys!6389 (array!90774 array!90776 (_ BitVec 32) (_ BitVec 32) V!54381 V!54381 (_ BitVec 32) Int) ListLongMap!21591)

(declare-fun get!22130 (ValueCell!17581 V!54381) V!54381)

(declare-fun dynLambda!3686 (Int (_ BitVec 64)) V!54381)

(assert (=> b!1337377 (= e!761513 (not (contains!8978 (+!4747 (getCurrentListMapNoExtraKeys!6389 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23935 (select (arr!43851 _keys!1590) from!1980) (get!22130 (select (arr!43852 _values!1320) from!1980) (dynLambda!3686 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1153)))))

(declare-fun b!1337378 () Bool)

(declare-fun res!887511 () Bool)

(assert (=> b!1337378 (=> (not res!887511) (not e!761513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337378 (= res!887511 (validKeyInArray!0 (select (arr!43851 _keys!1590) from!1980)))))

(declare-fun b!1337379 () Bool)

(declare-fun e!761516 () Bool)

(declare-fun e!761514 () Bool)

(assert (=> b!1337379 (= e!761516 (and e!761514 mapRes!57119))))

(declare-fun condMapEmpty!57119 () Bool)

(declare-fun mapDefault!57119 () ValueCell!17581)

