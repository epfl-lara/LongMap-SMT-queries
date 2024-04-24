; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82804 () Bool)

(assert start!82804)

(declare-fun b_free!18769 () Bool)

(declare-fun b_next!18769 () Bool)

(assert (=> start!82804 (= b_free!18769 (not b_next!18769))))

(declare-fun tp!65427 () Bool)

(declare-fun b_and!30267 () Bool)

(assert (=> start!82804 (= tp!65427 b_and!30267)))

(declare-fun b!964164 () Bool)

(declare-fun e!543735 () Bool)

(declare-fun tp_is_empty!21571 () Bool)

(assert (=> b!964164 (= e!543735 tp_is_empty!21571)))

(declare-fun b!964165 () Bool)

(declare-fun e!543737 () Bool)

(assert (=> b!964165 (= e!543737 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33745 0))(
  ( (V!33746 (val!10836 Int)) )
))
(declare-datatypes ((ValueCell!10304 0))(
  ( (ValueCellFull!10304 (v!13391 V!33745)) (EmptyCell!10304) )
))
(declare-datatypes ((array!59254 0))(
  ( (array!59255 (arr!28491 (Array (_ BitVec 32) ValueCell!10304)) (size!28971 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59254)

(declare-datatypes ((array!59256 0))(
  ( (array!59257 (arr!28492 (Array (_ BitVec 32) (_ BitVec 64))) (size!28972 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59256)

(declare-fun minValue!1342 () V!33745)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33745)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13902 0))(
  ( (tuple2!13903 (_1!6962 (_ BitVec 64)) (_2!6962 V!33745)) )
))
(declare-datatypes ((List!19754 0))(
  ( (Nil!19751) (Cons!19750 (h!20918 tuple2!13902) (t!28109 List!19754)) )
))
(declare-datatypes ((ListLongMap!12601 0))(
  ( (ListLongMap!12602 (toList!6316 List!19754)) )
))
(declare-fun contains!5431 (ListLongMap!12601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3549 (array!59256 array!59254 (_ BitVec 32) (_ BitVec 32) V!33745 V!33745 (_ BitVec 32) Int) ListLongMap!12601)

(assert (=> b!964165 (contains!5431 (getCurrentListMap!3549 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28492 _keys!1686) i!803))))

(declare-datatypes ((Unit!32192 0))(
  ( (Unit!32193) )
))
(declare-fun lt!431318 () Unit!32192)

(declare-fun lemmaInListMapFromThenInFromMinusOne!10 (array!59256 array!59254 (_ BitVec 32) (_ BitVec 32) V!33745 V!33745 (_ BitVec 32) (_ BitVec 32) Int) Unit!32192)

(assert (=> b!964165 (= lt!431318 (lemmaInListMapFromThenInFromMinusOne!10 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34351 () Bool)

(declare-fun mapRes!34351 () Bool)

(declare-fun tp!65428 () Bool)

(declare-fun e!543733 () Bool)

(assert (=> mapNonEmpty!34351 (= mapRes!34351 (and tp!65428 e!543733))))

(declare-fun mapValue!34351 () ValueCell!10304)

(declare-fun mapKey!34351 () (_ BitVec 32))

(declare-fun mapRest!34351 () (Array (_ BitVec 32) ValueCell!10304))

(assert (=> mapNonEmpty!34351 (= (arr!28491 _values!1400) (store mapRest!34351 mapKey!34351 mapValue!34351))))

(declare-fun b!964166 () Bool)

(declare-fun res!645008 () Bool)

(assert (=> b!964166 (=> (not res!645008) (not e!543737))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964166 (= res!645008 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964167 () Bool)

(declare-fun res!645013 () Bool)

(assert (=> b!964167 (=> (not res!645013) (not e!543737))))

(assert (=> b!964167 (= res!645013 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28972 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28972 _keys!1686))))))

(declare-fun b!964168 () Bool)

(declare-fun res!645011 () Bool)

(assert (=> b!964168 (=> (not res!645011) (not e!543737))))

(assert (=> b!964168 (= res!645011 (and (= (size!28971 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28972 _keys!1686) (size!28971 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964169 () Bool)

(declare-fun res!645014 () Bool)

(assert (=> b!964169 (=> (not res!645014) (not e!543737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964169 (= res!645014 (validKeyInArray!0 (select (arr!28492 _keys!1686) i!803)))))

(declare-fun b!964170 () Bool)

(declare-fun e!543736 () Bool)

(assert (=> b!964170 (= e!543736 (and e!543735 mapRes!34351))))

(declare-fun condMapEmpty!34351 () Bool)

(declare-fun mapDefault!34351 () ValueCell!10304)

(assert (=> b!964170 (= condMapEmpty!34351 (= (arr!28491 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10304)) mapDefault!34351)))))

(declare-fun res!645010 () Bool)

(assert (=> start!82804 (=> (not res!645010) (not e!543737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82804 (= res!645010 (validMask!0 mask!2110))))

(assert (=> start!82804 e!543737))

(assert (=> start!82804 true))

(declare-fun array_inv!22137 (array!59254) Bool)

(assert (=> start!82804 (and (array_inv!22137 _values!1400) e!543736)))

(declare-fun array_inv!22138 (array!59256) Bool)

(assert (=> start!82804 (array_inv!22138 _keys!1686)))

(assert (=> start!82804 tp!65427))

(assert (=> start!82804 tp_is_empty!21571))

(declare-fun b!964171 () Bool)

(declare-fun res!645012 () Bool)

(assert (=> b!964171 (=> (not res!645012) (not e!543737))))

(assert (=> b!964171 (= res!645012 (contains!5431 (getCurrentListMap!3549 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28492 _keys!1686) i!803)))))

(declare-fun b!964172 () Bool)

(declare-fun res!645009 () Bool)

(assert (=> b!964172 (=> (not res!645009) (not e!543737))))

(declare-datatypes ((List!19755 0))(
  ( (Nil!19752) (Cons!19751 (h!20919 (_ BitVec 64)) (t!28110 List!19755)) )
))
(declare-fun arrayNoDuplicates!0 (array!59256 (_ BitVec 32) List!19755) Bool)

(assert (=> b!964172 (= res!645009 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19752))))

(declare-fun mapIsEmpty!34351 () Bool)

(assert (=> mapIsEmpty!34351 mapRes!34351))

(declare-fun b!964173 () Bool)

(assert (=> b!964173 (= e!543733 tp_is_empty!21571)))

(declare-fun b!964174 () Bool)

(declare-fun res!645015 () Bool)

(assert (=> b!964174 (=> (not res!645015) (not e!543737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59256 (_ BitVec 32)) Bool)

(assert (=> b!964174 (= res!645015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82804 res!645010) b!964168))

(assert (= (and b!964168 res!645011) b!964174))

(assert (= (and b!964174 res!645015) b!964172))

(assert (= (and b!964172 res!645009) b!964167))

(assert (= (and b!964167 res!645013) b!964169))

(assert (= (and b!964169 res!645014) b!964171))

(assert (= (and b!964171 res!645012) b!964166))

(assert (= (and b!964166 res!645008) b!964165))

(assert (= (and b!964170 condMapEmpty!34351) mapIsEmpty!34351))

(assert (= (and b!964170 (not condMapEmpty!34351)) mapNonEmpty!34351))

(get-info :version)

(assert (= (and mapNonEmpty!34351 ((_ is ValueCellFull!10304) mapValue!34351)) b!964173))

(assert (= (and b!964170 ((_ is ValueCellFull!10304) mapDefault!34351)) b!964164))

(assert (= start!82804 b!964170))

(declare-fun m!894013 () Bool)

(assert (=> b!964174 m!894013))

(declare-fun m!894015 () Bool)

(assert (=> b!964165 m!894015))

(declare-fun m!894017 () Bool)

(assert (=> b!964165 m!894017))

(assert (=> b!964165 m!894015))

(assert (=> b!964165 m!894017))

(declare-fun m!894019 () Bool)

(assert (=> b!964165 m!894019))

(declare-fun m!894021 () Bool)

(assert (=> b!964165 m!894021))

(declare-fun m!894023 () Bool)

(assert (=> b!964171 m!894023))

(assert (=> b!964171 m!894017))

(assert (=> b!964171 m!894023))

(assert (=> b!964171 m!894017))

(declare-fun m!894025 () Bool)

(assert (=> b!964171 m!894025))

(declare-fun m!894027 () Bool)

(assert (=> start!82804 m!894027))

(declare-fun m!894029 () Bool)

(assert (=> start!82804 m!894029))

(declare-fun m!894031 () Bool)

(assert (=> start!82804 m!894031))

(declare-fun m!894033 () Bool)

(assert (=> b!964172 m!894033))

(declare-fun m!894035 () Bool)

(assert (=> mapNonEmpty!34351 m!894035))

(assert (=> b!964169 m!894017))

(assert (=> b!964169 m!894017))

(declare-fun m!894037 () Bool)

(assert (=> b!964169 m!894037))

(check-sat b_and!30267 (not start!82804) (not b!964174) (not b!964171) tp_is_empty!21571 (not b!964172) (not b!964165) (not b!964169) (not b_next!18769) (not mapNonEmpty!34351))
(check-sat b_and!30267 (not b_next!18769))
