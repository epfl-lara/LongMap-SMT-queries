; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83364 () Bool)

(assert start!83364)

(declare-fun b_free!19375 () Bool)

(declare-fun b_next!19375 () Bool)

(assert (=> start!83364 (= b_free!19375 (not b_next!19375))))

(declare-fun tp!67404 () Bool)

(declare-fun b_and!30945 () Bool)

(assert (=> start!83364 (= tp!67404 b_and!30945)))

(declare-fun b!973462 () Bool)

(declare-fun res!651663 () Bool)

(declare-fun e!548703 () Bool)

(assert (=> b!973462 (=> (not res!651663) (not e!548703))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34681 0))(
  ( (V!34682 (val!11187 Int)) )
))
(declare-datatypes ((ValueCell!10655 0))(
  ( (ValueCellFull!10655 (v!13745 V!34681)) (EmptyCell!10655) )
))
(declare-datatypes ((array!60514 0))(
  ( (array!60515 (arr!29121 (Array (_ BitVec 32) ValueCell!10655)) (size!29602 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60514)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60516 0))(
  ( (array!60517 (arr!29122 (Array (_ BitVec 32) (_ BitVec 64))) (size!29603 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60516)

(assert (=> b!973462 (= res!651663 (and (= (size!29602 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29603 _keys!1717) (size!29602 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973463 () Bool)

(declare-fun e!548705 () Bool)

(declare-fun tp_is_empty!22273 () Bool)

(assert (=> b!973463 (= e!548705 tp_is_empty!22273)))

(declare-fun mapIsEmpty!35419 () Bool)

(declare-fun mapRes!35419 () Bool)

(assert (=> mapIsEmpty!35419 mapRes!35419))

(declare-fun b!973464 () Bool)

(declare-fun res!651668 () Bool)

(assert (=> b!973464 (=> (not res!651668) (not e!548703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60516 (_ BitVec 32)) Bool)

(assert (=> b!973464 (= res!651668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973465 () Bool)

(declare-fun e!548702 () Bool)

(assert (=> b!973465 (= e!548702 tp_is_empty!22273)))

(declare-fun b!973466 () Bool)

(declare-fun res!651666 () Bool)

(assert (=> b!973466 (=> (not res!651666) (not e!548703))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973466 (= res!651666 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29603 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29603 _keys!1717))))))

(declare-fun b!973467 () Bool)

(declare-fun e!548700 () Bool)

(assert (=> b!973467 (= e!548700 (not (bvsle (bvsub from!2118 #b00000000000000000000000000000001) (size!29603 _keys!1717))))))

(declare-datatypes ((tuple2!14438 0))(
  ( (tuple2!14439 (_1!7230 (_ BitVec 64)) (_2!7230 V!34681)) )
))
(declare-datatypes ((List!20246 0))(
  ( (Nil!20243) (Cons!20242 (h!21404 tuple2!14438) (t!28710 List!20246)) )
))
(declare-datatypes ((ListLongMap!13125 0))(
  ( (ListLongMap!13126 (toList!6578 List!20246)) )
))
(declare-fun lt!432423 () ListLongMap!13125)

(declare-fun lt!432424 () tuple2!14438)

(declare-fun contains!5619 (ListLongMap!13125 (_ BitVec 64)) Bool)

(declare-fun +!2930 (ListLongMap!13125 tuple2!14438) ListLongMap!13125)

(assert (=> b!973467 (contains!5619 (+!2930 lt!432423 lt!432424) (select (arr!29122 _keys!1717) i!822))))

(declare-fun lt!432422 () V!34681)

(declare-fun lt!432421 () (_ BitVec 64))

(declare-datatypes ((Unit!32312 0))(
  ( (Unit!32313) )
))
(declare-fun lt!432425 () Unit!32312)

(declare-fun addStillContains!600 (ListLongMap!13125 (_ BitVec 64) V!34681 (_ BitVec 64)) Unit!32312)

(assert (=> b!973467 (= lt!432425 (addStillContains!600 lt!432423 lt!432421 lt!432422 (select (arr!29122 _keys!1717) i!822)))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34681)

(declare-fun lt!432426 () ListLongMap!13125)

(declare-fun zeroValue!1367 () V!34681)

(declare-fun getCurrentListMap!3740 (array!60516 array!60514 (_ BitVec 32) (_ BitVec 32) V!34681 V!34681 (_ BitVec 32) Int) ListLongMap!13125)

(assert (=> b!973467 (= lt!432426 (+!2930 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432424))))

(assert (=> b!973467 (= lt!432424 (tuple2!14439 lt!432421 lt!432422))))

(declare-fun get!15107 (ValueCell!10655 V!34681) V!34681)

(declare-fun dynLambda!1686 (Int (_ BitVec 64)) V!34681)

(assert (=> b!973467 (= lt!432422 (get!15107 (select (arr!29121 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1686 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432420 () Unit!32312)

(declare-fun lemmaListMapRecursiveValidKeyArray!270 (array!60516 array!60514 (_ BitVec 32) (_ BitVec 32) V!34681 V!34681 (_ BitVec 32) Int) Unit!32312)

(assert (=> b!973467 (= lt!432420 (lemmaListMapRecursiveValidKeyArray!270 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973468 () Bool)

(declare-fun res!651670 () Bool)

(assert (=> b!973468 (=> (not res!651670) (not e!548703))))

(declare-datatypes ((List!20247 0))(
  ( (Nil!20244) (Cons!20243 (h!21405 (_ BitVec 64)) (t!28711 List!20247)) )
))
(declare-fun arrayNoDuplicates!0 (array!60516 (_ BitVec 32) List!20247) Bool)

(assert (=> b!973468 (= res!651670 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20244))))

(declare-fun res!651665 () Bool)

(assert (=> start!83364 (=> (not res!651665) (not e!548703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83364 (= res!651665 (validMask!0 mask!2147))))

(assert (=> start!83364 e!548703))

(assert (=> start!83364 true))

(declare-fun e!548704 () Bool)

(declare-fun array_inv!22581 (array!60514) Bool)

(assert (=> start!83364 (and (array_inv!22581 _values!1425) e!548704)))

(assert (=> start!83364 tp_is_empty!22273))

(assert (=> start!83364 tp!67404))

(declare-fun array_inv!22582 (array!60516) Bool)

(assert (=> start!83364 (array_inv!22582 _keys!1717)))

(declare-fun b!973469 () Bool)

(declare-fun e!548706 () Bool)

(assert (=> b!973469 (= e!548706 e!548700)))

(declare-fun res!651669 () Bool)

(assert (=> b!973469 (=> (not res!651669) (not e!548700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973469 (= res!651669 (validKeyInArray!0 lt!432421))))

(assert (=> b!973469 (= lt!432421 (select (arr!29122 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973469 (= lt!432426 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973470 () Bool)

(declare-fun res!651667 () Bool)

(assert (=> b!973470 (=> (not res!651667) (not e!548703))))

(assert (=> b!973470 (= res!651667 (validKeyInArray!0 (select (arr!29122 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35419 () Bool)

(declare-fun tp!67405 () Bool)

(assert (=> mapNonEmpty!35419 (= mapRes!35419 (and tp!67405 e!548702))))

(declare-fun mapKey!35419 () (_ BitVec 32))

(declare-fun mapRest!35419 () (Array (_ BitVec 32) ValueCell!10655))

(declare-fun mapValue!35419 () ValueCell!10655)

(assert (=> mapNonEmpty!35419 (= (arr!29121 _values!1425) (store mapRest!35419 mapKey!35419 mapValue!35419))))

(declare-fun b!973471 () Bool)

(assert (=> b!973471 (= e!548703 e!548706)))

(declare-fun res!651664 () Bool)

(assert (=> b!973471 (=> (not res!651664) (not e!548706))))

(assert (=> b!973471 (= res!651664 (contains!5619 lt!432423 (select (arr!29122 _keys!1717) i!822)))))

(assert (=> b!973471 (= lt!432423 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973472 () Bool)

(assert (=> b!973472 (= e!548704 (and e!548705 mapRes!35419))))

(declare-fun condMapEmpty!35419 () Bool)

(declare-fun mapDefault!35419 () ValueCell!10655)

(assert (=> b!973472 (= condMapEmpty!35419 (= (arr!29121 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10655)) mapDefault!35419)))))

(assert (= (and start!83364 res!651665) b!973462))

(assert (= (and b!973462 res!651663) b!973464))

(assert (= (and b!973464 res!651668) b!973468))

(assert (= (and b!973468 res!651670) b!973466))

(assert (= (and b!973466 res!651666) b!973470))

(assert (= (and b!973470 res!651667) b!973471))

(assert (= (and b!973471 res!651664) b!973469))

(assert (= (and b!973469 res!651669) b!973467))

(assert (= (and b!973472 condMapEmpty!35419) mapIsEmpty!35419))

(assert (= (and b!973472 (not condMapEmpty!35419)) mapNonEmpty!35419))

(get-info :version)

(assert (= (and mapNonEmpty!35419 ((_ is ValueCellFull!10655) mapValue!35419)) b!973465))

(assert (= (and b!973472 ((_ is ValueCellFull!10655) mapDefault!35419)) b!973463))

(assert (= start!83364 b!973472))

(declare-fun b_lambda!14521 () Bool)

(assert (=> (not b_lambda!14521) (not b!973467)))

(declare-fun t!28709 () Bool)

(declare-fun tb!6315 () Bool)

(assert (=> (and start!83364 (= defaultEntry!1428 defaultEntry!1428) t!28709) tb!6315))

(declare-fun result!12615 () Bool)

(assert (=> tb!6315 (= result!12615 tp_is_empty!22273)))

(assert (=> b!973467 t!28709))

(declare-fun b_and!30947 () Bool)

(assert (= b_and!30945 (and (=> t!28709 result!12615) b_and!30947)))

(declare-fun m!900605 () Bool)

(assert (=> b!973471 m!900605))

(assert (=> b!973471 m!900605))

(declare-fun m!900607 () Bool)

(assert (=> b!973471 m!900607))

(declare-fun m!900609 () Bool)

(assert (=> b!973471 m!900609))

(declare-fun m!900611 () Bool)

(assert (=> start!83364 m!900611))

(declare-fun m!900613 () Bool)

(assert (=> start!83364 m!900613))

(declare-fun m!900615 () Bool)

(assert (=> start!83364 m!900615))

(declare-fun m!900617 () Bool)

(assert (=> b!973464 m!900617))

(assert (=> b!973470 m!900605))

(assert (=> b!973470 m!900605))

(declare-fun m!900619 () Bool)

(assert (=> b!973470 m!900619))

(declare-fun m!900621 () Bool)

(assert (=> b!973468 m!900621))

(declare-fun m!900623 () Bool)

(assert (=> b!973467 m!900623))

(assert (=> b!973467 m!900605))

(declare-fun m!900625 () Bool)

(assert (=> b!973467 m!900625))

(declare-fun m!900627 () Bool)

(assert (=> b!973467 m!900627))

(declare-fun m!900629 () Bool)

(assert (=> b!973467 m!900629))

(assert (=> b!973467 m!900627))

(declare-fun m!900631 () Bool)

(assert (=> b!973467 m!900631))

(declare-fun m!900633 () Bool)

(assert (=> b!973467 m!900633))

(declare-fun m!900635 () Bool)

(assert (=> b!973467 m!900635))

(assert (=> b!973467 m!900605))

(declare-fun m!900637 () Bool)

(assert (=> b!973467 m!900637))

(assert (=> b!973467 m!900605))

(assert (=> b!973467 m!900623))

(assert (=> b!973467 m!900629))

(declare-fun m!900639 () Bool)

(assert (=> b!973467 m!900639))

(assert (=> b!973467 m!900635))

(declare-fun m!900641 () Bool)

(assert (=> mapNonEmpty!35419 m!900641))

(declare-fun m!900643 () Bool)

(assert (=> b!973469 m!900643))

(declare-fun m!900645 () Bool)

(assert (=> b!973469 m!900645))

(declare-fun m!900647 () Bool)

(assert (=> b!973469 m!900647))

(check-sat (not b!973470) tp_is_empty!22273 (not b_lambda!14521) (not start!83364) (not b!973469) (not b!973464) (not b!973467) (not mapNonEmpty!35419) (not b!973468) b_and!30947 (not b!973471) (not b_next!19375))
(check-sat b_and!30947 (not b_next!19375))
