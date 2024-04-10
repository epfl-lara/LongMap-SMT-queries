; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83370 () Bool)

(assert start!83370)

(declare-fun b_free!19363 () Bool)

(declare-fun b_next!19363 () Bool)

(assert (=> start!83370 (= b_free!19363 (not b_next!19363))))

(declare-fun tp!67368 () Bool)

(declare-fun b_and!30947 () Bool)

(assert (=> start!83370 (= tp!67368 b_and!30947)))

(declare-fun b!973491 () Bool)

(declare-fun e!548727 () Bool)

(declare-fun tp_is_empty!22261 () Bool)

(assert (=> b!973491 (= e!548727 tp_is_empty!22261)))

(declare-fun mapNonEmpty!35401 () Bool)

(declare-fun mapRes!35401 () Bool)

(declare-fun tp!67367 () Bool)

(assert (=> mapNonEmpty!35401 (= mapRes!35401 (and tp!67367 e!548727))))

(declare-datatypes ((V!34665 0))(
  ( (V!34666 (val!11181 Int)) )
))
(declare-datatypes ((ValueCell!10649 0))(
  ( (ValueCellFull!10649 (v!13740 V!34665)) (EmptyCell!10649) )
))
(declare-fun mapRest!35401 () (Array (_ BitVec 32) ValueCell!10649))

