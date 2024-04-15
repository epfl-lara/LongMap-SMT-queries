; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39698 () Bool)

(assert start!39698)

(declare-fun b_free!9979 () Bool)

(declare-fun b_next!9979 () Bool)

(assert (=> start!39698 (= b_free!9979 (not b_next!9979))))

(declare-fun tp!35465 () Bool)

(declare-fun b_and!17609 () Bool)

(assert (=> start!39698 (= tp!35465 b_and!17609)))

(declare-fun b!426640 () Bool)

(declare-fun e!253034 () Bool)

(declare-fun e!253032 () Bool)

(assert (=> b!426640 (= e!253034 e!253032)))

(declare-fun res!250157 () Bool)

(assert (=> b!426640 (=> (not res!250157) (not e!253032))))

(declare-datatypes ((array!26091 0))(
  ( (array!26092 (arr!12495 (Array (_ BitVec 32) (_ BitVec 64))) (size!12848 (_ BitVec 32))) )
))
(declare-fun lt!194875 () array!26091)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26091 (_ BitVec 32)) Bool)

(assert (=> b!426640 (= res!250157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194875 mask!1025))))

(declare-fun _keys!709 () array!26091)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426640 (= lt!194875 (array!26092 (store (arr!12495 _keys!709) i!563 k0!794) (size!12848 _keys!709)))))

(declare-fun b!426641 () Bool)

(declare-fun e!253038 () Bool)

(assert (=> b!426641 (= e!253032 e!253038)))

(declare-fun res!250163 () Bool)

(assert (=> b!426641 (=> (not res!250163) (not e!253038))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426641 (= res!250163 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15947 0))(
  ( (V!15948 (val!5610 Int)) )
))
(declare-datatypes ((tuple2!7370 0))(
  ( (tuple2!7371 (_1!3696 (_ BitVec 64)) (_2!3696 V!15947)) )
))
(declare-datatypes ((List!7373 0))(
  ( (Nil!7370) (Cons!7369 (h!8225 tuple2!7370) (t!12808 List!7373)) )
))
(declare-datatypes ((ListLongMap!6273 0))(
  ( (ListLongMap!6274 (toList!3152 List!7373)) )
))
(declare-fun lt!194876 () ListLongMap!6273)

(declare-fun minValue!515 () V!15947)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15947)

(declare-datatypes ((ValueCell!5222 0))(
  ( (ValueCellFull!5222 (v!7851 V!15947)) (EmptyCell!5222) )
))
(declare-datatypes ((array!26093 0))(
  ( (array!26094 (arr!12496 (Array (_ BitVec 32) ValueCell!5222)) (size!12849 (_ BitVec 32))) )
))
(declare-fun lt!194878 () array!26093)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1360 (array!26091 array!26093 (_ BitVec 32) (_ BitVec 32) V!15947 V!15947 (_ BitVec 32) Int) ListLongMap!6273)

