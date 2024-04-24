; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40954 () Bool)

(assert start!40954)

(declare-fun b_free!10903 () Bool)

(declare-fun b_next!10903 () Bool)

(assert (=> start!40954 (= b_free!10903 (not b_next!10903))))

(declare-fun tp!38536 () Bool)

(declare-fun b_and!19055 () Bool)

(assert (=> start!40954 (= tp!38536 b_and!19055)))

(declare-fun mapIsEmpty!20002 () Bool)

(declare-fun mapRes!20002 () Bool)

(assert (=> mapIsEmpty!20002 mapRes!20002))

(declare-fun b!455881 () Bool)

(declare-fun res!271961 () Bool)

(declare-fun e!266444 () Bool)

(assert (=> b!455881 (=> (not res!271961) (not e!266444))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455881 (= res!271961 (validKeyInArray!0 k0!794))))

(declare-fun res!271964 () Bool)

(assert (=> start!40954 (=> (not res!271964) (not e!266444))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28276 0))(
  ( (array!28277 (arr!13581 (Array (_ BitVec 32) (_ BitVec 64))) (size!13933 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28276)

(assert (=> start!40954 (= res!271964 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13933 _keys!709))))))

(assert (=> start!40954 e!266444))

(declare-fun tp_is_empty!12241 () Bool)

(assert (=> start!40954 tp_is_empty!12241))

(assert (=> start!40954 tp!38536))

(assert (=> start!40954 true))

