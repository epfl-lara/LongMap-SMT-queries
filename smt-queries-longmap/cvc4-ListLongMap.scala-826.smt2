; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20056 () Bool)

(assert start!20056)

(declare-fun b!196395 () Bool)

(declare-fun e!129341 () Bool)

(assert (=> b!196395 (= e!129341 false)))

(declare-fun lt!97611 () Bool)

(declare-datatypes ((array!8399 0))(
  ( (array!8400 (arr!3950 (Array (_ BitVec 32) (_ BitVec 64))) (size!4275 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8399)

(declare-datatypes ((List!2470 0))(
  ( (Nil!2467) (Cons!2466 (h!3108 (_ BitVec 64)) (t!7401 List!2470)) )
))
(declare-fun arrayNoDuplicates!0 (array!8399 (_ BitVec 32) List!2470) Bool)

(assert (=> b!196395 (= lt!97611 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2467))))

(declare-fun mapNonEmpty!7925 () Bool)

(declare-fun mapRes!7925 () Bool)

(declare-fun tp!17213 () Bool)

(declare-fun e!129343 () Bool)

(assert (=> mapNonEmpty!7925 (= mapRes!7925 (and tp!17213 e!129343))))

(declare-datatypes ((V!5741 0))(
  ( (V!5742 (val!2330 Int)) )
))
(declare-datatypes ((ValueCell!1942 0))(
  ( (ValueCellFull!1942 (v!4300 V!5741)) (EmptyCell!1942) )
))
(declare-datatypes ((array!8401 0))(
  ( (array!8402 (arr!3951 (Array (_ BitVec 32) ValueCell!1942)) (size!4276 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8401)

(declare-fun mapKey!7925 () (_ BitVec 32))

(declare-fun mapValue!7925 () ValueCell!1942)

(declare-fun mapRest!7925 () (Array (_ BitVec 32) ValueCell!1942))

(assert (=> mapNonEmpty!7925 (= (arr!3951 _values!649) (store mapRest!7925 mapKey!7925 mapValue!7925))))

(declare-fun res!92694 () Bool)

(assert (=> start!20056 (=> (not res!92694) (not e!129341))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20056 (= res!92694 (validMask!0 mask!1149))))

(assert (=> start!20056 e!129341))

(assert (=> start!20056 true))

(declare-fun e!129344 () Bool)

(declare-fun array_inv!2569 (array!8401) Bool)

(assert (=> start!20056 (and (array_inv!2569 _values!649) e!129344)))

(declare-fun array_inv!2570 (array!8399) Bool)

(assert (=> start!20056 (array_inv!2570 _keys!825)))

(declare-fun b!196396 () Bool)

(declare-fun e!129342 () Bool)

(declare-fun tp_is_empty!4571 () Bool)

(assert (=> b!196396 (= e!129342 tp_is_empty!4571)))

(declare-fun b!196397 () Bool)

(declare-fun res!92695 () Bool)

(assert (=> b!196397 (=> (not res!92695) (not e!129341))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196397 (= res!92695 (and (= (size!4276 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4275 _keys!825) (size!4276 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196398 () Bool)

(declare-fun res!92693 () Bool)

(assert (=> b!196398 (=> (not res!92693) (not e!129341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8399 (_ BitVec 32)) Bool)

(assert (=> b!196398 (= res!92693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7925 () Bool)

(assert (=> mapIsEmpty!7925 mapRes!7925))

(declare-fun b!196399 () Bool)

(assert (=> b!196399 (= e!129344 (and e!129342 mapRes!7925))))

(declare-fun condMapEmpty!7925 () Bool)

(declare-fun mapDefault!7925 () ValueCell!1942)

