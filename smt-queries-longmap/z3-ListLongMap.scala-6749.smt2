; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84630 () Bool)

(assert start!84630)

(declare-fun b_free!20055 () Bool)

(declare-fun b_next!20055 () Bool)

(assert (=> start!84630 (= b_free!20055 (not b_next!20055))))

(declare-fun tp!69956 () Bool)

(declare-fun b_and!32187 () Bool)

(assert (=> start!84630 (= tp!69956 b_and!32187)))

(declare-fun mapNonEmpty!36952 () Bool)

(declare-fun mapRes!36952 () Bool)

(declare-fun tp!69957 () Bool)

(declare-fun e!558107 () Bool)

(assert (=> mapNonEmpty!36952 (= mapRes!36952 (and tp!69957 e!558107))))

(declare-datatypes ((V!36011 0))(
  ( (V!36012 (val!11686 Int)) )
))
(declare-datatypes ((ValueCell!11154 0))(
  ( (ValueCellFull!11154 (v!14256 V!36011)) (EmptyCell!11154) )
))
(declare-datatypes ((array!62501 0))(
  ( (array!62502 (arr!30103 (Array (_ BitVec 32) ValueCell!11154)) (size!30582 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62501)

(declare-fun mapRest!36952 () (Array (_ BitVec 32) ValueCell!11154))

(declare-fun mapKey!36952 () (_ BitVec 32))

(declare-fun mapValue!36952 () ValueCell!11154)

(assert (=> mapNonEmpty!36952 (= (arr!30103 _values!1278) (store mapRest!36952 mapKey!36952 mapValue!36952))))

(declare-fun b!989765 () Bool)

(declare-fun e!558108 () Bool)

(declare-fun tp_is_empty!23271 () Bool)

(assert (=> b!989765 (= e!558108 tp_is_empty!23271)))

(declare-fun b!989766 () Bool)

(declare-fun res!661865 () Bool)

(declare-fun e!558111 () Bool)

(assert (=> b!989766 (=> (not res!661865) (not e!558111))))

(declare-datatypes ((array!62503 0))(
  ( (array!62504 (arr!30104 (Array (_ BitVec 32) (_ BitVec 64))) (size!30583 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62503)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989766 (= res!661865 (validKeyInArray!0 (select (arr!30104 _keys!1544) from!1932)))))

(declare-fun b!989767 () Bool)

(declare-fun e!558109 () Bool)

(assert (=> b!989767 (= e!558109 (and e!558108 mapRes!36952))))

(declare-fun condMapEmpty!36952 () Bool)

(declare-fun mapDefault!36952 () ValueCell!11154)

(assert (=> b!989767 (= condMapEmpty!36952 (= (arr!30103 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11154)) mapDefault!36952)))))

(declare-fun mapIsEmpty!36952 () Bool)

(assert (=> mapIsEmpty!36952 mapRes!36952))

(declare-fun b!989769 () Bool)

(assert (=> b!989769 (= e!558107 tp_is_empty!23271)))

(declare-fun b!989770 () Bool)

(declare-fun res!661866 () Bool)

(assert (=> b!989770 (=> (not res!661866) (not e!558111))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989770 (= res!661866 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!989771 () Bool)

(assert (=> b!989771 (= e!558111 (bvsge from!1932 (size!30582 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!36011)

(declare-datatypes ((tuple2!14896 0))(
  ( (tuple2!14897 (_1!7459 (_ BitVec 64)) (_2!7459 V!36011)) )
))
(declare-datatypes ((List!20825 0))(
  ( (Nil!20822) (Cons!20821 (h!21983 tuple2!14896) (t!29782 List!20825)) )
))
(declare-datatypes ((ListLongMap!13593 0))(
  ( (ListLongMap!13594 (toList!6812 List!20825)) )
))
(declare-fun lt!439110 () ListLongMap!13593)

(declare-fun zeroValue!1220 () V!36011)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3502 (array!62503 array!62501 (_ BitVec 32) (_ BitVec 32) V!36011 V!36011 (_ BitVec 32) Int) ListLongMap!13593)

(assert (=> b!989771 (= lt!439110 (getCurrentListMapNoExtraKeys!3502 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989772 () Bool)

(declare-fun res!661863 () Bool)

(assert (=> b!989772 (=> (not res!661863) (not e!558111))))

(assert (=> b!989772 (= res!661863 (and (= (size!30582 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30583 _keys!1544) (size!30582 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989773 () Bool)

(declare-fun res!661864 () Bool)

(assert (=> b!989773 (=> (not res!661864) (not e!558111))))

(assert (=> b!989773 (= res!661864 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30583 _keys!1544))))))

(declare-fun b!989774 () Bool)

(declare-fun res!661860 () Bool)

(assert (=> b!989774 (=> (not res!661860) (not e!558111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62503 (_ BitVec 32)) Bool)

(assert (=> b!989774 (= res!661860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989768 () Bool)

(declare-fun res!661862 () Bool)

(assert (=> b!989768 (=> (not res!661862) (not e!558111))))

(declare-datatypes ((List!20826 0))(
  ( (Nil!20823) (Cons!20822 (h!21984 (_ BitVec 64)) (t!29783 List!20826)) )
))
(declare-fun arrayNoDuplicates!0 (array!62503 (_ BitVec 32) List!20826) Bool)

(assert (=> b!989768 (= res!661862 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20823))))

(declare-fun res!661861 () Bool)

(assert (=> start!84630 (=> (not res!661861) (not e!558111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84630 (= res!661861 (validMask!0 mask!1948))))

(assert (=> start!84630 e!558111))

(assert (=> start!84630 true))

(assert (=> start!84630 tp_is_empty!23271))

(declare-fun array_inv!23255 (array!62501) Bool)

(assert (=> start!84630 (and (array_inv!23255 _values!1278) e!558109)))

(assert (=> start!84630 tp!69956))

(declare-fun array_inv!23256 (array!62503) Bool)

(assert (=> start!84630 (array_inv!23256 _keys!1544)))

(assert (= (and start!84630 res!661861) b!989772))

(assert (= (and b!989772 res!661863) b!989774))

(assert (= (and b!989774 res!661860) b!989768))

(assert (= (and b!989768 res!661862) b!989773))

(assert (= (and b!989773 res!661864) b!989766))

(assert (= (and b!989766 res!661865) b!989770))

(assert (= (and b!989770 res!661866) b!989771))

(assert (= (and b!989767 condMapEmpty!36952) mapIsEmpty!36952))

(assert (= (and b!989767 (not condMapEmpty!36952)) mapNonEmpty!36952))

(get-info :version)

(assert (= (and mapNonEmpty!36952 ((_ is ValueCellFull!11154) mapValue!36952)) b!989769))

(assert (= (and b!989767 ((_ is ValueCellFull!11154) mapDefault!36952)) b!989765))

(assert (= start!84630 b!989767))

(declare-fun m!917249 () Bool)

(assert (=> b!989771 m!917249))

(declare-fun m!917251 () Bool)

(assert (=> b!989768 m!917251))

(declare-fun m!917253 () Bool)

(assert (=> start!84630 m!917253))

(declare-fun m!917255 () Bool)

(assert (=> start!84630 m!917255))

(declare-fun m!917257 () Bool)

(assert (=> start!84630 m!917257))

(declare-fun m!917259 () Bool)

(assert (=> b!989766 m!917259))

(assert (=> b!989766 m!917259))

(declare-fun m!917261 () Bool)

(assert (=> b!989766 m!917261))

(declare-fun m!917263 () Bool)

(assert (=> b!989774 m!917263))

(declare-fun m!917265 () Bool)

(assert (=> mapNonEmpty!36952 m!917265))

(check-sat tp_is_empty!23271 (not b!989766) (not start!84630) b_and!32187 (not b!989771) (not b_next!20055) (not b!989774) (not b!989768) (not mapNonEmpty!36952))
(check-sat b_and!32187 (not b_next!20055))
