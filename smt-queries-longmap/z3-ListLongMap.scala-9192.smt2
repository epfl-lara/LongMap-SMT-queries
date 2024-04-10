; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110502 () Bool)

(assert start!110502)

(declare-fun b_free!29337 () Bool)

(declare-fun b_next!29337 () Bool)

(assert (=> start!110502 (= b_free!29337 (not b_next!29337))))

(declare-fun tp!103332 () Bool)

(declare-fun b_and!47545 () Bool)

(assert (=> start!110502 (= tp!103332 b_and!47545)))

(declare-fun res!867714 () Bool)

(declare-fun e!745889 () Bool)

(assert (=> start!110502 (=> (not res!867714) (not e!745889))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110502 (= res!867714 (validMask!0 mask!2040))))

(assert (=> start!110502 e!745889))

(assert (=> start!110502 tp!103332))

(declare-datatypes ((array!87138 0))(
  ( (array!87139 (arr!42049 (Array (_ BitVec 32) (_ BitVec 64))) (size!42599 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87138)

(declare-fun array_inv!31787 (array!87138) Bool)

(assert (=> start!110502 (array_inv!31787 _keys!1628)))

(assert (=> start!110502 true))

(declare-fun tp_is_empty!35067 () Bool)

(assert (=> start!110502 tp_is_empty!35067))

(declare-datatypes ((V!51859 0))(
  ( (V!51860 (val!17608 Int)) )
))
(declare-datatypes ((ValueCell!16635 0))(
  ( (ValueCellFull!16635 (v!20235 V!51859)) (EmptyCell!16635) )
))
(declare-datatypes ((array!87140 0))(
  ( (array!87141 (arr!42050 (Array (_ BitVec 32) ValueCell!16635)) (size!42600 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87140)

(declare-fun e!745888 () Bool)

(declare-fun array_inv!31788 (array!87140) Bool)

(assert (=> start!110502 (and (array_inv!31788 _values!1354) e!745888)))

(declare-fun b!1307183 () Bool)

(declare-fun e!745890 () Bool)

(declare-fun mapRes!54229 () Bool)

(assert (=> b!1307183 (= e!745888 (and e!745890 mapRes!54229))))

(declare-fun condMapEmpty!54229 () Bool)

(declare-fun mapDefault!54229 () ValueCell!16635)

(assert (=> b!1307183 (= condMapEmpty!54229 (= (arr!42050 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16635)) mapDefault!54229)))))

(declare-fun b!1307184 () Bool)

(declare-fun res!867713 () Bool)

(assert (=> b!1307184 (=> (not res!867713) (not e!745889))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307184 (= res!867713 (and (= (size!42600 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42599 _keys!1628) (size!42600 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307185 () Bool)

(declare-fun res!867711 () Bool)

(assert (=> b!1307185 (=> (not res!867711) (not e!745889))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1307185 (= res!867711 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42599 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307186 () Bool)

(declare-fun e!745892 () Bool)

(assert (=> b!1307186 (= e!745892 tp_is_empty!35067)))

(declare-fun b!1307187 () Bool)

(assert (=> b!1307187 (= e!745889 false)))

(declare-fun lt!585024 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51859)

(declare-fun zeroValue!1296 () V!51859)

(declare-datatypes ((tuple2!22672 0))(
  ( (tuple2!22673 (_1!11347 (_ BitVec 64)) (_2!11347 V!51859)) )
))
(declare-datatypes ((List!29812 0))(
  ( (Nil!29809) (Cons!29808 (h!31017 tuple2!22672) (t!43418 List!29812)) )
))
(declare-datatypes ((ListLongMap!20329 0))(
  ( (ListLongMap!20330 (toList!10180 List!29812)) )
))
(declare-fun contains!8330 (ListLongMap!20329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5193 (array!87138 array!87140 (_ BitVec 32) (_ BitVec 32) V!51859 V!51859 (_ BitVec 32) Int) ListLongMap!20329)

(assert (=> b!1307187 (= lt!585024 (contains!8330 (getCurrentListMap!5193 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307188 () Bool)

(declare-fun res!867712 () Bool)

(assert (=> b!1307188 (=> (not res!867712) (not e!745889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87138 (_ BitVec 32)) Bool)

(assert (=> b!1307188 (= res!867712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307189 () Bool)

(assert (=> b!1307189 (= e!745890 tp_is_empty!35067)))

(declare-fun b!1307190 () Bool)

(declare-fun res!867710 () Bool)

(assert (=> b!1307190 (=> (not res!867710) (not e!745889))))

(declare-datatypes ((List!29813 0))(
  ( (Nil!29810) (Cons!29809 (h!31018 (_ BitVec 64)) (t!43419 List!29813)) )
))
(declare-fun arrayNoDuplicates!0 (array!87138 (_ BitVec 32) List!29813) Bool)

(assert (=> b!1307190 (= res!867710 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29810))))

(declare-fun mapNonEmpty!54229 () Bool)

(declare-fun tp!103333 () Bool)

(assert (=> mapNonEmpty!54229 (= mapRes!54229 (and tp!103333 e!745892))))

(declare-fun mapRest!54229 () (Array (_ BitVec 32) ValueCell!16635))

(declare-fun mapKey!54229 () (_ BitVec 32))

(declare-fun mapValue!54229 () ValueCell!16635)

(assert (=> mapNonEmpty!54229 (= (arr!42050 _values!1354) (store mapRest!54229 mapKey!54229 mapValue!54229))))

(declare-fun mapIsEmpty!54229 () Bool)

(assert (=> mapIsEmpty!54229 mapRes!54229))

(assert (= (and start!110502 res!867714) b!1307184))

(assert (= (and b!1307184 res!867713) b!1307188))

(assert (= (and b!1307188 res!867712) b!1307190))

(assert (= (and b!1307190 res!867710) b!1307185))

(assert (= (and b!1307185 res!867711) b!1307187))

(assert (= (and b!1307183 condMapEmpty!54229) mapIsEmpty!54229))

(assert (= (and b!1307183 (not condMapEmpty!54229)) mapNonEmpty!54229))

(get-info :version)

(assert (= (and mapNonEmpty!54229 ((_ is ValueCellFull!16635) mapValue!54229)) b!1307186))

(assert (= (and b!1307183 ((_ is ValueCellFull!16635) mapDefault!54229)) b!1307189))

(assert (= start!110502 b!1307183))

(declare-fun m!1197961 () Bool)

(assert (=> b!1307190 m!1197961))

(declare-fun m!1197963 () Bool)

(assert (=> b!1307188 m!1197963))

(declare-fun m!1197965 () Bool)

(assert (=> start!110502 m!1197965))

(declare-fun m!1197967 () Bool)

(assert (=> start!110502 m!1197967))

(declare-fun m!1197969 () Bool)

(assert (=> start!110502 m!1197969))

(declare-fun m!1197971 () Bool)

(assert (=> b!1307187 m!1197971))

(assert (=> b!1307187 m!1197971))

(declare-fun m!1197973 () Bool)

(assert (=> b!1307187 m!1197973))

(declare-fun m!1197975 () Bool)

(assert (=> mapNonEmpty!54229 m!1197975))

(check-sat (not start!110502) tp_is_empty!35067 b_and!47545 (not mapNonEmpty!54229) (not b_next!29337) (not b!1307188) (not b!1307187) (not b!1307190))
(check-sat b_and!47545 (not b_next!29337))
