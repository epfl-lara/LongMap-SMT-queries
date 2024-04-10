; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39198 () Bool)

(assert start!39198)

(declare-fun b_free!9465 () Bool)

(declare-fun b_next!9465 () Bool)

(assert (=> start!39198 (= b_free!9465 (not b_next!9465))))

(declare-fun tp!33924 () Bool)

(declare-fun b_and!16851 () Bool)

(assert (=> start!39198 (= tp!33924 b_and!16851)))

(declare-fun b!413109 () Bool)

(declare-fun res!240008 () Bool)

(declare-fun e!247091 () Bool)

(assert (=> b!413109 (=> (not res!240008) (not e!247091))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413109 (= res!240008 (bvsle from!863 i!563))))

(declare-fun b!413110 () Bool)

(declare-fun e!247090 () Bool)

(declare-fun tp_is_empty!10617 () Bool)

(assert (=> b!413110 (= e!247090 tp_is_empty!10617)))

(declare-fun b!413111 () Bool)

(declare-fun res!240015 () Bool)

(declare-fun e!247086 () Bool)

(assert (=> b!413111 (=> (not res!240015) (not e!247086))))

(declare-datatypes ((array!25091 0))(
  ( (array!25092 (arr!11995 (Array (_ BitVec 32) (_ BitVec 64))) (size!12347 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25091)

(assert (=> b!413111 (= res!240015 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12347 _keys!709))))))

(declare-datatypes ((V!15261 0))(
  ( (V!15262 (val!5353 Int)) )
))
(declare-fun minValue!515 () V!15261)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4965 0))(
  ( (ValueCellFull!4965 (v!7600 V!15261)) (EmptyCell!4965) )
))
(declare-datatypes ((array!25093 0))(
  ( (array!25094 (arr!11996 (Array (_ BitVec 32) ValueCell!4965)) (size!12348 (_ BitVec 32))) )
))
(declare-fun lt!189636 () array!25093)

(declare-fun _values!549 () array!25093)

(declare-fun zeroValue!515 () V!15261)

(declare-fun c!54911 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!189637 () array!25091)

(declare-datatypes ((tuple2!6950 0))(
  ( (tuple2!6951 (_1!3486 (_ BitVec 64)) (_2!3486 V!15261)) )
))
(declare-datatypes ((List!6975 0))(
  ( (Nil!6972) (Cons!6971 (h!7827 tuple2!6950) (t!12149 List!6975)) )
))
(declare-datatypes ((ListLongMap!5863 0))(
  ( (ListLongMap!5864 (toList!2947 List!6975)) )
))
(declare-fun call!28574 () ListLongMap!5863)

(declare-fun bm!28570 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1155 (array!25091 array!25093 (_ BitVec 32) (_ BitVec 32) V!15261 V!15261 (_ BitVec 32) Int) ListLongMap!5863)

