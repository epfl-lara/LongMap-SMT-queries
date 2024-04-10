; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!820 () Bool)

(assert start!820)

(declare-fun b_free!213 () Bool)

(declare-fun b_next!213 () Bool)

(assert (=> start!820 (= b_free!213 (not b_next!213))))

(declare-fun tp!868 () Bool)

(declare-fun b_and!359 () Bool)

(assert (=> start!820 (= tp!868 b_and!359)))

(declare-fun b!6314 () Bool)

(declare-fun e!3463 () Bool)

(declare-fun e!3461 () Bool)

(declare-fun mapRes!407 () Bool)

(assert (=> b!6314 (= e!3463 (and e!3461 mapRes!407))))

(declare-fun condMapEmpty!407 () Bool)

(declare-datatypes ((V!565 0))(
  ( (V!566 (val!151 Int)) )
))
(declare-datatypes ((ValueCell!129 0))(
  ( (ValueCellFull!129 (v!1242 V!565)) (EmptyCell!129) )
))
(declare-datatypes ((array!515 0))(
  ( (array!516 (arr!246 (Array (_ BitVec 32) ValueCell!129)) (size!308 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!515)

(declare-fun mapDefault!407 () ValueCell!129)

(assert (=> b!6314 (= condMapEmpty!407 (= (arr!246 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!129)) mapDefault!407)))))

(declare-fun b!6315 () Bool)

(declare-fun res!6744 () Bool)

(declare-fun e!3467 () Bool)

(assert (=> b!6315 (=> (not res!6744) (not e!3467))))

(declare-datatypes ((array!517 0))(
  ( (array!518 (arr!247 (Array (_ BitVec 32) (_ BitVec 64))) (size!309 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!517)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!517 (_ BitVec 32)) Bool)

(assert (=> b!6315 (= res!6744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6316 () Bool)

(declare-fun res!6742 () Bool)

(assert (=> b!6316 (=> (not res!6742) (not e!3467))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6316 (= res!6742 (validKeyInArray!0 k0!1278))))

(declare-fun b!6317 () Bool)

(declare-fun e!3466 () Bool)

(declare-fun e!3462 () Bool)

(assert (=> b!6317 (= e!3466 e!3462)))

(declare-fun res!6746 () Bool)

(assert (=> b!6317 (=> res!6746 e!3462)))

(assert (=> b!6317 (= res!6746 (not (= (size!309 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1168 () (_ BitVec 32))

(assert (=> b!6317 (arrayForallSeekEntryOrOpenFound!0 lt!1168 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!101 0))(
  ( (Unit!102) )
))
(declare-fun lt!1167 () Unit!101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!101)

(assert (=> b!6317 (= lt!1167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1168))))

(declare-fun arrayScanForKey!0 (array!517 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6317 (= lt!1168 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6318 () Bool)

(assert (=> b!6318 (= e!3467 (not e!3466))))

(declare-fun res!6747 () Bool)

(assert (=> b!6318 (=> res!6747 e!3466)))

(declare-fun arrayContainsKey!0 (array!517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6318 (= res!6747 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3460 () Bool)

(assert (=> b!6318 e!3460))

(declare-fun c!452 () Bool)

(assert (=> b!6318 (= c!452 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!565)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!565)

(declare-fun lt!1170 () Unit!101)

(declare-fun lemmaKeyInListMapIsInArray!36 (array!517 array!515 (_ BitVec 32) (_ BitVec 32) V!565 V!565 (_ BitVec 64) Int) Unit!101)

(assert (=> b!6318 (= lt!1170 (lemmaKeyInListMapIsInArray!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!407 () Bool)

(declare-fun tp!869 () Bool)

(declare-fun e!3465 () Bool)

(assert (=> mapNonEmpty!407 (= mapRes!407 (and tp!869 e!3465))))

(declare-fun mapValue!407 () ValueCell!129)

(declare-fun mapRest!407 () (Array (_ BitVec 32) ValueCell!129))

(declare-fun mapKey!407 () (_ BitVec 32))

(assert (=> mapNonEmpty!407 (= (arr!246 _values!1492) (store mapRest!407 mapKey!407 mapValue!407))))

(declare-fun b!6319 () Bool)

(declare-fun tp_is_empty!291 () Bool)

(assert (=> b!6319 (= e!3465 tp_is_empty!291)))

(declare-fun b!6320 () Bool)

(declare-fun res!6741 () Bool)

(assert (=> b!6320 (=> (not res!6741) (not e!3467))))

(declare-datatypes ((List!165 0))(
  ( (Nil!162) (Cons!161 (h!727 (_ BitVec 64)) (t!2300 List!165)) )
))
(declare-fun arrayNoDuplicates!0 (array!517 (_ BitVec 32) List!165) Bool)

(assert (=> b!6320 (= res!6741 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!162))))

(declare-fun b!6321 () Bool)

(declare-fun res!6748 () Bool)

(assert (=> b!6321 (=> (not res!6748) (not e!3467))))

(assert (=> b!6321 (= res!6748 (and (= (size!308 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!309 _keys!1806) (size!308 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6322 () Bool)

(declare-fun res!6745 () Bool)

(assert (=> b!6322 (=> (not res!6745) (not e!3467))))

(declare-datatypes ((tuple2!156 0))(
  ( (tuple2!157 (_1!78 (_ BitVec 64)) (_2!78 V!565)) )
))
(declare-datatypes ((List!166 0))(
  ( (Nil!163) (Cons!162 (h!728 tuple2!156) (t!2301 List!166)) )
))
(declare-datatypes ((ListLongMap!161 0))(
  ( (ListLongMap!162 (toList!96 List!166)) )
))
(declare-fun contains!70 (ListLongMap!161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!55 (array!517 array!515 (_ BitVec 32) (_ BitVec 32) V!565 V!565 (_ BitVec 32) Int) ListLongMap!161)

(assert (=> b!6322 (= res!6745 (contains!70 (getCurrentListMap!55 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6324 () Bool)

(assert (=> b!6324 (= e!3462 true)))

(declare-datatypes ((SeekEntryResult!17 0))(
  ( (MissingZero!17 (index!2187 (_ BitVec 32))) (Found!17 (index!2188 (_ BitVec 32))) (Intermediate!17 (undefined!829 Bool) (index!2189 (_ BitVec 32)) (x!2515 (_ BitVec 32))) (Undefined!17) (MissingVacant!17 (index!2190 (_ BitVec 32))) )
))
(declare-fun lt!1169 () SeekEntryResult!17)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!517 (_ BitVec 32)) SeekEntryResult!17)

(assert (=> b!6324 (= lt!1169 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6325 () Bool)

(assert (=> b!6325 (= e!3461 tp_is_empty!291)))

(declare-fun b!6326 () Bool)

(assert (=> b!6326 (= e!3460 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!407 () Bool)

(assert (=> mapIsEmpty!407 mapRes!407))

(declare-fun res!6743 () Bool)

(assert (=> start!820 (=> (not res!6743) (not e!3467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!820 (= res!6743 (validMask!0 mask!2250))))

(assert (=> start!820 e!3467))

(assert (=> start!820 tp!868))

(assert (=> start!820 true))

(declare-fun array_inv!179 (array!515) Bool)

(assert (=> start!820 (and (array_inv!179 _values!1492) e!3463)))

(assert (=> start!820 tp_is_empty!291))

(declare-fun array_inv!180 (array!517) Bool)

(assert (=> start!820 (array_inv!180 _keys!1806)))

(declare-fun b!6323 () Bool)

(assert (=> b!6323 (= e!3460 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!820 res!6743) b!6321))

(assert (= (and b!6321 res!6748) b!6315))

(assert (= (and b!6315 res!6744) b!6320))

(assert (= (and b!6320 res!6741) b!6322))

(assert (= (and b!6322 res!6745) b!6316))

(assert (= (and b!6316 res!6742) b!6318))

(assert (= (and b!6318 c!452) b!6323))

(assert (= (and b!6318 (not c!452)) b!6326))

(assert (= (and b!6318 (not res!6747)) b!6317))

(assert (= (and b!6317 (not res!6746)) b!6324))

(assert (= (and b!6314 condMapEmpty!407) mapIsEmpty!407))

(assert (= (and b!6314 (not condMapEmpty!407)) mapNonEmpty!407))

(get-info :version)

(assert (= (and mapNonEmpty!407 ((_ is ValueCellFull!129) mapValue!407)) b!6319))

(assert (= (and b!6314 ((_ is ValueCellFull!129) mapDefault!407)) b!6325))

(assert (= start!820 b!6314))

(declare-fun m!3617 () Bool)

(assert (=> b!6318 m!3617))

(declare-fun m!3619 () Bool)

(assert (=> b!6318 m!3619))

(declare-fun m!3621 () Bool)

(assert (=> b!6315 m!3621))

(declare-fun m!3623 () Bool)

(assert (=> b!6317 m!3623))

(declare-fun m!3625 () Bool)

(assert (=> b!6317 m!3625))

(declare-fun m!3627 () Bool)

(assert (=> b!6317 m!3627))

(declare-fun m!3629 () Bool)

(assert (=> b!6316 m!3629))

(declare-fun m!3631 () Bool)

(assert (=> start!820 m!3631))

(declare-fun m!3633 () Bool)

(assert (=> start!820 m!3633))

(declare-fun m!3635 () Bool)

(assert (=> start!820 m!3635))

(declare-fun m!3637 () Bool)

(assert (=> mapNonEmpty!407 m!3637))

(declare-fun m!3639 () Bool)

(assert (=> b!6320 m!3639))

(assert (=> b!6323 m!3617))

(declare-fun m!3641 () Bool)

(assert (=> b!6322 m!3641))

(assert (=> b!6322 m!3641))

(declare-fun m!3643 () Bool)

(assert (=> b!6322 m!3643))

(declare-fun m!3645 () Bool)

(assert (=> b!6324 m!3645))

(check-sat (not start!820) tp_is_empty!291 (not b!6316) (not mapNonEmpty!407) (not b!6318) (not b!6320) (not b!6324) (not b_next!213) b_and!359 (not b!6315) (not b!6317) (not b!6322) (not b!6323))
(check-sat b_and!359 (not b_next!213))
