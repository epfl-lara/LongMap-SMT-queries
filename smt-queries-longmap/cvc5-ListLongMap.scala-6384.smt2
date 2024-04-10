; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82056 () Bool)

(assert start!82056)

(declare-fun b!956929 () Bool)

(declare-fun e!539275 () Bool)

(declare-fun tp_is_empty!21079 () Bool)

(assert (=> b!956929 (= e!539275 tp_is_empty!21079)))

(declare-fun mapIsEmpty!33583 () Bool)

(declare-fun mapRes!33583 () Bool)

(assert (=> mapIsEmpty!33583 mapRes!33583))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun e!539272 () Bool)

(declare-datatypes ((array!58257 0))(
  ( (array!58258 (arr!28007 (Array (_ BitVec 32) (_ BitVec 64))) (size!28486 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58257)

(declare-datatypes ((V!33089 0))(
  ( (V!33090 (val!10590 Int)) )
))
(declare-datatypes ((ValueCell!10058 0))(
  ( (ValueCellFull!10058 (v!13146 V!33089)) (EmptyCell!10058) )
))
(declare-datatypes ((array!58259 0))(
  ( (array!58260 (arr!28008 (Array (_ BitVec 32) ValueCell!10058)) (size!28487 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58259)

(declare-fun b!956930 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(assert (=> b!956930 (= e!539272 (and (= (size!28487 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28486 _keys!1668) (size!28487 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (= (size!28486 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)) (bvsgt #b00000000000000000000000000000000 (size!28486 _keys!1668))))))

(declare-fun res!640674 () Bool)

(assert (=> start!82056 (=> (not res!640674) (not e!539272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82056 (= res!640674 (validMask!0 mask!2088))))

(assert (=> start!82056 e!539272))

(assert (=> start!82056 true))

(declare-fun e!539273 () Bool)

(declare-fun array_inv!21729 (array!58259) Bool)

(assert (=> start!82056 (and (array_inv!21729 _values!1386) e!539273)))

(declare-fun array_inv!21730 (array!58257) Bool)

(assert (=> start!82056 (array_inv!21730 _keys!1668)))

(declare-fun b!956931 () Bool)

(declare-fun e!539271 () Bool)

(assert (=> b!956931 (= e!539271 tp_is_empty!21079)))

(declare-fun mapNonEmpty!33583 () Bool)

(declare-fun tp!64188 () Bool)

(assert (=> mapNonEmpty!33583 (= mapRes!33583 (and tp!64188 e!539275))))

(declare-fun mapKey!33583 () (_ BitVec 32))

(declare-fun mapRest!33583 () (Array (_ BitVec 32) ValueCell!10058))

(declare-fun mapValue!33583 () ValueCell!10058)

(assert (=> mapNonEmpty!33583 (= (arr!28008 _values!1386) (store mapRest!33583 mapKey!33583 mapValue!33583))))

(declare-fun b!956932 () Bool)

(assert (=> b!956932 (= e!539273 (and e!539271 mapRes!33583))))

(declare-fun condMapEmpty!33583 () Bool)

(declare-fun mapDefault!33583 () ValueCell!10058)

