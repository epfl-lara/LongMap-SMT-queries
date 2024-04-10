; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82054 () Bool)

(assert start!82054)

(declare-fun mapIsEmpty!33580 () Bool)

(declare-fun mapRes!33580 () Bool)

(assert (=> mapIsEmpty!33580 mapRes!33580))

(declare-fun e!539259 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33085 0))(
  ( (V!33086 (val!10589 Int)) )
))
(declare-datatypes ((ValueCell!10057 0))(
  ( (ValueCellFull!10057 (v!13145 V!33085)) (EmptyCell!10057) )
))
(declare-datatypes ((array!58253 0))(
  ( (array!58254 (arr!28005 (Array (_ BitVec 32) ValueCell!10057)) (size!28484 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58253)

(declare-fun b!956917 () Bool)

(declare-datatypes ((array!58255 0))(
  ( (array!58256 (arr!28006 (Array (_ BitVec 32) (_ BitVec 64))) (size!28485 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58255)

(assert (=> b!956917 (= e!539259 (and (= (size!28484 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28485 _keys!1668) (size!28484 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (not (= (size!28485 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)))))))

(declare-fun res!640671 () Bool)

(assert (=> start!82054 (=> (not res!640671) (not e!539259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82054 (= res!640671 (validMask!0 mask!2088))))

(assert (=> start!82054 e!539259))

(assert (=> start!82054 true))

(declare-fun e!539257 () Bool)

(declare-fun array_inv!21727 (array!58253) Bool)

(assert (=> start!82054 (and (array_inv!21727 _values!1386) e!539257)))

(declare-fun array_inv!21728 (array!58255) Bool)

(assert (=> start!82054 (array_inv!21728 _keys!1668)))

(declare-fun mapNonEmpty!33580 () Bool)

(declare-fun tp!64185 () Bool)

(declare-fun e!539258 () Bool)

(assert (=> mapNonEmpty!33580 (= mapRes!33580 (and tp!64185 e!539258))))

(declare-fun mapRest!33580 () (Array (_ BitVec 32) ValueCell!10057))

(declare-fun mapValue!33580 () ValueCell!10057)

(declare-fun mapKey!33580 () (_ BitVec 32))

(assert (=> mapNonEmpty!33580 (= (arr!28005 _values!1386) (store mapRest!33580 mapKey!33580 mapValue!33580))))

(declare-fun b!956918 () Bool)

(declare-fun e!539256 () Bool)

(declare-fun tp_is_empty!21077 () Bool)

(assert (=> b!956918 (= e!539256 tp_is_empty!21077)))

(declare-fun b!956919 () Bool)

(assert (=> b!956919 (= e!539257 (and e!539256 mapRes!33580))))

(declare-fun condMapEmpty!33580 () Bool)

(declare-fun mapDefault!33580 () ValueCell!10057)

