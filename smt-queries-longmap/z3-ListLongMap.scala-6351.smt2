; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81824 () Bool)

(assert start!81824)

(declare-fun b_free!18337 () Bool)

(declare-fun b_next!18337 () Bool)

(assert (=> start!81824 (= b_free!18337 (not b_next!18337))))

(declare-fun tp!63712 () Bool)

(declare-fun b_and!29797 () Bool)

(assert (=> start!81824 (= tp!63712 b_and!29797)))

(declare-fun b!954188 () Bool)

(declare-fun res!639021 () Bool)

(declare-fun e!537568 () Bool)

(assert (=> b!954188 (=> (not res!639021) (not e!537568))))

(declare-datatypes ((array!57834 0))(
  ( (array!57835 (arr!27797 (Array (_ BitVec 32) (_ BitVec 64))) (size!28278 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57834)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57834 (_ BitVec 32)) Bool)

(assert (=> b!954188 (= res!639021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33283 () Bool)

(declare-fun mapRes!33283 () Bool)

(assert (=> mapIsEmpty!33283 mapRes!33283))

(declare-fun b!954189 () Bool)

(declare-fun res!639018 () Bool)

(assert (=> b!954189 (=> (not res!639018) (not e!537568))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32825 0))(
  ( (V!32826 (val!10491 Int)) )
))
(declare-datatypes ((ValueCell!9959 0))(
  ( (ValueCellFull!9959 (v!13045 V!32825)) (EmptyCell!9959) )
))
(declare-datatypes ((array!57836 0))(
  ( (array!57837 (arr!27798 (Array (_ BitVec 32) ValueCell!9959)) (size!28279 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57836)

(assert (=> b!954189 (= res!639018 (and (= (size!28279 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28278 _keys!1441) (size!28279 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954190 () Bool)

(declare-fun res!639022 () Bool)

(assert (=> b!954190 (=> (not res!639022) (not e!537568))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954190 (= res!639022 (validKeyInArray!0 (select (arr!27797 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33283 () Bool)

(declare-fun tp!63711 () Bool)

(declare-fun e!537566 () Bool)

(assert (=> mapNonEmpty!33283 (= mapRes!33283 (and tp!63711 e!537566))))

(declare-fun mapKey!33283 () (_ BitVec 32))

(declare-fun mapValue!33283 () ValueCell!9959)

(declare-fun mapRest!33283 () (Array (_ BitVec 32) ValueCell!9959))

(assert (=> mapNonEmpty!33283 (= (arr!27798 _values!1197) (store mapRest!33283 mapKey!33283 mapValue!33283))))

(declare-fun res!639017 () Bool)

(assert (=> start!81824 (=> (not res!639017) (not e!537568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81824 (= res!639017 (validMask!0 mask!1823))))

(assert (=> start!81824 e!537568))

(assert (=> start!81824 true))

(declare-fun tp_is_empty!20881 () Bool)

(assert (=> start!81824 tp_is_empty!20881))

(declare-fun array_inv!21641 (array!57834) Bool)

(assert (=> start!81824 (array_inv!21641 _keys!1441)))

(declare-fun e!537567 () Bool)

(declare-fun array_inv!21642 (array!57836) Bool)

(assert (=> start!81824 (and (array_inv!21642 _values!1197) e!537567)))

(assert (=> start!81824 tp!63712))

(declare-fun b!954191 () Bool)

(assert (=> b!954191 (= e!537566 tp_is_empty!20881)))

(declare-fun b!954192 () Bool)

(declare-fun e!537570 () Bool)

(assert (=> b!954192 (= e!537567 (and e!537570 mapRes!33283))))

(declare-fun condMapEmpty!33283 () Bool)

(declare-fun mapDefault!33283 () ValueCell!9959)

(assert (=> b!954192 (= condMapEmpty!33283 (= (arr!27798 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9959)) mapDefault!33283)))))

(declare-fun b!954193 () Bool)

(declare-fun res!639019 () Bool)

(assert (=> b!954193 (=> (not res!639019) (not e!537568))))

(declare-datatypes ((List!19401 0))(
  ( (Nil!19398) (Cons!19397 (h!20559 (_ BitVec 64)) (t!27753 List!19401)) )
))
(declare-fun arrayNoDuplicates!0 (array!57834 (_ BitVec 32) List!19401) Bool)

(assert (=> b!954193 (= res!639019 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19398))))

(declare-fun b!954194 () Bool)

(assert (=> b!954194 (= e!537568 false)))

(declare-fun zeroValue!1139 () V!32825)

(declare-fun lt!429663 () Bool)

(declare-fun minValue!1139 () V!32825)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13660 0))(
  ( (tuple2!13661 (_1!6841 (_ BitVec 64)) (_2!6841 V!32825)) )
))
(declare-datatypes ((List!19402 0))(
  ( (Nil!19399) (Cons!19398 (h!20560 tuple2!13660) (t!27754 List!19402)) )
))
(declare-datatypes ((ListLongMap!12347 0))(
  ( (ListLongMap!12348 (toList!6189 List!19402)) )
))
(declare-fun contains!5230 (ListLongMap!12347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3351 (array!57834 array!57836 (_ BitVec 32) (_ BitVec 32) V!32825 V!32825 (_ BitVec 32) Int) ListLongMap!12347)

(assert (=> b!954194 (= lt!429663 (contains!5230 (getCurrentListMap!3351 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27797 _keys!1441) i!735)))))

(declare-fun b!954195 () Bool)

(assert (=> b!954195 (= e!537570 tp_is_empty!20881)))

(declare-fun b!954196 () Bool)

(declare-fun res!639020 () Bool)

(assert (=> b!954196 (=> (not res!639020) (not e!537568))))

(assert (=> b!954196 (= res!639020 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28278 _keys!1441))))))

(assert (= (and start!81824 res!639017) b!954189))

(assert (= (and b!954189 res!639018) b!954188))

(assert (= (and b!954188 res!639021) b!954193))

(assert (= (and b!954193 res!639019) b!954196))

(assert (= (and b!954196 res!639020) b!954190))

(assert (= (and b!954190 res!639022) b!954194))

(assert (= (and b!954192 condMapEmpty!33283) mapIsEmpty!33283))

(assert (= (and b!954192 (not condMapEmpty!33283)) mapNonEmpty!33283))

(get-info :version)

(assert (= (and mapNonEmpty!33283 ((_ is ValueCellFull!9959) mapValue!33283)) b!954191))

(assert (= (and b!954192 ((_ is ValueCellFull!9959) mapDefault!33283)) b!954195))

(assert (= start!81824 b!954192))

(declare-fun m!885405 () Bool)

(assert (=> b!954193 m!885405))

(declare-fun m!885407 () Bool)

(assert (=> mapNonEmpty!33283 m!885407))

(declare-fun m!885409 () Bool)

(assert (=> b!954188 m!885409))

(declare-fun m!885411 () Bool)

(assert (=> b!954190 m!885411))

(assert (=> b!954190 m!885411))

(declare-fun m!885413 () Bool)

(assert (=> b!954190 m!885413))

(declare-fun m!885415 () Bool)

(assert (=> b!954194 m!885415))

(assert (=> b!954194 m!885411))

(assert (=> b!954194 m!885415))

(assert (=> b!954194 m!885411))

(declare-fun m!885417 () Bool)

(assert (=> b!954194 m!885417))

(declare-fun m!885419 () Bool)

(assert (=> start!81824 m!885419))

(declare-fun m!885421 () Bool)

(assert (=> start!81824 m!885421))

(declare-fun m!885423 () Bool)

(assert (=> start!81824 m!885423))

(check-sat (not b!954194) (not b!954190) tp_is_empty!20881 (not b!954193) (not b_next!18337) (not mapNonEmpty!33283) (not start!81824) (not b!954188) b_and!29797)
(check-sat b_and!29797 (not b_next!18337))
