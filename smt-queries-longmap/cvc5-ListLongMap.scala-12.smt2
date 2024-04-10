; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!450 () Bool)

(assert start!450)

(declare-fun b!2669 () Bool)

(declare-fun e!1008 () Bool)

(declare-fun tp_is_empty!55 () Bool)

(assert (=> b!2669 (= e!1008 tp_is_empty!55)))

(declare-fun res!4802 () Bool)

(declare-fun e!1004 () Bool)

(assert (=> start!450 (=> (not res!4802) (not e!1004))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!450 (= res!4802 (validMask!0 mask!2250))))

(assert (=> start!450 e!1004))

(assert (=> start!450 true))

(declare-datatypes ((V!251 0))(
  ( (V!252 (val!33 Int)) )
))
(declare-datatypes ((ValueCell!11 0))(
  ( (ValueCellFull!11 (v!1119 V!251)) (EmptyCell!11) )
))
(declare-datatypes ((array!41 0))(
  ( (array!42 (arr!19 (Array (_ BitVec 32) ValueCell!11)) (size!81 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!41)

(declare-fun e!1005 () Bool)

(declare-fun array_inv!5 (array!41) Bool)

(assert (=> start!450 (and (array_inv!5 _values!1492) e!1005)))

(declare-datatypes ((array!43 0))(
  ( (array!44 (arr!20 (Array (_ BitVec 32) (_ BitVec 64))) (size!82 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!43)

(declare-fun array_inv!6 (array!43) Bool)

(assert (=> start!450 (array_inv!6 _keys!1806)))

(declare-fun mapIsEmpty!23 () Bool)

(declare-fun mapRes!23 () Bool)

(assert (=> mapIsEmpty!23 mapRes!23))

(declare-fun b!2670 () Bool)

(declare-fun e!1007 () Bool)

(assert (=> b!2670 (= e!1007 tp_is_empty!55)))

(declare-fun b!2671 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2671 (= e!1004 (and (= (size!81 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!82 _keys!1806) (size!81 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011) (not (= (size!82 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))))

(declare-fun mapNonEmpty!23 () Bool)

(declare-fun tp!263 () Bool)

(assert (=> mapNonEmpty!23 (= mapRes!23 (and tp!263 e!1007))))

(declare-fun mapValue!23 () ValueCell!11)

(declare-fun mapRest!23 () (Array (_ BitVec 32) ValueCell!11))

(declare-fun mapKey!23 () (_ BitVec 32))

(assert (=> mapNonEmpty!23 (= (arr!19 _values!1492) (store mapRest!23 mapKey!23 mapValue!23))))

(declare-fun b!2672 () Bool)

(assert (=> b!2672 (= e!1005 (and e!1008 mapRes!23))))

(declare-fun condMapEmpty!23 () Bool)

(declare-fun mapDefault!23 () ValueCell!11)

