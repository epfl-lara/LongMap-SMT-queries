; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110656 () Bool)

(assert start!110656)

(declare-fun b_free!29491 () Bool)

(declare-fun b_next!29491 () Bool)

(assert (=> start!110656 (= b_free!29491 (not b_next!29491))))

(declare-fun tp!103795 () Bool)

(declare-fun b_and!47681 () Bool)

(assert (=> start!110656 (= tp!103795 b_and!47681)))

(declare-fun b!1309285 () Bool)

(declare-fun e!747011 () Bool)

(assert (=> b!1309285 (= e!747011 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87349 0))(
  ( (array!87350 (arr!42155 (Array (_ BitVec 32) (_ BitVec 64))) (size!42707 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87349)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52065 0))(
  ( (V!52066 (val!17685 Int)) )
))
(declare-datatypes ((ValueCell!16712 0))(
  ( (ValueCellFull!16712 (v!20311 V!52065)) (EmptyCell!16712) )
))
(declare-datatypes ((array!87351 0))(
  ( (array!87352 (arr!42156 (Array (_ BitVec 32) ValueCell!16712)) (size!42708 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87351)

(declare-fun zeroValue!1296 () V!52065)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585069 () Bool)

(declare-fun minValue!1296 () V!52065)

(declare-datatypes ((tuple2!22860 0))(
  ( (tuple2!22861 (_1!11441 (_ BitVec 64)) (_2!11441 V!52065)) )
))
(declare-datatypes ((List!29987 0))(
  ( (Nil!29984) (Cons!29983 (h!31192 tuple2!22860) (t!43585 List!29987)) )
))
(declare-datatypes ((ListLongMap!20517 0))(
  ( (ListLongMap!20518 (toList!10274 List!29987)) )
))
(declare-fun contains!8351 (ListLongMap!20517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5169 (array!87349 array!87351 (_ BitVec 32) (_ BitVec 32) V!52065 V!52065 (_ BitVec 32) Int) ListLongMap!20517)

(assert (=> b!1309285 (= lt!585069 (contains!8351 (getCurrentListMap!5169 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309286 () Bool)

(declare-fun e!747014 () Bool)

(declare-fun tp_is_empty!35221 () Bool)

(assert (=> b!1309286 (= e!747014 tp_is_empty!35221)))

(declare-fun mapNonEmpty!54460 () Bool)

(declare-fun mapRes!54460 () Bool)

(declare-fun tp!103796 () Bool)

(declare-fun e!747013 () Bool)

(assert (=> mapNonEmpty!54460 (= mapRes!54460 (and tp!103796 e!747013))))

(declare-fun mapRest!54460 () (Array (_ BitVec 32) ValueCell!16712))

(declare-fun mapValue!54460 () ValueCell!16712)

(declare-fun mapKey!54460 () (_ BitVec 32))

(assert (=> mapNonEmpty!54460 (= (arr!42156 _values!1354) (store mapRest!54460 mapKey!54460 mapValue!54460))))

(declare-fun res!869160 () Bool)

(assert (=> start!110656 (=> (not res!869160) (not e!747011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110656 (= res!869160 (validMask!0 mask!2040))))

(assert (=> start!110656 e!747011))

(assert (=> start!110656 tp!103795))

(declare-fun array_inv!32049 (array!87349) Bool)

(assert (=> start!110656 (array_inv!32049 _keys!1628)))

(assert (=> start!110656 true))

(assert (=> start!110656 tp_is_empty!35221))

(declare-fun e!747012 () Bool)

(declare-fun array_inv!32050 (array!87351) Bool)

(assert (=> start!110656 (and (array_inv!32050 _values!1354) e!747012)))

(declare-fun b!1309287 () Bool)

(assert (=> b!1309287 (= e!747012 (and e!747014 mapRes!54460))))

(declare-fun condMapEmpty!54460 () Bool)

(declare-fun mapDefault!54460 () ValueCell!16712)

(assert (=> b!1309287 (= condMapEmpty!54460 (= (arr!42156 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16712)) mapDefault!54460)))))

(declare-fun b!1309288 () Bool)

(declare-fun res!869163 () Bool)

(assert (=> b!1309288 (=> (not res!869163) (not e!747011))))

(declare-datatypes ((List!29988 0))(
  ( (Nil!29985) (Cons!29984 (h!31193 (_ BitVec 64)) (t!43586 List!29988)) )
))
(declare-fun arrayNoDuplicates!0 (array!87349 (_ BitVec 32) List!29988) Bool)

(assert (=> b!1309288 (= res!869163 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29985))))

(declare-fun b!1309289 () Bool)

(assert (=> b!1309289 (= e!747013 tp_is_empty!35221)))

(declare-fun b!1309290 () Bool)

(declare-fun res!869162 () Bool)

(assert (=> b!1309290 (=> (not res!869162) (not e!747011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87349 (_ BitVec 32)) Bool)

(assert (=> b!1309290 (= res!869162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309291 () Bool)

(declare-fun res!869164 () Bool)

(assert (=> b!1309291 (=> (not res!869164) (not e!747011))))

(assert (=> b!1309291 (= res!869164 (and (= (size!42708 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42707 _keys!1628) (size!42708 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54460 () Bool)

(assert (=> mapIsEmpty!54460 mapRes!54460))

(declare-fun b!1309292 () Bool)

(declare-fun res!869161 () Bool)

(assert (=> b!1309292 (=> (not res!869161) (not e!747011))))

(assert (=> b!1309292 (= res!869161 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42707 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110656 res!869160) b!1309291))

(assert (= (and b!1309291 res!869164) b!1309290))

(assert (= (and b!1309290 res!869162) b!1309288))

(assert (= (and b!1309288 res!869163) b!1309292))

(assert (= (and b!1309292 res!869161) b!1309285))

(assert (= (and b!1309287 condMapEmpty!54460) mapIsEmpty!54460))

(assert (= (and b!1309287 (not condMapEmpty!54460)) mapNonEmpty!54460))

(get-info :version)

(assert (= (and mapNonEmpty!54460 ((_ is ValueCellFull!16712) mapValue!54460)) b!1309289))

(assert (= (and b!1309287 ((_ is ValueCellFull!16712) mapDefault!54460)) b!1309286))

(assert (= start!110656 b!1309287))

(declare-fun m!1198947 () Bool)

(assert (=> mapNonEmpty!54460 m!1198947))

(declare-fun m!1198949 () Bool)

(assert (=> b!1309288 m!1198949))

(declare-fun m!1198951 () Bool)

(assert (=> b!1309285 m!1198951))

(assert (=> b!1309285 m!1198951))

(declare-fun m!1198953 () Bool)

(assert (=> b!1309285 m!1198953))

(declare-fun m!1198955 () Bool)

(assert (=> b!1309290 m!1198955))

(declare-fun m!1198957 () Bool)

(assert (=> start!110656 m!1198957))

(declare-fun m!1198959 () Bool)

(assert (=> start!110656 m!1198959))

(declare-fun m!1198961 () Bool)

(assert (=> start!110656 m!1198961))

(check-sat (not b!1309285) (not start!110656) (not mapNonEmpty!54460) (not b!1309288) (not b_next!29491) (not b!1309290) tp_is_empty!35221 b_and!47681)
(check-sat b_and!47681 (not b_next!29491))
