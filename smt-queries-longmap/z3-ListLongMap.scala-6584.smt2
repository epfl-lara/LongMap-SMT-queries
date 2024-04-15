; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83370 () Bool)

(assert start!83370)

(declare-fun b_free!19381 () Bool)

(declare-fun b_next!19381 () Bool)

(assert (=> start!83370 (= b_free!19381 (not b_next!19381))))

(declare-fun tp!67423 () Bool)

(declare-fun b_and!30957 () Bool)

(assert (=> start!83370 (= tp!67423 b_and!30957)))

(declare-fun b!973565 () Bool)

(declare-fun res!651738 () Bool)

(declare-fun e!548759 () Bool)

(assert (=> b!973565 (=> (not res!651738) (not e!548759))))

(declare-datatypes ((array!60526 0))(
  ( (array!60527 (arr!29127 (Array (_ BitVec 32) (_ BitVec 64))) (size!29608 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60526)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973565 (= res!651738 (validKeyInArray!0 (select (arr!29127 _keys!1717) i!822)))))

(declare-fun b!973566 () Bool)

(declare-fun res!651739 () Bool)

(assert (=> b!973566 (=> (not res!651739) (not e!548759))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34689 0))(
  ( (V!34690 (val!11190 Int)) )
))
(declare-datatypes ((ValueCell!10658 0))(
  ( (ValueCellFull!10658 (v!13748 V!34689)) (EmptyCell!10658) )
))
(declare-datatypes ((array!60528 0))(
  ( (array!60529 (arr!29128 (Array (_ BitVec 32) ValueCell!10658)) (size!29609 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60528)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34689)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34689)

(declare-datatypes ((tuple2!14442 0))(
  ( (tuple2!14443 (_1!7232 (_ BitVec 64)) (_2!7232 V!34689)) )
))
(declare-datatypes ((List!20250 0))(
  ( (Nil!20247) (Cons!20246 (h!21408 tuple2!14442) (t!28718 List!20250)) )
))
(declare-datatypes ((ListLongMap!13129 0))(
  ( (ListLongMap!13130 (toList!6580 List!20250)) )
))
(declare-fun contains!5621 (ListLongMap!13129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3742 (array!60526 array!60528 (_ BitVec 32) (_ BitVec 32) V!34689 V!34689 (_ BitVec 32) Int) ListLongMap!13129)

(assert (=> b!973566 (= res!651739 (contains!5621 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29127 _keys!1717) i!822)))))

(declare-fun b!973568 () Bool)

(declare-fun e!548760 () Bool)

(declare-fun tp_is_empty!22279 () Bool)

(assert (=> b!973568 (= e!548760 tp_is_empty!22279)))

(declare-fun b!973569 () Bool)

(declare-fun res!651737 () Bool)

(assert (=> b!973569 (=> (not res!651737) (not e!548759))))

(assert (=> b!973569 (= res!651737 (and (= (size!29609 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29608 _keys!1717) (size!29609 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973570 () Bool)

(declare-fun res!651733 () Bool)

(assert (=> b!973570 (=> (not res!651733) (not e!548759))))

(declare-datatypes ((List!20251 0))(
  ( (Nil!20248) (Cons!20247 (h!21409 (_ BitVec 64)) (t!28719 List!20251)) )
))
(declare-fun arrayNoDuplicates!0 (array!60526 (_ BitVec 32) List!20251) Bool)

(assert (=> b!973570 (= res!651733 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20248))))

(declare-fun b!973567 () Bool)

(declare-fun e!548761 () Bool)

(assert (=> b!973567 (= e!548761 tp_is_empty!22279)))

(declare-fun res!651736 () Bool)

(assert (=> start!83370 (=> (not res!651736) (not e!548759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83370 (= res!651736 (validMask!0 mask!2147))))

(assert (=> start!83370 e!548759))

(assert (=> start!83370 true))

(declare-fun e!548763 () Bool)

(declare-fun array_inv!22583 (array!60528) Bool)

(assert (=> start!83370 (and (array_inv!22583 _values!1425) e!548763)))

(assert (=> start!83370 tp_is_empty!22279))

(assert (=> start!83370 tp!67423))

(declare-fun array_inv!22584 (array!60526) Bool)

(assert (=> start!83370 (array_inv!22584 _keys!1717)))

(declare-fun mapIsEmpty!35428 () Bool)

(declare-fun mapRes!35428 () Bool)

(assert (=> mapIsEmpty!35428 mapRes!35428))

(declare-fun b!973571 () Bool)

(declare-fun res!651734 () Bool)

(assert (=> b!973571 (=> (not res!651734) (not e!548759))))

(assert (=> b!973571 (= res!651734 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29608 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29608 _keys!1717))))))

(declare-fun b!973572 () Bool)

(declare-fun res!651735 () Bool)

(assert (=> b!973572 (=> (not res!651735) (not e!548759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60526 (_ BitVec 32)) Bool)

(assert (=> b!973572 (= res!651735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973573 () Bool)

(assert (=> b!973573 (= e!548763 (and e!548761 mapRes!35428))))

(declare-fun condMapEmpty!35428 () Bool)

(declare-fun mapDefault!35428 () ValueCell!10658)

(assert (=> b!973573 (= condMapEmpty!35428 (= (arr!29128 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10658)) mapDefault!35428)))))

(declare-fun mapNonEmpty!35428 () Bool)

(declare-fun tp!67422 () Bool)

(assert (=> mapNonEmpty!35428 (= mapRes!35428 (and tp!67422 e!548760))))

(declare-fun mapKey!35428 () (_ BitVec 32))

(declare-fun mapRest!35428 () (Array (_ BitVec 32) ValueCell!10658))

(declare-fun mapValue!35428 () ValueCell!10658)

(assert (=> mapNonEmpty!35428 (= (arr!29128 _values!1425) (store mapRest!35428 mapKey!35428 mapValue!35428))))

(declare-fun b!973574 () Bool)

(assert (=> b!973574 (= e!548759 false)))

(declare-fun lt!432471 () ListLongMap!13129)

(assert (=> b!973574 (= lt!432471 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83370 res!651736) b!973569))

(assert (= (and b!973569 res!651737) b!973572))

(assert (= (and b!973572 res!651735) b!973570))

(assert (= (and b!973570 res!651733) b!973571))

(assert (= (and b!973571 res!651734) b!973565))

(assert (= (and b!973565 res!651738) b!973566))

(assert (= (and b!973566 res!651739) b!973574))

(assert (= (and b!973573 condMapEmpty!35428) mapIsEmpty!35428))

(assert (= (and b!973573 (not condMapEmpty!35428)) mapNonEmpty!35428))

(get-info :version)

(assert (= (and mapNonEmpty!35428 ((_ is ValueCellFull!10658) mapValue!35428)) b!973568))

(assert (= (and b!973573 ((_ is ValueCellFull!10658) mapDefault!35428)) b!973567))

(assert (= start!83370 b!973573))

(declare-fun m!900737 () Bool)

(assert (=> b!973566 m!900737))

(declare-fun m!900739 () Bool)

(assert (=> b!973566 m!900739))

(assert (=> b!973566 m!900737))

(assert (=> b!973566 m!900739))

(declare-fun m!900741 () Bool)

(assert (=> b!973566 m!900741))

(declare-fun m!900743 () Bool)

(assert (=> start!83370 m!900743))

(declare-fun m!900745 () Bool)

(assert (=> start!83370 m!900745))

(declare-fun m!900747 () Bool)

(assert (=> start!83370 m!900747))

(declare-fun m!900749 () Bool)

(assert (=> b!973570 m!900749))

(assert (=> b!973565 m!900739))

(assert (=> b!973565 m!900739))

(declare-fun m!900751 () Bool)

(assert (=> b!973565 m!900751))

(declare-fun m!900753 () Bool)

(assert (=> b!973572 m!900753))

(declare-fun m!900755 () Bool)

(assert (=> b!973574 m!900755))

(declare-fun m!900757 () Bool)

(assert (=> mapNonEmpty!35428 m!900757))

(check-sat (not b!973570) (not start!83370) (not mapNonEmpty!35428) tp_is_empty!22279 (not b!973574) b_and!30957 (not b!973566) (not b!973565) (not b_next!19381) (not b!973572))
(check-sat b_and!30957 (not b_next!19381))
