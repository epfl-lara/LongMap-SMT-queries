; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43376 () Bool)

(assert start!43376)

(declare-fun b_free!12203 () Bool)

(declare-fun b_next!12203 () Bool)

(assert (=> start!43376 (= b_free!12203 (not b_next!12203))))

(declare-fun tp!42885 () Bool)

(declare-fun b_and!20959 () Bool)

(assert (=> start!43376 (= tp!42885 b_and!20959)))

(declare-fun b!480561 () Bool)

(declare-fun res!286587 () Bool)

(declare-fun e!282761 () Bool)

(assert (=> b!480561 (=> (not res!286587) (not e!282761))))

(declare-datatypes ((array!31095 0))(
  ( (array!31096 (arr!14952 (Array (_ BitVec 32) (_ BitVec 64))) (size!15310 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31095)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31095 (_ BitVec 32)) Bool)

(assert (=> b!480561 (= res!286587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480562 () Bool)

(assert (=> b!480562 (= e!282761 (not true))))

(declare-fun lt!218172 () (_ BitVec 32))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31095 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480562 (= lt!218172 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!282760 () Bool)

(assert (=> b!480562 e!282760))

(declare-fun c!57790 () Bool)

(assert (=> b!480562 (= c!57790 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14090 0))(
  ( (Unit!14091) )
))
(declare-fun lt!218173 () Unit!14090)

(declare-datatypes ((V!19357 0))(
  ( (V!19358 (val!6905 Int)) )
))
(declare-fun minValue!1458 () V!19357)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19357)

(declare-datatypes ((ValueCell!6496 0))(
  ( (ValueCellFull!6496 (v!9196 V!19357)) (EmptyCell!6496) )
))
(declare-datatypes ((array!31097 0))(
  ( (array!31098 (arr!14953 (Array (_ BitVec 32) ValueCell!6496)) (size!15311 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31097)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!118 (array!31095 array!31097 (_ BitVec 32) (_ BitVec 32) V!19357 V!19357 (_ BitVec 64) Int) Unit!14090)

(assert (=> b!480562 (= lt!218173 (lemmaKeyInListMapIsInArray!118 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22276 () Bool)

(declare-fun mapRes!22276 () Bool)

(declare-fun tp!42886 () Bool)

(declare-fun e!282764 () Bool)

(assert (=> mapNonEmpty!22276 (= mapRes!22276 (and tp!42886 e!282764))))

(declare-fun mapKey!22276 () (_ BitVec 32))

(declare-fun mapRest!22276 () (Array (_ BitVec 32) ValueCell!6496))

(declare-fun mapValue!22276 () ValueCell!6496)

(assert (=> mapNonEmpty!22276 (= (arr!14953 _values!1516) (store mapRest!22276 mapKey!22276 mapValue!22276))))

(declare-fun b!480563 () Bool)

(declare-fun e!282762 () Bool)

(declare-fun tp_is_empty!13715 () Bool)

(assert (=> b!480563 (= e!282762 tp_is_empty!13715)))

(declare-fun b!480564 () Bool)

(declare-fun e!282765 () Bool)

(assert (=> b!480564 (= e!282765 (and e!282762 mapRes!22276))))

(declare-fun condMapEmpty!22276 () Bool)

(declare-fun mapDefault!22276 () ValueCell!6496)

