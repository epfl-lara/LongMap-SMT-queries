; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112408 () Bool)

(assert start!112408)

(declare-fun b_free!30803 () Bool)

(declare-fun b_next!30803 () Bool)

(assert (=> start!112408 (= b_free!30803 (not b_next!30803))))

(declare-fun tp!108046 () Bool)

(declare-fun b_and!49645 () Bool)

(assert (=> start!112408 (= tp!108046 b_and!49645)))

(declare-fun b!1332699 () Bool)

(declare-fun res!884393 () Bool)

(declare-fun e!759222 () Bool)

(assert (=> b!1332699 (=> (not res!884393) (not e!759222))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90302 0))(
  ( (array!90303 (arr!43617 (Array (_ BitVec 32) (_ BitVec 64))) (size!44167 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90302)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332699 (= res!884393 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44167 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332700 () Bool)

(declare-fun e!759224 () Bool)

(declare-fun tp_is_empty!36713 () Bool)

(assert (=> b!1332700 (= e!759224 tp_is_empty!36713)))

(declare-fun b!1332701 () Bool)

(declare-fun res!884397 () Bool)

(assert (=> b!1332701 (=> (not res!884397) (not e!759222))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90302 (_ BitVec 32)) Bool)

(assert (=> b!1332701 (= res!884397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332702 () Bool)

(declare-fun e!759225 () Bool)

(declare-fun e!759223 () Bool)

(declare-fun mapRes!56743 () Bool)

(assert (=> b!1332702 (= e!759225 (and e!759223 mapRes!56743))))

(declare-fun condMapEmpty!56743 () Bool)

(declare-datatypes ((V!54053 0))(
  ( (V!54054 (val!18431 Int)) )
))
(declare-datatypes ((ValueCell!17458 0))(
  ( (ValueCellFull!17458 (v!21068 V!54053)) (EmptyCell!17458) )
))
(declare-datatypes ((array!90304 0))(
  ( (array!90305 (arr!43618 (Array (_ BitVec 32) ValueCell!17458)) (size!44168 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90304)

(declare-fun mapDefault!56743 () ValueCell!17458)

