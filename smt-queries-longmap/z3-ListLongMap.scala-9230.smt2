; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110728 () Bool)

(assert start!110728)

(declare-fun b_free!29563 () Bool)

(declare-fun b_next!29563 () Bool)

(assert (=> start!110728 (= b_free!29563 (not b_next!29563))))

(declare-fun tp!104012 () Bool)

(declare-fun b_and!47753 () Bool)

(assert (=> start!110728 (= tp!104012 b_and!47753)))

(declare-fun b!1310409 () Bool)

(declare-fun res!869964 () Bool)

(declare-fun e!747553 () Bool)

(assert (=> b!1310409 (=> (not res!869964) (not e!747553))))

(declare-datatypes ((array!87489 0))(
  ( (array!87490 (arr!42225 (Array (_ BitVec 32) (_ BitVec 64))) (size!42777 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87489)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310409 (= res!869964 (not (= (select (arr!42225 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!869967 () Bool)

(assert (=> start!110728 (=> (not res!869967) (not e!747553))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110728 (= res!869967 (validMask!0 mask!2040))))

(assert (=> start!110728 e!747553))

(assert (=> start!110728 tp!104012))

(declare-fun array_inv!32095 (array!87489) Bool)

(assert (=> start!110728 (array_inv!32095 _keys!1628)))

(assert (=> start!110728 true))

(declare-fun tp_is_empty!35293 () Bool)

(assert (=> start!110728 tp_is_empty!35293))

(declare-datatypes ((V!52161 0))(
  ( (V!52162 (val!17721 Int)) )
))
(declare-datatypes ((ValueCell!16748 0))(
  ( (ValueCellFull!16748 (v!20347 V!52161)) (EmptyCell!16748) )
))
(declare-datatypes ((array!87491 0))(
  ( (array!87492 (arr!42226 (Array (_ BitVec 32) ValueCell!16748)) (size!42778 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87491)

(declare-fun e!747554 () Bool)

(declare-fun array_inv!32096 (array!87491) Bool)

(assert (=> start!110728 (and (array_inv!32096 _values!1354) e!747554)))

(declare-fun mapNonEmpty!54568 () Bool)

(declare-fun mapRes!54568 () Bool)

(declare-fun tp!104011 () Bool)

(declare-fun e!747550 () Bool)

(assert (=> mapNonEmpty!54568 (= mapRes!54568 (and tp!104011 e!747550))))

(declare-fun mapValue!54568 () ValueCell!16748)

(declare-fun mapKey!54568 () (_ BitVec 32))

(declare-fun mapRest!54568 () (Array (_ BitVec 32) ValueCell!16748))

(assert (=> mapNonEmpty!54568 (= (arr!42226 _values!1354) (store mapRest!54568 mapKey!54568 mapValue!54568))))

(declare-fun b!1310410 () Bool)

(assert (=> b!1310410 (= e!747553 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52161)

(declare-fun zeroValue!1296 () V!52161)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22914 0))(
  ( (tuple2!22915 (_1!11468 (_ BitVec 64)) (_2!11468 V!52161)) )
))
(declare-datatypes ((List!30039 0))(
  ( (Nil!30036) (Cons!30035 (h!31244 tuple2!22914) (t!43637 List!30039)) )
))
(declare-datatypes ((ListLongMap!20571 0))(
  ( (ListLongMap!20572 (toList!10301 List!30039)) )
))
(declare-fun contains!8378 (ListLongMap!20571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5196 (array!87489 array!87491 (_ BitVec 32) (_ BitVec 32) V!52161 V!52161 (_ BitVec 32) Int) ListLongMap!20571)

(assert (=> b!1310410 (contains!8378 (getCurrentListMap!5196 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43175 0))(
  ( (Unit!43176) )
))
(declare-fun lt!585177 () Unit!43175)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!14 (array!87489 array!87491 (_ BitVec 32) (_ BitVec 32) V!52161 V!52161 (_ BitVec 64) (_ BitVec 32) Int) Unit!43175)

(assert (=> b!1310410 (= lt!585177 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310411 () Bool)

(declare-fun res!869963 () Bool)

(assert (=> b!1310411 (=> (not res!869963) (not e!747553))))

(assert (=> b!1310411 (= res!869963 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42777 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310412 () Bool)

(declare-fun res!869966 () Bool)

(assert (=> b!1310412 (=> (not res!869966) (not e!747553))))

(assert (=> b!1310412 (= res!869966 (and (= (size!42778 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42777 _keys!1628) (size!42778 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310413 () Bool)

(declare-fun e!747552 () Bool)

(assert (=> b!1310413 (= e!747552 tp_is_empty!35293)))

(declare-fun b!1310414 () Bool)

(assert (=> b!1310414 (= e!747554 (and e!747552 mapRes!54568))))

(declare-fun condMapEmpty!54568 () Bool)

(declare-fun mapDefault!54568 () ValueCell!16748)

(assert (=> b!1310414 (= condMapEmpty!54568 (= (arr!42226 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16748)) mapDefault!54568)))))

(declare-fun b!1310415 () Bool)

(declare-fun res!869968 () Bool)

(assert (=> b!1310415 (=> (not res!869968) (not e!747553))))

(assert (=> b!1310415 (= res!869968 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310416 () Bool)

(declare-fun res!869960 () Bool)

(assert (=> b!1310416 (=> (not res!869960) (not e!747553))))

(assert (=> b!1310416 (= res!869960 (contains!8378 (getCurrentListMap!5196 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310417 () Bool)

(assert (=> b!1310417 (= e!747550 tp_is_empty!35293)))

(declare-fun b!1310418 () Bool)

(declare-fun res!869965 () Bool)

(assert (=> b!1310418 (=> (not res!869965) (not e!747553))))

(declare-datatypes ((List!30040 0))(
  ( (Nil!30037) (Cons!30036 (h!31245 (_ BitVec 64)) (t!43638 List!30040)) )
))
(declare-fun arrayNoDuplicates!0 (array!87489 (_ BitVec 32) List!30040) Bool)

(assert (=> b!1310418 (= res!869965 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30037))))

(declare-fun mapIsEmpty!54568 () Bool)

(assert (=> mapIsEmpty!54568 mapRes!54568))

(declare-fun b!1310419 () Bool)

(declare-fun res!869962 () Bool)

(assert (=> b!1310419 (=> (not res!869962) (not e!747553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87489 (_ BitVec 32)) Bool)

(assert (=> b!1310419 (= res!869962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310420 () Bool)

(declare-fun res!869961 () Bool)

(assert (=> b!1310420 (=> (not res!869961) (not e!747553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310420 (= res!869961 (validKeyInArray!0 (select (arr!42225 _keys!1628) from!2020)))))

(assert (= (and start!110728 res!869967) b!1310412))

(assert (= (and b!1310412 res!869966) b!1310419))

(assert (= (and b!1310419 res!869962) b!1310418))

(assert (= (and b!1310418 res!869965) b!1310411))

(assert (= (and b!1310411 res!869963) b!1310416))

(assert (= (and b!1310416 res!869960) b!1310409))

(assert (= (and b!1310409 res!869964) b!1310420))

(assert (= (and b!1310420 res!869961) b!1310415))

(assert (= (and b!1310415 res!869968) b!1310410))

(assert (= (and b!1310414 condMapEmpty!54568) mapIsEmpty!54568))

(assert (= (and b!1310414 (not condMapEmpty!54568)) mapNonEmpty!54568))

(get-info :version)

(assert (= (and mapNonEmpty!54568 ((_ is ValueCellFull!16748) mapValue!54568)) b!1310417))

(assert (= (and b!1310414 ((_ is ValueCellFull!16748) mapDefault!54568)) b!1310413))

(assert (= start!110728 b!1310414))

(declare-fun m!1199733 () Bool)

(assert (=> b!1310418 m!1199733))

(declare-fun m!1199735 () Bool)

(assert (=> mapNonEmpty!54568 m!1199735))

(declare-fun m!1199737 () Bool)

(assert (=> b!1310409 m!1199737))

(declare-fun m!1199739 () Bool)

(assert (=> b!1310419 m!1199739))

(declare-fun m!1199741 () Bool)

(assert (=> start!110728 m!1199741))

(declare-fun m!1199743 () Bool)

(assert (=> start!110728 m!1199743))

(declare-fun m!1199745 () Bool)

(assert (=> start!110728 m!1199745))

(assert (=> b!1310420 m!1199737))

(assert (=> b!1310420 m!1199737))

(declare-fun m!1199747 () Bool)

(assert (=> b!1310420 m!1199747))

(declare-fun m!1199749 () Bool)

(assert (=> b!1310410 m!1199749))

(assert (=> b!1310410 m!1199749))

(declare-fun m!1199751 () Bool)

(assert (=> b!1310410 m!1199751))

(declare-fun m!1199753 () Bool)

(assert (=> b!1310410 m!1199753))

(declare-fun m!1199755 () Bool)

(assert (=> b!1310416 m!1199755))

(assert (=> b!1310416 m!1199755))

(declare-fun m!1199757 () Bool)

(assert (=> b!1310416 m!1199757))

(check-sat (not start!110728) (not b!1310410) tp_is_empty!35293 b_and!47753 (not b!1310420) (not b!1310419) (not b!1310416) (not b!1310418) (not mapNonEmpty!54568) (not b_next!29563))
(check-sat b_and!47753 (not b_next!29563))