(declare-datatypes ((array!60563 0))(
  ( (array!60564 (arr!29145 (Array (_ BitVec 32) ValueCell!10649)) (size!29624 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60563)

(declare-fun mapKey!35401 () (_ BitVec 32))

(declare-fun mapValue!35401 () ValueCell!10649)

(assert (=> mapNonEmpty!35401 (= (arr!29145 _values!1425) (store mapRest!35401 mapKey!35401 mapValue!35401))))

(declare-fun mapIsEmpty!35401 () Bool)

(assert (=> mapIsEmpty!35401 mapRes!35401))

(declare-fun b!973492 () Bool)

(declare-fun e!548724 () Bool)

(assert (=> b!973492 (= e!548724 tp_is_empty!22261)))

(declare-fun b!973493 () Bool)

(declare-fun e!548728 () Bool)

(declare-fun e!548723 () Bool)

(assert (=> b!973493 (= e!548728 e!548723)))

(declare-fun res!651632 () Bool)

(assert (=> b!973493 (=> (not res!651632) (not e!548723))))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14356 0))(
  ( (tuple2!14357 (_1!7189 (_ BitVec 64)) (_2!7189 V!34665)) )
))
(declare-datatypes ((List!20215 0))(
  ( (Nil!20212) (Cons!20211 (h!21373 tuple2!14356) (t!28676 List!20215)) )
))
(declare-datatypes ((ListLongMap!13053 0))(
  ( (ListLongMap!13054 (toList!6542 List!20215)) )
))
(declare-fun lt!432530 () ListLongMap!13053)

(declare-datatypes ((array!60565 0))(
  ( (array!60566 (arr!29146 (Array (_ BitVec 32) (_ BitVec 64))) (size!29625 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60565)

(declare-fun contains!5634 (ListLongMap!13053 (_ BitVec 64)) Bool)

(assert (=> b!973493 (= res!651632 (contains!5634 lt!432530 (select (arr!29146 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34665)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34665)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3775 (array!60565 array!60563 (_ BitVec 32) (_ BitVec 32) V!34665 V!34665 (_ BitVec 32) Int) ListLongMap!13053)

(assert (=> b!973493 (= lt!432530 (getCurrentListMap!3775 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973494 () Bool)

(declare-fun res!651629 () Bool)

(assert (=> b!973494 (=> (not res!651629) (not e!548728))))

(declare-datatypes ((List!20216 0))(
  ( (Nil!20213) (Cons!20212 (h!21374 (_ BitVec 64)) (t!28677 List!20216)) )
))
(declare-fun arrayNoDuplicates!0 (array!60565 (_ BitVec 32) List!20216) Bool)

(assert (=> b!973494 (= res!651629 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20213))))

(declare-fun b!973495 () Bool)

(declare-fun res!651634 () Bool)

(assert (=> b!973495 (=> (not res!651634) (not e!548728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60565 (_ BitVec 32)) Bool)

(assert (=> b!973495 (= res!651634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973496 () Bool)

(declare-fun e!548725 () Bool)

(assert (=> b!973496 (= e!548725 (not true))))

(declare-fun lt!432535 () tuple2!14356)

(declare-fun +!2908 (ListLongMap!13053 tuple2!14356) ListLongMap!13053)

(assert (=> b!973496 (contains!5634 (+!2908 lt!432530 lt!432535) (select (arr!29146 _keys!1717) i!822))))

(declare-datatypes ((Unit!32437 0))(
  ( (Unit!32438) )
))
(declare-fun lt!432534 () Unit!32437)

(declare-fun lt!432532 () (_ BitVec 64))

(declare-fun lt!432533 () V!34665)

(declare-fun addStillContains!604 (ListLongMap!13053 (_ BitVec 64) V!34665 (_ BitVec 64)) Unit!32437)

(assert (=> b!973496 (= lt!432534 (addStillContains!604 lt!432530 lt!432532 lt!432533 (select (arr!29146 _keys!1717) i!822)))))

(declare-fun lt!432531 () ListLongMap!13053)

(assert (=> b!973496 (= lt!432531 (+!2908 (getCurrentListMap!3775 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432535))))

(assert (=> b!973496 (= lt!432535 (tuple2!14357 lt!432532 lt!432533))))

(declare-fun get!15109 (ValueCell!10649 V!34665) V!34665)

(declare-fun dynLambda!1697 (Int (_ BitVec 64)) V!34665)

(assert (=> b!973496 (= lt!432533 (get!15109 (select (arr!29145 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1697 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432536 () Unit!32437)

(declare-fun lemmaListMapRecursiveValidKeyArray!274 (array!60565 array!60563 (_ BitVec 32) (_ BitVec 32) V!34665 V!34665 (_ BitVec 32) Int) Unit!32437)

(assert (=> b!973496 (= lt!432536 (lemmaListMapRecursiveValidKeyArray!274 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!651635 () Bool)

(assert (=> start!83370 (=> (not res!651635) (not e!548728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83370 (= res!651635 (validMask!0 mask!2147))))

(assert (=> start!83370 e!548728))

(assert (=> start!83370 true))

(declare-fun e!548726 () Bool)

(declare-fun array_inv!22545 (array!60563) Bool)

(assert (=> start!83370 (and (array_inv!22545 _values!1425) e!548726)))

(assert (=> start!83370 tp_is_empty!22261))

(assert (=> start!83370 tp!67368))

(declare-fun array_inv!22546 (array!60565) Bool)

(assert (=> start!83370 (array_inv!22546 _keys!1717)))

(declare-fun b!973497 () Bool)

(declare-fun res!651631 () Bool)

(assert (=> b!973497 (=> (not res!651631) (not e!548728))))

(assert (=> b!973497 (= res!651631 (and (= (size!29624 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29625 _keys!1717) (size!29624 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973498 () Bool)

(declare-fun res!651636 () Bool)

(assert (=> b!973498 (=> (not res!651636) (not e!548728))))

(assert (=> b!973498 (= res!651636 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29625 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29625 _keys!1717))))))

(declare-fun b!973499 () Bool)

(assert (=> b!973499 (= e!548723 e!548725)))

(declare-fun res!651633 () Bool)

(assert (=> b!973499 (=> (not res!651633) (not e!548725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973499 (= res!651633 (validKeyInArray!0 lt!432532))))

(assert (=> b!973499 (= lt!432532 (select (arr!29146 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973499 (= lt!432531 (getCurrentListMap!3775 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973500 () Bool)

(assert (=> b!973500 (= e!548726 (and e!548724 mapRes!35401))))

(declare-fun condMapEmpty!35401 () Bool)

(declare-fun mapDefault!35401 () ValueCell!10649)

