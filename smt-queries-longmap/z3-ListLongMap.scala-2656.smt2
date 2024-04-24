; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39740 () Bool)

(assert start!39740)

(declare-fun b_free!10021 () Bool)

(declare-fun b_next!10021 () Bool)

(assert (=> start!39740 (= b_free!10021 (not b_next!10021))))

(declare-fun tp!35592 () Bool)

(declare-fun b_and!17715 () Bool)

(assert (=> start!39740 (= tp!35592 b_and!17715)))

(declare-fun b!427941 () Bool)

(declare-fun res!251156 () Bool)

(declare-fun e!253663 () Bool)

(assert (=> b!427941 (=> (not res!251156) (not e!253663))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427941 (= res!251156 (validKeyInArray!0 k0!794))))

(declare-fun b!427942 () Bool)

(declare-fun res!251150 () Bool)

(assert (=> b!427942 (=> (not res!251150) (not e!253663))))

(declare-datatypes ((array!26192 0))(
  ( (array!26193 (arr!12545 (Array (_ BitVec 32) (_ BitVec 64))) (size!12897 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26192)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26192 (_ BitVec 32)) Bool)

(assert (=> b!427942 (= res!251150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427943 () Bool)

(declare-fun res!251155 () Bool)

(assert (=> b!427943 (=> (not res!251155) (not e!253663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427943 (= res!251155 (validMask!0 mask!1025))))

(declare-fun b!427944 () Bool)

(declare-fun e!253665 () Bool)

(assert (=> b!427944 (= e!253665 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16003 0))(
  ( (V!16004 (val!5631 Int)) )
))
(declare-datatypes ((tuple2!7308 0))(
  ( (tuple2!7309 (_1!3665 (_ BitVec 64)) (_2!3665 V!16003)) )
))
(declare-datatypes ((List!7311 0))(
  ( (Nil!7308) (Cons!7307 (h!8163 tuple2!7308) (t!12773 List!7311)) )
))
(declare-datatypes ((ListLongMap!6223 0))(
  ( (ListLongMap!6224 (toList!3127 List!7311)) )
))
(declare-fun lt!195563 () ListLongMap!6223)

(declare-datatypes ((ValueCell!5243 0))(
  ( (ValueCellFull!5243 (v!7879 V!16003)) (EmptyCell!5243) )
))
(declare-datatypes ((array!26194 0))(
  ( (array!26195 (arr!12546 (Array (_ BitVec 32) ValueCell!5243)) (size!12898 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26194)

(declare-fun lt!195564 () ListLongMap!6223)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1340 (ListLongMap!6223 tuple2!7308) ListLongMap!6223)

(declare-fun get!6217 (ValueCell!5243 V!16003) V!16003)

(declare-fun dynLambda!756 (Int (_ BitVec 64)) V!16003)

(assert (=> b!427944 (= lt!195563 (+!1340 lt!195564 (tuple2!7309 (select (arr!12545 _keys!709) from!863) (get!6217 (select (arr!12546 _values!549) from!863) (dynLambda!756 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427945 () Bool)

(declare-fun e!253669 () Bool)

(assert (=> b!427945 (= e!253663 e!253669)))

(declare-fun res!251144 () Bool)

(assert (=> b!427945 (=> (not res!251144) (not e!253669))))

(declare-fun lt!195560 () array!26192)

(assert (=> b!427945 (= res!251144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195560 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427945 (= lt!195560 (array!26193 (store (arr!12545 _keys!709) i!563 k0!794) (size!12897 _keys!709)))))

(declare-fun b!427946 () Bool)

(declare-fun e!253666 () Bool)

(declare-fun tp_is_empty!11173 () Bool)

(assert (=> b!427946 (= e!253666 tp_is_empty!11173)))

(declare-fun b!427947 () Bool)

(declare-fun e!253667 () Bool)

(assert (=> b!427947 (= e!253669 e!253667)))

(declare-fun res!251152 () Bool)

(assert (=> b!427947 (=> (not res!251152) (not e!253667))))

(assert (=> b!427947 (= res!251152 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16003)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16003)

(declare-fun lt!195558 () array!26194)

(declare-fun getCurrentListMapNoExtraKeys!1373 (array!26192 array!26194 (_ BitVec 32) (_ BitVec 32) V!16003 V!16003 (_ BitVec 32) Int) ListLongMap!6223)

(assert (=> b!427947 (= lt!195563 (getCurrentListMapNoExtraKeys!1373 lt!195560 lt!195558 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16003)

(assert (=> b!427947 (= lt!195558 (array!26195 (store (arr!12546 _values!549) i!563 (ValueCellFull!5243 v!412)) (size!12898 _values!549)))))

(declare-fun lt!195559 () ListLongMap!6223)

(assert (=> b!427947 (= lt!195559 (getCurrentListMapNoExtraKeys!1373 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18381 () Bool)

(declare-fun mapRes!18381 () Bool)

(declare-fun tp!35591 () Bool)

(assert (=> mapNonEmpty!18381 (= mapRes!18381 (and tp!35591 e!253666))))

(declare-fun mapKey!18381 () (_ BitVec 32))

(declare-fun mapRest!18381 () (Array (_ BitVec 32) ValueCell!5243))

(declare-fun mapValue!18381 () ValueCell!5243)

(assert (=> mapNonEmpty!18381 (= (arr!12546 _values!549) (store mapRest!18381 mapKey!18381 mapValue!18381))))

(declare-fun b!427949 () Bool)

(declare-fun res!251148 () Bool)

(assert (=> b!427949 (=> (not res!251148) (not e!253663))))

(assert (=> b!427949 (= res!251148 (and (= (size!12898 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12897 _keys!709) (size!12898 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427950 () Bool)

(declare-fun res!251146 () Bool)

(assert (=> b!427950 (=> (not res!251146) (not e!253669))))

(assert (=> b!427950 (= res!251146 (bvsle from!863 i!563))))

(declare-fun b!427951 () Bool)

(declare-fun res!251151 () Bool)

(assert (=> b!427951 (=> (not res!251151) (not e!253663))))

(assert (=> b!427951 (= res!251151 (or (= (select (arr!12545 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12545 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427952 () Bool)

(declare-fun res!251157 () Bool)

(assert (=> b!427952 (=> (not res!251157) (not e!253663))))

(declare-datatypes ((List!7312 0))(
  ( (Nil!7309) (Cons!7308 (h!8164 (_ BitVec 64)) (t!12774 List!7312)) )
))
(declare-fun arrayNoDuplicates!0 (array!26192 (_ BitVec 32) List!7312) Bool)

(assert (=> b!427952 (= res!251157 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7309))))

(declare-fun b!427953 () Bool)

(declare-fun e!253662 () Bool)

(declare-fun e!253668 () Bool)

(assert (=> b!427953 (= e!253662 (and e!253668 mapRes!18381))))

(declare-fun condMapEmpty!18381 () Bool)

(declare-fun mapDefault!18381 () ValueCell!5243)

(assert (=> b!427953 (= condMapEmpty!18381 (= (arr!12546 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5243)) mapDefault!18381)))))

(declare-fun mapIsEmpty!18381 () Bool)

(assert (=> mapIsEmpty!18381 mapRes!18381))

(declare-fun b!427954 () Bool)

(assert (=> b!427954 (= e!253668 tp_is_empty!11173)))

(declare-fun b!427955 () Bool)

(declare-fun res!251147 () Bool)

(assert (=> b!427955 (=> (not res!251147) (not e!253663))))

(declare-fun arrayContainsKey!0 (array!26192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427955 (= res!251147 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!251153 () Bool)

(assert (=> start!39740 (=> (not res!251153) (not e!253663))))

(assert (=> start!39740 (= res!251153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12897 _keys!709))))))

(assert (=> start!39740 e!253663))

(assert (=> start!39740 tp_is_empty!11173))

(assert (=> start!39740 tp!35592))

(assert (=> start!39740 true))

(declare-fun array_inv!9208 (array!26194) Bool)

(assert (=> start!39740 (and (array_inv!9208 _values!549) e!253662)))

(declare-fun array_inv!9209 (array!26192) Bool)

(assert (=> start!39740 (array_inv!9209 _keys!709)))

(declare-fun b!427948 () Bool)

(declare-fun res!251145 () Bool)

(assert (=> b!427948 (=> (not res!251145) (not e!253663))))

(assert (=> b!427948 (= res!251145 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12897 _keys!709))))))

(declare-fun b!427956 () Bool)

(declare-fun res!251149 () Bool)

(assert (=> b!427956 (=> (not res!251149) (not e!253669))))

(assert (=> b!427956 (= res!251149 (arrayNoDuplicates!0 lt!195560 #b00000000000000000000000000000000 Nil!7309))))

(declare-fun b!427957 () Bool)

(assert (=> b!427957 (= e!253667 (not e!253665))))

(declare-fun res!251154 () Bool)

(assert (=> b!427957 (=> res!251154 e!253665)))

(assert (=> b!427957 (= res!251154 (not (validKeyInArray!0 (select (arr!12545 _keys!709) from!863))))))

(declare-fun lt!195562 () ListLongMap!6223)

(assert (=> b!427957 (= lt!195562 lt!195564)))

(declare-fun lt!195557 () ListLongMap!6223)

(assert (=> b!427957 (= lt!195564 (+!1340 lt!195557 (tuple2!7309 k0!794 v!412)))))

(assert (=> b!427957 (= lt!195562 (getCurrentListMapNoExtraKeys!1373 lt!195560 lt!195558 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427957 (= lt!195557 (getCurrentListMapNoExtraKeys!1373 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12555 0))(
  ( (Unit!12556) )
))
(declare-fun lt!195561 () Unit!12555)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!524 (array!26192 array!26194 (_ BitVec 32) (_ BitVec 32) V!16003 V!16003 (_ BitVec 32) (_ BitVec 64) V!16003 (_ BitVec 32) Int) Unit!12555)

(assert (=> b!427957 (= lt!195561 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39740 res!251153) b!427943))

(assert (= (and b!427943 res!251155) b!427949))

(assert (= (and b!427949 res!251148) b!427942))

(assert (= (and b!427942 res!251150) b!427952))

(assert (= (and b!427952 res!251157) b!427948))

(assert (= (and b!427948 res!251145) b!427941))

(assert (= (and b!427941 res!251156) b!427951))

(assert (= (and b!427951 res!251151) b!427955))

(assert (= (and b!427955 res!251147) b!427945))

(assert (= (and b!427945 res!251144) b!427956))

(assert (= (and b!427956 res!251149) b!427950))

(assert (= (and b!427950 res!251146) b!427947))

(assert (= (and b!427947 res!251152) b!427957))

(assert (= (and b!427957 (not res!251154)) b!427944))

(assert (= (and b!427953 condMapEmpty!18381) mapIsEmpty!18381))

(assert (= (and b!427953 (not condMapEmpty!18381)) mapNonEmpty!18381))

(get-info :version)

(assert (= (and mapNonEmpty!18381 ((_ is ValueCellFull!5243) mapValue!18381)) b!427946))

(assert (= (and b!427953 ((_ is ValueCellFull!5243) mapDefault!18381)) b!427954))

(assert (= start!39740 b!427953))

(declare-fun b_lambda!9131 () Bool)

(assert (=> (not b_lambda!9131) (not b!427944)))

(declare-fun t!12772 () Bool)

(declare-fun tb!3419 () Bool)

(assert (=> (and start!39740 (= defaultEntry!557 defaultEntry!557) t!12772) tb!3419))

(declare-fun result!6373 () Bool)

(assert (=> tb!3419 (= result!6373 tp_is_empty!11173)))

(assert (=> b!427944 t!12772))

(declare-fun b_and!17717 () Bool)

(assert (= b_and!17715 (and (=> t!12772 result!6373) b_and!17717)))

(declare-fun m!416675 () Bool)

(assert (=> b!427955 m!416675))

(declare-fun m!416677 () Bool)

(assert (=> b!427945 m!416677))

(declare-fun m!416679 () Bool)

(assert (=> b!427945 m!416679))

(declare-fun m!416681 () Bool)

(assert (=> start!39740 m!416681))

(declare-fun m!416683 () Bool)

(assert (=> start!39740 m!416683))

(declare-fun m!416685 () Bool)

(assert (=> b!427951 m!416685))

(declare-fun m!416687 () Bool)

(assert (=> b!427952 m!416687))

(declare-fun m!416689 () Bool)

(assert (=> b!427943 m!416689))

(declare-fun m!416691 () Bool)

(assert (=> b!427941 m!416691))

(declare-fun m!416693 () Bool)

(assert (=> mapNonEmpty!18381 m!416693))

(declare-fun m!416695 () Bool)

(assert (=> b!427944 m!416695))

(declare-fun m!416697 () Bool)

(assert (=> b!427944 m!416697))

(declare-fun m!416699 () Bool)

(assert (=> b!427944 m!416699))

(declare-fun m!416701 () Bool)

(assert (=> b!427944 m!416701))

(assert (=> b!427944 m!416701))

(assert (=> b!427944 m!416699))

(declare-fun m!416703 () Bool)

(assert (=> b!427944 m!416703))

(declare-fun m!416705 () Bool)

(assert (=> b!427947 m!416705))

(declare-fun m!416707 () Bool)

(assert (=> b!427947 m!416707))

(declare-fun m!416709 () Bool)

(assert (=> b!427947 m!416709))

(declare-fun m!416711 () Bool)

(assert (=> b!427956 m!416711))

(declare-fun m!416713 () Bool)

(assert (=> b!427942 m!416713))

(assert (=> b!427957 m!416695))

(declare-fun m!416715 () Bool)

(assert (=> b!427957 m!416715))

(declare-fun m!416717 () Bool)

(assert (=> b!427957 m!416717))

(assert (=> b!427957 m!416695))

(declare-fun m!416719 () Bool)

(assert (=> b!427957 m!416719))

(declare-fun m!416721 () Bool)

(assert (=> b!427957 m!416721))

(declare-fun m!416723 () Bool)

(assert (=> b!427957 m!416723))

(check-sat (not b!427942) (not b!427945) (not mapNonEmpty!18381) (not b_next!10021) (not b!427956) (not b!427947) b_and!17717 (not b!427941) (not b!427955) (not b!427943) (not b!427944) (not b!427957) tp_is_empty!11173 (not b_lambda!9131) (not b!427952) (not start!39740))
(check-sat b_and!17717 (not b_next!10021))
