; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108522 () Bool)

(assert start!108522)

(declare-fun b_free!28069 () Bool)

(declare-fun b_next!28069 () Bool)

(assert (=> start!108522 (= b_free!28069 (not b_next!28069))))

(declare-fun tp!99317 () Bool)

(declare-fun b_and!46111 () Bool)

(assert (=> start!108522 (= tp!99317 b_and!46111)))

(declare-fun b!1280871 () Bool)

(declare-fun res!850856 () Bool)

(declare-fun e!731855 () Bool)

(assert (=> b!1280871 (=> (not res!850856) (not e!731855))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84385 0))(
  ( (array!84386 (arr!40697 (Array (_ BitVec 32) (_ BitVec 64))) (size!41249 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84385)

(assert (=> b!1280871 (= res!850856 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41249 _keys!1741)) (not (= (select (arr!40697 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280872 () Bool)

(declare-fun e!731854 () Bool)

(declare-fun tp_is_empty!33709 () Bool)

(assert (=> b!1280872 (= e!731854 tp_is_empty!33709)))

(declare-fun b!1280873 () Bool)

(declare-fun res!850859 () Bool)

(assert (=> b!1280873 (=> (not res!850859) (not e!731855))))

(declare-datatypes ((List!28933 0))(
  ( (Nil!28930) (Cons!28929 (h!30138 (_ BitVec 64)) (t!42465 List!28933)) )
))
(declare-fun arrayNoDuplicates!0 (array!84385 (_ BitVec 32) List!28933) Bool)

(assert (=> b!1280873 (= res!850859 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28930))))

(declare-fun mapIsEmpty!52115 () Bool)

(declare-fun mapRes!52115 () Bool)

(assert (=> mapIsEmpty!52115 mapRes!52115))

(declare-fun b!1280874 () Bool)

(declare-fun e!731853 () Bool)

(assert (=> b!1280874 (= e!731853 (and e!731854 mapRes!52115))))

(declare-fun condMapEmpty!52115 () Bool)

(declare-datatypes ((V!50049 0))(
  ( (V!50050 (val!16929 Int)) )
))
(declare-datatypes ((ValueCell!15956 0))(
  ( (ValueCellFull!15956 (v!19528 V!50049)) (EmptyCell!15956) )
))
(declare-datatypes ((array!84387 0))(
  ( (array!84388 (arr!40698 (Array (_ BitVec 32) ValueCell!15956)) (size!41250 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84387)

(declare-fun mapDefault!52115 () ValueCell!15956)

(assert (=> b!1280874 (= condMapEmpty!52115 (= (arr!40698 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15956)) mapDefault!52115)))))

(declare-fun b!1280875 () Bool)

(declare-fun res!850857 () Bool)

(assert (=> b!1280875 (=> (not res!850857) (not e!731855))))

(declare-fun minValue!1387 () V!50049)

(declare-fun zeroValue!1387 () V!50049)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21740 0))(
  ( (tuple2!21741 (_1!10881 (_ BitVec 64)) (_2!10881 V!50049)) )
))
(declare-datatypes ((List!28934 0))(
  ( (Nil!28931) (Cons!28930 (h!30139 tuple2!21740) (t!42466 List!28934)) )
))
(declare-datatypes ((ListLongMap!19397 0))(
  ( (ListLongMap!19398 (toList!9714 List!28934)) )
))
(declare-fun contains!7759 (ListLongMap!19397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4688 (array!84385 array!84387 (_ BitVec 32) (_ BitVec 32) V!50049 V!50049 (_ BitVec 32) Int) ListLongMap!19397)

(assert (=> b!1280875 (= res!850857 (contains!7759 (getCurrentListMap!4688 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280876 () Bool)

(declare-fun res!850858 () Bool)

(assert (=> b!1280876 (=> (not res!850858) (not e!731855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84385 (_ BitVec 32)) Bool)

(assert (=> b!1280876 (= res!850858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280877 () Bool)

(assert (=> b!1280877 (= e!731855 (not true))))

(assert (=> b!1280877 (contains!7759 (getCurrentListMap!4688 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42257 0))(
  ( (Unit!42258) )
))
(declare-fun lt!575998 () Unit!42257)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!10 (array!84385 array!84387 (_ BitVec 32) (_ BitVec 32) V!50049 V!50049 (_ BitVec 64) (_ BitVec 32) Int) Unit!42257)

(assert (=> b!1280877 (= lt!575998 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!10 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280878 () Bool)

(declare-fun e!731852 () Bool)

(assert (=> b!1280878 (= e!731852 tp_is_empty!33709)))

(declare-fun b!1280879 () Bool)

(declare-fun res!850855 () Bool)

(assert (=> b!1280879 (=> (not res!850855) (not e!731855))))

(assert (=> b!1280879 (= res!850855 (and (= (size!41250 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41249 _keys!1741) (size!41250 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850853 () Bool)

(assert (=> start!108522 (=> (not res!850853) (not e!731855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108522 (= res!850853 (validMask!0 mask!2175))))

(assert (=> start!108522 e!731855))

(assert (=> start!108522 tp_is_empty!33709))

(assert (=> start!108522 true))

(declare-fun array_inv!31051 (array!84387) Bool)

(assert (=> start!108522 (and (array_inv!31051 _values!1445) e!731853)))

(declare-fun array_inv!31052 (array!84385) Bool)

(assert (=> start!108522 (array_inv!31052 _keys!1741)))

(assert (=> start!108522 tp!99317))

(declare-fun mapNonEmpty!52115 () Bool)

(declare-fun tp!99318 () Bool)

(assert (=> mapNonEmpty!52115 (= mapRes!52115 (and tp!99318 e!731852))))

(declare-fun mapValue!52115 () ValueCell!15956)

(declare-fun mapKey!52115 () (_ BitVec 32))

(declare-fun mapRest!52115 () (Array (_ BitVec 32) ValueCell!15956))

(assert (=> mapNonEmpty!52115 (= (arr!40698 _values!1445) (store mapRest!52115 mapKey!52115 mapValue!52115))))

(declare-fun b!1280880 () Bool)

(declare-fun res!850854 () Bool)

(assert (=> b!1280880 (=> (not res!850854) (not e!731855))))

(assert (=> b!1280880 (= res!850854 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41249 _keys!1741))))))

(assert (= (and start!108522 res!850853) b!1280879))

(assert (= (and b!1280879 res!850855) b!1280876))

(assert (= (and b!1280876 res!850858) b!1280873))

(assert (= (and b!1280873 res!850859) b!1280880))

(assert (= (and b!1280880 res!850854) b!1280875))

(assert (= (and b!1280875 res!850857) b!1280871))

(assert (= (and b!1280871 res!850856) b!1280877))

(assert (= (and b!1280874 condMapEmpty!52115) mapIsEmpty!52115))

(assert (= (and b!1280874 (not condMapEmpty!52115)) mapNonEmpty!52115))

(get-info :version)

(assert (= (and mapNonEmpty!52115 ((_ is ValueCellFull!15956) mapValue!52115)) b!1280878))

(assert (= (and b!1280874 ((_ is ValueCellFull!15956) mapDefault!52115)) b!1280872))

(assert (= start!108522 b!1280874))

(declare-fun m!1174953 () Bool)

(assert (=> b!1280877 m!1174953))

(assert (=> b!1280877 m!1174953))

(declare-fun m!1174955 () Bool)

(assert (=> b!1280877 m!1174955))

(declare-fun m!1174957 () Bool)

(assert (=> b!1280877 m!1174957))

(declare-fun m!1174959 () Bool)

(assert (=> b!1280873 m!1174959))

(declare-fun m!1174961 () Bool)

(assert (=> start!108522 m!1174961))

(declare-fun m!1174963 () Bool)

(assert (=> start!108522 m!1174963))

(declare-fun m!1174965 () Bool)

(assert (=> start!108522 m!1174965))

(declare-fun m!1174967 () Bool)

(assert (=> b!1280876 m!1174967))

(declare-fun m!1174969 () Bool)

(assert (=> b!1280875 m!1174969))

(assert (=> b!1280875 m!1174969))

(declare-fun m!1174971 () Bool)

(assert (=> b!1280875 m!1174971))

(declare-fun m!1174973 () Bool)

(assert (=> b!1280871 m!1174973))

(declare-fun m!1174975 () Bool)

(assert (=> mapNonEmpty!52115 m!1174975))

(check-sat b_and!46111 (not b!1280877) (not start!108522) (not b!1280876) (not b_next!28069) (not b!1280873) (not mapNonEmpty!52115) (not b!1280875) tp_is_empty!33709)
(check-sat b_and!46111 (not b_next!28069))
