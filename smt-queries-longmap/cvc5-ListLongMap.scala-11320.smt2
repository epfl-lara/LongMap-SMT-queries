; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131824 () Bool)

(assert start!131824)

(declare-fun b!1543371 () Bool)

(declare-fun e!858909 () Bool)

(declare-fun tp_is_empty!37813 () Bool)

(assert (=> b!1543371 (= e!858909 tp_is_empty!37813)))

(declare-fun b!1543372 () Bool)

(declare-fun res!1058959 () Bool)

(declare-fun e!858906 () Bool)

(assert (=> b!1543372 (=> (not res!1058959) (not e!858906))))

(declare-datatypes ((array!102850 0))(
  ( (array!102851 (arr!49627 (Array (_ BitVec 32) (_ BitVec 64))) (size!50177 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102850)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102850 (_ BitVec 32)) Bool)

(assert (=> b!1543372 (= res!1058959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058961 () Bool)

(assert (=> start!131824 (=> (not res!1058961) (not e!858906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131824 (= res!1058961 (validMask!0 mask!926))))

(assert (=> start!131824 e!858906))

(assert (=> start!131824 true))

(declare-datatypes ((V!58861 0))(
  ( (V!58862 (val!18984 Int)) )
))
(declare-datatypes ((ValueCell!17996 0))(
  ( (ValueCellFull!17996 (v!21785 V!58861)) (EmptyCell!17996) )
))
(declare-datatypes ((array!102852 0))(
  ( (array!102853 (arr!49628 (Array (_ BitVec 32) ValueCell!17996)) (size!50178 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102852)

(declare-fun e!858907 () Bool)

(declare-fun array_inv!38609 (array!102852) Bool)

(assert (=> start!131824 (and (array_inv!38609 _values!470) e!858907)))

(declare-fun array_inv!38610 (array!102850) Bool)

(assert (=> start!131824 (array_inv!38610 _keys!618)))

(declare-fun b!1543373 () Bool)

(assert (=> b!1543373 (= e!858906 false)))

(declare-fun lt!665972 () Bool)

(declare-datatypes ((List!35918 0))(
  ( (Nil!35915) (Cons!35914 (h!37359 (_ BitVec 64)) (t!50612 List!35918)) )
))
(declare-fun arrayNoDuplicates!0 (array!102850 (_ BitVec 32) List!35918) Bool)

(assert (=> b!1543373 (= lt!665972 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35915))))

(declare-fun b!1543374 () Bool)

(declare-fun e!858905 () Bool)

(assert (=> b!1543374 (= e!858905 tp_is_empty!37813)))

(declare-fun mapIsEmpty!58423 () Bool)

(declare-fun mapRes!58423 () Bool)

(assert (=> mapIsEmpty!58423 mapRes!58423))

(declare-fun mapNonEmpty!58423 () Bool)

(declare-fun tp!110950 () Bool)

(assert (=> mapNonEmpty!58423 (= mapRes!58423 (and tp!110950 e!858909))))

(declare-fun mapRest!58423 () (Array (_ BitVec 32) ValueCell!17996))

(declare-fun mapValue!58423 () ValueCell!17996)

(declare-fun mapKey!58423 () (_ BitVec 32))

(assert (=> mapNonEmpty!58423 (= (arr!49628 _values!470) (store mapRest!58423 mapKey!58423 mapValue!58423))))

(declare-fun b!1543375 () Bool)

(assert (=> b!1543375 (= e!858907 (and e!858905 mapRes!58423))))

(declare-fun condMapEmpty!58423 () Bool)

(declare-fun mapDefault!58423 () ValueCell!17996)

