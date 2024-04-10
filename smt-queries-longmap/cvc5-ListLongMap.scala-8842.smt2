; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107276 () Bool)

(assert start!107276)

(declare-fun res!845948 () Bool)

(declare-fun e!725070 () Bool)

(assert (=> start!107276 (=> (not res!845948) (not e!725070))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107276 (= res!845948 (validMask!0 mask!1730))))

(assert (=> start!107276 e!725070))

(declare-datatypes ((V!49147 0))(
  ( (V!49148 (val!16557 Int)) )
))
(declare-datatypes ((ValueCell!15629 0))(
  ( (ValueCellFull!15629 (v!19194 V!49147)) (EmptyCell!15629) )
))
(declare-datatypes ((array!83178 0))(
  ( (array!83179 (arr!40126 (Array (_ BitVec 32) ValueCell!15629)) (size!40662 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83178)

(declare-fun e!725071 () Bool)

(declare-fun array_inv!30519 (array!83178) Bool)

(assert (=> start!107276 (and (array_inv!30519 _values!1134) e!725071)))

(assert (=> start!107276 true))

(declare-datatypes ((array!83180 0))(
  ( (array!83181 (arr!40127 (Array (_ BitVec 32) (_ BitVec 64))) (size!40663 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83180)

(declare-fun array_inv!30520 (array!83180) Bool)

(assert (=> start!107276 (array_inv!30520 _keys!1364)))

(declare-fun b!1271507 () Bool)

(assert (=> b!1271507 (= e!725070 false)))

(declare-fun lt!574884 () Bool)

(declare-datatypes ((List!28528 0))(
  ( (Nil!28525) (Cons!28524 (h!29733 (_ BitVec 64)) (t!42057 List!28528)) )
))
(declare-fun arrayNoDuplicates!0 (array!83180 (_ BitVec 32) List!28528) Bool)

(assert (=> b!1271507 (= lt!574884 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28525))))

(declare-fun b!1271508 () Bool)

(declare-fun e!725069 () Bool)

(declare-fun tp_is_empty!32965 () Bool)

(assert (=> b!1271508 (= e!725069 tp_is_empty!32965)))

(declare-fun mapIsEmpty!51028 () Bool)

(declare-fun mapRes!51028 () Bool)

(assert (=> mapIsEmpty!51028 mapRes!51028))

(declare-fun b!1271509 () Bool)

(declare-fun res!845947 () Bool)

(assert (=> b!1271509 (=> (not res!845947) (not e!725070))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271509 (= res!845947 (and (= (size!40662 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40663 _keys!1364) (size!40662 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271510 () Bool)

(declare-fun res!845946 () Bool)

(assert (=> b!1271510 (=> (not res!845946) (not e!725070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83180 (_ BitVec 32)) Bool)

(assert (=> b!1271510 (= res!845946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271511 () Bool)

(declare-fun e!725073 () Bool)

(assert (=> b!1271511 (= e!725073 tp_is_empty!32965)))

(declare-fun mapNonEmpty!51028 () Bool)

(declare-fun tp!97369 () Bool)

(assert (=> mapNonEmpty!51028 (= mapRes!51028 (and tp!97369 e!725073))))

(declare-fun mapRest!51028 () (Array (_ BitVec 32) ValueCell!15629))

(declare-fun mapKey!51028 () (_ BitVec 32))

(declare-fun mapValue!51028 () ValueCell!15629)

(assert (=> mapNonEmpty!51028 (= (arr!40126 _values!1134) (store mapRest!51028 mapKey!51028 mapValue!51028))))

(declare-fun b!1271512 () Bool)

(assert (=> b!1271512 (= e!725071 (and e!725069 mapRes!51028))))

(declare-fun condMapEmpty!51028 () Bool)

(declare-fun mapDefault!51028 () ValueCell!15629)

