; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134338 () Bool)

(assert start!134338)

(declare-fun b_free!32149 () Bool)

(declare-fun b_next!32149 () Bool)

(assert (=> start!134338 (= b_free!32149 (not b_next!32149))))

(declare-fun tp!113748 () Bool)

(declare-fun b_and!51741 () Bool)

(assert (=> start!134338 (= tp!113748 b_and!51741)))

(declare-fun b!1567957 () Bool)

(declare-fun res!1071011 () Bool)

(declare-fun e!874116 () Bool)

(assert (=> b!1567957 (=> (not res!1071011) (not e!874116))))

(declare-datatypes ((array!104656 0))(
  ( (array!104657 (arr!50508 (Array (_ BitVec 32) (_ BitVec 64))) (size!51059 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104656)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567957 (= res!1071011 (validKeyInArray!0 (select (arr!50508 _keys!637) from!782)))))

(declare-fun b!1567958 () Bool)

(declare-fun res!1071013 () Bool)

(assert (=> b!1567958 (=> (not res!1071013) (not e!874116))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60105 0))(
  ( (V!60106 (val!19545 Int)) )
))
(declare-datatypes ((ValueCell!18431 0))(
  ( (ValueCellFull!18431 (v!22293 V!60105)) (EmptyCell!18431) )
))
(declare-datatypes ((array!104658 0))(
  ( (array!104659 (arr!50509 (Array (_ BitVec 32) ValueCell!18431)) (size!51060 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104658)

(assert (=> b!1567958 (= res!1071013 (and (= (size!51060 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51059 _keys!637) (size!51060 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59776 () Bool)

(declare-fun mapRes!59776 () Bool)

(declare-fun tp!113749 () Bool)

(declare-fun e!874117 () Bool)

(assert (=> mapNonEmpty!59776 (= mapRes!59776 (and tp!113749 e!874117))))

(declare-fun mapKey!59776 () (_ BitVec 32))

(declare-fun mapValue!59776 () ValueCell!18431)

(declare-fun mapRest!59776 () (Array (_ BitVec 32) ValueCell!18431))

(assert (=> mapNonEmpty!59776 (= (arr!50509 _values!487) (store mapRest!59776 mapKey!59776 mapValue!59776))))

(declare-fun b!1567959 () Bool)

(declare-fun res!1071012 () Bool)

(assert (=> b!1567959 (=> (not res!1071012) (not e!874116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104656 (_ BitVec 32)) Bool)

(assert (=> b!1567959 (= res!1071012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567960 () Bool)

(declare-fun res!1071010 () Bool)

(assert (=> b!1567960 (=> (not res!1071010) (not e!874116))))

(assert (=> b!1567960 (= res!1071010 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51059 _keys!637)) (bvslt from!782 (size!51059 _keys!637))))))

(declare-fun b!1567961 () Bool)

(assert (=> b!1567961 (= e!874116 (not (bvslt from!782 (size!51060 _values!487))))))

(declare-fun lt!673203 () V!60105)

(declare-datatypes ((tuple2!25268 0))(
  ( (tuple2!25269 (_1!12645 (_ BitVec 64)) (_2!12645 V!60105)) )
))
(declare-datatypes ((List!36634 0))(
  ( (Nil!36631) (Cons!36630 (h!38094 tuple2!25268) (t!51489 List!36634)) )
))
(declare-datatypes ((ListLongMap!22711 0))(
  ( (ListLongMap!22712 (toList!11371 List!36634)) )
))
(declare-fun lt!673202 () ListLongMap!22711)

(declare-fun contains!10374 (ListLongMap!22711 (_ BitVec 64)) Bool)

(declare-fun +!5109 (ListLongMap!22711 tuple2!25268) ListLongMap!22711)

(assert (=> b!1567961 (not (contains!10374 (+!5109 lt!673202 (tuple2!25269 (select (arr!50508 _keys!637) from!782) lt!673203)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51913 0))(
  ( (Unit!51914) )
))
(declare-fun lt!673204 () Unit!51913)

(declare-fun addStillNotContains!560 (ListLongMap!22711 (_ BitVec 64) V!60105 (_ BitVec 64)) Unit!51913)

(assert (=> b!1567961 (= lt!673204 (addStillNotContains!560 lt!673202 (select (arr!50508 _keys!637) from!782) lt!673203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26375 (ValueCell!18431 V!60105) V!60105)

(declare-fun dynLambda!3907 (Int (_ BitVec 64)) V!60105)

(assert (=> b!1567961 (= lt!673203 (get!26375 (select (arr!50509 _values!487) from!782) (dynLambda!3907 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60105)

(declare-fun minValue!453 () V!60105)

(declare-fun getCurrentListMapNoExtraKeys!6754 (array!104656 array!104658 (_ BitVec 32) (_ BitVec 32) V!60105 V!60105 (_ BitVec 32) Int) ListLongMap!22711)

(assert (=> b!1567961 (= lt!673202 (getCurrentListMapNoExtraKeys!6754 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567962 () Bool)

(declare-fun res!1071014 () Bool)

(assert (=> b!1567962 (=> (not res!1071014) (not e!874116))))

(declare-datatypes ((List!36635 0))(
  ( (Nil!36632) (Cons!36631 (h!38095 (_ BitVec 64)) (t!51490 List!36635)) )
))
(declare-fun arrayNoDuplicates!0 (array!104656 (_ BitVec 32) List!36635) Bool)

(assert (=> b!1567962 (= res!1071014 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36632))))

(declare-fun b!1567963 () Bool)

(declare-fun e!874119 () Bool)

(declare-fun e!874120 () Bool)

(assert (=> b!1567963 (= e!874119 (and e!874120 mapRes!59776))))

(declare-fun condMapEmpty!59776 () Bool)

(declare-fun mapDefault!59776 () ValueCell!18431)

(assert (=> b!1567963 (= condMapEmpty!59776 (= (arr!50509 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18431)) mapDefault!59776)))))

(declare-fun mapIsEmpty!59776 () Bool)

(assert (=> mapIsEmpty!59776 mapRes!59776))

(declare-fun res!1071015 () Bool)

(assert (=> start!134338 (=> (not res!1071015) (not e!874116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134338 (= res!1071015 (validMask!0 mask!947))))

(assert (=> start!134338 e!874116))

(assert (=> start!134338 tp!113748))

(declare-fun tp_is_empty!38923 () Bool)

(assert (=> start!134338 tp_is_empty!38923))

(assert (=> start!134338 true))

(declare-fun array_inv!39491 (array!104656) Bool)

(assert (=> start!134338 (array_inv!39491 _keys!637)))

(declare-fun array_inv!39492 (array!104658) Bool)

(assert (=> start!134338 (and (array_inv!39492 _values!487) e!874119)))

(declare-fun b!1567964 () Bool)

(assert (=> b!1567964 (= e!874120 tp_is_empty!38923)))

(declare-fun b!1567965 () Bool)

(assert (=> b!1567965 (= e!874117 tp_is_empty!38923)))

(assert (= (and start!134338 res!1071015) b!1567958))

(assert (= (and b!1567958 res!1071013) b!1567959))

(assert (= (and b!1567959 res!1071012) b!1567962))

(assert (= (and b!1567962 res!1071014) b!1567960))

(assert (= (and b!1567960 res!1071010) b!1567957))

(assert (= (and b!1567957 res!1071011) b!1567961))

(assert (= (and b!1567963 condMapEmpty!59776) mapIsEmpty!59776))

(assert (= (and b!1567963 (not condMapEmpty!59776)) mapNonEmpty!59776))

(get-info :version)

(assert (= (and mapNonEmpty!59776 ((_ is ValueCellFull!18431) mapValue!59776)) b!1567965))

(assert (= (and b!1567963 ((_ is ValueCellFull!18431) mapDefault!59776)) b!1567964))

(assert (= start!134338 b!1567963))

(declare-fun b_lambda!24957 () Bool)

(assert (=> (not b_lambda!24957) (not b!1567961)))

(declare-fun t!51488 () Bool)

(declare-fun tb!12609 () Bool)

(assert (=> (and start!134338 (= defaultEntry!495 defaultEntry!495) t!51488) tb!12609))

(declare-fun result!26517 () Bool)

(assert (=> tb!12609 (= result!26517 tp_is_empty!38923)))

(assert (=> b!1567961 t!51488))

(declare-fun b_and!51743 () Bool)

(assert (= b_and!51741 (and (=> t!51488 result!26517) b_and!51743)))

(declare-fun m!1442683 () Bool)

(assert (=> b!1567957 m!1442683))

(assert (=> b!1567957 m!1442683))

(declare-fun m!1442685 () Bool)

(assert (=> b!1567957 m!1442685))

(declare-fun m!1442687 () Bool)

(assert (=> mapNonEmpty!59776 m!1442687))

(declare-fun m!1442689 () Bool)

(assert (=> b!1567959 m!1442689))

(declare-fun m!1442691 () Bool)

(assert (=> b!1567961 m!1442691))

(assert (=> b!1567961 m!1442683))

(declare-fun m!1442693 () Bool)

(assert (=> b!1567961 m!1442693))

(declare-fun m!1442695 () Bool)

(assert (=> b!1567961 m!1442695))

(assert (=> b!1567961 m!1442683))

(declare-fun m!1442697 () Bool)

(assert (=> b!1567961 m!1442697))

(declare-fun m!1442699 () Bool)

(assert (=> b!1567961 m!1442699))

(declare-fun m!1442701 () Bool)

(assert (=> b!1567961 m!1442701))

(assert (=> b!1567961 m!1442693))

(assert (=> b!1567961 m!1442691))

(assert (=> b!1567961 m!1442699))

(declare-fun m!1442703 () Bool)

(assert (=> b!1567961 m!1442703))

(declare-fun m!1442705 () Bool)

(assert (=> start!134338 m!1442705))

(declare-fun m!1442707 () Bool)

(assert (=> start!134338 m!1442707))

(declare-fun m!1442709 () Bool)

(assert (=> start!134338 m!1442709))

(declare-fun m!1442711 () Bool)

(assert (=> b!1567962 m!1442711))

(check-sat (not b_next!32149) (not mapNonEmpty!59776) tp_is_empty!38923 (not b!1567957) (not b_lambda!24957) (not start!134338) (not b!1567959) (not b!1567961) b_and!51743 (not b!1567962))
(check-sat b_and!51743 (not b_next!32149))
