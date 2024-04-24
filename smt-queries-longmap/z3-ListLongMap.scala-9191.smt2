; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110718 () Bool)

(assert start!110718)

(declare-fun b_free!29329 () Bool)

(declare-fun b_next!29329 () Bool)

(assert (=> start!110718 (= b_free!29329 (not b_next!29329))))

(declare-fun tp!103308 () Bool)

(declare-fun b_and!47539 () Bool)

(assert (=> start!110718 (= tp!103308 b_and!47539)))

(declare-fun b!1308386 () Bool)

(declare-fun res!868171 () Bool)

(declare-fun e!746672 () Bool)

(assert (=> b!1308386 (=> (not res!868171) (not e!746672))))

(declare-datatypes ((array!87183 0))(
  ( (array!87184 (arr!42067 (Array (_ BitVec 32) (_ BitVec 64))) (size!42618 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87183)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87183 (_ BitVec 32)) Bool)

(assert (=> b!1308386 (= res!868171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308387 () Bool)

(assert (=> b!1308387 (= e!746672 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585488 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51849 0))(
  ( (V!51850 (val!17604 Int)) )
))
(declare-fun minValue!1296 () V!51849)

(declare-datatypes ((ValueCell!16631 0))(
  ( (ValueCellFull!16631 (v!20226 V!51849)) (EmptyCell!16631) )
))
(declare-datatypes ((array!87185 0))(
  ( (array!87186 (arr!42068 (Array (_ BitVec 32) ValueCell!16631)) (size!42619 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87185)

(declare-fun zeroValue!1296 () V!51849)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22694 0))(
  ( (tuple2!22695 (_1!11358 (_ BitVec 64)) (_2!11358 V!51849)) )
))
(declare-datatypes ((List!29861 0))(
  ( (Nil!29858) (Cons!29857 (h!31075 tuple2!22694) (t!43459 List!29861)) )
))
(declare-datatypes ((ListLongMap!20359 0))(
  ( (ListLongMap!20360 (toList!10195 List!29861)) )
))
(declare-fun contains!8357 (ListLongMap!20359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5199 (array!87183 array!87185 (_ BitVec 32) (_ BitVec 32) V!51849 V!51849 (_ BitVec 32) Int) ListLongMap!20359)

(assert (=> b!1308387 (= lt!585488 (contains!8357 (getCurrentListMap!5199 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54217 () Bool)

(declare-fun mapRes!54217 () Bool)

(declare-fun tp!103309 () Bool)

(declare-fun e!746675 () Bool)

(assert (=> mapNonEmpty!54217 (= mapRes!54217 (and tp!103309 e!746675))))

(declare-fun mapRest!54217 () (Array (_ BitVec 32) ValueCell!16631))

(declare-fun mapValue!54217 () ValueCell!16631)

(declare-fun mapKey!54217 () (_ BitVec 32))

(assert (=> mapNonEmpty!54217 (= (arr!42068 _values!1354) (store mapRest!54217 mapKey!54217 mapValue!54217))))

(declare-fun mapIsEmpty!54217 () Bool)

(assert (=> mapIsEmpty!54217 mapRes!54217))

(declare-fun b!1308389 () Bool)

(declare-fun tp_is_empty!35059 () Bool)

(assert (=> b!1308389 (= e!746675 tp_is_empty!35059)))

(declare-fun b!1308388 () Bool)

(declare-fun e!746673 () Bool)

(assert (=> b!1308388 (= e!746673 tp_is_empty!35059)))

(declare-fun res!868172 () Bool)

(assert (=> start!110718 (=> (not res!868172) (not e!746672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110718 (= res!868172 (validMask!0 mask!2040))))

(assert (=> start!110718 e!746672))

(assert (=> start!110718 tp!103308))

(declare-fun array_inv!32055 (array!87183) Bool)

(assert (=> start!110718 (array_inv!32055 _keys!1628)))

(assert (=> start!110718 true))

(assert (=> start!110718 tp_is_empty!35059))

(declare-fun e!746674 () Bool)

(declare-fun array_inv!32056 (array!87185) Bool)

(assert (=> start!110718 (and (array_inv!32056 _values!1354) e!746674)))

(declare-fun b!1308390 () Bool)

(assert (=> b!1308390 (= e!746674 (and e!746673 mapRes!54217))))

(declare-fun condMapEmpty!54217 () Bool)

(declare-fun mapDefault!54217 () ValueCell!16631)

(assert (=> b!1308390 (= condMapEmpty!54217 (= (arr!42068 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16631)) mapDefault!54217)))))

(declare-fun b!1308391 () Bool)

(declare-fun res!868168 () Bool)

(assert (=> b!1308391 (=> (not res!868168) (not e!746672))))

(declare-datatypes ((List!29862 0))(
  ( (Nil!29859) (Cons!29858 (h!31076 (_ BitVec 64)) (t!43460 List!29862)) )
))
(declare-fun arrayNoDuplicates!0 (array!87183 (_ BitVec 32) List!29862) Bool)

(assert (=> b!1308391 (= res!868168 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29859))))

(declare-fun b!1308392 () Bool)

(declare-fun res!868169 () Bool)

(assert (=> b!1308392 (=> (not res!868169) (not e!746672))))

(assert (=> b!1308392 (= res!868169 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42618 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308393 () Bool)

(declare-fun res!868170 () Bool)

(assert (=> b!1308393 (=> (not res!868170) (not e!746672))))

(assert (=> b!1308393 (= res!868170 (and (= (size!42619 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42618 _keys!1628) (size!42619 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110718 res!868172) b!1308393))

(assert (= (and b!1308393 res!868170) b!1308386))

(assert (= (and b!1308386 res!868171) b!1308391))

(assert (= (and b!1308391 res!868168) b!1308392))

(assert (= (and b!1308392 res!868169) b!1308387))

(assert (= (and b!1308390 condMapEmpty!54217) mapIsEmpty!54217))

(assert (= (and b!1308390 (not condMapEmpty!54217)) mapNonEmpty!54217))

(get-info :version)

(assert (= (and mapNonEmpty!54217 ((_ is ValueCellFull!16631) mapValue!54217)) b!1308389))

(assert (= (and b!1308390 ((_ is ValueCellFull!16631) mapDefault!54217)) b!1308388))

(assert (= start!110718 b!1308390))

(declare-fun m!1199495 () Bool)

(assert (=> b!1308387 m!1199495))

(assert (=> b!1308387 m!1199495))

(declare-fun m!1199497 () Bool)

(assert (=> b!1308387 m!1199497))

(declare-fun m!1199499 () Bool)

(assert (=> b!1308391 m!1199499))

(declare-fun m!1199501 () Bool)

(assert (=> start!110718 m!1199501))

(declare-fun m!1199503 () Bool)

(assert (=> start!110718 m!1199503))

(declare-fun m!1199505 () Bool)

(assert (=> start!110718 m!1199505))

(declare-fun m!1199507 () Bool)

(assert (=> mapNonEmpty!54217 m!1199507))

(declare-fun m!1199509 () Bool)

(assert (=> b!1308386 m!1199509))

(check-sat tp_is_empty!35059 (not b!1308391) (not mapNonEmpty!54217) (not b_next!29329) (not b!1308387) (not start!110718) (not b!1308386) b_and!47539)
(check-sat b_and!47539 (not b_next!29329))
