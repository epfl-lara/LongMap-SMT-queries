; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108480 () Bool)

(assert start!108480)

(declare-fun b_free!28027 () Bool)

(declare-fun b_next!28027 () Bool)

(assert (=> start!108480 (= b_free!28027 (not b_next!28027))))

(declare-fun tp!99191 () Bool)

(declare-fun b_and!46069 () Bool)

(assert (=> start!108480 (= tp!99191 b_and!46069)))

(declare-fun b!1280273 () Bool)

(declare-fun res!850447 () Bool)

(declare-fun e!731540 () Bool)

(assert (=> b!1280273 (=> (not res!850447) (not e!731540))))

(declare-datatypes ((array!84305 0))(
  ( (array!84306 (arr!40657 (Array (_ BitVec 32) (_ BitVec 64))) (size!41209 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84305)

(declare-datatypes ((List!28902 0))(
  ( (Nil!28899) (Cons!28898 (h!30107 (_ BitVec 64)) (t!42434 List!28902)) )
))
(declare-fun arrayNoDuplicates!0 (array!84305 (_ BitVec 32) List!28902) Bool)

(assert (=> b!1280273 (= res!850447 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28899))))

(declare-fun b!1280274 () Bool)

(assert (=> b!1280274 (= e!731540 false)))

(declare-datatypes ((V!49993 0))(
  ( (V!49994 (val!16908 Int)) )
))
(declare-fun minValue!1387 () V!49993)

(declare-fun zeroValue!1387 () V!49993)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15935 0))(
  ( (ValueCellFull!15935 (v!19507 V!49993)) (EmptyCell!15935) )
))
(declare-datatypes ((array!84307 0))(
  ( (array!84308 (arr!40658 (Array (_ BitVec 32) ValueCell!15935)) (size!41210 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84307)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!575935 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21710 0))(
  ( (tuple2!21711 (_1!10866 (_ BitVec 64)) (_2!10866 V!49993)) )
))
(declare-datatypes ((List!28903 0))(
  ( (Nil!28900) (Cons!28899 (h!30108 tuple2!21710) (t!42435 List!28903)) )
))
(declare-datatypes ((ListLongMap!19367 0))(
  ( (ListLongMap!19368 (toList!9699 List!28903)) )
))
(declare-fun contains!7744 (ListLongMap!19367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4673 (array!84305 array!84307 (_ BitVec 32) (_ BitVec 32) V!49993 V!49993 (_ BitVec 32) Int) ListLongMap!19367)

(assert (=> b!1280274 (= lt!575935 (contains!7744 (getCurrentListMap!4673 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280275 () Bool)

(declare-fun e!731538 () Bool)

(declare-fun e!731539 () Bool)

(declare-fun mapRes!52052 () Bool)

(assert (=> b!1280275 (= e!731538 (and e!731539 mapRes!52052))))

(declare-fun condMapEmpty!52052 () Bool)

(declare-fun mapDefault!52052 () ValueCell!15935)

(assert (=> b!1280275 (= condMapEmpty!52052 (= (arr!40658 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15935)) mapDefault!52052)))))

(declare-fun b!1280276 () Bool)

(declare-fun res!850448 () Bool)

(assert (=> b!1280276 (=> (not res!850448) (not e!731540))))

(assert (=> b!1280276 (= res!850448 (and (= (size!41210 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41209 _keys!1741) (size!41210 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280277 () Bool)

(declare-fun res!850446 () Bool)

(assert (=> b!1280277 (=> (not res!850446) (not e!731540))))

(assert (=> b!1280277 (= res!850446 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41209 _keys!1741))))))

(declare-fun b!1280278 () Bool)

(declare-fun e!731541 () Bool)

(declare-fun tp_is_empty!33667 () Bool)

(assert (=> b!1280278 (= e!731541 tp_is_empty!33667)))

(declare-fun b!1280280 () Bool)

(assert (=> b!1280280 (= e!731539 tp_is_empty!33667)))

(declare-fun mapNonEmpty!52052 () Bool)

(declare-fun tp!99192 () Bool)

(assert (=> mapNonEmpty!52052 (= mapRes!52052 (and tp!99192 e!731541))))

(declare-fun mapValue!52052 () ValueCell!15935)

(declare-fun mapKey!52052 () (_ BitVec 32))

(declare-fun mapRest!52052 () (Array (_ BitVec 32) ValueCell!15935))

(assert (=> mapNonEmpty!52052 (= (arr!40658 _values!1445) (store mapRest!52052 mapKey!52052 mapValue!52052))))

(declare-fun mapIsEmpty!52052 () Bool)

(assert (=> mapIsEmpty!52052 mapRes!52052))

(declare-fun b!1280279 () Bool)

(declare-fun res!850444 () Bool)

(assert (=> b!1280279 (=> (not res!850444) (not e!731540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84305 (_ BitVec 32)) Bool)

(assert (=> b!1280279 (= res!850444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!850445 () Bool)

(assert (=> start!108480 (=> (not res!850445) (not e!731540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108480 (= res!850445 (validMask!0 mask!2175))))

(assert (=> start!108480 e!731540))

(assert (=> start!108480 tp_is_empty!33667))

(assert (=> start!108480 true))

(declare-fun array_inv!31027 (array!84307) Bool)

(assert (=> start!108480 (and (array_inv!31027 _values!1445) e!731538)))

(declare-fun array_inv!31028 (array!84305) Bool)

(assert (=> start!108480 (array_inv!31028 _keys!1741)))

(assert (=> start!108480 tp!99191))

(assert (= (and start!108480 res!850445) b!1280276))

(assert (= (and b!1280276 res!850448) b!1280279))

(assert (= (and b!1280279 res!850444) b!1280273))

(assert (= (and b!1280273 res!850447) b!1280277))

(assert (= (and b!1280277 res!850446) b!1280274))

(assert (= (and b!1280275 condMapEmpty!52052) mapIsEmpty!52052))

(assert (= (and b!1280275 (not condMapEmpty!52052)) mapNonEmpty!52052))

(get-info :version)

(assert (= (and mapNonEmpty!52052 ((_ is ValueCellFull!15935) mapValue!52052)) b!1280278))

(assert (= (and b!1280275 ((_ is ValueCellFull!15935) mapDefault!52052)) b!1280280))

(assert (= start!108480 b!1280275))

(declare-fun m!1174497 () Bool)

(assert (=> b!1280279 m!1174497))

(declare-fun m!1174499 () Bool)

(assert (=> b!1280273 m!1174499))

(declare-fun m!1174501 () Bool)

(assert (=> b!1280274 m!1174501))

(assert (=> b!1280274 m!1174501))

(declare-fun m!1174503 () Bool)

(assert (=> b!1280274 m!1174503))

(declare-fun m!1174505 () Bool)

(assert (=> start!108480 m!1174505))

(declare-fun m!1174507 () Bool)

(assert (=> start!108480 m!1174507))

(declare-fun m!1174509 () Bool)

(assert (=> start!108480 m!1174509))

(declare-fun m!1174511 () Bool)

(assert (=> mapNonEmpty!52052 m!1174511))

(check-sat (not b!1280274) (not start!108480) (not b!1280273) (not b!1280279) (not mapNonEmpty!52052) (not b_next!28027) tp_is_empty!33667 b_and!46069)
(check-sat b_and!46069 (not b_next!28027))
