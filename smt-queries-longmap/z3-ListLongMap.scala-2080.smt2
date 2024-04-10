; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35650 () Bool)

(assert start!35650)

(declare-fun b_free!7905 () Bool)

(declare-fun b_next!7905 () Bool)

(assert (=> start!35650 (= b_free!7905 (not b_next!7905))))

(declare-fun tp!27698 () Bool)

(declare-fun b_and!15147 () Bool)

(assert (=> start!35650 (= tp!27698 b_and!15147)))

(declare-fun b!357971 () Bool)

(declare-fun e!219126 () Bool)

(declare-fun tp_is_empty!8103 () Bool)

(assert (=> b!357971 (= e!219126 tp_is_empty!8103)))

(declare-fun b!357972 () Bool)

(declare-fun e!219129 () Bool)

(assert (=> b!357972 (= e!219129 tp_is_empty!8103)))

(declare-fun mapNonEmpty!13662 () Bool)

(declare-fun mapRes!13662 () Bool)

(declare-fun tp!27699 () Bool)

(assert (=> mapNonEmpty!13662 (= mapRes!13662 (and tp!27699 e!219126))))

(declare-fun mapKey!13662 () (_ BitVec 32))

(declare-datatypes ((V!11781 0))(
  ( (V!11782 (val!4096 Int)) )
))
(declare-datatypes ((ValueCell!3708 0))(
  ( (ValueCellFull!3708 (v!6290 V!11781)) (EmptyCell!3708) )
))
(declare-datatypes ((array!19773 0))(
  ( (array!19774 (arr!9380 (Array (_ BitVec 32) ValueCell!3708)) (size!9732 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19773)

(declare-fun mapRest!13662 () (Array (_ BitVec 32) ValueCell!3708))

(declare-fun mapValue!13662 () ValueCell!3708)

(assert (=> mapNonEmpty!13662 (= (arr!9380 _values!1208) (store mapRest!13662 mapKey!13662 mapValue!13662))))

(declare-fun b!357973 () Bool)

(declare-fun res!198919 () Bool)

(declare-fun e!219128 () Bool)

(assert (=> b!357973 (=> (not res!198919) (not e!219128))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19775 0))(
  ( (array!19776 (arr!9381 (Array (_ BitVec 32) (_ BitVec 64))) (size!9733 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19775)

(assert (=> b!357973 (= res!198919 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9733 _keys!1456))))))

(declare-fun res!198917 () Bool)

(assert (=> start!35650 (=> (not res!198917) (not e!219128))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35650 (= res!198917 (validMask!0 mask!1842))))

(assert (=> start!35650 e!219128))

(assert (=> start!35650 tp_is_empty!8103))

(assert (=> start!35650 true))

(assert (=> start!35650 tp!27698))

(declare-fun array_inv!6894 (array!19775) Bool)

(assert (=> start!35650 (array_inv!6894 _keys!1456)))

(declare-fun e!219127 () Bool)

(declare-fun array_inv!6895 (array!19773) Bool)

(assert (=> start!35650 (and (array_inv!6895 _values!1208) e!219127)))

(declare-fun b!357974 () Bool)

(assert (=> b!357974 (= e!219127 (and e!219129 mapRes!13662))))

(declare-fun condMapEmpty!13662 () Bool)

(declare-fun mapDefault!13662 () ValueCell!3708)

(assert (=> b!357974 (= condMapEmpty!13662 (= (arr!9380 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3708)) mapDefault!13662)))))

(declare-fun b!357975 () Bool)

(declare-fun res!198911 () Bool)

(assert (=> b!357975 (=> (not res!198911) (not e!219128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19775 (_ BitVec 32)) Bool)

(assert (=> b!357975 (= res!198911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357976 () Bool)

(declare-fun res!198915 () Bool)

(assert (=> b!357976 (=> (not res!198915) (not e!219128))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357976 (= res!198915 (validKeyInArray!0 k0!1077))))

(declare-fun b!357977 () Bool)

(declare-fun res!198912 () Bool)

(assert (=> b!357977 (=> (not res!198912) (not e!219128))))

(declare-fun arrayContainsKey!0 (array!19775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357977 (= res!198912 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13662 () Bool)

(assert (=> mapIsEmpty!13662 mapRes!13662))

(declare-fun b!357978 () Bool)

(declare-fun res!198913 () Bool)

(assert (=> b!357978 (=> (not res!198913) (not e!219128))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357978 (= res!198913 (and (= (size!9732 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9733 _keys!1456) (size!9732 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357979 () Bool)

(declare-fun res!198916 () Bool)

(assert (=> b!357979 (=> (not res!198916) (not e!219128))))

(assert (=> b!357979 (= res!198916 (not (= (select (arr!9381 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357980 () Bool)

(declare-fun e!219131 () Bool)

(assert (=> b!357980 (= e!219128 (not e!219131))))

(declare-fun res!198918 () Bool)

(assert (=> b!357980 (=> res!198918 e!219131)))

(assert (=> b!357980 (= res!198918 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9733 _keys!1456))))))

(assert (=> b!357980 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11781)

(declare-datatypes ((Unit!11038 0))(
  ( (Unit!11039) )
))
(declare-fun lt!166129 () Unit!11038)

(declare-fun zeroValue!1150 () V!11781)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!37 (array!19775 array!19773 (_ BitVec 32) (_ BitVec 32) V!11781 V!11781 (_ BitVec 64) (_ BitVec 32)) Unit!11038)

(assert (=> b!357980 (= lt!166129 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!37 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357981 () Bool)

(declare-fun res!198914 () Bool)

(assert (=> b!357981 (=> (not res!198914) (not e!219128))))

(declare-datatypes ((List!5414 0))(
  ( (Nil!5411) (Cons!5410 (h!6266 (_ BitVec 64)) (t!10564 List!5414)) )
))
(declare-fun arrayNoDuplicates!0 (array!19775 (_ BitVec 32) List!5414) Bool)

(assert (=> b!357981 (= res!198914 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5411))))

(declare-fun b!357982 () Bool)

(assert (=> b!357982 (= e!219131 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5720 0))(
  ( (tuple2!5721 (_1!2871 (_ BitVec 64)) (_2!2871 V!11781)) )
))
(declare-datatypes ((List!5415 0))(
  ( (Nil!5412) (Cons!5411 (h!6267 tuple2!5720) (t!10565 List!5415)) )
))
(declare-datatypes ((ListLongMap!4633 0))(
  ( (ListLongMap!4634 (toList!2332 List!5415)) )
))
(declare-fun contains!2412 (ListLongMap!4633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1853 (array!19775 array!19773 (_ BitVec 32) (_ BitVec 32) V!11781 V!11781 (_ BitVec 32) Int) ListLongMap!4633)

(assert (=> b!357982 (contains!2412 (getCurrentListMap!1853 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166130 () Unit!11038)

(declare-fun lemmaArrayContainsKeyThenInListMap!348 (array!19775 array!19773 (_ BitVec 32) (_ BitVec 32) V!11781 V!11781 (_ BitVec 64) (_ BitVec 32) Int) Unit!11038)

(assert (=> b!357982 (= lt!166130 (lemmaArrayContainsKeyThenInListMap!348 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(assert (= (and start!35650 res!198917) b!357978))

(assert (= (and b!357978 res!198913) b!357975))

(assert (= (and b!357975 res!198911) b!357981))

(assert (= (and b!357981 res!198914) b!357976))

(assert (= (and b!357976 res!198915) b!357973))

(assert (= (and b!357973 res!198919) b!357977))

(assert (= (and b!357977 res!198912) b!357979))

(assert (= (and b!357979 res!198916) b!357980))

(assert (= (and b!357980 (not res!198918)) b!357982))

(assert (= (and b!357974 condMapEmpty!13662) mapIsEmpty!13662))

(assert (= (and b!357974 (not condMapEmpty!13662)) mapNonEmpty!13662))

(get-info :version)

(assert (= (and mapNonEmpty!13662 ((_ is ValueCellFull!3708) mapValue!13662)) b!357971))

(assert (= (and b!357974 ((_ is ValueCellFull!3708) mapDefault!13662)) b!357972))

(assert (= start!35650 b!357974))

(declare-fun m!355931 () Bool)

(assert (=> b!357975 m!355931))

(declare-fun m!355933 () Bool)

(assert (=> b!357977 m!355933))

(declare-fun m!355935 () Bool)

(assert (=> b!357976 m!355935))

(declare-fun m!355937 () Bool)

(assert (=> mapNonEmpty!13662 m!355937))

(declare-fun m!355939 () Bool)

(assert (=> b!357980 m!355939))

(declare-fun m!355941 () Bool)

(assert (=> b!357980 m!355941))

(declare-fun m!355943 () Bool)

(assert (=> start!35650 m!355943))

(declare-fun m!355945 () Bool)

(assert (=> start!35650 m!355945))

(declare-fun m!355947 () Bool)

(assert (=> start!35650 m!355947))

(declare-fun m!355949 () Bool)

(assert (=> b!357981 m!355949))

(declare-fun m!355951 () Bool)

(assert (=> b!357979 m!355951))

(declare-fun m!355953 () Bool)

(assert (=> b!357982 m!355953))

(assert (=> b!357982 m!355953))

(declare-fun m!355955 () Bool)

(assert (=> b!357982 m!355955))

(declare-fun m!355957 () Bool)

(assert (=> b!357982 m!355957))

(check-sat (not b!357976) (not b!357981) b_and!15147 (not mapNonEmpty!13662) (not b!357975) (not b_next!7905) (not b!357977) (not b!357980) tp_is_empty!8103 (not start!35650) (not b!357982))
(check-sat b_and!15147 (not b_next!7905))
