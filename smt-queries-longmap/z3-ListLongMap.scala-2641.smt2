; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39666 () Bool)

(assert start!39666)

(declare-fun b_free!9933 () Bool)

(declare-fun b_next!9933 () Bool)

(assert (=> start!39666 (= b_free!9933 (not b_next!9933))))

(declare-fun tp!35328 () Bool)

(declare-fun b_and!17589 () Bool)

(assert (=> start!39666 (= tp!35328 b_and!17589)))

(declare-fun b!425807 () Bool)

(declare-fun res!249386 () Bool)

(declare-fun e!252727 () Bool)

(assert (=> b!425807 (=> (not res!249386) (not e!252727))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425807 (= res!249386 (validKeyInArray!0 k0!794))))

(declare-fun b!425808 () Bool)

(declare-fun res!249390 () Bool)

(assert (=> b!425808 (=> (not res!249390) (not e!252727))))

(declare-datatypes ((array!26009 0))(
  ( (array!26010 (arr!12454 (Array (_ BitVec 32) (_ BitVec 64))) (size!12806 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26009)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26009 (_ BitVec 32)) Bool)

(assert (=> b!425808 (= res!249390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425809 () Bool)

(declare-fun e!252728 () Bool)

(declare-fun e!252724 () Bool)

(assert (=> b!425809 (= e!252728 e!252724)))

(declare-fun res!249396 () Bool)

(assert (=> b!425809 (=> (not res!249396) (not e!252724))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425809 (= res!249396 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15885 0))(
  ( (V!15886 (val!5587 Int)) )
))
(declare-fun minValue!515 () V!15885)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15885)

(declare-datatypes ((tuple2!7338 0))(
  ( (tuple2!7339 (_1!3680 (_ BitVec 64)) (_2!3680 V!15885)) )
))
(declare-datatypes ((List!7350 0))(
  ( (Nil!7347) (Cons!7346 (h!8202 tuple2!7338) (t!12794 List!7350)) )
))
(declare-datatypes ((ListLongMap!6251 0))(
  ( (ListLongMap!6252 (toList!3141 List!7350)) )
))
(declare-fun lt!194766 () ListLongMap!6251)

(declare-fun lt!194768 () array!26009)

(declare-datatypes ((ValueCell!5199 0))(
  ( (ValueCellFull!5199 (v!7834 V!15885)) (EmptyCell!5199) )
))
(declare-datatypes ((array!26011 0))(
  ( (array!26012 (arr!12455 (Array (_ BitVec 32) ValueCell!5199)) (size!12807 (_ BitVec 32))) )
))
(declare-fun lt!194765 () array!26011)

(declare-fun getCurrentListMapNoExtraKeys!1345 (array!26009 array!26011 (_ BitVec 32) (_ BitVec 32) V!15885 V!15885 (_ BitVec 32) Int) ListLongMap!6251)

(assert (=> b!425809 (= lt!194766 (getCurrentListMapNoExtraKeys!1345 lt!194768 lt!194765 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26011)

(declare-fun v!412 () V!15885)

(assert (=> b!425809 (= lt!194765 (array!26012 (store (arr!12455 _values!549) i!563 (ValueCellFull!5199 v!412)) (size!12807 _values!549)))))

(declare-fun lt!194764 () ListLongMap!6251)

(assert (=> b!425809 (= lt!194764 (getCurrentListMapNoExtraKeys!1345 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425810 () Bool)

(declare-fun res!249394 () Bool)

(assert (=> b!425810 (=> (not res!249394) (not e!252727))))

(assert (=> b!425810 (= res!249394 (or (= (select (arr!12454 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12454 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18249 () Bool)

(declare-fun mapRes!18249 () Bool)

(assert (=> mapIsEmpty!18249 mapRes!18249))

(declare-fun b!425811 () Bool)

(declare-fun res!249391 () Bool)

(assert (=> b!425811 (=> (not res!249391) (not e!252727))))

(declare-fun arrayContainsKey!0 (array!26009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425811 (= res!249391 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425812 () Bool)

(declare-fun res!249387 () Bool)

(assert (=> b!425812 (=> (not res!249387) (not e!252727))))

(declare-datatypes ((List!7351 0))(
  ( (Nil!7348) (Cons!7347 (h!8203 (_ BitVec 64)) (t!12795 List!7351)) )
))
(declare-fun arrayNoDuplicates!0 (array!26009 (_ BitVec 32) List!7351) Bool)

(assert (=> b!425812 (= res!249387 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7348))))

(declare-fun b!425813 () Bool)

(declare-fun res!249392 () Bool)

(assert (=> b!425813 (=> (not res!249392) (not e!252727))))

(assert (=> b!425813 (= res!249392 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12806 _keys!709))))))

(declare-fun b!425814 () Bool)

(declare-fun res!249385 () Bool)

(assert (=> b!425814 (=> (not res!249385) (not e!252727))))

(assert (=> b!425814 (= res!249385 (and (= (size!12807 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12806 _keys!709) (size!12807 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18249 () Bool)

(declare-fun tp!35327 () Bool)

(declare-fun e!252725 () Bool)

(assert (=> mapNonEmpty!18249 (= mapRes!18249 (and tp!35327 e!252725))))

(declare-fun mapKey!18249 () (_ BitVec 32))

(declare-fun mapValue!18249 () ValueCell!5199)

(declare-fun mapRest!18249 () (Array (_ BitVec 32) ValueCell!5199))

(assert (=> mapNonEmpty!18249 (= (arr!12455 _values!549) (store mapRest!18249 mapKey!18249 mapValue!18249))))

(declare-fun b!425815 () Bool)

(declare-fun res!249384 () Bool)

(assert (=> b!425815 (=> (not res!249384) (not e!252728))))

(assert (=> b!425815 (= res!249384 (bvsle from!863 i!563))))

(declare-fun b!425816 () Bool)

(assert (=> b!425816 (= e!252724 (not true))))

(declare-fun +!1299 (ListLongMap!6251 tuple2!7338) ListLongMap!6251)

(assert (=> b!425816 (= (getCurrentListMapNoExtraKeys!1345 lt!194768 lt!194765 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1299 (getCurrentListMapNoExtraKeys!1345 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7339 k0!794 v!412)))))

(declare-datatypes ((Unit!12500 0))(
  ( (Unit!12501) )
))
(declare-fun lt!194767 () Unit!12500)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!494 (array!26009 array!26011 (_ BitVec 32) (_ BitVec 32) V!15885 V!15885 (_ BitVec 32) (_ BitVec 64) V!15885 (_ BitVec 32) Int) Unit!12500)

(assert (=> b!425816 (= lt!194767 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425818 () Bool)

(declare-fun e!252723 () Bool)

(declare-fun tp_is_empty!11085 () Bool)

(assert (=> b!425818 (= e!252723 tp_is_empty!11085)))

(declare-fun b!425819 () Bool)

(declare-fun res!249393 () Bool)

(assert (=> b!425819 (=> (not res!249393) (not e!252728))))

(assert (=> b!425819 (= res!249393 (arrayNoDuplicates!0 lt!194768 #b00000000000000000000000000000000 Nil!7348))))

(declare-fun b!425820 () Bool)

(declare-fun e!252726 () Bool)

(assert (=> b!425820 (= e!252726 (and e!252723 mapRes!18249))))

(declare-fun condMapEmpty!18249 () Bool)

(declare-fun mapDefault!18249 () ValueCell!5199)

(assert (=> b!425820 (= condMapEmpty!18249 (= (arr!12455 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5199)) mapDefault!18249)))))

(declare-fun b!425821 () Bool)

(declare-fun res!249395 () Bool)

(assert (=> b!425821 (=> (not res!249395) (not e!252727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425821 (= res!249395 (validMask!0 mask!1025))))

(declare-fun b!425822 () Bool)

(assert (=> b!425822 (= e!252725 tp_is_empty!11085)))

(declare-fun res!249388 () Bool)

(assert (=> start!39666 (=> (not res!249388) (not e!252727))))

(assert (=> start!39666 (= res!249388 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12806 _keys!709))))))

(assert (=> start!39666 e!252727))

(assert (=> start!39666 tp_is_empty!11085))

(assert (=> start!39666 tp!35328))

(assert (=> start!39666 true))

(declare-fun array_inv!9076 (array!26011) Bool)

(assert (=> start!39666 (and (array_inv!9076 _values!549) e!252726)))

(declare-fun array_inv!9077 (array!26009) Bool)

(assert (=> start!39666 (array_inv!9077 _keys!709)))

(declare-fun b!425817 () Bool)

(assert (=> b!425817 (= e!252727 e!252728)))

(declare-fun res!249389 () Bool)

(assert (=> b!425817 (=> (not res!249389) (not e!252728))))

(assert (=> b!425817 (= res!249389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194768 mask!1025))))

(assert (=> b!425817 (= lt!194768 (array!26010 (store (arr!12454 _keys!709) i!563 k0!794) (size!12806 _keys!709)))))

(assert (= (and start!39666 res!249388) b!425821))

(assert (= (and b!425821 res!249395) b!425814))

(assert (= (and b!425814 res!249385) b!425808))

(assert (= (and b!425808 res!249390) b!425812))

(assert (= (and b!425812 res!249387) b!425813))

(assert (= (and b!425813 res!249392) b!425807))

(assert (= (and b!425807 res!249386) b!425810))

(assert (= (and b!425810 res!249394) b!425811))

(assert (= (and b!425811 res!249391) b!425817))

(assert (= (and b!425817 res!249389) b!425819))

(assert (= (and b!425819 res!249393) b!425815))

(assert (= (and b!425815 res!249384) b!425809))

(assert (= (and b!425809 res!249396) b!425816))

(assert (= (and b!425820 condMapEmpty!18249) mapIsEmpty!18249))

(assert (= (and b!425820 (not condMapEmpty!18249)) mapNonEmpty!18249))

(get-info :version)

(assert (= (and mapNonEmpty!18249 ((_ is ValueCellFull!5199) mapValue!18249)) b!425822))

(assert (= (and b!425820 ((_ is ValueCellFull!5199) mapDefault!18249)) b!425818))

(assert (= start!39666 b!425820))

(declare-fun m!414629 () Bool)

(assert (=> mapNonEmpty!18249 m!414629))

(declare-fun m!414631 () Bool)

(assert (=> b!425808 m!414631))

(declare-fun m!414633 () Bool)

(assert (=> b!425807 m!414633))

(declare-fun m!414635 () Bool)

(assert (=> b!425809 m!414635))

(declare-fun m!414637 () Bool)

(assert (=> b!425809 m!414637))

(declare-fun m!414639 () Bool)

(assert (=> b!425809 m!414639))

(declare-fun m!414641 () Bool)

(assert (=> b!425812 m!414641))

(declare-fun m!414643 () Bool)

(assert (=> b!425810 m!414643))

(declare-fun m!414645 () Bool)

(assert (=> b!425811 m!414645))

(declare-fun m!414647 () Bool)

(assert (=> b!425819 m!414647))

(declare-fun m!414649 () Bool)

(assert (=> b!425816 m!414649))

(declare-fun m!414651 () Bool)

(assert (=> b!425816 m!414651))

(assert (=> b!425816 m!414651))

(declare-fun m!414653 () Bool)

(assert (=> b!425816 m!414653))

(declare-fun m!414655 () Bool)

(assert (=> b!425816 m!414655))

(declare-fun m!414657 () Bool)

(assert (=> b!425821 m!414657))

(declare-fun m!414659 () Bool)

(assert (=> b!425817 m!414659))

(declare-fun m!414661 () Bool)

(assert (=> b!425817 m!414661))

(declare-fun m!414663 () Bool)

(assert (=> start!39666 m!414663))

(declare-fun m!414665 () Bool)

(assert (=> start!39666 m!414665))

(check-sat (not b!425811) (not start!39666) (not b!425812) (not b!425821) (not b!425816) (not b!425808) (not b!425817) (not mapNonEmpty!18249) tp_is_empty!11085 (not b_next!9933) b_and!17589 (not b!425807) (not b!425819) (not b!425809))
(check-sat b_and!17589 (not b_next!9933))
