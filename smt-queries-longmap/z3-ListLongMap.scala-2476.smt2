; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38676 () Bool)

(assert start!38676)

(declare-fun b_free!9213 () Bool)

(declare-fun b_next!9213 () Bool)

(assert (=> start!38676 (= b_free!9213 (not b_next!9213))))

(declare-fun tp!32762 () Bool)

(declare-fun b_and!16599 () Bool)

(assert (=> start!38676 (= tp!32762 b_and!16599)))

(declare-fun b!401890 () Bool)

(declare-fun res!231417 () Bool)

(declare-fun e!242244 () Bool)

(assert (=> b!401890 (=> (not res!231417) (not e!242244))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24097 0))(
  ( (array!24098 (arr!11498 (Array (_ BitVec 32) (_ BitVec 64))) (size!11850 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24097)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401890 (= res!231417 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11850 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401891 () Bool)

(declare-fun res!231410 () Bool)

(declare-fun e!242243 () Bool)

(assert (=> b!401891 (=> (not res!231410) (not e!242243))))

(declare-datatypes ((List!6684 0))(
  ( (Nil!6681) (Cons!6680 (h!7536 (_ BitVec 64)) (t!11858 List!6684)) )
))
(declare-fun arrayNoDuplicates!0 (array!24097 (_ BitVec 32) List!6684) Bool)

(assert (=> b!401891 (= res!231410 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6681))))

(declare-fun b!401892 () Bool)

(declare-fun res!231408 () Bool)

(assert (=> b!401892 (=> (not res!231408) (not e!242243))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401892 (= res!231408 (validMask!0 mask!1025))))

(declare-fun b!401894 () Bool)

(assert (=> b!401894 (= e!242243 e!242244)))

(declare-fun res!231415 () Bool)

(assert (=> b!401894 (=> (not res!231415) (not e!242244))))

(declare-fun lt!187864 () array!24097)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24097 (_ BitVec 32)) Bool)

(assert (=> b!401894 (= res!231415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187864 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!401894 (= lt!187864 (array!24098 (store (arr!11498 _keys!709) i!563 k0!794) (size!11850 _keys!709)))))

(declare-fun bm!28300 () Bool)

(declare-datatypes ((V!14565 0))(
  ( (V!14566 (val!5092 Int)) )
))
(declare-fun minValue!515 () V!14565)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54776 () Bool)

