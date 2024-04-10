; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83348 () Bool)

(assert start!83348)

(declare-fun b_free!19341 () Bool)

(declare-fun b_next!19341 () Bool)

(assert (=> start!83348 (= b_free!19341 (not b_next!19341))))

(declare-fun tp!67301 () Bool)

(declare-fun b_and!30903 () Bool)

(assert (=> start!83348 (= tp!67301 b_and!30903)))

(declare-fun b!973106 () Bool)

(declare-fun res!651365 () Bool)

(declare-fun e!548494 () Bool)

(assert (=> b!973106 (=> (not res!651365) (not e!548494))))

(declare-datatypes ((array!60519 0))(
  ( (array!60520 (arr!29123 (Array (_ BitVec 32) (_ BitVec 64))) (size!29602 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60519)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973106 (= res!651365 (validKeyInArray!0 (select (arr!29123 _keys!1717) i!822)))))

(declare-fun res!651369 () Bool)

(assert (=> start!83348 (=> (not res!651369) (not e!548494))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83348 (= res!651369 (validMask!0 mask!2147))))

(assert (=> start!83348 e!548494))

(assert (=> start!83348 true))

(declare-datatypes ((V!34635 0))(
  ( (V!34636 (val!11170 Int)) )
))
(declare-datatypes ((ValueCell!10638 0))(
  ( (ValueCellFull!10638 (v!13729 V!34635)) (EmptyCell!10638) )
))
(declare-datatypes ((array!60521 0))(
  ( (array!60522 (arr!29124 (Array (_ BitVec 32) ValueCell!10638)) (size!29603 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60521)

(declare-fun e!548491 () Bool)

(declare-fun array_inv!22531 (array!60521) Bool)

(assert (=> start!83348 (and (array_inv!22531 _values!1425) e!548491)))

(declare-fun tp_is_empty!22239 () Bool)

(assert (=> start!83348 tp_is_empty!22239))

(assert (=> start!83348 tp!67301))

(declare-fun array_inv!22532 (array!60519) Bool)

(assert (=> start!83348 (array_inv!22532 _keys!1717)))

(declare-fun mapIsEmpty!35368 () Bool)

(declare-fun mapRes!35368 () Bool)

(assert (=> mapIsEmpty!35368 mapRes!35368))

(declare-fun b!973107 () Bool)

(declare-fun e!548492 () Bool)

(declare-fun e!548496 () Bool)

(assert (=> b!973107 (= e!548492 e!548496)))

(declare-fun res!651366 () Bool)

(assert (=> b!973107 (=> (not res!651366) (not e!548496))))

(declare-fun lt!432301 () (_ BitVec 64))

(assert (=> b!973107 (= res!651366 (validKeyInArray!0 lt!432301))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973107 (= lt!432301 (select (arr!29123 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34635)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34635)

(declare-datatypes ((tuple2!14334 0))(
  ( (tuple2!14335 (_1!7178 (_ BitVec 64)) (_2!7178 V!34635)) )
))
(declare-datatypes ((List!20195 0))(
  ( (Nil!20192) (Cons!20191 (h!21353 tuple2!14334) (t!28634 List!20195)) )
))
(declare-datatypes ((ListLongMap!13031 0))(
  ( (ListLongMap!13032 (toList!6531 List!20195)) )
))
(declare-fun lt!432300 () ListLongMap!13031)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3764 (array!60519 array!60521 (_ BitVec 32) (_ BitVec 32) V!34635 V!34635 (_ BitVec 32) Int) ListLongMap!13031)

(assert (=> b!973107 (= lt!432300 (getCurrentListMap!3764 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35368 () Bool)

(declare-fun tp!67302 () Bool)

(declare-fun e!548497 () Bool)

(assert (=> mapNonEmpty!35368 (= mapRes!35368 (and tp!67302 e!548497))))

(declare-fun mapValue!35368 () ValueCell!10638)

(declare-fun mapRest!35368 () (Array (_ BitVec 32) ValueCell!10638))

(declare-fun mapKey!35368 () (_ BitVec 32))

(assert (=> mapNonEmpty!35368 (= (arr!29124 _values!1425) (store mapRest!35368 mapKey!35368 mapValue!35368))))

(declare-fun b!973108 () Bool)

(assert (=> b!973108 (= e!548496 (not true))))

(declare-fun lt!432303 () tuple2!14334)

(declare-fun lt!432299 () ListLongMap!13031)

(declare-fun contains!5624 (ListLongMap!13031 (_ BitVec 64)) Bool)

(declare-fun +!2900 (ListLongMap!13031 tuple2!14334) ListLongMap!13031)

(assert (=> b!973108 (contains!5624 (+!2900 lt!432299 lt!432303) (select (arr!29123 _keys!1717) i!822))))

(declare-fun lt!432302 () V!34635)

(declare-datatypes ((Unit!32421 0))(
  ( (Unit!32422) )
))
(declare-fun lt!432304 () Unit!32421)

(declare-fun addStillContains!596 (ListLongMap!13031 (_ BitVec 64) V!34635 (_ BitVec 64)) Unit!32421)

(assert (=> b!973108 (= lt!432304 (addStillContains!596 lt!432299 lt!432301 lt!432302 (select (arr!29123 _keys!1717) i!822)))))

(assert (=> b!973108 (= lt!432300 (+!2900 (getCurrentListMap!3764 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432303))))

(assert (=> b!973108 (= lt!432303 (tuple2!14335 lt!432301 lt!432302))))

(declare-fun get!15093 (ValueCell!10638 V!34635) V!34635)

(declare-fun dynLambda!1689 (Int (_ BitVec 64)) V!34635)

(assert (=> b!973108 (= lt!432302 (get!15093 (select (arr!29124 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1689 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432305 () Unit!32421)

(declare-fun lemmaListMapRecursiveValidKeyArray!266 (array!60519 array!60521 (_ BitVec 32) (_ BitVec 32) V!34635 V!34635 (_ BitVec 32) Int) Unit!32421)

(assert (=> b!973108 (= lt!432305 (lemmaListMapRecursiveValidKeyArray!266 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973109 () Bool)

(declare-fun res!651367 () Bool)

(assert (=> b!973109 (=> (not res!651367) (not e!548494))))

(declare-datatypes ((List!20196 0))(
  ( (Nil!20193) (Cons!20192 (h!21354 (_ BitVec 64)) (t!28635 List!20196)) )
))
(declare-fun arrayNoDuplicates!0 (array!60519 (_ BitVec 32) List!20196) Bool)

(assert (=> b!973109 (= res!651367 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20193))))

(declare-fun b!973110 () Bool)

(assert (=> b!973110 (= e!548497 tp_is_empty!22239)))

(declare-fun b!973111 () Bool)

(assert (=> b!973111 (= e!548494 e!548492)))

(declare-fun res!651370 () Bool)

(assert (=> b!973111 (=> (not res!651370) (not e!548492))))

(assert (=> b!973111 (= res!651370 (contains!5624 lt!432299 (select (arr!29123 _keys!1717) i!822)))))

(assert (=> b!973111 (= lt!432299 (getCurrentListMap!3764 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973112 () Bool)

(declare-fun e!548493 () Bool)

(assert (=> b!973112 (= e!548493 tp_is_empty!22239)))

(declare-fun b!973113 () Bool)

(assert (=> b!973113 (= e!548491 (and e!548493 mapRes!35368))))

(declare-fun condMapEmpty!35368 () Bool)

(declare-fun mapDefault!35368 () ValueCell!10638)

(assert (=> b!973113 (= condMapEmpty!35368 (= (arr!29124 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10638)) mapDefault!35368)))))

(declare-fun b!973114 () Bool)

(declare-fun res!651371 () Bool)

(assert (=> b!973114 (=> (not res!651371) (not e!548494))))

(assert (=> b!973114 (= res!651371 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29602 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29602 _keys!1717))))))

(declare-fun b!973115 () Bool)

(declare-fun res!651372 () Bool)

(assert (=> b!973115 (=> (not res!651372) (not e!548494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60519 (_ BitVec 32)) Bool)

(assert (=> b!973115 (= res!651372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973116 () Bool)

(declare-fun res!651368 () Bool)

(assert (=> b!973116 (=> (not res!651368) (not e!548494))))

(assert (=> b!973116 (= res!651368 (and (= (size!29603 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29602 _keys!1717) (size!29603 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83348 res!651369) b!973116))

(assert (= (and b!973116 res!651368) b!973115))

(assert (= (and b!973115 res!651372) b!973109))

(assert (= (and b!973109 res!651367) b!973114))

(assert (= (and b!973114 res!651371) b!973106))

(assert (= (and b!973106 res!651365) b!973111))

(assert (= (and b!973111 res!651370) b!973107))

(assert (= (and b!973107 res!651366) b!973108))

(assert (= (and b!973113 condMapEmpty!35368) mapIsEmpty!35368))

(assert (= (and b!973113 (not condMapEmpty!35368)) mapNonEmpty!35368))

(get-info :version)

(assert (= (and mapNonEmpty!35368 ((_ is ValueCellFull!10638) mapValue!35368)) b!973110))

(assert (= (and b!973113 ((_ is ValueCellFull!10638) mapDefault!35368)) b!973112))

(assert (= start!83348 b!973113))

(declare-fun b_lambda!14505 () Bool)

(assert (=> (not b_lambda!14505) (not b!973108)))

(declare-fun t!28633 () Bool)

(declare-fun tb!6289 () Bool)

(assert (=> (and start!83348 (= defaultEntry!1428 defaultEntry!1428) t!28633) tb!6289))

(declare-fun result!12555 () Bool)

(assert (=> tb!6289 (= result!12555 tp_is_empty!22239)))

(assert (=> b!973108 t!28633))

(declare-fun b_and!30905 () Bool)

(assert (= b_and!30903 (and (=> t!28633 result!12555) b_and!30905)))

(declare-fun m!900615 () Bool)

(assert (=> start!83348 m!900615))

(declare-fun m!900617 () Bool)

(assert (=> start!83348 m!900617))

(declare-fun m!900619 () Bool)

(assert (=> start!83348 m!900619))

(declare-fun m!900621 () Bool)

(assert (=> b!973107 m!900621))

(declare-fun m!900623 () Bool)

(assert (=> b!973107 m!900623))

(declare-fun m!900625 () Bool)

(assert (=> b!973107 m!900625))

(declare-fun m!900627 () Bool)

(assert (=> b!973109 m!900627))

(declare-fun m!900629 () Bool)

(assert (=> b!973111 m!900629))

(assert (=> b!973111 m!900629))

(declare-fun m!900631 () Bool)

(assert (=> b!973111 m!900631))

(declare-fun m!900633 () Bool)

(assert (=> b!973111 m!900633))

(assert (=> b!973106 m!900629))

(assert (=> b!973106 m!900629))

(declare-fun m!900635 () Bool)

(assert (=> b!973106 m!900635))

(declare-fun m!900637 () Bool)

(assert (=> b!973115 m!900637))

(declare-fun m!900639 () Bool)

(assert (=> mapNonEmpty!35368 m!900639))

(declare-fun m!900641 () Bool)

(assert (=> b!973108 m!900641))

(declare-fun m!900643 () Bool)

(assert (=> b!973108 m!900643))

(declare-fun m!900645 () Bool)

(assert (=> b!973108 m!900645))

(assert (=> b!973108 m!900629))

(declare-fun m!900647 () Bool)

(assert (=> b!973108 m!900647))

(assert (=> b!973108 m!900641))

(declare-fun m!900649 () Bool)

(assert (=> b!973108 m!900649))

(assert (=> b!973108 m!900629))

(assert (=> b!973108 m!900645))

(assert (=> b!973108 m!900649))

(declare-fun m!900651 () Bool)

(assert (=> b!973108 m!900651))

(declare-fun m!900653 () Bool)

(assert (=> b!973108 m!900653))

(declare-fun m!900655 () Bool)

(assert (=> b!973108 m!900655))

(assert (=> b!973108 m!900629))

(declare-fun m!900657 () Bool)

(assert (=> b!973108 m!900657))

(assert (=> b!973108 m!900655))

(check-sat (not b!973106) (not mapNonEmpty!35368) (not b!973108) (not b!973109) (not b_lambda!14505) (not b_next!19341) (not b!973111) tp_is_empty!22239 (not b!973107) b_and!30905 (not start!83348) (not b!973115))
(check-sat b_and!30905 (not b_next!19341))
