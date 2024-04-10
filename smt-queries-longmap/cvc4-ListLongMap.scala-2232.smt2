; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36858 () Bool)

(assert start!36858)

(declare-fun b_free!7985 () Bool)

(declare-fun b_next!7985 () Bool)

(assert (=> start!36858 (= b_free!7985 (not b_next!7985))))

(declare-fun tp!28671 () Bool)

(declare-fun b_and!15227 () Bool)

(assert (=> start!36858 (= tp!28671 b_and!15227)))

(declare-fun b!368747 () Bool)

(declare-fun res!206722 () Bool)

(declare-fun e!225479 () Bool)

(assert (=> b!368747 (=> (not res!206722) (not e!225479))))

(declare-datatypes ((array!21221 0))(
  ( (array!21222 (arr!10079 (Array (_ BitVec 32) (_ BitVec 64))) (size!10431 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21221)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368747 (= res!206722 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368748 () Bool)

(declare-fun res!206725 () Bool)

(declare-fun e!225476 () Bool)

(assert (=> b!368748 (=> (not res!206725) (not e!225476))))

(declare-fun lt!169578 () array!21221)

(declare-datatypes ((List!5615 0))(
  ( (Nil!5612) (Cons!5611 (h!6467 (_ BitVec 64)) (t!10765 List!5615)) )
))
(declare-fun arrayNoDuplicates!0 (array!21221 (_ BitVec 32) List!5615) Bool)

(assert (=> b!368748 (= res!206725 (arrayNoDuplicates!0 lt!169578 #b00000000000000000000000000000000 Nil!5612))))

(declare-fun b!368749 () Bool)

(assert (=> b!368749 (= e!225476 (bvsgt #b00000000000000000000000000000000 (size!10431 _keys!658)))))

(declare-datatypes ((V!12615 0))(
  ( (V!12616 (val!4361 Int)) )
))
(declare-datatypes ((tuple2!5782 0))(
  ( (tuple2!5783 (_1!2902 (_ BitVec 64)) (_2!2902 V!12615)) )
))
(declare-datatypes ((List!5616 0))(
  ( (Nil!5613) (Cons!5612 (h!6468 tuple2!5782) (t!10766 List!5616)) )
))
(declare-datatypes ((ListLongMap!4695 0))(
  ( (ListLongMap!4696 (toList!2363 List!5616)) )
))
(declare-fun lt!169577 () ListLongMap!4695)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3973 0))(
  ( (ValueCellFull!3973 (v!6558 V!12615)) (EmptyCell!3973) )
))
(declare-datatypes ((array!21223 0))(
  ( (array!21224 (arr!10080 (Array (_ BitVec 32) ValueCell!3973)) (size!10432 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21223)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12615)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12615)

(declare-fun getCurrentListMapNoExtraKeys!640 (array!21221 array!21223 (_ BitVec 32) (_ BitVec 32) V!12615 V!12615 (_ BitVec 32) Int) ListLongMap!4695)

(assert (=> b!368749 (= lt!169577 (getCurrentListMapNoExtraKeys!640 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368750 () Bool)

(declare-fun res!206726 () Bool)

(assert (=> b!368750 (=> (not res!206726) (not e!225479))))

(assert (=> b!368750 (= res!206726 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5612))))

(declare-fun b!368751 () Bool)

(assert (=> b!368751 (= e!225479 e!225476)))

(declare-fun res!206728 () Bool)

(assert (=> b!368751 (=> (not res!206728) (not e!225476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21221 (_ BitVec 32)) Bool)

(assert (=> b!368751 (= res!206728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169578 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368751 (= lt!169578 (array!21222 (store (arr!10079 _keys!658) i!548 k!778) (size!10431 _keys!658)))))

(declare-fun b!368752 () Bool)

(declare-fun res!206727 () Bool)

(assert (=> b!368752 (=> (not res!206727) (not e!225479))))

(assert (=> b!368752 (= res!206727 (or (= (select (arr!10079 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10079 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368753 () Bool)

(declare-fun e!225477 () Bool)

(declare-fun tp_is_empty!8633 () Bool)

(assert (=> b!368753 (= e!225477 tp_is_empty!8633)))

(declare-fun b!368754 () Bool)

(declare-fun res!206720 () Bool)

(assert (=> b!368754 (=> (not res!206720) (not e!225479))))

(assert (=> b!368754 (= res!206720 (and (= (size!10432 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10431 _keys!658) (size!10432 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14514 () Bool)

(declare-fun mapRes!14514 () Bool)

(declare-fun tp!28670 () Bool)

(assert (=> mapNonEmpty!14514 (= mapRes!14514 (and tp!28670 e!225477))))

(declare-fun mapValue!14514 () ValueCell!3973)

(declare-fun mapRest!14514 () (Array (_ BitVec 32) ValueCell!3973))

(declare-fun mapKey!14514 () (_ BitVec 32))

(assert (=> mapNonEmpty!14514 (= (arr!10080 _values!506) (store mapRest!14514 mapKey!14514 mapValue!14514))))

(declare-fun b!368755 () Bool)

(declare-fun e!225478 () Bool)

(declare-fun e!225474 () Bool)

(assert (=> b!368755 (= e!225478 (and e!225474 mapRes!14514))))

(declare-fun condMapEmpty!14514 () Bool)

(declare-fun mapDefault!14514 () ValueCell!3973)

