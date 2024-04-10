; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110494 () Bool)

(assert start!110494)

(declare-fun b_free!29329 () Bool)

(declare-fun b_next!29329 () Bool)

(assert (=> start!110494 (= b_free!29329 (not b_next!29329))))

(declare-fun tp!103309 () Bool)

(declare-fun b_and!47537 () Bool)

(assert (=> start!110494 (= tp!103309 b_and!47537)))

(declare-fun res!867654 () Bool)

(declare-fun e!745832 () Bool)

(assert (=> start!110494 (=> (not res!867654) (not e!745832))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110494 (= res!867654 (validMask!0 mask!2040))))

(assert (=> start!110494 e!745832))

(assert (=> start!110494 tp!103309))

(declare-datatypes ((array!87124 0))(
  ( (array!87125 (arr!42042 (Array (_ BitVec 32) (_ BitVec 64))) (size!42592 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87124)

(declare-fun array_inv!31781 (array!87124) Bool)

(assert (=> start!110494 (array_inv!31781 _keys!1628)))

(assert (=> start!110494 true))

(declare-fun tp_is_empty!35059 () Bool)

(assert (=> start!110494 tp_is_empty!35059))

(declare-datatypes ((V!51849 0))(
  ( (V!51850 (val!17604 Int)) )
))
(declare-datatypes ((ValueCell!16631 0))(
  ( (ValueCellFull!16631 (v!20231 V!51849)) (EmptyCell!16631) )
))
(declare-datatypes ((array!87126 0))(
  ( (array!87127 (arr!42043 (Array (_ BitVec 32) ValueCell!16631)) (size!42593 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87126)

(declare-fun e!745829 () Bool)

(declare-fun array_inv!31782 (array!87126) Bool)

(assert (=> start!110494 (and (array_inv!31782 _values!1354) e!745829)))

(declare-fun b!1307087 () Bool)

(declare-fun e!745830 () Bool)

(declare-fun mapRes!54217 () Bool)

(assert (=> b!1307087 (= e!745829 (and e!745830 mapRes!54217))))

(declare-fun condMapEmpty!54217 () Bool)

(declare-fun mapDefault!54217 () ValueCell!16631)

