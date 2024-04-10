; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33510 () Bool)

(assert start!33510)

(declare-fun b_free!6799 () Bool)

(declare-fun b_next!6799 () Bool)

(assert (=> start!33510 (= b_free!6799 (not b_next!6799))))

(declare-fun tp!23892 () Bool)

(declare-fun b_and!13973 () Bool)

(assert (=> start!33510 (= tp!23892 b_and!13973)))

(declare-fun b!332526 () Bool)

(declare-fun e!204195 () Bool)

(assert (=> b!332526 (= e!204195 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!9979 0))(
  ( (V!9980 (val!3420 Int)) )
))
(declare-fun zeroValue!1467 () V!9979)

(declare-datatypes ((ValueCell!3032 0))(
  ( (ValueCellFull!3032 (v!5579 V!9979)) (EmptyCell!3032) )
))
(declare-datatypes ((array!17099 0))(
  ( (array!17100 (arr!8083 (Array (_ BitVec 32) ValueCell!3032)) (size!8435 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17099)

(declare-datatypes ((array!17101 0))(
  ( (array!17102 (arr!8084 (Array (_ BitVec 32) (_ BitVec 64))) (size!8436 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17101)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9979)

(declare-fun lt!159022 () Bool)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!4982 0))(
  ( (tuple2!4983 (_1!2502 (_ BitVec 64)) (_2!2502 V!9979)) )
))
(declare-datatypes ((List!4595 0))(
  ( (Nil!4592) (Cons!4591 (h!5447 tuple2!4982) (t!9677 List!4595)) )
))
(declare-datatypes ((ListLongMap!3895 0))(
  ( (ListLongMap!3896 (toList!1963 List!4595)) )
))
(declare-fun contains!2004 (ListLongMap!3895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1491 (array!17101 array!17099 (_ BitVec 32) (_ BitVec 32) V!9979 V!9979 (_ BitVec 32) Int) ListLongMap!3895)

(assert (=> b!332526 (= lt!159022 (contains!2004 (getCurrentListMap!1491 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348))))

(declare-fun b!332527 () Bool)

(declare-fun res!183184 () Bool)

(assert (=> b!332527 (=> (not res!183184) (not e!204195))))

(assert (=> b!332527 (= res!183184 (and (= (size!8435 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8436 _keys!1895) (size!8435 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332528 () Bool)

(declare-fun e!204196 () Bool)

(declare-fun tp_is_empty!6751 () Bool)

(assert (=> b!332528 (= e!204196 tp_is_empty!6751)))

(declare-fun b!332529 () Bool)

(declare-fun e!204197 () Bool)

(assert (=> b!332529 (= e!204197 tp_is_empty!6751)))

(declare-fun mapIsEmpty!11514 () Bool)

(declare-fun mapRes!11514 () Bool)

(assert (=> mapIsEmpty!11514 mapRes!11514))

(declare-fun res!183188 () Bool)

(assert (=> start!33510 (=> (not res!183188) (not e!204195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33510 (= res!183188 (validMask!0 mask!2385))))

(assert (=> start!33510 e!204195))

(assert (=> start!33510 true))

(assert (=> start!33510 tp_is_empty!6751))

(assert (=> start!33510 tp!23892))

(declare-fun e!204198 () Bool)

(declare-fun array_inv!6022 (array!17099) Bool)

(assert (=> start!33510 (and (array_inv!6022 _values!1525) e!204198)))

(declare-fun array_inv!6023 (array!17101) Bool)

(assert (=> start!33510 (array_inv!6023 _keys!1895)))

(declare-fun b!332530 () Bool)

(declare-fun res!183185 () Bool)

(assert (=> b!332530 (=> (not res!183185) (not e!204195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17101 (_ BitVec 32)) Bool)

(assert (=> b!332530 (= res!183185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11514 () Bool)

(declare-fun tp!23891 () Bool)

(assert (=> mapNonEmpty!11514 (= mapRes!11514 (and tp!23891 e!204197))))

(declare-fun mapRest!11514 () (Array (_ BitVec 32) ValueCell!3032))

(declare-fun mapKey!11514 () (_ BitVec 32))

(declare-fun mapValue!11514 () ValueCell!3032)

(assert (=> mapNonEmpty!11514 (= (arr!8083 _values!1525) (store mapRest!11514 mapKey!11514 mapValue!11514))))

(declare-fun b!332531 () Bool)

(declare-fun res!183186 () Bool)

(assert (=> b!332531 (=> (not res!183186) (not e!204195))))

(declare-datatypes ((List!4596 0))(
  ( (Nil!4593) (Cons!4592 (h!5448 (_ BitVec 64)) (t!9678 List!4596)) )
))
(declare-fun arrayNoDuplicates!0 (array!17101 (_ BitVec 32) List!4596) Bool)

(assert (=> b!332531 (= res!183186 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4593))))

(declare-fun b!332532 () Bool)

(declare-fun res!183187 () Bool)

(assert (=> b!332532 (=> (not res!183187) (not e!204195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332532 (= res!183187 (validKeyInArray!0 k!1348))))

(declare-fun b!332533 () Bool)

(assert (=> b!332533 (= e!204198 (and e!204196 mapRes!11514))))

(declare-fun condMapEmpty!11514 () Bool)

(declare-fun mapDefault!11514 () ValueCell!3032)

