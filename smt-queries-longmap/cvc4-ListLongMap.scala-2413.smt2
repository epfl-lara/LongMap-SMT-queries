; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38188 () Bool)

(assert start!38188)

(declare-fun b_free!9047 () Bool)

(declare-fun b_next!9047 () Bool)

(assert (=> start!38188 (= b_free!9047 (not b_next!9047))))

(declare-fun tp!31926 () Bool)

(declare-fun b_and!16421 () Bool)

(assert (=> start!38188 (= tp!31926 b_and!16421)))

(declare-fun b!393742 () Bool)

(declare-fun res!225604 () Bool)

(declare-fun e!238382 () Bool)

(assert (=> b!393742 (=> (not res!225604) (not e!238382))))

(declare-datatypes ((array!23345 0))(
  ( (array!23346 (arr!11130 (Array (_ BitVec 32) (_ BitVec 64))) (size!11482 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23345)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23345 (_ BitVec 32)) Bool)

(assert (=> b!393742 (= res!225604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393743 () Bool)

(declare-fun res!225596 () Bool)

(assert (=> b!393743 (=> (not res!225596) (not e!238382))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393743 (= res!225596 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11482 _keys!658))))))

(declare-fun b!393744 () Bool)

(declare-fun e!238381 () Bool)

(assert (=> b!393744 (= e!238382 e!238381)))

(declare-fun res!225597 () Bool)

(assert (=> b!393744 (=> (not res!225597) (not e!238381))))

(declare-fun lt!186418 () array!23345)

(assert (=> b!393744 (= res!225597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186418 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!393744 (= lt!186418 (array!23346 (store (arr!11130 _keys!658) i!548 k!778) (size!11482 _keys!658)))))

(declare-fun b!393745 () Bool)

(declare-fun e!238387 () Bool)

(assert (=> b!393745 (= e!238387 true)))

(declare-datatypes ((V!14063 0))(
  ( (V!14064 (val!4904 Int)) )
))
(declare-datatypes ((tuple2!6620 0))(
  ( (tuple2!6621 (_1!3321 (_ BitVec 64)) (_2!3321 V!14063)) )
))
(declare-datatypes ((List!6473 0))(
  ( (Nil!6470) (Cons!6469 (h!7325 tuple2!6620) (t!11645 List!6473)) )
))
(declare-datatypes ((ListLongMap!5533 0))(
  ( (ListLongMap!5534 (toList!2782 List!6473)) )
))
(declare-fun lt!186416 () ListLongMap!5533)

(declare-fun lt!186419 () ListLongMap!5533)

(assert (=> b!393745 (= lt!186416 lt!186419)))

(declare-fun b!393746 () Bool)

(declare-fun res!225605 () Bool)

(assert (=> b!393746 (=> (not res!225605) (not e!238382))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4516 0))(
  ( (ValueCellFull!4516 (v!7145 V!14063)) (EmptyCell!4516) )
))
(declare-datatypes ((array!23347 0))(
  ( (array!23348 (arr!11131 (Array (_ BitVec 32) ValueCell!4516)) (size!11483 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23347)

(assert (=> b!393746 (= res!225605 (and (= (size!11483 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11482 _keys!658) (size!11483 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16176 () Bool)

(declare-fun mapRes!16176 () Bool)

(declare-fun tp!31925 () Bool)

(declare-fun e!238386 () Bool)

(assert (=> mapNonEmpty!16176 (= mapRes!16176 (and tp!31925 e!238386))))

(declare-fun mapKey!16176 () (_ BitVec 32))

(declare-fun mapRest!16176 () (Array (_ BitVec 32) ValueCell!4516))

(declare-fun mapValue!16176 () ValueCell!4516)

(assert (=> mapNonEmpty!16176 (= (arr!11131 _values!506) (store mapRest!16176 mapKey!16176 mapValue!16176))))

(declare-fun b!393747 () Bool)

(declare-fun res!225600 () Bool)

(assert (=> b!393747 (=> (not res!225600) (not e!238382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393747 (= res!225600 (validKeyInArray!0 k!778))))

(declare-fun b!393748 () Bool)

(declare-fun e!238383 () Bool)

(declare-fun e!238385 () Bool)

(assert (=> b!393748 (= e!238383 (and e!238385 mapRes!16176))))

(declare-fun condMapEmpty!16176 () Bool)

(declare-fun mapDefault!16176 () ValueCell!4516)

