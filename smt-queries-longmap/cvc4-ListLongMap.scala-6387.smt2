; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82100 () Bool)

(assert start!82100)

(declare-fun b!957170 () Bool)

(declare-fun e!539474 () Bool)

(declare-fun tp_is_empty!21101 () Bool)

(assert (=> b!957170 (= e!539474 tp_is_empty!21101)))

(declare-fun b!957171 () Bool)

(declare-fun e!539473 () Bool)

(assert (=> b!957171 (= e!539473 tp_is_empty!21101)))

(declare-fun b!957169 () Bool)

(declare-fun res!640781 () Bool)

(declare-fun e!539476 () Bool)

(assert (=> b!957169 (=> (not res!640781) (not e!539476))))

(declare-datatypes ((array!58305 0))(
  ( (array!58306 (arr!28028 (Array (_ BitVec 32) (_ BitVec 64))) (size!28507 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58305)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58305 (_ BitVec 32)) Bool)

(assert (=> b!957169 (= res!640781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!640782 () Bool)

(assert (=> start!82100 (=> (not res!640782) (not e!539476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82100 (= res!640782 (validMask!0 mask!2088))))

(assert (=> start!82100 e!539476))

(assert (=> start!82100 true))

(declare-datatypes ((V!33117 0))(
  ( (V!33118 (val!10601 Int)) )
))
(declare-datatypes ((ValueCell!10069 0))(
  ( (ValueCellFull!10069 (v!13157 V!33117)) (EmptyCell!10069) )
))
(declare-datatypes ((array!58307 0))(
  ( (array!58308 (arr!28029 (Array (_ BitVec 32) ValueCell!10069)) (size!28508 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58307)

(declare-fun e!539472 () Bool)

(declare-fun array_inv!21747 (array!58307) Bool)

(assert (=> start!82100 (and (array_inv!21747 _values!1386) e!539472)))

(declare-fun array_inv!21748 (array!58305) Bool)

(assert (=> start!82100 (array_inv!21748 _keys!1668)))

(declare-fun b!957172 () Bool)

(declare-fun res!640780 () Bool)

(assert (=> b!957172 (=> (not res!640780) (not e!539476))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957172 (= res!640780 (and (= (size!28508 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28507 _keys!1668) (size!28508 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957173 () Bool)

(declare-datatypes ((List!19503 0))(
  ( (Nil!19500) (Cons!19499 (h!20661 (_ BitVec 64)) (t!27866 List!19503)) )
))
(declare-fun noDuplicate!1363 (List!19503) Bool)

(assert (=> b!957173 (= e!539476 (not (noDuplicate!1363 Nil!19500)))))

(declare-fun b!957174 () Bool)

(declare-fun res!640779 () Bool)

(assert (=> b!957174 (=> (not res!640779) (not e!539476))))

(assert (=> b!957174 (= res!640779 (and (bvsle #b00000000000000000000000000000000 (size!28507 _keys!1668)) (bvslt (size!28507 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!33625 () Bool)

(declare-fun mapRes!33625 () Bool)

(assert (=> mapIsEmpty!33625 mapRes!33625))

(declare-fun b!957175 () Bool)

(assert (=> b!957175 (= e!539472 (and e!539473 mapRes!33625))))

(declare-fun condMapEmpty!33625 () Bool)

(declare-fun mapDefault!33625 () ValueCell!10069)

