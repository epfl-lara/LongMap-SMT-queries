; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82158 () Bool)

(assert start!82158)

(declare-fun b!957581 () Bool)

(declare-fun e!539803 () Bool)

(declare-fun tp_is_empty!21137 () Bool)

(assert (=> b!957581 (= e!539803 tp_is_empty!21137)))

(declare-fun b!957582 () Bool)

(declare-fun e!539805 () Bool)

(assert (=> b!957582 (= e!539805 tp_is_empty!21137)))

(declare-fun mapNonEmpty!33685 () Bool)

(declare-fun mapRes!33685 () Bool)

(declare-fun tp!64290 () Bool)

(assert (=> mapNonEmpty!33685 (= mapRes!33685 (and tp!64290 e!539803))))

(declare-datatypes ((V!33165 0))(
  ( (V!33166 (val!10619 Int)) )
))
(declare-datatypes ((ValueCell!10087 0))(
  ( (ValueCellFull!10087 (v!13176 V!33165)) (EmptyCell!10087) )
))
(declare-fun mapRest!33685 () (Array (_ BitVec 32) ValueCell!10087))

(declare-datatypes ((array!58377 0))(
  ( (array!58378 (arr!28062 (Array (_ BitVec 32) ValueCell!10087)) (size!28541 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58377)

(declare-fun mapValue!33685 () ValueCell!10087)

(declare-fun mapKey!33685 () (_ BitVec 32))

(assert (=> mapNonEmpty!33685 (= (arr!28062 _values!1386) (store mapRest!33685 mapKey!33685 mapValue!33685))))

(declare-fun b!957583 () Bool)

(declare-fun res!641003 () Bool)

(declare-fun e!539802 () Bool)

(assert (=> b!957583 (=> (not res!641003) (not e!539802))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58379 0))(
  ( (array!58380 (arr!28063 (Array (_ BitVec 32) (_ BitVec 64))) (size!28542 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58379)

(assert (=> b!957583 (= res!641003 (and (= (size!28541 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28542 _keys!1668) (size!28541 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957585 () Bool)

(declare-fun e!539801 () Bool)

(assert (=> b!957585 (= e!539801 (and e!539805 mapRes!33685))))

(declare-fun condMapEmpty!33685 () Bool)

(declare-fun mapDefault!33685 () ValueCell!10087)

