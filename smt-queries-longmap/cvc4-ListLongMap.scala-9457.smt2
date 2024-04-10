; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112354 () Bool)

(assert start!112354)

(declare-fun b_free!30749 () Bool)

(declare-fun b_next!30749 () Bool)

(assert (=> start!112354 (= b_free!30749 (not b_next!30749))))

(declare-fun tp!107884 () Bool)

(declare-fun b_and!49553 () Bool)

(assert (=> start!112354 (= tp!107884 b_and!49553)))

(declare-fun b!1331793 () Bool)

(declare-fun res!883774 () Bool)

(declare-fun e!758820 () Bool)

(assert (=> b!1331793 (=> (not res!883774) (not e!758820))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90198 0))(
  ( (array!90199 (arr!43565 (Array (_ BitVec 32) (_ BitVec 64))) (size!44115 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90198)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331793 (= res!883774 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44115 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!883775 () Bool)

(assert (=> start!112354 (=> (not res!883775) (not e!758820))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112354 (= res!883775 (validMask!0 mask!1998))))

(assert (=> start!112354 e!758820))

(declare-datatypes ((V!53981 0))(
  ( (V!53982 (val!18404 Int)) )
))
(declare-datatypes ((ValueCell!17431 0))(
  ( (ValueCellFull!17431 (v!21041 V!53981)) (EmptyCell!17431) )
))
(declare-datatypes ((array!90200 0))(
  ( (array!90201 (arr!43566 (Array (_ BitVec 32) ValueCell!17431)) (size!44116 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90200)

(declare-fun e!758821 () Bool)

(declare-fun array_inv!32861 (array!90200) Bool)

(assert (=> start!112354 (and (array_inv!32861 _values!1320) e!758821)))

(assert (=> start!112354 true))

(declare-fun array_inv!32862 (array!90198) Bool)

(assert (=> start!112354 (array_inv!32862 _keys!1590)))

(assert (=> start!112354 tp!107884))

(declare-fun tp_is_empty!36659 () Bool)

(assert (=> start!112354 tp_is_empty!36659))

(declare-fun b!1331794 () Bool)

(declare-fun e!758818 () Bool)

(assert (=> b!1331794 (= e!758818 tp_is_empty!36659)))

(declare-fun b!1331795 () Bool)

(declare-fun res!883768 () Bool)

(assert (=> b!1331795 (=> (not res!883768) (not e!758820))))

(assert (=> b!1331795 (= res!883768 (not (= (select (arr!43565 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331796 () Bool)

(declare-fun mapRes!56662 () Bool)

(assert (=> b!1331796 (= e!758821 (and e!758818 mapRes!56662))))

(declare-fun condMapEmpty!56662 () Bool)

(declare-fun mapDefault!56662 () ValueCell!17431)

