; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77390 () Bool)

(assert start!77390)

(declare-fun b!901887 () Bool)

(declare-fun b_free!16063 () Bool)

(declare-fun b_next!16063 () Bool)

(assert (=> b!901887 (= b_free!16063 (not b_next!16063))))

(declare-fun tp!56287 () Bool)

(declare-fun b_and!26399 () Bool)

(assert (=> b!901887 (= tp!56287 b_and!26399)))

(declare-fun b!901886 () Bool)

(declare-fun res!608716 () Bool)

(declare-fun e!504933 () Bool)

(assert (=> b!901886 (=> res!608716 e!504933)))

(declare-datatypes ((array!52875 0))(
  ( (array!52876 (arr!25402 (Array (_ BitVec 32) (_ BitVec 64))) (size!25862 (_ BitVec 32))) )
))
(declare-datatypes ((V!29487 0))(
  ( (V!29488 (val!9246 Int)) )
))
(declare-datatypes ((ValueCell!8714 0))(
  ( (ValueCellFull!8714 (v!11742 V!29487)) (EmptyCell!8714) )
))
(declare-datatypes ((array!52877 0))(
  ( (array!52878 (arr!25403 (Array (_ BitVec 32) ValueCell!8714)) (size!25863 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4444 0))(
  ( (LongMapFixedSize!4445 (defaultEntry!5460 Int) (mask!26304 (_ BitVec 32)) (extraKeys!5188 (_ BitVec 32)) (zeroValue!5292 V!29487) (minValue!5292 V!29487) (_size!2277 (_ BitVec 32)) (_keys!10298 array!52875) (_values!5479 array!52877) (_vacant!2277 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4444)

(declare-datatypes ((List!17817 0))(
  ( (Nil!17814) (Cons!17813 (h!18965 (_ BitVec 64)) (t!25166 List!17817)) )
))
(declare-fun arrayNoDuplicates!0 (array!52875 (_ BitVec 32) List!17817) Bool)

(assert (=> b!901886 (= res!608716 (not (arrayNoDuplicates!0 (_keys!10298 thiss!1181) #b00000000000000000000000000000000 Nil!17814)))))

(declare-fun e!504936 () Bool)

(declare-fun tp_is_empty!18391 () Bool)

(declare-fun e!504939 () Bool)

(declare-fun array_inv!19986 (array!52875) Bool)

(declare-fun array_inv!19987 (array!52877) Bool)

(assert (=> b!901887 (= e!504936 (and tp!56287 tp_is_empty!18391 (array_inv!19986 (_keys!10298 thiss!1181)) (array_inv!19987 (_values!5479 thiss!1181)) e!504939))))

(declare-fun b!901888 () Bool)

(declare-fun e!504935 () Bool)

(assert (=> b!901888 (= e!504935 tp_is_empty!18391)))

(declare-fun b!901889 () Bool)

(declare-fun res!608713 () Bool)

(assert (=> b!901889 (=> res!608713 e!504933)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52875 (_ BitVec 32)) Bool)

(assert (=> b!901889 (= res!608713 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10298 thiss!1181) (mask!26304 thiss!1181))))))

(declare-fun b!901890 () Bool)

(declare-fun e!504940 () Bool)

(declare-fun e!504934 () Bool)

(assert (=> b!901890 (= e!504940 (not e!504934))))

(declare-fun res!608719 () Bool)

(assert (=> b!901890 (=> res!608719 e!504934)))

(declare-datatypes ((SeekEntryResult!8899 0))(
  ( (MissingZero!8899 (index!37967 (_ BitVec 32))) (Found!8899 (index!37968 (_ BitVec 32))) (Intermediate!8899 (undefined!9711 Bool) (index!37969 (_ BitVec 32)) (x!76736 (_ BitVec 32))) (Undefined!8899) (MissingVacant!8899 (index!37970 (_ BitVec 32))) )
))
(declare-fun lt!407551 () SeekEntryResult!8899)

(get-info :version)

(assert (=> b!901890 (= res!608719 (not ((_ is Found!8899) lt!407551)))))

(declare-fun e!504938 () Bool)

(assert (=> b!901890 e!504938))

(declare-fun res!608718 () Bool)

(assert (=> b!901890 (=> res!608718 e!504938)))

(assert (=> b!901890 (= res!608718 (not ((_ is Found!8899) lt!407551)))))

(declare-datatypes ((Unit!30601 0))(
  ( (Unit!30602) )
))
(declare-fun lt!407552 () Unit!30601)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!117 (array!52875 array!52877 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 64)) Unit!30601)

(assert (=> b!901890 (= lt!407552 (lemmaSeekEntryGivesInRangeIndex!117 (_keys!10298 thiss!1181) (_values!5479 thiss!1181) (mask!26304 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52875 (_ BitVec 32)) SeekEntryResult!8899)

(assert (=> b!901890 (= lt!407551 (seekEntry!0 key!785 (_keys!10298 thiss!1181) (mask!26304 thiss!1181)))))

(declare-fun b!901892 () Bool)

(assert (=> b!901892 (= e!504934 e!504933)))

(declare-fun res!608712 () Bool)

(assert (=> b!901892 (=> res!608712 e!504933)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!901892 (= res!608712 (not (validMask!0 (mask!26304 thiss!1181))))))

(declare-datatypes ((tuple2!11984 0))(
  ( (tuple2!11985 (_1!6003 (_ BitVec 64)) (_2!6003 V!29487)) )
))
(declare-datatypes ((List!17818 0))(
  ( (Nil!17815) (Cons!17814 (h!18966 tuple2!11984) (t!25167 List!17818)) )
))
(declare-datatypes ((ListLongMap!10683 0))(
  ( (ListLongMap!10684 (toList!5357 List!17818)) )
))
(declare-fun lt!407554 () ListLongMap!10683)

(declare-fun contains!4408 (ListLongMap!10683 (_ BitVec 64)) Bool)

(assert (=> b!901892 (contains!4408 lt!407554 (select (arr!25402 (_keys!10298 thiss!1181)) (index!37968 lt!407551)))))

(declare-fun getCurrentListMap!2629 (array!52875 array!52877 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 32) Int) ListLongMap!10683)

(assert (=> b!901892 (= lt!407554 (getCurrentListMap!2629 (_keys!10298 thiss!1181) (_values!5479 thiss!1181) (mask!26304 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5460 thiss!1181)))))

(declare-fun lt!407553 () Unit!30601)

(declare-fun lemmaValidKeyInArrayIsInListMap!259 (array!52875 array!52877 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 32) Int) Unit!30601)

(assert (=> b!901892 (= lt!407553 (lemmaValidKeyInArrayIsInListMap!259 (_keys!10298 thiss!1181) (_values!5479 thiss!1181) (mask!26304 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) (index!37968 lt!407551) (defaultEntry!5460 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901892 (arrayContainsKey!0 (_keys!10298 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407555 () Unit!30601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52875 (_ BitVec 64) (_ BitVec 32)) Unit!30601)

(assert (=> b!901892 (= lt!407555 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10298 thiss!1181) key!785 (index!37968 lt!407551)))))

(declare-fun b!901893 () Bool)

(declare-fun res!608711 () Bool)

(assert (=> b!901893 (=> (not res!608711) (not e!504940))))

(assert (=> b!901893 (= res!608711 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29269 () Bool)

(declare-fun mapRes!29269 () Bool)

(declare-fun tp!56286 () Bool)

(assert (=> mapNonEmpty!29269 (= mapRes!29269 (and tp!56286 e!504935))))

(declare-fun mapValue!29269 () ValueCell!8714)

(declare-fun mapKey!29269 () (_ BitVec 32))

(declare-fun mapRest!29269 () (Array (_ BitVec 32) ValueCell!8714))

(assert (=> mapNonEmpty!29269 (= (arr!25403 (_values!5479 thiss!1181)) (store mapRest!29269 mapKey!29269 mapValue!29269))))

(declare-fun b!901894 () Bool)

(declare-fun e!504941 () Bool)

(assert (=> b!901894 (= e!504939 (and e!504941 mapRes!29269))))

(declare-fun condMapEmpty!29269 () Bool)

(declare-fun mapDefault!29269 () ValueCell!8714)

(assert (=> b!901894 (= condMapEmpty!29269 (= (arr!25403 (_values!5479 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8714)) mapDefault!29269)))))

(declare-fun b!901895 () Bool)

(declare-fun res!608715 () Bool)

(assert (=> b!901895 (=> res!608715 e!504933)))

(assert (=> b!901895 (= res!608715 (not (contains!4408 lt!407554 key!785)))))

(declare-fun b!901896 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901896 (= e!504938 (inRange!0 (index!37968 lt!407551) (mask!26304 thiss!1181)))))

(declare-fun mapIsEmpty!29269 () Bool)

(assert (=> mapIsEmpty!29269 mapRes!29269))

(declare-fun b!901897 () Bool)

(assert (=> b!901897 (= e!504933 (inRange!0 (index!37968 lt!407551) (mask!26304 thiss!1181)))))

(declare-fun b!901898 () Bool)

(declare-fun res!608714 () Bool)

(assert (=> b!901898 (=> res!608714 e!504933)))

(assert (=> b!901898 (= res!608714 (or (not (= (size!25863 (_values!5479 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26304 thiss!1181)))) (not (= (size!25862 (_keys!10298 thiss!1181)) (size!25863 (_values!5479 thiss!1181)))) (bvslt (mask!26304 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5188 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5188 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!608717 () Bool)

(assert (=> start!77390 (=> (not res!608717) (not e!504940))))

(declare-fun valid!1717 (LongMapFixedSize!4444) Bool)

(assert (=> start!77390 (= res!608717 (valid!1717 thiss!1181))))

(assert (=> start!77390 e!504940))

(assert (=> start!77390 e!504936))

(assert (=> start!77390 true))

(declare-fun b!901891 () Bool)

(assert (=> b!901891 (= e!504941 tp_is_empty!18391)))

(assert (= (and start!77390 res!608717) b!901893))

(assert (= (and b!901893 res!608711) b!901890))

(assert (= (and b!901890 (not res!608718)) b!901896))

(assert (= (and b!901890 (not res!608719)) b!901892))

(assert (= (and b!901892 (not res!608712)) b!901898))

(assert (= (and b!901898 (not res!608714)) b!901889))

(assert (= (and b!901889 (not res!608713)) b!901886))

(assert (= (and b!901886 (not res!608716)) b!901895))

(assert (= (and b!901895 (not res!608715)) b!901897))

(assert (= (and b!901894 condMapEmpty!29269) mapIsEmpty!29269))

(assert (= (and b!901894 (not condMapEmpty!29269)) mapNonEmpty!29269))

(assert (= (and mapNonEmpty!29269 ((_ is ValueCellFull!8714) mapValue!29269)) b!901888))

(assert (= (and b!901894 ((_ is ValueCellFull!8714) mapDefault!29269)) b!901891))

(assert (= b!901887 b!901894))

(assert (= start!77390 b!901887))

(declare-fun m!838627 () Bool)

(assert (=> b!901890 m!838627))

(declare-fun m!838629 () Bool)

(assert (=> b!901890 m!838629))

(declare-fun m!838631 () Bool)

(assert (=> mapNonEmpty!29269 m!838631))

(declare-fun m!838633 () Bool)

(assert (=> b!901895 m!838633))

(declare-fun m!838635 () Bool)

(assert (=> b!901886 m!838635))

(declare-fun m!838637 () Bool)

(assert (=> start!77390 m!838637))

(declare-fun m!838639 () Bool)

(assert (=> b!901896 m!838639))

(assert (=> b!901897 m!838639))

(declare-fun m!838641 () Bool)

(assert (=> b!901892 m!838641))

(declare-fun m!838643 () Bool)

(assert (=> b!901892 m!838643))

(declare-fun m!838645 () Bool)

(assert (=> b!901892 m!838645))

(assert (=> b!901892 m!838641))

(declare-fun m!838647 () Bool)

(assert (=> b!901892 m!838647))

(declare-fun m!838649 () Bool)

(assert (=> b!901892 m!838649))

(declare-fun m!838651 () Bool)

(assert (=> b!901892 m!838651))

(declare-fun m!838653 () Bool)

(assert (=> b!901892 m!838653))

(declare-fun m!838655 () Bool)

(assert (=> b!901889 m!838655))

(declare-fun m!838657 () Bool)

(assert (=> b!901887 m!838657))

(declare-fun m!838659 () Bool)

(assert (=> b!901887 m!838659))

(check-sat (not mapNonEmpty!29269) tp_is_empty!18391 (not b_next!16063) (not b!901887) (not b!901889) (not b!901896) b_and!26399 (not b!901886) (not start!77390) (not b!901890) (not b!901897) (not b!901895) (not b!901892))
(check-sat b_and!26399 (not b_next!16063))
