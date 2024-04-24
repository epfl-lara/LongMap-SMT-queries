; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39698 () Bool)

(assert start!39698)

(declare-fun b_free!9979 () Bool)

(declare-fun b_next!9979 () Bool)

(assert (=> start!39698 (= b_free!9979 (not b_next!9979))))

(declare-fun tp!35466 () Bool)

(declare-fun b_and!17649 () Bool)

(assert (=> start!39698 (= tp!35466 b_and!17649)))

(declare-fun b!426862 () Bool)

(declare-fun e!253178 () Bool)

(declare-fun tp_is_empty!11131 () Bool)

(assert (=> b!426862 (= e!253178 tp_is_empty!11131)))

(declare-fun b!426863 () Bool)

(declare-fun res!250289 () Bool)

(declare-fun e!253174 () Bool)

(assert (=> b!426863 (=> (not res!250289) (not e!253174))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26108 0))(
  ( (array!26109 (arr!12503 (Array (_ BitVec 32) (_ BitVec 64))) (size!12855 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26108)

(assert (=> b!426863 (= res!250289 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12855 _keys!709))))))

(declare-fun b!426865 () Bool)

(declare-fun res!250290 () Bool)

(assert (=> b!426865 (=> (not res!250290) (not e!253174))))

(assert (=> b!426865 (= res!250290 (or (= (select (arr!12503 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12503 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426866 () Bool)

(declare-fun res!250278 () Bool)

(declare-fun e!253180 () Bool)

(assert (=> b!426866 (=> (not res!250278) (not e!253180))))

(declare-fun lt!195131 () array!26108)

(declare-datatypes ((List!7276 0))(
  ( (Nil!7273) (Cons!7272 (h!8128 (_ BitVec 64)) (t!12712 List!7276)) )
))
(declare-fun arrayNoDuplicates!0 (array!26108 (_ BitVec 32) List!7276) Bool)

(assert (=> b!426866 (= res!250278 (arrayNoDuplicates!0 lt!195131 #b00000000000000000000000000000000 Nil!7273))))

(declare-fun b!426867 () Bool)

(declare-fun res!250287 () Bool)

(assert (=> b!426867 (=> (not res!250287) (not e!253174))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26108 (_ BitVec 32)) Bool)

(assert (=> b!426867 (= res!250287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426868 () Bool)

(declare-fun res!250284 () Bool)

(assert (=> b!426868 (=> (not res!250284) (not e!253174))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15947 0))(
  ( (V!15948 (val!5610 Int)) )
))
(declare-datatypes ((ValueCell!5222 0))(
  ( (ValueCellFull!5222 (v!7858 V!15947)) (EmptyCell!5222) )
))
(declare-datatypes ((array!26110 0))(
  ( (array!26111 (arr!12504 (Array (_ BitVec 32) ValueCell!5222)) (size!12856 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26110)

(assert (=> b!426868 (= res!250284 (and (= (size!12856 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12855 _keys!709) (size!12856 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426869 () Bool)

(declare-fun res!250280 () Bool)

(assert (=> b!426869 (=> (not res!250280) (not e!253174))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426869 (= res!250280 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426870 () Bool)

(declare-fun res!250281 () Bool)

(assert (=> b!426870 (=> (not res!250281) (not e!253180))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426870 (= res!250281 (bvsle from!863 i!563))))

(declare-fun b!426871 () Bool)

(declare-fun res!250283 () Bool)

(assert (=> b!426871 (=> (not res!250283) (not e!253174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426871 (= res!250283 (validKeyInArray!0 k0!794))))

(declare-fun b!426864 () Bool)

(declare-fun e!253177 () Bool)

(assert (=> b!426864 (= e!253177 tp_is_empty!11131)))

(declare-fun res!250285 () Bool)

(assert (=> start!39698 (=> (not res!250285) (not e!253174))))

(assert (=> start!39698 (= res!250285 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12855 _keys!709))))))

(assert (=> start!39698 e!253174))

(assert (=> start!39698 tp_is_empty!11131))

(assert (=> start!39698 tp!35466))

(assert (=> start!39698 true))

(declare-fun e!253176 () Bool)

(declare-fun array_inv!9180 (array!26110) Bool)

(assert (=> start!39698 (and (array_inv!9180 _values!549) e!253176)))

(declare-fun array_inv!9181 (array!26108) Bool)

(assert (=> start!39698 (array_inv!9181 _keys!709)))

(declare-fun mapNonEmpty!18318 () Bool)

(declare-fun mapRes!18318 () Bool)

(declare-fun tp!35465 () Bool)

(assert (=> mapNonEmpty!18318 (= mapRes!18318 (and tp!35465 e!253178))))

(declare-fun mapRest!18318 () (Array (_ BitVec 32) ValueCell!5222))

(declare-fun mapValue!18318 () ValueCell!5222)

(declare-fun mapKey!18318 () (_ BitVec 32))

(assert (=> mapNonEmpty!18318 (= (arr!12504 _values!549) (store mapRest!18318 mapKey!18318 mapValue!18318))))

(declare-fun b!426872 () Bool)

(assert (=> b!426872 (= e!253176 (and e!253177 mapRes!18318))))

(declare-fun condMapEmpty!18318 () Bool)

(declare-fun mapDefault!18318 () ValueCell!5222)

(assert (=> b!426872 (= condMapEmpty!18318 (= (arr!12504 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5222)) mapDefault!18318)))))

(declare-fun b!426873 () Bool)

(declare-fun e!253175 () Bool)

(assert (=> b!426873 (= e!253180 e!253175)))

(declare-fun res!250286 () Bool)

(assert (=> b!426873 (=> (not res!250286) (not e!253175))))

(assert (=> b!426873 (= res!250286 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15947)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!195129 () array!26110)

(declare-datatypes ((tuple2!7274 0))(
  ( (tuple2!7275 (_1!3648 (_ BitVec 64)) (_2!3648 V!15947)) )
))
(declare-datatypes ((List!7277 0))(
  ( (Nil!7274) (Cons!7273 (h!8129 tuple2!7274) (t!12713 List!7277)) )
))
(declare-datatypes ((ListLongMap!6189 0))(
  ( (ListLongMap!6190 (toList!3110 List!7277)) )
))
(declare-fun lt!195132 () ListLongMap!6189)

(declare-fun zeroValue!515 () V!15947)

(declare-fun getCurrentListMapNoExtraKeys!1356 (array!26108 array!26110 (_ BitVec 32) (_ BitVec 32) V!15947 V!15947 (_ BitVec 32) Int) ListLongMap!6189)

(assert (=> b!426873 (= lt!195132 (getCurrentListMapNoExtraKeys!1356 lt!195131 lt!195129 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15947)

(assert (=> b!426873 (= lt!195129 (array!26111 (store (arr!12504 _values!549) i!563 (ValueCellFull!5222 v!412)) (size!12856 _values!549)))))

(declare-fun lt!195130 () ListLongMap!6189)

(assert (=> b!426873 (= lt!195130 (getCurrentListMapNoExtraKeys!1356 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426874 () Bool)

(assert (=> b!426874 (= e!253174 e!253180)))

(declare-fun res!250288 () Bool)

(assert (=> b!426874 (=> (not res!250288) (not e!253180))))

(assert (=> b!426874 (= res!250288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195131 mask!1025))))

(assert (=> b!426874 (= lt!195131 (array!26109 (store (arr!12503 _keys!709) i!563 k0!794) (size!12855 _keys!709)))))

(declare-fun mapIsEmpty!18318 () Bool)

(assert (=> mapIsEmpty!18318 mapRes!18318))

(declare-fun b!426875 () Bool)

(declare-fun res!250282 () Bool)

(assert (=> b!426875 (=> (not res!250282) (not e!253174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426875 (= res!250282 (validMask!0 mask!1025))))

(declare-fun b!426876 () Bool)

(assert (=> b!426876 (= e!253175 (not true))))

(declare-fun +!1323 (ListLongMap!6189 tuple2!7274) ListLongMap!6189)

(assert (=> b!426876 (= (getCurrentListMapNoExtraKeys!1356 lt!195131 lt!195129 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1323 (getCurrentListMapNoExtraKeys!1356 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7275 k0!794 v!412)))))

(declare-datatypes ((Unit!12521 0))(
  ( (Unit!12522) )
))
(declare-fun lt!195128 () Unit!12521)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!507 (array!26108 array!26110 (_ BitVec 32) (_ BitVec 32) V!15947 V!15947 (_ BitVec 32) (_ BitVec 64) V!15947 (_ BitVec 32) Int) Unit!12521)

(assert (=> b!426876 (= lt!195128 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!507 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426877 () Bool)

(declare-fun res!250279 () Bool)

(assert (=> b!426877 (=> (not res!250279) (not e!253174))))

(assert (=> b!426877 (= res!250279 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7273))))

(assert (= (and start!39698 res!250285) b!426875))

(assert (= (and b!426875 res!250282) b!426868))

(assert (= (and b!426868 res!250284) b!426867))

(assert (= (and b!426867 res!250287) b!426877))

(assert (= (and b!426877 res!250279) b!426863))

(assert (= (and b!426863 res!250289) b!426871))

(assert (= (and b!426871 res!250283) b!426865))

(assert (= (and b!426865 res!250290) b!426869))

(assert (= (and b!426869 res!250280) b!426874))

(assert (= (and b!426874 res!250288) b!426866))

(assert (= (and b!426866 res!250278) b!426870))

(assert (= (and b!426870 res!250281) b!426873))

(assert (= (and b!426873 res!250286) b!426876))

(assert (= (and b!426872 condMapEmpty!18318) mapIsEmpty!18318))

(assert (= (and b!426872 (not condMapEmpty!18318)) mapNonEmpty!18318))

(get-info :version)

(assert (= (and mapNonEmpty!18318 ((_ is ValueCellFull!5222) mapValue!18318)) b!426862))

(assert (= (and b!426872 ((_ is ValueCellFull!5222) mapDefault!18318)) b!426864))

(assert (= start!39698 b!426872))

(declare-fun m!415721 () Bool)

(assert (=> b!426877 m!415721))

(declare-fun m!415723 () Bool)

(assert (=> b!426871 m!415723))

(declare-fun m!415725 () Bool)

(assert (=> b!426866 m!415725))

(declare-fun m!415727 () Bool)

(assert (=> mapNonEmpty!18318 m!415727))

(declare-fun m!415729 () Bool)

(assert (=> b!426869 m!415729))

(declare-fun m!415731 () Bool)

(assert (=> start!39698 m!415731))

(declare-fun m!415733 () Bool)

(assert (=> start!39698 m!415733))

(declare-fun m!415735 () Bool)

(assert (=> b!426876 m!415735))

(declare-fun m!415737 () Bool)

(assert (=> b!426876 m!415737))

(assert (=> b!426876 m!415737))

(declare-fun m!415739 () Bool)

(assert (=> b!426876 m!415739))

(declare-fun m!415741 () Bool)

(assert (=> b!426876 m!415741))

(declare-fun m!415743 () Bool)

(assert (=> b!426874 m!415743))

(declare-fun m!415745 () Bool)

(assert (=> b!426874 m!415745))

(declare-fun m!415747 () Bool)

(assert (=> b!426865 m!415747))

(declare-fun m!415749 () Bool)

(assert (=> b!426875 m!415749))

(declare-fun m!415751 () Bool)

(assert (=> b!426873 m!415751))

(declare-fun m!415753 () Bool)

(assert (=> b!426873 m!415753))

(declare-fun m!415755 () Bool)

(assert (=> b!426873 m!415755))

(declare-fun m!415757 () Bool)

(assert (=> b!426867 m!415757))

(check-sat tp_is_empty!11131 (not b!426877) (not b!426874) (not b!426873) b_and!17649 (not b_next!9979) (not b!426867) (not b!426871) (not b!426866) (not b!426875) (not mapNonEmpty!18318) (not b!426876) (not b!426869) (not start!39698))
(check-sat b_and!17649 (not b_next!9979))