(assert (=> bm!28570 (= call!28574 (getCurrentListMapNoExtraKeys!1155 (ite c!54911 lt!189637 _keys!709) (ite c!54911 lt!189636 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413113 () Bool)

(declare-fun e!247092 () Bool)

(assert (=> b!413113 (= e!247092 tp_is_empty!10617)))

(declare-fun b!413114 () Bool)

(declare-fun res!240013 () Bool)

(assert (=> b!413114 (=> (not res!240013) (not e!247086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413114 (= res!240013 (validMask!0 mask!1025))))

(declare-fun b!413115 () Bool)

(declare-fun res!240016 () Bool)

(assert (=> b!413115 (=> (not res!240016) (not e!247091))))

(declare-datatypes ((List!6976 0))(
  ( (Nil!6973) (Cons!6972 (h!7828 (_ BitVec 64)) (t!12150 List!6976)) )
))
(declare-fun arrayNoDuplicates!0 (array!25091 (_ BitVec 32) List!6976) Bool)

(assert (=> b!413115 (= res!240016 (arrayNoDuplicates!0 lt!189637 #b00000000000000000000000000000000 Nil!6973))))

(declare-fun b!413116 () Bool)

(assert (=> b!413116 (= e!247086 e!247091)))

(declare-fun res!240014 () Bool)

(assert (=> b!413116 (=> (not res!240014) (not e!247091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25091 (_ BitVec 32)) Bool)

(assert (=> b!413116 (= res!240014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189637 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!413116 (= lt!189637 (array!25092 (store (arr!11995 _keys!709) i!563 k0!794) (size!12347 _keys!709)))))

(declare-fun b!413117 () Bool)

(declare-fun res!240018 () Bool)

(assert (=> b!413117 (=> (not res!240018) (not e!247086))))

(assert (=> b!413117 (= res!240018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413118 () Bool)

(declare-fun res!240010 () Bool)

(assert (=> b!413118 (=> (not res!240010) (not e!247086))))

(assert (=> b!413118 (= res!240010 (or (= (select (arr!11995 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11995 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413119 () Bool)

(declare-fun e!247088 () Bool)

(declare-fun mapRes!17547 () Bool)

(assert (=> b!413119 (= e!247088 (and e!247092 mapRes!17547))))

(declare-fun condMapEmpty!17547 () Bool)

(declare-fun mapDefault!17547 () ValueCell!4965)

(assert (=> b!413119 (= condMapEmpty!17547 (= (arr!11996 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4965)) mapDefault!17547)))))

(declare-fun bm!28571 () Bool)

(declare-fun call!28573 () ListLongMap!5863)

(assert (=> bm!28571 (= call!28573 (getCurrentListMapNoExtraKeys!1155 (ite c!54911 _keys!709 lt!189637) (ite c!54911 _values!549 lt!189636) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413120 () Bool)

(declare-fun res!240012 () Bool)

(assert (=> b!413120 (=> (not res!240012) (not e!247086))))

(declare-fun arrayContainsKey!0 (array!25091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413120 (= res!240012 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413121 () Bool)

(declare-fun res!240009 () Bool)

(assert (=> b!413121 (=> (not res!240009) (not e!247086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413121 (= res!240009 (validKeyInArray!0 k0!794))))

(declare-fun res!240011 () Bool)

(assert (=> start!39198 (=> (not res!240011) (not e!247086))))

(assert (=> start!39198 (= res!240011 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12347 _keys!709))))))

(assert (=> start!39198 e!247086))

(assert (=> start!39198 tp_is_empty!10617))

(assert (=> start!39198 tp!33924))

(assert (=> start!39198 true))

(declare-fun array_inv!8748 (array!25093) Bool)

(assert (=> start!39198 (and (array_inv!8748 _values!549) e!247088)))

(declare-fun array_inv!8749 (array!25091) Bool)

(assert (=> start!39198 (array_inv!8749 _keys!709)))

(declare-fun b!413112 () Bool)

(declare-fun e!247085 () Bool)

(assert (=> b!413112 (= e!247085 (= call!28573 call!28574))))

(declare-fun b!413122 () Bool)

(declare-fun res!240007 () Bool)

(assert (=> b!413122 (=> (not res!240007) (not e!247086))))

(assert (=> b!413122 (= res!240007 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6973))))

(declare-fun b!413123 () Bool)

(declare-fun e!247087 () Bool)

(assert (=> b!413123 (= e!247091 e!247087)))

(declare-fun res!240017 () Bool)

(assert (=> b!413123 (=> (not res!240017) (not e!247087))))

(assert (=> b!413123 (= res!240017 (= from!863 i!563))))

(declare-fun lt!189638 () ListLongMap!5863)

(assert (=> b!413123 (= lt!189638 (getCurrentListMapNoExtraKeys!1155 lt!189637 lt!189636 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15261)

(assert (=> b!413123 (= lt!189636 (array!25094 (store (arr!11996 _values!549) i!563 (ValueCellFull!4965 v!412)) (size!12348 _values!549)))))

(declare-fun lt!189634 () ListLongMap!5863)

(assert (=> b!413123 (= lt!189634 (getCurrentListMapNoExtraKeys!1155 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413124 () Bool)

(declare-fun +!1160 (ListLongMap!5863 tuple2!6950) ListLongMap!5863)

(assert (=> b!413124 (= e!247085 (= call!28574 (+!1160 call!28573 (tuple2!6951 k0!794 v!412))))))

(declare-fun mapIsEmpty!17547 () Bool)

(assert (=> mapIsEmpty!17547 mapRes!17547))

(declare-fun mapNonEmpty!17547 () Bool)

(declare-fun tp!33923 () Bool)

(assert (=> mapNonEmpty!17547 (= mapRes!17547 (and tp!33923 e!247090))))

(declare-fun mapValue!17547 () ValueCell!4965)

(declare-fun mapRest!17547 () (Array (_ BitVec 32) ValueCell!4965))

(declare-fun mapKey!17547 () (_ BitVec 32))

(assert (=> mapNonEmpty!17547 (= (arr!11996 _values!549) (store mapRest!17547 mapKey!17547 mapValue!17547))))

(declare-fun b!413125 () Bool)

(assert (=> b!413125 (= e!247087 (not true))))

(assert (=> b!413125 e!247085))

(assert (=> b!413125 (= c!54911 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12224 0))(
  ( (Unit!12225) )
))
(declare-fun lt!189635 () Unit!12224)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!370 (array!25091 array!25093 (_ BitVec 32) (_ BitVec 32) V!15261 V!15261 (_ BitVec 32) (_ BitVec 64) V!15261 (_ BitVec 32) Int) Unit!12224)

(assert (=> b!413125 (= lt!189635 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!370 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413126 () Bool)

(declare-fun res!240006 () Bool)

(assert (=> b!413126 (=> (not res!240006) (not e!247086))))

(assert (=> b!413126 (= res!240006 (and (= (size!12348 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12347 _keys!709) (size!12348 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39198 res!240011) b!413114))

(assert (= (and b!413114 res!240013) b!413126))

(assert (= (and b!413126 res!240006) b!413117))

(assert (= (and b!413117 res!240018) b!413122))

(assert (= (and b!413122 res!240007) b!413111))

(assert (= (and b!413111 res!240015) b!413121))

(assert (= (and b!413121 res!240009) b!413118))

(assert (= (and b!413118 res!240010) b!413120))

(assert (= (and b!413120 res!240012) b!413116))

(assert (= (and b!413116 res!240014) b!413115))

(assert (= (and b!413115 res!240016) b!413109))

(assert (= (and b!413109 res!240008) b!413123))

(assert (= (and b!413123 res!240017) b!413125))

(assert (= (and b!413125 c!54911) b!413124))

(assert (= (and b!413125 (not c!54911)) b!413112))

(assert (= (or b!413124 b!413112) bm!28570))

(assert (= (or b!413124 b!413112) bm!28571))

(assert (= (and b!413119 condMapEmpty!17547) mapIsEmpty!17547))

(assert (= (and b!413119 (not condMapEmpty!17547)) mapNonEmpty!17547))

(get-info :version)

(assert (= (and mapNonEmpty!17547 ((_ is ValueCellFull!4965) mapValue!17547)) b!413110))

(assert (= (and b!413119 ((_ is ValueCellFull!4965) mapDefault!17547)) b!413113))

(assert (= start!39198 b!413119))

(declare-fun m!402705 () Bool)

(assert (=> bm!28570 m!402705))

(declare-fun m!402707 () Bool)

(assert (=> b!413117 m!402707))

(declare-fun m!402709 () Bool)

(assert (=> b!413116 m!402709))

(declare-fun m!402711 () Bool)

(assert (=> b!413116 m!402711))

(declare-fun m!402713 () Bool)

(assert (=> b!413125 m!402713))

(declare-fun m!402715 () Bool)

(assert (=> b!413121 m!402715))

(declare-fun m!402717 () Bool)

(assert (=> start!39198 m!402717))

(declare-fun m!402719 () Bool)

(assert (=> start!39198 m!402719))

(declare-fun m!402721 () Bool)

(assert (=> bm!28571 m!402721))

(declare-fun m!402723 () Bool)

(assert (=> b!413115 m!402723))

(declare-fun m!402725 () Bool)

(assert (=> b!413118 m!402725))

(declare-fun m!402727 () Bool)

(assert (=> b!413124 m!402727))

(declare-fun m!402729 () Bool)

(assert (=> mapNonEmpty!17547 m!402729))

(declare-fun m!402731 () Bool)

(assert (=> b!413114 m!402731))

(declare-fun m!402733 () Bool)

(assert (=> b!413122 m!402733))

(declare-fun m!402735 () Bool)

(assert (=> b!413123 m!402735))

(declare-fun m!402737 () Bool)

(assert (=> b!413123 m!402737))

(declare-fun m!402739 () Bool)

(assert (=> b!413123 m!402739))

(declare-fun m!402741 () Bool)

(assert (=> b!413120 m!402741))

(check-sat (not b!413122) (not b!413123) (not b!413125) (not mapNonEmpty!17547) (not start!39198) (not b!413114) tp_is_empty!10617 b_and!16851 (not b!413121) (not bm!28570) (not b!413117) (not b!413120) (not b!413124) (not b!413116) (not b!413115) (not b_next!9465) (not bm!28571))
(check-sat b_and!16851 (not b_next!9465))
