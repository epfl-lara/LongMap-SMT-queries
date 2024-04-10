; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82096 () Bool)

(assert start!82096)

(declare-fun b!957128 () Bool)

(declare-fun res!640755 () Bool)

(declare-fun e!539442 () Bool)

(assert (=> b!957128 (=> (not res!640755) (not e!539442))))

(declare-datatypes ((array!58297 0))(
  ( (array!58298 (arr!28024 (Array (_ BitVec 32) (_ BitVec 64))) (size!28503 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58297)

(assert (=> b!957128 (= res!640755 (and (bvsle #b00000000000000000000000000000000 (size!28503 _keys!1668)) (bvslt (size!28503 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun b!957129 () Bool)

(declare-datatypes ((List!19501 0))(
  ( (Nil!19498) (Cons!19497 (h!20659 (_ BitVec 64)) (t!27864 List!19501)) )
))
(declare-fun noDuplicate!1361 (List!19501) Bool)

(assert (=> b!957129 (= e!539442 (not (noDuplicate!1361 Nil!19498)))))

(declare-fun b!957130 () Bool)

(declare-fun e!539443 () Bool)

(declare-fun tp_is_empty!21097 () Bool)

(assert (=> b!957130 (= e!539443 tp_is_empty!21097)))

(declare-fun b!957131 () Bool)

(declare-fun res!640757 () Bool)

(assert (=> b!957131 (=> (not res!640757) (not e!539442))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58297 (_ BitVec 32)) Bool)

(assert (=> b!957131 (= res!640757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33619 () Bool)

(declare-fun mapRes!33619 () Bool)

(assert (=> mapIsEmpty!33619 mapRes!33619))

(declare-fun b!957127 () Bool)

(declare-fun e!539445 () Bool)

(declare-fun e!539444 () Bool)

(assert (=> b!957127 (= e!539445 (and e!539444 mapRes!33619))))

(declare-fun condMapEmpty!33619 () Bool)

(declare-datatypes ((V!33113 0))(
  ( (V!33114 (val!10599 Int)) )
))
(declare-datatypes ((ValueCell!10067 0))(
  ( (ValueCellFull!10067 (v!13155 V!33113)) (EmptyCell!10067) )
))
(declare-datatypes ((array!58299 0))(
  ( (array!58300 (arr!28025 (Array (_ BitVec 32) ValueCell!10067)) (size!28504 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58299)

(declare-fun mapDefault!33619 () ValueCell!10067)

