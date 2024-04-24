; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36948 () Bool)

(assert start!36948)

(declare-fun b_free!8089 () Bool)

(declare-fun b_next!8089 () Bool)

(assert (=> start!36948 (= b_free!8089 (not b_next!8089))))

(declare-fun tp!28982 () Bool)

(declare-fun b_and!15345 () Bool)

(assert (=> start!36948 (= tp!28982 b_and!15345)))

(declare-fun b!370727 () Bool)

(declare-fun res!208278 () Bool)

(declare-fun e!226378 () Bool)

(assert (=> b!370727 (=> (not res!208278) (not e!226378))))

(declare-datatypes ((array!21402 0))(
  ( (array!21403 (arr!10169 (Array (_ BitVec 32) (_ BitVec 64))) (size!10521 (_ BitVec 32))) )
))
(declare-fun lt!170064 () array!21402)

(declare-datatypes ((List!5591 0))(
  ( (Nil!5588) (Cons!5587 (h!6443 (_ BitVec 64)) (t!10733 List!5591)) )
))
(declare-fun arrayNoDuplicates!0 (array!21402 (_ BitVec 32) List!5591) Bool)

(assert (=> b!370727 (= res!208278 (arrayNoDuplicates!0 lt!170064 #b00000000000000000000000000000000 Nil!5588))))

(declare-fun mapIsEmpty!14670 () Bool)

(declare-fun mapRes!14670 () Bool)

(assert (=> mapIsEmpty!14670 mapRes!14670))

(declare-fun b!370728 () Bool)

(declare-fun res!208277 () Bool)

(declare-fun e!226381 () Bool)

(assert (=> b!370728 (=> (not res!208277) (not e!226381))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370728 (= res!208277 (validKeyInArray!0 k0!778))))

(declare-fun b!370729 () Bool)

(declare-fun res!208280 () Bool)

(assert (=> b!370729 (=> (not res!208280) (not e!226381))))

(declare-fun _keys!658 () array!21402)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21402 (_ BitVec 32)) Bool)

(assert (=> b!370729 (= res!208280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370730 () Bool)

(declare-fun res!208286 () Bool)

(assert (=> b!370730 (=> (not res!208286) (not e!226381))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12755 0))(
  ( (V!12756 (val!4413 Int)) )
))
(declare-datatypes ((ValueCell!4025 0))(
  ( (ValueCellFull!4025 (v!6611 V!12755)) (EmptyCell!4025) )
))
(declare-datatypes ((array!21404 0))(
  ( (array!21405 (arr!10170 (Array (_ BitVec 32) ValueCell!4025)) (size!10522 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21404)

(assert (=> b!370730 (= res!208286 (and (= (size!10522 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10521 _keys!658) (size!10522 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370731 () Bool)

(declare-fun res!208284 () Bool)

(assert (=> b!370731 (=> (not res!208284) (not e!226381))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370731 (= res!208284 (or (= (select (arr!10169 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10169 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370732 () Bool)

(declare-fun res!208285 () Bool)

(assert (=> b!370732 (=> (not res!208285) (not e!226381))))

(assert (=> b!370732 (= res!208285 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10521 _keys!658))))))

(declare-fun mapNonEmpty!14670 () Bool)

(declare-fun tp!28983 () Bool)

(declare-fun e!226380 () Bool)

(assert (=> mapNonEmpty!14670 (= mapRes!14670 (and tp!28983 e!226380))))

(declare-fun mapRest!14670 () (Array (_ BitVec 32) ValueCell!4025))

(declare-fun mapValue!14670 () ValueCell!4025)

(declare-fun mapKey!14670 () (_ BitVec 32))

(assert (=> mapNonEmpty!14670 (= (arr!10170 _values!506) (store mapRest!14670 mapKey!14670 mapValue!14670))))

(declare-fun b!370733 () Bool)

(assert (=> b!370733 (= e!226381 e!226378)))

(declare-fun res!208279 () Bool)

(assert (=> b!370733 (=> (not res!208279) (not e!226378))))

(assert (=> b!370733 (= res!208279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170064 mask!970))))

(assert (=> b!370733 (= lt!170064 (array!21403 (store (arr!10169 _keys!658) i!548 k0!778) (size!10521 _keys!658)))))

(declare-fun b!370734 () Bool)

(declare-fun tp_is_empty!8737 () Bool)

(assert (=> b!370734 (= e!226380 tp_is_empty!8737)))

(declare-fun res!208282 () Bool)

(assert (=> start!36948 (=> (not res!208282) (not e!226381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36948 (= res!208282 (validMask!0 mask!970))))

(assert (=> start!36948 e!226381))

(declare-fun e!226379 () Bool)

(declare-fun array_inv!7542 (array!21404) Bool)

(assert (=> start!36948 (and (array_inv!7542 _values!506) e!226379)))

(assert (=> start!36948 tp!28982))

(assert (=> start!36948 true))

(assert (=> start!36948 tp_is_empty!8737))

(declare-fun array_inv!7543 (array!21402) Bool)

(assert (=> start!36948 (array_inv!7543 _keys!658)))

(declare-fun b!370726 () Bool)

(assert (=> b!370726 (= e!226378 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12755)

(declare-fun v!373 () V!12755)

(declare-datatypes ((tuple2!5756 0))(
  ( (tuple2!5757 (_1!2889 (_ BitVec 64)) (_2!2889 V!12755)) )
))
(declare-datatypes ((List!5592 0))(
  ( (Nil!5589) (Cons!5588 (h!6444 tuple2!5756) (t!10734 List!5592)) )
))
(declare-datatypes ((ListLongMap!4671 0))(
  ( (ListLongMap!4672 (toList!2351 List!5592)) )
))
(declare-fun lt!170063 () ListLongMap!4671)

(declare-fun minValue!472 () V!12755)

(declare-fun getCurrentListMapNoExtraKeys!660 (array!21402 array!21404 (_ BitVec 32) (_ BitVec 32) V!12755 V!12755 (_ BitVec 32) Int) ListLongMap!4671)

(assert (=> b!370726 (= lt!170063 (getCurrentListMapNoExtraKeys!660 lt!170064 (array!21405 (store (arr!10170 _values!506) i!548 (ValueCellFull!4025 v!373)) (size!10522 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170065 () ListLongMap!4671)

(assert (=> b!370726 (= lt!170065 (getCurrentListMapNoExtraKeys!660 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370735 () Bool)

(declare-fun e!226383 () Bool)

(assert (=> b!370735 (= e!226379 (and e!226383 mapRes!14670))))

(declare-fun condMapEmpty!14670 () Bool)

(declare-fun mapDefault!14670 () ValueCell!4025)

(assert (=> b!370735 (= condMapEmpty!14670 (= (arr!10170 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4025)) mapDefault!14670)))))

(declare-fun b!370736 () Bool)

(assert (=> b!370736 (= e!226383 tp_is_empty!8737)))

(declare-fun b!370737 () Bool)

(declare-fun res!208283 () Bool)

(assert (=> b!370737 (=> (not res!208283) (not e!226381))))

(assert (=> b!370737 (= res!208283 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5588))))

(declare-fun b!370738 () Bool)

(declare-fun res!208281 () Bool)

(assert (=> b!370738 (=> (not res!208281) (not e!226381))))

(declare-fun arrayContainsKey!0 (array!21402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370738 (= res!208281 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36948 res!208282) b!370730))

(assert (= (and b!370730 res!208286) b!370729))

(assert (= (and b!370729 res!208280) b!370737))

(assert (= (and b!370737 res!208283) b!370732))

(assert (= (and b!370732 res!208285) b!370728))

(assert (= (and b!370728 res!208277) b!370731))

(assert (= (and b!370731 res!208284) b!370738))

(assert (= (and b!370738 res!208281) b!370733))

(assert (= (and b!370733 res!208279) b!370727))

(assert (= (and b!370727 res!208278) b!370726))

(assert (= (and b!370735 condMapEmpty!14670) mapIsEmpty!14670))

(assert (= (and b!370735 (not condMapEmpty!14670)) mapNonEmpty!14670))

(get-info :version)

(assert (= (and mapNonEmpty!14670 ((_ is ValueCellFull!4025) mapValue!14670)) b!370734))

(assert (= (and b!370735 ((_ is ValueCellFull!4025) mapDefault!14670)) b!370736))

(assert (= start!36948 b!370735))

(declare-fun m!367073 () Bool)

(assert (=> b!370733 m!367073))

(declare-fun m!367075 () Bool)

(assert (=> b!370733 m!367075))

(declare-fun m!367077 () Bool)

(assert (=> start!36948 m!367077))

(declare-fun m!367079 () Bool)

(assert (=> start!36948 m!367079))

(declare-fun m!367081 () Bool)

(assert (=> start!36948 m!367081))

(declare-fun m!367083 () Bool)

(assert (=> b!370729 m!367083))

(declare-fun m!367085 () Bool)

(assert (=> b!370727 m!367085))

(declare-fun m!367087 () Bool)

(assert (=> b!370731 m!367087))

(declare-fun m!367089 () Bool)

(assert (=> b!370728 m!367089))

(declare-fun m!367091 () Bool)

(assert (=> b!370737 m!367091))

(declare-fun m!367093 () Bool)

(assert (=> b!370738 m!367093))

(declare-fun m!367095 () Bool)

(assert (=> b!370726 m!367095))

(declare-fun m!367097 () Bool)

(assert (=> b!370726 m!367097))

(declare-fun m!367099 () Bool)

(assert (=> b!370726 m!367099))

(declare-fun m!367101 () Bool)

(assert (=> mapNonEmpty!14670 m!367101))

(check-sat tp_is_empty!8737 (not start!36948) (not b_next!8089) (not b!370728) (not b!370729) (not b!370726) b_and!15345 (not b!370738) (not b!370737) (not mapNonEmpty!14670) (not b!370727) (not b!370733))
(check-sat b_and!15345 (not b_next!8089))
