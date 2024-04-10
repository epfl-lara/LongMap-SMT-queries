; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131752 () Bool)

(assert start!131752)

(declare-fun b!1542723 () Bool)

(declare-fun e!858366 () Bool)

(declare-fun tp_is_empty!37741 () Bool)

(assert (=> b!1542723 (= e!858366 tp_is_empty!37741)))

(declare-fun b!1542725 () Bool)

(declare-fun e!858365 () Bool)

(assert (=> b!1542725 (= e!858365 false)))

(declare-fun lt!665864 () Bool)

(declare-datatypes ((array!102710 0))(
  ( (array!102711 (arr!49557 (Array (_ BitVec 32) (_ BitVec 64))) (size!50107 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102710)

(declare-datatypes ((List!35889 0))(
  ( (Nil!35886) (Cons!35885 (h!37330 (_ BitVec 64)) (t!50583 List!35889)) )
))
(declare-fun arrayNoDuplicates!0 (array!102710 (_ BitVec 32) List!35889) Bool)

(assert (=> b!1542725 (= lt!665864 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35886))))

(declare-fun b!1542726 () Bool)

(declare-fun e!858367 () Bool)

(assert (=> b!1542726 (= e!858367 tp_is_empty!37741)))

(declare-fun mapNonEmpty!58315 () Bool)

(declare-fun mapRes!58315 () Bool)

(declare-fun tp!110842 () Bool)

(assert (=> mapNonEmpty!58315 (= mapRes!58315 (and tp!110842 e!858367))))

(declare-fun mapKey!58315 () (_ BitVec 32))

(declare-datatypes ((V!58765 0))(
  ( (V!58766 (val!18948 Int)) )
))
(declare-datatypes ((ValueCell!17960 0))(
  ( (ValueCellFull!17960 (v!21749 V!58765)) (EmptyCell!17960) )
))
(declare-fun mapRest!58315 () (Array (_ BitVec 32) ValueCell!17960))

(declare-datatypes ((array!102712 0))(
  ( (array!102713 (arr!49558 (Array (_ BitVec 32) ValueCell!17960)) (size!50108 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102712)

(declare-fun mapValue!58315 () ValueCell!17960)

(assert (=> mapNonEmpty!58315 (= (arr!49558 _values!470) (store mapRest!58315 mapKey!58315 mapValue!58315))))

(declare-fun mapIsEmpty!58315 () Bool)

(assert (=> mapIsEmpty!58315 mapRes!58315))

(declare-fun b!1542727 () Bool)

(declare-fun e!858368 () Bool)

(assert (=> b!1542727 (= e!858368 (and e!858366 mapRes!58315))))

(declare-fun condMapEmpty!58315 () Bool)

(declare-fun mapDefault!58315 () ValueCell!17960)

