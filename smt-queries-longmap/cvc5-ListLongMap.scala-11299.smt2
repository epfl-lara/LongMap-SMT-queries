; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131698 () Bool)

(assert start!131698)

(declare-fun b!1542237 () Bool)

(declare-fun e!857961 () Bool)

(assert (=> b!1542237 (= e!857961 false)))

(declare-fun lt!665783 () Bool)

(declare-datatypes ((array!102604 0))(
  ( (array!102605 (arr!49504 (Array (_ BitVec 32) (_ BitVec 64))) (size!50054 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102604)

(declare-datatypes ((List!35867 0))(
  ( (Nil!35864) (Cons!35863 (h!37308 (_ BitVec 64)) (t!50561 List!35867)) )
))
(declare-fun arrayNoDuplicates!0 (array!102604 (_ BitVec 32) List!35867) Bool)

(assert (=> b!1542237 (= lt!665783 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35864))))

(declare-fun b!1542238 () Bool)

(declare-fun res!1058393 () Bool)

(assert (=> b!1542238 (=> (not res!1058393) (not e!857961))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102604 (_ BitVec 32)) Bool)

(assert (=> b!1542238 (= res!1058393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58234 () Bool)

(declare-fun mapRes!58234 () Bool)

(declare-fun tp!110761 () Bool)

(declare-fun e!857964 () Bool)

(assert (=> mapNonEmpty!58234 (= mapRes!58234 (and tp!110761 e!857964))))

(declare-datatypes ((V!58693 0))(
  ( (V!58694 (val!18921 Int)) )
))
(declare-datatypes ((ValueCell!17933 0))(
  ( (ValueCellFull!17933 (v!21722 V!58693)) (EmptyCell!17933) )
))
(declare-datatypes ((array!102606 0))(
  ( (array!102607 (arr!49505 (Array (_ BitVec 32) ValueCell!17933)) (size!50055 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102606)

(declare-fun mapRest!58234 () (Array (_ BitVec 32) ValueCell!17933))

(declare-fun mapKey!58234 () (_ BitVec 32))

(declare-fun mapValue!58234 () ValueCell!17933)

(assert (=> mapNonEmpty!58234 (= (arr!49505 _values!470) (store mapRest!58234 mapKey!58234 mapValue!58234))))

(declare-fun b!1542239 () Bool)

(declare-fun e!857960 () Bool)

(declare-fun e!857963 () Bool)

(assert (=> b!1542239 (= e!857960 (and e!857963 mapRes!58234))))

(declare-fun condMapEmpty!58234 () Bool)

(declare-fun mapDefault!58234 () ValueCell!17933)

