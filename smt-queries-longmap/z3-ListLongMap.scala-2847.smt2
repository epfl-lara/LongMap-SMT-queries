; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41054 () Bool)

(assert start!41054)

(declare-fun b_free!10981 () Bool)

(declare-fun b_next!10981 () Bool)

(assert (=> start!41054 (= b_free!10981 (not b_next!10981))))

(declare-fun tp!38773 () Bool)

(declare-fun b_and!19143 () Bool)

(assert (=> start!41054 (= tp!38773 b_and!19143)))

(declare-fun res!273474 () Bool)

(declare-fun e!267273 () Bool)

(assert (=> start!41054 (=> (not res!273474) (not e!267273))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28431 0))(
  ( (array!28432 (arr!13658 (Array (_ BitVec 32) (_ BitVec 64))) (size!14011 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28431)

(assert (=> start!41054 (= res!273474 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14011 _keys!709))))))

(assert (=> start!41054 e!267273))

(declare-fun tp_is_empty!12319 () Bool)

(assert (=> start!41054 tp_is_empty!12319))

(assert (=> start!41054 tp!38773))

(assert (=> start!41054 true))

(declare-datatypes ((V!17531 0))(
  ( (V!17532 (val!6204 Int)) )
))
(declare-datatypes ((ValueCell!5816 0))(
  ( (ValueCellFull!5816 (v!8468 V!17531)) (EmptyCell!5816) )
))
(declare-datatypes ((array!28433 0))(
  ( (array!28434 (arr!13659 (Array (_ BitVec 32) ValueCell!5816)) (size!14012 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28433)

(declare-fun e!267275 () Bool)

(declare-fun array_inv!9948 (array!28433) Bool)

(assert (=> start!41054 (and (array_inv!9948 _values!549) e!267275)))

(declare-fun array_inv!9949 (array!28431) Bool)

(assert (=> start!41054 (array_inv!9949 _keys!709)))

(declare-fun b!457767 () Bool)

(declare-fun res!273476 () Bool)

(assert (=> b!457767 (=> (not res!273476) (not e!267273))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457767 (= res!273476 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14011 _keys!709))))))

(declare-fun b!457768 () Bool)

(declare-fun e!267274 () Bool)

(declare-fun e!267269 () Bool)

(assert (=> b!457768 (= e!267274 (not e!267269))))

(declare-fun res!273482 () Bool)

(assert (=> b!457768 (=> res!273482 e!267269)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457768 (= res!273482 (not (validKeyInArray!0 (select (arr!13658 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8202 0))(
  ( (tuple2!8203 (_1!4112 (_ BitVec 64)) (_2!4112 V!17531)) )
))
(declare-datatypes ((List!8266 0))(
  ( (Nil!8263) (Cons!8262 (h!9118 tuple2!8202) (t!14117 List!8266)) )
))
(declare-datatypes ((ListLongMap!7105 0))(
  ( (ListLongMap!7106 (toList!3568 List!8266)) )
))
(declare-fun lt!206958 () ListLongMap!7105)

(declare-fun lt!206954 () ListLongMap!7105)

(assert (=> b!457768 (= lt!206958 lt!206954)))

(declare-fun lt!206951 () ListLongMap!7105)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17531)

(declare-fun +!1622 (ListLongMap!7105 tuple2!8202) ListLongMap!7105)

(assert (=> b!457768 (= lt!206954 (+!1622 lt!206951 (tuple2!8203 k0!794 v!412)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17531)

(declare-fun lt!206953 () array!28433)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17531)

(declare-fun lt!206952 () array!28431)

(declare-fun getCurrentListMapNoExtraKeys!1762 (array!28431 array!28433 (_ BitVec 32) (_ BitVec 32) V!17531 V!17531 (_ BitVec 32) Int) ListLongMap!7105)

(assert (=> b!457768 (= lt!206958 (getCurrentListMapNoExtraKeys!1762 lt!206952 lt!206953 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457768 (= lt!206951 (getCurrentListMapNoExtraKeys!1762 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13287 0))(
  ( (Unit!13288) )
))
(declare-fun lt!206957 () Unit!13287)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!756 (array!28431 array!28433 (_ BitVec 32) (_ BitVec 32) V!17531 V!17531 (_ BitVec 32) (_ BitVec 64) V!17531 (_ BitVec 32) Int) Unit!13287)

(assert (=> b!457768 (= lt!206957 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!756 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457769 () Bool)

(declare-fun res!273480 () Bool)

(assert (=> b!457769 (=> (not res!273480) (not e!267273))))

(declare-datatypes ((List!8267 0))(
  ( (Nil!8264) (Cons!8263 (h!9119 (_ BitVec 64)) (t!14118 List!8267)) )
))
(declare-fun arrayNoDuplicates!0 (array!28431 (_ BitVec 32) List!8267) Bool)

(assert (=> b!457769 (= res!273480 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8264))))

(declare-fun b!457770 () Bool)

(declare-fun res!273470 () Bool)

(assert (=> b!457770 (=> (not res!273470) (not e!267273))))

(assert (=> b!457770 (= res!273470 (and (= (size!14012 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14011 _keys!709) (size!14012 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457771 () Bool)

(declare-fun res!273481 () Bool)

(assert (=> b!457771 (=> (not res!273481) (not e!267273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457771 (= res!273481 (validMask!0 mask!1025))))

(declare-fun b!457772 () Bool)

(declare-fun res!273472 () Bool)

(assert (=> b!457772 (=> (not res!273472) (not e!267273))))

(assert (=> b!457772 (= res!273472 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!20122 () Bool)

(declare-fun mapRes!20122 () Bool)

(declare-fun tp!38772 () Bool)

(declare-fun e!267270 () Bool)

(assert (=> mapNonEmpty!20122 (= mapRes!20122 (and tp!38772 e!267270))))

(declare-fun mapKey!20122 () (_ BitVec 32))

(declare-fun mapValue!20122 () ValueCell!5816)

(declare-fun mapRest!20122 () (Array (_ BitVec 32) ValueCell!5816))

(assert (=> mapNonEmpty!20122 (= (arr!13659 _values!549) (store mapRest!20122 mapKey!20122 mapValue!20122))))

(declare-fun b!457773 () Bool)

(declare-fun res!273479 () Bool)

(assert (=> b!457773 (=> (not res!273479) (not e!267273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28431 (_ BitVec 32)) Bool)

(assert (=> b!457773 (= res!273479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457774 () Bool)

(declare-fun e!267276 () Bool)

(assert (=> b!457774 (= e!267275 (and e!267276 mapRes!20122))))

(declare-fun condMapEmpty!20122 () Bool)

(declare-fun mapDefault!20122 () ValueCell!5816)

(assert (=> b!457774 (= condMapEmpty!20122 (= (arr!13659 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5816)) mapDefault!20122)))))

(declare-fun b!457775 () Bool)

(assert (=> b!457775 (= e!267276 tp_is_empty!12319)))

(declare-fun b!457776 () Bool)

(declare-fun e!267272 () Bool)

(assert (=> b!457776 (= e!267272 e!267274)))

(declare-fun res!273483 () Bool)

(assert (=> b!457776 (=> (not res!273483) (not e!267274))))

(assert (=> b!457776 (= res!273483 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206955 () ListLongMap!7105)

(assert (=> b!457776 (= lt!206955 (getCurrentListMapNoExtraKeys!1762 lt!206952 lt!206953 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457776 (= lt!206953 (array!28434 (store (arr!13659 _values!549) i!563 (ValueCellFull!5816 v!412)) (size!14012 _values!549)))))

(declare-fun lt!206956 () ListLongMap!7105)

(assert (=> b!457776 (= lt!206956 (getCurrentListMapNoExtraKeys!1762 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20122 () Bool)

(assert (=> mapIsEmpty!20122 mapRes!20122))

(declare-fun b!457777 () Bool)

(declare-fun res!273471 () Bool)

(assert (=> b!457777 (=> (not res!273471) (not e!267273))))

(declare-fun arrayContainsKey!0 (array!28431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457777 (= res!273471 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457778 () Bool)

(assert (=> b!457778 (= e!267270 tp_is_empty!12319)))

(declare-fun b!457779 () Bool)

(declare-fun res!273477 () Bool)

(assert (=> b!457779 (=> (not res!273477) (not e!267272))))

(assert (=> b!457779 (= res!273477 (bvsle from!863 i!563))))

(declare-fun b!457780 () Bool)

(declare-fun res!273475 () Bool)

(assert (=> b!457780 (=> (not res!273475) (not e!267273))))

(assert (=> b!457780 (= res!273475 (or (= (select (arr!13658 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13658 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457781 () Bool)

(assert (=> b!457781 (= e!267269 true)))

(declare-fun get!6730 (ValueCell!5816 V!17531) V!17531)

(declare-fun dynLambda!883 (Int (_ BitVec 64)) V!17531)

(assert (=> b!457781 (= lt!206955 (+!1622 lt!206954 (tuple2!8203 (select (arr!13658 _keys!709) from!863) (get!6730 (select (arr!13659 _values!549) from!863) (dynLambda!883 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457782 () Bool)

(declare-fun res!273478 () Bool)

(assert (=> b!457782 (=> (not res!273478) (not e!267272))))

(assert (=> b!457782 (= res!273478 (arrayNoDuplicates!0 lt!206952 #b00000000000000000000000000000000 Nil!8264))))

(declare-fun b!457783 () Bool)

(assert (=> b!457783 (= e!267273 e!267272)))

(declare-fun res!273473 () Bool)

(assert (=> b!457783 (=> (not res!273473) (not e!267272))))

(assert (=> b!457783 (= res!273473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206952 mask!1025))))

(assert (=> b!457783 (= lt!206952 (array!28432 (store (arr!13658 _keys!709) i!563 k0!794) (size!14011 _keys!709)))))

(assert (= (and start!41054 res!273474) b!457771))

(assert (= (and b!457771 res!273481) b!457770))

(assert (= (and b!457770 res!273470) b!457773))

(assert (= (and b!457773 res!273479) b!457769))

(assert (= (and b!457769 res!273480) b!457767))

(assert (= (and b!457767 res!273476) b!457772))

(assert (= (and b!457772 res!273472) b!457780))

(assert (= (and b!457780 res!273475) b!457777))

(assert (= (and b!457777 res!273471) b!457783))

(assert (= (and b!457783 res!273473) b!457782))

(assert (= (and b!457782 res!273478) b!457779))

(assert (= (and b!457779 res!273477) b!457776))

(assert (= (and b!457776 res!273483) b!457768))

(assert (= (and b!457768 (not res!273482)) b!457781))

(assert (= (and b!457774 condMapEmpty!20122) mapIsEmpty!20122))

(assert (= (and b!457774 (not condMapEmpty!20122)) mapNonEmpty!20122))

(get-info :version)

(assert (= (and mapNonEmpty!20122 ((_ is ValueCellFull!5816) mapValue!20122)) b!457778))

(assert (= (and b!457774 ((_ is ValueCellFull!5816) mapDefault!20122)) b!457775))

(assert (= start!41054 b!457774))

(declare-fun b_lambda!9729 () Bool)

(assert (=> (not b_lambda!9729) (not b!457781)))

(declare-fun t!14116 () Bool)

(declare-fun tb!3809 () Bool)

(assert (=> (and start!41054 (= defaultEntry!557 defaultEntry!557) t!14116) tb!3809))

(declare-fun result!7167 () Bool)

(assert (=> tb!3809 (= result!7167 tp_is_empty!12319)))

(assert (=> b!457781 t!14116))

(declare-fun b_and!19145 () Bool)

(assert (= b_and!19143 (and (=> t!14116 result!7167) b_and!19145)))

(declare-fun m!440627 () Bool)

(assert (=> b!457769 m!440627))

(declare-fun m!440629 () Bool)

(assert (=> b!457771 m!440629))

(declare-fun m!440631 () Bool)

(assert (=> b!457777 m!440631))

(declare-fun m!440633 () Bool)

(assert (=> b!457773 m!440633))

(declare-fun m!440635 () Bool)

(assert (=> b!457780 m!440635))

(declare-fun m!440637 () Bool)

(assert (=> b!457783 m!440637))

(declare-fun m!440639 () Bool)

(assert (=> b!457783 m!440639))

(declare-fun m!440641 () Bool)

(assert (=> b!457768 m!440641))

(declare-fun m!440643 () Bool)

(assert (=> b!457768 m!440643))

(declare-fun m!440645 () Bool)

(assert (=> b!457768 m!440645))

(declare-fun m!440647 () Bool)

(assert (=> b!457768 m!440647))

(assert (=> b!457768 m!440641))

(declare-fun m!440649 () Bool)

(assert (=> b!457768 m!440649))

(declare-fun m!440651 () Bool)

(assert (=> b!457768 m!440651))

(declare-fun m!440653 () Bool)

(assert (=> start!41054 m!440653))

(declare-fun m!440655 () Bool)

(assert (=> start!41054 m!440655))

(declare-fun m!440657 () Bool)

(assert (=> b!457782 m!440657))

(declare-fun m!440659 () Bool)

(assert (=> mapNonEmpty!20122 m!440659))

(declare-fun m!440661 () Bool)

(assert (=> b!457776 m!440661))

(declare-fun m!440663 () Bool)

(assert (=> b!457776 m!440663))

(declare-fun m!440665 () Bool)

(assert (=> b!457776 m!440665))

(declare-fun m!440667 () Bool)

(assert (=> b!457772 m!440667))

(assert (=> b!457781 m!440641))

(declare-fun m!440669 () Bool)

(assert (=> b!457781 m!440669))

(declare-fun m!440671 () Bool)

(assert (=> b!457781 m!440671))

(declare-fun m!440673 () Bool)

(assert (=> b!457781 m!440673))

(assert (=> b!457781 m!440673))

(assert (=> b!457781 m!440669))

(declare-fun m!440675 () Bool)

(assert (=> b!457781 m!440675))

(check-sat (not mapNonEmpty!20122) (not start!41054) (not b!457771) b_and!19145 (not b!457776) tp_is_empty!12319 (not b!457782) (not b!457777) (not b!457772) (not b!457768) (not b!457773) (not b!457781) (not b!457769) (not b!457783) (not b_lambda!9729) (not b_next!10981))
(check-sat b_and!19145 (not b_next!10981))
