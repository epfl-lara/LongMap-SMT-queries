; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84346 () Bool)

(assert start!84346)

(declare-fun b!986615 () Bool)

(declare-fun res!660080 () Bool)

(declare-fun e!556330 () Bool)

(assert (=> b!986615 (=> (not res!660080) (not e!556330))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35849 0))(
  ( (V!35850 (val!11625 Int)) )
))
(declare-datatypes ((ValueCell!11093 0))(
  ( (ValueCellFull!11093 (v!14187 V!35849)) (EmptyCell!11093) )
))
(declare-datatypes ((array!62259 0))(
  ( (array!62260 (arr!29987 (Array (_ BitVec 32) ValueCell!11093)) (size!30466 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62259)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62261 0))(
  ( (array!62262 (arr!29988 (Array (_ BitVec 32) (_ BitVec 64))) (size!30467 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62261)

(assert (=> b!986615 (= res!660080 (and (= (size!30466 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30467 _keys!1544) (size!30466 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986616 () Bool)

(declare-fun e!556329 () Bool)

(declare-fun tp_is_empty!23149 () Bool)

(assert (=> b!986616 (= e!556329 tp_is_empty!23149)))

(declare-fun mapNonEmpty!36752 () Bool)

(declare-fun mapRes!36752 () Bool)

(declare-fun tp!69607 () Bool)

(declare-fun e!556328 () Bool)

(assert (=> mapNonEmpty!36752 (= mapRes!36752 (and tp!69607 e!556328))))

(declare-fun mapValue!36752 () ValueCell!11093)

(declare-fun mapKey!36752 () (_ BitVec 32))

(declare-fun mapRest!36752 () (Array (_ BitVec 32) ValueCell!11093))

(assert (=> mapNonEmpty!36752 (= (arr!29987 _values!1278) (store mapRest!36752 mapKey!36752 mapValue!36752))))

(declare-fun b!986617 () Bool)

(declare-fun e!556332 () Bool)

(assert (=> b!986617 (= e!556332 (and e!556329 mapRes!36752))))

(declare-fun condMapEmpty!36752 () Bool)

(declare-fun mapDefault!36752 () ValueCell!11093)

