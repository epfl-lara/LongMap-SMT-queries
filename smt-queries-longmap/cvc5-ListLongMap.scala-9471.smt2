; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112434 () Bool)

(assert start!112434)

(declare-fun b_free!30829 () Bool)

(declare-fun b_next!30829 () Bool)

(assert (=> start!112434 (= b_free!30829 (not b_next!30829))))

(declare-fun tp!108123 () Bool)

(declare-fun b_and!49671 () Bool)

(assert (=> start!112434 (= tp!108123 b_and!49671)))

(declare-fun mapNonEmpty!56782 () Bool)

(declare-fun mapRes!56782 () Bool)

(declare-fun tp!108124 () Bool)

(declare-fun e!759420 () Bool)

(assert (=> mapNonEmpty!56782 (= mapRes!56782 (and tp!108124 e!759420))))

(declare-datatypes ((V!54089 0))(
  ( (V!54090 (val!18444 Int)) )
))
(declare-datatypes ((ValueCell!17471 0))(
  ( (ValueCellFull!17471 (v!21081 V!54089)) (EmptyCell!17471) )
))
(declare-datatypes ((array!90352 0))(
  ( (array!90353 (arr!43642 (Array (_ BitVec 32) ValueCell!17471)) (size!44192 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90352)

(declare-fun mapKey!56782 () (_ BitVec 32))

(declare-fun mapRest!56782 () (Array (_ BitVec 32) ValueCell!17471))

(declare-fun mapValue!56782 () ValueCell!17471)

(assert (=> mapNonEmpty!56782 (= (arr!43642 _values!1320) (store mapRest!56782 mapKey!56782 mapValue!56782))))

(declare-fun b!1333011 () Bool)

(declare-fun res!884591 () Bool)

(declare-fun e!759418 () Bool)

(assert (=> b!1333011 (=> (not res!884591) (not e!759418))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90354 0))(
  ( (array!90355 (arr!43643 (Array (_ BitVec 32) (_ BitVec 64))) (size!44193 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90354)

(assert (=> b!1333011 (= res!884591 (and (= (size!44192 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44193 _keys!1590) (size!44192 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333012 () Bool)

(declare-fun tp_is_empty!36739 () Bool)

(assert (=> b!1333012 (= e!759420 tp_is_empty!36739)))

(declare-fun b!1333013 () Bool)

(declare-fun res!884590 () Bool)

(assert (=> b!1333013 (=> (not res!884590) (not e!759418))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333013 (= res!884590 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44193 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333014 () Bool)

(declare-fun e!759417 () Bool)

(declare-fun e!759419 () Bool)

(assert (=> b!1333014 (= e!759417 (and e!759419 mapRes!56782))))

(declare-fun condMapEmpty!56782 () Bool)

(declare-fun mapDefault!56782 () ValueCell!17471)

