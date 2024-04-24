; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40972 () Bool)

(assert start!40972)

(declare-fun b_free!10921 () Bool)

(declare-fun b_next!10921 () Bool)

(assert (=> start!40972 (= b_free!10921 (not b_next!10921))))

(declare-fun tp!38589 () Bool)

(declare-fun b_and!19073 () Bool)

(assert (=> start!40972 (= tp!38589 b_and!19073)))

(declare-fun b!456288 () Bool)

(declare-fun e!266611 () Bool)

(declare-fun tp_is_empty!12259 () Bool)

(assert (=> b!456288 (= e!266611 tp_is_empty!12259)))

(declare-fun b!456289 () Bool)

(declare-fun res!272296 () Bool)

(declare-fun e!266607 () Bool)

(assert (=> b!456289 (=> (not res!272296) (not e!266607))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456289 (= res!272296 (validKeyInArray!0 k0!794))))

(declare-fun b!456290 () Bool)

(declare-fun res!272289 () Bool)

(declare-fun e!266609 () Bool)

(assert (=> b!456290 (=> (not res!272289) (not e!266609))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456290 (= res!272289 (bvsle from!863 i!563))))

(declare-fun b!456291 () Bool)

(assert (=> b!456291 (= e!266607 e!266609)))

(declare-fun res!272287 () Bool)

(assert (=> b!456291 (=> (not res!272287) (not e!266609))))

(declare-datatypes ((array!28312 0))(
  ( (array!28313 (arr!13599 (Array (_ BitVec 32) (_ BitVec 64))) (size!13951 (_ BitVec 32))) )
))
(declare-fun lt!206537 () array!28312)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28312 (_ BitVec 32)) Bool)

(assert (=> b!456291 (= res!272287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206537 mask!1025))))

(declare-fun _keys!709 () array!28312)

(assert (=> b!456291 (= lt!206537 (array!28313 (store (arr!13599 _keys!709) i!563 k0!794) (size!13951 _keys!709)))))

(declare-fun mapNonEmpty!20029 () Bool)

(declare-fun mapRes!20029 () Bool)

(declare-fun tp!38590 () Bool)

(declare-fun e!266608 () Bool)

(assert (=> mapNonEmpty!20029 (= mapRes!20029 (and tp!38590 e!266608))))

(declare-datatypes ((V!17451 0))(
  ( (V!17452 (val!6174 Int)) )
))
(declare-datatypes ((ValueCell!5786 0))(
  ( (ValueCellFull!5786 (v!8441 V!17451)) (EmptyCell!5786) )
))
(declare-fun mapValue!20029 () ValueCell!5786)

(declare-fun mapRest!20029 () (Array (_ BitVec 32) ValueCell!5786))

