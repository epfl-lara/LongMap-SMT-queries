; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110712 () Bool)

(assert start!110712)

(declare-fun b_free!29547 () Bool)

(declare-fun b_next!29547 () Bool)

(assert (=> start!110712 (= b_free!29547 (not b_next!29547))))

(declare-fun tp!103962 () Bool)

(declare-fun b_and!47755 () Bool)

(assert (=> start!110712 (= tp!103962 b_and!47755)))

(declare-fun b!1310191 () Bool)

(declare-fun res!869775 () Bool)

(declare-fun e!747466 () Bool)

(assert (=> b!1310191 (=> (not res!869775) (not e!747466))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310191 (= res!869775 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310192 () Bool)

(declare-fun res!869777 () Bool)

(assert (=> b!1310192 (=> (not res!869777) (not e!747466))))

(declare-datatypes ((array!87542 0))(
  ( (array!87543 (arr!42251 (Array (_ BitVec 32) (_ BitVec 64))) (size!42801 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87542)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87542 (_ BitVec 32)) Bool)

(assert (=> b!1310192 (= res!869777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310193 () Bool)

(declare-fun e!747463 () Bool)

(declare-fun tp_is_empty!35277 () Bool)

(assert (=> b!1310193 (= e!747463 tp_is_empty!35277)))

(declare-fun b!1310194 () Bool)

(declare-fun res!869776 () Bool)

(assert (=> b!1310194 (=> (not res!869776) (not e!747466))))

(declare-datatypes ((List!29955 0))(
  ( (Nil!29952) (Cons!29951 (h!31160 (_ BitVec 64)) (t!43561 List!29955)) )
))
(declare-fun arrayNoDuplicates!0 (array!87542 (_ BitVec 32) List!29955) Bool)

(assert (=> b!1310194 (= res!869776 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29952))))

(declare-fun mapIsEmpty!54544 () Bool)

(declare-fun mapRes!54544 () Bool)

(assert (=> mapIsEmpty!54544 mapRes!54544))

(declare-fun res!869779 () Bool)

(assert (=> start!110712 (=> (not res!869779) (not e!747466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110712 (= res!869779 (validMask!0 mask!2040))))

(assert (=> start!110712 e!747466))

(assert (=> start!110712 tp!103962))

(declare-fun array_inv!31927 (array!87542) Bool)

(assert (=> start!110712 (array_inv!31927 _keys!1628)))

(assert (=> start!110712 true))

(assert (=> start!110712 tp_is_empty!35277))

(declare-datatypes ((V!52139 0))(
  ( (V!52140 (val!17713 Int)) )
))
(declare-datatypes ((ValueCell!16740 0))(
  ( (ValueCellFull!16740 (v!20340 V!52139)) (EmptyCell!16740) )
))
(declare-datatypes ((array!87544 0))(
  ( (array!87545 (arr!42252 (Array (_ BitVec 32) ValueCell!16740)) (size!42802 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87544)

(declare-fun e!747464 () Bool)

(declare-fun array_inv!31928 (array!87544) Bool)

(assert (=> start!110712 (and (array_inv!31928 _values!1354) e!747464)))

(declare-fun b!1310195 () Bool)

(declare-fun res!869773 () Bool)

(assert (=> b!1310195 (=> (not res!869773) (not e!747466))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310195 (= res!869773 (validKeyInArray!0 (select (arr!42251 _keys!1628) from!2020)))))

(declare-fun b!1310196 () Bool)

(declare-fun res!869780 () Bool)

(assert (=> b!1310196 (=> (not res!869780) (not e!747466))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310196 (= res!869780 (not (= (select (arr!42251 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310197 () Bool)

(declare-fun res!869774 () Bool)

(assert (=> b!1310197 (=> (not res!869774) (not e!747466))))

(assert (=> b!1310197 (= res!869774 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42801 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310198 () Bool)

(declare-fun res!869778 () Bool)

(assert (=> b!1310198 (=> (not res!869778) (not e!747466))))

(assert (=> b!1310198 (= res!869778 (and (= (size!42802 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42801 _keys!1628) (size!42802 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310199 () Bool)

(assert (=> b!1310199 (= e!747464 (and e!747463 mapRes!54544))))

(declare-fun condMapEmpty!54544 () Bool)

(declare-fun mapDefault!54544 () ValueCell!16740)

(assert (=> b!1310199 (= condMapEmpty!54544 (= (arr!42252 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16740)) mapDefault!54544)))))

(declare-fun b!1310200 () Bool)

(declare-fun e!747467 () Bool)

(assert (=> b!1310200 (= e!747467 tp_is_empty!35277)))

(declare-fun b!1310201 () Bool)

(assert (=> b!1310201 (= e!747466 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52139)

(declare-fun zeroValue!1296 () V!52139)

(declare-datatypes ((tuple2!22816 0))(
  ( (tuple2!22817 (_1!11419 (_ BitVec 64)) (_2!11419 V!52139)) )
))
(declare-datatypes ((List!29956 0))(
  ( (Nil!29953) (Cons!29952 (h!31161 tuple2!22816) (t!43562 List!29956)) )
))
(declare-datatypes ((ListLongMap!20473 0))(
  ( (ListLongMap!20474 (toList!10252 List!29956)) )
))
(declare-fun contains!8402 (ListLongMap!20473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5265 (array!87542 array!87544 (_ BitVec 32) (_ BitVec 32) V!52139 V!52139 (_ BitVec 32) Int) ListLongMap!20473)

(assert (=> b!1310201 (contains!8402 (getCurrentListMap!5265 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43324 0))(
  ( (Unit!43325) )
))
(declare-fun lt!585339 () Unit!43324)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!8 (array!87542 array!87544 (_ BitVec 32) (_ BitVec 32) V!52139 V!52139 (_ BitVec 64) (_ BitVec 32) Int) Unit!43324)

(assert (=> b!1310201 (= lt!585339 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!8 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310202 () Bool)

(declare-fun res!869781 () Bool)

(assert (=> b!1310202 (=> (not res!869781) (not e!747466))))

(assert (=> b!1310202 (= res!869781 (contains!8402 (getCurrentListMap!5265 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54544 () Bool)

(declare-fun tp!103963 () Bool)

(assert (=> mapNonEmpty!54544 (= mapRes!54544 (and tp!103963 e!747467))))

(declare-fun mapRest!54544 () (Array (_ BitVec 32) ValueCell!16740))

(declare-fun mapValue!54544 () ValueCell!16740)

(declare-fun mapKey!54544 () (_ BitVec 32))

(assert (=> mapNonEmpty!54544 (= (arr!42252 _values!1354) (store mapRest!54544 mapKey!54544 mapValue!54544))))

(assert (= (and start!110712 res!869779) b!1310198))

(assert (= (and b!1310198 res!869778) b!1310192))

(assert (= (and b!1310192 res!869777) b!1310194))

(assert (= (and b!1310194 res!869776) b!1310197))

(assert (= (and b!1310197 res!869774) b!1310202))

(assert (= (and b!1310202 res!869781) b!1310196))

(assert (= (and b!1310196 res!869780) b!1310195))

(assert (= (and b!1310195 res!869773) b!1310191))

(assert (= (and b!1310191 res!869775) b!1310201))

(assert (= (and b!1310199 condMapEmpty!54544) mapIsEmpty!54544))

(assert (= (and b!1310199 (not condMapEmpty!54544)) mapNonEmpty!54544))

(get-info :version)

(assert (= (and mapNonEmpty!54544 ((_ is ValueCellFull!16740) mapValue!54544)) b!1310200))

(assert (= (and b!1310199 ((_ is ValueCellFull!16740) mapDefault!54544)) b!1310193))

(assert (= start!110712 b!1310199))

(declare-fun m!1200041 () Bool)

(assert (=> b!1310196 m!1200041))

(declare-fun m!1200043 () Bool)

(assert (=> b!1310192 m!1200043))

(declare-fun m!1200045 () Bool)

(assert (=> b!1310194 m!1200045))

(assert (=> b!1310195 m!1200041))

(assert (=> b!1310195 m!1200041))

(declare-fun m!1200047 () Bool)

(assert (=> b!1310195 m!1200047))

(declare-fun m!1200049 () Bool)

(assert (=> mapNonEmpty!54544 m!1200049))

(declare-fun m!1200051 () Bool)

(assert (=> b!1310202 m!1200051))

(assert (=> b!1310202 m!1200051))

(declare-fun m!1200053 () Bool)

(assert (=> b!1310202 m!1200053))

(declare-fun m!1200055 () Bool)

(assert (=> start!110712 m!1200055))

(declare-fun m!1200057 () Bool)

(assert (=> start!110712 m!1200057))

(declare-fun m!1200059 () Bool)

(assert (=> start!110712 m!1200059))

(declare-fun m!1200061 () Bool)

(assert (=> b!1310201 m!1200061))

(assert (=> b!1310201 m!1200061))

(declare-fun m!1200063 () Bool)

(assert (=> b!1310201 m!1200063))

(declare-fun m!1200065 () Bool)

(assert (=> b!1310201 m!1200065))

(check-sat (not start!110712) (not b!1310201) (not b!1310195) (not b_next!29547) (not mapNonEmpty!54544) tp_is_empty!35277 (not b!1310194) (not b!1310202) (not b!1310192) b_and!47755)
(check-sat b_and!47755 (not b_next!29547))
