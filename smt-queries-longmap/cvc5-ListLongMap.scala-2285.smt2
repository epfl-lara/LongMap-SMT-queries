; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37172 () Bool)

(assert start!37172)

(declare-fun b_free!8299 () Bool)

(declare-fun b_next!8299 () Bool)

(assert (=> start!37172 (= b_free!8299 (not b_next!8299))))

(declare-fun tp!29613 () Bool)

(declare-fun b_and!15541 () Bool)

(assert (=> start!37172 (= tp!29613 b_and!15541)))

(declare-fun b!375162 () Bool)

(declare-fun res!211730 () Bool)

(declare-fun e!228583 () Bool)

(assert (=> b!375162 (=> (not res!211730) (not e!228583))))

(declare-datatypes ((array!21829 0))(
  ( (array!21830 (arr!10383 (Array (_ BitVec 32) (_ BitVec 64))) (size!10735 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21829)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21829 (_ BitVec 32)) Bool)

(assert (=> b!375162 (= res!211730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375163 () Bool)

(declare-fun e!228588 () Bool)

(declare-fun tp_is_empty!8947 () Bool)

(assert (=> b!375163 (= e!228588 tp_is_empty!8947)))

(declare-fun b!375164 () Bool)

(declare-fun e!228589 () Bool)

(assert (=> b!375164 (= e!228589 tp_is_empty!8947)))

(declare-fun res!211722 () Bool)

(assert (=> start!37172 (=> (not res!211722) (not e!228583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37172 (= res!211722 (validMask!0 mask!970))))

(assert (=> start!37172 e!228583))

(declare-datatypes ((V!13035 0))(
  ( (V!13036 (val!4518 Int)) )
))
(declare-datatypes ((ValueCell!4130 0))(
  ( (ValueCellFull!4130 (v!6715 V!13035)) (EmptyCell!4130) )
))
(declare-datatypes ((array!21831 0))(
  ( (array!21832 (arr!10384 (Array (_ BitVec 32) ValueCell!4130)) (size!10736 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21831)

(declare-fun e!228586 () Bool)

(declare-fun array_inv!7656 (array!21831) Bool)

(assert (=> start!37172 (and (array_inv!7656 _values!506) e!228586)))

(assert (=> start!37172 tp!29613))

(assert (=> start!37172 true))

(assert (=> start!37172 tp_is_empty!8947))

(declare-fun array_inv!7657 (array!21829) Bool)

(assert (=> start!37172 (array_inv!7657 _keys!658)))

(declare-fun b!375165 () Bool)

(declare-fun res!211729 () Bool)

(assert (=> b!375165 (=> (not res!211729) (not e!228583))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375165 (= res!211729 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!375166 () Bool)

(declare-fun res!211732 () Bool)

(assert (=> b!375166 (=> (not res!211732) (not e!228583))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375166 (= res!211732 (or (= (select (arr!10383 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10383 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375167 () Bool)

(declare-fun res!211728 () Bool)

(assert (=> b!375167 (=> (not res!211728) (not e!228583))))

(declare-datatypes ((List!5854 0))(
  ( (Nil!5851) (Cons!5850 (h!6706 (_ BitVec 64)) (t!11004 List!5854)) )
))
(declare-fun arrayNoDuplicates!0 (array!21829 (_ BitVec 32) List!5854) Bool)

(assert (=> b!375167 (= res!211728 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5851))))

(declare-fun b!375168 () Bool)

(declare-fun e!228584 () Bool)

(assert (=> b!375168 (= e!228584 true)))

(declare-datatypes ((tuple2!6012 0))(
  ( (tuple2!6013 (_1!3017 (_ BitVec 64)) (_2!3017 V!13035)) )
))
(declare-fun lt!173433 () tuple2!6012)

(declare-fun lt!173430 () tuple2!6012)

(declare-datatypes ((List!5855 0))(
  ( (Nil!5852) (Cons!5851 (h!6707 tuple2!6012) (t!11005 List!5855)) )
))
(declare-datatypes ((ListLongMap!4925 0))(
  ( (ListLongMap!4926 (toList!2478 List!5855)) )
))
(declare-fun lt!173439 () ListLongMap!4925)

(declare-fun lt!173432 () ListLongMap!4925)

(declare-fun +!824 (ListLongMap!4925 tuple2!6012) ListLongMap!4925)

(assert (=> b!375168 (= (+!824 lt!173432 lt!173433) (+!824 lt!173439 lt!173430))))

(declare-datatypes ((Unit!11554 0))(
  ( (Unit!11555) )
))
(declare-fun lt!173444 () Unit!11554)

(declare-fun v!373 () V!13035)

(declare-fun lt!173443 () ListLongMap!4925)

(declare-fun minValue!472 () V!13035)

(declare-fun addCommutativeForDiffKeys!245 (ListLongMap!4925 (_ BitVec 64) V!13035 (_ BitVec 64) V!13035) Unit!11554)

(assert (=> b!375168 (= lt!173444 (addCommutativeForDiffKeys!245 lt!173443 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375169 () Bool)

(declare-fun e!228587 () Bool)

(assert (=> b!375169 (= e!228583 e!228587)))

(declare-fun res!211724 () Bool)

(assert (=> b!375169 (=> (not res!211724) (not e!228587))))

(declare-fun lt!173429 () array!21829)

(assert (=> b!375169 (= res!211724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173429 mask!970))))

(assert (=> b!375169 (= lt!173429 (array!21830 (store (arr!10383 _keys!658) i!548 k!778) (size!10735 _keys!658)))))

(declare-fun mapNonEmpty!14985 () Bool)

(declare-fun mapRes!14985 () Bool)

(declare-fun tp!29612 () Bool)

(assert (=> mapNonEmpty!14985 (= mapRes!14985 (and tp!29612 e!228588))))

(declare-fun mapRest!14985 () (Array (_ BitVec 32) ValueCell!4130))

(declare-fun mapKey!14985 () (_ BitVec 32))

(declare-fun mapValue!14985 () ValueCell!4130)

(assert (=> mapNonEmpty!14985 (= (arr!10384 _values!506) (store mapRest!14985 mapKey!14985 mapValue!14985))))

(declare-fun b!375170 () Bool)

(declare-fun e!228585 () Bool)

(assert (=> b!375170 (= e!228585 e!228584)))

(declare-fun res!211725 () Bool)

(assert (=> b!375170 (=> res!211725 e!228584)))

(assert (=> b!375170 (= res!211725 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173437 () ListLongMap!4925)

(assert (=> b!375170 (= lt!173437 lt!173432)))

(assert (=> b!375170 (= lt!173432 (+!824 lt!173443 lt!173430))))

(declare-fun lt!173435 () ListLongMap!4925)

(declare-fun lt!173440 () Unit!11554)

(declare-fun zeroValue!472 () V!13035)

(assert (=> b!375170 (= lt!173440 (addCommutativeForDiffKeys!245 lt!173435 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173431 () ListLongMap!4925)

(assert (=> b!375170 (= lt!173431 (+!824 lt!173437 lt!173433))))

(declare-fun lt!173445 () ListLongMap!4925)

(declare-fun lt!173438 () tuple2!6012)

(assert (=> b!375170 (= lt!173437 (+!824 lt!173445 lt!173438))))

(declare-fun lt!173436 () ListLongMap!4925)

(assert (=> b!375170 (= lt!173436 lt!173439)))

(assert (=> b!375170 (= lt!173439 (+!824 lt!173443 lt!173433))))

(assert (=> b!375170 (= lt!173443 (+!824 lt!173435 lt!173438))))

(declare-fun lt!173441 () ListLongMap!4925)

(assert (=> b!375170 (= lt!173431 (+!824 (+!824 lt!173441 lt!173438) lt!173433))))

(assert (=> b!375170 (= lt!173433 (tuple2!6013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375170 (= lt!173438 (tuple2!6013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375171 () Bool)

(declare-fun res!211727 () Bool)

(assert (=> b!375171 (=> (not res!211727) (not e!228583))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375171 (= res!211727 (and (= (size!10736 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10735 _keys!658) (size!10736 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14985 () Bool)

(assert (=> mapIsEmpty!14985 mapRes!14985))

(declare-fun b!375172 () Bool)

(assert (=> b!375172 (= e!228587 (not e!228585))))

(declare-fun res!211733 () Bool)

(assert (=> b!375172 (=> res!211733 e!228585)))

(assert (=> b!375172 (= res!211733 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1913 (array!21829 array!21831 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) Int) ListLongMap!4925)

(assert (=> b!375172 (= lt!173436 (getCurrentListMap!1913 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173434 () array!21831)

(assert (=> b!375172 (= lt!173431 (getCurrentListMap!1913 lt!173429 lt!173434 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375172 (and (= lt!173441 lt!173445) (= lt!173445 lt!173441))))

(assert (=> b!375172 (= lt!173445 (+!824 lt!173435 lt!173430))))

(assert (=> b!375172 (= lt!173430 (tuple2!6013 k!778 v!373))))

(declare-fun lt!173442 () Unit!11554)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!71 (array!21829 array!21831 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) (_ BitVec 64) V!13035 (_ BitVec 32) Int) Unit!11554)

(assert (=> b!375172 (= lt!173442 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!71 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!747 (array!21829 array!21831 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) Int) ListLongMap!4925)

(assert (=> b!375172 (= lt!173441 (getCurrentListMapNoExtraKeys!747 lt!173429 lt!173434 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375172 (= lt!173434 (array!21832 (store (arr!10384 _values!506) i!548 (ValueCellFull!4130 v!373)) (size!10736 _values!506)))))

(assert (=> b!375172 (= lt!173435 (getCurrentListMapNoExtraKeys!747 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375173 () Bool)

(declare-fun res!211726 () Bool)

(assert (=> b!375173 (=> (not res!211726) (not e!228583))))

(assert (=> b!375173 (= res!211726 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10735 _keys!658))))))

(declare-fun b!375174 () Bool)

(declare-fun res!211731 () Bool)

(assert (=> b!375174 (=> (not res!211731) (not e!228587))))

(assert (=> b!375174 (= res!211731 (arrayNoDuplicates!0 lt!173429 #b00000000000000000000000000000000 Nil!5851))))

(declare-fun b!375175 () Bool)

(declare-fun res!211723 () Bool)

(assert (=> b!375175 (=> (not res!211723) (not e!228583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375175 (= res!211723 (validKeyInArray!0 k!778))))

(declare-fun b!375176 () Bool)

(assert (=> b!375176 (= e!228586 (and e!228589 mapRes!14985))))

(declare-fun condMapEmpty!14985 () Bool)

(declare-fun mapDefault!14985 () ValueCell!4130)

