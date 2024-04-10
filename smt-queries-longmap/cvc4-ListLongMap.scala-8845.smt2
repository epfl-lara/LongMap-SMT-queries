; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107298 () Bool)

(assert start!107298)

(declare-fun mapNonEmpty!51061 () Bool)

(declare-fun mapRes!51061 () Bool)

(declare-fun tp!97402 () Bool)

(declare-fun e!725236 () Bool)

(assert (=> mapNonEmpty!51061 (= mapRes!51061 (and tp!97402 e!725236))))

(declare-datatypes ((V!49175 0))(
  ( (V!49176 (val!16568 Int)) )
))
(declare-datatypes ((ValueCell!15640 0))(
  ( (ValueCellFull!15640 (v!19205 V!49175)) (EmptyCell!15640) )
))
(declare-datatypes ((array!83222 0))(
  ( (array!83223 (arr!40148 (Array (_ BitVec 32) ValueCell!15640)) (size!40684 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83222)

(declare-fun mapRest!51061 () (Array (_ BitVec 32) ValueCell!15640))

(declare-fun mapValue!51061 () ValueCell!15640)

(declare-fun mapKey!51061 () (_ BitVec 32))

(assert (=> mapNonEmpty!51061 (= (arr!40148 _values!1134) (store mapRest!51061 mapKey!51061 mapValue!51061))))

(declare-fun b!1271705 () Bool)

(declare-fun tp_is_empty!32987 () Bool)

(assert (=> b!1271705 (= e!725236 tp_is_empty!32987)))

(declare-fun b!1271706 () Bool)

(declare-fun res!846046 () Bool)

(declare-fun e!725235 () Bool)

(assert (=> b!1271706 (=> (not res!846046) (not e!725235))))

(declare-datatypes ((array!83224 0))(
  ( (array!83225 (arr!40149 (Array (_ BitVec 32) (_ BitVec 64))) (size!40685 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83224)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83224 (_ BitVec 32)) Bool)

(assert (=> b!1271706 (= res!846046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846047 () Bool)

(assert (=> start!107298 (=> (not res!846047) (not e!725235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107298 (= res!846047 (validMask!0 mask!1730))))

(assert (=> start!107298 e!725235))

(declare-fun e!725234 () Bool)

(declare-fun array_inv!30537 (array!83222) Bool)

(assert (=> start!107298 (and (array_inv!30537 _values!1134) e!725234)))

(assert (=> start!107298 true))

(declare-fun array_inv!30538 (array!83224) Bool)

(assert (=> start!107298 (array_inv!30538 _keys!1364)))

(declare-fun b!1271707 () Bool)

(declare-fun e!725238 () Bool)

(assert (=> b!1271707 (= e!725234 (and e!725238 mapRes!51061))))

(declare-fun condMapEmpty!51061 () Bool)

(declare-fun mapDefault!51061 () ValueCell!15640)

