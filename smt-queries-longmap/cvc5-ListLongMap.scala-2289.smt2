; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37196 () Bool)

(assert start!37196)

(declare-fun b_free!8323 () Bool)

(declare-fun b_next!8323 () Bool)

(assert (=> start!37196 (= b_free!8323 (not b_next!8323))))

(declare-fun tp!29685 () Bool)

(declare-fun b_and!15565 () Bool)

(assert (=> start!37196 (= tp!29685 b_and!15565)))

(declare-fun mapIsEmpty!15021 () Bool)

(declare-fun mapRes!15021 () Bool)

(assert (=> mapIsEmpty!15021 mapRes!15021))

(declare-fun b!375704 () Bool)

(declare-fun e!228871 () Bool)

(declare-fun e!228876 () Bool)

(assert (=> b!375704 (= e!228871 e!228876)))

(declare-fun res!212159 () Bool)

(assert (=> b!375704 (=> (not res!212159) (not e!228876))))

(declare-datatypes ((array!21877 0))(
  ( (array!21878 (arr!10407 (Array (_ BitVec 32) (_ BitVec 64))) (size!10759 (_ BitVec 32))) )
))
(declare-fun lt!174032 () array!21877)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21877 (_ BitVec 32)) Bool)

(assert (=> b!375704 (= res!212159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174032 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21877)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375704 (= lt!174032 (array!21878 (store (arr!10407 _keys!658) i!548 k!778) (size!10759 _keys!658)))))

(declare-fun b!375705 () Bool)

(declare-fun res!212167 () Bool)

(assert (=> b!375705 (=> (not res!212167) (not e!228871))))

(assert (=> b!375705 (= res!212167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375706 () Bool)

(declare-fun res!212168 () Bool)

(declare-fun e!228872 () Bool)

(assert (=> b!375706 (=> (not res!212168) (not e!228872))))

(declare-datatypes ((V!13067 0))(
  ( (V!13068 (val!4530 Int)) )
))
(declare-datatypes ((tuple2!6030 0))(
  ( (tuple2!6031 (_1!3026 (_ BitVec 64)) (_2!3026 V!13067)) )
))
(declare-fun lt!174029 () tuple2!6030)

(declare-datatypes ((List!5872 0))(
  ( (Nil!5869) (Cons!5868 (h!6724 tuple2!6030) (t!11022 List!5872)) )
))
(declare-datatypes ((ListLongMap!4943 0))(
  ( (ListLongMap!4944 (toList!2487 List!5872)) )
))
(declare-fun lt!174033 () ListLongMap!4943)

(declare-fun lt!174027 () ListLongMap!4943)

(declare-fun +!833 (ListLongMap!4943 tuple2!6030) ListLongMap!4943)

(assert (=> b!375706 (= res!212168 (= lt!174027 (+!833 lt!174033 lt!174029)))))

(declare-fun b!375707 () Bool)

(declare-fun res!212164 () Bool)

(assert (=> b!375707 (=> (not res!212164) (not e!228871))))

(assert (=> b!375707 (= res!212164 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10759 _keys!658))))))

(declare-fun b!375708 () Bool)

(declare-fun res!212158 () Bool)

(assert (=> b!375708 (=> (not res!212158) (not e!228871))))

