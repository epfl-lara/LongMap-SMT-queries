; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131704 () Bool)

(assert start!131704)

(declare-fun res!1058421 () Bool)

(declare-fun e!858009 () Bool)

(assert (=> start!131704 (=> (not res!1058421) (not e!858009))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131704 (= res!1058421 (validMask!0 mask!926))))

(assert (=> start!131704 e!858009))

(assert (=> start!131704 true))

(declare-datatypes ((V!58701 0))(
  ( (V!58702 (val!18924 Int)) )
))
(declare-datatypes ((ValueCell!17936 0))(
  ( (ValueCellFull!17936 (v!21725 V!58701)) (EmptyCell!17936) )
))
(declare-datatypes ((array!102616 0))(
  ( (array!102617 (arr!49510 (Array (_ BitVec 32) ValueCell!17936)) (size!50060 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102616)

(declare-fun e!858006 () Bool)

(declare-fun array_inv!38521 (array!102616) Bool)

(assert (=> start!131704 (and (array_inv!38521 _values!470) e!858006)))

(declare-datatypes ((array!102618 0))(
  ( (array!102619 (arr!49511 (Array (_ BitVec 32) (_ BitVec 64))) (size!50061 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102618)

(declare-fun array_inv!38522 (array!102618) Bool)

(assert (=> start!131704 (array_inv!38522 _keys!618)))

(declare-fun b!1542291 () Bool)

(assert (=> b!1542291 (= e!858009 false)))

(declare-fun lt!665792 () Bool)

(declare-datatypes ((List!35870 0))(
  ( (Nil!35867) (Cons!35866 (h!37311 (_ BitVec 64)) (t!50564 List!35870)) )
))
(declare-fun arrayNoDuplicates!0 (array!102618 (_ BitVec 32) List!35870) Bool)

(assert (=> b!1542291 (= lt!665792 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35867))))

(declare-fun b!1542292 () Bool)

(declare-fun res!1058419 () Bool)

(assert (=> b!1542292 (=> (not res!1058419) (not e!858009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102618 (_ BitVec 32)) Bool)

(assert (=> b!1542292 (= res!1058419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58243 () Bool)

(declare-fun mapRes!58243 () Bool)

(declare-fun tp!110770 () Bool)

(declare-fun e!858007 () Bool)

(assert (=> mapNonEmpty!58243 (= mapRes!58243 (and tp!110770 e!858007))))

(declare-fun mapValue!58243 () ValueCell!17936)

(declare-fun mapRest!58243 () (Array (_ BitVec 32) ValueCell!17936))

(declare-fun mapKey!58243 () (_ BitVec 32))

(assert (=> mapNonEmpty!58243 (= (arr!49510 _values!470) (store mapRest!58243 mapKey!58243 mapValue!58243))))

(declare-fun b!1542293 () Bool)

(declare-fun e!858005 () Bool)

(declare-fun tp_is_empty!37693 () Bool)

(assert (=> b!1542293 (= e!858005 tp_is_empty!37693)))

(declare-fun mapIsEmpty!58243 () Bool)

(assert (=> mapIsEmpty!58243 mapRes!58243))

(declare-fun b!1542294 () Bool)

(assert (=> b!1542294 (= e!858006 (and e!858005 mapRes!58243))))

(declare-fun condMapEmpty!58243 () Bool)

(declare-fun mapDefault!58243 () ValueCell!17936)

