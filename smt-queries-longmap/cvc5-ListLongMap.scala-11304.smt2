; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131728 () Bool)

(assert start!131728)

(declare-fun mapIsEmpty!58279 () Bool)

(declare-fun mapRes!58279 () Bool)

(assert (=> mapIsEmpty!58279 mapRes!58279))

(declare-fun b!1542508 () Bool)

(declare-fun e!858186 () Bool)

(assert (=> b!1542508 (= e!858186 false)))

(declare-fun lt!665828 () Bool)

(declare-datatypes ((array!102664 0))(
  ( (array!102665 (arr!49534 (Array (_ BitVec 32) (_ BitVec 64))) (size!50084 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102664)

(declare-datatypes ((List!35879 0))(
  ( (Nil!35876) (Cons!35875 (h!37320 (_ BitVec 64)) (t!50573 List!35879)) )
))
(declare-fun arrayNoDuplicates!0 (array!102664 (_ BitVec 32) List!35879) Bool)

(assert (=> b!1542508 (= lt!665828 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35876))))

(declare-fun b!1542509 () Bool)

(declare-fun e!858189 () Bool)

(declare-fun tp_is_empty!37717 () Bool)

(assert (=> b!1542509 (= e!858189 tp_is_empty!37717)))

(declare-fun b!1542510 () Bool)

(declare-fun res!1058527 () Bool)

(assert (=> b!1542510 (=> (not res!1058527) (not e!858186))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102664 (_ BitVec 32)) Bool)

(assert (=> b!1542510 (= res!1058527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58279 () Bool)

(declare-fun tp!110806 () Bool)

(declare-fun e!858188 () Bool)

(assert (=> mapNonEmpty!58279 (= mapRes!58279 (and tp!110806 e!858188))))

(declare-datatypes ((V!58733 0))(
  ( (V!58734 (val!18936 Int)) )
))
(declare-datatypes ((ValueCell!17948 0))(
  ( (ValueCellFull!17948 (v!21737 V!58733)) (EmptyCell!17948) )
))
(declare-fun mapValue!58279 () ValueCell!17948)

(declare-fun mapRest!58279 () (Array (_ BitVec 32) ValueCell!17948))

(declare-datatypes ((array!102666 0))(
  ( (array!102667 (arr!49535 (Array (_ BitVec 32) ValueCell!17948)) (size!50085 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102666)

(declare-fun mapKey!58279 () (_ BitVec 32))

(assert (=> mapNonEmpty!58279 (= (arr!49535 _values!470) (store mapRest!58279 mapKey!58279 mapValue!58279))))

(declare-fun b!1542507 () Bool)

(declare-fun e!858187 () Bool)

(assert (=> b!1542507 (= e!858187 (and e!858189 mapRes!58279))))

(declare-fun condMapEmpty!58279 () Bool)

(declare-fun mapDefault!58279 () ValueCell!17948)