(declare-datatypes ((ValueCell!4704 0))(
  ( (ValueCellFull!4704 (v!7339 V!14565)) (EmptyCell!4704) )
))
(declare-datatypes ((array!24099 0))(
  ( (array!24100 (arr!11499 (Array (_ BitVec 32) ValueCell!4704)) (size!11851 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24099)

(declare-fun zeroValue!515 () V!14565)

(declare-datatypes ((tuple2!6760 0))(
  ( (tuple2!6761 (_1!3391 (_ BitVec 64)) (_2!3391 V!14565)) )
))
(declare-datatypes ((List!6685 0))(
  ( (Nil!6682) (Cons!6681 (h!7537 tuple2!6760) (t!11859 List!6685)) )
))
(declare-datatypes ((ListLongMap!5673 0))(
  ( (ListLongMap!5674 (toList!2852 List!6685)) )
))
(declare-fun call!28303 () ListLongMap!5673)

(declare-fun v!412 () V!14565)

(declare-fun getCurrentListMapNoExtraKeys!1064 (array!24097 array!24099 (_ BitVec 32) (_ BitVec 32) V!14565 V!14565 (_ BitVec 32) Int) ListLongMap!5673)

(assert (=> bm!28300 (= call!28303 (getCurrentListMapNoExtraKeys!1064 (ite c!54776 _keys!709 lt!187864) (ite c!54776 _values!549 (array!24100 (store (arr!11499 _values!549) i!563 (ValueCellFull!4704 v!412)) (size!11851 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401895 () Bool)

(declare-fun res!231406 () Bool)

(assert (=> b!401895 (=> (not res!231406) (not e!242243))))

(assert (=> b!401895 (= res!231406 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11850 _keys!709))))))

(declare-fun b!401896 () Bool)

(declare-fun call!28304 () ListLongMap!5673)

(declare-fun e!242238 () Bool)

(declare-fun +!1133 (ListLongMap!5673 tuple2!6760) ListLongMap!5673)

(assert (=> b!401896 (= e!242238 (= call!28304 (+!1133 call!28303 (tuple2!6761 k0!794 v!412))))))

(declare-fun b!401897 () Bool)

(declare-fun e!242240 () Bool)

(declare-fun tp_is_empty!10095 () Bool)

(assert (=> b!401897 (= e!242240 tp_is_empty!10095)))

(declare-fun bm!28301 () Bool)

(assert (=> bm!28301 (= call!28304 (getCurrentListMapNoExtraKeys!1064 (ite c!54776 lt!187864 _keys!709) (ite c!54776 (array!24100 (store (arr!11499 _values!549) i!563 (ValueCellFull!4704 v!412)) (size!11851 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401898 () Bool)

(declare-fun res!231416 () Bool)

(assert (=> b!401898 (=> (not res!231416) (not e!242243))))

(assert (=> b!401898 (= res!231416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16764 () Bool)

(declare-fun mapRes!16764 () Bool)

(declare-fun tp!32763 () Bool)

(declare-fun e!242242 () Bool)

(assert (=> mapNonEmpty!16764 (= mapRes!16764 (and tp!32763 e!242242))))

(declare-fun mapRest!16764 () (Array (_ BitVec 32) ValueCell!4704))

(declare-fun mapValue!16764 () ValueCell!4704)

(declare-fun mapKey!16764 () (_ BitVec 32))

(assert (=> mapNonEmpty!16764 (= (arr!11499 _values!549) (store mapRest!16764 mapKey!16764 mapValue!16764))))

(declare-fun b!401899 () Bool)

(assert (=> b!401899 (= e!242244 (not true))))

(assert (=> b!401899 e!242238))

(assert (=> b!401899 (= c!54776 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12172 0))(
  ( (Unit!12173) )
))
(declare-fun lt!187865 () Unit!12172)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!344 (array!24097 array!24099 (_ BitVec 32) (_ BitVec 32) V!14565 V!14565 (_ BitVec 32) (_ BitVec 64) V!14565 (_ BitVec 32) Int) Unit!12172)

(assert (=> b!401899 (= lt!187865 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401900 () Bool)

(declare-fun res!231412 () Bool)

(assert (=> b!401900 (=> (not res!231412) (not e!242243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401900 (= res!231412 (validKeyInArray!0 k0!794))))

(declare-fun b!401901 () Bool)

(declare-fun e!242239 () Bool)

(assert (=> b!401901 (= e!242239 (and e!242240 mapRes!16764))))

(declare-fun condMapEmpty!16764 () Bool)

(declare-fun mapDefault!16764 () ValueCell!4704)

(assert (=> b!401901 (= condMapEmpty!16764 (= (arr!11499 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4704)) mapDefault!16764)))))

(declare-fun b!401902 () Bool)

(declare-fun res!231411 () Bool)

(assert (=> b!401902 (=> (not res!231411) (not e!242244))))

(assert (=> b!401902 (= res!231411 (arrayNoDuplicates!0 lt!187864 #b00000000000000000000000000000000 Nil!6681))))

(declare-fun mapIsEmpty!16764 () Bool)

(assert (=> mapIsEmpty!16764 mapRes!16764))

(declare-fun b!401893 () Bool)

(assert (=> b!401893 (= e!242242 tp_is_empty!10095)))

(declare-fun res!231414 () Bool)

(assert (=> start!38676 (=> (not res!231414) (not e!242243))))

(assert (=> start!38676 (= res!231414 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11850 _keys!709))))))

(assert (=> start!38676 e!242243))

(assert (=> start!38676 tp_is_empty!10095))

(assert (=> start!38676 tp!32762))

(assert (=> start!38676 true))

(declare-fun array_inv!8418 (array!24099) Bool)

(assert (=> start!38676 (and (array_inv!8418 _values!549) e!242239)))

(declare-fun array_inv!8419 (array!24097) Bool)

(assert (=> start!38676 (array_inv!8419 _keys!709)))

(declare-fun b!401903 () Bool)

(assert (=> b!401903 (= e!242238 (= call!28303 call!28304))))

(declare-fun b!401904 () Bool)

(declare-fun res!231407 () Bool)

(assert (=> b!401904 (=> (not res!231407) (not e!242243))))

(assert (=> b!401904 (= res!231407 (or (= (select (arr!11498 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11498 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401905 () Bool)

(declare-fun res!231413 () Bool)

(assert (=> b!401905 (=> (not res!231413) (not e!242243))))

(assert (=> b!401905 (= res!231413 (and (= (size!11851 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11850 _keys!709) (size!11851 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401906 () Bool)

(declare-fun res!231409 () Bool)

(assert (=> b!401906 (=> (not res!231409) (not e!242243))))

(declare-fun arrayContainsKey!0 (array!24097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401906 (= res!231409 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38676 res!231414) b!401892))

(assert (= (and b!401892 res!231408) b!401905))

(assert (= (and b!401905 res!231413) b!401898))

(assert (= (and b!401898 res!231416) b!401891))

(assert (= (and b!401891 res!231410) b!401895))

(assert (= (and b!401895 res!231406) b!401900))

(assert (= (and b!401900 res!231412) b!401904))

(assert (= (and b!401904 res!231407) b!401906))

(assert (= (and b!401906 res!231409) b!401894))

(assert (= (and b!401894 res!231415) b!401902))

(assert (= (and b!401902 res!231411) b!401890))

(assert (= (and b!401890 res!231417) b!401899))

(assert (= (and b!401899 c!54776) b!401896))

(assert (= (and b!401899 (not c!54776)) b!401903))

(assert (= (or b!401896 b!401903) bm!28301))

(assert (= (or b!401896 b!401903) bm!28300))

(assert (= (and b!401901 condMapEmpty!16764) mapIsEmpty!16764))

(assert (= (and b!401901 (not condMapEmpty!16764)) mapNonEmpty!16764))

(get-info :version)

(assert (= (and mapNonEmpty!16764 ((_ is ValueCellFull!4704) mapValue!16764)) b!401893))

(assert (= (and b!401901 ((_ is ValueCellFull!4704) mapDefault!16764)) b!401897))

(assert (= start!38676 b!401901))

(declare-fun m!395597 () Bool)

(assert (=> b!401892 m!395597))

(declare-fun m!395599 () Bool)

(assert (=> b!401894 m!395599))

(declare-fun m!395601 () Bool)

(assert (=> b!401894 m!395601))

(declare-fun m!395603 () Bool)

(assert (=> mapNonEmpty!16764 m!395603))

(declare-fun m!395605 () Bool)

(assert (=> b!401898 m!395605))

(declare-fun m!395607 () Bool)

(assert (=> start!38676 m!395607))

(declare-fun m!395609 () Bool)

(assert (=> start!38676 m!395609))

(declare-fun m!395611 () Bool)

(assert (=> b!401902 m!395611))

(declare-fun m!395613 () Bool)

(assert (=> bm!28301 m!395613))

(declare-fun m!395615 () Bool)

(assert (=> bm!28301 m!395615))

(declare-fun m!395617 () Bool)

(assert (=> b!401904 m!395617))

(declare-fun m!395619 () Bool)

(assert (=> b!401900 m!395619))

(declare-fun m!395621 () Bool)

(assert (=> b!401891 m!395621))

(declare-fun m!395623 () Bool)

(assert (=> b!401906 m!395623))

(declare-fun m!395625 () Bool)

(assert (=> b!401896 m!395625))

(declare-fun m!395627 () Bool)

(assert (=> b!401899 m!395627))

(assert (=> bm!28300 m!395613))

(declare-fun m!395629 () Bool)

(assert (=> bm!28300 m!395629))

(check-sat (not mapNonEmpty!16764) (not b!401902) (not bm!28301) (not b!401899) (not b!401906) (not b!401894) (not b!401891) (not b!401898) (not start!38676) (not b_next!9213) (not b!401896) (not b!401892) (not b!401900) (not bm!28300) tp_is_empty!10095 b_and!16599)
(check-sat b_and!16599 (not b_next!9213))
