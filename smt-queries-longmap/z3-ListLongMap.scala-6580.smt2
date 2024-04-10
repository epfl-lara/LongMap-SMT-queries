; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83366 () Bool)

(assert start!83366)

(declare-fun b_free!19359 () Bool)

(declare-fun b_next!19359 () Bool)

(assert (=> start!83366 (= b_free!19359 (not b_next!19359))))

(declare-fun tp!67356 () Bool)

(declare-fun b_and!30939 () Bool)

(assert (=> start!83366 (= tp!67356 b_and!30939)))

(declare-fun b!973421 () Bool)

(declare-fun e!548684 () Bool)

(declare-fun e!548685 () Bool)

(assert (=> b!973421 (= e!548684 e!548685)))

(declare-fun res!651586 () Bool)

(assert (=> b!973421 (=> (not res!651586) (not e!548685))))

(declare-datatypes ((array!60555 0))(
  ( (array!60556 (arr!29141 (Array (_ BitVec 32) (_ BitVec 64))) (size!29620 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60555)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((V!34659 0))(
  ( (V!34660 (val!11179 Int)) )
))
(declare-datatypes ((tuple2!14352 0))(
  ( (tuple2!14353 (_1!7187 (_ BitVec 64)) (_2!7187 V!34659)) )
))
(declare-datatypes ((List!20212 0))(
  ( (Nil!20209) (Cons!20208 (h!21370 tuple2!14352) (t!28669 List!20212)) )
))
(declare-datatypes ((ListLongMap!13049 0))(
  ( (ListLongMap!13050 (toList!6540 List!20212)) )
))
(declare-fun lt!432494 () ListLongMap!13049)

(declare-fun contains!5633 (ListLongMap!13049 (_ BitVec 64)) Bool)

(assert (=> b!973421 (= res!651586 (contains!5633 lt!432494 (select (arr!29141 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10647 0))(
  ( (ValueCellFull!10647 (v!13738 V!34659)) (EmptyCell!10647) )
))
(declare-datatypes ((array!60557 0))(
  ( (array!60558 (arr!29142 (Array (_ BitVec 32) ValueCell!10647)) (size!29621 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60557)

(declare-fun zeroValue!1367 () V!34659)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34659)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3773 (array!60555 array!60557 (_ BitVec 32) (_ BitVec 32) V!34659 V!34659 (_ BitVec 32) Int) ListLongMap!13049)

(assert (=> b!973421 (= lt!432494 (getCurrentListMap!3773 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973422 () Bool)

(declare-fun e!548681 () Bool)

(assert (=> b!973422 (= e!548681 (not true))))

(declare-fun lt!432493 () tuple2!14352)

(declare-fun +!2907 (ListLongMap!13049 tuple2!14352) ListLongMap!13049)

(assert (=> b!973422 (contains!5633 (+!2907 lt!432494 lt!432493) (select (arr!29141 _keys!1717) i!822))))

(declare-fun lt!432492 () (_ BitVec 64))

(declare-fun lt!432488 () V!34659)

(declare-datatypes ((Unit!32435 0))(
  ( (Unit!32436) )
))
(declare-fun lt!432490 () Unit!32435)

(declare-fun addStillContains!603 (ListLongMap!13049 (_ BitVec 64) V!34659 (_ BitVec 64)) Unit!32435)

(assert (=> b!973422 (= lt!432490 (addStillContains!603 lt!432494 lt!432492 lt!432488 (select (arr!29141 _keys!1717) i!822)))))

(declare-fun lt!432491 () ListLongMap!13049)

(assert (=> b!973422 (= lt!432491 (+!2907 (getCurrentListMap!3773 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432493))))

(assert (=> b!973422 (= lt!432493 (tuple2!14353 lt!432492 lt!432488))))

(declare-fun get!15106 (ValueCell!10647 V!34659) V!34659)

(declare-fun dynLambda!1696 (Int (_ BitVec 64)) V!34659)

(assert (=> b!973422 (= lt!432488 (get!15106 (select (arr!29142 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1696 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432489 () Unit!32435)

(declare-fun lemmaListMapRecursiveValidKeyArray!273 (array!60555 array!60557 (_ BitVec 32) (_ BitVec 32) V!34659 V!34659 (_ BitVec 32) Int) Unit!32435)

(assert (=> b!973422 (= lt!432489 (lemmaListMapRecursiveValidKeyArray!273 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973423 () Bool)

(declare-fun res!651585 () Bool)

(assert (=> b!973423 (=> (not res!651585) (not e!548684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973423 (= res!651585 (validKeyInArray!0 (select (arr!29141 _keys!1717) i!822)))))

(declare-fun b!973424 () Bool)

(declare-fun e!548682 () Bool)

(declare-fun e!548680 () Bool)

(declare-fun mapRes!35395 () Bool)

(assert (=> b!973424 (= e!548682 (and e!548680 mapRes!35395))))

(declare-fun condMapEmpty!35395 () Bool)

(declare-fun mapDefault!35395 () ValueCell!10647)

(assert (=> b!973424 (= condMapEmpty!35395 (= (arr!29142 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10647)) mapDefault!35395)))))

(declare-fun mapIsEmpty!35395 () Bool)

(assert (=> mapIsEmpty!35395 mapRes!35395))

(declare-fun res!651583 () Bool)

(assert (=> start!83366 (=> (not res!651583) (not e!548684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83366 (= res!651583 (validMask!0 mask!2147))))

(assert (=> start!83366 e!548684))

(assert (=> start!83366 true))

(declare-fun array_inv!22543 (array!60557) Bool)

(assert (=> start!83366 (and (array_inv!22543 _values!1425) e!548682)))

(declare-fun tp_is_empty!22257 () Bool)

(assert (=> start!83366 tp_is_empty!22257))

(assert (=> start!83366 tp!67356))

(declare-fun array_inv!22544 (array!60555) Bool)

(assert (=> start!83366 (array_inv!22544 _keys!1717)))

(declare-fun b!973425 () Bool)

(assert (=> b!973425 (= e!548685 e!548681)))

(declare-fun res!651587 () Bool)

(assert (=> b!973425 (=> (not res!651587) (not e!548681))))

(assert (=> b!973425 (= res!651587 (validKeyInArray!0 lt!432492))))

(assert (=> b!973425 (= lt!432492 (select (arr!29141 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973425 (= lt!432491 (getCurrentListMap!3773 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35395 () Bool)

(declare-fun tp!67355 () Bool)

(declare-fun e!548683 () Bool)

(assert (=> mapNonEmpty!35395 (= mapRes!35395 (and tp!67355 e!548683))))

(declare-fun mapRest!35395 () (Array (_ BitVec 32) ValueCell!10647))

(declare-fun mapKey!35395 () (_ BitVec 32))

(declare-fun mapValue!35395 () ValueCell!10647)

(assert (=> mapNonEmpty!35395 (= (arr!29142 _values!1425) (store mapRest!35395 mapKey!35395 mapValue!35395))))

(declare-fun b!973426 () Bool)

(declare-fun res!651581 () Bool)

(assert (=> b!973426 (=> (not res!651581) (not e!548684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60555 (_ BitVec 32)) Bool)

(assert (=> b!973426 (= res!651581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973427 () Bool)

(declare-fun res!651584 () Bool)

(assert (=> b!973427 (=> (not res!651584) (not e!548684))))

(assert (=> b!973427 (= res!651584 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29620 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29620 _keys!1717))))))

(declare-fun b!973428 () Bool)

(assert (=> b!973428 (= e!548683 tp_is_empty!22257)))

(declare-fun b!973429 () Bool)

(declare-fun res!651588 () Bool)

(assert (=> b!973429 (=> (not res!651588) (not e!548684))))

(assert (=> b!973429 (= res!651588 (and (= (size!29621 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29620 _keys!1717) (size!29621 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973430 () Bool)

(declare-fun res!651582 () Bool)

(assert (=> b!973430 (=> (not res!651582) (not e!548684))))

(declare-datatypes ((List!20213 0))(
  ( (Nil!20210) (Cons!20209 (h!21371 (_ BitVec 64)) (t!28670 List!20213)) )
))
(declare-fun arrayNoDuplicates!0 (array!60555 (_ BitVec 32) List!20213) Bool)

(assert (=> b!973430 (= res!651582 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20210))))

(declare-fun b!973431 () Bool)

(assert (=> b!973431 (= e!548680 tp_is_empty!22257)))

(assert (= (and start!83366 res!651583) b!973429))

(assert (= (and b!973429 res!651588) b!973426))

(assert (= (and b!973426 res!651581) b!973430))

(assert (= (and b!973430 res!651582) b!973427))

(assert (= (and b!973427 res!651584) b!973423))

(assert (= (and b!973423 res!651585) b!973421))

(assert (= (and b!973421 res!651586) b!973425))

(assert (= (and b!973425 res!651587) b!973422))

(assert (= (and b!973424 condMapEmpty!35395) mapIsEmpty!35395))

(assert (= (and b!973424 (not condMapEmpty!35395)) mapNonEmpty!35395))

(get-info :version)

(assert (= (and mapNonEmpty!35395 ((_ is ValueCellFull!10647) mapValue!35395)) b!973428))

(assert (= (and b!973424 ((_ is ValueCellFull!10647) mapDefault!35395)) b!973431))

(assert (= start!83366 b!973424))

(declare-fun b_lambda!14523 () Bool)

(assert (=> (not b_lambda!14523) (not b!973422)))

(declare-fun t!28668 () Bool)

(declare-fun tb!6307 () Bool)

(assert (=> (and start!83366 (= defaultEntry!1428 defaultEntry!1428) t!28668) tb!6307))

(declare-fun result!12591 () Bool)

(assert (=> tb!6307 (= result!12591 tp_is_empty!22257)))

(assert (=> b!973422 t!28668))

(declare-fun b_and!30941 () Bool)

(assert (= b_and!30939 (and (=> t!28668 result!12591) b_and!30941)))

(declare-fun m!901011 () Bool)

(assert (=> b!973426 m!901011))

(declare-fun m!901013 () Bool)

(assert (=> start!83366 m!901013))

(declare-fun m!901015 () Bool)

(assert (=> start!83366 m!901015))

(declare-fun m!901017 () Bool)

(assert (=> start!83366 m!901017))

(declare-fun m!901019 () Bool)

(assert (=> b!973421 m!901019))

(assert (=> b!973421 m!901019))

(declare-fun m!901021 () Bool)

(assert (=> b!973421 m!901021))

(declare-fun m!901023 () Bool)

(assert (=> b!973421 m!901023))

(assert (=> b!973422 m!901019))

(declare-fun m!901025 () Bool)

(assert (=> b!973422 m!901025))

(declare-fun m!901027 () Bool)

(assert (=> b!973422 m!901027))

(assert (=> b!973422 m!901019))

(declare-fun m!901029 () Bool)

(assert (=> b!973422 m!901029))

(declare-fun m!901031 () Bool)

(assert (=> b!973422 m!901031))

(declare-fun m!901033 () Bool)

(assert (=> b!973422 m!901033))

(declare-fun m!901035 () Bool)

(assert (=> b!973422 m!901035))

(assert (=> b!973422 m!901027))

(declare-fun m!901037 () Bool)

(assert (=> b!973422 m!901037))

(declare-fun m!901039 () Bool)

(assert (=> b!973422 m!901039))

(assert (=> b!973422 m!901019))

(declare-fun m!901041 () Bool)

(assert (=> b!973422 m!901041))

(assert (=> b!973422 m!901029))

(assert (=> b!973422 m!901039))

(assert (=> b!973422 m!901031))

(declare-fun m!901043 () Bool)

(assert (=> mapNonEmpty!35395 m!901043))

(declare-fun m!901045 () Bool)

(assert (=> b!973430 m!901045))

(assert (=> b!973423 m!901019))

(assert (=> b!973423 m!901019))

(declare-fun m!901047 () Bool)

(assert (=> b!973423 m!901047))

(declare-fun m!901049 () Bool)

(assert (=> b!973425 m!901049))

(declare-fun m!901051 () Bool)

(assert (=> b!973425 m!901051))

(declare-fun m!901053 () Bool)

(assert (=> b!973425 m!901053))

(check-sat (not b_next!19359) tp_is_empty!22257 (not mapNonEmpty!35395) (not b!973426) b_and!30941 (not b!973422) (not b_lambda!14523) (not b!973425) (not start!83366) (not b!973430) (not b!973421) (not b!973423))
(check-sat b_and!30941 (not b_next!19359))
