; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82086 () Bool)

(assert start!82086)

(declare-fun res!640740 () Bool)

(declare-fun e!539413 () Bool)

(assert (=> start!82086 (=> (not res!640740) (not e!539413))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82086 (= res!640740 (validMask!0 mask!2088))))

(assert (=> start!82086 e!539413))

(assert (=> start!82086 true))

(declare-datatypes ((V!33109 0))(
  ( (V!33110 (val!10598 Int)) )
))
(declare-datatypes ((ValueCell!10066 0))(
  ( (ValueCellFull!10066 (v!13154 V!33109)) (EmptyCell!10066) )
))
(declare-datatypes ((array!58291 0))(
  ( (array!58292 (arr!28022 (Array (_ BitVec 32) ValueCell!10066)) (size!28501 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58291)

(declare-fun e!539416 () Bool)

(declare-fun array_inv!21743 (array!58291) Bool)

(assert (=> start!82086 (and (array_inv!21743 _values!1386) e!539416)))

(declare-datatypes ((array!58293 0))(
  ( (array!58294 (arr!28023 (Array (_ BitVec 32) (_ BitVec 64))) (size!28502 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58293)

(declare-fun array_inv!21744 (array!58293) Bool)

(assert (=> start!82086 (array_inv!21744 _keys!1668)))

(declare-fun b!957087 () Bool)

(declare-fun res!640739 () Bool)

(assert (=> b!957087 (=> (not res!640739) (not e!539413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58293 (_ BitVec 32)) Bool)

(assert (=> b!957087 (= res!640739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957088 () Bool)

(declare-fun e!539414 () Bool)

(declare-fun tp_is_empty!21095 () Bool)

(assert (=> b!957088 (= e!539414 tp_is_empty!21095)))

(declare-fun mapIsEmpty!33613 () Bool)

(declare-fun mapRes!33613 () Bool)

(assert (=> mapIsEmpty!33613 mapRes!33613))

(declare-fun b!957089 () Bool)

(assert (=> b!957089 (= e!539416 (and e!539414 mapRes!33613))))

(declare-fun condMapEmpty!33613 () Bool)

(declare-fun mapDefault!33613 () ValueCell!10066)

