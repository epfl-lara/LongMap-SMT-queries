; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82208 () Bool)

(assert start!82208)

(declare-fun b_free!18481 () Bool)

(declare-fun b_next!18481 () Bool)

(assert (=> start!82208 (= b_free!18481 (not b_next!18481))))

(declare-fun tp!64403 () Bool)

(declare-fun b_and!29969 () Bool)

(assert (=> start!82208 (= tp!64403 b_and!29969)))

(declare-fun b!958172 () Bool)

(declare-fun e!540178 () Bool)

(declare-fun tp_is_empty!21187 () Bool)

(assert (=> b!958172 (= e!540178 tp_is_empty!21187)))

(declare-fun b!958173 () Bool)

(declare-fun res!641370 () Bool)

(declare-fun e!540179 () Bool)

(assert (=> b!958173 (=> (not res!641370) (not e!540179))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58477 0))(
  ( (array!58478 (arr!28112 (Array (_ BitVec 32) (_ BitVec 64))) (size!28591 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58477)

(declare-datatypes ((V!33233 0))(
  ( (V!33234 (val!10644 Int)) )
))
(declare-datatypes ((ValueCell!10112 0))(
  ( (ValueCellFull!10112 (v!13201 V!33233)) (EmptyCell!10112) )
))
(declare-datatypes ((array!58479 0))(
  ( (array!58480 (arr!28113 (Array (_ BitVec 32) ValueCell!10112)) (size!28592 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58479)

(assert (=> b!958173 (= res!641370 (and (= (size!28592 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28591 _keys!1668) (size!28592 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958174 () Bool)

(declare-fun res!641367 () Bool)

(assert (=> b!958174 (=> (not res!641367) (not e!540179))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958174 (= res!641367 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28591 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28591 _keys!1668))))))

(declare-fun b!958175 () Bool)

(declare-fun res!641371 () Bool)

(assert (=> b!958175 (=> (not res!641371) (not e!540179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58477 (_ BitVec 32)) Bool)

(assert (=> b!958175 (= res!641371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33760 () Bool)

(declare-fun mapRes!33760 () Bool)

(assert (=> mapIsEmpty!33760 mapRes!33760))

(declare-fun b!958176 () Bool)

(declare-fun e!540176 () Bool)

(assert (=> b!958176 (= e!540176 (and e!540178 mapRes!33760))))

(declare-fun condMapEmpty!33760 () Bool)

(declare-fun mapDefault!33760 () ValueCell!10112)

