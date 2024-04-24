; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110898 () Bool)

(assert start!110898)

(declare-fun b_free!29509 () Bool)

(declare-fun b_next!29509 () Bool)

(assert (=> start!110898 (= b_free!29509 (not b_next!29509))))

(declare-fun tp!103848 () Bool)

(declare-fun b_and!47719 () Bool)

(assert (=> start!110898 (= tp!103848 b_and!47719)))

(declare-fun b!1310870 () Bool)

(declare-fun res!869845 () Bool)

(declare-fun e!748022 () Bool)

(assert (=> b!1310870 (=> (not res!869845) (not e!748022))))

(declare-datatypes ((array!87533 0))(
  ( (array!87534 (arr!42242 (Array (_ BitVec 32) (_ BitVec 64))) (size!42793 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87533)

(declare-datatypes ((List!29991 0))(
  ( (Nil!29988) (Cons!29987 (h!31205 (_ BitVec 64)) (t!43589 List!29991)) )
))
(declare-fun arrayNoDuplicates!0 (array!87533 (_ BitVec 32) List!29991) Bool)

(assert (=> b!1310870 (= res!869845 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29988))))

(declare-fun b!1310871 () Bool)

(declare-fun res!869846 () Bool)

(assert (=> b!1310871 (=> (not res!869846) (not e!748022))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52089 0))(
  ( (V!52090 (val!17694 Int)) )
))
(declare-datatypes ((ValueCell!16721 0))(
  ( (ValueCellFull!16721 (v!20316 V!52089)) (EmptyCell!16721) )
))
(declare-datatypes ((array!87535 0))(
  ( (array!87536 (arr!42243 (Array (_ BitVec 32) ValueCell!16721)) (size!42794 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87535)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310871 (= res!869846 (and (= (size!42794 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42793 _keys!1628) (size!42794 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310872 () Bool)

(declare-fun e!748021 () Bool)

(declare-fun tp_is_empty!35239 () Bool)

(assert (=> b!1310872 (= e!748021 tp_is_empty!35239)))

(declare-fun b!1310873 () Bool)

(declare-fun e!748024 () Bool)

(assert (=> b!1310873 (= e!748024 tp_is_empty!35239)))

(declare-fun mapNonEmpty!54487 () Bool)

(declare-fun mapRes!54487 () Bool)

(declare-fun tp!103849 () Bool)

(assert (=> mapNonEmpty!54487 (= mapRes!54487 (and tp!103849 e!748021))))

(declare-fun mapValue!54487 () ValueCell!16721)

(declare-fun mapKey!54487 () (_ BitVec 32))

(declare-fun mapRest!54487 () (Array (_ BitVec 32) ValueCell!16721))

(assert (=> mapNonEmpty!54487 (= (arr!42243 _values!1354) (store mapRest!54487 mapKey!54487 mapValue!54487))))

(declare-fun mapIsEmpty!54487 () Bool)

(assert (=> mapIsEmpty!54487 mapRes!54487))

(declare-fun b!1310874 () Bool)

(declare-fun res!869843 () Bool)

(assert (=> b!1310874 (=> (not res!869843) (not e!748022))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310874 (= res!869843 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42793 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!869844 () Bool)

(assert (=> start!110898 (=> (not res!869844) (not e!748022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110898 (= res!869844 (validMask!0 mask!2040))))

(assert (=> start!110898 e!748022))

(assert (=> start!110898 tp!103848))

(declare-fun array_inv!32191 (array!87533) Bool)

(assert (=> start!110898 (array_inv!32191 _keys!1628)))

(assert (=> start!110898 true))

(assert (=> start!110898 tp_is_empty!35239))

(declare-fun e!748025 () Bool)

(declare-fun array_inv!32192 (array!87535) Bool)

(assert (=> start!110898 (and (array_inv!32192 _values!1354) e!748025)))

(declare-fun b!1310875 () Bool)

(assert (=> b!1310875 (= e!748022 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585758 () Bool)

(declare-fun minValue!1296 () V!52089)

(declare-fun zeroValue!1296 () V!52089)

(declare-datatypes ((tuple2!22830 0))(
  ( (tuple2!22831 (_1!11426 (_ BitVec 64)) (_2!11426 V!52089)) )
))
(declare-datatypes ((List!29992 0))(
  ( (Nil!29989) (Cons!29988 (h!31206 tuple2!22830) (t!43590 List!29992)) )
))
(declare-datatypes ((ListLongMap!20495 0))(
  ( (ListLongMap!20496 (toList!10263 List!29992)) )
))
(declare-fun contains!8425 (ListLongMap!20495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5267 (array!87533 array!87535 (_ BitVec 32) (_ BitVec 32) V!52089 V!52089 (_ BitVec 32) Int) ListLongMap!20495)

(assert (=> b!1310875 (= lt!585758 (contains!8425 (getCurrentListMap!5267 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310876 () Bool)

(assert (=> b!1310876 (= e!748025 (and e!748024 mapRes!54487))))

(declare-fun condMapEmpty!54487 () Bool)

(declare-fun mapDefault!54487 () ValueCell!16721)

(assert (=> b!1310876 (= condMapEmpty!54487 (= (arr!42243 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16721)) mapDefault!54487)))))

(declare-fun b!1310877 () Bool)

(declare-fun res!869842 () Bool)

(assert (=> b!1310877 (=> (not res!869842) (not e!748022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87533 (_ BitVec 32)) Bool)

(assert (=> b!1310877 (= res!869842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110898 res!869844) b!1310871))

(assert (= (and b!1310871 res!869846) b!1310877))

(assert (= (and b!1310877 res!869842) b!1310870))

(assert (= (and b!1310870 res!869845) b!1310874))

(assert (= (and b!1310874 res!869843) b!1310875))

(assert (= (and b!1310876 condMapEmpty!54487) mapIsEmpty!54487))

(assert (= (and b!1310876 (not condMapEmpty!54487)) mapNonEmpty!54487))

(get-info :version)

(assert (= (and mapNonEmpty!54487 ((_ is ValueCellFull!16721) mapValue!54487)) b!1310872))

(assert (= (and b!1310876 ((_ is ValueCellFull!16721) mapDefault!54487)) b!1310873))

(assert (= start!110898 b!1310876))

(declare-fun m!1201205 () Bool)

(assert (=> start!110898 m!1201205))

(declare-fun m!1201207 () Bool)

(assert (=> start!110898 m!1201207))

(declare-fun m!1201209 () Bool)

(assert (=> start!110898 m!1201209))

(declare-fun m!1201211 () Bool)

(assert (=> mapNonEmpty!54487 m!1201211))

(declare-fun m!1201213 () Bool)

(assert (=> b!1310877 m!1201213))

(declare-fun m!1201215 () Bool)

(assert (=> b!1310870 m!1201215))

(declare-fun m!1201217 () Bool)

(assert (=> b!1310875 m!1201217))

(assert (=> b!1310875 m!1201217))

(declare-fun m!1201219 () Bool)

(assert (=> b!1310875 m!1201219))

(check-sat (not mapNonEmpty!54487) (not b_next!29509) (not b!1310875) tp_is_empty!35239 (not start!110898) (not b!1310870) (not b!1310877) b_and!47719)
(check-sat b_and!47719 (not b_next!29509))
