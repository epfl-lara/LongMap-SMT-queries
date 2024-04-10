; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36794 () Bool)

(assert start!36794)

(declare-fun b!367506 () Bool)

(declare-fun res!205774 () Bool)

(declare-fun e!224900 () Bool)

(assert (=> b!367506 (=> (not res!205774) (not e!224900))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12531 0))(
  ( (V!12532 (val!4329 Int)) )
))
(declare-datatypes ((ValueCell!3941 0))(
  ( (ValueCellFull!3941 (v!6526 V!12531)) (EmptyCell!3941) )
))
(declare-datatypes ((array!21097 0))(
  ( (array!21098 (arr!10017 (Array (_ BitVec 32) ValueCell!3941)) (size!10369 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21097)

(declare-datatypes ((array!21099 0))(
  ( (array!21100 (arr!10018 (Array (_ BitVec 32) (_ BitVec 64))) (size!10370 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21099)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367506 (= res!205774 (and (= (size!10369 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10370 _keys!658) (size!10369 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367507 () Bool)

(declare-fun res!205768 () Bool)

(assert (=> b!367507 (=> (not res!205768) (not e!224900))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367507 (= res!205768 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10370 _keys!658))))))

(declare-fun b!367508 () Bool)

(declare-fun res!205772 () Bool)

(assert (=> b!367508 (=> (not res!205772) (not e!224900))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367508 (= res!205772 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!14418 () Bool)

(declare-fun mapRes!14418 () Bool)

(assert (=> mapIsEmpty!14418 mapRes!14418))

(declare-fun b!367509 () Bool)

(declare-fun res!205773 () Bool)

(assert (=> b!367509 (=> (not res!205773) (not e!224900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21099 (_ BitVec 32)) Bool)

(assert (=> b!367509 (= res!205773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!205771 () Bool)

(assert (=> start!36794 (=> (not res!205771) (not e!224900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36794 (= res!205771 (validMask!0 mask!970))))

(assert (=> start!36794 e!224900))

(assert (=> start!36794 true))

(declare-fun e!224899 () Bool)

(declare-fun array_inv!7406 (array!21097) Bool)

(assert (=> start!36794 (and (array_inv!7406 _values!506) e!224899)))

(declare-fun array_inv!7407 (array!21099) Bool)

(assert (=> start!36794 (array_inv!7407 _keys!658)))

(declare-fun b!367510 () Bool)

(declare-fun res!205775 () Bool)

(assert (=> b!367510 (=> (not res!205775) (not e!224900))))

(assert (=> b!367510 (= res!205775 (or (= (select (arr!10018 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10018 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14418 () Bool)

(declare-fun tp!28494 () Bool)

(declare-fun e!224898 () Bool)

(assert (=> mapNonEmpty!14418 (= mapRes!14418 (and tp!28494 e!224898))))

(declare-fun mapValue!14418 () ValueCell!3941)

(declare-fun mapRest!14418 () (Array (_ BitVec 32) ValueCell!3941))

(declare-fun mapKey!14418 () (_ BitVec 32))

(assert (=> mapNonEmpty!14418 (= (arr!10017 _values!506) (store mapRest!14418 mapKey!14418 mapValue!14418))))

(declare-fun b!367511 () Bool)

(declare-fun tp_is_empty!8569 () Bool)

(assert (=> b!367511 (= e!224898 tp_is_empty!8569)))

(declare-fun b!367512 () Bool)

(declare-fun res!205770 () Bool)

(assert (=> b!367512 (=> (not res!205770) (not e!224900))))

(declare-datatypes ((List!5568 0))(
  ( (Nil!5565) (Cons!5564 (h!6420 (_ BitVec 64)) (t!10718 List!5568)) )
))
(declare-fun arrayNoDuplicates!0 (array!21099 (_ BitVec 32) List!5568) Bool)

(assert (=> b!367512 (= res!205770 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5565))))

(declare-fun b!367513 () Bool)

(declare-fun e!224902 () Bool)

(assert (=> b!367513 (= e!224902 tp_is_empty!8569)))

(declare-fun b!367514 () Bool)

(assert (=> b!367514 (= e!224899 (and e!224902 mapRes!14418))))

(declare-fun condMapEmpty!14418 () Bool)

(declare-fun mapDefault!14418 () ValueCell!3941)

