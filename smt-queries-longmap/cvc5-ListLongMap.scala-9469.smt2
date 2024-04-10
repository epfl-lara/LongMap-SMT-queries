; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112422 () Bool)

(assert start!112422)

(declare-fun b_free!30817 () Bool)

(declare-fun b_next!30817 () Bool)

(assert (=> start!112422 (= b_free!30817 (not b_next!30817))))

(declare-fun tp!108087 () Bool)

(declare-fun b_and!49659 () Bool)

(assert (=> start!112422 (= tp!108087 b_and!49659)))

(declare-fun b!1332867 () Bool)

(declare-fun res!884502 () Bool)

(declare-fun e!759329 () Bool)

(assert (=> b!1332867 (=> (not res!884502) (not e!759329))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90330 0))(
  ( (array!90331 (arr!43631 (Array (_ BitVec 32) (_ BitVec 64))) (size!44181 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90330)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332867 (= res!884502 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44181 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332868 () Bool)

(declare-fun res!884499 () Bool)

(assert (=> b!1332868 (=> (not res!884499) (not e!759329))))

(declare-datatypes ((List!30908 0))(
  ( (Nil!30905) (Cons!30904 (h!32113 (_ BitVec 64)) (t!45106 List!30908)) )
))
(declare-fun arrayNoDuplicates!0 (array!90330 (_ BitVec 32) List!30908) Bool)

(assert (=> b!1332868 (= res!884499 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30905))))

(declare-fun b!1332869 () Bool)

(declare-fun e!759327 () Bool)

(declare-fun e!759331 () Bool)

(declare-fun mapRes!56764 () Bool)

(assert (=> b!1332869 (= e!759327 (and e!759331 mapRes!56764))))

(declare-fun condMapEmpty!56764 () Bool)

(declare-datatypes ((V!54073 0))(
  ( (V!54074 (val!18438 Int)) )
))
(declare-datatypes ((ValueCell!17465 0))(
  ( (ValueCellFull!17465 (v!21075 V!54073)) (EmptyCell!17465) )
))
(declare-datatypes ((array!90332 0))(
  ( (array!90333 (arr!43632 (Array (_ BitVec 32) ValueCell!17465)) (size!44182 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90332)

(declare-fun mapDefault!56764 () ValueCell!17465)

