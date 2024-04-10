; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107168 () Bool)

(assert start!107168)

(declare-fun b!1270535 () Bool)

(declare-fun e!724260 () Bool)

(declare-fun tp_is_empty!32857 () Bool)

(assert (=> b!1270535 (= e!724260 tp_is_empty!32857)))

(declare-fun b!1270536 () Bool)

(declare-fun e!724259 () Bool)

(assert (=> b!1270536 (= e!724259 false)))

(declare-fun lt!574722 () Bool)

(declare-datatypes ((array!82974 0))(
  ( (array!82975 (arr!40024 (Array (_ BitVec 32) (_ BitVec 64))) (size!40560 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82974)

(declare-datatypes ((List!28491 0))(
  ( (Nil!28488) (Cons!28487 (h!29696 (_ BitVec 64)) (t!42020 List!28491)) )
))
(declare-fun arrayNoDuplicates!0 (array!82974 (_ BitVec 32) List!28491) Bool)

(assert (=> b!1270536 (= lt!574722 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28488))))

(declare-fun b!1270537 () Bool)

(declare-fun res!845461 () Bool)

(assert (=> b!1270537 (=> (not res!845461) (not e!724259))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82974 (_ BitVec 32)) Bool)

(assert (=> b!1270537 (= res!845461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50866 () Bool)

(declare-fun mapRes!50866 () Bool)

(declare-fun tp!97207 () Bool)

(assert (=> mapNonEmpty!50866 (= mapRes!50866 (and tp!97207 e!724260))))

(declare-datatypes ((V!49003 0))(
  ( (V!49004 (val!16503 Int)) )
))
(declare-datatypes ((ValueCell!15575 0))(
  ( (ValueCellFull!15575 (v!19140 V!49003)) (EmptyCell!15575) )
))
(declare-datatypes ((array!82976 0))(
  ( (array!82977 (arr!40025 (Array (_ BitVec 32) ValueCell!15575)) (size!40561 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82976)

(declare-fun mapKey!50866 () (_ BitVec 32))

(declare-fun mapRest!50866 () (Array (_ BitVec 32) ValueCell!15575))

(declare-fun mapValue!50866 () ValueCell!15575)

(assert (=> mapNonEmpty!50866 (= (arr!40025 _values!1134) (store mapRest!50866 mapKey!50866 mapValue!50866))))

(declare-fun b!1270538 () Bool)

(declare-fun e!724262 () Bool)

(declare-fun e!724261 () Bool)

(assert (=> b!1270538 (= e!724262 (and e!724261 mapRes!50866))))

(declare-fun condMapEmpty!50866 () Bool)

(declare-fun mapDefault!50866 () ValueCell!15575)