(assert (=> b!426641 (= lt!194876 (getCurrentListMapNoExtraKeys!1360 lt!194875 lt!194878 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26093)

(declare-fun v!412 () V!15947)

(assert (=> b!426641 (= lt!194878 (array!26094 (store (arr!12496 _values!549) i!563 (ValueCellFull!5222 v!412)) (size!12849 _values!549)))))

(declare-fun lt!194877 () ListLongMap!6273)

(assert (=> b!426641 (= lt!194877 (getCurrentListMapNoExtraKeys!1360 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426642 () Bool)

(declare-fun res!250154 () Bool)

(assert (=> b!426642 (=> (not res!250154) (not e!253034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426642 (= res!250154 (validMask!0 mask!1025))))

(declare-fun b!426643 () Bool)

(declare-fun res!250161 () Bool)

(assert (=> b!426643 (=> (not res!250161) (not e!253034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426643 (= res!250161 (validKeyInArray!0 k0!794))))

(declare-fun b!426645 () Bool)

(declare-fun res!250160 () Bool)

(assert (=> b!426645 (=> (not res!250160) (not e!253034))))

(declare-datatypes ((List!7374 0))(
  ( (Nil!7371) (Cons!7370 (h!8226 (_ BitVec 64)) (t!12809 List!7374)) )
))
(declare-fun arrayNoDuplicates!0 (array!26091 (_ BitVec 32) List!7374) Bool)

(assert (=> b!426645 (= res!250160 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7371))))

(declare-fun b!426646 () Bool)

(declare-fun res!250152 () Bool)

(assert (=> b!426646 (=> (not res!250152) (not e!253034))))

(declare-fun arrayContainsKey!0 (array!26091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426646 (= res!250152 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18318 () Bool)

(declare-fun mapRes!18318 () Bool)

(assert (=> mapIsEmpty!18318 mapRes!18318))

(declare-fun b!426647 () Bool)

(declare-fun res!250164 () Bool)

(assert (=> b!426647 (=> (not res!250164) (not e!253032))))

(assert (=> b!426647 (= res!250164 (arrayNoDuplicates!0 lt!194875 #b00000000000000000000000000000000 Nil!7371))))

(declare-fun b!426648 () Bool)

(declare-fun res!250153 () Bool)

(assert (=> b!426648 (=> (not res!250153) (not e!253034))))

(assert (=> b!426648 (= res!250153 (or (= (select (arr!12495 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12495 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426649 () Bool)

(declare-fun res!250155 () Bool)

(assert (=> b!426649 (=> (not res!250155) (not e!253034))))

(assert (=> b!426649 (= res!250155 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12848 _keys!709))))))

(declare-fun b!426650 () Bool)

(declare-fun res!250156 () Bool)

(assert (=> b!426650 (=> (not res!250156) (not e!253034))))

(assert (=> b!426650 (= res!250156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426651 () Bool)

(declare-fun res!250162 () Bool)

(assert (=> b!426651 (=> (not res!250162) (not e!253034))))

(assert (=> b!426651 (= res!250162 (and (= (size!12849 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12848 _keys!709) (size!12849 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!250159 () Bool)

(assert (=> start!39698 (=> (not res!250159) (not e!253034))))

(assert (=> start!39698 (= res!250159 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12848 _keys!709))))))

(assert (=> start!39698 e!253034))

(declare-fun tp_is_empty!11131 () Bool)

(assert (=> start!39698 tp_is_empty!11131))

(assert (=> start!39698 tp!35465))

(assert (=> start!39698 true))

(declare-fun e!253035 () Bool)

(declare-fun array_inv!9134 (array!26093) Bool)

(assert (=> start!39698 (and (array_inv!9134 _values!549) e!253035)))

(declare-fun array_inv!9135 (array!26091) Bool)

(assert (=> start!39698 (array_inv!9135 _keys!709)))

(declare-fun b!426644 () Bool)

(declare-fun e!253037 () Bool)

(assert (=> b!426644 (= e!253037 tp_is_empty!11131)))

(declare-fun b!426652 () Bool)

(assert (=> b!426652 (= e!253035 (and e!253037 mapRes!18318))))

(declare-fun condMapEmpty!18318 () Bool)

(declare-fun mapDefault!18318 () ValueCell!5222)

(assert (=> b!426652 (= condMapEmpty!18318 (= (arr!12496 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5222)) mapDefault!18318)))))

(declare-fun b!426653 () Bool)

(declare-fun res!250158 () Bool)

(assert (=> b!426653 (=> (not res!250158) (not e!253032))))

(assert (=> b!426653 (= res!250158 (bvsle from!863 i!563))))

(declare-fun b!426654 () Bool)

(assert (=> b!426654 (= e!253038 (not true))))

(declare-fun +!1331 (ListLongMap!6273 tuple2!7370) ListLongMap!6273)

(assert (=> b!426654 (= (getCurrentListMapNoExtraKeys!1360 lt!194875 lt!194878 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1331 (getCurrentListMapNoExtraKeys!1360 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7371 k0!794 v!412)))))

(declare-datatypes ((Unit!12508 0))(
  ( (Unit!12509) )
))
(declare-fun lt!194879 () Unit!12508)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!502 (array!26091 array!26093 (_ BitVec 32) (_ BitVec 32) V!15947 V!15947 (_ BitVec 32) (_ BitVec 64) V!15947 (_ BitVec 32) Int) Unit!12508)

(assert (=> b!426654 (= lt!194879 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!502 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426655 () Bool)

(declare-fun e!253033 () Bool)

(assert (=> b!426655 (= e!253033 tp_is_empty!11131)))

(declare-fun mapNonEmpty!18318 () Bool)

(declare-fun tp!35466 () Bool)

(assert (=> mapNonEmpty!18318 (= mapRes!18318 (and tp!35466 e!253033))))

(declare-fun mapRest!18318 () (Array (_ BitVec 32) ValueCell!5222))

(declare-fun mapKey!18318 () (_ BitVec 32))

(declare-fun mapValue!18318 () ValueCell!5222)

(assert (=> mapNonEmpty!18318 (= (arr!12496 _values!549) (store mapRest!18318 mapKey!18318 mapValue!18318))))

(assert (= (and start!39698 res!250159) b!426642))

(assert (= (and b!426642 res!250154) b!426651))

(assert (= (and b!426651 res!250162) b!426650))

(assert (= (and b!426650 res!250156) b!426645))

(assert (= (and b!426645 res!250160) b!426649))

(assert (= (and b!426649 res!250155) b!426643))

(assert (= (and b!426643 res!250161) b!426648))

(assert (= (and b!426648 res!250153) b!426646))

(assert (= (and b!426646 res!250152) b!426640))

(assert (= (and b!426640 res!250157) b!426647))

(assert (= (and b!426647 res!250164) b!426653))

(assert (= (and b!426653 res!250158) b!426641))

(assert (= (and b!426641 res!250163) b!426654))

(assert (= (and b!426652 condMapEmpty!18318) mapIsEmpty!18318))

(assert (= (and b!426652 (not condMapEmpty!18318)) mapNonEmpty!18318))

(get-info :version)

(assert (= (and mapNonEmpty!18318 ((_ is ValueCellFull!5222) mapValue!18318)) b!426655))

(assert (= (and b!426652 ((_ is ValueCellFull!5222) mapDefault!18318)) b!426644))

(assert (= start!39698 b!426652))

(declare-fun m!414771 () Bool)

(assert (=> b!426645 m!414771))

(declare-fun m!414773 () Bool)

(assert (=> b!426646 m!414773))

(declare-fun m!414775 () Bool)

(assert (=> mapNonEmpty!18318 m!414775))

(declare-fun m!414777 () Bool)

(assert (=> b!426641 m!414777))

(declare-fun m!414779 () Bool)

(assert (=> b!426641 m!414779))

(declare-fun m!414781 () Bool)

(assert (=> b!426641 m!414781))

(declare-fun m!414783 () Bool)

(assert (=> b!426650 m!414783))

(declare-fun m!414785 () Bool)

(assert (=> b!426654 m!414785))

(declare-fun m!414787 () Bool)

(assert (=> b!426654 m!414787))

(assert (=> b!426654 m!414787))

(declare-fun m!414789 () Bool)

(assert (=> b!426654 m!414789))

(declare-fun m!414791 () Bool)

(assert (=> b!426654 m!414791))

(declare-fun m!414793 () Bool)

(assert (=> b!426648 m!414793))

(declare-fun m!414795 () Bool)

(assert (=> b!426642 m!414795))

(declare-fun m!414797 () Bool)

(assert (=> b!426643 m!414797))

(declare-fun m!414799 () Bool)

(assert (=> b!426640 m!414799))

(declare-fun m!414801 () Bool)

(assert (=> b!426640 m!414801))

(declare-fun m!414803 () Bool)

(assert (=> b!426647 m!414803))

(declare-fun m!414805 () Bool)

(assert (=> start!39698 m!414805))

(declare-fun m!414807 () Bool)

(assert (=> start!39698 m!414807))

(check-sat (not b!426640) (not start!39698) b_and!17609 (not b!426650) (not b!426646) (not b!426641) (not mapNonEmpty!18318) (not b!426643) (not b_next!9979) (not b!426647) (not b!426642) tp_is_empty!11131 (not b!426654) (not b!426645))
(check-sat b_and!17609 (not b_next!9979))
