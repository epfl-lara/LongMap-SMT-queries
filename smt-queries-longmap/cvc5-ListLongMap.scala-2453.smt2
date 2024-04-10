; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38536 () Bool)

(assert start!38536)

(declare-fun b!398348 () Bool)

(declare-fun res!228907 () Bool)

(declare-fun e!240779 () Bool)

(assert (=> b!398348 (=> (not res!228907) (not e!240779))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398348 (= res!228907 (validMask!0 mask!1025))))

(declare-fun b!398349 () Bool)

(declare-fun e!240780 () Bool)

(declare-fun tp_is_empty!9955 () Bool)

(assert (=> b!398349 (= e!240780 tp_is_empty!9955)))

(declare-fun b!398350 () Bool)

(declare-fun res!228904 () Bool)

(assert (=> b!398350 (=> (not res!228904) (not e!240779))))

(declare-datatypes ((array!23821 0))(
  ( (array!23822 (arr!11360 (Array (_ BitVec 32) (_ BitVec 64))) (size!11712 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23821)

(declare-datatypes ((List!6569 0))(
  ( (Nil!6566) (Cons!6565 (h!7421 (_ BitVec 64)) (t!11743 List!6569)) )
))
(declare-fun arrayNoDuplicates!0 (array!23821 (_ BitVec 32) List!6569) Bool)

(assert (=> b!398350 (= res!228904 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6566))))

(declare-fun b!398351 () Bool)

(declare-fun res!228903 () Bool)

(assert (=> b!398351 (=> (not res!228903) (not e!240779))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398351 (= res!228903 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11712 _keys!709))))))

(declare-fun mapIsEmpty!16554 () Bool)

(declare-fun mapRes!16554 () Bool)

(assert (=> mapIsEmpty!16554 mapRes!16554))

(declare-fun b!398352 () Bool)

(declare-fun e!240776 () Bool)

(assert (=> b!398352 (= e!240776 false)))

(declare-fun lt!187444 () Bool)

(declare-fun lt!187445 () array!23821)

(assert (=> b!398352 (= lt!187444 (arrayNoDuplicates!0 lt!187445 #b00000000000000000000000000000000 Nil!6566))))

(declare-fun b!398354 () Bool)

(declare-fun res!228900 () Bool)

(assert (=> b!398354 (=> (not res!228900) (not e!240779))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398354 (= res!228900 (validKeyInArray!0 k!794))))

(declare-fun b!398353 () Bool)

(declare-fun res!228901 () Bool)

(assert (=> b!398353 (=> (not res!228901) (not e!240779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23821 (_ BitVec 32)) Bool)

(assert (=> b!398353 (= res!228901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!228905 () Bool)

(assert (=> start!38536 (=> (not res!228905) (not e!240779))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38536 (= res!228905 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11712 _keys!709))))))

(assert (=> start!38536 e!240779))

(assert (=> start!38536 true))

(declare-datatypes ((V!14379 0))(
  ( (V!14380 (val!5022 Int)) )
))
(declare-datatypes ((ValueCell!4634 0))(
  ( (ValueCellFull!4634 (v!7269 V!14379)) (EmptyCell!4634) )
))
(declare-datatypes ((array!23823 0))(
  ( (array!23824 (arr!11361 (Array (_ BitVec 32) ValueCell!4634)) (size!11713 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23823)

(declare-fun e!240777 () Bool)

(declare-fun array_inv!8326 (array!23823) Bool)

(assert (=> start!38536 (and (array_inv!8326 _values!549) e!240777)))

(declare-fun array_inv!8327 (array!23821) Bool)

(assert (=> start!38536 (array_inv!8327 _keys!709)))

(declare-fun b!398355 () Bool)

(declare-fun res!228902 () Bool)

(assert (=> b!398355 (=> (not res!228902) (not e!240779))))

(declare-fun arrayContainsKey!0 (array!23821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398355 (= res!228902 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16554 () Bool)

(declare-fun tp!32349 () Bool)

(assert (=> mapNonEmpty!16554 (= mapRes!16554 (and tp!32349 e!240780))))

(declare-fun mapKey!16554 () (_ BitVec 32))

(declare-fun mapValue!16554 () ValueCell!4634)

(declare-fun mapRest!16554 () (Array (_ BitVec 32) ValueCell!4634))

(assert (=> mapNonEmpty!16554 (= (arr!11361 _values!549) (store mapRest!16554 mapKey!16554 mapValue!16554))))

(declare-fun b!398356 () Bool)

(assert (=> b!398356 (= e!240779 e!240776)))

(declare-fun res!228906 () Bool)

(assert (=> b!398356 (=> (not res!228906) (not e!240776))))

(assert (=> b!398356 (= res!228906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187445 mask!1025))))

(assert (=> b!398356 (= lt!187445 (array!23822 (store (arr!11360 _keys!709) i!563 k!794) (size!11712 _keys!709)))))

(declare-fun b!398357 () Bool)

(declare-fun e!240775 () Bool)

(assert (=> b!398357 (= e!240775 tp_is_empty!9955)))

(declare-fun b!398358 () Bool)

(assert (=> b!398358 (= e!240777 (and e!240775 mapRes!16554))))

(declare-fun condMapEmpty!16554 () Bool)

(declare-fun mapDefault!16554 () ValueCell!4634)

