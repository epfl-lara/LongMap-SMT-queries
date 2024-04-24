; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40130 () Bool)

(assert start!40130)

(declare-fun b_free!10411 () Bool)

(declare-fun b_next!10411 () Bool)

(assert (=> start!40130 (= b_free!10411 (not b_next!10411))))

(declare-fun tp!36762 () Bool)

(declare-fun b_and!18393 () Bool)

(assert (=> start!40130 (= tp!36762 b_and!18393)))

(declare-fun b!439171 () Bool)

(declare-fun res!259514 () Bool)

(declare-fun e!258927 () Bool)

(assert (=> b!439171 (=> (not res!259514) (not e!258927))))

(declare-datatypes ((array!26948 0))(
  ( (array!26949 (arr!12923 (Array (_ BitVec 32) (_ BitVec 64))) (size!13275 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26948)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439171 (= res!259514 (or (= (select (arr!12923 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12923 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18966 () Bool)

(declare-fun mapRes!18966 () Bool)

(assert (=> mapIsEmpty!18966 mapRes!18966))

(declare-fun b!439172 () Bool)

(declare-fun res!259503 () Bool)

(assert (=> b!439172 (=> (not res!259503) (not e!258927))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439172 (= res!259503 (validMask!0 mask!1025))))

(declare-fun b!439173 () Bool)

(declare-fun res!259508 () Bool)

(assert (=> b!439173 (=> (not res!259508) (not e!258927))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439173 (= res!259508 (validKeyInArray!0 k0!794))))

(declare-fun b!439174 () Bool)

(declare-fun res!259512 () Bool)

(assert (=> b!439174 (=> (not res!259512) (not e!258927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26948 (_ BitVec 32)) Bool)

(assert (=> b!439174 (= res!259512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439175 () Bool)

(declare-fun res!259510 () Bool)

(assert (=> b!439175 (=> (not res!259510) (not e!258927))))

(assert (=> b!439175 (= res!259510 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13275 _keys!709))))))

(declare-fun b!439176 () Bool)

(declare-fun res!259507 () Bool)

(assert (=> b!439176 (=> (not res!259507) (not e!258927))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16523 0))(
  ( (V!16524 (val!5826 Int)) )
))
(declare-datatypes ((ValueCell!5438 0))(
  ( (ValueCellFull!5438 (v!8074 V!16523)) (EmptyCell!5438) )
))
(declare-datatypes ((array!26950 0))(
  ( (array!26951 (arr!12924 (Array (_ BitVec 32) ValueCell!5438)) (size!13276 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26950)

(assert (=> b!439176 (= res!259507 (and (= (size!13276 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13275 _keys!709) (size!13276 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439177 () Bool)

(declare-fun e!258930 () Bool)

(assert (=> b!439177 (= e!258927 e!258930)))

(declare-fun res!259515 () Bool)

(assert (=> b!439177 (=> (not res!259515) (not e!258930))))

(declare-fun lt!202223 () array!26948)

(assert (=> b!439177 (= res!259515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202223 mask!1025))))

(assert (=> b!439177 (= lt!202223 (array!26949 (store (arr!12923 _keys!709) i!563 k0!794) (size!13275 _keys!709)))))

(declare-fun b!439178 () Bool)

(declare-fun res!259505 () Bool)

(assert (=> b!439178 (=> (not res!259505) (not e!258927))))

(declare-datatypes ((List!7629 0))(
  ( (Nil!7626) (Cons!7625 (h!8481 (_ BitVec 64)) (t!13377 List!7629)) )
))
(declare-fun arrayNoDuplicates!0 (array!26948 (_ BitVec 32) List!7629) Bool)

(assert (=> b!439178 (= res!259505 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7626))))

(declare-fun b!439179 () Bool)

(declare-fun res!259504 () Bool)

(assert (=> b!439179 (=> (not res!259504) (not e!258927))))

(declare-fun arrayContainsKey!0 (array!26948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439179 (= res!259504 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439180 () Bool)

(declare-fun res!259506 () Bool)

(assert (=> b!439180 (=> (not res!259506) (not e!258930))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!439180 (= res!259506 (bvsle from!863 i!563))))

(declare-fun b!439181 () Bool)

(declare-fun e!258931 () Bool)

(assert (=> b!439181 (= e!258930 e!258931)))

(declare-fun res!259509 () Bool)

(assert (=> b!439181 (=> (not res!259509) (not e!258931))))

(assert (=> b!439181 (= res!259509 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16523)

(declare-fun minValue!515 () V!16523)

(declare-fun lt!202224 () array!26950)

(declare-datatypes ((tuple2!7642 0))(
  ( (tuple2!7643 (_1!3832 (_ BitVec 64)) (_2!3832 V!16523)) )
))
(declare-datatypes ((List!7630 0))(
  ( (Nil!7627) (Cons!7626 (h!8482 tuple2!7642) (t!13378 List!7630)) )
))
(declare-datatypes ((ListLongMap!6557 0))(
  ( (ListLongMap!6558 (toList!3294 List!7630)) )
))
(declare-fun lt!202221 () ListLongMap!6557)

(declare-fun getCurrentListMapNoExtraKeys!1527 (array!26948 array!26950 (_ BitVec 32) (_ BitVec 32) V!16523 V!16523 (_ BitVec 32) Int) ListLongMap!6557)

(assert (=> b!439181 (= lt!202221 (getCurrentListMapNoExtraKeys!1527 lt!202223 lt!202224 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16523)

(assert (=> b!439181 (= lt!202224 (array!26951 (store (arr!12924 _values!549) i!563 (ValueCellFull!5438 v!412)) (size!13276 _values!549)))))

(declare-fun lt!202222 () ListLongMap!6557)

(assert (=> b!439181 (= lt!202222 (getCurrentListMapNoExtraKeys!1527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439182 () Bool)

(declare-fun res!259511 () Bool)

(assert (=> b!439182 (=> (not res!259511) (not e!258930))))

(assert (=> b!439182 (= res!259511 (arrayNoDuplicates!0 lt!202223 #b00000000000000000000000000000000 Nil!7626))))

(declare-fun res!259513 () Bool)

(assert (=> start!40130 (=> (not res!259513) (not e!258927))))

(assert (=> start!40130 (= res!259513 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13275 _keys!709))))))

(assert (=> start!40130 e!258927))

(declare-fun tp_is_empty!11563 () Bool)

(assert (=> start!40130 tp_is_empty!11563))

(assert (=> start!40130 tp!36762))

(assert (=> start!40130 true))

(declare-fun e!258928 () Bool)

(declare-fun array_inv!9448 (array!26950) Bool)

(assert (=> start!40130 (and (array_inv!9448 _values!549) e!258928)))

(declare-fun array_inv!9449 (array!26948) Bool)

(assert (=> start!40130 (array_inv!9449 _keys!709)))

(declare-fun mapNonEmpty!18966 () Bool)

(declare-fun tp!36761 () Bool)

(declare-fun e!258929 () Bool)

(assert (=> mapNonEmpty!18966 (= mapRes!18966 (and tp!36761 e!258929))))

(declare-fun mapValue!18966 () ValueCell!5438)

(declare-fun mapRest!18966 () (Array (_ BitVec 32) ValueCell!5438))

(declare-fun mapKey!18966 () (_ BitVec 32))

(assert (=> mapNonEmpty!18966 (= (arr!12924 _values!549) (store mapRest!18966 mapKey!18966 mapValue!18966))))

(declare-fun b!439183 () Bool)

(declare-fun e!258925 () Bool)

(assert (=> b!439183 (= e!258928 (and e!258925 mapRes!18966))))

(declare-fun condMapEmpty!18966 () Bool)

(declare-fun mapDefault!18966 () ValueCell!5438)

(assert (=> b!439183 (= condMapEmpty!18966 (= (arr!12924 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5438)) mapDefault!18966)))))

(declare-fun b!439184 () Bool)

(assert (=> b!439184 (= e!258929 tp_is_empty!11563)))

(declare-fun b!439185 () Bool)

(assert (=> b!439185 (= e!258931 (not true))))

(declare-fun +!1489 (ListLongMap!6557 tuple2!7642) ListLongMap!6557)

(assert (=> b!439185 (= (getCurrentListMapNoExtraKeys!1527 lt!202223 lt!202224 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1489 (getCurrentListMapNoExtraKeys!1527 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7643 k0!794 v!412)))))

(declare-datatypes ((Unit!13053 0))(
  ( (Unit!13054) )
))
(declare-fun lt!202220 () Unit!13053)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!649 (array!26948 array!26950 (_ BitVec 32) (_ BitVec 32) V!16523 V!16523 (_ BitVec 32) (_ BitVec 64) V!16523 (_ BitVec 32) Int) Unit!13053)

(assert (=> b!439185 (= lt!202220 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!649 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439186 () Bool)

(assert (=> b!439186 (= e!258925 tp_is_empty!11563)))

(assert (= (and start!40130 res!259513) b!439172))

(assert (= (and b!439172 res!259503) b!439176))

(assert (= (and b!439176 res!259507) b!439174))

(assert (= (and b!439174 res!259512) b!439178))

(assert (= (and b!439178 res!259505) b!439175))

(assert (= (and b!439175 res!259510) b!439173))

(assert (= (and b!439173 res!259508) b!439171))

(assert (= (and b!439171 res!259514) b!439179))

(assert (= (and b!439179 res!259504) b!439177))

(assert (= (and b!439177 res!259515) b!439182))

(assert (= (and b!439182 res!259511) b!439180))

(assert (= (and b!439180 res!259506) b!439181))

(assert (= (and b!439181 res!259509) b!439185))

(assert (= (and b!439183 condMapEmpty!18966) mapIsEmpty!18966))

(assert (= (and b!439183 (not condMapEmpty!18966)) mapNonEmpty!18966))

(get-info :version)

(assert (= (and mapNonEmpty!18966 ((_ is ValueCellFull!5438) mapValue!18966)) b!439184))

(assert (= (and b!439183 ((_ is ValueCellFull!5438) mapDefault!18966)) b!439186))

(assert (= start!40130 b!439183))

(declare-fun m!426737 () Bool)

(assert (=> b!439179 m!426737))

(declare-fun m!426739 () Bool)

(assert (=> b!439181 m!426739))

(declare-fun m!426741 () Bool)

(assert (=> b!439181 m!426741))

(declare-fun m!426743 () Bool)

(assert (=> b!439181 m!426743))

(declare-fun m!426745 () Bool)

(assert (=> b!439172 m!426745))

(declare-fun m!426747 () Bool)

(assert (=> mapNonEmpty!18966 m!426747))

(declare-fun m!426749 () Bool)

(assert (=> b!439174 m!426749))

(declare-fun m!426751 () Bool)

(assert (=> start!40130 m!426751))

(declare-fun m!426753 () Bool)

(assert (=> start!40130 m!426753))

(declare-fun m!426755 () Bool)

(assert (=> b!439171 m!426755))

(declare-fun m!426757 () Bool)

(assert (=> b!439182 m!426757))

(declare-fun m!426759 () Bool)

(assert (=> b!439185 m!426759))

(declare-fun m!426761 () Bool)

(assert (=> b!439185 m!426761))

(assert (=> b!439185 m!426761))

(declare-fun m!426763 () Bool)

(assert (=> b!439185 m!426763))

(declare-fun m!426765 () Bool)

(assert (=> b!439185 m!426765))

(declare-fun m!426767 () Bool)

(assert (=> b!439177 m!426767))

(declare-fun m!426769 () Bool)

(assert (=> b!439177 m!426769))

(declare-fun m!426771 () Bool)

(assert (=> b!439173 m!426771))

(declare-fun m!426773 () Bool)

(assert (=> b!439178 m!426773))

(check-sat (not b!439178) (not b_next!10411) (not mapNonEmpty!18966) (not b!439173) (not b!439172) (not b!439181) b_and!18393 tp_is_empty!11563 (not b!439179) (not b!439174) (not b!439182) (not b!439185) (not start!40130) (not b!439177))
(check-sat b_and!18393 (not b_next!10411))
