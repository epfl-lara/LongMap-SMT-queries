; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110740 () Bool)

(assert start!110740)

(declare-fun b_free!29575 () Bool)

(declare-fun b_next!29575 () Bool)

(assert (=> start!110740 (= b_free!29575 (not b_next!29575))))

(declare-fun tp!104048 () Bool)

(declare-fun b_and!47765 () Bool)

(assert (=> start!110740 (= tp!104048 b_and!47765)))

(declare-fun b!1310617 () Bool)

(declare-fun e!747640 () Bool)

(declare-fun tp_is_empty!35305 () Bool)

(assert (=> b!1310617 (= e!747640 tp_is_empty!35305)))

(declare-fun b!1310618 () Bool)

(declare-fun e!747641 () Bool)

(assert (=> b!1310618 (= e!747641 tp_is_empty!35305)))

(declare-fun b!1310619 () Bool)

(declare-fun res!870114 () Bool)

(declare-fun e!747643 () Bool)

(assert (=> b!1310619 (=> (not res!870114) (not e!747643))))

(declare-datatypes ((array!87513 0))(
  ( (array!87514 (arr!42237 (Array (_ BitVec 32) (_ BitVec 64))) (size!42789 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87513)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310619 (= res!870114 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42789 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310620 () Bool)

(declare-fun res!870115 () Bool)

(assert (=> b!1310620 (=> (not res!870115) (not e!747643))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52177 0))(
  ( (V!52178 (val!17727 Int)) )
))
(declare-datatypes ((ValueCell!16754 0))(
  ( (ValueCellFull!16754 (v!20353 V!52177)) (EmptyCell!16754) )
))
(declare-datatypes ((array!87515 0))(
  ( (array!87516 (arr!42238 (Array (_ BitVec 32) ValueCell!16754)) (size!42790 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87515)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310620 (= res!870115 (and (= (size!42790 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42789 _keys!1628) (size!42790 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54586 () Bool)

(declare-fun mapRes!54586 () Bool)

(assert (=> mapIsEmpty!54586 mapRes!54586))

(declare-fun b!1310621 () Bool)

(declare-fun e!747644 () Bool)

(assert (=> b!1310621 (= e!747644 (and e!747640 mapRes!54586))))

(declare-fun condMapEmpty!54586 () Bool)

(declare-fun mapDefault!54586 () ValueCell!16754)

(assert (=> b!1310621 (= condMapEmpty!54586 (= (arr!42238 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16754)) mapDefault!54586)))))

(declare-fun res!870116 () Bool)

(assert (=> start!110740 (=> (not res!870116) (not e!747643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110740 (= res!870116 (validMask!0 mask!2040))))

(assert (=> start!110740 e!747643))

(assert (=> start!110740 tp!104048))

(declare-fun array_inv!32103 (array!87513) Bool)

(assert (=> start!110740 (array_inv!32103 _keys!1628)))

(assert (=> start!110740 true))

(assert (=> start!110740 tp_is_empty!35305))

(declare-fun array_inv!32104 (array!87515) Bool)

(assert (=> start!110740 (and (array_inv!32104 _values!1354) e!747644)))

(declare-fun b!1310622 () Bool)

(assert (=> b!1310622 (= e!747643 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52177)

(declare-fun zeroValue!1296 () V!52177)

(declare-fun lt!585195 () Bool)

(declare-datatypes ((tuple2!22924 0))(
  ( (tuple2!22925 (_1!11473 (_ BitVec 64)) (_2!11473 V!52177)) )
))
(declare-datatypes ((List!30049 0))(
  ( (Nil!30046) (Cons!30045 (h!31254 tuple2!22924) (t!43647 List!30049)) )
))
(declare-datatypes ((ListLongMap!20581 0))(
  ( (ListLongMap!20582 (toList!10306 List!30049)) )
))
(declare-fun contains!8383 (ListLongMap!20581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5201 (array!87513 array!87515 (_ BitVec 32) (_ BitVec 32) V!52177 V!52177 (_ BitVec 32) Int) ListLongMap!20581)

(assert (=> b!1310622 (= lt!585195 (contains!8383 (getCurrentListMap!5201 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310623 () Bool)

(declare-fun res!870118 () Bool)

(assert (=> b!1310623 (=> (not res!870118) (not e!747643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87513 (_ BitVec 32)) Bool)

(assert (=> b!1310623 (= res!870118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310624 () Bool)

(declare-fun res!870117 () Bool)

(assert (=> b!1310624 (=> (not res!870117) (not e!747643))))

(declare-datatypes ((List!30050 0))(
  ( (Nil!30047) (Cons!30046 (h!31255 (_ BitVec 64)) (t!43648 List!30050)) )
))
(declare-fun arrayNoDuplicates!0 (array!87513 (_ BitVec 32) List!30050) Bool)

(assert (=> b!1310624 (= res!870117 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30047))))

(declare-fun mapNonEmpty!54586 () Bool)

(declare-fun tp!104047 () Bool)

(assert (=> mapNonEmpty!54586 (= mapRes!54586 (and tp!104047 e!747641))))

(declare-fun mapRest!54586 () (Array (_ BitVec 32) ValueCell!16754))

(declare-fun mapValue!54586 () ValueCell!16754)

(declare-fun mapKey!54586 () (_ BitVec 32))

(assert (=> mapNonEmpty!54586 (= (arr!42238 _values!1354) (store mapRest!54586 mapKey!54586 mapValue!54586))))

(assert (= (and start!110740 res!870116) b!1310620))

(assert (= (and b!1310620 res!870115) b!1310623))

(assert (= (and b!1310623 res!870118) b!1310624))

(assert (= (and b!1310624 res!870117) b!1310619))

(assert (= (and b!1310619 res!870114) b!1310622))

(assert (= (and b!1310621 condMapEmpty!54586) mapIsEmpty!54586))

(assert (= (and b!1310621 (not condMapEmpty!54586)) mapNonEmpty!54586))

(get-info :version)

(assert (= (and mapNonEmpty!54586 ((_ is ValueCellFull!16754) mapValue!54586)) b!1310618))

(assert (= (and b!1310621 ((_ is ValueCellFull!16754) mapDefault!54586)) b!1310617))

(assert (= start!110740 b!1310621))

(declare-fun m!1199889 () Bool)

(assert (=> start!110740 m!1199889))

(declare-fun m!1199891 () Bool)

(assert (=> start!110740 m!1199891))

(declare-fun m!1199893 () Bool)

(assert (=> start!110740 m!1199893))

(declare-fun m!1199895 () Bool)

(assert (=> b!1310622 m!1199895))

(assert (=> b!1310622 m!1199895))

(declare-fun m!1199897 () Bool)

(assert (=> b!1310622 m!1199897))

(declare-fun m!1199899 () Bool)

(assert (=> mapNonEmpty!54586 m!1199899))

(declare-fun m!1199901 () Bool)

(assert (=> b!1310624 m!1199901))

(declare-fun m!1199903 () Bool)

(assert (=> b!1310623 m!1199903))

(check-sat tp_is_empty!35305 (not b_next!29575) (not start!110740) (not mapNonEmpty!54586) (not b!1310624) b_and!47765 (not b!1310622) (not b!1310623))
(check-sat b_and!47765 (not b_next!29575))
