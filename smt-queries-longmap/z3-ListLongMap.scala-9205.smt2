; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110578 () Bool)

(assert start!110578)

(declare-fun b_free!29413 () Bool)

(declare-fun b_next!29413 () Bool)

(assert (=> start!110578 (= b_free!29413 (not b_next!29413))))

(declare-fun tp!103562 () Bool)

(declare-fun b_and!47603 () Bool)

(assert (=> start!110578 (= tp!103562 b_and!47603)))

(declare-fun b!1308141 () Bool)

(declare-fun e!746429 () Bool)

(declare-fun e!746426 () Bool)

(declare-fun mapRes!54343 () Bool)

(assert (=> b!1308141 (= e!746429 (and e!746426 mapRes!54343))))

(declare-fun condMapEmpty!54343 () Bool)

(declare-datatypes ((V!51961 0))(
  ( (V!51962 (val!17646 Int)) )
))
(declare-datatypes ((ValueCell!16673 0))(
  ( (ValueCellFull!16673 (v!20272 V!51961)) (EmptyCell!16673) )
))
(declare-datatypes ((array!87201 0))(
  ( (array!87202 (arr!42081 (Array (_ BitVec 32) ValueCell!16673)) (size!42633 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87201)

(declare-fun mapDefault!54343 () ValueCell!16673)

(assert (=> b!1308141 (= condMapEmpty!54343 (= (arr!42081 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16673)) mapDefault!54343)))))

(declare-fun b!1308142 () Bool)

(declare-fun e!746425 () Bool)

(assert (=> b!1308142 (= e!746425 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87203 0))(
  ( (array!87204 (arr!42082 (Array (_ BitVec 32) (_ BitVec 64))) (size!42634 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87203)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!51961)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51961)

(declare-datatypes ((tuple2!22802 0))(
  ( (tuple2!22803 (_1!11412 (_ BitVec 64)) (_2!11412 V!51961)) )
))
(declare-datatypes ((List!29928 0))(
  ( (Nil!29925) (Cons!29924 (h!31133 tuple2!22802) (t!43526 List!29928)) )
))
(declare-datatypes ((ListLongMap!20459 0))(
  ( (ListLongMap!20460 (toList!10245 List!29928)) )
))
(declare-fun contains!8322 (ListLongMap!20459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5140 (array!87203 array!87201 (_ BitVec 32) (_ BitVec 32) V!51961 V!51961 (_ BitVec 32) Int) ListLongMap!20459)

(assert (=> b!1308142 (contains!8322 (getCurrentListMap!5140 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43123 0))(
  ( (Unit!43124) )
))
(declare-fun lt!584952 () Unit!43123)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!6 (array!87203 array!87201 (_ BitVec 32) (_ BitVec 32) V!51961 V!51961 (_ BitVec 64) (_ BitVec 32) Int) Unit!43123)

(assert (=> b!1308142 (= lt!584952 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!6 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308143 () Bool)

(declare-fun res!868375 () Bool)

(assert (=> b!1308143 (=> (not res!868375) (not e!746425))))

(assert (=> b!1308143 (= res!868375 (and (= (size!42633 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42634 _keys!1628) (size!42633 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!868373 () Bool)

(assert (=> start!110578 (=> (not res!868373) (not e!746425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110578 (= res!868373 (validMask!0 mask!2040))))

(assert (=> start!110578 e!746425))

(assert (=> start!110578 tp!103562))

(declare-fun array_inv!31997 (array!87203) Bool)

(assert (=> start!110578 (array_inv!31997 _keys!1628)))

(assert (=> start!110578 true))

(declare-fun tp_is_empty!35143 () Bool)

(assert (=> start!110578 tp_is_empty!35143))

(declare-fun array_inv!31998 (array!87201) Bool)

(assert (=> start!110578 (and (array_inv!31998 _values!1354) e!746429)))

(declare-fun mapIsEmpty!54343 () Bool)

(assert (=> mapIsEmpty!54343 mapRes!54343))

(declare-fun b!1308144 () Bool)

(declare-fun res!868370 () Bool)

(assert (=> b!1308144 (=> (not res!868370) (not e!746425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87203 (_ BitVec 32)) Bool)

(assert (=> b!1308144 (= res!868370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308145 () Bool)

(declare-fun res!868372 () Bool)

(assert (=> b!1308145 (=> (not res!868372) (not e!746425))))

(assert (=> b!1308145 (= res!868372 (contains!8322 (getCurrentListMap!5140 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308146 () Bool)

(declare-fun res!868369 () Bool)

(assert (=> b!1308146 (=> (not res!868369) (not e!746425))))

(assert (=> b!1308146 (= res!868369 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!54343 () Bool)

(declare-fun tp!103561 () Bool)

(declare-fun e!746427 () Bool)

(assert (=> mapNonEmpty!54343 (= mapRes!54343 (and tp!103561 e!746427))))

(declare-fun mapKey!54343 () (_ BitVec 32))

(declare-fun mapValue!54343 () ValueCell!16673)

(declare-fun mapRest!54343 () (Array (_ BitVec 32) ValueCell!16673))

(assert (=> mapNonEmpty!54343 (= (arr!42081 _values!1354) (store mapRest!54343 mapKey!54343 mapValue!54343))))

(declare-fun b!1308147 () Bool)

(declare-fun res!868371 () Bool)

(assert (=> b!1308147 (=> (not res!868371) (not e!746425))))

(assert (=> b!1308147 (= res!868371 (not (= (select (arr!42082 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308148 () Bool)

(declare-fun res!868368 () Bool)

(assert (=> b!1308148 (=> (not res!868368) (not e!746425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308148 (= res!868368 (validKeyInArray!0 (select (arr!42082 _keys!1628) from!2020)))))

(declare-fun b!1308149 () Bool)

(declare-fun res!868374 () Bool)

(assert (=> b!1308149 (=> (not res!868374) (not e!746425))))

(assert (=> b!1308149 (= res!868374 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42634 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308150 () Bool)

(declare-fun res!868367 () Bool)

(assert (=> b!1308150 (=> (not res!868367) (not e!746425))))

(declare-datatypes ((List!29929 0))(
  ( (Nil!29926) (Cons!29925 (h!31134 (_ BitVec 64)) (t!43527 List!29929)) )
))
(declare-fun arrayNoDuplicates!0 (array!87203 (_ BitVec 32) List!29929) Bool)

(assert (=> b!1308150 (= res!868367 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29926))))

(declare-fun b!1308151 () Bool)

(assert (=> b!1308151 (= e!746427 tp_is_empty!35143)))

(declare-fun b!1308152 () Bool)

(assert (=> b!1308152 (= e!746426 tp_is_empty!35143)))

(assert (= (and start!110578 res!868373) b!1308143))

(assert (= (and b!1308143 res!868375) b!1308144))

(assert (= (and b!1308144 res!868370) b!1308150))

(assert (= (and b!1308150 res!868367) b!1308149))

(assert (= (and b!1308149 res!868374) b!1308145))

(assert (= (and b!1308145 res!868372) b!1308147))

(assert (= (and b!1308147 res!868371) b!1308148))

(assert (= (and b!1308148 res!868368) b!1308146))

(assert (= (and b!1308146 res!868369) b!1308142))

(assert (= (and b!1308141 condMapEmpty!54343) mapIsEmpty!54343))

(assert (= (and b!1308141 (not condMapEmpty!54343)) mapNonEmpty!54343))

(get-info :version)

(assert (= (and mapNonEmpty!54343 ((_ is ValueCellFull!16673) mapValue!54343)) b!1308151))

(assert (= (and b!1308141 ((_ is ValueCellFull!16673) mapDefault!54343)) b!1308152))

(assert (= start!110578 b!1308141))

(declare-fun m!1198143 () Bool)

(assert (=> b!1308145 m!1198143))

(assert (=> b!1308145 m!1198143))

(declare-fun m!1198145 () Bool)

(assert (=> b!1308145 m!1198145))

(declare-fun m!1198147 () Bool)

(assert (=> b!1308148 m!1198147))

(assert (=> b!1308148 m!1198147))

(declare-fun m!1198149 () Bool)

(assert (=> b!1308148 m!1198149))

(declare-fun m!1198151 () Bool)

(assert (=> b!1308150 m!1198151))

(declare-fun m!1198153 () Bool)

(assert (=> start!110578 m!1198153))

(declare-fun m!1198155 () Bool)

(assert (=> start!110578 m!1198155))

(declare-fun m!1198157 () Bool)

(assert (=> start!110578 m!1198157))

(declare-fun m!1198159 () Bool)

(assert (=> mapNonEmpty!54343 m!1198159))

(declare-fun m!1198161 () Bool)

(assert (=> b!1308142 m!1198161))

(assert (=> b!1308142 m!1198161))

(declare-fun m!1198163 () Bool)

(assert (=> b!1308142 m!1198163))

(declare-fun m!1198165 () Bool)

(assert (=> b!1308142 m!1198165))

(declare-fun m!1198167 () Bool)

(assert (=> b!1308144 m!1198167))

(assert (=> b!1308147 m!1198147))

(check-sat (not b!1308145) (not mapNonEmpty!54343) (not b!1308150) (not b_next!29413) b_and!47603 (not start!110578) (not b!1308148) tp_is_empty!35143 (not b!1308144) (not b!1308142))
(check-sat b_and!47603 (not b_next!29413))
