; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107322 () Bool)

(assert start!107322)

(declare-fun res!846164 () Bool)

(declare-fun e!725414 () Bool)

(assert (=> start!107322 (=> (not res!846164) (not e!725414))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107322 (= res!846164 (validMask!0 mask!1730))))

(assert (=> start!107322 e!725414))

(declare-datatypes ((V!49207 0))(
  ( (V!49208 (val!16580 Int)) )
))
(declare-datatypes ((ValueCell!15652 0))(
  ( (ValueCellFull!15652 (v!19217 V!49207)) (EmptyCell!15652) )
))
(declare-datatypes ((array!83270 0))(
  ( (array!83271 (arr!40172 (Array (_ BitVec 32) ValueCell!15652)) (size!40708 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83270)

(declare-fun e!725415 () Bool)

(declare-fun array_inv!30557 (array!83270) Bool)

(assert (=> start!107322 (and (array_inv!30557 _values!1134) e!725415)))

(assert (=> start!107322 true))

(declare-datatypes ((array!83272 0))(
  ( (array!83273 (arr!40173 (Array (_ BitVec 32) (_ BitVec 64))) (size!40709 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83272)

(declare-fun array_inv!30558 (array!83272) Bool)

(assert (=> start!107322 (array_inv!30558 _keys!1364)))

(declare-fun mapIsEmpty!51097 () Bool)

(declare-fun mapRes!51097 () Bool)

(assert (=> mapIsEmpty!51097 mapRes!51097))

(declare-fun b!1271929 () Bool)

(declare-fun res!846163 () Bool)

(assert (=> b!1271929 (=> (not res!846163) (not e!725414))))

(declare-datatypes ((List!28545 0))(
  ( (Nil!28542) (Cons!28541 (h!29750 (_ BitVec 64)) (t!42074 List!28545)) )
))
(declare-fun arrayNoDuplicates!0 (array!83272 (_ BitVec 32) List!28545) Bool)

(assert (=> b!1271929 (= res!846163 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28542))))

(declare-fun b!1271930 () Bool)

(declare-fun res!846161 () Bool)

(assert (=> b!1271930 (=> (not res!846161) (not e!725414))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271930 (= res!846161 (and (= (size!40708 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40709 _keys!1364) (size!40708 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271931 () Bool)

(declare-fun e!725416 () Bool)

(assert (=> b!1271931 (= e!725415 (and e!725416 mapRes!51097))))

(declare-fun condMapEmpty!51097 () Bool)

(declare-fun mapDefault!51097 () ValueCell!15652)

