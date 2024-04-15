; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110644 () Bool)

(assert start!110644)

(declare-fun b_free!29479 () Bool)

(declare-fun b_next!29479 () Bool)

(assert (=> start!110644 (= b_free!29479 (not b_next!29479))))

(declare-fun tp!103759 () Bool)

(declare-fun b_and!47669 () Bool)

(assert (=> start!110644 (= tp!103759 b_and!47669)))

(declare-fun mapNonEmpty!54442 () Bool)

(declare-fun mapRes!54442 () Bool)

(declare-fun tp!103760 () Bool)

(declare-fun e!746922 () Bool)

(assert (=> mapNonEmpty!54442 (= mapRes!54442 (and tp!103760 e!746922))))

(declare-datatypes ((V!52049 0))(
  ( (V!52050 (val!17679 Int)) )
))
(declare-datatypes ((ValueCell!16706 0))(
  ( (ValueCellFull!16706 (v!20305 V!52049)) (EmptyCell!16706) )
))
(declare-fun mapRest!54442 () (Array (_ BitVec 32) ValueCell!16706))

(declare-fun mapValue!54442 () ValueCell!16706)

(declare-fun mapKey!54442 () (_ BitVec 32))

(declare-datatypes ((array!87327 0))(
  ( (array!87328 (arr!42144 (Array (_ BitVec 32) ValueCell!16706)) (size!42696 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87327)

(assert (=> mapNonEmpty!54442 (= (arr!42144 _values!1354) (store mapRest!54442 mapKey!54442 mapValue!54442))))

(declare-fun b!1309141 () Bool)

(declare-fun e!746923 () Bool)

(declare-fun tp_is_empty!35209 () Bool)

(assert (=> b!1309141 (= e!746923 tp_is_empty!35209)))

(declare-fun b!1309142 () Bool)

(declare-fun e!746921 () Bool)

(assert (=> b!1309142 (= e!746921 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585051 () Bool)

(declare-datatypes ((array!87329 0))(
  ( (array!87330 (arr!42145 (Array (_ BitVec 32) (_ BitVec 64))) (size!42697 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87329)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52049)

(declare-fun zeroValue!1296 () V!52049)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22850 0))(
  ( (tuple2!22851 (_1!11436 (_ BitVec 64)) (_2!11436 V!52049)) )
))
(declare-datatypes ((List!29978 0))(
  ( (Nil!29975) (Cons!29974 (h!31183 tuple2!22850) (t!43576 List!29978)) )
))
(declare-datatypes ((ListLongMap!20507 0))(
  ( (ListLongMap!20508 (toList!10269 List!29978)) )
))
(declare-fun contains!8346 (ListLongMap!20507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5164 (array!87329 array!87327 (_ BitVec 32) (_ BitVec 32) V!52049 V!52049 (_ BitVec 32) Int) ListLongMap!20507)

(assert (=> b!1309142 (= lt!585051 (contains!8346 (getCurrentListMap!5164 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309143 () Bool)

(declare-fun res!869072 () Bool)

(assert (=> b!1309143 (=> (not res!869072) (not e!746921))))

(assert (=> b!1309143 (= res!869072 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42697 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!869070 () Bool)

(assert (=> start!110644 (=> (not res!869070) (not e!746921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110644 (= res!869070 (validMask!0 mask!2040))))

(assert (=> start!110644 e!746921))

(assert (=> start!110644 tp!103759))

(declare-fun array_inv!32043 (array!87329) Bool)

(assert (=> start!110644 (array_inv!32043 _keys!1628)))

(assert (=> start!110644 true))

(assert (=> start!110644 tp_is_empty!35209))

(declare-fun e!746924 () Bool)

(declare-fun array_inv!32044 (array!87327) Bool)

(assert (=> start!110644 (and (array_inv!32044 _values!1354) e!746924)))

(declare-fun b!1309144 () Bool)

(declare-fun res!869074 () Bool)

(assert (=> b!1309144 (=> (not res!869074) (not e!746921))))

(declare-datatypes ((List!29979 0))(
  ( (Nil!29976) (Cons!29975 (h!31184 (_ BitVec 64)) (t!43577 List!29979)) )
))
(declare-fun arrayNoDuplicates!0 (array!87329 (_ BitVec 32) List!29979) Bool)

(assert (=> b!1309144 (= res!869074 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29976))))

(declare-fun mapIsEmpty!54442 () Bool)

(assert (=> mapIsEmpty!54442 mapRes!54442))

(declare-fun b!1309145 () Bool)

(assert (=> b!1309145 (= e!746924 (and e!746923 mapRes!54442))))

(declare-fun condMapEmpty!54442 () Bool)

(declare-fun mapDefault!54442 () ValueCell!16706)

(assert (=> b!1309145 (= condMapEmpty!54442 (= (arr!42144 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16706)) mapDefault!54442)))))

(declare-fun b!1309146 () Bool)

(declare-fun res!869073 () Bool)

(assert (=> b!1309146 (=> (not res!869073) (not e!746921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87329 (_ BitVec 32)) Bool)

(assert (=> b!1309146 (= res!869073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309147 () Bool)

(declare-fun res!869071 () Bool)

(assert (=> b!1309147 (=> (not res!869071) (not e!746921))))

(assert (=> b!1309147 (= res!869071 (and (= (size!42696 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42697 _keys!1628) (size!42696 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309148 () Bool)

(assert (=> b!1309148 (= e!746922 tp_is_empty!35209)))

(assert (= (and start!110644 res!869070) b!1309147))

(assert (= (and b!1309147 res!869071) b!1309146))

(assert (= (and b!1309146 res!869073) b!1309144))

(assert (= (and b!1309144 res!869074) b!1309143))

(assert (= (and b!1309143 res!869072) b!1309142))

(assert (= (and b!1309145 condMapEmpty!54442) mapIsEmpty!54442))

(assert (= (and b!1309145 (not condMapEmpty!54442)) mapNonEmpty!54442))

(get-info :version)

(assert (= (and mapNonEmpty!54442 ((_ is ValueCellFull!16706) mapValue!54442)) b!1309148))

(assert (= (and b!1309145 ((_ is ValueCellFull!16706) mapDefault!54442)) b!1309141))

(assert (= start!110644 b!1309145))

(declare-fun m!1198851 () Bool)

(assert (=> b!1309146 m!1198851))

(declare-fun m!1198853 () Bool)

(assert (=> start!110644 m!1198853))

(declare-fun m!1198855 () Bool)

(assert (=> start!110644 m!1198855))

(declare-fun m!1198857 () Bool)

(assert (=> start!110644 m!1198857))

(declare-fun m!1198859 () Bool)

(assert (=> b!1309144 m!1198859))

(declare-fun m!1198861 () Bool)

(assert (=> b!1309142 m!1198861))

(assert (=> b!1309142 m!1198861))

(declare-fun m!1198863 () Bool)

(assert (=> b!1309142 m!1198863))

(declare-fun m!1198865 () Bool)

(assert (=> mapNonEmpty!54442 m!1198865))

(check-sat (not start!110644) b_and!47669 tp_is_empty!35209 (not b!1309144) (not mapNonEmpty!54442) (not b!1309142) (not b!1309146) (not b_next!29479))
(check-sat b_and!47669 (not b_next!29479))
