; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110718 () Bool)

(assert start!110718)

(declare-fun b_free!29553 () Bool)

(declare-fun b_next!29553 () Bool)

(assert (=> start!110718 (= b_free!29553 (not b_next!29553))))

(declare-fun tp!103980 () Bool)

(declare-fun b_and!47761 () Bool)

(assert (=> start!110718 (= tp!103980 b_and!47761)))

(declare-fun b!1310299 () Bool)

(declare-fun e!747510 () Bool)

(assert (=> b!1310299 (= e!747510 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87554 0))(
  ( (array!87555 (arr!42257 (Array (_ BitVec 32) (_ BitVec 64))) (size!42807 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87554)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52147 0))(
  ( (V!52148 (val!17716 Int)) )
))
(declare-fun minValue!1296 () V!52147)

(declare-datatypes ((ValueCell!16743 0))(
  ( (ValueCellFull!16743 (v!20343 V!52147)) (EmptyCell!16743) )
))
(declare-datatypes ((array!87556 0))(
  ( (array!87557 (arr!42258 (Array (_ BitVec 32) ValueCell!16743)) (size!42808 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87556)

(declare-fun zeroValue!1296 () V!52147)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22822 0))(
  ( (tuple2!22823 (_1!11422 (_ BitVec 64)) (_2!11422 V!52147)) )
))
(declare-datatypes ((List!29960 0))(
  ( (Nil!29957) (Cons!29956 (h!31165 tuple2!22822) (t!43566 List!29960)) )
))
(declare-datatypes ((ListLongMap!20479 0))(
  ( (ListLongMap!20480 (toList!10255 List!29960)) )
))
(declare-fun contains!8405 (ListLongMap!20479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5268 (array!87554 array!87556 (_ BitVec 32) (_ BitVec 32) V!52147 V!52147 (_ BitVec 32) Int) ListLongMap!20479)

(assert (=> b!1310299 (contains!8405 (getCurrentListMap!5268 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43328 0))(
  ( (Unit!43329) )
))
(declare-fun lt!585348 () Unit!43328)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!10 (array!87554 array!87556 (_ BitVec 32) (_ BitVec 32) V!52147 V!52147 (_ BitVec 64) (_ BitVec 32) Int) Unit!43328)

(assert (=> b!1310299 (= lt!585348 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!10 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54553 () Bool)

(declare-fun mapRes!54553 () Bool)

(assert (=> mapIsEmpty!54553 mapRes!54553))

(declare-fun res!869854 () Bool)

(assert (=> start!110718 (=> (not res!869854) (not e!747510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110718 (= res!869854 (validMask!0 mask!2040))))

(assert (=> start!110718 e!747510))

(assert (=> start!110718 tp!103980))

(declare-fun array_inv!31931 (array!87554) Bool)

(assert (=> start!110718 (array_inv!31931 _keys!1628)))

(assert (=> start!110718 true))

(declare-fun tp_is_empty!35283 () Bool)

(assert (=> start!110718 tp_is_empty!35283))

(declare-fun e!747512 () Bool)

(declare-fun array_inv!31932 (array!87556) Bool)

(assert (=> start!110718 (and (array_inv!31932 _values!1354) e!747512)))

(declare-fun b!1310300 () Bool)

(declare-fun e!747508 () Bool)

(assert (=> b!1310300 (= e!747508 tp_is_empty!35283)))

(declare-fun b!1310301 () Bool)

(declare-fun res!869858 () Bool)

(assert (=> b!1310301 (=> (not res!869858) (not e!747510))))

(assert (=> b!1310301 (= res!869858 (and (= (size!42808 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42807 _keys!1628) (size!42808 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310302 () Bool)

(assert (=> b!1310302 (= e!747512 (and e!747508 mapRes!54553))))

(declare-fun condMapEmpty!54553 () Bool)

(declare-fun mapDefault!54553 () ValueCell!16743)

(assert (=> b!1310302 (= condMapEmpty!54553 (= (arr!42258 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16743)) mapDefault!54553)))))

(declare-fun b!1310303 () Bool)

(declare-fun res!869857 () Bool)

(assert (=> b!1310303 (=> (not res!869857) (not e!747510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87554 (_ BitVec 32)) Bool)

(assert (=> b!1310303 (= res!869857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310304 () Bool)

(declare-fun res!869855 () Bool)

(assert (=> b!1310304 (=> (not res!869855) (not e!747510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310304 (= res!869855 (validKeyInArray!0 (select (arr!42257 _keys!1628) from!2020)))))

(declare-fun b!1310305 () Bool)

(declare-fun res!869861 () Bool)

(assert (=> b!1310305 (=> (not res!869861) (not e!747510))))

(assert (=> b!1310305 (= res!869861 (contains!8405 (getCurrentListMap!5268 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310306 () Bool)

(declare-fun res!869859 () Bool)

(assert (=> b!1310306 (=> (not res!869859) (not e!747510))))

(assert (=> b!1310306 (= res!869859 (not (= (select (arr!42257 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310307 () Bool)

(declare-fun e!747511 () Bool)

(assert (=> b!1310307 (= e!747511 tp_is_empty!35283)))

(declare-fun mapNonEmpty!54553 () Bool)

(declare-fun tp!103981 () Bool)

(assert (=> mapNonEmpty!54553 (= mapRes!54553 (and tp!103981 e!747511))))

(declare-fun mapValue!54553 () ValueCell!16743)

(declare-fun mapKey!54553 () (_ BitVec 32))

(declare-fun mapRest!54553 () (Array (_ BitVec 32) ValueCell!16743))

(assert (=> mapNonEmpty!54553 (= (arr!42258 _values!1354) (store mapRest!54553 mapKey!54553 mapValue!54553))))

(declare-fun b!1310308 () Bool)

(declare-fun res!869856 () Bool)

(assert (=> b!1310308 (=> (not res!869856) (not e!747510))))

(declare-datatypes ((List!29961 0))(
  ( (Nil!29958) (Cons!29957 (h!31166 (_ BitVec 64)) (t!43567 List!29961)) )
))
(declare-fun arrayNoDuplicates!0 (array!87554 (_ BitVec 32) List!29961) Bool)

(assert (=> b!1310308 (= res!869856 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29958))))

(declare-fun b!1310309 () Bool)

(declare-fun res!869862 () Bool)

(assert (=> b!1310309 (=> (not res!869862) (not e!747510))))

(assert (=> b!1310309 (= res!869862 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310310 () Bool)

(declare-fun res!869860 () Bool)

(assert (=> b!1310310 (=> (not res!869860) (not e!747510))))

(assert (=> b!1310310 (= res!869860 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42807 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110718 res!869854) b!1310301))

(assert (= (and b!1310301 res!869858) b!1310303))

(assert (= (and b!1310303 res!869857) b!1310308))

(assert (= (and b!1310308 res!869856) b!1310310))

(assert (= (and b!1310310 res!869860) b!1310305))

(assert (= (and b!1310305 res!869861) b!1310306))

(assert (= (and b!1310306 res!869859) b!1310304))

(assert (= (and b!1310304 res!869855) b!1310309))

(assert (= (and b!1310309 res!869862) b!1310299))

(assert (= (and b!1310302 condMapEmpty!54553) mapIsEmpty!54553))

(assert (= (and b!1310302 (not condMapEmpty!54553)) mapNonEmpty!54553))

(get-info :version)

(assert (= (and mapNonEmpty!54553 ((_ is ValueCellFull!16743) mapValue!54553)) b!1310307))

(assert (= (and b!1310302 ((_ is ValueCellFull!16743) mapDefault!54553)) b!1310300))

(assert (= start!110718 b!1310302))

(declare-fun m!1200119 () Bool)

(assert (=> mapNonEmpty!54553 m!1200119))

(declare-fun m!1200121 () Bool)

(assert (=> b!1310306 m!1200121))

(declare-fun m!1200123 () Bool)

(assert (=> b!1310303 m!1200123))

(declare-fun m!1200125 () Bool)

(assert (=> b!1310305 m!1200125))

(assert (=> b!1310305 m!1200125))

(declare-fun m!1200127 () Bool)

(assert (=> b!1310305 m!1200127))

(declare-fun m!1200129 () Bool)

(assert (=> b!1310308 m!1200129))

(declare-fun m!1200131 () Bool)

(assert (=> b!1310299 m!1200131))

(assert (=> b!1310299 m!1200131))

(declare-fun m!1200133 () Bool)

(assert (=> b!1310299 m!1200133))

(declare-fun m!1200135 () Bool)

(assert (=> b!1310299 m!1200135))

(assert (=> b!1310304 m!1200121))

(assert (=> b!1310304 m!1200121))

(declare-fun m!1200137 () Bool)

(assert (=> b!1310304 m!1200137))

(declare-fun m!1200139 () Bool)

(assert (=> start!110718 m!1200139))

(declare-fun m!1200141 () Bool)

(assert (=> start!110718 m!1200141))

(declare-fun m!1200143 () Bool)

(assert (=> start!110718 m!1200143))

(check-sat tp_is_empty!35283 (not b!1310299) (not start!110718) (not b!1310304) (not b_next!29553) (not b!1310308) (not b!1310305) (not b!1310303) (not mapNonEmpty!54553) b_and!47761)
(check-sat b_and!47761 (not b_next!29553))
