; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131680 () Bool)

(assert start!131680)

(declare-fun b!1542075 () Bool)

(declare-fun e!857826 () Bool)

(declare-fun tp_is_empty!37669 () Bool)

(assert (=> b!1542075 (= e!857826 tp_is_empty!37669)))

(declare-fun b!1542076 () Bool)

(declare-fun res!1058311 () Bool)

(declare-fun e!857829 () Bool)

(assert (=> b!1542076 (=> (not res!1058311) (not e!857829))))

(declare-datatypes ((array!102570 0))(
  ( (array!102571 (arr!49487 (Array (_ BitVec 32) (_ BitVec 64))) (size!50037 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102570)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102570 (_ BitVec 32)) Bool)

(assert (=> b!1542076 (= res!1058311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542078 () Bool)

(assert (=> b!1542078 (= e!857829 false)))

(declare-fun lt!665756 () Bool)

(declare-datatypes ((List!35860 0))(
  ( (Nil!35857) (Cons!35856 (h!37301 (_ BitVec 64)) (t!50554 List!35860)) )
))
(declare-fun arrayNoDuplicates!0 (array!102570 (_ BitVec 32) List!35860) Bool)

(assert (=> b!1542078 (= lt!665756 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35857))))

(declare-fun mapNonEmpty!58207 () Bool)

(declare-fun mapRes!58207 () Bool)

(declare-fun tp!110734 () Bool)

(assert (=> mapNonEmpty!58207 (= mapRes!58207 (and tp!110734 e!857826))))

(declare-datatypes ((V!58669 0))(
  ( (V!58670 (val!18912 Int)) )
))
(declare-datatypes ((ValueCell!17924 0))(
  ( (ValueCellFull!17924 (v!21713 V!58669)) (EmptyCell!17924) )
))
(declare-fun mapValue!58207 () ValueCell!17924)

(declare-fun mapKey!58207 () (_ BitVec 32))

(declare-datatypes ((array!102572 0))(
  ( (array!102573 (arr!49488 (Array (_ BitVec 32) ValueCell!17924)) (size!50038 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102572)

(declare-fun mapRest!58207 () (Array (_ BitVec 32) ValueCell!17924))

(assert (=> mapNonEmpty!58207 (= (arr!49488 _values!470) (store mapRest!58207 mapKey!58207 mapValue!58207))))

(declare-fun mapIsEmpty!58207 () Bool)

(assert (=> mapIsEmpty!58207 mapRes!58207))

(declare-fun res!1058312 () Bool)

(assert (=> start!131680 (=> (not res!1058312) (not e!857829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131680 (= res!1058312 (validMask!0 mask!926))))

(assert (=> start!131680 e!857829))

(assert (=> start!131680 true))

(declare-fun e!857828 () Bool)

(declare-fun array_inv!38503 (array!102572) Bool)

(assert (=> start!131680 (and (array_inv!38503 _values!470) e!857828)))

(declare-fun array_inv!38504 (array!102570) Bool)

(assert (=> start!131680 (array_inv!38504 _keys!618)))

(declare-fun b!1542077 () Bool)

(declare-fun e!857827 () Bool)

(assert (=> b!1542077 (= e!857827 tp_is_empty!37669)))

(declare-fun b!1542079 () Bool)

(declare-fun res!1058313 () Bool)

(assert (=> b!1542079 (=> (not res!1058313) (not e!857829))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542079 (= res!1058313 (and (= (size!50038 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50037 _keys!618) (size!50038 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542080 () Bool)

(assert (=> b!1542080 (= e!857828 (and e!857827 mapRes!58207))))

(declare-fun condMapEmpty!58207 () Bool)

(declare-fun mapDefault!58207 () ValueCell!17924)

