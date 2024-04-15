; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110680 () Bool)

(assert start!110680)

(declare-fun b_free!29515 () Bool)

(declare-fun b_next!29515 () Bool)

(assert (=> start!110680 (= b_free!29515 (not b_next!29515))))

(declare-fun tp!103868 () Bool)

(declare-fun b_and!47705 () Bool)

(assert (=> start!110680 (= tp!103868 b_and!47705)))

(declare-fun b!1309573 () Bool)

(declare-fun e!747192 () Bool)

(declare-fun tp_is_empty!35245 () Bool)

(assert (=> b!1309573 (= e!747192 tp_is_empty!35245)))

(declare-fun b!1309574 () Bool)

(declare-fun e!747193 () Bool)

(declare-fun mapRes!54496 () Bool)

(assert (=> b!1309574 (= e!747193 (and e!747192 mapRes!54496))))

(declare-fun condMapEmpty!54496 () Bool)

(declare-datatypes ((V!52097 0))(
  ( (V!52098 (val!17697 Int)) )
))
(declare-datatypes ((ValueCell!16724 0))(
  ( (ValueCellFull!16724 (v!20323 V!52097)) (EmptyCell!16724) )
))
(declare-datatypes ((array!87395 0))(
  ( (array!87396 (arr!42178 (Array (_ BitVec 32) ValueCell!16724)) (size!42730 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87395)

(declare-fun mapDefault!54496 () ValueCell!16724)

(assert (=> b!1309574 (= condMapEmpty!54496 (= (arr!42178 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16724)) mapDefault!54496)))))

(declare-fun b!1309575 () Bool)

(declare-fun res!869343 () Bool)

(declare-fun e!747194 () Bool)

(assert (=> b!1309575 (=> (not res!869343) (not e!747194))))

(declare-datatypes ((array!87397 0))(
  ( (array!87398 (arr!42179 (Array (_ BitVec 32) (_ BitVec 64))) (size!42731 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87397)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309575 (= res!869343 (and (= (size!42730 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42731 _keys!1628) (size!42730 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309576 () Bool)

(assert (=> b!1309576 (= e!747194 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52097)

(declare-fun zeroValue!1296 () V!52097)

(declare-fun lt!585105 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22878 0))(
  ( (tuple2!22879 (_1!11450 (_ BitVec 64)) (_2!11450 V!52097)) )
))
(declare-datatypes ((List!30005 0))(
  ( (Nil!30002) (Cons!30001 (h!31210 tuple2!22878) (t!43603 List!30005)) )
))
(declare-datatypes ((ListLongMap!20535 0))(
  ( (ListLongMap!20536 (toList!10283 List!30005)) )
))
(declare-fun contains!8360 (ListLongMap!20535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5178 (array!87397 array!87395 (_ BitVec 32) (_ BitVec 32) V!52097 V!52097 (_ BitVec 32) Int) ListLongMap!20535)

(assert (=> b!1309576 (= lt!585105 (contains!8360 (getCurrentListMap!5178 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309577 () Bool)

(declare-fun res!869341 () Bool)

(assert (=> b!1309577 (=> (not res!869341) (not e!747194))))

(declare-datatypes ((List!30006 0))(
  ( (Nil!30003) (Cons!30002 (h!31211 (_ BitVec 64)) (t!43604 List!30006)) )
))
(declare-fun arrayNoDuplicates!0 (array!87397 (_ BitVec 32) List!30006) Bool)

(assert (=> b!1309577 (= res!869341 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30003))))

(declare-fun b!1309578 () Bool)

(declare-fun res!869344 () Bool)

(assert (=> b!1309578 (=> (not res!869344) (not e!747194))))

(assert (=> b!1309578 (= res!869344 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42731 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!869342 () Bool)

(assert (=> start!110680 (=> (not res!869342) (not e!747194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110680 (= res!869342 (validMask!0 mask!2040))))

(assert (=> start!110680 e!747194))

(assert (=> start!110680 tp!103868))

(declare-fun array_inv!32065 (array!87397) Bool)

(assert (=> start!110680 (array_inv!32065 _keys!1628)))

(assert (=> start!110680 true))

(assert (=> start!110680 tp_is_empty!35245))

(declare-fun array_inv!32066 (array!87395) Bool)

(assert (=> start!110680 (and (array_inv!32066 _values!1354) e!747193)))

(declare-fun b!1309579 () Bool)

(declare-fun res!869340 () Bool)

(assert (=> b!1309579 (=> (not res!869340) (not e!747194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87397 (_ BitVec 32)) Bool)

(assert (=> b!1309579 (= res!869340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54496 () Bool)

(assert (=> mapIsEmpty!54496 mapRes!54496))

(declare-fun mapNonEmpty!54496 () Bool)

(declare-fun tp!103867 () Bool)

(declare-fun e!747191 () Bool)

(assert (=> mapNonEmpty!54496 (= mapRes!54496 (and tp!103867 e!747191))))

(declare-fun mapKey!54496 () (_ BitVec 32))

(declare-fun mapValue!54496 () ValueCell!16724)

(declare-fun mapRest!54496 () (Array (_ BitVec 32) ValueCell!16724))

(assert (=> mapNonEmpty!54496 (= (arr!42178 _values!1354) (store mapRest!54496 mapKey!54496 mapValue!54496))))

(declare-fun b!1309580 () Bool)

(assert (=> b!1309580 (= e!747191 tp_is_empty!35245)))

(assert (= (and start!110680 res!869342) b!1309575))

(assert (= (and b!1309575 res!869343) b!1309579))

(assert (= (and b!1309579 res!869340) b!1309577))

(assert (= (and b!1309577 res!869341) b!1309578))

(assert (= (and b!1309578 res!869344) b!1309576))

(assert (= (and b!1309574 condMapEmpty!54496) mapIsEmpty!54496))

(assert (= (and b!1309574 (not condMapEmpty!54496)) mapNonEmpty!54496))

(get-info :version)

(assert (= (and mapNonEmpty!54496 ((_ is ValueCellFull!16724) mapValue!54496)) b!1309580))

(assert (= (and b!1309574 ((_ is ValueCellFull!16724) mapDefault!54496)) b!1309573))

(assert (= start!110680 b!1309574))

(declare-fun m!1199139 () Bool)

(assert (=> b!1309579 m!1199139))

(declare-fun m!1199141 () Bool)

(assert (=> mapNonEmpty!54496 m!1199141))

(declare-fun m!1199143 () Bool)

(assert (=> start!110680 m!1199143))

(declare-fun m!1199145 () Bool)

(assert (=> start!110680 m!1199145))

(declare-fun m!1199147 () Bool)

(assert (=> start!110680 m!1199147))

(declare-fun m!1199149 () Bool)

(assert (=> b!1309576 m!1199149))

(assert (=> b!1309576 m!1199149))

(declare-fun m!1199151 () Bool)

(assert (=> b!1309576 m!1199151))

(declare-fun m!1199153 () Bool)

(assert (=> b!1309577 m!1199153))

(check-sat tp_is_empty!35245 (not mapNonEmpty!54496) (not b_next!29515) b_and!47705 (not b!1309577) (not b!1309579) (not start!110680) (not b!1309576))
(check-sat b_and!47705 (not b_next!29515))
