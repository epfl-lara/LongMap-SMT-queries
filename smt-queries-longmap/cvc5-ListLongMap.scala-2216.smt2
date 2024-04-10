; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36758 () Bool)

(assert start!36758)

(declare-fun res!205289 () Bool)

(declare-fun e!224575 () Bool)

(assert (=> start!36758 (=> (not res!205289) (not e!224575))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36758 (= res!205289 (validMask!0 mask!970))))

(assert (=> start!36758 e!224575))

(assert (=> start!36758 true))

(declare-datatypes ((V!12483 0))(
  ( (V!12484 (val!4311 Int)) )
))
(declare-datatypes ((ValueCell!3923 0))(
  ( (ValueCellFull!3923 (v!6508 V!12483)) (EmptyCell!3923) )
))
(declare-datatypes ((array!21025 0))(
  ( (array!21026 (arr!9981 (Array (_ BitVec 32) ValueCell!3923)) (size!10333 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21025)

(declare-fun e!224574 () Bool)

(declare-fun array_inv!7382 (array!21025) Bool)

(assert (=> start!36758 (and (array_inv!7382 _values!506) e!224574)))

(declare-datatypes ((array!21027 0))(
  ( (array!21028 (arr!9982 (Array (_ BitVec 32) (_ BitVec 64))) (size!10334 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21027)

(declare-fun array_inv!7383 (array!21027) Bool)

(assert (=> start!36758 (array_inv!7383 _keys!658)))

(declare-fun b!366858 () Bool)

(declare-fun res!205286 () Bool)

(assert (=> b!366858 (=> (not res!205286) (not e!224575))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366858 (= res!205286 (and (= (size!10333 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10334 _keys!658) (size!10333 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366859 () Bool)

(declare-fun res!205285 () Bool)

(assert (=> b!366859 (=> (not res!205285) (not e!224575))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366859 (= res!205285 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366860 () Bool)

(declare-fun res!205281 () Bool)

(assert (=> b!366860 (=> (not res!205281) (not e!224575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21027 (_ BitVec 32)) Bool)

(assert (=> b!366860 (= res!205281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366861 () Bool)

(declare-fun e!224579 () Bool)

(declare-fun tp_is_empty!8533 () Bool)

(assert (=> b!366861 (= e!224579 tp_is_empty!8533)))

(declare-fun b!366862 () Bool)

(declare-fun e!224578 () Bool)

(assert (=> b!366862 (= e!224575 e!224578)))

(declare-fun res!205287 () Bool)

(assert (=> b!366862 (=> (not res!205287) (not e!224578))))

(declare-fun lt!169287 () array!21027)

(assert (=> b!366862 (= res!205287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169287 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366862 (= lt!169287 (array!21028 (store (arr!9982 _keys!658) i!548 k!778) (size!10334 _keys!658)))))

(declare-fun b!366863 () Bool)

(declare-fun res!205282 () Bool)

(assert (=> b!366863 (=> (not res!205282) (not e!224575))))

(assert (=> b!366863 (= res!205282 (or (= (select (arr!9982 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9982 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366864 () Bool)

(declare-fun e!224577 () Bool)

(assert (=> b!366864 (= e!224577 tp_is_empty!8533)))

(declare-fun mapNonEmpty!14364 () Bool)

(declare-fun mapRes!14364 () Bool)

(declare-fun tp!28440 () Bool)

(assert (=> mapNonEmpty!14364 (= mapRes!14364 (and tp!28440 e!224579))))

(declare-fun mapKey!14364 () (_ BitVec 32))

(declare-fun mapValue!14364 () ValueCell!3923)

(declare-fun mapRest!14364 () (Array (_ BitVec 32) ValueCell!3923))

(assert (=> mapNonEmpty!14364 (= (arr!9981 _values!506) (store mapRest!14364 mapKey!14364 mapValue!14364))))

(declare-fun b!366865 () Bool)

(declare-fun res!205283 () Bool)

(assert (=> b!366865 (=> (not res!205283) (not e!224575))))

(assert (=> b!366865 (= res!205283 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10334 _keys!658))))))

(declare-fun b!366866 () Bool)

(assert (=> b!366866 (= e!224574 (and e!224577 mapRes!14364))))

(declare-fun condMapEmpty!14364 () Bool)

(declare-fun mapDefault!14364 () ValueCell!3923)

