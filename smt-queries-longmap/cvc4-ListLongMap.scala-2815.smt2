; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40804 () Bool)

(assert start!40804)

(declare-fun b_free!10793 () Bool)

(declare-fun b_next!10793 () Bool)

(assert (=> start!40804 (= b_free!10793 (not b_next!10793))))

(declare-fun tp!38201 () Bool)

(declare-fun b_and!18873 () Bool)

(assert (=> start!40804 (= tp!38201 b_and!18873)))

(declare-fun b!452766 () Bool)

(declare-fun res!269720 () Bool)

(declare-fun e!265064 () Bool)

(assert (=> b!452766 (=> (not res!269720) (not e!265064))))

(declare-datatypes ((array!28069 0))(
  ( (array!28070 (arr!13479 (Array (_ BitVec 32) (_ BitVec 64))) (size!13831 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28069)

(declare-datatypes ((List!8103 0))(
  ( (Nil!8100) (Cons!8099 (h!8955 (_ BitVec 64)) (t!13919 List!8103)) )
))
(declare-fun arrayNoDuplicates!0 (array!28069 (_ BitVec 32) List!8103) Bool)

(assert (=> b!452766 (= res!269720 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8100))))

(declare-fun b!452767 () Bool)

(declare-fun e!265067 () Bool)

(assert (=> b!452767 (= e!265067 true)))

(declare-datatypes ((V!17279 0))(
  ( (V!17280 (val!6110 Int)) )
))
(declare-datatypes ((tuple2!8046 0))(
  ( (tuple2!8047 (_1!4034 (_ BitVec 64)) (_2!4034 V!17279)) )
))
(declare-fun lt!205426 () tuple2!8046)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((List!8104 0))(
  ( (Nil!8101) (Cons!8100 (h!8956 tuple2!8046) (t!13920 List!8104)) )
))
(declare-datatypes ((ListLongMap!6959 0))(
  ( (ListLongMap!6960 (toList!3495 List!8104)) )
))
(declare-fun lt!205423 () ListLongMap!6959)

(declare-fun lt!205425 () V!17279)

(declare-fun +!1571 (ListLongMap!6959 tuple2!8046) ListLongMap!6959)

(assert (=> b!452767 (= (+!1571 lt!205423 lt!205426) (+!1571 (+!1571 lt!205423 (tuple2!8047 k!794 lt!205425)) lt!205426))))

(declare-fun lt!205422 () V!17279)

(assert (=> b!452767 (= lt!205426 (tuple2!8047 k!794 lt!205422))))

(declare-datatypes ((Unit!13238 0))(
  ( (Unit!13239) )
))
(declare-fun lt!205424 () Unit!13238)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!83 (ListLongMap!6959 (_ BitVec 64) V!17279 V!17279) Unit!13238)

(assert (=> b!452767 (= lt!205424 (addSameAsAddTwiceSameKeyDiffValues!83 lt!205423 k!794 lt!205425 lt!205422))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5722 0))(
  ( (ValueCellFull!5722 (v!8369 V!17279)) (EmptyCell!5722) )
))
(declare-datatypes ((array!28071 0))(
  ( (array!28072 (arr!13480 (Array (_ BitVec 32) ValueCell!5722)) (size!13832 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28071)

(declare-fun lt!205429 () V!17279)

(declare-fun get!6645 (ValueCell!5722 V!17279) V!17279)

(assert (=> b!452767 (= lt!205425 (get!6645 (select (arr!13480 _values!549) from!863) lt!205429))))

(declare-fun lt!205428 () ListLongMap!6959)

(declare-fun lt!205420 () array!28069)

(assert (=> b!452767 (= lt!205428 (+!1571 lt!205423 (tuple2!8047 (select (arr!13479 lt!205420) from!863) lt!205422)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17279)

(assert (=> b!452767 (= lt!205422 (get!6645 (select (store (arr!13480 _values!549) i!563 (ValueCellFull!5722 v!412)) from!863) lt!205429))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!870 (Int (_ BitVec 64)) V!17279)

(assert (=> b!452767 (= lt!205429 (dynLambda!870 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!17279)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!205427 () array!28071)

(declare-fun zeroValue!515 () V!17279)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1678 (array!28069 array!28071 (_ BitVec 32) (_ BitVec 32) V!17279 V!17279 (_ BitVec 32) Int) ListLongMap!6959)

(assert (=> b!452767 (= lt!205423 (getCurrentListMapNoExtraKeys!1678 lt!205420 lt!205427 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452768 () Bool)

(declare-fun res!269716 () Bool)

(assert (=> b!452768 (=> (not res!269716) (not e!265064))))

(assert (=> b!452768 (= res!269716 (and (= (size!13832 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13831 _keys!709) (size!13832 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452769 () Bool)

(declare-fun call!29993 () ListLongMap!6959)

(declare-fun e!265061 () Bool)

(declare-fun call!29992 () ListLongMap!6959)

(assert (=> b!452769 (= e!265061 (= call!29992 (+!1571 call!29993 (tuple2!8047 k!794 v!412))))))

(declare-fun bm!29989 () Bool)

(declare-fun c!56138 () Bool)

(assert (=> bm!29989 (= call!29992 (getCurrentListMapNoExtraKeys!1678 (ite c!56138 lt!205420 _keys!709) (ite c!56138 lt!205427 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19833 () Bool)

(declare-fun mapRes!19833 () Bool)

(declare-fun tp!38202 () Bool)

(declare-fun e!265066 () Bool)

(assert (=> mapNonEmpty!19833 (= mapRes!19833 (and tp!38202 e!265066))))

(declare-fun mapKey!19833 () (_ BitVec 32))

(declare-fun mapValue!19833 () ValueCell!5722)

(declare-fun mapRest!19833 () (Array (_ BitVec 32) ValueCell!5722))

(assert (=> mapNonEmpty!19833 (= (arr!13480 _values!549) (store mapRest!19833 mapKey!19833 mapValue!19833))))

(declare-fun b!452770 () Bool)

(declare-fun e!265060 () Bool)

(declare-fun tp_is_empty!12131 () Bool)

(assert (=> b!452770 (= e!265060 tp_is_empty!12131)))

(declare-fun b!452771 () Bool)

(declare-fun e!265062 () Bool)

(assert (=> b!452771 (= e!265062 (not e!265067))))

(declare-fun res!269719 () Bool)

(assert (=> b!452771 (=> res!269719 e!265067)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452771 (= res!269719 (validKeyInArray!0 (select (arr!13479 _keys!709) from!863)))))

(assert (=> b!452771 e!265061))

(assert (=> b!452771 (= c!56138 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205430 () Unit!13238)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!733 (array!28069 array!28071 (_ BitVec 32) (_ BitVec 32) V!17279 V!17279 (_ BitVec 32) (_ BitVec 64) V!17279 (_ BitVec 32) Int) Unit!13238)

(assert (=> b!452771 (= lt!205430 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!733 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452772 () Bool)

(declare-fun e!265063 () Bool)

(assert (=> b!452772 (= e!265064 e!265063)))

(declare-fun res!269725 () Bool)

(assert (=> b!452772 (=> (not res!269725) (not e!265063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28069 (_ BitVec 32)) Bool)

(assert (=> b!452772 (= res!269725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205420 mask!1025))))

(assert (=> b!452772 (= lt!205420 (array!28070 (store (arr!13479 _keys!709) i!563 k!794) (size!13831 _keys!709)))))

(declare-fun b!452773 () Bool)

(assert (=> b!452773 (= e!265066 tp_is_empty!12131)))

(declare-fun b!452774 () Bool)

(declare-fun res!269728 () Bool)

(assert (=> b!452774 (=> (not res!269728) (not e!265064))))

(assert (=> b!452774 (= res!269728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452775 () Bool)

(declare-fun res!269723 () Bool)

(assert (=> b!452775 (=> (not res!269723) (not e!265064))))

(assert (=> b!452775 (= res!269723 (or (= (select (arr!13479 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13479 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452776 () Bool)

(declare-fun res!269718 () Bool)

(assert (=> b!452776 (=> (not res!269718) (not e!265063))))

(assert (=> b!452776 (= res!269718 (bvsle from!863 i!563))))

(declare-fun res!269722 () Bool)

(assert (=> start!40804 (=> (not res!269722) (not e!265064))))

(assert (=> start!40804 (= res!269722 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13831 _keys!709))))))

(assert (=> start!40804 e!265064))

(assert (=> start!40804 tp_is_empty!12131))

(assert (=> start!40804 tp!38201))

(assert (=> start!40804 true))

(declare-fun e!265065 () Bool)

(declare-fun array_inv!9762 (array!28071) Bool)

(assert (=> start!40804 (and (array_inv!9762 _values!549) e!265065)))

(declare-fun array_inv!9763 (array!28069) Bool)

(assert (=> start!40804 (array_inv!9763 _keys!709)))

(declare-fun b!452777 () Bool)

(assert (=> b!452777 (= e!265063 e!265062)))

(declare-fun res!269717 () Bool)

(assert (=> b!452777 (=> (not res!269717) (not e!265062))))

(assert (=> b!452777 (= res!269717 (= from!863 i!563))))

(assert (=> b!452777 (= lt!205428 (getCurrentListMapNoExtraKeys!1678 lt!205420 lt!205427 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452777 (= lt!205427 (array!28072 (store (arr!13480 _values!549) i!563 (ValueCellFull!5722 v!412)) (size!13832 _values!549)))))

(declare-fun lt!205421 () ListLongMap!6959)

(assert (=> b!452777 (= lt!205421 (getCurrentListMapNoExtraKeys!1678 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452778 () Bool)

(declare-fun res!269724 () Bool)

(assert (=> b!452778 (=> (not res!269724) (not e!265064))))

(declare-fun arrayContainsKey!0 (array!28069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452778 (= res!269724 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!452779 () Bool)

(declare-fun res!269727 () Bool)

(assert (=> b!452779 (=> (not res!269727) (not e!265064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452779 (= res!269727 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19833 () Bool)

(assert (=> mapIsEmpty!19833 mapRes!19833))

(declare-fun b!452780 () Bool)

(declare-fun res!269721 () Bool)

(assert (=> b!452780 (=> (not res!269721) (not e!265063))))

(assert (=> b!452780 (= res!269721 (arrayNoDuplicates!0 lt!205420 #b00000000000000000000000000000000 Nil!8100))))

(declare-fun b!452781 () Bool)

(assert (=> b!452781 (= e!265061 (= call!29993 call!29992))))

(declare-fun bm!29990 () Bool)

(assert (=> bm!29990 (= call!29993 (getCurrentListMapNoExtraKeys!1678 (ite c!56138 _keys!709 lt!205420) (ite c!56138 _values!549 lt!205427) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452782 () Bool)

(declare-fun res!269729 () Bool)

(assert (=> b!452782 (=> (not res!269729) (not e!265064))))

(assert (=> b!452782 (= res!269729 (validKeyInArray!0 k!794))))

(declare-fun b!452783 () Bool)

(declare-fun res!269726 () Bool)

(assert (=> b!452783 (=> (not res!269726) (not e!265064))))

(assert (=> b!452783 (= res!269726 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13831 _keys!709))))))

(declare-fun b!452784 () Bool)

(assert (=> b!452784 (= e!265065 (and e!265060 mapRes!19833))))

(declare-fun condMapEmpty!19833 () Bool)

(declare-fun mapDefault!19833 () ValueCell!5722)

