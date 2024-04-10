; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107288 () Bool)

(assert start!107288)

(declare-fun res!846002 () Bool)

(declare-fun e!725161 () Bool)

(assert (=> start!107288 (=> (not res!846002) (not e!725161))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107288 (= res!846002 (validMask!0 mask!1730))))

(assert (=> start!107288 e!725161))

(declare-datatypes ((V!49163 0))(
  ( (V!49164 (val!16563 Int)) )
))
(declare-datatypes ((ValueCell!15635 0))(
  ( (ValueCellFull!15635 (v!19200 V!49163)) (EmptyCell!15635) )
))
(declare-datatypes ((array!83202 0))(
  ( (array!83203 (arr!40138 (Array (_ BitVec 32) ValueCell!15635)) (size!40674 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83202)

(declare-fun e!725159 () Bool)

(declare-fun array_inv!30529 (array!83202) Bool)

(assert (=> start!107288 (and (array_inv!30529 _values!1134) e!725159)))

(assert (=> start!107288 true))

(declare-datatypes ((array!83204 0))(
  ( (array!83205 (arr!40139 (Array (_ BitVec 32) (_ BitVec 64))) (size!40675 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83204)

(declare-fun array_inv!30530 (array!83204) Bool)

(assert (=> start!107288 (array_inv!30530 _keys!1364)))

(declare-fun b!1271615 () Bool)

(assert (=> b!1271615 (= e!725161 false)))

(declare-fun lt!574902 () Bool)

(declare-datatypes ((List!28533 0))(
  ( (Nil!28530) (Cons!28529 (h!29738 (_ BitVec 64)) (t!42062 List!28533)) )
))
(declare-fun arrayNoDuplicates!0 (array!83204 (_ BitVec 32) List!28533) Bool)

(assert (=> b!1271615 (= lt!574902 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28530))))

(declare-fun b!1271616 () Bool)

(declare-fun res!846001 () Bool)

(assert (=> b!1271616 (=> (not res!846001) (not e!725161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83204 (_ BitVec 32)) Bool)

(assert (=> b!1271616 (= res!846001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!51046 () Bool)

(declare-fun mapRes!51046 () Bool)

(assert (=> mapIsEmpty!51046 mapRes!51046))

(declare-fun mapNonEmpty!51046 () Bool)

(declare-fun tp!97387 () Bool)

(declare-fun e!725162 () Bool)

(assert (=> mapNonEmpty!51046 (= mapRes!51046 (and tp!97387 e!725162))))

(declare-fun mapKey!51046 () (_ BitVec 32))

(declare-fun mapRest!51046 () (Array (_ BitVec 32) ValueCell!15635))

(declare-fun mapValue!51046 () ValueCell!15635)

(assert (=> mapNonEmpty!51046 (= (arr!40138 _values!1134) (store mapRest!51046 mapKey!51046 mapValue!51046))))

(declare-fun b!1271617 () Bool)

(declare-fun tp_is_empty!32977 () Bool)

(assert (=> b!1271617 (= e!725162 tp_is_empty!32977)))

(declare-fun b!1271618 () Bool)

(declare-fun res!846000 () Bool)

(assert (=> b!1271618 (=> (not res!846000) (not e!725161))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271618 (= res!846000 (and (= (size!40674 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40675 _keys!1364) (size!40674 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271619 () Bool)

(declare-fun e!725163 () Bool)

(assert (=> b!1271619 (= e!725163 tp_is_empty!32977)))

(declare-fun b!1271620 () Bool)

(assert (=> b!1271620 (= e!725159 (and e!725163 mapRes!51046))))

(declare-fun condMapEmpty!51046 () Bool)

(declare-fun mapDefault!51046 () ValueCell!15635)

