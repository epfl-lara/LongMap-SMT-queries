; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107232 () Bool)

(assert start!107232)

(declare-fun mapNonEmpty!50962 () Bool)

(declare-fun mapRes!50962 () Bool)

(declare-fun tp!97303 () Bool)

(declare-fun e!724743 () Bool)

(assert (=> mapNonEmpty!50962 (= mapRes!50962 (and tp!97303 e!724743))))

(declare-datatypes ((V!49087 0))(
  ( (V!49088 (val!16535 Int)) )
))
(declare-datatypes ((ValueCell!15607 0))(
  ( (ValueCellFull!15607 (v!19172 V!49087)) (EmptyCell!15607) )
))
(declare-datatypes ((array!83098 0))(
  ( (array!83099 (arr!40086 (Array (_ BitVec 32) ValueCell!15607)) (size!40622 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83098)

(declare-fun mapRest!50962 () (Array (_ BitVec 32) ValueCell!15607))

(declare-fun mapValue!50962 () ValueCell!15607)

(declare-fun mapKey!50962 () (_ BitVec 32))

(assert (=> mapNonEmpty!50962 (= (arr!40086 _values!1134) (store mapRest!50962 mapKey!50962 mapValue!50962))))

(declare-fun mapIsEmpty!50962 () Bool)

(assert (=> mapIsEmpty!50962 mapRes!50962))

(declare-fun b!1271111 () Bool)

(declare-fun e!724742 () Bool)

(declare-fun tp_is_empty!32921 () Bool)

(assert (=> b!1271111 (= e!724742 tp_is_empty!32921)))

(declare-fun b!1271113 () Bool)

(assert (=> b!1271113 (= e!724743 tp_is_empty!32921)))

(declare-fun b!1271114 () Bool)

(declare-fun res!845748 () Bool)

(declare-fun e!724741 () Bool)

(assert (=> b!1271114 (=> (not res!845748) (not e!724741))))

(declare-datatypes ((array!83100 0))(
  ( (array!83101 (arr!40087 (Array (_ BitVec 32) (_ BitVec 64))) (size!40623 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83100)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83100 (_ BitVec 32)) Bool)

(assert (=> b!1271114 (= res!845748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271115 () Bool)

(declare-fun e!724739 () Bool)

(assert (=> b!1271115 (= e!724739 (and e!724742 mapRes!50962))))

(declare-fun condMapEmpty!50962 () Bool)

(declare-fun mapDefault!50962 () ValueCell!15607)

