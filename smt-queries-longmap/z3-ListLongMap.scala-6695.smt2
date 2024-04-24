; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84310 () Bool)

(assert start!84310)

(declare-fun b_free!19843 () Bool)

(declare-fun b_next!19843 () Bool)

(assert (=> start!84310 (= b_free!19843 (not b_next!19843))))

(declare-fun tp!69133 () Bool)

(declare-fun b_and!31779 () Bool)

(assert (=> start!84310 (= tp!69133 b_and!31779)))

(declare-fun b!984708 () Bool)

(declare-fun res!658645 () Bool)

(declare-fun e!555222 () Bool)

(assert (=> b!984708 (=> (not res!658645) (not e!555222))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61912 0))(
  ( (array!61913 (arr!29809 (Array (_ BitVec 32) (_ BitVec 64))) (size!30289 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61912)

(assert (=> b!984708 (= res!658645 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30289 _keys!1544))))))

(declare-fun b!984709 () Bool)

(declare-fun res!658644 () Bool)

(assert (=> b!984709 (=> (not res!658644) (not e!555222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984709 (= res!658644 (validKeyInArray!0 (select (arr!29809 _keys!1544) from!1932)))))

(declare-fun res!658639 () Bool)

(assert (=> start!84310 (=> (not res!658639) (not e!555222))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84310 (= res!658639 (validMask!0 mask!1948))))

(assert (=> start!84310 e!555222))

(assert (=> start!84310 true))

(declare-fun tp_is_empty!22945 () Bool)

(assert (=> start!84310 tp_is_empty!22945))

(declare-datatypes ((V!35577 0))(
  ( (V!35578 (val!11523 Int)) )
))
(declare-datatypes ((ValueCell!10991 0))(
  ( (ValueCellFull!10991 (v!14082 V!35577)) (EmptyCell!10991) )
))
(declare-datatypes ((array!61914 0))(
  ( (array!61915 (arr!29810 (Array (_ BitVec 32) ValueCell!10991)) (size!30290 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61914)

(declare-fun e!555218 () Bool)

(declare-fun array_inv!23063 (array!61914) Bool)

(assert (=> start!84310 (and (array_inv!23063 _values!1278) e!555218)))

(assert (=> start!84310 tp!69133))

(declare-fun array_inv!23064 (array!61912) Bool)

(assert (=> start!84310 (array_inv!23064 _keys!1544)))

(declare-fun mapNonEmpty!36446 () Bool)

(declare-fun mapRes!36446 () Bool)

(declare-fun tp!69134 () Bool)

(declare-fun e!555220 () Bool)

(assert (=> mapNonEmpty!36446 (= mapRes!36446 (and tp!69134 e!555220))))

(declare-fun mapValue!36446 () ValueCell!10991)

(declare-fun mapKey!36446 () (_ BitVec 32))

(declare-fun mapRest!36446 () (Array (_ BitVec 32) ValueCell!10991))

(assert (=> mapNonEmpty!36446 (= (arr!29810 _values!1278) (store mapRest!36446 mapKey!36446 mapValue!36446))))

(declare-fun b!984710 () Bool)

(declare-fun res!658641 () Bool)

(assert (=> b!984710 (=> (not res!658641) (not e!555222))))

(declare-datatypes ((List!20639 0))(
  ( (Nil!20636) (Cons!20635 (h!21803 (_ BitVec 64)) (t!29422 List!20639)) )
))
(declare-fun arrayNoDuplicates!0 (array!61912 (_ BitVec 32) List!20639) Bool)

(assert (=> b!984710 (= res!658641 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20636))))

(declare-fun b!984711 () Bool)

(declare-fun e!555219 () Bool)

(assert (=> b!984711 (= e!555219 tp_is_empty!22945)))

(declare-fun b!984712 () Bool)

(declare-fun res!658640 () Bool)

(assert (=> b!984712 (=> (not res!658640) (not e!555222))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984712 (= res!658640 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984713 () Bool)

(declare-fun res!658642 () Bool)

(assert (=> b!984713 (=> (not res!658642) (not e!555222))))

(assert (=> b!984713 (= res!658642 (and (= (size!30290 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30289 _keys!1544) (size!30290 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36446 () Bool)

(assert (=> mapIsEmpty!36446 mapRes!36446))

(declare-fun b!984714 () Bool)

(assert (=> b!984714 (= e!555222 false)))

(declare-fun minValue!1220 () V!35577)

(declare-fun zeroValue!1220 () V!35577)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14752 0))(
  ( (tuple2!14753 (_1!7387 (_ BitVec 64)) (_2!7387 V!35577)) )
))
(declare-datatypes ((List!20640 0))(
  ( (Nil!20637) (Cons!20636 (h!21804 tuple2!14752) (t!29423 List!20640)) )
))
(declare-datatypes ((ListLongMap!13451 0))(
  ( (ListLongMap!13452 (toList!6741 List!20640)) )
))
(declare-fun lt!436926 () ListLongMap!13451)

(declare-fun getCurrentListMapNoExtraKeys!3480 (array!61912 array!61914 (_ BitVec 32) (_ BitVec 32) V!35577 V!35577 (_ BitVec 32) Int) ListLongMap!13451)

(assert (=> b!984714 (= lt!436926 (getCurrentListMapNoExtraKeys!3480 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984715 () Bool)

(assert (=> b!984715 (= e!555218 (and e!555219 mapRes!36446))))

(declare-fun condMapEmpty!36446 () Bool)

(declare-fun mapDefault!36446 () ValueCell!10991)

(assert (=> b!984715 (= condMapEmpty!36446 (= (arr!29810 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10991)) mapDefault!36446)))))

(declare-fun b!984716 () Bool)

(assert (=> b!984716 (= e!555220 tp_is_empty!22945)))

(declare-fun b!984717 () Bool)

(declare-fun res!658643 () Bool)

(assert (=> b!984717 (=> (not res!658643) (not e!555222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61912 (_ BitVec 32)) Bool)

(assert (=> b!984717 (= res!658643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84310 res!658639) b!984713))

(assert (= (and b!984713 res!658642) b!984717))

(assert (= (and b!984717 res!658643) b!984710))

(assert (= (and b!984710 res!658641) b!984708))

(assert (= (and b!984708 res!658645) b!984709))

(assert (= (and b!984709 res!658644) b!984712))

(assert (= (and b!984712 res!658640) b!984714))

(assert (= (and b!984715 condMapEmpty!36446) mapIsEmpty!36446))

(assert (= (and b!984715 (not condMapEmpty!36446)) mapNonEmpty!36446))

(get-info :version)

(assert (= (and mapNonEmpty!36446 ((_ is ValueCellFull!10991) mapValue!36446)) b!984716))

(assert (= (and b!984715 ((_ is ValueCellFull!10991) mapDefault!36446)) b!984711))

(assert (= start!84310 b!984715))

(declare-fun m!912239 () Bool)

(assert (=> b!984717 m!912239))

(declare-fun m!912241 () Bool)

(assert (=> start!84310 m!912241))

(declare-fun m!912243 () Bool)

(assert (=> start!84310 m!912243))

(declare-fun m!912245 () Bool)

(assert (=> start!84310 m!912245))

(declare-fun m!912247 () Bool)

(assert (=> b!984710 m!912247))

(declare-fun m!912249 () Bool)

(assert (=> b!984709 m!912249))

(assert (=> b!984709 m!912249))

(declare-fun m!912251 () Bool)

(assert (=> b!984709 m!912251))

(declare-fun m!912253 () Bool)

(assert (=> b!984714 m!912253))

(declare-fun m!912255 () Bool)

(assert (=> mapNonEmpty!36446 m!912255))

(check-sat (not b!984714) (not b!984709) (not b!984710) (not b!984717) (not mapNonEmpty!36446) (not start!84310) (not b_next!19843) tp_is_empty!22945 b_and!31779)
(check-sat b_and!31779 (not b_next!19843))
