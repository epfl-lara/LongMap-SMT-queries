; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84896 () Bool)

(assert start!84896)

(declare-fun b_free!20083 () Bool)

(declare-fun b_next!20083 () Bool)

(assert (=> start!84896 (= b_free!20083 (not b_next!20083))))

(declare-fun tp!70048 () Bool)

(declare-fun b_and!32263 () Bool)

(assert (=> start!84896 (= tp!70048 b_and!32263)))

(declare-fun b!991701 () Bool)

(declare-fun res!662764 () Bool)

(declare-fun e!559281 () Bool)

(assert (=> b!991701 (=> (not res!662764) (not e!559281))))

(declare-datatypes ((array!62606 0))(
  ( (array!62607 (arr!30149 (Array (_ BitVec 32) (_ BitVec 64))) (size!30629 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62606)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991701 (= res!662764 (validKeyInArray!0 (select (arr!30149 _keys!1544) from!1932)))))

(declare-fun b!991702 () Bool)

(declare-fun res!662765 () Bool)

(assert (=> b!991702 (=> (not res!662765) (not e!559281))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62606 (_ BitVec 32)) Bool)

(assert (=> b!991702 (= res!662765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!991703 () Bool)

(declare-fun res!662763 () Bool)

(assert (=> b!991703 (=> (not res!662763) (not e!559281))))

(declare-datatypes ((List!20838 0))(
  ( (Nil!20835) (Cons!20834 (h!22002 (_ BitVec 64)) (t!29807 List!20838)) )
))
(declare-fun arrayNoDuplicates!0 (array!62606 (_ BitVec 32) List!20838) Bool)

(assert (=> b!991703 (= res!662763 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20835))))

(declare-fun mapNonEmpty!37001 () Bool)

(declare-fun mapRes!37001 () Bool)

(declare-fun tp!70049 () Bool)

(declare-fun e!559282 () Bool)

(assert (=> mapNonEmpty!37001 (= mapRes!37001 (and tp!70049 e!559282))))

(declare-datatypes ((V!36049 0))(
  ( (V!36050 (val!11700 Int)) )
))
(declare-datatypes ((ValueCell!11168 0))(
  ( (ValueCellFull!11168 (v!14270 V!36049)) (EmptyCell!11168) )
))
(declare-fun mapRest!37001 () (Array (_ BitVec 32) ValueCell!11168))

(declare-datatypes ((array!62608 0))(
  ( (array!62609 (arr!30150 (Array (_ BitVec 32) ValueCell!11168)) (size!30630 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62608)

(declare-fun mapValue!37001 () ValueCell!11168)

(declare-fun mapKey!37001 () (_ BitVec 32))

(assert (=> mapNonEmpty!37001 (= (arr!30150 _values!1278) (store mapRest!37001 mapKey!37001 mapValue!37001))))

(declare-fun b!991704 () Bool)

(declare-fun e!559278 () Bool)

(declare-fun e!559283 () Bool)

(assert (=> b!991704 (= e!559278 (and e!559283 mapRes!37001))))

(declare-fun condMapEmpty!37001 () Bool)

(declare-fun mapDefault!37001 () ValueCell!11168)

(assert (=> b!991704 (= condMapEmpty!37001 (= (arr!30150 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11168)) mapDefault!37001)))))

(declare-fun mapIsEmpty!37001 () Bool)

(assert (=> mapIsEmpty!37001 mapRes!37001))

(declare-fun res!662762 () Bool)

(assert (=> start!84896 (=> (not res!662762) (not e!559281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84896 (= res!662762 (validMask!0 mask!1948))))

(assert (=> start!84896 e!559281))

(assert (=> start!84896 true))

(declare-fun tp_is_empty!23299 () Bool)

(assert (=> start!84896 tp_is_empty!23299))

(declare-fun array_inv!23311 (array!62608) Bool)

(assert (=> start!84896 (and (array_inv!23311 _values!1278) e!559278)))

(assert (=> start!84896 tp!70048))

(declare-fun array_inv!23312 (array!62606) Bool)

(assert (=> start!84896 (array_inv!23312 _keys!1544)))

(declare-fun b!991705 () Bool)

(declare-fun e!559280 () Bool)

(assert (=> b!991705 (= e!559280 false)))

(declare-fun minValue!1220 () V!36049)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14930 0))(
  ( (tuple2!14931 (_1!7476 (_ BitVec 64)) (_2!7476 V!36049)) )
))
(declare-datatypes ((List!20839 0))(
  ( (Nil!20836) (Cons!20835 (h!22003 tuple2!14930) (t!29808 List!20839)) )
))
(declare-datatypes ((ListLongMap!13629 0))(
  ( (ListLongMap!13630 (toList!6830 List!20839)) )
))
(declare-fun lt!440036 () ListLongMap!13629)

(declare-fun zeroValue!1220 () V!36049)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3877 (array!62606 array!62608 (_ BitVec 32) (_ BitVec 32) V!36049 V!36049 (_ BitVec 32) Int) ListLongMap!13629)

(assert (=> b!991705 (= lt!440036 (getCurrentListMap!3877 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!991706 () Bool)

(assert (=> b!991706 (= e!559283 tp_is_empty!23299)))

(declare-fun b!991707 () Bool)

(declare-fun res!662767 () Bool)

(assert (=> b!991707 (=> (not res!662767) (not e!559281))))

(assert (=> b!991707 (= res!662767 (and (= (size!30630 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30629 _keys!1544) (size!30630 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!991708 () Bool)

(assert (=> b!991708 (= e!559282 tp_is_empty!23299)))

(declare-fun b!991709 () Bool)

(assert (=> b!991709 (= e!559281 e!559280)))

(declare-fun res!662768 () Bool)

(assert (=> b!991709 (=> (not res!662768) (not e!559280))))

(declare-fun lt!440037 () Bool)

(assert (=> b!991709 (= res!662768 (and (or lt!440037 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!440037 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!440037))))))

(assert (=> b!991709 (= lt!440037 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!991710 () Bool)

(declare-fun res!662766 () Bool)

(assert (=> b!991710 (=> (not res!662766) (not e!559281))))

(assert (=> b!991710 (= res!662766 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30629 _keys!1544))))))

(assert (= (and start!84896 res!662762) b!991707))

(assert (= (and b!991707 res!662767) b!991702))

(assert (= (and b!991702 res!662765) b!991703))

(assert (= (and b!991703 res!662763) b!991710))

(assert (= (and b!991710 res!662766) b!991701))

(assert (= (and b!991701 res!662764) b!991709))

(assert (= (and b!991709 res!662768) b!991705))

(assert (= (and b!991704 condMapEmpty!37001) mapIsEmpty!37001))

(assert (= (and b!991704 (not condMapEmpty!37001)) mapNonEmpty!37001))

(get-info :version)

(assert (= (and mapNonEmpty!37001 ((_ is ValueCellFull!11168) mapValue!37001)) b!991708))

(assert (= (and b!991704 ((_ is ValueCellFull!11168) mapDefault!37001)) b!991706))

(assert (= start!84896 b!991704))

(declare-fun m!919915 () Bool)

(assert (=> start!84896 m!919915))

(declare-fun m!919917 () Bool)

(assert (=> start!84896 m!919917))

(declare-fun m!919919 () Bool)

(assert (=> start!84896 m!919919))

(declare-fun m!919921 () Bool)

(assert (=> b!991701 m!919921))

(assert (=> b!991701 m!919921))

(declare-fun m!919923 () Bool)

(assert (=> b!991701 m!919923))

(declare-fun m!919925 () Bool)

(assert (=> b!991703 m!919925))

(declare-fun m!919927 () Bool)

(assert (=> b!991702 m!919927))

(declare-fun m!919929 () Bool)

(assert (=> b!991705 m!919929))

(declare-fun m!919931 () Bool)

(assert (=> mapNonEmpty!37001 m!919931))

(check-sat (not b!991701) (not b!991705) (not b!991703) (not start!84896) (not b!991702) tp_is_empty!23299 b_and!32263 (not mapNonEmpty!37001) (not b_next!20083))
(check-sat b_and!32263 (not b_next!20083))
