; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111258 () Bool)

(assert start!111258)

(declare-fun b_free!29869 () Bool)

(declare-fun b_next!29869 () Bool)

(assert (=> start!111258 (= b_free!29869 (not b_next!29869))))

(declare-fun tp!104929 () Bool)

(declare-fun b_and!48079 () Bool)

(assert (=> start!111258 (= tp!104929 b_and!48079)))

(declare-fun b!1315901 () Bool)

(declare-fun e!750722 () Bool)

(assert (=> b!1315901 (= e!750722 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88225 0))(
  ( (array!88226 (arr!42588 (Array (_ BitVec 32) (_ BitVec 64))) (size!43139 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88225)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52569 0))(
  ( (V!52570 (val!17874 Int)) )
))
(declare-fun minValue!1296 () V!52569)

(declare-datatypes ((ValueCell!16901 0))(
  ( (ValueCellFull!16901 (v!20496 V!52569)) (EmptyCell!16901) )
))
(declare-datatypes ((array!88227 0))(
  ( (array!88228 (arr!42589 (Array (_ BitVec 32) ValueCell!16901)) (size!43140 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88227)

(declare-fun zeroValue!1296 () V!52569)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586289 () Bool)

(declare-datatypes ((tuple2!23078 0))(
  ( (tuple2!23079 (_1!11550 (_ BitVec 64)) (_2!11550 V!52569)) )
))
(declare-datatypes ((List!30226 0))(
  ( (Nil!30223) (Cons!30222 (h!31440 tuple2!23078) (t!43824 List!30226)) )
))
(declare-datatypes ((ListLongMap!20743 0))(
  ( (ListLongMap!20744 (toList!10387 List!30226)) )
))
(declare-fun contains!8549 (ListLongMap!20743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5391 (array!88225 array!88227 (_ BitVec 32) (_ BitVec 32) V!52569 V!52569 (_ BitVec 32) Int) ListLongMap!20743)

(assert (=> b!1315901 (= lt!586289 (contains!8549 (getCurrentListMap!5391 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315902 () Bool)

(declare-fun e!750723 () Bool)

(declare-fun tp_is_empty!35599 () Bool)

(assert (=> b!1315902 (= e!750723 tp_is_empty!35599)))

(declare-fun b!1315903 () Bool)

(declare-fun e!750725 () Bool)

(assert (=> b!1315903 (= e!750725 tp_is_empty!35599)))

(declare-fun b!1315904 () Bool)

(declare-fun res!873255 () Bool)

(assert (=> b!1315904 (=> (not res!873255) (not e!750722))))

(assert (=> b!1315904 (= res!873255 (and (= (size!43140 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43139 _keys!1628) (size!43140 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55027 () Bool)

(declare-fun mapRes!55027 () Bool)

(declare-fun tp!104928 () Bool)

(assert (=> mapNonEmpty!55027 (= mapRes!55027 (and tp!104928 e!750723))))

(declare-fun mapRest!55027 () (Array (_ BitVec 32) ValueCell!16901))

(declare-fun mapKey!55027 () (_ BitVec 32))

(declare-fun mapValue!55027 () ValueCell!16901)

(assert (=> mapNonEmpty!55027 (= (arr!42589 _values!1354) (store mapRest!55027 mapKey!55027 mapValue!55027))))

(declare-fun b!1315905 () Bool)

(declare-fun e!750724 () Bool)

(assert (=> b!1315905 (= e!750724 (and e!750725 mapRes!55027))))

(declare-fun condMapEmpty!55027 () Bool)

(declare-fun mapDefault!55027 () ValueCell!16901)

(assert (=> b!1315905 (= condMapEmpty!55027 (= (arr!42589 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16901)) mapDefault!55027)))))

(declare-fun mapIsEmpty!55027 () Bool)

(assert (=> mapIsEmpty!55027 mapRes!55027))

(declare-fun b!1315906 () Bool)

(declare-fun res!873254 () Bool)

(assert (=> b!1315906 (=> (not res!873254) (not e!750722))))

(assert (=> b!1315906 (= res!873254 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43139 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873257 () Bool)

(assert (=> start!111258 (=> (not res!873257) (not e!750722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111258 (= res!873257 (validMask!0 mask!2040))))

(assert (=> start!111258 e!750722))

(assert (=> start!111258 tp!104929))

(declare-fun array_inv!32429 (array!88225) Bool)

(assert (=> start!111258 (array_inv!32429 _keys!1628)))

(assert (=> start!111258 true))

(assert (=> start!111258 tp_is_empty!35599))

(declare-fun array_inv!32430 (array!88227) Bool)

(assert (=> start!111258 (and (array_inv!32430 _values!1354) e!750724)))

(declare-fun b!1315907 () Bool)

(declare-fun res!873256 () Bool)

(assert (=> b!1315907 (=> (not res!873256) (not e!750722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88225 (_ BitVec 32)) Bool)

(assert (=> b!1315907 (= res!873256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315908 () Bool)

(declare-fun res!873253 () Bool)

(assert (=> b!1315908 (=> (not res!873253) (not e!750722))))

(declare-datatypes ((List!30227 0))(
  ( (Nil!30224) (Cons!30223 (h!31441 (_ BitVec 64)) (t!43825 List!30227)) )
))
(declare-fun arrayNoDuplicates!0 (array!88225 (_ BitVec 32) List!30227) Bool)

(assert (=> b!1315908 (= res!873253 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30224))))

(assert (= (and start!111258 res!873257) b!1315904))

(assert (= (and b!1315904 res!873255) b!1315907))

(assert (= (and b!1315907 res!873256) b!1315908))

(assert (= (and b!1315908 res!873253) b!1315906))

(assert (= (and b!1315906 res!873254) b!1315901))

(assert (= (and b!1315905 condMapEmpty!55027) mapIsEmpty!55027))

(assert (= (and b!1315905 (not condMapEmpty!55027)) mapNonEmpty!55027))

(get-info :version)

(assert (= (and mapNonEmpty!55027 ((_ is ValueCellFull!16901) mapValue!55027)) b!1315902))

(assert (= (and b!1315905 ((_ is ValueCellFull!16901) mapDefault!55027)) b!1315903))

(assert (= start!111258 b!1315905))

(declare-fun m!1204667 () Bool)

(assert (=> b!1315908 m!1204667))

(declare-fun m!1204669 () Bool)

(assert (=> start!111258 m!1204669))

(declare-fun m!1204671 () Bool)

(assert (=> start!111258 m!1204671))

(declare-fun m!1204673 () Bool)

(assert (=> start!111258 m!1204673))

(declare-fun m!1204675 () Bool)

(assert (=> b!1315907 m!1204675))

(declare-fun m!1204677 () Bool)

(assert (=> mapNonEmpty!55027 m!1204677))

(declare-fun m!1204679 () Bool)

(assert (=> b!1315901 m!1204679))

(assert (=> b!1315901 m!1204679))

(declare-fun m!1204681 () Bool)

(assert (=> b!1315901 m!1204681))

(check-sat tp_is_empty!35599 (not start!111258) (not mapNonEmpty!55027) b_and!48079 (not b_next!29869) (not b!1315908) (not b!1315907) (not b!1315901))
(check-sat b_and!48079 (not b_next!29869))