(declare-datatypes ((V!17427 0))(
  ( (V!17428 (val!6165 Int)) )
))
(declare-datatypes ((ValueCell!5777 0))(
  ( (ValueCellFull!5777 (v!8432 V!17427)) (EmptyCell!5777) )
))
(declare-datatypes ((array!28278 0))(
  ( (array!28279 (arr!13582 (Array (_ BitVec 32) ValueCell!5777)) (size!13934 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28278)

(declare-fun e!266441 () Bool)

(declare-fun array_inv!9910 (array!28278) Bool)

(assert (=> start!40954 (and (array_inv!9910 _values!549) e!266441)))

(declare-fun array_inv!9911 (array!28276) Bool)

(assert (=> start!40954 (array_inv!9911 _keys!709)))

(declare-fun b!455882 () Bool)

(declare-fun res!271970 () Bool)

(assert (=> b!455882 (=> (not res!271970) (not e!266444))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455882 (= res!271970 (and (= (size!13934 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13933 _keys!709) (size!13934 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455883 () Bool)

(declare-fun res!271969 () Bool)

(declare-fun e!266442 () Bool)

(assert (=> b!455883 (=> (not res!271969) (not e!266442))))

(declare-fun lt!206450 () array!28276)

(declare-datatypes ((List!8104 0))(
  ( (Nil!8101) (Cons!8100 (h!8956 (_ BitVec 64)) (t!13924 List!8104)) )
))
(declare-fun arrayNoDuplicates!0 (array!28276 (_ BitVec 32) List!8104) Bool)

(assert (=> b!455883 (= res!271969 (arrayNoDuplicates!0 lt!206450 #b00000000000000000000000000000000 Nil!8101))))

(declare-fun mapNonEmpty!20002 () Bool)

(declare-fun tp!38535 () Bool)

(declare-fun e!266446 () Bool)

(assert (=> mapNonEmpty!20002 (= mapRes!20002 (and tp!38535 e!266446))))

(declare-fun mapRest!20002 () (Array (_ BitVec 32) ValueCell!5777))

(declare-fun mapKey!20002 () (_ BitVec 32))

(declare-fun mapValue!20002 () ValueCell!5777)

(assert (=> mapNonEmpty!20002 (= (arr!13582 _values!549) (store mapRest!20002 mapKey!20002 mapValue!20002))))

(declare-fun b!455884 () Bool)

(declare-fun res!271965 () Bool)

(assert (=> b!455884 (=> (not res!271965) (not e!266444))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455884 (= res!271965 (or (= (select (arr!13581 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13581 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455885 () Bool)

(declare-fun e!266445 () Bool)

(assert (=> b!455885 (= e!266441 (and e!266445 mapRes!20002))))

(declare-fun condMapEmpty!20002 () Bool)

(declare-fun mapDefault!20002 () ValueCell!5777)

(assert (=> b!455885 (= condMapEmpty!20002 (= (arr!13582 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5777)) mapDefault!20002)))))

(declare-fun b!455886 () Bool)

(assert (=> b!455886 (= e!266444 e!266442)))

(declare-fun res!271971 () Bool)

(assert (=> b!455886 (=> (not res!271971) (not e!266442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28276 (_ BitVec 32)) Bool)

(assert (=> b!455886 (= res!271971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206450 mask!1025))))

(assert (=> b!455886 (= lt!206450 (array!28277 (store (arr!13581 _keys!709) i!563 k0!794) (size!13933 _keys!709)))))

(declare-fun b!455887 () Bool)

(declare-fun res!271967 () Bool)

(assert (=> b!455887 (=> (not res!271967) (not e!266444))))

(assert (=> b!455887 (= res!271967 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8101))))

(declare-fun b!455888 () Bool)

(declare-fun res!271963 () Bool)

(assert (=> b!455888 (=> (not res!271963) (not e!266442))))

(assert (=> b!455888 (= res!271963 (bvsle from!863 i!563))))

(declare-fun b!455889 () Bool)

(assert (=> b!455889 (= e!266442 false)))

(declare-fun minValue!515 () V!17427)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17427)

(declare-datatypes ((tuple2!8032 0))(
  ( (tuple2!8033 (_1!4027 (_ BitVec 64)) (_2!4027 V!17427)) )
))
(declare-datatypes ((List!8105 0))(
  ( (Nil!8102) (Cons!8101 (h!8957 tuple2!8032) (t!13925 List!8105)) )
))
(declare-datatypes ((ListLongMap!6947 0))(
  ( (ListLongMap!6948 (toList!3489 List!8105)) )
))
(declare-fun lt!206448 () ListLongMap!6947)

(declare-fun v!412 () V!17427)

(declare-fun getCurrentListMapNoExtraKeys!1718 (array!28276 array!28278 (_ BitVec 32) (_ BitVec 32) V!17427 V!17427 (_ BitVec 32) Int) ListLongMap!6947)

(assert (=> b!455889 (= lt!206448 (getCurrentListMapNoExtraKeys!1718 lt!206450 (array!28279 (store (arr!13582 _values!549) i!563 (ValueCellFull!5777 v!412)) (size!13934 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206449 () ListLongMap!6947)

(assert (=> b!455889 (= lt!206449 (getCurrentListMapNoExtraKeys!1718 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455890 () Bool)

(assert (=> b!455890 (= e!266445 tp_is_empty!12241)))

(declare-fun b!455891 () Bool)

(assert (=> b!455891 (= e!266446 tp_is_empty!12241)))

(declare-fun b!455892 () Bool)

(declare-fun res!271962 () Bool)

(assert (=> b!455892 (=> (not res!271962) (not e!266444))))

(assert (=> b!455892 (= res!271962 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13933 _keys!709))))))

(declare-fun b!455893 () Bool)

(declare-fun res!271966 () Bool)

(assert (=> b!455893 (=> (not res!271966) (not e!266444))))

(assert (=> b!455893 (= res!271966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455894 () Bool)

(declare-fun res!271968 () Bool)

(assert (=> b!455894 (=> (not res!271968) (not e!266444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455894 (= res!271968 (validMask!0 mask!1025))))

(declare-fun b!455895 () Bool)

(declare-fun res!271972 () Bool)

(assert (=> b!455895 (=> (not res!271972) (not e!266444))))

(declare-fun arrayContainsKey!0 (array!28276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455895 (= res!271972 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40954 res!271964) b!455894))

(assert (= (and b!455894 res!271968) b!455882))

(assert (= (and b!455882 res!271970) b!455893))

(assert (= (and b!455893 res!271966) b!455887))

(assert (= (and b!455887 res!271967) b!455892))

(assert (= (and b!455892 res!271962) b!455881))

(assert (= (and b!455881 res!271961) b!455884))

(assert (= (and b!455884 res!271965) b!455895))

(assert (= (and b!455895 res!271972) b!455886))

(assert (= (and b!455886 res!271971) b!455883))

(assert (= (and b!455883 res!271969) b!455888))

(assert (= (and b!455888 res!271963) b!455889))

(assert (= (and b!455885 condMapEmpty!20002) mapIsEmpty!20002))

(assert (= (and b!455885 (not condMapEmpty!20002)) mapNonEmpty!20002))

(get-info :version)

(assert (= (and mapNonEmpty!20002 ((_ is ValueCellFull!5777) mapValue!20002)) b!455891))

(assert (= (and b!455885 ((_ is ValueCellFull!5777) mapDefault!20002)) b!455890))

(assert (= start!40954 b!455885))

(declare-fun m!439743 () Bool)

(assert (=> b!455884 m!439743))

(declare-fun m!439745 () Bool)

(assert (=> b!455886 m!439745))

(declare-fun m!439747 () Bool)

(assert (=> b!455886 m!439747))

(declare-fun m!439749 () Bool)

(assert (=> mapNonEmpty!20002 m!439749))

(declare-fun m!439751 () Bool)

(assert (=> start!40954 m!439751))

(declare-fun m!439753 () Bool)

(assert (=> start!40954 m!439753))

(declare-fun m!439755 () Bool)

(assert (=> b!455887 m!439755))

(declare-fun m!439757 () Bool)

(assert (=> b!455883 m!439757))

(declare-fun m!439759 () Bool)

(assert (=> b!455889 m!439759))

(declare-fun m!439761 () Bool)

(assert (=> b!455889 m!439761))

(declare-fun m!439763 () Bool)

(assert (=> b!455889 m!439763))

(declare-fun m!439765 () Bool)

(assert (=> b!455894 m!439765))

(declare-fun m!439767 () Bool)

(assert (=> b!455893 m!439767))

(declare-fun m!439769 () Bool)

(assert (=> b!455881 m!439769))

(declare-fun m!439771 () Bool)

(assert (=> b!455895 m!439771))

(check-sat (not b!455883) (not mapNonEmpty!20002) (not b!455894) (not start!40954) (not b!455889) (not b!455886) (not b!455887) (not b_next!10903) (not b!455881) b_and!19055 (not b!455895) (not b!455893) tp_is_empty!12241)
(check-sat b_and!19055 (not b_next!10903))
