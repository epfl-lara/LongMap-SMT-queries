; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107312 () Bool)

(assert start!107312)

(declare-fun b!1271831 () Bool)

(declare-fun e!725342 () Bool)

(declare-fun tp_is_empty!33001 () Bool)

(assert (=> b!1271831 (= e!725342 tp_is_empty!33001)))

(declare-fun b!1271832 () Bool)

(declare-fun e!725341 () Bool)

(assert (=> b!1271832 (= e!725341 tp_is_empty!33001)))

(declare-fun mapIsEmpty!51082 () Bool)

(declare-fun mapRes!51082 () Bool)

(assert (=> mapIsEmpty!51082 mapRes!51082))

(declare-fun b!1271833 () Bool)

(declare-fun e!725340 () Bool)

(assert (=> b!1271833 (= e!725340 false)))

(declare-fun lt!574938 () Bool)

(declare-datatypes ((array!83250 0))(
  ( (array!83251 (arr!40162 (Array (_ BitVec 32) (_ BitVec 64))) (size!40698 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83250)

(declare-datatypes ((List!28540 0))(
  ( (Nil!28537) (Cons!28536 (h!29745 (_ BitVec 64)) (t!42069 List!28540)) )
))
(declare-fun arrayNoDuplicates!0 (array!83250 (_ BitVec 32) List!28540) Bool)

(assert (=> b!1271833 (= lt!574938 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28537))))

(declare-fun mapNonEmpty!51082 () Bool)

(declare-fun tp!97423 () Bool)

(assert (=> mapNonEmpty!51082 (= mapRes!51082 (and tp!97423 e!725342))))

(declare-datatypes ((V!49195 0))(
  ( (V!49196 (val!16575 Int)) )
))
(declare-datatypes ((ValueCell!15647 0))(
  ( (ValueCellFull!15647 (v!19212 V!49195)) (EmptyCell!15647) )
))
(declare-datatypes ((array!83252 0))(
  ( (array!83253 (arr!40163 (Array (_ BitVec 32) ValueCell!15647)) (size!40699 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83252)

(declare-fun mapValue!51082 () ValueCell!15647)

(declare-fun mapRest!51082 () (Array (_ BitVec 32) ValueCell!15647))

(declare-fun mapKey!51082 () (_ BitVec 32))

(assert (=> mapNonEmpty!51082 (= (arr!40163 _values!1134) (store mapRest!51082 mapKey!51082 mapValue!51082))))

(declare-fun b!1271834 () Bool)

(declare-fun res!846110 () Bool)

(assert (=> b!1271834 (=> (not res!846110) (not e!725340))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83250 (_ BitVec 32)) Bool)

(assert (=> b!1271834 (= res!846110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846108 () Bool)

(assert (=> start!107312 (=> (not res!846108) (not e!725340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107312 (= res!846108 (validMask!0 mask!1730))))

(assert (=> start!107312 e!725340))

(declare-fun e!725343 () Bool)

(declare-fun array_inv!30549 (array!83252) Bool)

(assert (=> start!107312 (and (array_inv!30549 _values!1134) e!725343)))

(assert (=> start!107312 true))

(declare-fun array_inv!30550 (array!83250) Bool)

(assert (=> start!107312 (array_inv!30550 _keys!1364)))

(declare-fun b!1271835 () Bool)

(assert (=> b!1271835 (= e!725343 (and e!725341 mapRes!51082))))

(declare-fun condMapEmpty!51082 () Bool)

(declare-fun mapDefault!51082 () ValueCell!15647)

