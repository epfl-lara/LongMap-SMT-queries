; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106970 () Bool)

(assert start!106970)

(declare-fun b!1268429 () Bool)

(declare-fun res!844245 () Bool)

(declare-fun e!722777 () Bool)

(assert (=> b!1268429 (=> (not res!844245) (not e!722777))))

(declare-datatypes ((array!82592 0))(
  ( (array!82593 (arr!39833 (Array (_ BitVec 32) (_ BitVec 64))) (size!40369 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82592)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82592 (_ BitVec 32)) Bool)

(assert (=> b!1268429 (= res!844245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268430 () Bool)

(declare-fun e!722778 () Bool)

(declare-fun tp_is_empty!32659 () Bool)

(assert (=> b!1268430 (= e!722778 tp_is_empty!32659)))

(declare-fun b!1268431 () Bool)

(declare-fun e!722774 () Bool)

(declare-fun e!722776 () Bool)

(declare-fun mapRes!50569 () Bool)

(assert (=> b!1268431 (= e!722774 (and e!722776 mapRes!50569))))

(declare-fun condMapEmpty!50569 () Bool)

(declare-datatypes ((V!48739 0))(
  ( (V!48740 (val!16404 Int)) )
))
(declare-datatypes ((ValueCell!15476 0))(
  ( (ValueCellFull!15476 (v!19041 V!48739)) (EmptyCell!15476) )
))
(declare-datatypes ((array!82594 0))(
  ( (array!82595 (arr!39834 (Array (_ BitVec 32) ValueCell!15476)) (size!40370 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82594)

(declare-fun mapDefault!50569 () ValueCell!15476)

