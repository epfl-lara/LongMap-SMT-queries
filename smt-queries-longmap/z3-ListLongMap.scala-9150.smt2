; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109762 () Bool)

(assert start!109762)

(declare-fun b_free!29175 () Bool)

(declare-fun b_next!29175 () Bool)

(assert (=> start!109762 (= b_free!29175 (not b_next!29175))))

(declare-fun tp!102655 () Bool)

(declare-fun b_and!47283 () Bool)

(assert (=> start!109762 (= tp!102655 b_and!47283)))

(declare-fun b!1300150 () Bool)

(declare-fun res!863993 () Bool)

(declare-fun e!741668 () Bool)

(assert (=> b!1300150 (=> (not res!863993) (not e!741668))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300150 (= res!863993 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1300151 () Bool)

(declare-fun res!863990 () Bool)

(assert (=> b!1300151 (=> (not res!863990) (not e!741668))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86640 0))(
  ( (array!86641 (arr!41817 (Array (_ BitVec 32) (_ BitVec 64))) (size!42367 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86640)

(assert (=> b!1300151 (= res!863990 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42367 _keys!1741))))))

(declare-fun b!1300152 () Bool)

(assert (=> b!1300152 (= e!741668 false)))

(declare-datatypes ((V!51523 0))(
  ( (V!51524 (val!17482 Int)) )
))
(declare-fun zeroValue!1387 () V!51523)

(declare-datatypes ((ValueCell!16509 0))(
  ( (ValueCellFull!16509 (v!20089 V!51523)) (EmptyCell!16509) )
))
(declare-datatypes ((array!86642 0))(
  ( (array!86643 (arr!41818 (Array (_ BitVec 32) ValueCell!16509)) (size!42368 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86642)

(declare-fun minValue!1387 () V!51523)

(declare-fun lt!581266 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22544 0))(
  ( (tuple2!22545 (_1!11283 (_ BitVec 64)) (_2!11283 V!51523)) )
))
(declare-datatypes ((List!29676 0))(
  ( (Nil!29673) (Cons!29672 (h!30881 tuple2!22544) (t!43248 List!29676)) )
))
(declare-datatypes ((ListLongMap!20201 0))(
  ( (ListLongMap!20202 (toList!10116 List!29676)) )
))
(declare-fun contains!8240 (ListLongMap!20201 (_ BitVec 64)) Bool)

(declare-fun +!4448 (ListLongMap!20201 tuple2!22544) ListLongMap!20201)

(declare-fun getCurrentListMapNoExtraKeys!6079 (array!86640 array!86642 (_ BitVec 32) (_ BitVec 32) V!51523 V!51523 (_ BitVec 32) Int) ListLongMap!20201)

(assert (=> b!1300152 (= lt!581266 (contains!8240 (+!4448 (getCurrentListMapNoExtraKeys!6079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun res!863998 () Bool)

(assert (=> start!109762 (=> (not res!863998) (not e!741668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109762 (= res!863998 (validMask!0 mask!2175))))

(assert (=> start!109762 e!741668))

(declare-fun tp_is_empty!34815 () Bool)

(assert (=> start!109762 tp_is_empty!34815))

(assert (=> start!109762 true))

(declare-fun e!741667 () Bool)

(declare-fun array_inv!31639 (array!86642) Bool)

(assert (=> start!109762 (and (array_inv!31639 _values!1445) e!741667)))

(declare-fun array_inv!31640 (array!86640) Bool)

(assert (=> start!109762 (array_inv!31640 _keys!1741)))

(assert (=> start!109762 tp!102655))

(declare-fun b!1300153 () Bool)

(declare-fun e!741665 () Bool)

(assert (=> b!1300153 (= e!741665 tp_is_empty!34815)))

(declare-fun b!1300154 () Bool)

(declare-fun res!863995 () Bool)

(assert (=> b!1300154 (=> (not res!863995) (not e!741668))))

(declare-fun getCurrentListMap!5143 (array!86640 array!86642 (_ BitVec 32) (_ BitVec 32) V!51523 V!51523 (_ BitVec 32) Int) ListLongMap!20201)

(assert (=> b!1300154 (= res!863995 (contains!8240 (getCurrentListMap!5143 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53795 () Bool)

(declare-fun mapRes!53795 () Bool)

(assert (=> mapIsEmpty!53795 mapRes!53795))

(declare-fun mapNonEmpty!53795 () Bool)

(declare-fun tp!102656 () Bool)

(assert (=> mapNonEmpty!53795 (= mapRes!53795 (and tp!102656 e!741665))))

(declare-fun mapKey!53795 () (_ BitVec 32))

(declare-fun mapRest!53795 () (Array (_ BitVec 32) ValueCell!16509))

(declare-fun mapValue!53795 () ValueCell!16509)

(assert (=> mapNonEmpty!53795 (= (arr!41818 _values!1445) (store mapRest!53795 mapKey!53795 mapValue!53795))))

(declare-fun b!1300155 () Bool)

(declare-fun e!741666 () Bool)

(assert (=> b!1300155 (= e!741666 tp_is_empty!34815)))

(declare-fun b!1300156 () Bool)

(declare-fun res!863997 () Bool)

(assert (=> b!1300156 (=> (not res!863997) (not e!741668))))

(declare-datatypes ((List!29677 0))(
  ( (Nil!29674) (Cons!29673 (h!30882 (_ BitVec 64)) (t!43249 List!29677)) )
))
(declare-fun arrayNoDuplicates!0 (array!86640 (_ BitVec 32) List!29677) Bool)

(assert (=> b!1300156 (= res!863997 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29674))))

(declare-fun b!1300157 () Bool)

(declare-fun res!863991 () Bool)

(assert (=> b!1300157 (=> (not res!863991) (not e!741668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300157 (= res!863991 (validKeyInArray!0 (select (arr!41817 _keys!1741) from!2144)))))

(declare-fun b!1300158 () Bool)

(assert (=> b!1300158 (= e!741667 (and e!741666 mapRes!53795))))

(declare-fun condMapEmpty!53795 () Bool)

(declare-fun mapDefault!53795 () ValueCell!16509)

(assert (=> b!1300158 (= condMapEmpty!53795 (= (arr!41818 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16509)) mapDefault!53795)))))

(declare-fun b!1300159 () Bool)

(declare-fun res!863994 () Bool)

(assert (=> b!1300159 (=> (not res!863994) (not e!741668))))

(assert (=> b!1300159 (= res!863994 (and (= (size!42368 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42367 _keys!1741) (size!42368 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300160 () Bool)

(declare-fun res!863992 () Bool)

(assert (=> b!1300160 (=> (not res!863992) (not e!741668))))

(assert (=> b!1300160 (= res!863992 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42367 _keys!1741))))))

(declare-fun b!1300161 () Bool)

(declare-fun res!863996 () Bool)

(assert (=> b!1300161 (=> (not res!863996) (not e!741668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86640 (_ BitVec 32)) Bool)

(assert (=> b!1300161 (= res!863996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109762 res!863998) b!1300159))

(assert (= (and b!1300159 res!863994) b!1300161))

(assert (= (and b!1300161 res!863996) b!1300156))

(assert (= (and b!1300156 res!863997) b!1300160))

(assert (= (and b!1300160 res!863992) b!1300154))

(assert (= (and b!1300154 res!863995) b!1300151))

(assert (= (and b!1300151 res!863990) b!1300157))

(assert (= (and b!1300157 res!863991) b!1300150))

(assert (= (and b!1300150 res!863993) b!1300152))

(assert (= (and b!1300158 condMapEmpty!53795) mapIsEmpty!53795))

(assert (= (and b!1300158 (not condMapEmpty!53795)) mapNonEmpty!53795))

(get-info :version)

(assert (= (and mapNonEmpty!53795 ((_ is ValueCellFull!16509) mapValue!53795)) b!1300153))

(assert (= (and b!1300158 ((_ is ValueCellFull!16509) mapDefault!53795)) b!1300155))

(assert (= start!109762 b!1300158))

(declare-fun m!1191155 () Bool)

(assert (=> mapNonEmpty!53795 m!1191155))

(declare-fun m!1191157 () Bool)

(assert (=> b!1300152 m!1191157))

(assert (=> b!1300152 m!1191157))

(declare-fun m!1191159 () Bool)

(assert (=> b!1300152 m!1191159))

(assert (=> b!1300152 m!1191159))

(declare-fun m!1191161 () Bool)

(assert (=> b!1300152 m!1191161))

(declare-fun m!1191163 () Bool)

(assert (=> b!1300156 m!1191163))

(declare-fun m!1191165 () Bool)

(assert (=> start!109762 m!1191165))

(declare-fun m!1191167 () Bool)

(assert (=> start!109762 m!1191167))

(declare-fun m!1191169 () Bool)

(assert (=> start!109762 m!1191169))

(declare-fun m!1191171 () Bool)

(assert (=> b!1300154 m!1191171))

(assert (=> b!1300154 m!1191171))

(declare-fun m!1191173 () Bool)

(assert (=> b!1300154 m!1191173))

(declare-fun m!1191175 () Bool)

(assert (=> b!1300161 m!1191175))

(declare-fun m!1191177 () Bool)

(assert (=> b!1300157 m!1191177))

(assert (=> b!1300157 m!1191177))

(declare-fun m!1191179 () Bool)

(assert (=> b!1300157 m!1191179))

(check-sat b_and!47283 (not start!109762) (not b!1300161) (not b!1300154) (not b!1300152) (not b!1300157) (not b!1300156) (not b_next!29175) tp_is_empty!34815 (not mapNonEmpty!53795))
(check-sat b_and!47283 (not b_next!29175))
