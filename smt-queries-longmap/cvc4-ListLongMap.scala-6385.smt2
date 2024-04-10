; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82072 () Bool)

(assert start!82072)

(declare-fun b!957013 () Bool)

(declare-fun res!640705 () Bool)

(declare-fun e!539352 () Bool)

(assert (=> b!957013 (=> (not res!640705) (not e!539352))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58277 0))(
  ( (array!58278 (arr!28016 (Array (_ BitVec 32) (_ BitVec 64))) (size!28495 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58277)

(declare-datatypes ((V!33101 0))(
  ( (V!33102 (val!10595 Int)) )
))
(declare-datatypes ((ValueCell!10063 0))(
  ( (ValueCellFull!10063 (v!13151 V!33101)) (EmptyCell!10063) )
))
(declare-datatypes ((array!58279 0))(
  ( (array!58280 (arr!28017 (Array (_ BitVec 32) ValueCell!10063)) (size!28496 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58279)

(assert (=> b!957013 (= res!640705 (and (= (size!28496 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28495 _keys!1668) (size!28496 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33601 () Bool)

(declare-fun mapRes!33601 () Bool)

(declare-fun tp!64206 () Bool)

(declare-fun e!539356 () Bool)

(assert (=> mapNonEmpty!33601 (= mapRes!33601 (and tp!64206 e!539356))))

(declare-fun mapValue!33601 () ValueCell!10063)

(declare-fun mapRest!33601 () (Array (_ BitVec 32) ValueCell!10063))

(declare-fun mapKey!33601 () (_ BitVec 32))

(assert (=> mapNonEmpty!33601 (= (arr!28017 _values!1386) (store mapRest!33601 mapKey!33601 mapValue!33601))))

(declare-fun b!957014 () Bool)

(declare-fun res!640707 () Bool)

(assert (=> b!957014 (=> (not res!640707) (not e!539352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58277 (_ BitVec 32)) Bool)

(assert (=> b!957014 (= res!640707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!640706 () Bool)

(assert (=> start!82072 (=> (not res!640706) (not e!539352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82072 (= res!640706 (validMask!0 mask!2088))))

(assert (=> start!82072 e!539352))

(assert (=> start!82072 true))

(declare-fun e!539355 () Bool)

(declare-fun array_inv!21737 (array!58279) Bool)

(assert (=> start!82072 (and (array_inv!21737 _values!1386) e!539355)))

(declare-fun array_inv!21738 (array!58277) Bool)

(assert (=> start!82072 (array_inv!21738 _keys!1668)))

(declare-fun b!957015 () Bool)

(declare-fun tp_is_empty!21089 () Bool)

(assert (=> b!957015 (= e!539356 tp_is_empty!21089)))

(declare-fun mapIsEmpty!33601 () Bool)

(assert (=> mapIsEmpty!33601 mapRes!33601))

(declare-fun b!957016 () Bool)

(assert (=> b!957016 (= e!539352 (bvsgt #b00000000000000000000000000000000 (size!28495 _keys!1668)))))

(declare-fun b!957017 () Bool)

(declare-fun e!539354 () Bool)

(assert (=> b!957017 (= e!539355 (and e!539354 mapRes!33601))))

(declare-fun condMapEmpty!33601 () Bool)

(declare-fun mapDefault!33601 () ValueCell!10063)

