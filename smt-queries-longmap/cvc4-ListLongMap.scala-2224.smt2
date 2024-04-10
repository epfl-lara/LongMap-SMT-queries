; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36810 () Bool)

(assert start!36810)

(declare-fun b_free!7937 () Bool)

(declare-fun b_next!7937 () Bool)

(assert (=> start!36810 (= b_free!7937 (not b_next!7937))))

(declare-fun tp!28527 () Bool)

(declare-fun b_and!15179 () Bool)

(assert (=> start!36810 (= tp!28527 b_and!15179)))

(declare-fun b!367811 () Bool)

(declare-fun e!225047 () Bool)

(declare-fun tp_is_empty!8585 () Bool)

(assert (=> b!367811 (= e!225047 tp_is_empty!8585)))

(declare-fun b!367813 () Bool)

(declare-fun e!225046 () Bool)

(declare-fun e!225043 () Bool)

(assert (=> b!367813 (= e!225046 e!225043)))

(declare-fun res!206008 () Bool)

(assert (=> b!367813 (=> (not res!206008) (not e!225043))))

(declare-datatypes ((array!21129 0))(
  ( (array!21130 (arr!10033 (Array (_ BitVec 32) (_ BitVec 64))) (size!10385 (_ BitVec 32))) )
))
(declare-fun lt!169434 () array!21129)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21129 (_ BitVec 32)) Bool)

(assert (=> b!367813 (= res!206008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169434 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21129)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367813 (= lt!169434 (array!21130 (store (arr!10033 _keys!658) i!548 k!778) (size!10385 _keys!658)))))

(declare-fun b!367814 () Bool)

(declare-fun res!206006 () Bool)

(assert (=> b!367814 (=> (not res!206006) (not e!225046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367814 (= res!206006 (validKeyInArray!0 k!778))))

(declare-fun b!367815 () Bool)

(declare-fun res!206007 () Bool)

(assert (=> b!367815 (=> (not res!206007) (not e!225046))))

(declare-datatypes ((List!5574 0))(
  ( (Nil!5571) (Cons!5570 (h!6426 (_ BitVec 64)) (t!10724 List!5574)) )
))
(declare-fun arrayNoDuplicates!0 (array!21129 (_ BitVec 32) List!5574) Bool)

(assert (=> b!367815 (= res!206007 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5571))))

(declare-fun b!367816 () Bool)

(assert (=> b!367816 (= e!225043 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12551 0))(
  ( (V!12552 (val!4337 Int)) )
))
(declare-datatypes ((ValueCell!3949 0))(
  ( (ValueCellFull!3949 (v!6534 V!12551)) (EmptyCell!3949) )
))
(declare-datatypes ((array!21131 0))(
  ( (array!21132 (arr!10034 (Array (_ BitVec 32) ValueCell!3949)) (size!10386 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21131)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12551)

(declare-datatypes ((tuple2!5742 0))(
  ( (tuple2!5743 (_1!2882 (_ BitVec 64)) (_2!2882 V!12551)) )
))
(declare-datatypes ((List!5575 0))(
  ( (Nil!5572) (Cons!5571 (h!6427 tuple2!5742) (t!10725 List!5575)) )
))
(declare-datatypes ((ListLongMap!4655 0))(
  ( (ListLongMap!4656 (toList!2343 List!5575)) )
))
(declare-fun lt!169433 () ListLongMap!4655)

(declare-fun minValue!472 () V!12551)

(declare-fun getCurrentListMapNoExtraKeys!620 (array!21129 array!21131 (_ BitVec 32) (_ BitVec 32) V!12551 V!12551 (_ BitVec 32) Int) ListLongMap!4655)

(assert (=> b!367816 (= lt!169433 (getCurrentListMapNoExtraKeys!620 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14442 () Bool)

(declare-fun mapRes!14442 () Bool)

(declare-fun tp!28526 () Bool)

(assert (=> mapNonEmpty!14442 (= mapRes!14442 (and tp!28526 e!225047))))

(declare-fun mapKey!14442 () (_ BitVec 32))

(declare-fun mapRest!14442 () (Array (_ BitVec 32) ValueCell!3949))

(declare-fun mapValue!14442 () ValueCell!3949)

(assert (=> mapNonEmpty!14442 (= (arr!10034 _values!506) (store mapRest!14442 mapKey!14442 mapValue!14442))))

(declare-fun b!367817 () Bool)

(declare-fun e!225042 () Bool)

(declare-fun e!225044 () Bool)

(assert (=> b!367817 (= e!225042 (and e!225044 mapRes!14442))))

(declare-fun condMapEmpty!14442 () Bool)

(declare-fun mapDefault!14442 () ValueCell!3949)

