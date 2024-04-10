; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84386 () Bool)

(assert start!84386)

(declare-fun b_free!19973 () Bool)

(declare-fun b_next!19973 () Bool)

(assert (=> start!84386 (= b_free!19973 (not b_next!19973))))

(declare-fun tp!69693 () Bool)

(declare-fun b_and!32007 () Bool)

(assert (=> start!84386 (= tp!69693 b_and!32007)))

(declare-fun b!987105 () Bool)

(declare-fun res!660389 () Bool)

(declare-fun e!556632 () Bool)

(assert (=> b!987105 (=> (not res!660389) (not e!556632))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987105 (= res!660389 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987106 () Bool)

(declare-fun res!660394 () Bool)

(assert (=> b!987106 (=> (not res!660394) (not e!556632))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35901 0))(
  ( (V!35902 (val!11645 Int)) )
))
(declare-datatypes ((ValueCell!11113 0))(
  ( (ValueCellFull!11113 (v!14207 V!35901)) (EmptyCell!11113) )
))
(declare-datatypes ((array!62333 0))(
  ( (array!62334 (arr!30024 (Array (_ BitVec 32) ValueCell!11113)) (size!30503 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62333)

(declare-datatypes ((array!62335 0))(
  ( (array!62336 (arr!30025 (Array (_ BitVec 32) (_ BitVec 64))) (size!30504 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62335)

(assert (=> b!987106 (= res!660394 (and (= (size!30503 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30504 _keys!1544) (size!30503 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987107 () Bool)

(declare-fun e!556631 () Bool)

(declare-fun e!556629 () Bool)

(declare-fun mapRes!36812 () Bool)

(assert (=> b!987107 (= e!556631 (and e!556629 mapRes!36812))))

(declare-fun condMapEmpty!36812 () Bool)

(declare-fun mapDefault!36812 () ValueCell!11113)

