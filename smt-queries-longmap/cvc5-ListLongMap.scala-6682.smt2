; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84064 () Bool)

(assert start!84064)

(declare-fun b_free!19819 () Bool)

(declare-fun b_next!19819 () Bool)

(assert (=> start!84064 (= b_free!19819 (not b_next!19819))))

(declare-fun tp!68980 () Bool)

(declare-fun b_and!31721 () Bool)

(assert (=> start!84064 (= tp!68980 b_and!31721)))

(declare-fun mapNonEmpty!36329 () Bool)

(declare-fun mapRes!36329 () Bool)

(declare-fun tp!68979 () Bool)

(declare-fun e!554022 () Bool)

(assert (=> mapNonEmpty!36329 (= mapRes!36329 (and tp!68979 e!554022))))

(declare-datatypes ((V!35473 0))(
  ( (V!35474 (val!11484 Int)) )
))
(declare-datatypes ((ValueCell!10952 0))(
  ( (ValueCellFull!10952 (v!14046 V!35473)) (EmptyCell!10952) )
))
(declare-datatypes ((array!61723 0))(
  ( (array!61724 (arr!29719 (Array (_ BitVec 32) ValueCell!10952)) (size!30198 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61723)

(declare-fun mapValue!36329 () ValueCell!10952)

(declare-fun mapKey!36329 () (_ BitVec 32))

(declare-fun mapRest!36329 () (Array (_ BitVec 32) ValueCell!10952))

(assert (=> mapNonEmpty!36329 (= (arr!29719 _values!1278) (store mapRest!36329 mapKey!36329 mapValue!36329))))

(declare-fun b!982875 () Bool)

(declare-fun res!657740 () Bool)

(declare-fun e!554019 () Bool)

(assert (=> b!982875 (=> (not res!657740) (not e!554019))))

(declare-datatypes ((array!61725 0))(
  ( (array!61726 (arr!29720 (Array (_ BitVec 32) (_ BitVec 64))) (size!30199 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61725)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61725 (_ BitVec 32)) Bool)

(assert (=> b!982875 (= res!657740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982876 () Bool)

(declare-fun e!554018 () Bool)

(declare-fun e!554017 () Bool)

(assert (=> b!982876 (= e!554018 (and e!554017 mapRes!36329))))

(declare-fun condMapEmpty!36329 () Bool)

(declare-fun mapDefault!36329 () ValueCell!10952)

