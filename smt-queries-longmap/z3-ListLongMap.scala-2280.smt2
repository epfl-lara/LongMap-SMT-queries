; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37144 () Bool)

(assert start!37144)

(declare-fun b_free!8271 () Bool)

(declare-fun b_next!8271 () Bool)

(assert (=> start!37144 (= b_free!8271 (not b_next!8271))))

(declare-fun tp!29528 () Bool)

(declare-fun b_and!15513 () Bool)

(assert (=> start!37144 (= tp!29528 b_and!15513)))

(declare-fun b!374532 () Bool)

(declare-fun e!228252 () Bool)

(declare-fun tp_is_empty!8919 () Bool)

(assert (=> b!374532 (= e!228252 tp_is_empty!8919)))

(declare-fun b!374533 () Bool)

(declare-fun e!228248 () Bool)

(declare-fun e!228251 () Bool)

(assert (=> b!374533 (= e!228248 e!228251)))

(declare-fun res!211226 () Bool)

(assert (=> b!374533 (=> (not res!211226) (not e!228251))))

(declare-datatypes ((array!21777 0))(
  ( (array!21778 (arr!10357 (Array (_ BitVec 32) (_ BitVec 64))) (size!10709 (_ BitVec 32))) )
))
(declare-fun lt!172729 () array!21777)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21777 (_ BitVec 32)) Bool)

(assert (=> b!374533 (= res!211226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172729 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21777)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374533 (= lt!172729 (array!21778 (store (arr!10357 _keys!658) i!548 k0!778) (size!10709 _keys!658)))))

(declare-fun b!374534 () Bool)

(declare-fun e!228253 () Bool)

(assert (=> b!374534 (= e!228253 tp_is_empty!8919)))

(declare-fun b!374535 () Bool)

(declare-fun e!228250 () Bool)

(declare-fun mapRes!14943 () Bool)

(assert (=> b!374535 (= e!228250 (and e!228252 mapRes!14943))))

(declare-fun condMapEmpty!14943 () Bool)