(assert (=> b!375708 (= res!212158 (or (= (select (arr!10407 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10407 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375709 () Bool)

(declare-fun res!212166 () Bool)

(assert (=> b!375709 (=> (not res!212166) (not e!228876))))

(declare-datatypes ((List!5873 0))(
  ( (Nil!5870) (Cons!5869 (h!6725 (_ BitVec 64)) (t!11023 List!5873)) )
))
(declare-fun arrayNoDuplicates!0 (array!21877 (_ BitVec 32) List!5873) Bool)

(assert (=> b!375709 (= res!212166 (arrayNoDuplicates!0 lt!174032 #b00000000000000000000000000000000 Nil!5870))))

(declare-fun mapNonEmpty!15021 () Bool)

(declare-fun tp!29684 () Bool)

(declare-fun e!228874 () Bool)

(assert (=> mapNonEmpty!15021 (= mapRes!15021 (and tp!29684 e!228874))))

(declare-datatypes ((ValueCell!4142 0))(
  ( (ValueCellFull!4142 (v!6727 V!13067)) (EmptyCell!4142) )
))
(declare-datatypes ((array!21879 0))(
  ( (array!21880 (arr!10408 (Array (_ BitVec 32) ValueCell!4142)) (size!10760 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21879)

(declare-fun mapValue!15021 () ValueCell!4142)

(declare-fun mapKey!15021 () (_ BitVec 32))

(declare-fun mapRest!15021 () (Array (_ BitVec 32) ValueCell!4142))

(assert (=> mapNonEmpty!15021 (= (arr!10408 _values!506) (store mapRest!15021 mapKey!15021 mapValue!15021))))

(declare-fun b!375710 () Bool)

(declare-fun e!228878 () Bool)

(declare-fun tp_is_empty!8971 () Bool)

(assert (=> b!375710 (= e!228878 tp_is_empty!8971)))

(declare-fun b!375712 () Bool)

(declare-fun res!212161 () Bool)

(assert (=> b!375712 (=> (not res!212161) (not e!228871))))

(assert (=> b!375712 (= res!212161 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5870))))

(declare-fun lt!174031 () ListLongMap!4943)

(declare-fun lt!174030 () ListLongMap!4943)

(declare-fun b!375713 () Bool)

(assert (=> b!375713 (= e!228872 (= lt!174031 (+!833 lt!174030 lt!174029)))))

(declare-fun b!375714 () Bool)

(declare-fun e!228875 () Bool)

(assert (=> b!375714 (= e!228876 (not e!228875))))

(declare-fun res!212157 () Bool)

(assert (=> b!375714 (=> res!212157 e!228875)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375714 (= res!212157 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13067)

(declare-fun minValue!472 () V!13067)

(declare-fun getCurrentListMap!1922 (array!21877 array!21879 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) Int) ListLongMap!4943)

(assert (=> b!375714 (= lt!174027 (getCurrentListMap!1922 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174025 () array!21879)

(assert (=> b!375714 (= lt!174031 (getCurrentListMap!1922 lt!174032 lt!174025 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174028 () ListLongMap!4943)

(assert (=> b!375714 (and (= lt!174028 lt!174030) (= lt!174030 lt!174028))))

(declare-fun v!373 () V!13067)

(assert (=> b!375714 (= lt!174030 (+!833 lt!174033 (tuple2!6031 k!778 v!373)))))

(declare-datatypes ((Unit!11572 0))(
  ( (Unit!11573) )
))
(declare-fun lt!174026 () Unit!11572)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!80 (array!21877 array!21879 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) (_ BitVec 64) V!13067 (_ BitVec 32) Int) Unit!11572)

(assert (=> b!375714 (= lt!174026 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!80 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!756 (array!21877 array!21879 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) Int) ListLongMap!4943)

(assert (=> b!375714 (= lt!174028 (getCurrentListMapNoExtraKeys!756 lt!174032 lt!174025 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375714 (= lt!174025 (array!21880 (store (arr!10408 _values!506) i!548 (ValueCellFull!4142 v!373)) (size!10760 _values!506)))))

(assert (=> b!375714 (= lt!174033 (getCurrentListMapNoExtraKeys!756 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375715 () Bool)

(assert (=> b!375715 (= e!228874 tp_is_empty!8971)))

(declare-fun b!375716 () Bool)

(declare-fun res!212160 () Bool)

(assert (=> b!375716 (=> (not res!212160) (not e!228871))))

(assert (=> b!375716 (= res!212160 (and (= (size!10760 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10759 _keys!658) (size!10760 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375717 () Bool)

(declare-fun res!212156 () Bool)

(assert (=> b!375717 (=> (not res!212156) (not e!228871))))

(declare-fun arrayContainsKey!0 (array!21877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375717 (= res!212156 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!375718 () Bool)

(declare-fun res!212165 () Bool)

(assert (=> b!375718 (=> (not res!212165) (not e!228871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375718 (= res!212165 (validKeyInArray!0 k!778))))

(declare-fun b!375719 () Bool)

(assert (=> b!375719 (= e!228875 true)))

(assert (=> b!375719 e!228872))

(declare-fun res!212162 () Bool)

(assert (=> b!375719 (=> (not res!212162) (not e!228872))))

(assert (=> b!375719 (= res!212162 (= lt!174031 (+!833 lt!174028 lt!174029)))))

(assert (=> b!375719 (= lt!174029 (tuple2!6031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375711 () Bool)

(declare-fun e!228873 () Bool)

(assert (=> b!375711 (= e!228873 (and e!228878 mapRes!15021))))

(declare-fun condMapEmpty!15021 () Bool)

(declare-fun mapDefault!15021 () ValueCell!4142)

