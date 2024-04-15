; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83310 () Bool)

(assert start!83310)

(declare-fun b_free!19321 () Bool)

(declare-fun b_next!19321 () Bool)

(assert (=> start!83310 (= b_free!19321 (not b_next!19321))))

(declare-fun tp!67243 () Bool)

(declare-fun b_and!30837 () Bool)

(assert (=> start!83310 (= tp!67243 b_and!30837)))

(declare-fun b!972517 () Bool)

(declare-fun e!548143 () Bool)

(declare-fun e!548145 () Bool)

(assert (=> b!972517 (= e!548143 e!548145)))

(declare-fun res!651022 () Bool)

(assert (=> b!972517 (=> (not res!651022) (not e!548145))))

(declare-fun lt!431882 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972517 (= res!651022 (validKeyInArray!0 lt!431882))))

(declare-datatypes ((array!60414 0))(
  ( (array!60415 (arr!29071 (Array (_ BitVec 32) (_ BitVec 64))) (size!29552 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60414)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972517 (= lt!431882 (select (arr!29071 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34609 0))(
  ( (V!34610 (val!11160 Int)) )
))
(declare-datatypes ((ValueCell!10628 0))(
  ( (ValueCellFull!10628 (v!13718 V!34609)) (EmptyCell!10628) )
))
(declare-datatypes ((array!60416 0))(
  ( (array!60417 (arr!29072 (Array (_ BitVec 32) ValueCell!10628)) (size!29553 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60416)

(declare-fun zeroValue!1367 () V!34609)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34609)

(declare-datatypes ((tuple2!14396 0))(
  ( (tuple2!14397 (_1!7209 (_ BitVec 64)) (_2!7209 V!34609)) )
))
(declare-datatypes ((List!20206 0))(
  ( (Nil!20203) (Cons!20202 (h!21364 tuple2!14396) (t!28616 List!20206)) )
))
(declare-datatypes ((ListLongMap!13083 0))(
  ( (ListLongMap!13084 (toList!6557 List!20206)) )
))
(declare-fun lt!431881 () ListLongMap!13083)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3719 (array!60414 array!60416 (_ BitVec 32) (_ BitVec 32) V!34609 V!34609 (_ BitVec 32) Int) ListLongMap!13083)

(assert (=> b!972517 (= lt!431881 (getCurrentListMap!3719 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972518 () Bool)

(declare-fun e!548142 () Bool)

(declare-fun tp_is_empty!22219 () Bool)

(assert (=> b!972518 (= e!548142 tp_is_empty!22219)))

(declare-fun b!972519 () Bool)

(declare-fun res!651018 () Bool)

(assert (=> b!972519 (=> (not res!651018) (not e!548143))))

(assert (=> b!972519 (= res!651018 (and (= (size!29553 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29552 _keys!1717) (size!29553 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35338 () Bool)

(declare-fun mapRes!35338 () Bool)

(assert (=> mapIsEmpty!35338 mapRes!35338))

(declare-fun b!972520 () Bool)

(declare-fun e!548144 () Bool)

(assert (=> b!972520 (= e!548144 (and e!548142 mapRes!35338))))

(declare-fun condMapEmpty!35338 () Bool)

(declare-fun mapDefault!35338 () ValueCell!10628)

(assert (=> b!972520 (= condMapEmpty!35338 (= (arr!29072 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10628)) mapDefault!35338)))))

(declare-fun b!972521 () Bool)

(declare-fun res!651016 () Bool)

(assert (=> b!972521 (=> (not res!651016) (not e!548143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60414 (_ BitVec 32)) Bool)

(assert (=> b!972521 (= res!651016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972522 () Bool)

(declare-fun res!651020 () Bool)

(assert (=> b!972522 (=> (not res!651020) (not e!548143))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5598 (ListLongMap!13083 (_ BitVec 64)) Bool)

(assert (=> b!972522 (= res!651020 (contains!5598 (getCurrentListMap!3719 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29071 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35338 () Bool)

(declare-fun tp!67242 () Bool)

(declare-fun e!548140 () Bool)

(assert (=> mapNonEmpty!35338 (= mapRes!35338 (and tp!67242 e!548140))))

(declare-fun mapKey!35338 () (_ BitVec 32))

(declare-fun mapRest!35338 () (Array (_ BitVec 32) ValueCell!10628))

(declare-fun mapValue!35338 () ValueCell!10628)

(assert (=> mapNonEmpty!35338 (= (arr!29072 _values!1425) (store mapRest!35338 mapKey!35338 mapValue!35338))))

(declare-fun res!651017 () Bool)

(assert (=> start!83310 (=> (not res!651017) (not e!548143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83310 (= res!651017 (validMask!0 mask!2147))))

(assert (=> start!83310 e!548143))

(assert (=> start!83310 true))

(declare-fun array_inv!22547 (array!60416) Bool)

(assert (=> start!83310 (and (array_inv!22547 _values!1425) e!548144)))

(assert (=> start!83310 tp_is_empty!22219))

(assert (=> start!83310 tp!67243))

(declare-fun array_inv!22548 (array!60414) Bool)

(assert (=> start!83310 (array_inv!22548 _keys!1717)))

(declare-fun b!972523 () Bool)

(declare-fun res!651021 () Bool)

(assert (=> b!972523 (=> (not res!651021) (not e!548143))))

(assert (=> b!972523 (= res!651021 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29552 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29552 _keys!1717))))))

(declare-fun b!972524 () Bool)

(assert (=> b!972524 (= e!548145 (not true))))

(declare-fun +!2911 (ListLongMap!13083 tuple2!14396) ListLongMap!13083)

(declare-fun get!15070 (ValueCell!10628 V!34609) V!34609)

(declare-fun dynLambda!1667 (Int (_ BitVec 64)) V!34609)

(assert (=> b!972524 (= lt!431881 (+!2911 (getCurrentListMap!3719 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14397 lt!431882 (get!15070 (select (arr!29072 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1667 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32274 0))(
  ( (Unit!32275) )
))
(declare-fun lt!431883 () Unit!32274)

(declare-fun lemmaListMapRecursiveValidKeyArray!251 (array!60414 array!60416 (_ BitVec 32) (_ BitVec 32) V!34609 V!34609 (_ BitVec 32) Int) Unit!32274)

(assert (=> b!972524 (= lt!431883 (lemmaListMapRecursiveValidKeyArray!251 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972525 () Bool)

(assert (=> b!972525 (= e!548140 tp_is_empty!22219)))

(declare-fun b!972526 () Bool)

(declare-fun res!651019 () Bool)

(assert (=> b!972526 (=> (not res!651019) (not e!548143))))

(declare-datatypes ((List!20207 0))(
  ( (Nil!20204) (Cons!20203 (h!21365 (_ BitVec 64)) (t!28617 List!20207)) )
))
(declare-fun arrayNoDuplicates!0 (array!60414 (_ BitVec 32) List!20207) Bool)

(assert (=> b!972526 (= res!651019 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20204))))

(declare-fun b!972527 () Bool)

(declare-fun res!651015 () Bool)

(assert (=> b!972527 (=> (not res!651015) (not e!548143))))

(assert (=> b!972527 (= res!651015 (validKeyInArray!0 (select (arr!29071 _keys!1717) i!822)))))

(assert (= (and start!83310 res!651017) b!972519))

(assert (= (and b!972519 res!651018) b!972521))

(assert (= (and b!972521 res!651016) b!972526))

(assert (= (and b!972526 res!651019) b!972523))

(assert (= (and b!972523 res!651021) b!972527))

(assert (= (and b!972527 res!651015) b!972522))

(assert (= (and b!972522 res!651020) b!972517))

(assert (= (and b!972517 res!651022) b!972524))

(assert (= (and b!972520 condMapEmpty!35338) mapIsEmpty!35338))

(assert (= (and b!972520 (not condMapEmpty!35338)) mapNonEmpty!35338))

(get-info :version)

(assert (= (and mapNonEmpty!35338 ((_ is ValueCellFull!10628) mapValue!35338)) b!972525))

(assert (= (and b!972520 ((_ is ValueCellFull!10628) mapDefault!35338)) b!972518))

(assert (= start!83310 b!972520))

(declare-fun b_lambda!14467 () Bool)

(assert (=> (not b_lambda!14467) (not b!972524)))

(declare-fun t!28615 () Bool)

(declare-fun tb!6261 () Bool)

(assert (=> (and start!83310 (= defaultEntry!1428 defaultEntry!1428) t!28615) tb!6261))

(declare-fun result!12507 () Bool)

(assert (=> tb!6261 (= result!12507 tp_is_empty!22219)))

(assert (=> b!972524 t!28615))

(declare-fun b_and!30839 () Bool)

(assert (= b_and!30837 (and (=> t!28615 result!12507) b_and!30839)))

(declare-fun m!899435 () Bool)

(assert (=> b!972524 m!899435))

(declare-fun m!899437 () Bool)

(assert (=> b!972524 m!899437))

(declare-fun m!899439 () Bool)

(assert (=> b!972524 m!899439))

(assert (=> b!972524 m!899437))

(declare-fun m!899441 () Bool)

(assert (=> b!972524 m!899441))

(assert (=> b!972524 m!899435))

(assert (=> b!972524 m!899439))

(declare-fun m!899443 () Bool)

(assert (=> b!972524 m!899443))

(declare-fun m!899445 () Bool)

(assert (=> b!972524 m!899445))

(declare-fun m!899447 () Bool)

(assert (=> b!972527 m!899447))

(assert (=> b!972527 m!899447))

(declare-fun m!899449 () Bool)

(assert (=> b!972527 m!899449))

(declare-fun m!899451 () Bool)

(assert (=> b!972526 m!899451))

(declare-fun m!899453 () Bool)

(assert (=> mapNonEmpty!35338 m!899453))

(declare-fun m!899455 () Bool)

(assert (=> b!972517 m!899455))

(declare-fun m!899457 () Bool)

(assert (=> b!972517 m!899457))

(declare-fun m!899459 () Bool)

(assert (=> b!972517 m!899459))

(declare-fun m!899461 () Bool)

(assert (=> b!972522 m!899461))

(assert (=> b!972522 m!899447))

(assert (=> b!972522 m!899461))

(assert (=> b!972522 m!899447))

(declare-fun m!899463 () Bool)

(assert (=> b!972522 m!899463))

(declare-fun m!899465 () Bool)

(assert (=> b!972521 m!899465))

(declare-fun m!899467 () Bool)

(assert (=> start!83310 m!899467))

(declare-fun m!899469 () Bool)

(assert (=> start!83310 m!899469))

(declare-fun m!899471 () Bool)

(assert (=> start!83310 m!899471))

(check-sat (not b!972522) (not b!972521) (not b!972517) (not start!83310) (not b_lambda!14467) tp_is_empty!22219 b_and!30839 (not b!972526) (not mapNonEmpty!35338) (not b!972524) (not b!972527) (not b_next!19321))
(check-sat b_and!30839 (not b_next!19321))
