; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84520 () Bool)

(assert start!84520)

(declare-fun b_free!20015 () Bool)

(declare-fun b_next!20015 () Bool)

(assert (=> start!84520 (= b_free!20015 (not b_next!20015))))

(declare-fun tp!69829 () Bool)

(declare-fun b_and!32109 () Bool)

(assert (=> start!84520 (= tp!69829 b_and!32109)))

(declare-fun b!988552 () Bool)

(declare-fun res!661177 () Bool)

(declare-fun e!557433 () Bool)

(assert (=> b!988552 (=> (not res!661177) (not e!557433))))

(declare-datatypes ((array!62421 0))(
  ( (array!62422 (arr!30065 (Array (_ BitVec 32) (_ BitVec 64))) (size!30544 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62421)

(declare-datatypes ((List!20795 0))(
  ( (Nil!20792) (Cons!20791 (h!21953 (_ BitVec 64)) (t!29732 List!20795)) )
))
(declare-fun arrayNoDuplicates!0 (array!62421 (_ BitVec 32) List!20795) Bool)

(assert (=> b!988552 (= res!661177 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20792))))

(declare-fun mapIsEmpty!36885 () Bool)

(declare-fun mapRes!36885 () Bool)

(assert (=> mapIsEmpty!36885 mapRes!36885))

(declare-fun mapNonEmpty!36885 () Bool)

(declare-fun tp!69830 () Bool)

(declare-fun e!557434 () Bool)

(assert (=> mapNonEmpty!36885 (= mapRes!36885 (and tp!69830 e!557434))))

(declare-datatypes ((V!35957 0))(
  ( (V!35958 (val!11666 Int)) )
))
(declare-datatypes ((ValueCell!11134 0))(
  ( (ValueCellFull!11134 (v!14233 V!35957)) (EmptyCell!11134) )
))
(declare-fun mapValue!36885 () ValueCell!11134)

(declare-datatypes ((array!62423 0))(
  ( (array!62424 (arr!30066 (Array (_ BitVec 32) ValueCell!11134)) (size!30545 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62423)

(declare-fun mapRest!36885 () (Array (_ BitVec 32) ValueCell!11134))

(declare-fun mapKey!36885 () (_ BitVec 32))

(assert (=> mapNonEmpty!36885 (= (arr!30066 _values!1278) (store mapRest!36885 mapKey!36885 mapValue!36885))))

(declare-fun b!988554 () Bool)

(declare-fun res!661181 () Bool)

(assert (=> b!988554 (=> (not res!661181) (not e!557433))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988554 (= res!661181 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988555 () Bool)

(declare-fun tp_is_empty!23231 () Bool)

(assert (=> b!988555 (= e!557434 tp_is_empty!23231)))

(declare-fun b!988556 () Bool)

(declare-fun res!661179 () Bool)

(assert (=> b!988556 (=> (not res!661179) (not e!557433))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62421 (_ BitVec 32)) Bool)

(assert (=> b!988556 (= res!661179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988557 () Bool)

(declare-fun e!557431 () Bool)

(declare-fun e!557432 () Bool)

(assert (=> b!988557 (= e!557431 (and e!557432 mapRes!36885))))

(declare-fun condMapEmpty!36885 () Bool)

(declare-fun mapDefault!36885 () ValueCell!11134)

