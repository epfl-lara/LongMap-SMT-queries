; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82394 () Bool)

(assert start!82394)

(declare-fun b_free!18661 () Bool)

(declare-fun b_next!18661 () Bool)

(assert (=> start!82394 (= b_free!18661 (not b_next!18661))))

(declare-fun tp!64952 () Bool)

(declare-fun b_and!30149 () Bool)

(assert (=> start!82394 (= tp!64952 b_and!30149)))

(declare-fun b!960748 () Bool)

(declare-fun res!643108 () Bool)

(declare-fun e!541573 () Bool)

(assert (=> b!960748 (=> (not res!643108) (not e!541573))))

(declare-datatypes ((array!58835 0))(
  ( (array!58836 (arr!28291 (Array (_ BitVec 32) (_ BitVec 64))) (size!28770 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58835)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960748 (= res!643108 (validKeyInArray!0 (select (arr!28291 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!34039 () Bool)

(declare-fun mapRes!34039 () Bool)

(declare-fun tp!64953 () Bool)

(declare-fun e!541574 () Bool)

(assert (=> mapNonEmpty!34039 (= mapRes!34039 (and tp!64953 e!541574))))

(declare-datatypes ((V!33481 0))(
  ( (V!33482 (val!10737 Int)) )
))
(declare-datatypes ((ValueCell!10205 0))(
  ( (ValueCellFull!10205 (v!13294 V!33481)) (EmptyCell!10205) )
))
(declare-fun mapRest!34039 () (Array (_ BitVec 32) ValueCell!10205))

(declare-datatypes ((array!58837 0))(
  ( (array!58838 (arr!28292 (Array (_ BitVec 32) ValueCell!10205)) (size!28771 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58837)

(declare-fun mapValue!34039 () ValueCell!10205)

(declare-fun mapKey!34039 () (_ BitVec 32))

(assert (=> mapNonEmpty!34039 (= (arr!28292 _values!1386) (store mapRest!34039 mapKey!34039 mapValue!34039))))

(declare-fun b!960749 () Bool)

(declare-fun res!643111 () Bool)

(assert (=> b!960749 (=> (not res!643111) (not e!541573))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960749 (= res!643111 (and (= (size!28771 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28770 _keys!1668) (size!28771 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34039 () Bool)

(assert (=> mapIsEmpty!34039 mapRes!34039))

(declare-fun res!643112 () Bool)

(assert (=> start!82394 (=> (not res!643112) (not e!541573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82394 (= res!643112 (validMask!0 mask!2088))))

(assert (=> start!82394 e!541573))

(assert (=> start!82394 true))

(declare-fun tp_is_empty!21373 () Bool)

(assert (=> start!82394 tp_is_empty!21373))

(declare-fun array_inv!21921 (array!58835) Bool)

(assert (=> start!82394 (array_inv!21921 _keys!1668)))

(declare-fun e!541575 () Bool)

(declare-fun array_inv!21922 (array!58837) Bool)

(assert (=> start!82394 (and (array_inv!21922 _values!1386) e!541575)))

(assert (=> start!82394 tp!64952))

(declare-fun b!960750 () Bool)

(declare-fun e!541572 () Bool)

(assert (=> b!960750 (= e!541575 (and e!541572 mapRes!34039))))

(declare-fun condMapEmpty!34039 () Bool)

(declare-fun mapDefault!34039 () ValueCell!10205)

