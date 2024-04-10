; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131674 () Bool)

(assert start!131674)

(declare-fun mapIsEmpty!58198 () Bool)

(declare-fun mapRes!58198 () Bool)

(assert (=> mapIsEmpty!58198 mapRes!58198))

(declare-fun b!1542021 () Bool)

(declare-fun res!1058285 () Bool)

(declare-fun e!857784 () Bool)

(assert (=> b!1542021 (=> (not res!1058285) (not e!857784))))

(declare-datatypes ((array!102558 0))(
  ( (array!102559 (arr!49481 (Array (_ BitVec 32) (_ BitVec 64))) (size!50031 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102558)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102558 (_ BitVec 32)) Bool)

(assert (=> b!1542021 (= res!1058285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542022 () Bool)

(declare-fun e!857780 () Bool)

(declare-fun tp_is_empty!37663 () Bool)

(assert (=> b!1542022 (= e!857780 tp_is_empty!37663)))

(declare-fun mapNonEmpty!58198 () Bool)

(declare-fun tp!110725 () Bool)

(declare-fun e!857781 () Bool)

(assert (=> mapNonEmpty!58198 (= mapRes!58198 (and tp!110725 e!857781))))

(declare-datatypes ((V!58661 0))(
  ( (V!58662 (val!18909 Int)) )
))
(declare-datatypes ((ValueCell!17921 0))(
  ( (ValueCellFull!17921 (v!21710 V!58661)) (EmptyCell!17921) )
))
(declare-fun mapRest!58198 () (Array (_ BitVec 32) ValueCell!17921))

(declare-fun mapValue!58198 () ValueCell!17921)

(declare-fun mapKey!58198 () (_ BitVec 32))

(declare-datatypes ((array!102560 0))(
  ( (array!102561 (arr!49482 (Array (_ BitVec 32) ValueCell!17921)) (size!50032 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102560)

(assert (=> mapNonEmpty!58198 (= (arr!49482 _values!470) (store mapRest!58198 mapKey!58198 mapValue!58198))))

(declare-fun b!1542023 () Bool)

(declare-fun res!1058286 () Bool)

(assert (=> b!1542023 (=> (not res!1058286) (not e!857784))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542023 (= res!1058286 (and (= (size!50032 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50031 _keys!618) (size!50032 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542024 () Bool)

(declare-fun e!857783 () Bool)

(assert (=> b!1542024 (= e!857783 (and e!857780 mapRes!58198))))

(declare-fun condMapEmpty!58198 () Bool)

(declare-fun mapDefault!58198 () ValueCell!17921)

