; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110386 () Bool)

(assert start!110386)

(declare-fun mapNonEmpty!54091 () Bool)

(declare-fun mapRes!54091 () Bool)

(declare-fun tp!103171 () Bool)

(declare-fun e!745173 () Bool)

(assert (=> mapNonEmpty!54091 (= mapRes!54091 (and tp!103171 e!745173))))

(declare-datatypes ((V!51745 0))(
  ( (V!51746 (val!17565 Int)) )
))
(declare-datatypes ((ValueCell!16592 0))(
  ( (ValueCellFull!16592 (v!20191 V!51745)) (EmptyCell!16592) )
))
(declare-fun mapValue!54091 () ValueCell!16592)

(declare-fun mapKey!54091 () (_ BitVec 32))

(declare-fun mapRest!54091 () (Array (_ BitVec 32) ValueCell!16592))

(declare-datatypes ((array!86976 0))(
  ( (array!86977 (arr!41971 (Array (_ BitVec 32) ValueCell!16592)) (size!42521 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86976)

(assert (=> mapNonEmpty!54091 (= (arr!41971 _values!1354) (store mapRest!54091 mapKey!54091 mapValue!54091))))

(declare-fun b!1306238 () Bool)

(declare-fun res!867195 () Bool)

(declare-fun e!745170 () Bool)

(assert (=> b!1306238 (=> (not res!867195) (not e!745170))))

(declare-datatypes ((array!86978 0))(
  ( (array!86979 (arr!41972 (Array (_ BitVec 32) (_ BitVec 64))) (size!42522 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86978)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306238 (= res!867195 (and (= (size!42521 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42522 _keys!1628) (size!42521 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54091 () Bool)

(assert (=> mapIsEmpty!54091 mapRes!54091))

(declare-fun b!1306239 () Bool)

(declare-fun tp_is_empty!34981 () Bool)

(assert (=> b!1306239 (= e!745173 tp_is_empty!34981)))

(declare-fun b!1306240 () Bool)

(declare-fun e!745171 () Bool)

(declare-fun e!745169 () Bool)

(assert (=> b!1306240 (= e!745171 (and e!745169 mapRes!54091))))

(declare-fun condMapEmpty!54091 () Bool)

(declare-fun mapDefault!54091 () ValueCell!16592)

