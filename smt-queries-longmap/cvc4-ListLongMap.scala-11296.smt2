; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131684 () Bool)

(assert start!131684)

(declare-fun b!1542111 () Bool)

(declare-fun res!1058330 () Bool)

(declare-fun e!857857 () Bool)

(assert (=> b!1542111 (=> (not res!1058330) (not e!857857))))

(declare-datatypes ((array!102578 0))(
  ( (array!102579 (arr!49491 (Array (_ BitVec 32) (_ BitVec 64))) (size!50041 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102578)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102578 (_ BitVec 32)) Bool)

(assert (=> b!1542111 (= res!1058330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58213 () Bool)

(declare-fun mapRes!58213 () Bool)

(assert (=> mapIsEmpty!58213 mapRes!58213))

(declare-fun b!1542112 () Bool)

(assert (=> b!1542112 (= e!857857 false)))

(declare-fun lt!665762 () Bool)

(declare-datatypes ((List!35862 0))(
  ( (Nil!35859) (Cons!35858 (h!37303 (_ BitVec 64)) (t!50556 List!35862)) )
))
(declare-fun arrayNoDuplicates!0 (array!102578 (_ BitVec 32) List!35862) Bool)

(assert (=> b!1542112 (= lt!665762 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35859))))

(declare-fun b!1542113 () Bool)

(declare-fun e!857855 () Bool)

(declare-fun tp_is_empty!37673 () Bool)

(assert (=> b!1542113 (= e!857855 tp_is_empty!37673)))

(declare-fun b!1542115 () Bool)

(declare-fun res!1058329 () Bool)

(assert (=> b!1542115 (=> (not res!1058329) (not e!857857))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58673 0))(
  ( (V!58674 (val!18914 Int)) )
))
(declare-datatypes ((ValueCell!17926 0))(
  ( (ValueCellFull!17926 (v!21715 V!58673)) (EmptyCell!17926) )
))
(declare-datatypes ((array!102580 0))(
  ( (array!102581 (arr!49492 (Array (_ BitVec 32) ValueCell!17926)) (size!50042 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102580)

(assert (=> b!1542115 (= res!1058329 (and (= (size!50042 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50041 _keys!618) (size!50042 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58213 () Bool)

(declare-fun tp!110740 () Bool)

(declare-fun e!857856 () Bool)

(assert (=> mapNonEmpty!58213 (= mapRes!58213 (and tp!110740 e!857856))))

(declare-fun mapRest!58213 () (Array (_ BitVec 32) ValueCell!17926))

(declare-fun mapValue!58213 () ValueCell!17926)

(declare-fun mapKey!58213 () (_ BitVec 32))

(assert (=> mapNonEmpty!58213 (= (arr!49492 _values!470) (store mapRest!58213 mapKey!58213 mapValue!58213))))

(declare-fun b!1542116 () Bool)

(declare-fun e!857859 () Bool)

(assert (=> b!1542116 (= e!857859 (and e!857855 mapRes!58213))))

(declare-fun condMapEmpty!58213 () Bool)

(declare-fun mapDefault!58213 () ValueCell!17926)

