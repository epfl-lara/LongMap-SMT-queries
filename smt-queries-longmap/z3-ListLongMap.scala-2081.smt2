; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35640 () Bool)

(assert start!35640)

(declare-fun b_free!7909 () Bool)

(declare-fun b_next!7909 () Bool)

(assert (=> start!35640 (= b_free!7909 (not b_next!7909))))

(declare-fun tp!27711 () Bool)

(declare-fun b_and!15125 () Bool)

(assert (=> start!35640 (= tp!27711 b_and!15125)))

(declare-fun b!357768 () Bool)

(declare-fun e!218990 () Bool)

(declare-fun e!218988 () Bool)

(declare-fun mapRes!13668 () Bool)

(assert (=> b!357768 (= e!218990 (and e!218988 mapRes!13668))))

(declare-fun condMapEmpty!13668 () Bool)

(declare-datatypes ((V!11787 0))(
  ( (V!11788 (val!4098 Int)) )
))
(declare-datatypes ((ValueCell!3710 0))(
  ( (ValueCellFull!3710 (v!6286 V!11787)) (EmptyCell!3710) )
))
(declare-datatypes ((array!19765 0))(
  ( (array!19766 (arr!9376 (Array (_ BitVec 32) ValueCell!3710)) (size!9729 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19765)

(declare-fun mapDefault!13668 () ValueCell!3710)

(assert (=> b!357768 (= condMapEmpty!13668 (= (arr!9376 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3710)) mapDefault!13668)))))

(declare-fun mapIsEmpty!13668 () Bool)

(assert (=> mapIsEmpty!13668 mapRes!13668))

(declare-fun b!357769 () Bool)

(declare-fun tp_is_empty!8107 () Bool)

(assert (=> b!357769 (= e!218988 tp_is_empty!8107)))

(declare-fun b!357770 () Bool)

(declare-fun e!218991 () Bool)

(assert (=> b!357770 (= e!218991 true)))

(declare-fun minValue!1150 () V!11787)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19767 0))(
  ( (array!19768 (arr!9377 (Array (_ BitVec 32) (_ BitVec 64))) (size!9730 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19767)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11787)

(declare-datatypes ((tuple2!5698 0))(
  ( (tuple2!5699 (_1!2860 (_ BitVec 64)) (_2!2860 V!11787)) )
))
(declare-datatypes ((List!5383 0))(
  ( (Nil!5380) (Cons!5379 (h!6235 tuple2!5698) (t!10524 List!5383)) )
))
(declare-datatypes ((ListLongMap!4601 0))(
  ( (ListLongMap!4602 (toList!2316 List!5383)) )
))
(declare-fun contains!2406 (ListLongMap!4601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1821 (array!19767 array!19765 (_ BitVec 32) (_ BitVec 32) V!11787 V!11787 (_ BitVec 32) Int) ListLongMap!4601)

(assert (=> b!357770 (contains!2406 (getCurrentListMap!1821 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11024 0))(
  ( (Unit!11025) )
))
(declare-fun lt!165906 () Unit!11024)

(declare-fun lemmaArrayContainsKeyThenInListMap!354 (array!19767 array!19765 (_ BitVec 32) (_ BitVec 32) V!11787 V!11787 (_ BitVec 64) (_ BitVec 32) Int) Unit!11024)

(assert (=> b!357770 (= lt!165906 (lemmaArrayContainsKeyThenInListMap!354 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357771 () Bool)

(declare-fun res!198839 () Bool)

(declare-fun e!218987 () Bool)

(assert (=> b!357771 (=> (not res!198839) (not e!218987))))

(declare-datatypes ((List!5384 0))(
  ( (Nil!5381) (Cons!5380 (h!6236 (_ BitVec 64)) (t!10525 List!5384)) )
))
(declare-fun arrayNoDuplicates!0 (array!19767 (_ BitVec 32) List!5384) Bool)

(assert (=> b!357771 (= res!198839 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5381))))

(declare-fun b!357772 () Bool)

(declare-fun res!198837 () Bool)

(assert (=> b!357772 (=> (not res!198837) (not e!218987))))

(assert (=> b!357772 (= res!198837 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9730 _keys!1456))))))

(declare-fun b!357773 () Bool)

(assert (=> b!357773 (= e!218987 (not e!218991))))

(declare-fun res!198842 () Bool)

(assert (=> b!357773 (=> res!198842 e!218991)))

(assert (=> b!357773 (= res!198842 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9730 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357773 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!165907 () Unit!11024)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!37 (array!19767 array!19765 (_ BitVec 32) (_ BitVec 32) V!11787 V!11787 (_ BitVec 64) (_ BitVec 32)) Unit!11024)

(assert (=> b!357773 (= lt!165907 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!37 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357774 () Bool)

(declare-fun e!218986 () Bool)

(assert (=> b!357774 (= e!218986 tp_is_empty!8107)))

(declare-fun b!357775 () Bool)

(declare-fun res!198841 () Bool)

(assert (=> b!357775 (=> (not res!198841) (not e!218987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19767 (_ BitVec 32)) Bool)

(assert (=> b!357775 (= res!198841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357776 () Bool)

(declare-fun res!198844 () Bool)

(assert (=> b!357776 (=> (not res!198844) (not e!218987))))

(assert (=> b!357776 (= res!198844 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357777 () Bool)

(declare-fun res!198843 () Bool)

(assert (=> b!357777 (=> (not res!198843) (not e!218987))))

(assert (=> b!357777 (= res!198843 (and (= (size!9729 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9730 _keys!1456) (size!9729 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!198838 () Bool)

(assert (=> start!35640 (=> (not res!198838) (not e!218987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35640 (= res!198838 (validMask!0 mask!1842))))

(assert (=> start!35640 e!218987))

(assert (=> start!35640 tp_is_empty!8107))

(assert (=> start!35640 true))

(assert (=> start!35640 tp!27711))

(declare-fun array_inv!6918 (array!19767) Bool)

(assert (=> start!35640 (array_inv!6918 _keys!1456)))

(declare-fun array_inv!6919 (array!19765) Bool)

(assert (=> start!35640 (and (array_inv!6919 _values!1208) e!218990)))

(declare-fun mapNonEmpty!13668 () Bool)

(declare-fun tp!27710 () Bool)

(assert (=> mapNonEmpty!13668 (= mapRes!13668 (and tp!27710 e!218986))))

(declare-fun mapValue!13668 () ValueCell!3710)

(declare-fun mapRest!13668 () (Array (_ BitVec 32) ValueCell!3710))

(declare-fun mapKey!13668 () (_ BitVec 32))

(assert (=> mapNonEmpty!13668 (= (arr!9376 _values!1208) (store mapRest!13668 mapKey!13668 mapValue!13668))))

(declare-fun b!357778 () Bool)

(declare-fun res!198840 () Bool)

(assert (=> b!357778 (=> (not res!198840) (not e!218987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357778 (= res!198840 (validKeyInArray!0 k0!1077))))

(declare-fun b!357779 () Bool)

(declare-fun res!198836 () Bool)

(assert (=> b!357779 (=> (not res!198836) (not e!218987))))

(assert (=> b!357779 (= res!198836 (not (= (select (arr!9377 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35640 res!198838) b!357777))

(assert (= (and b!357777 res!198843) b!357775))

(assert (= (and b!357775 res!198841) b!357771))

(assert (= (and b!357771 res!198839) b!357778))

(assert (= (and b!357778 res!198840) b!357772))

(assert (= (and b!357772 res!198837) b!357776))

(assert (= (and b!357776 res!198844) b!357779))

(assert (= (and b!357779 res!198836) b!357773))

(assert (= (and b!357773 (not res!198842)) b!357770))

(assert (= (and b!357768 condMapEmpty!13668) mapIsEmpty!13668))

(assert (= (and b!357768 (not condMapEmpty!13668)) mapNonEmpty!13668))

(get-info :version)

(assert (= (and mapNonEmpty!13668 ((_ is ValueCellFull!3710) mapValue!13668)) b!357774))

(assert (= (and b!357768 ((_ is ValueCellFull!3710) mapDefault!13668)) b!357769))

(assert (= start!35640 b!357768))

(declare-fun m!355257 () Bool)

(assert (=> b!357776 m!355257))

(declare-fun m!355259 () Bool)

(assert (=> b!357778 m!355259))

(declare-fun m!355261 () Bool)

(assert (=> b!357771 m!355261))

(declare-fun m!355263 () Bool)

(assert (=> b!357773 m!355263))

(declare-fun m!355265 () Bool)

(assert (=> b!357773 m!355265))

(declare-fun m!355267 () Bool)

(assert (=> b!357779 m!355267))

(declare-fun m!355269 () Bool)

(assert (=> b!357770 m!355269))

(assert (=> b!357770 m!355269))

(declare-fun m!355271 () Bool)

(assert (=> b!357770 m!355271))

(declare-fun m!355273 () Bool)

(assert (=> b!357770 m!355273))

(declare-fun m!355275 () Bool)

(assert (=> mapNonEmpty!13668 m!355275))

(declare-fun m!355277 () Bool)

(assert (=> start!35640 m!355277))

(declare-fun m!355279 () Bool)

(assert (=> start!35640 m!355279))

(declare-fun m!355281 () Bool)

(assert (=> start!35640 m!355281))

(declare-fun m!355283 () Bool)

(assert (=> b!357775 m!355283))

(check-sat (not b!357778) b_and!15125 (not start!35640) tp_is_empty!8107 (not b!357770) (not b!357773) (not b!357776) (not b!357771) (not mapNonEmpty!13668) (not b!357775) (not b_next!7909))
(check-sat b_and!15125 (not b_next!7909))
