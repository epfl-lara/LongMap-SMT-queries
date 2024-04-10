; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33520 () Bool)

(assert start!33520)

(declare-fun b_free!6809 () Bool)

(declare-fun b_next!6809 () Bool)

(assert (=> start!33520 (= b_free!6809 (not b_next!6809))))

(declare-fun tp!23922 () Bool)

(declare-fun b_and!13983 () Bool)

(assert (=> start!33520 (= tp!23922 b_and!13983)))

(declare-fun b!332646 () Bool)

(declare-fun res!183261 () Bool)

(declare-fun e!204271 () Bool)

(assert (=> b!332646 (=> (not res!183261) (not e!204271))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9991 0))(
  ( (V!9992 (val!3425 Int)) )
))
(declare-datatypes ((ValueCell!3037 0))(
  ( (ValueCellFull!3037 (v!5584 V!9991)) (EmptyCell!3037) )
))
(declare-datatypes ((array!17119 0))(
  ( (array!17120 (arr!8093 (Array (_ BitVec 32) ValueCell!3037)) (size!8445 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17119)

(declare-datatypes ((array!17121 0))(
  ( (array!17122 (arr!8094 (Array (_ BitVec 32) (_ BitVec 64))) (size!8446 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17121)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332646 (= res!183261 (and (= (size!8445 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8446 _keys!1895) (size!8445 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332647 () Bool)

(declare-fun res!183259 () Bool)

(assert (=> b!332647 (=> (not res!183259) (not e!204271))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332647 (= res!183259 (validKeyInArray!0 k!1348))))

(declare-fun b!332648 () Bool)

(declare-fun res!183260 () Bool)

(assert (=> b!332648 (=> (not res!183260) (not e!204271))))

(declare-datatypes ((List!4605 0))(
  ( (Nil!4602) (Cons!4601 (h!5457 (_ BitVec 64)) (t!9687 List!4605)) )
))
(declare-fun arrayNoDuplicates!0 (array!17121 (_ BitVec 32) List!4605) Bool)

(assert (=> b!332648 (= res!183260 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4602))))

(declare-fun b!332649 () Bool)

(declare-fun e!204269 () Bool)

(declare-fun tp_is_empty!6761 () Bool)

(assert (=> b!332649 (= e!204269 tp_is_empty!6761)))

(declare-fun res!183263 () Bool)

(assert (=> start!33520 (=> (not res!183263) (not e!204271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33520 (= res!183263 (validMask!0 mask!2385))))

(assert (=> start!33520 e!204271))

(assert (=> start!33520 true))

(assert (=> start!33520 tp_is_empty!6761))

(assert (=> start!33520 tp!23922))

(declare-fun e!204270 () Bool)

(declare-fun array_inv!6030 (array!17119) Bool)

(assert (=> start!33520 (and (array_inv!6030 _values!1525) e!204270)))

(declare-fun array_inv!6031 (array!17121) Bool)

(assert (=> start!33520 (array_inv!6031 _keys!1895)))

(declare-fun mapIsEmpty!11529 () Bool)

(declare-fun mapRes!11529 () Bool)

(assert (=> mapIsEmpty!11529 mapRes!11529))

(declare-fun mapNonEmpty!11529 () Bool)

(declare-fun tp!23921 () Bool)

(declare-fun e!204272 () Bool)

(assert (=> mapNonEmpty!11529 (= mapRes!11529 (and tp!23921 e!204272))))

(declare-fun mapRest!11529 () (Array (_ BitVec 32) ValueCell!3037))

(declare-fun mapKey!11529 () (_ BitVec 32))

(declare-fun mapValue!11529 () ValueCell!3037)

(assert (=> mapNonEmpty!11529 (= (arr!8093 _values!1525) (store mapRest!11529 mapKey!11529 mapValue!11529))))

(declare-fun b!332650 () Bool)

(assert (=> b!332650 (= e!204270 (and e!204269 mapRes!11529))))

(declare-fun condMapEmpty!11529 () Bool)

(declare-fun mapDefault!11529 () ValueCell!3037)

