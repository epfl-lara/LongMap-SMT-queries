; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4448 () Bool)

(assert start!4448)

(declare-fun b_free!1209 () Bool)

(declare-fun b_next!1209 () Bool)

(assert (=> start!4448 (= b_free!1209 (not b_next!1209))))

(declare-fun tp!5065 () Bool)

(declare-fun b_and!2031 () Bool)

(assert (=> start!4448 (= tp!5065 b_and!2031)))

(declare-fun mapIsEmpty!1891 () Bool)

(declare-fun mapRes!1891 () Bool)

(assert (=> mapIsEmpty!1891 mapRes!1891))

(declare-fun b!34352 () Bool)

(declare-fun e!21802 () Bool)

(declare-fun e!21803 () Bool)

(assert (=> b!34352 (= e!21802 (and e!21803 mapRes!1891))))

(declare-fun condMapEmpty!1891 () Bool)

(declare-datatypes ((V!1909 0))(
  ( (V!1910 (val!808 Int)) )
))
(declare-datatypes ((ValueCell!582 0))(
  ( (ValueCellFull!582 (v!1903 V!1909)) (EmptyCell!582) )
))
(declare-datatypes ((array!2343 0))(
  ( (array!2344 (arr!1119 (Array (_ BitVec 32) ValueCell!582)) (size!1220 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2343)

(declare-fun mapDefault!1891 () ValueCell!582)

(assert (=> b!34352 (= condMapEmpty!1891 (= (arr!1119 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!582)) mapDefault!1891)))))

(declare-fun b!34353 () Bool)

(declare-fun res!20832 () Bool)

(declare-fun e!21805 () Bool)

(assert (=> b!34353 (=> (not res!20832) (not e!21805))))

(declare-datatypes ((array!2345 0))(
  ( (array!2346 (arr!1120 (Array (_ BitVec 32) (_ BitVec 64))) (size!1221 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2345)

(declare-datatypes ((List!903 0))(
  ( (Nil!900) (Cons!899 (h!1466 (_ BitVec 64)) (t!3608 List!903)) )
))
(declare-fun arrayNoDuplicates!0 (array!2345 (_ BitVec 32) List!903) Bool)

(assert (=> b!34353 (= res!20832 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!900))))

(declare-fun b!34354 () Bool)

(declare-fun res!20830 () Bool)

(assert (=> b!34354 (=> (not res!20830) (not e!21805))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34354 (= res!20830 (and (= (size!1220 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1221 _keys!1833) (size!1220 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34355 () Bool)

(declare-fun res!20826 () Bool)

(assert (=> b!34355 (=> (not res!20826) (not e!21805))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1909)

(declare-fun minValue!1443 () V!1909)

(declare-datatypes ((tuple2!1316 0))(
  ( (tuple2!1317 (_1!669 (_ BitVec 64)) (_2!669 V!1909)) )
))
(declare-datatypes ((List!904 0))(
  ( (Nil!901) (Cons!900 (h!1467 tuple2!1316) (t!3609 List!904)) )
))
(declare-datatypes ((ListLongMap!893 0))(
  ( (ListLongMap!894 (toList!462 List!904)) )
))
(declare-fun contains!408 (ListLongMap!893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!286 (array!2345 array!2343 (_ BitVec 32) (_ BitVec 32) V!1909 V!1909 (_ BitVec 32) Int) ListLongMap!893)

(assert (=> b!34355 (= res!20826 (not (contains!408 (getCurrentListMap!286 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34356 () Bool)

(assert (=> b!34356 (= e!21805 false)))

(declare-datatypes ((SeekEntryResult!141 0))(
  ( (MissingZero!141 (index!2686 (_ BitVec 32))) (Found!141 (index!2687 (_ BitVec 32))) (Intermediate!141 (undefined!953 Bool) (index!2688 (_ BitVec 32)) (x!6903 (_ BitVec 32))) (Undefined!141) (MissingVacant!141 (index!2689 (_ BitVec 32))) )
))
(declare-fun lt!12771 () SeekEntryResult!141)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2345 (_ BitVec 32)) SeekEntryResult!141)

(assert (=> b!34356 (= lt!12771 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!20827 () Bool)

(assert (=> start!4448 (=> (not res!20827) (not e!21805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4448 (= res!20827 (validMask!0 mask!2294))))

(assert (=> start!4448 e!21805))

(assert (=> start!4448 true))

(assert (=> start!4448 tp!5065))

(declare-fun array_inv!789 (array!2343) Bool)

(assert (=> start!4448 (and (array_inv!789 _values!1501) e!21802)))

(declare-fun array_inv!790 (array!2345) Bool)

(assert (=> start!4448 (array_inv!790 _keys!1833)))

(declare-fun tp_is_empty!1563 () Bool)

(assert (=> start!4448 tp_is_empty!1563))

(declare-fun b!34351 () Bool)

(declare-fun res!20831 () Bool)

(assert (=> b!34351 (=> (not res!20831) (not e!21805))))

(declare-fun arrayContainsKey!0 (array!2345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34351 (= res!20831 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1891 () Bool)

(declare-fun tp!5064 () Bool)

(declare-fun e!21801 () Bool)

(assert (=> mapNonEmpty!1891 (= mapRes!1891 (and tp!5064 e!21801))))

(declare-fun mapValue!1891 () ValueCell!582)

(declare-fun mapKey!1891 () (_ BitVec 32))

(declare-fun mapRest!1891 () (Array (_ BitVec 32) ValueCell!582))

(assert (=> mapNonEmpty!1891 (= (arr!1119 _values!1501) (store mapRest!1891 mapKey!1891 mapValue!1891))))

(declare-fun b!34357 () Bool)

(declare-fun res!20828 () Bool)

(assert (=> b!34357 (=> (not res!20828) (not e!21805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2345 (_ BitVec 32)) Bool)

(assert (=> b!34357 (= res!20828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34358 () Bool)

(assert (=> b!34358 (= e!21803 tp_is_empty!1563)))

(declare-fun b!34359 () Bool)

(assert (=> b!34359 (= e!21801 tp_is_empty!1563)))

(declare-fun b!34360 () Bool)

(declare-fun res!20829 () Bool)

(assert (=> b!34360 (=> (not res!20829) (not e!21805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34360 (= res!20829 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4448 res!20827) b!34354))

(assert (= (and b!34354 res!20830) b!34357))

(assert (= (and b!34357 res!20828) b!34353))

(assert (= (and b!34353 res!20832) b!34360))

(assert (= (and b!34360 res!20829) b!34355))

(assert (= (and b!34355 res!20826) b!34351))

(assert (= (and b!34351 res!20831) b!34356))

(assert (= (and b!34352 condMapEmpty!1891) mapIsEmpty!1891))

(assert (= (and b!34352 (not condMapEmpty!1891)) mapNonEmpty!1891))

(get-info :version)

(assert (= (and mapNonEmpty!1891 ((_ is ValueCellFull!582) mapValue!1891)) b!34359))

(assert (= (and b!34352 ((_ is ValueCellFull!582) mapDefault!1891)) b!34358))

(assert (= start!4448 b!34352))

(declare-fun m!27703 () Bool)

(assert (=> b!34356 m!27703))

(declare-fun m!27705 () Bool)

(assert (=> b!34353 m!27705))

(declare-fun m!27707 () Bool)

(assert (=> b!34357 m!27707))

(declare-fun m!27709 () Bool)

(assert (=> b!34355 m!27709))

(assert (=> b!34355 m!27709))

(declare-fun m!27711 () Bool)

(assert (=> b!34355 m!27711))

(declare-fun m!27713 () Bool)

(assert (=> b!34360 m!27713))

(declare-fun m!27715 () Bool)

(assert (=> mapNonEmpty!1891 m!27715))

(declare-fun m!27717 () Bool)

(assert (=> start!4448 m!27717))

(declare-fun m!27719 () Bool)

(assert (=> start!4448 m!27719))

(declare-fun m!27721 () Bool)

(assert (=> start!4448 m!27721))

(declare-fun m!27723 () Bool)

(assert (=> b!34351 m!27723))

(check-sat (not b!34356) (not b!34360) b_and!2031 (not b!34351) (not b_next!1209) tp_is_empty!1563 (not b!34353) (not mapNonEmpty!1891) (not b!34357) (not start!4448) (not b!34355))
(check-sat b_and!2031 (not b_next!1209))
