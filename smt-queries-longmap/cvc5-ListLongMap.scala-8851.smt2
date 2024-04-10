; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107330 () Bool)

(assert start!107330)

(declare-fun b_free!27649 () Bool)

(declare-fun b_next!27649 () Bool)

(assert (=> start!107330 (= b_free!27649 (not b_next!27649))))

(declare-fun tp!97453 () Bool)

(declare-fun b_and!45681 () Bool)

(assert (=> start!107330 (= tp!97453 b_and!45681)))

(declare-fun b!1272015 () Bool)

(declare-fun res!846213 () Bool)

(declare-fun e!725476 () Bool)

(assert (=> b!1272015 (=> (not res!846213) (not e!725476))))

(declare-datatypes ((array!83286 0))(
  ( (array!83287 (arr!40180 (Array (_ BitVec 32) (_ BitVec 64))) (size!40716 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83286)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83286 (_ BitVec 32)) Bool)

(assert (=> b!1272015 (= res!846213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846215 () Bool)

(assert (=> start!107330 (=> (not res!846215) (not e!725476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107330 (= res!846215 (validMask!0 mask!1730))))

(assert (=> start!107330 e!725476))

(declare-datatypes ((V!49219 0))(
  ( (V!49220 (val!16584 Int)) )
))
(declare-datatypes ((ValueCell!15656 0))(
  ( (ValueCellFull!15656 (v!19221 V!49219)) (EmptyCell!15656) )
))
(declare-datatypes ((array!83288 0))(
  ( (array!83289 (arr!40181 (Array (_ BitVec 32) ValueCell!15656)) (size!40717 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83288)

(declare-fun e!725477 () Bool)

(declare-fun array_inv!30565 (array!83288) Bool)

(assert (=> start!107330 (and (array_inv!30565 _values!1134) e!725477)))

(assert (=> start!107330 true))

(declare-fun array_inv!30566 (array!83286) Bool)

(assert (=> start!107330 (array_inv!30566 _keys!1364)))

(declare-fun tp_is_empty!33019 () Bool)

(assert (=> start!107330 tp_is_empty!33019))

(assert (=> start!107330 tp!97453))

(declare-fun b!1272016 () Bool)

(declare-fun res!846211 () Bool)

(assert (=> b!1272016 (=> (not res!846211) (not e!725476))))

(declare-datatypes ((List!28549 0))(
  ( (Nil!28546) (Cons!28545 (h!29754 (_ BitVec 64)) (t!42078 List!28549)) )
))
(declare-fun arrayNoDuplicates!0 (array!83286 (_ BitVec 32) List!28549) Bool)

(assert (=> b!1272016 (= res!846211 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28546))))

(declare-fun b!1272017 () Bool)

(declare-fun e!725474 () Bool)

(declare-fun mapRes!51109 () Bool)

(assert (=> b!1272017 (= e!725477 (and e!725474 mapRes!51109))))

(declare-fun condMapEmpty!51109 () Bool)

(declare-fun mapDefault!51109 () ValueCell!15656)

