; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84452 () Bool)

(assert start!84452)

(declare-fun b_free!20003 () Bool)

(declare-fun b_next!20003 () Bool)

(assert (=> start!84452 (= b_free!20003 (not b_next!20003))))

(declare-fun tp!69790 () Bool)

(declare-fun b_and!32073 () Bool)

(assert (=> start!84452 (= tp!69790 b_and!32073)))

(declare-fun b!987770 () Bool)

(declare-fun res!660798 () Bool)

(declare-fun e!556983 () Bool)

(assert (=> b!987770 (=> (not res!660798) (not e!556983))))

(declare-datatypes ((array!62397 0))(
  ( (array!62398 (arr!30054 (Array (_ BitVec 32) (_ BitVec 64))) (size!30533 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62397)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62397 (_ BitVec 32)) Bool)

(assert (=> b!987770 (= res!660798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660800 () Bool)

(assert (=> start!84452 (=> (not res!660800) (not e!556983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84452 (= res!660800 (validMask!0 mask!1948))))

(assert (=> start!84452 e!556983))

(assert (=> start!84452 true))

(declare-fun tp_is_empty!23219 () Bool)

(assert (=> start!84452 tp_is_empty!23219))

(declare-datatypes ((V!35941 0))(
  ( (V!35942 (val!11660 Int)) )
))
(declare-datatypes ((ValueCell!11128 0))(
  ( (ValueCellFull!11128 (v!14224 V!35941)) (EmptyCell!11128) )
))
(declare-datatypes ((array!62399 0))(
  ( (array!62400 (arr!30055 (Array (_ BitVec 32) ValueCell!11128)) (size!30534 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62399)

(declare-fun e!556982 () Bool)

(declare-fun array_inv!23223 (array!62399) Bool)

(assert (=> start!84452 (and (array_inv!23223 _values!1278) e!556982)))

(assert (=> start!84452 tp!69790))

(declare-fun array_inv!23224 (array!62397) Bool)

(assert (=> start!84452 (array_inv!23224 _keys!1544)))

(declare-fun b!987771 () Bool)

(declare-fun e!556984 () Bool)

(assert (=> b!987771 (= e!556984 tp_is_empty!23219)))

(declare-fun b!987772 () Bool)

(declare-fun e!556979 () Bool)

(declare-fun mapRes!36863 () Bool)

(assert (=> b!987772 (= e!556982 (and e!556979 mapRes!36863))))

(declare-fun condMapEmpty!36863 () Bool)

(declare-fun mapDefault!36863 () ValueCell!11128)

