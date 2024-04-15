; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134032 () Bool)

(assert start!134032)

(declare-fun b_free!32209 () Bool)

(declare-fun b_next!32209 () Bool)

(assert (=> start!134032 (= b_free!32209 (not b_next!32209))))

(declare-fun tp!113947 () Bool)

(declare-fun b_and!51835 () Bool)

(assert (=> start!134032 (= tp!113947 b_and!51835)))

(declare-fun mapIsEmpty!59883 () Bool)

(declare-fun mapRes!59883 () Bool)

(assert (=> mapIsEmpty!59883 mapRes!59883))

(declare-fun b!1566780 () Bool)

(declare-fun res!1070912 () Bool)

(declare-fun e!873332 () Bool)

(assert (=> b!1566780 (=> (not res!1070912) (not e!873332))))

(declare-datatypes ((array!104594 0))(
  ( (array!104595 (arr!50483 (Array (_ BitVec 32) (_ BitVec 64))) (size!51035 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104594)

(declare-datatypes ((List!36692 0))(
  ( (Nil!36689) (Cons!36688 (h!38136 (_ BitVec 64)) (t!51588 List!36692)) )
))
(declare-fun arrayNoDuplicates!0 (array!104594 (_ BitVec 32) List!36692) Bool)

(assert (=> b!1566780 (= res!1070912 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36689))))

(declare-fun res!1070913 () Bool)

(assert (=> start!134032 (=> (not res!1070913) (not e!873332))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134032 (= res!1070913 (validMask!0 mask!947))))

(assert (=> start!134032 e!873332))

(assert (=> start!134032 tp!113947))

(declare-fun tp_is_empty!38989 () Bool)

(assert (=> start!134032 tp_is_empty!38989))

(assert (=> start!134032 true))

(declare-fun array_inv!39425 (array!104594) Bool)

(assert (=> start!134032 (array_inv!39425 _keys!637)))

(declare-datatypes ((V!60193 0))(
  ( (V!60194 (val!19578 Int)) )
))
(declare-datatypes ((ValueCell!18464 0))(
  ( (ValueCellFull!18464 (v!22333 V!60193)) (EmptyCell!18464) )
))
(declare-datatypes ((array!104596 0))(
  ( (array!104597 (arr!50484 (Array (_ BitVec 32) ValueCell!18464)) (size!51036 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104596)

(declare-fun e!873337 () Bool)

(declare-fun array_inv!39426 (array!104596) Bool)

(assert (=> start!134032 (and (array_inv!39426 _values!487) e!873337)))

(declare-fun b!1566781 () Bool)

(declare-fun res!1070915 () Bool)

(assert (=> b!1566781 (=> (not res!1070915) (not e!873332))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566781 (= res!1070915 (not (validKeyInArray!0 (select (arr!50483 _keys!637) from!782))))))

(declare-fun b!1566782 () Bool)

(declare-fun e!873333 () Bool)

(assert (=> b!1566782 (= e!873332 e!873333)))

(declare-fun res!1070914 () Bool)

(assert (=> b!1566782 (=> (not res!1070914) (not e!873333))))

(declare-datatypes ((tuple2!25332 0))(
  ( (tuple2!25333 (_1!12677 (_ BitVec 64)) (_2!12677 V!60193)) )
))
(declare-datatypes ((List!36693 0))(
  ( (Nil!36690) (Cons!36689 (h!38137 tuple2!25332) (t!51589 List!36693)) )
))
(declare-datatypes ((ListLongMap!22767 0))(
  ( (ListLongMap!22768 (toList!11399 List!36693)) )
))
(declare-fun lt!672577 () ListLongMap!22767)

(declare-fun contains!10314 (ListLongMap!22767 (_ BitVec 64)) Bool)

(assert (=> b!1566782 (= res!1070914 (not (contains!10314 lt!672577 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60193)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60193)

(declare-fun getCurrentListMapNoExtraKeys!6749 (array!104594 array!104596 (_ BitVec 32) (_ BitVec 32) V!60193 V!60193 (_ BitVec 32) Int) ListLongMap!22767)

(assert (=> b!1566782 (= lt!672577 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566783 () Bool)

(declare-fun res!1070917 () Bool)

(assert (=> b!1566783 (=> (not res!1070917) (not e!873332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104594 (_ BitVec 32)) Bool)

(assert (=> b!1566783 (= res!1070917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566784 () Bool)

(declare-fun e!873336 () Bool)

(assert (=> b!1566784 (= e!873336 tp_is_empty!38989)))

(declare-fun b!1566785 () Bool)

(declare-fun e!873334 () Bool)

(assert (=> b!1566785 (= e!873337 (and e!873334 mapRes!59883))))

(declare-fun condMapEmpty!59883 () Bool)

(declare-fun mapDefault!59883 () ValueCell!18464)

(assert (=> b!1566785 (= condMapEmpty!59883 (= (arr!50484 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18464)) mapDefault!59883)))))

(declare-fun b!1566786 () Bool)

(declare-fun res!1070911 () Bool)

(assert (=> b!1566786 (=> (not res!1070911) (not e!873332))))

(assert (=> b!1566786 (= res!1070911 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51035 _keys!637)) (bvslt from!782 (size!51035 _keys!637))))))

(declare-fun b!1566787 () Bool)

(assert (=> b!1566787 (= e!873334 tp_is_empty!38989)))

(declare-fun b!1566788 () Bool)

(assert (=> b!1566788 (= e!873333 false)))

(declare-fun lt!672576 () Bool)

(assert (=> b!1566788 (= lt!672576 (contains!10314 lt!672577 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59883 () Bool)

(declare-fun tp!113946 () Bool)

(assert (=> mapNonEmpty!59883 (= mapRes!59883 (and tp!113946 e!873336))))

(declare-fun mapKey!59883 () (_ BitVec 32))

(declare-fun mapRest!59883 () (Array (_ BitVec 32) ValueCell!18464))

(declare-fun mapValue!59883 () ValueCell!18464)

(assert (=> mapNonEmpty!59883 (= (arr!50484 _values!487) (store mapRest!59883 mapKey!59883 mapValue!59883))))

(declare-fun b!1566789 () Bool)

(declare-fun res!1070916 () Bool)

(assert (=> b!1566789 (=> (not res!1070916) (not e!873332))))

(assert (=> b!1566789 (= res!1070916 (and (= (size!51036 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51035 _keys!637) (size!51036 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!134032 res!1070913) b!1566789))

(assert (= (and b!1566789 res!1070916) b!1566783))

(assert (= (and b!1566783 res!1070917) b!1566780))

(assert (= (and b!1566780 res!1070912) b!1566786))

(assert (= (and b!1566786 res!1070911) b!1566781))

(assert (= (and b!1566781 res!1070915) b!1566782))

(assert (= (and b!1566782 res!1070914) b!1566788))

(assert (= (and b!1566785 condMapEmpty!59883) mapIsEmpty!59883))

(assert (= (and b!1566785 (not condMapEmpty!59883)) mapNonEmpty!59883))

(get-info :version)

(assert (= (and mapNonEmpty!59883 ((_ is ValueCellFull!18464) mapValue!59883)) b!1566784))

(assert (= (and b!1566785 ((_ is ValueCellFull!18464) mapDefault!59883)) b!1566787))

(assert (= start!134032 b!1566785))

(declare-fun m!1441153 () Bool)

(assert (=> start!134032 m!1441153))

(declare-fun m!1441155 () Bool)

(assert (=> start!134032 m!1441155))

(declare-fun m!1441157 () Bool)

(assert (=> start!134032 m!1441157))

(declare-fun m!1441159 () Bool)

(assert (=> b!1566781 m!1441159))

(assert (=> b!1566781 m!1441159))

(declare-fun m!1441161 () Bool)

(assert (=> b!1566781 m!1441161))

(declare-fun m!1441163 () Bool)

(assert (=> mapNonEmpty!59883 m!1441163))

(declare-fun m!1441165 () Bool)

(assert (=> b!1566782 m!1441165))

(declare-fun m!1441167 () Bool)

(assert (=> b!1566782 m!1441167))

(declare-fun m!1441169 () Bool)

(assert (=> b!1566780 m!1441169))

(declare-fun m!1441171 () Bool)

(assert (=> b!1566783 m!1441171))

(declare-fun m!1441173 () Bool)

(assert (=> b!1566788 m!1441173))

(check-sat (not b!1566782) (not b!1566781) (not b_next!32209) (not b!1566780) tp_is_empty!38989 (not b!1566783) (not start!134032) (not mapNonEmpty!59883) (not b!1566788) b_and!51835)
(check-sat b_and!51835 (not b_next!32209))
