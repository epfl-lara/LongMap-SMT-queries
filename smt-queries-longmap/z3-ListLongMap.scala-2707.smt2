; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40046 () Bool)

(assert start!40046)

(declare-fun b_free!10327 () Bool)

(declare-fun b_next!10327 () Bool)

(assert (=> start!40046 (= b_free!10327 (not b_next!10327))))

(declare-fun tp!36510 () Bool)

(declare-fun b_and!18269 () Bool)

(assert (=> start!40046 (= tp!36510 b_and!18269)))

(declare-fun b!436933 () Bool)

(declare-fun res!257749 () Bool)

(declare-fun e!257901 () Bool)

(assert (=> b!436933 (=> (not res!257749) (not e!257901))))

(declare-datatypes ((array!26779 0))(
  ( (array!26780 (arr!12839 (Array (_ BitVec 32) (_ BitVec 64))) (size!13192 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26779)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16411 0))(
  ( (V!16412 (val!5784 Int)) )
))
(declare-datatypes ((ValueCell!5396 0))(
  ( (ValueCellFull!5396 (v!8025 V!16411)) (EmptyCell!5396) )
))
(declare-datatypes ((array!26781 0))(
  ( (array!26782 (arr!12840 (Array (_ BitVec 32) ValueCell!5396)) (size!13193 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26781)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!436933 (= res!257749 (and (= (size!13193 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13192 _keys!709) (size!13193 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436934 () Bool)

(declare-fun res!257747 () Bool)

(assert (=> b!436934 (=> (not res!257747) (not e!257901))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436934 (= res!257747 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436935 () Bool)

(declare-fun e!257903 () Bool)

(declare-fun tp_is_empty!11479 () Bool)

(assert (=> b!436935 (= e!257903 tp_is_empty!11479)))

(declare-fun b!436936 () Bool)

(declare-fun res!257750 () Bool)

(assert (=> b!436936 (=> (not res!257750) (not e!257901))))

(declare-datatypes ((List!7667 0))(
  ( (Nil!7664) (Cons!7663 (h!8519 (_ BitVec 64)) (t!13414 List!7667)) )
))
(declare-fun arrayNoDuplicates!0 (array!26779 (_ BitVec 32) List!7667) Bool)

(assert (=> b!436936 (= res!257750 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7664))))

(declare-fun b!436937 () Bool)

(declare-fun res!257742 () Bool)

(declare-fun e!257907 () Bool)

(assert (=> b!436937 (=> (not res!257742) (not e!257907))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436937 (= res!257742 (bvsle from!863 i!563))))

(declare-fun b!436938 () Bool)

(declare-fun res!257741 () Bool)

(assert (=> b!436938 (=> (not res!257741) (not e!257901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26779 (_ BitVec 32)) Bool)

(assert (=> b!436938 (= res!257741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18840 () Bool)

(declare-fun mapRes!18840 () Bool)

(declare-fun tp!36509 () Bool)

(assert (=> mapNonEmpty!18840 (= mapRes!18840 (and tp!36509 e!257903))))

(declare-fun mapRest!18840 () (Array (_ BitVec 32) ValueCell!5396))

(declare-fun mapValue!18840 () ValueCell!5396)

(declare-fun mapKey!18840 () (_ BitVec 32))

(assert (=> mapNonEmpty!18840 (= (arr!12840 _values!549) (store mapRest!18840 mapKey!18840 mapValue!18840))))

(declare-fun b!436939 () Bool)

(declare-fun res!257743 () Bool)

(assert (=> b!436939 (=> (not res!257743) (not e!257901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436939 (= res!257743 (validMask!0 mask!1025))))

(declare-fun b!436940 () Bool)

(declare-fun res!257740 () Bool)

(assert (=> b!436940 (=> (not res!257740) (not e!257901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436940 (= res!257740 (validKeyInArray!0 k0!794))))

(declare-fun b!436941 () Bool)

(assert (=> b!436941 (= e!257901 e!257907)))

(declare-fun res!257739 () Bool)

(assert (=> b!436941 (=> (not res!257739) (not e!257907))))

(declare-fun lt!201341 () array!26779)

(assert (=> b!436941 (= res!257739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201341 mask!1025))))

(assert (=> b!436941 (= lt!201341 (array!26780 (store (arr!12839 _keys!709) i!563 k0!794) (size!13192 _keys!709)))))

(declare-fun b!436942 () Bool)

(declare-fun res!257746 () Bool)

(assert (=> b!436942 (=> (not res!257746) (not e!257901))))

(assert (=> b!436942 (= res!257746 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13192 _keys!709))))))

(declare-fun b!436943 () Bool)

(declare-fun e!257905 () Bool)

(assert (=> b!436943 (= e!257905 (not true))))

(declare-fun minValue!515 () V!16411)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16411)

(declare-fun lt!201337 () array!26781)

(declare-fun v!412 () V!16411)

(declare-datatypes ((tuple2!7680 0))(
  ( (tuple2!7681 (_1!3851 (_ BitVec 64)) (_2!3851 V!16411)) )
))
(declare-datatypes ((List!7668 0))(
  ( (Nil!7665) (Cons!7664 (h!8520 tuple2!7680) (t!13415 List!7668)) )
))
(declare-datatypes ((ListLongMap!6583 0))(
  ( (ListLongMap!6584 (toList!3307 List!7668)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1506 (array!26779 array!26781 (_ BitVec 32) (_ BitVec 32) V!16411 V!16411 (_ BitVec 32) Int) ListLongMap!6583)

(declare-fun +!1481 (ListLongMap!6583 tuple2!7680) ListLongMap!6583)

(assert (=> b!436943 (= (getCurrentListMapNoExtraKeys!1506 lt!201341 lt!201337 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1481 (getCurrentListMapNoExtraKeys!1506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7681 k0!794 v!412)))))

(declare-datatypes ((Unit!12979 0))(
  ( (Unit!12980) )
))
(declare-fun lt!201338 () Unit!12979)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!619 (array!26779 array!26781 (_ BitVec 32) (_ BitVec 32) V!16411 V!16411 (_ BitVec 32) (_ BitVec 64) V!16411 (_ BitVec 32) Int) Unit!12979)

(assert (=> b!436943 (= lt!201338 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!619 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436944 () Bool)

(declare-fun res!257751 () Bool)

(assert (=> b!436944 (=> (not res!257751) (not e!257907))))

(assert (=> b!436944 (= res!257751 (arrayNoDuplicates!0 lt!201341 #b00000000000000000000000000000000 Nil!7664))))

(declare-fun mapIsEmpty!18840 () Bool)

(assert (=> mapIsEmpty!18840 mapRes!18840))

(declare-fun res!257744 () Bool)

(assert (=> start!40046 (=> (not res!257744) (not e!257901))))

(assert (=> start!40046 (= res!257744 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13192 _keys!709))))))

(assert (=> start!40046 e!257901))

(assert (=> start!40046 tp_is_empty!11479))

(assert (=> start!40046 tp!36510))

(assert (=> start!40046 true))

(declare-fun e!257902 () Bool)

(declare-fun array_inv!9378 (array!26781) Bool)

(assert (=> start!40046 (and (array_inv!9378 _values!549) e!257902)))

(declare-fun array_inv!9379 (array!26779) Bool)

(assert (=> start!40046 (array_inv!9379 _keys!709)))

(declare-fun b!436945 () Bool)

(declare-fun e!257904 () Bool)

(assert (=> b!436945 (= e!257902 (and e!257904 mapRes!18840))))

(declare-fun condMapEmpty!18840 () Bool)

(declare-fun mapDefault!18840 () ValueCell!5396)

(assert (=> b!436945 (= condMapEmpty!18840 (= (arr!12840 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5396)) mapDefault!18840)))))

(declare-fun b!436946 () Bool)

(declare-fun res!257745 () Bool)

(assert (=> b!436946 (=> (not res!257745) (not e!257901))))

(assert (=> b!436946 (= res!257745 (or (= (select (arr!12839 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12839 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436947 () Bool)

(assert (=> b!436947 (= e!257904 tp_is_empty!11479)))

(declare-fun b!436948 () Bool)

(assert (=> b!436948 (= e!257907 e!257905)))

(declare-fun res!257748 () Bool)

(assert (=> b!436948 (=> (not res!257748) (not e!257905))))

(assert (=> b!436948 (= res!257748 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201340 () ListLongMap!6583)

(assert (=> b!436948 (= lt!201340 (getCurrentListMapNoExtraKeys!1506 lt!201341 lt!201337 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436948 (= lt!201337 (array!26782 (store (arr!12840 _values!549) i!563 (ValueCellFull!5396 v!412)) (size!13193 _values!549)))))

(declare-fun lt!201339 () ListLongMap!6583)

(assert (=> b!436948 (= lt!201339 (getCurrentListMapNoExtraKeys!1506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40046 res!257744) b!436939))

(assert (= (and b!436939 res!257743) b!436933))

(assert (= (and b!436933 res!257749) b!436938))

(assert (= (and b!436938 res!257741) b!436936))

(assert (= (and b!436936 res!257750) b!436942))

(assert (= (and b!436942 res!257746) b!436940))

(assert (= (and b!436940 res!257740) b!436946))

(assert (= (and b!436946 res!257745) b!436934))

(assert (= (and b!436934 res!257747) b!436941))

(assert (= (and b!436941 res!257739) b!436944))

(assert (= (and b!436944 res!257751) b!436937))

(assert (= (and b!436937 res!257742) b!436948))

(assert (= (and b!436948 res!257748) b!436943))

(assert (= (and b!436945 condMapEmpty!18840) mapIsEmpty!18840))

(assert (= (and b!436945 (not condMapEmpty!18840)) mapNonEmpty!18840))

(get-info :version)

(assert (= (and mapNonEmpty!18840 ((_ is ValueCellFull!5396) mapValue!18840)) b!436935))

(assert (= (and b!436945 ((_ is ValueCellFull!5396) mapDefault!18840)) b!436947))

(assert (= start!40046 b!436945))

(declare-fun m!424191 () Bool)

(assert (=> mapNonEmpty!18840 m!424191))

(declare-fun m!424193 () Bool)

(assert (=> start!40046 m!424193))

(declare-fun m!424195 () Bool)

(assert (=> start!40046 m!424195))

(declare-fun m!424197 () Bool)

(assert (=> b!436944 m!424197))

(declare-fun m!424199 () Bool)

(assert (=> b!436938 m!424199))

(declare-fun m!424201 () Bool)

(assert (=> b!436936 m!424201))

(declare-fun m!424203 () Bool)

(assert (=> b!436946 m!424203))

(declare-fun m!424205 () Bool)

(assert (=> b!436940 m!424205))

(declare-fun m!424207 () Bool)

(assert (=> b!436939 m!424207))

(declare-fun m!424209 () Bool)

(assert (=> b!436934 m!424209))

(declare-fun m!424211 () Bool)

(assert (=> b!436948 m!424211))

(declare-fun m!424213 () Bool)

(assert (=> b!436948 m!424213))

(declare-fun m!424215 () Bool)

(assert (=> b!436948 m!424215))

(declare-fun m!424217 () Bool)

(assert (=> b!436943 m!424217))

(declare-fun m!424219 () Bool)

(assert (=> b!436943 m!424219))

(assert (=> b!436943 m!424219))

(declare-fun m!424221 () Bool)

(assert (=> b!436943 m!424221))

(declare-fun m!424223 () Bool)

(assert (=> b!436943 m!424223))

(declare-fun m!424225 () Bool)

(assert (=> b!436941 m!424225))

(declare-fun m!424227 () Bool)

(assert (=> b!436941 m!424227))

(check-sat (not b!436938) (not b!436940) (not start!40046) (not b!436936) (not b!436944) (not b!436948) (not b_next!10327) (not b!436934) (not mapNonEmpty!18840) (not b!436943) tp_is_empty!11479 (not b!436941) b_and!18269 (not b!436939))
(check-sat b_and!18269 (not b_next!10327))
