; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83370 () Bool)

(assert start!83370)

(declare-fun b_free!19195 () Bool)

(declare-fun b_next!19195 () Bool)

(assert (=> start!83370 (= b_free!19195 (not b_next!19195))))

(declare-fun tp!66864 () Bool)

(declare-fun b_and!30693 () Bool)

(assert (=> start!83370 (= tp!66864 b_and!30693)))

(declare-fun b!971639 () Bool)

(declare-fun e!547845 () Bool)

(declare-fun e!547843 () Bool)

(declare-fun mapRes!35149 () Bool)

(assert (=> b!971639 (= e!547845 (and e!547843 mapRes!35149))))

(declare-fun condMapEmpty!35149 () Bool)

(declare-datatypes ((V!34441 0))(
  ( (V!34442 (val!11097 Int)) )
))
(declare-datatypes ((ValueCell!10565 0))(
  ( (ValueCellFull!10565 (v!13653 V!34441)) (EmptyCell!10565) )
))
(declare-datatypes ((array!60262 0))(
  ( (array!60263 (arr!28990 (Array (_ BitVec 32) ValueCell!10565)) (size!29470 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60262)

(declare-fun mapDefault!35149 () ValueCell!10565)

(assert (=> b!971639 (= condMapEmpty!35149 (= (arr!28990 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10565)) mapDefault!35149)))))

(declare-fun b!971640 () Bool)

(declare-fun res!650073 () Bool)

(declare-fun e!547844 () Bool)

(assert (=> b!971640 (=> (not res!650073) (not e!547844))))

(declare-datatypes ((array!60264 0))(
  ( (array!60265 (arr!28991 (Array (_ BitVec 32) (_ BitVec 64))) (size!29471 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60264)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971640 (= res!650073 (validKeyInArray!0 (select (arr!28991 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35149 () Bool)

(declare-fun tp!66865 () Bool)

(declare-fun e!547846 () Bool)

(assert (=> mapNonEmpty!35149 (= mapRes!35149 (and tp!66865 e!547846))))

(declare-fun mapRest!35149 () (Array (_ BitVec 32) ValueCell!10565))

(declare-fun mapKey!35149 () (_ BitVec 32))

(declare-fun mapValue!35149 () ValueCell!10565)

(assert (=> mapNonEmpty!35149 (= (arr!28990 _values!1425) (store mapRest!35149 mapKey!35149 mapValue!35149))))

(declare-fun b!971641 () Bool)

(declare-fun tp_is_empty!22093 () Bool)

(assert (=> b!971641 (= e!547843 tp_is_empty!22093)))

(declare-fun b!971643 () Bool)

(assert (=> b!971643 (= e!547846 tp_is_empty!22093)))

(declare-fun b!971644 () Bool)

(assert (=> b!971644 (= e!547844 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432132 () Bool)

(declare-fun zeroValue!1367 () V!34441)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34441)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14222 0))(
  ( (tuple2!14223 (_1!7122 (_ BitVec 64)) (_2!7122 V!34441)) )
))
(declare-datatypes ((List!20077 0))(
  ( (Nil!20074) (Cons!20073 (h!21241 tuple2!14222) (t!28432 List!20077)) )
))
(declare-datatypes ((ListLongMap!12921 0))(
  ( (ListLongMap!12922 (toList!6476 List!20077)) )
))
(declare-fun contains!5591 (ListLongMap!12921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3709 (array!60264 array!60262 (_ BitVec 32) (_ BitVec 32) V!34441 V!34441 (_ BitVec 32) Int) ListLongMap!12921)

(assert (=> b!971644 (= lt!432132 (contains!5591 (getCurrentListMap!3709 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28991 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35149 () Bool)

(assert (=> mapIsEmpty!35149 mapRes!35149))

(declare-fun b!971645 () Bool)

(declare-fun res!650070 () Bool)

(assert (=> b!971645 (=> (not res!650070) (not e!547844))))

(declare-datatypes ((List!20078 0))(
  ( (Nil!20075) (Cons!20074 (h!21242 (_ BitVec 64)) (t!28433 List!20078)) )
))
(declare-fun arrayNoDuplicates!0 (array!60264 (_ BitVec 32) List!20078) Bool)

(assert (=> b!971645 (= res!650070 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20075))))

(declare-fun b!971646 () Bool)

(declare-fun res!650072 () Bool)

(assert (=> b!971646 (=> (not res!650072) (not e!547844))))

(assert (=> b!971646 (= res!650072 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29471 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29471 _keys!1717))))))

(declare-fun b!971647 () Bool)

(declare-fun res!650071 () Bool)

(assert (=> b!971647 (=> (not res!650071) (not e!547844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60264 (_ BitVec 32)) Bool)

(assert (=> b!971647 (= res!650071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650075 () Bool)

(assert (=> start!83370 (=> (not res!650075) (not e!547844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83370 (= res!650075 (validMask!0 mask!2147))))

(assert (=> start!83370 e!547844))

(assert (=> start!83370 true))

(declare-fun array_inv!22487 (array!60262) Bool)

(assert (=> start!83370 (and (array_inv!22487 _values!1425) e!547845)))

(assert (=> start!83370 tp_is_empty!22093))

(assert (=> start!83370 tp!66864))

(declare-fun array_inv!22488 (array!60264) Bool)

(assert (=> start!83370 (array_inv!22488 _keys!1717)))

(declare-fun b!971642 () Bool)

(declare-fun res!650074 () Bool)

(assert (=> b!971642 (=> (not res!650074) (not e!547844))))

(assert (=> b!971642 (= res!650074 (and (= (size!29470 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29471 _keys!1717) (size!29470 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83370 res!650075) b!971642))

(assert (= (and b!971642 res!650074) b!971647))

(assert (= (and b!971647 res!650071) b!971645))

(assert (= (and b!971645 res!650070) b!971646))

(assert (= (and b!971646 res!650072) b!971640))

(assert (= (and b!971640 res!650073) b!971644))

(assert (= (and b!971639 condMapEmpty!35149) mapIsEmpty!35149))

(assert (= (and b!971639 (not condMapEmpty!35149)) mapNonEmpty!35149))

(get-info :version)

(assert (= (and mapNonEmpty!35149 ((_ is ValueCellFull!10565) mapValue!35149)) b!971643))

(assert (= (and b!971639 ((_ is ValueCellFull!10565) mapDefault!35149)) b!971641))

(assert (= start!83370 b!971639))

(declare-fun m!899681 () Bool)

(assert (=> b!971640 m!899681))

(assert (=> b!971640 m!899681))

(declare-fun m!899683 () Bool)

(assert (=> b!971640 m!899683))

(declare-fun m!899685 () Bool)

(assert (=> b!971644 m!899685))

(assert (=> b!971644 m!899681))

(assert (=> b!971644 m!899685))

(assert (=> b!971644 m!899681))

(declare-fun m!899687 () Bool)

(assert (=> b!971644 m!899687))

(declare-fun m!899689 () Bool)

(assert (=> b!971647 m!899689))

(declare-fun m!899691 () Bool)

(assert (=> mapNonEmpty!35149 m!899691))

(declare-fun m!899693 () Bool)

(assert (=> b!971645 m!899693))

(declare-fun m!899695 () Bool)

(assert (=> start!83370 m!899695))

(declare-fun m!899697 () Bool)

(assert (=> start!83370 m!899697))

(declare-fun m!899699 () Bool)

(assert (=> start!83370 m!899699))

(check-sat (not mapNonEmpty!35149) (not b_next!19195) (not b!971644) (not b!971647) b_and!30693 tp_is_empty!22093 (not start!83370) (not b!971640) (not b!971645))
(check-sat b_and!30693 (not b_next!19195))
