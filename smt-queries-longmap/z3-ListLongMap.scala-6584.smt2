; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83556 () Bool)

(assert start!83556)

(declare-fun b_free!19381 () Bool)

(declare-fun b_next!19381 () Bool)

(assert (=> start!83556 (= b_free!19381 (not b_next!19381))))

(declare-fun tp!67422 () Bool)

(declare-fun b_and!30993 () Bool)

(assert (=> start!83556 (= tp!67422 b_and!30993)))

(declare-fun b!974707 () Bool)

(declare-fun res!652192 () Bool)

(declare-fun e!549493 () Bool)

(assert (=> b!974707 (=> (not res!652192) (not e!549493))))

(declare-datatypes ((array!60630 0))(
  ( (array!60631 (arr!29174 (Array (_ BitVec 32) (_ BitVec 64))) (size!29654 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60630)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974707 (= res!652192 (validKeyInArray!0 (select (arr!29174 _keys!1717) i!822)))))

(declare-fun b!974708 () Bool)

(declare-fun res!652187 () Bool)

(assert (=> b!974708 (=> (not res!652187) (not e!549493))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34689 0))(
  ( (V!34690 (val!11190 Int)) )
))
(declare-datatypes ((ValueCell!10658 0))(
  ( (ValueCellFull!10658 (v!13746 V!34689)) (EmptyCell!10658) )
))
(declare-datatypes ((array!60632 0))(
  ( (array!60633 (arr!29175 (Array (_ BitVec 32) ValueCell!10658)) (size!29655 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60632)

(declare-fun zeroValue!1367 () V!34689)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34689)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14378 0))(
  ( (tuple2!14379 (_1!7200 (_ BitVec 64)) (_2!7200 V!34689)) )
))
(declare-datatypes ((List!20226 0))(
  ( (Nil!20223) (Cons!20222 (h!21390 tuple2!14378) (t!28695 List!20226)) )
))
(declare-datatypes ((ListLongMap!13077 0))(
  ( (ListLongMap!13078 (toList!6554 List!20226)) )
))
(declare-fun contains!5660 (ListLongMap!13077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3787 (array!60630 array!60632 (_ BitVec 32) (_ BitVec 32) V!34689 V!34689 (_ BitVec 32) Int) ListLongMap!13077)

(assert (=> b!974708 (= res!652187 (contains!5660 (getCurrentListMap!3787 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29174 _keys!1717) i!822)))))

(declare-fun res!652191 () Bool)

(assert (=> start!83556 (=> (not res!652191) (not e!549493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83556 (= res!652191 (validMask!0 mask!2147))))

(assert (=> start!83556 e!549493))

(assert (=> start!83556 true))

(declare-fun e!549490 () Bool)

(declare-fun array_inv!22621 (array!60632) Bool)

(assert (=> start!83556 (and (array_inv!22621 _values!1425) e!549490)))

(declare-fun tp_is_empty!22279 () Bool)

(assert (=> start!83556 tp_is_empty!22279))

(assert (=> start!83556 tp!67422))

(declare-fun array_inv!22622 (array!60630) Bool)

(assert (=> start!83556 (array_inv!22622 _keys!1717)))

(declare-fun b!974709 () Bool)

(declare-fun res!652189 () Bool)

(assert (=> b!974709 (=> (not res!652189) (not e!549493))))

(assert (=> b!974709 (= res!652189 (and (= (size!29655 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29654 _keys!1717) (size!29655 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35428 () Bool)

(declare-fun mapRes!35428 () Bool)

(assert (=> mapIsEmpty!35428 mapRes!35428))

(declare-fun b!974710 () Bool)

(declare-fun res!652188 () Bool)

(assert (=> b!974710 (=> (not res!652188) (not e!549493))))

(assert (=> b!974710 (= res!652188 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29654 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29654 _keys!1717))))))

(declare-fun b!974711 () Bool)

(declare-fun e!549492 () Bool)

(assert (=> b!974711 (= e!549490 (and e!549492 mapRes!35428))))

(declare-fun condMapEmpty!35428 () Bool)

(declare-fun mapDefault!35428 () ValueCell!10658)

(assert (=> b!974711 (= condMapEmpty!35428 (= (arr!29175 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10658)) mapDefault!35428)))))

(declare-fun b!974712 () Bool)

(assert (=> b!974712 (= e!549493 false)))

(declare-fun lt!433068 () ListLongMap!13077)

(assert (=> b!974712 (= lt!433068 (getCurrentListMap!3787 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974713 () Bool)

(declare-fun res!652190 () Bool)

(assert (=> b!974713 (=> (not res!652190) (not e!549493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60630 (_ BitVec 32)) Bool)

(assert (=> b!974713 (= res!652190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974714 () Bool)

(declare-fun e!549489 () Bool)

(assert (=> b!974714 (= e!549489 tp_is_empty!22279)))

(declare-fun b!974715 () Bool)

(declare-fun res!652193 () Bool)

(assert (=> b!974715 (=> (not res!652193) (not e!549493))))

(declare-datatypes ((List!20227 0))(
  ( (Nil!20224) (Cons!20223 (h!21391 (_ BitVec 64)) (t!28696 List!20227)) )
))
(declare-fun arrayNoDuplicates!0 (array!60630 (_ BitVec 32) List!20227) Bool)

(assert (=> b!974715 (= res!652193 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20224))))

(declare-fun b!974716 () Bool)

(assert (=> b!974716 (= e!549492 tp_is_empty!22279)))

(declare-fun mapNonEmpty!35428 () Bool)

(declare-fun tp!67423 () Bool)

(assert (=> mapNonEmpty!35428 (= mapRes!35428 (and tp!67423 e!549489))))

(declare-fun mapValue!35428 () ValueCell!10658)

(declare-fun mapRest!35428 () (Array (_ BitVec 32) ValueCell!10658))

(declare-fun mapKey!35428 () (_ BitVec 32))

(assert (=> mapNonEmpty!35428 (= (arr!29175 _values!1425) (store mapRest!35428 mapKey!35428 mapValue!35428))))

(assert (= (and start!83556 res!652191) b!974709))

(assert (= (and b!974709 res!652189) b!974713))

(assert (= (and b!974713 res!652190) b!974715))

(assert (= (and b!974715 res!652193) b!974710))

(assert (= (and b!974710 res!652188) b!974707))

(assert (= (and b!974707 res!652192) b!974708))

(assert (= (and b!974708 res!652187) b!974712))

(assert (= (and b!974711 condMapEmpty!35428) mapIsEmpty!35428))

(assert (= (and b!974711 (not condMapEmpty!35428)) mapNonEmpty!35428))

(get-info :version)

(assert (= (and mapNonEmpty!35428 ((_ is ValueCellFull!10658) mapValue!35428)) b!974714))

(assert (= (and b!974711 ((_ is ValueCellFull!10658) mapDefault!35428)) b!974716))

(assert (= start!83556 b!974711))

(declare-fun m!902789 () Bool)

(assert (=> mapNonEmpty!35428 m!902789))

(declare-fun m!902791 () Bool)

(assert (=> b!974713 m!902791))

(declare-fun m!902793 () Bool)

(assert (=> b!974712 m!902793))

(declare-fun m!902795 () Bool)

(assert (=> b!974715 m!902795))

(declare-fun m!902797 () Bool)

(assert (=> b!974708 m!902797))

(declare-fun m!902799 () Bool)

(assert (=> b!974708 m!902799))

(assert (=> b!974708 m!902797))

(assert (=> b!974708 m!902799))

(declare-fun m!902801 () Bool)

(assert (=> b!974708 m!902801))

(assert (=> b!974707 m!902799))

(assert (=> b!974707 m!902799))

(declare-fun m!902803 () Bool)

(assert (=> b!974707 m!902803))

(declare-fun m!902805 () Bool)

(assert (=> start!83556 m!902805))

(declare-fun m!902807 () Bool)

(assert (=> start!83556 m!902807))

(declare-fun m!902809 () Bool)

(assert (=> start!83556 m!902809))

(check-sat tp_is_empty!22279 (not b_next!19381) (not b!974708) (not start!83556) (not b!974707) (not b!974715) (not b!974713) (not mapNonEmpty!35428) (not b!974712) b_and!30993)
(check-sat b_and!30993 (not b_next!19381))
