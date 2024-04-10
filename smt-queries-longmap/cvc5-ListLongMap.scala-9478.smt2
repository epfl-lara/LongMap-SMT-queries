; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112476 () Bool)

(assert start!112476)

(declare-fun b_free!30871 () Bool)

(declare-fun b_next!30871 () Bool)

(assert (=> start!112476 (= b_free!30871 (not b_next!30871))))

(declare-fun tp!108250 () Bool)

(declare-fun b_and!49743 () Bool)

(assert (=> start!112476 (= tp!108250 b_and!49743)))

(declare-fun b!1333818 () Bool)

(declare-fun res!885177 () Bool)

(declare-fun e!759766 () Bool)

(assert (=> b!1333818 (=> (not res!885177) (not e!759766))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333818 (= res!885177 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333819 () Bool)

(declare-fun e!759764 () Bool)

(declare-fun tp_is_empty!36781 () Bool)

(assert (=> b!1333819 (= e!759764 tp_is_empty!36781)))

(declare-fun b!1333821 () Bool)

(declare-fun e!759763 () Bool)

(declare-fun e!759762 () Bool)

(declare-fun mapRes!56845 () Bool)

(assert (=> b!1333821 (= e!759763 (and e!759762 mapRes!56845))))

(declare-fun condMapEmpty!56845 () Bool)

(declare-datatypes ((V!54145 0))(
  ( (V!54146 (val!18465 Int)) )
))
(declare-datatypes ((ValueCell!17492 0))(
  ( (ValueCellFull!17492 (v!21102 V!54145)) (EmptyCell!17492) )
))
(declare-datatypes ((array!90430 0))(
  ( (array!90431 (arr!43681 (Array (_ BitVec 32) ValueCell!17492)) (size!44231 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90430)

(declare-fun mapDefault!56845 () ValueCell!17492)

