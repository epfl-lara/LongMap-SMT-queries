; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112670 () Bool)

(assert start!112670)

(declare-fun b_free!31007 () Bool)

(declare-fun b_next!31007 () Bool)

(assert (=> start!112670 (= b_free!31007 (not b_next!31007))))

(declare-fun tp!108661 () Bool)

(declare-fun b_and!49951 () Bool)

(assert (=> start!112670 (= tp!108661 b_and!49951)))

(declare-fun b!1336443 () Bool)

(declare-fun res!886910 () Bool)

(declare-fun e!761079 () Bool)

(assert (=> b!1336443 (=> (not res!886910) (not e!761079))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90694 0))(
  ( (array!90695 (arr!43812 (Array (_ BitVec 32) (_ BitVec 64))) (size!44362 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90694)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336443 (= res!886910 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44362 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336444 () Bool)

(declare-fun e!761080 () Bool)

(declare-fun tp_is_empty!36917 () Bool)

(assert (=> b!1336444 (= e!761080 tp_is_empty!36917)))

(declare-fun b!1336445 () Bool)

(declare-fun res!886913 () Bool)

(assert (=> b!1336445 (=> (not res!886913) (not e!761079))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90694 (_ BitVec 32)) Bool)

(assert (=> b!1336445 (= res!886913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!57053 () Bool)

(declare-fun mapRes!57053 () Bool)

(declare-fun tp!108662 () Bool)

(declare-fun e!761078 () Bool)

(assert (=> mapNonEmpty!57053 (= mapRes!57053 (and tp!108662 e!761078))))

(declare-datatypes ((V!54325 0))(
  ( (V!54326 (val!18533 Int)) )
))
(declare-datatypes ((ValueCell!17560 0))(
  ( (ValueCellFull!17560 (v!21173 V!54325)) (EmptyCell!17560) )
))
(declare-fun mapRest!57053 () (Array (_ BitVec 32) ValueCell!17560))

(declare-fun mapKey!57053 () (_ BitVec 32))

(declare-datatypes ((array!90696 0))(
  ( (array!90697 (arr!43813 (Array (_ BitVec 32) ValueCell!17560)) (size!44363 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90696)

(declare-fun mapValue!57053 () ValueCell!17560)

(assert (=> mapNonEmpty!57053 (= (arr!43813 _values!1320) (store mapRest!57053 mapKey!57053 mapValue!57053))))

(declare-fun b!1336446 () Bool)

(declare-fun res!886916 () Bool)

(assert (=> b!1336446 (=> (not res!886916) (not e!761079))))

(assert (=> b!1336446 (= res!886916 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336447 () Bool)

(declare-fun e!761076 () Bool)

(assert (=> b!1336447 (= e!761076 (and e!761080 mapRes!57053))))

(declare-fun condMapEmpty!57053 () Bool)

(declare-fun mapDefault!57053 () ValueCell!17560)