(declare-datatypes ((array!28314 0))(
  ( (array!28315 (arr!13600 (Array (_ BitVec 32) ValueCell!5786)) (size!13952 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28314)

(declare-fun mapKey!20029 () (_ BitVec 32))

(assert (=> mapNonEmpty!20029 (= (arr!13600 _values!549) (store mapRest!20029 mapKey!20029 mapValue!20029))))

(declare-fun b!456292 () Bool)

(declare-fun res!272298 () Bool)

(assert (=> b!456292 (=> (not res!272298) (not e!266607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456292 (= res!272298 (validMask!0 mask!1025))))

(declare-fun b!456293 () Bool)

(declare-fun res!272297 () Bool)

(assert (=> b!456293 (=> (not res!272297) (not e!266607))))

(declare-fun arrayContainsKey!0 (array!28312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456293 (= res!272297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456294 () Bool)

(declare-fun e!266610 () Bool)

(assert (=> b!456294 (= e!266610 (and e!266611 mapRes!20029))))

(declare-fun condMapEmpty!20029 () Bool)

(declare-fun mapDefault!20029 () ValueCell!5786)

(assert (=> b!456294 (= condMapEmpty!20029 (= (arr!13600 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5786)) mapDefault!20029)))))

(declare-fun b!456295 () Bool)

(declare-fun res!272291 () Bool)

(assert (=> b!456295 (=> (not res!272291) (not e!266607))))

(assert (=> b!456295 (= res!272291 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13951 _keys!709))))))

(declare-fun mapIsEmpty!20029 () Bool)

(assert (=> mapIsEmpty!20029 mapRes!20029))

(declare-fun b!456296 () Bool)

(declare-fun res!272299 () Bool)

(assert (=> b!456296 (=> (not res!272299) (not e!266609))))

(declare-datatypes ((List!8118 0))(
  ( (Nil!8115) (Cons!8114 (h!8970 (_ BitVec 64)) (t!13938 List!8118)) )
))
(declare-fun arrayNoDuplicates!0 (array!28312 (_ BitVec 32) List!8118) Bool)

(assert (=> b!456296 (= res!272299 (arrayNoDuplicates!0 lt!206537 #b00000000000000000000000000000000 Nil!8115))))

(declare-fun b!456297 () Bool)

(declare-fun e!266606 () Bool)

(assert (=> b!456297 (= e!266609 e!266606)))

(declare-fun res!272293 () Bool)

(assert (=> b!456297 (=> (not res!272293) (not e!266606))))

(assert (=> b!456297 (= res!272293 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17451)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17451)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!206533 () array!28314)

(declare-datatypes ((tuple2!8044 0))(
  ( (tuple2!8045 (_1!4033 (_ BitVec 64)) (_2!4033 V!17451)) )
))
(declare-datatypes ((List!8119 0))(
  ( (Nil!8116) (Cons!8115 (h!8971 tuple2!8044) (t!13939 List!8119)) )
))
(declare-datatypes ((ListLongMap!6959 0))(
  ( (ListLongMap!6960 (toList!3495 List!8119)) )
))
(declare-fun lt!206534 () ListLongMap!6959)

(declare-fun getCurrentListMapNoExtraKeys!1724 (array!28312 array!28314 (_ BitVec 32) (_ BitVec 32) V!17451 V!17451 (_ BitVec 32) Int) ListLongMap!6959)

(assert (=> b!456297 (= lt!206534 (getCurrentListMapNoExtraKeys!1724 lt!206537 lt!206533 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17451)

(assert (=> b!456297 (= lt!206533 (array!28315 (store (arr!13600 _values!549) i!563 (ValueCellFull!5786 v!412)) (size!13952 _values!549)))))

(declare-fun lt!206535 () ListLongMap!6959)

(assert (=> b!456297 (= lt!206535 (getCurrentListMapNoExtraKeys!1724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456298 () Bool)

(declare-fun res!272295 () Bool)

(assert (=> b!456298 (=> (not res!272295) (not e!266607))))

(assert (=> b!456298 (= res!272295 (and (= (size!13952 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13951 _keys!709) (size!13952 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456299 () Bool)

(declare-fun res!272292 () Bool)

(assert (=> b!456299 (=> (not res!272292) (not e!266607))))

(assert (=> b!456299 (= res!272292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456300 () Bool)

(declare-fun res!272294 () Bool)

(assert (=> b!456300 (=> (not res!272294) (not e!266607))))

(assert (=> b!456300 (= res!272294 (or (= (select (arr!13599 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13599 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456301 () Bool)

(declare-fun res!272288 () Bool)

(assert (=> b!456301 (=> (not res!272288) (not e!266607))))

(assert (=> b!456301 (= res!272288 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8115))))

(declare-fun res!272290 () Bool)

(assert (=> start!40972 (=> (not res!272290) (not e!266607))))

(assert (=> start!40972 (= res!272290 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13951 _keys!709))))))

(assert (=> start!40972 e!266607))

(assert (=> start!40972 tp_is_empty!12259))

(assert (=> start!40972 tp!38589))

(assert (=> start!40972 true))

(declare-fun array_inv!9918 (array!28314) Bool)

(assert (=> start!40972 (and (array_inv!9918 _values!549) e!266610)))

(declare-fun array_inv!9919 (array!28312) Bool)

(assert (=> start!40972 (array_inv!9919 _keys!709)))

(declare-fun b!456302 () Bool)

(assert (=> b!456302 (= e!266606 (not (bvslt from!863 (size!13951 _keys!709))))))

(declare-fun +!1578 (ListLongMap!6959 tuple2!8044) ListLongMap!6959)

(assert (=> b!456302 (= (getCurrentListMapNoExtraKeys!1724 lt!206537 lt!206533 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1578 (getCurrentListMapNoExtraKeys!1724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8045 k0!794 v!412)))))

(declare-datatypes ((Unit!13261 0))(
  ( (Unit!13262) )
))
(declare-fun lt!206536 () Unit!13261)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!738 (array!28312 array!28314 (_ BitVec 32) (_ BitVec 32) V!17451 V!17451 (_ BitVec 32) (_ BitVec 64) V!17451 (_ BitVec 32) Int) Unit!13261)

(assert (=> b!456302 (= lt!206536 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!738 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456303 () Bool)

(assert (=> b!456303 (= e!266608 tp_is_empty!12259)))

(assert (= (and start!40972 res!272290) b!456292))

(assert (= (and b!456292 res!272298) b!456298))

(assert (= (and b!456298 res!272295) b!456299))

(assert (= (and b!456299 res!272292) b!456301))

(assert (= (and b!456301 res!272288) b!456295))

(assert (= (and b!456295 res!272291) b!456289))

(assert (= (and b!456289 res!272296) b!456300))

(assert (= (and b!456300 res!272294) b!456293))

(assert (= (and b!456293 res!272297) b!456291))

(assert (= (and b!456291 res!272287) b!456296))

(assert (= (and b!456296 res!272299) b!456290))

(assert (= (and b!456290 res!272289) b!456297))

(assert (= (and b!456297 res!272293) b!456302))

(assert (= (and b!456294 condMapEmpty!20029) mapIsEmpty!20029))

(assert (= (and b!456294 (not condMapEmpty!20029)) mapNonEmpty!20029))

(get-info :version)

(assert (= (and mapNonEmpty!20029 ((_ is ValueCellFull!5786) mapValue!20029)) b!456303))

(assert (= (and b!456294 ((_ is ValueCellFull!5786) mapDefault!20029)) b!456288))

(assert (= start!40972 b!456294))

(declare-fun m!440013 () Bool)

(assert (=> b!456292 m!440013))

(declare-fun m!440015 () Bool)

(assert (=> b!456289 m!440015))

(declare-fun m!440017 () Bool)

(assert (=> b!456293 m!440017))

(declare-fun m!440019 () Bool)

(assert (=> b!456302 m!440019))

(declare-fun m!440021 () Bool)

(assert (=> b!456302 m!440021))

(assert (=> b!456302 m!440021))

(declare-fun m!440023 () Bool)

(assert (=> b!456302 m!440023))

(declare-fun m!440025 () Bool)

(assert (=> b!456302 m!440025))

(declare-fun m!440027 () Bool)

(assert (=> b!456300 m!440027))

(declare-fun m!440029 () Bool)

(assert (=> b!456301 m!440029))

(declare-fun m!440031 () Bool)

(assert (=> b!456296 m!440031))

(declare-fun m!440033 () Bool)

(assert (=> b!456291 m!440033))

(declare-fun m!440035 () Bool)

(assert (=> b!456291 m!440035))

(declare-fun m!440037 () Bool)

(assert (=> start!40972 m!440037))

(declare-fun m!440039 () Bool)

(assert (=> start!40972 m!440039))

(declare-fun m!440041 () Bool)

(assert (=> b!456297 m!440041))

(declare-fun m!440043 () Bool)

(assert (=> b!456297 m!440043))

(declare-fun m!440045 () Bool)

(assert (=> b!456297 m!440045))

(declare-fun m!440047 () Bool)

(assert (=> mapNonEmpty!20029 m!440047))

(declare-fun m!440049 () Bool)

(assert (=> b!456299 m!440049))

(check-sat (not start!40972) (not b!456297) (not b!456292) (not b!456291) (not b!456289) (not b!456296) (not b!456302) (not b!456293) (not b!456299) (not mapNonEmpty!20029) tp_is_empty!12259 (not b_next!10921) (not b!456301) b_and!19073)
(check-sat b_and!19073 (not b_next!10921))
