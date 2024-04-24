; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110880 () Bool)

(assert start!110880)

(declare-fun b_free!29491 () Bool)

(declare-fun b_next!29491 () Bool)

(assert (=> start!110880 (= b_free!29491 (not b_next!29491))))

(declare-fun tp!103794 () Bool)

(declare-fun b_and!47701 () Bool)

(assert (=> start!110880 (= tp!103794 b_and!47701)))

(declare-fun b!1310654 () Bool)

(declare-fun e!747886 () Bool)

(declare-fun tp_is_empty!35221 () Bool)

(assert (=> b!1310654 (= e!747886 tp_is_empty!35221)))

(declare-fun mapNonEmpty!54460 () Bool)

(declare-fun mapRes!54460 () Bool)

(declare-fun tp!103795 () Bool)

(assert (=> mapNonEmpty!54460 (= mapRes!54460 (and tp!103795 e!747886))))

(declare-datatypes ((V!52065 0))(
  ( (V!52066 (val!17685 Int)) )
))
(declare-datatypes ((ValueCell!16712 0))(
  ( (ValueCellFull!16712 (v!20307 V!52065)) (EmptyCell!16712) )
))
(declare-fun mapValue!54460 () ValueCell!16712)

(declare-fun mapRest!54460 () (Array (_ BitVec 32) ValueCell!16712))

(declare-fun mapKey!54460 () (_ BitVec 32))

(declare-datatypes ((array!87499 0))(
  ( (array!87500 (arr!42225 (Array (_ BitVec 32) ValueCell!16712)) (size!42776 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87499)

(assert (=> mapNonEmpty!54460 (= (arr!42225 _values!1354) (store mapRest!54460 mapKey!54460 mapValue!54460))))

(declare-fun b!1310655 () Bool)

(declare-fun e!747889 () Bool)

(declare-fun e!747890 () Bool)

(assert (=> b!1310655 (= e!747889 (and e!747890 mapRes!54460))))

(declare-fun condMapEmpty!54460 () Bool)

(declare-fun mapDefault!54460 () ValueCell!16712)

(assert (=> b!1310655 (= condMapEmpty!54460 (= (arr!42225 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16712)) mapDefault!54460)))))

(declare-fun b!1310656 () Bool)

(declare-fun res!869708 () Bool)

(declare-fun e!747887 () Bool)

(assert (=> b!1310656 (=> (not res!869708) (not e!747887))))

(declare-datatypes ((array!87501 0))(
  ( (array!87502 (arr!42226 (Array (_ BitVec 32) (_ BitVec 64))) (size!42777 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87501)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87501 (_ BitVec 32)) Bool)

(assert (=> b!1310656 (= res!869708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310657 () Bool)

(declare-fun res!869707 () Bool)

(assert (=> b!1310657 (=> (not res!869707) (not e!747887))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310657 (= res!869707 (and (= (size!42776 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42777 _keys!1628) (size!42776 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54460 () Bool)

(assert (=> mapIsEmpty!54460 mapRes!54460))

(declare-fun res!869711 () Bool)

(assert (=> start!110880 (=> (not res!869711) (not e!747887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110880 (= res!869711 (validMask!0 mask!2040))))

(assert (=> start!110880 e!747887))

(assert (=> start!110880 tp!103794))

(declare-fun array_inv!32177 (array!87501) Bool)

(assert (=> start!110880 (array_inv!32177 _keys!1628)))

(assert (=> start!110880 true))

(assert (=> start!110880 tp_is_empty!35221))

(declare-fun array_inv!32178 (array!87499) Bool)

(assert (=> start!110880 (and (array_inv!32178 _values!1354) e!747889)))

(declare-fun b!1310658 () Bool)

(assert (=> b!1310658 (= e!747890 tp_is_empty!35221)))

(declare-fun b!1310659 () Bool)

(declare-fun res!869710 () Bool)

(assert (=> b!1310659 (=> (not res!869710) (not e!747887))))

(declare-datatypes ((List!29982 0))(
  ( (Nil!29979) (Cons!29978 (h!31196 (_ BitVec 64)) (t!43580 List!29982)) )
))
(declare-fun arrayNoDuplicates!0 (array!87501 (_ BitVec 32) List!29982) Bool)

(assert (=> b!1310659 (= res!869710 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29979))))

(declare-fun b!1310660 () Bool)

(declare-fun res!869709 () Bool)

(assert (=> b!1310660 (=> (not res!869709) (not e!747887))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310660 (= res!869709 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42777 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310661 () Bool)

(assert (=> b!1310661 (= e!747887 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52065)

(declare-fun zeroValue!1296 () V!52065)

(declare-fun lt!585731 () Bool)

(declare-datatypes ((tuple2!22822 0))(
  ( (tuple2!22823 (_1!11422 (_ BitVec 64)) (_2!11422 V!52065)) )
))
(declare-datatypes ((List!29983 0))(
  ( (Nil!29980) (Cons!29979 (h!31197 tuple2!22822) (t!43581 List!29983)) )
))
(declare-datatypes ((ListLongMap!20487 0))(
  ( (ListLongMap!20488 (toList!10259 List!29983)) )
))
(declare-fun contains!8421 (ListLongMap!20487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5263 (array!87501 array!87499 (_ BitVec 32) (_ BitVec 32) V!52065 V!52065 (_ BitVec 32) Int) ListLongMap!20487)

(assert (=> b!1310661 (= lt!585731 (contains!8421 (getCurrentListMap!5263 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110880 res!869711) b!1310657))

(assert (= (and b!1310657 res!869707) b!1310656))

(assert (= (and b!1310656 res!869708) b!1310659))

(assert (= (and b!1310659 res!869710) b!1310660))

(assert (= (and b!1310660 res!869709) b!1310661))

(assert (= (and b!1310655 condMapEmpty!54460) mapIsEmpty!54460))

(assert (= (and b!1310655 (not condMapEmpty!54460)) mapNonEmpty!54460))

(get-info :version)

(assert (= (and mapNonEmpty!54460 ((_ is ValueCellFull!16712) mapValue!54460)) b!1310654))

(assert (= (and b!1310655 ((_ is ValueCellFull!16712) mapDefault!54460)) b!1310658))

(assert (= start!110880 b!1310655))

(declare-fun m!1201061 () Bool)

(assert (=> b!1310659 m!1201061))

(declare-fun m!1201063 () Bool)

(assert (=> b!1310656 m!1201063))

(declare-fun m!1201065 () Bool)

(assert (=> mapNonEmpty!54460 m!1201065))

(declare-fun m!1201067 () Bool)

(assert (=> start!110880 m!1201067))

(declare-fun m!1201069 () Bool)

(assert (=> start!110880 m!1201069))

(declare-fun m!1201071 () Bool)

(assert (=> start!110880 m!1201071))

(declare-fun m!1201073 () Bool)

(assert (=> b!1310661 m!1201073))

(assert (=> b!1310661 m!1201073))

(declare-fun m!1201075 () Bool)

(assert (=> b!1310661 m!1201075))

(check-sat (not mapNonEmpty!54460) (not start!110880) b_and!47701 (not b_next!29491) (not b!1310661) tp_is_empty!35221 (not b!1310656) (not b!1310659))
(check-sat b_and!47701 (not b_next!29491))
