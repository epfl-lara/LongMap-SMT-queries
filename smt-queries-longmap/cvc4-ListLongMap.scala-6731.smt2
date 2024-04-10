; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84362 () Bool)

(assert start!84362)

(declare-fun mapNonEmpty!36776 () Bool)

(declare-fun mapRes!36776 () Bool)

(declare-fun tp!69631 () Bool)

(declare-fun e!556448 () Bool)

(assert (=> mapNonEmpty!36776 (= mapRes!36776 (and tp!69631 e!556448))))

(declare-datatypes ((V!35869 0))(
  ( (V!35870 (val!11633 Int)) )
))
(declare-datatypes ((ValueCell!11101 0))(
  ( (ValueCellFull!11101 (v!14195 V!35869)) (EmptyCell!11101) )
))
(declare-datatypes ((array!62291 0))(
  ( (array!62292 (arr!30003 (Array (_ BitVec 32) ValueCell!11101)) (size!30482 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62291)

(declare-fun mapKey!36776 () (_ BitVec 32))

(declare-fun mapValue!36776 () ValueCell!11101)

(declare-fun mapRest!36776 () (Array (_ BitVec 32) ValueCell!11101))

(assert (=> mapNonEmpty!36776 (= (arr!30003 _values!1278) (store mapRest!36776 mapKey!36776 mapValue!36776))))

(declare-fun mapIsEmpty!36776 () Bool)

(assert (=> mapIsEmpty!36776 mapRes!36776))

(declare-fun b!986782 () Bool)

(declare-fun res!660177 () Bool)

(declare-fun e!556451 () Bool)

(assert (=> b!986782 (=> (not res!660177) (not e!556451))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62293 0))(
  ( (array!62294 (arr!30004 (Array (_ BitVec 32) (_ BitVec 64))) (size!30483 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62293)

(assert (=> b!986782 (= res!660177 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30483 _keys!1544))))))

(declare-fun b!986783 () Bool)

(declare-fun e!556449 () Bool)

(declare-fun e!556452 () Bool)

(assert (=> b!986783 (= e!556449 (and e!556452 mapRes!36776))))

(declare-fun condMapEmpty!36776 () Bool)

(declare-fun mapDefault!36776 () ValueCell!11101)