(declare-datatypes ((V!12997 0))(
  ( (V!12998 (val!4504 Int)) )
))
(declare-datatypes ((ValueCell!4116 0))(
  ( (ValueCellFull!4116 (v!6701 V!12997)) (EmptyCell!4116) )
))
(declare-datatypes ((array!21779 0))(
  ( (array!21780 (arr!10358 (Array (_ BitVec 32) ValueCell!4116)) (size!10710 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21779)

(declare-fun mapDefault!14943 () ValueCell!4116)

(assert (=> b!374535 (= condMapEmpty!14943 (= (arr!10358 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4116)) mapDefault!14943)))))

(declare-fun b!374536 () Bool)

(declare-fun res!211221 () Bool)

(assert (=> b!374536 (=> (not res!211221) (not e!228248))))

(assert (=> b!374536 (= res!211221 (or (= (select (arr!10357 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10357 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374537 () Bool)

(declare-fun res!211228 () Bool)

(assert (=> b!374537 (=> (not res!211228) (not e!228248))))

(assert (=> b!374537 (= res!211228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374538 () Bool)

(declare-fun res!211224 () Bool)

(assert (=> b!374538 (=> (not res!211224) (not e!228248))))

(declare-fun arrayContainsKey!0 (array!21777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374538 (= res!211224 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374539 () Bool)

(declare-fun e!228249 () Bool)

(declare-fun e!228254 () Bool)

(assert (=> b!374539 (= e!228249 e!228254)))

(declare-fun res!211225 () Bool)

(assert (=> b!374539 (=> res!211225 e!228254)))

(assert (=> b!374539 (= res!211225 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5990 0))(
  ( (tuple2!5991 (_1!3006 (_ BitVec 64)) (_2!3006 V!12997)) )
))
(declare-datatypes ((List!5834 0))(
  ( (Nil!5831) (Cons!5830 (h!6686 tuple2!5990) (t!10984 List!5834)) )
))
(declare-datatypes ((ListLongMap!4903 0))(
  ( (ListLongMap!4904 (toList!2467 List!5834)) )
))
(declare-fun lt!172717 () ListLongMap!4903)

(declare-fun lt!172719 () ListLongMap!4903)

(assert (=> b!374539 (= lt!172717 lt!172719)))

(declare-fun lt!172730 () ListLongMap!4903)

(declare-fun lt!172723 () tuple2!5990)

(declare-fun +!813 (ListLongMap!4903 tuple2!5990) ListLongMap!4903)

(assert (=> b!374539 (= lt!172719 (+!813 lt!172730 lt!172723))))

(declare-datatypes ((Unit!11532 0))(
  ( (Unit!11533) )
))
(declare-fun lt!172725 () Unit!11532)

(declare-fun v!373 () V!12997)

(declare-fun zeroValue!472 () V!12997)

(declare-fun lt!172728 () ListLongMap!4903)

(declare-fun addCommutativeForDiffKeys!236 (ListLongMap!4903 (_ BitVec 64) V!12997 (_ BitVec 64) V!12997) Unit!11532)

(assert (=> b!374539 (= lt!172725 (addCommutativeForDiffKeys!236 lt!172728 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172715 () ListLongMap!4903)

(declare-fun lt!172726 () tuple2!5990)

(assert (=> b!374539 (= lt!172715 (+!813 lt!172717 lt!172726))))

(declare-fun lt!172718 () ListLongMap!4903)

(declare-fun lt!172722 () tuple2!5990)

(assert (=> b!374539 (= lt!172717 (+!813 lt!172718 lt!172722))))

(declare-fun lt!172727 () ListLongMap!4903)

(declare-fun lt!172731 () ListLongMap!4903)

(assert (=> b!374539 (= lt!172727 lt!172731)))

(assert (=> b!374539 (= lt!172731 (+!813 lt!172730 lt!172726))))

(assert (=> b!374539 (= lt!172730 (+!813 lt!172728 lt!172722))))

(declare-fun lt!172716 () ListLongMap!4903)

(assert (=> b!374539 (= lt!172715 (+!813 (+!813 lt!172716 lt!172722) lt!172726))))

(declare-fun minValue!472 () V!12997)

(assert (=> b!374539 (= lt!172726 (tuple2!5991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374539 (= lt!172722 (tuple2!5991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374540 () Bool)

(declare-fun res!211223 () Bool)

(assert (=> b!374540 (=> (not res!211223) (not e!228251))))

(declare-datatypes ((List!5835 0))(
  ( (Nil!5832) (Cons!5831 (h!6687 (_ BitVec 64)) (t!10985 List!5835)) )
))
(declare-fun arrayNoDuplicates!0 (array!21777 (_ BitVec 32) List!5835) Bool)

(assert (=> b!374540 (= res!211223 (arrayNoDuplicates!0 lt!172729 #b00000000000000000000000000000000 Nil!5832))))

(declare-fun res!211229 () Bool)

(assert (=> start!37144 (=> (not res!211229) (not e!228248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37144 (= res!211229 (validMask!0 mask!970))))

(assert (=> start!37144 e!228248))

(declare-fun array_inv!7640 (array!21779) Bool)

(assert (=> start!37144 (and (array_inv!7640 _values!506) e!228250)))

(assert (=> start!37144 tp!29528))

(assert (=> start!37144 true))

(assert (=> start!37144 tp_is_empty!8919))

(declare-fun array_inv!7641 (array!21777) Bool)

(assert (=> start!37144 (array_inv!7641 _keys!658)))

(declare-fun b!374541 () Bool)

(assert (=> b!374541 (= e!228251 (not e!228249))))

(declare-fun res!211218 () Bool)

(assert (=> b!374541 (=> res!211218 e!228249)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374541 (= res!211218 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1904 (array!21777 array!21779 (_ BitVec 32) (_ BitVec 32) V!12997 V!12997 (_ BitVec 32) Int) ListLongMap!4903)

(assert (=> b!374541 (= lt!172727 (getCurrentListMap!1904 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172724 () array!21779)

(assert (=> b!374541 (= lt!172715 (getCurrentListMap!1904 lt!172729 lt!172724 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374541 (and (= lt!172716 lt!172718) (= lt!172718 lt!172716))))

(assert (=> b!374541 (= lt!172718 (+!813 lt!172728 lt!172723))))

(assert (=> b!374541 (= lt!172723 (tuple2!5991 k0!778 v!373))))

(declare-fun lt!172721 () Unit!11532)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!62 (array!21777 array!21779 (_ BitVec 32) (_ BitVec 32) V!12997 V!12997 (_ BitVec 32) (_ BitVec 64) V!12997 (_ BitVec 32) Int) Unit!11532)

(assert (=> b!374541 (= lt!172721 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!62 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!738 (array!21777 array!21779 (_ BitVec 32) (_ BitVec 32) V!12997 V!12997 (_ BitVec 32) Int) ListLongMap!4903)

(assert (=> b!374541 (= lt!172716 (getCurrentListMapNoExtraKeys!738 lt!172729 lt!172724 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374541 (= lt!172724 (array!21780 (store (arr!10358 _values!506) i!548 (ValueCellFull!4116 v!373)) (size!10710 _values!506)))))

(assert (=> b!374541 (= lt!172728 (getCurrentListMapNoExtraKeys!738 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374542 () Bool)

(declare-fun res!211227 () Bool)

(assert (=> b!374542 (=> (not res!211227) (not e!228248))))

(assert (=> b!374542 (= res!211227 (and (= (size!10710 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10709 _keys!658) (size!10710 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14943 () Bool)

(declare-fun tp!29529 () Bool)

(assert (=> mapNonEmpty!14943 (= mapRes!14943 (and tp!29529 e!228253))))

(declare-fun mapKey!14943 () (_ BitVec 32))

(declare-fun mapValue!14943 () ValueCell!4116)

(declare-fun mapRest!14943 () (Array (_ BitVec 32) ValueCell!4116))

(assert (=> mapNonEmpty!14943 (= (arr!10358 _values!506) (store mapRest!14943 mapKey!14943 mapValue!14943))))

(declare-fun b!374543 () Bool)

(declare-fun res!211220 () Bool)

(assert (=> b!374543 (=> (not res!211220) (not e!228248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374543 (= res!211220 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14943 () Bool)

(assert (=> mapIsEmpty!14943 mapRes!14943))

(declare-fun b!374544 () Bool)

(assert (=> b!374544 (= e!228254 true)))

(assert (=> b!374544 (= (+!813 lt!172719 lt!172726) (+!813 lt!172731 lt!172723))))

(declare-fun lt!172720 () Unit!11532)

(assert (=> b!374544 (= lt!172720 (addCommutativeForDiffKeys!236 lt!172730 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374545 () Bool)

(declare-fun res!211219 () Bool)

(assert (=> b!374545 (=> (not res!211219) (not e!228248))))

(assert (=> b!374545 (= res!211219 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10709 _keys!658))))))

(declare-fun b!374546 () Bool)

(declare-fun res!211222 () Bool)

(assert (=> b!374546 (=> (not res!211222) (not e!228248))))

(assert (=> b!374546 (= res!211222 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5832))))

(assert (= (and start!37144 res!211229) b!374542))

(assert (= (and b!374542 res!211227) b!374537))

(assert (= (and b!374537 res!211228) b!374546))

(assert (= (and b!374546 res!211222) b!374545))

(assert (= (and b!374545 res!211219) b!374543))

(assert (= (and b!374543 res!211220) b!374536))

(assert (= (and b!374536 res!211221) b!374538))

(assert (= (and b!374538 res!211224) b!374533))

(assert (= (and b!374533 res!211226) b!374540))

(assert (= (and b!374540 res!211223) b!374541))

(assert (= (and b!374541 (not res!211218)) b!374539))

(assert (= (and b!374539 (not res!211225)) b!374544))

(assert (= (and b!374535 condMapEmpty!14943) mapIsEmpty!14943))

(assert (= (and b!374535 (not condMapEmpty!14943)) mapNonEmpty!14943))

(get-info :version)

(assert (= (and mapNonEmpty!14943 ((_ is ValueCellFull!4116) mapValue!14943)) b!374534))

(assert (= (and b!374535 ((_ is ValueCellFull!4116) mapDefault!14943)) b!374532))

(assert (= start!37144 b!374535))

(declare-fun m!370815 () Bool)

(assert (=> b!374536 m!370815))

(declare-fun m!370817 () Bool)

(assert (=> b!374540 m!370817))

(declare-fun m!370819 () Bool)

(assert (=> b!374537 m!370819))

(declare-fun m!370821 () Bool)

(assert (=> b!374544 m!370821))

(declare-fun m!370823 () Bool)

(assert (=> b!374544 m!370823))

(declare-fun m!370825 () Bool)

(assert (=> b!374544 m!370825))

(declare-fun m!370827 () Bool)

(assert (=> start!37144 m!370827))

(declare-fun m!370829 () Bool)

(assert (=> start!37144 m!370829))

(declare-fun m!370831 () Bool)

(assert (=> start!37144 m!370831))

(declare-fun m!370833 () Bool)

(assert (=> b!374543 m!370833))

(declare-fun m!370835 () Bool)

(assert (=> b!374538 m!370835))

(declare-fun m!370837 () Bool)

(assert (=> b!374539 m!370837))

(declare-fun m!370839 () Bool)

(assert (=> b!374539 m!370839))

(declare-fun m!370841 () Bool)

(assert (=> b!374539 m!370841))

(declare-fun m!370843 () Bool)

(assert (=> b!374539 m!370843))

(declare-fun m!370845 () Bool)

(assert (=> b!374539 m!370845))

(assert (=> b!374539 m!370843))

(declare-fun m!370847 () Bool)

(assert (=> b!374539 m!370847))

(declare-fun m!370849 () Bool)

(assert (=> b!374539 m!370849))

(declare-fun m!370851 () Bool)

(assert (=> b!374539 m!370851))

(declare-fun m!370853 () Bool)

(assert (=> b!374546 m!370853))

(declare-fun m!370855 () Bool)

(assert (=> mapNonEmpty!14943 m!370855))

(declare-fun m!370857 () Bool)

(assert (=> b!374541 m!370857))

(declare-fun m!370859 () Bool)

(assert (=> b!374541 m!370859))

(declare-fun m!370861 () Bool)

(assert (=> b!374541 m!370861))

(declare-fun m!370863 () Bool)

(assert (=> b!374541 m!370863))

(declare-fun m!370865 () Bool)

(assert (=> b!374541 m!370865))

(declare-fun m!370867 () Bool)

(assert (=> b!374541 m!370867))

(declare-fun m!370869 () Bool)

(assert (=> b!374541 m!370869))

(declare-fun m!370871 () Bool)

(assert (=> b!374533 m!370871))

(declare-fun m!370873 () Bool)

(assert (=> b!374533 m!370873))

(check-sat (not b!374539) b_and!15513 (not b!374544) (not mapNonEmpty!14943) (not b!374540) (not start!37144) (not b!374541) (not b!374538) (not b!374546) (not b!374533) (not b_next!8271) tp_is_empty!8919 (not b!374543) (not b!374537))
(check-sat b_and!15513 (not b_next!8271))
