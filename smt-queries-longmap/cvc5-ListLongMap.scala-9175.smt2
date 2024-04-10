; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110354 () Bool)

(assert start!110354)

(declare-fun b!1306080 () Bool)

(declare-fun e!745014 () Bool)

(declare-fun tp_is_empty!34963 () Bool)

(assert (=> b!1306080 (= e!745014 tp_is_empty!34963)))

(declare-fun mapNonEmpty!54058 () Bool)

(declare-fun mapRes!54058 () Bool)

(declare-fun tp!103138 () Bool)

(assert (=> mapNonEmpty!54058 (= mapRes!54058 (and tp!103138 e!745014))))

(declare-fun mapKey!54058 () (_ BitVec 32))

(declare-datatypes ((V!51721 0))(
  ( (V!51722 (val!17556 Int)) )
))
(declare-datatypes ((ValueCell!16583 0))(
  ( (ValueCellFull!16583 (v!20182 V!51721)) (EmptyCell!16583) )
))
(declare-datatypes ((array!86944 0))(
  ( (array!86945 (arr!41957 (Array (_ BitVec 32) ValueCell!16583)) (size!42507 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86944)

(declare-fun mapValue!54058 () ValueCell!16583)

(declare-fun mapRest!54058 () (Array (_ BitVec 32) ValueCell!16583))

(assert (=> mapNonEmpty!54058 (= (arr!41957 _values!1354) (store mapRest!54058 mapKey!54058 mapValue!54058))))

(declare-fun b!1306081 () Bool)

(declare-fun e!745016 () Bool)

(declare-fun e!745015 () Bool)

(assert (=> b!1306081 (= e!745016 (and e!745015 mapRes!54058))))

(declare-fun condMapEmpty!54058 () Bool)

(declare-fun mapDefault!54058 () ValueCell!16583)

