; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36728 () Bool)

(assert start!36728)

(declare-fun b!366562 () Bool)

(declare-fun res!205069 () Bool)

(declare-fun e!224419 () Bool)

(assert (=> b!366562 (=> (not res!205069) (not e!224419))))

(declare-datatypes ((array!20999 0))(
  ( (array!21000 (arr!9969 (Array (_ BitVec 32) (_ BitVec 64))) (size!10321 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20999)

(assert (=> b!366562 (= res!205069 (and (bvsle #b00000000000000000000000000000000 (size!10321 _keys!658)) (bvslt (size!10321 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!14343 () Bool)

(declare-fun mapRes!14343 () Bool)

(declare-fun tp!28419 () Bool)

(declare-fun e!224418 () Bool)

(assert (=> mapNonEmpty!14343 (= mapRes!14343 (and tp!28419 e!224418))))

(declare-datatypes ((V!12467 0))(
  ( (V!12468 (val!4305 Int)) )
))
(declare-datatypes ((ValueCell!3917 0))(
  ( (ValueCellFull!3917 (v!6501 V!12467)) (EmptyCell!3917) )
))
(declare-datatypes ((array!21001 0))(
  ( (array!21002 (arr!9970 (Array (_ BitVec 32) ValueCell!3917)) (size!10322 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21001)

(declare-fun mapKey!14343 () (_ BitVec 32))

(declare-fun mapRest!14343 () (Array (_ BitVec 32) ValueCell!3917))

(declare-fun mapValue!14343 () ValueCell!3917)

(assert (=> mapNonEmpty!14343 (= (arr!9970 _values!506) (store mapRest!14343 mapKey!14343 mapValue!14343))))

(declare-fun b!366564 () Bool)

(declare-fun tp_is_empty!8521 () Bool)

(assert (=> b!366564 (= e!224418 tp_is_empty!8521)))

(declare-fun b!366565 () Bool)

(declare-fun e!224417 () Bool)

(assert (=> b!366565 (= e!224417 tp_is_empty!8521)))

(declare-fun b!366566 () Bool)

(declare-fun res!205061 () Bool)

(assert (=> b!366566 (=> (not res!205061) (not e!224419))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20999 (_ BitVec 32)) Bool)

(assert (=> b!366566 (= res!205061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366567 () Bool)

(declare-fun e!224421 () Bool)

(declare-datatypes ((List!5550 0))(
  ( (Nil!5547) (Cons!5546 (h!6402 (_ BitVec 64)) (t!10700 List!5550)) )
))
(declare-fun contains!2437 (List!5550 (_ BitVec 64)) Bool)

(assert (=> b!366567 (= e!224421 (contains!2437 Nil!5547 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366568 () Bool)

(declare-fun res!205068 () Bool)

(assert (=> b!366568 (=> (not res!205068) (not e!224419))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366568 (= res!205068 (or (= (select (arr!9969 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9969 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366569 () Bool)

(declare-fun res!205062 () Bool)

(assert (=> b!366569 (=> (not res!205062) (not e!224419))))

(declare-fun noDuplicate!190 (List!5550) Bool)

(assert (=> b!366569 (= res!205062 (noDuplicate!190 Nil!5547))))

(declare-fun b!366570 () Bool)

(assert (=> b!366570 (= e!224419 e!224421)))

(declare-fun res!205071 () Bool)

(assert (=> b!366570 (=> res!205071 e!224421)))

(assert (=> b!366570 (= res!205071 (contains!2437 Nil!5547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366571 () Bool)

(declare-fun res!205065 () Bool)

(assert (=> b!366571 (=> (not res!205065) (not e!224419))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366571 (= res!205065 (and (= (size!10322 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10321 _keys!658) (size!10322 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366572 () Bool)

(declare-fun res!205067 () Bool)

(assert (=> b!366572 (=> (not res!205067) (not e!224419))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366572 (= res!205067 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366573 () Bool)

(declare-fun res!205063 () Bool)

(assert (=> b!366573 (=> (not res!205063) (not e!224419))))

(assert (=> b!366573 (= res!205063 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10321 _keys!658))))))

(declare-fun res!205070 () Bool)

(assert (=> start!36728 (=> (not res!205070) (not e!224419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36728 (= res!205070 (validMask!0 mask!970))))

(assert (=> start!36728 e!224419))

(assert (=> start!36728 true))

(declare-fun e!224420 () Bool)

(declare-fun array_inv!7374 (array!21001) Bool)

(assert (=> start!36728 (and (array_inv!7374 _values!506) e!224420)))

(declare-fun array_inv!7375 (array!20999) Bool)

(assert (=> start!36728 (array_inv!7375 _keys!658)))

(declare-fun b!366563 () Bool)

(declare-fun res!205072 () Bool)

(assert (=> b!366563 (=> (not res!205072) (not e!224419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366563 (= res!205072 (validKeyInArray!0 k!778))))

(declare-fun b!366574 () Bool)

(assert (=> b!366574 (= e!224420 (and e!224417 mapRes!14343))))

(declare-fun condMapEmpty!14343 () Bool)

(declare-fun mapDefault!14343 () ValueCell!3917)

