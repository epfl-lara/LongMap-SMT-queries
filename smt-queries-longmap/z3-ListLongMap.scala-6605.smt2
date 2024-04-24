; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83682 () Bool)

(assert start!83682)

(declare-fun b_free!19501 () Bool)

(declare-fun b_next!19501 () Bool)

(assert (=> start!83682 (= b_free!19501 (not b_next!19501))))

(declare-fun tp!67791 () Bool)

(declare-fun b_and!31113 () Bool)

(assert (=> start!83682 (= tp!67791 b_and!31113)))

(declare-fun mapIsEmpty!35617 () Bool)

(declare-fun mapRes!35617 () Bool)

(assert (=> mapIsEmpty!35617 mapRes!35617))

(declare-fun b!976579 () Bool)

(declare-fun res!653494 () Bool)

(declare-fun e!550455 () Bool)

(assert (=> b!976579 (=> (not res!653494) (not e!550455))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34857 0))(
  ( (V!34858 (val!11253 Int)) )
))
(declare-datatypes ((ValueCell!10721 0))(
  ( (ValueCellFull!10721 (v!13809 V!34857)) (EmptyCell!10721) )
))
(declare-datatypes ((array!60878 0))(
  ( (array!60879 (arr!29298 (Array (_ BitVec 32) ValueCell!10721)) (size!29778 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60878)

(declare-fun zeroValue!1367 () V!34857)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34857)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60880 0))(
  ( (array!60881 (arr!29299 (Array (_ BitVec 32) (_ BitVec 64))) (size!29779 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60880)

(declare-datatypes ((tuple2!14474 0))(
  ( (tuple2!14475 (_1!7248 (_ BitVec 64)) (_2!7248 V!34857)) )
))
(declare-datatypes ((List!20320 0))(
  ( (Nil!20317) (Cons!20316 (h!21484 tuple2!14474) (t!28789 List!20320)) )
))
(declare-datatypes ((ListLongMap!13173 0))(
  ( (ListLongMap!13174 (toList!6602 List!20320)) )
))
(declare-fun contains!5701 (ListLongMap!13173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3835 (array!60880 array!60878 (_ BitVec 32) (_ BitVec 32) V!34857 V!34857 (_ BitVec 32) Int) ListLongMap!13173)

(assert (=> b!976579 (= res!653494 (contains!5701 (getCurrentListMap!3835 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29299 _keys!1717) i!822)))))

(declare-fun b!976580 () Bool)

(declare-fun res!653492 () Bool)

(assert (=> b!976580 (=> (not res!653492) (not e!550455))))

(declare-datatypes ((List!20321 0))(
  ( (Nil!20318) (Cons!20317 (h!21485 (_ BitVec 64)) (t!28790 List!20321)) )
))
(declare-fun arrayNoDuplicates!0 (array!60880 (_ BitVec 32) List!20321) Bool)

(assert (=> b!976580 (= res!653492 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20318))))

(declare-fun b!976581 () Bool)

(declare-fun res!653498 () Bool)

(assert (=> b!976581 (=> (not res!653498) (not e!550455))))

(assert (=> b!976581 (= res!653498 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29779 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29779 _keys!1717))))))

(declare-fun b!976582 () Bool)

(assert (=> b!976582 (= e!550455 false)))

(declare-fun lt!433248 () ListLongMap!13173)

(assert (=> b!976582 (= lt!433248 (getCurrentListMap!3835 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976583 () Bool)

(declare-fun res!653493 () Bool)

(assert (=> b!976583 (=> (not res!653493) (not e!550455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60880 (_ BitVec 32)) Bool)

(assert (=> b!976583 (= res!653493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!653495 () Bool)

(assert (=> start!83682 (=> (not res!653495) (not e!550455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83682 (= res!653495 (validMask!0 mask!2147))))

(assert (=> start!83682 e!550455))

(assert (=> start!83682 true))

(declare-fun e!550453 () Bool)

(declare-fun array_inv!22713 (array!60878) Bool)

(assert (=> start!83682 (and (array_inv!22713 _values!1425) e!550453)))

(declare-fun tp_is_empty!22405 () Bool)

(assert (=> start!83682 tp_is_empty!22405))

(assert (=> start!83682 tp!67791))

(declare-fun array_inv!22714 (array!60880) Bool)

(assert (=> start!83682 (array_inv!22714 _keys!1717)))

(declare-fun b!976584 () Bool)

(declare-fun e!550456 () Bool)

(assert (=> b!976584 (= e!550453 (and e!550456 mapRes!35617))))

(declare-fun condMapEmpty!35617 () Bool)

(declare-fun mapDefault!35617 () ValueCell!10721)

(assert (=> b!976584 (= condMapEmpty!35617 (= (arr!29298 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10721)) mapDefault!35617)))))

(declare-fun b!976585 () Bool)

(assert (=> b!976585 (= e!550456 tp_is_empty!22405)))

(declare-fun b!976586 () Bool)

(declare-fun res!653496 () Bool)

(assert (=> b!976586 (=> (not res!653496) (not e!550455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976586 (= res!653496 (validKeyInArray!0 (select (arr!29299 _keys!1717) i!822)))))

(declare-fun b!976587 () Bool)

(declare-fun res!653497 () Bool)

(assert (=> b!976587 (=> (not res!653497) (not e!550455))))

(assert (=> b!976587 (= res!653497 (and (= (size!29778 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29779 _keys!1717) (size!29778 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976588 () Bool)

(declare-fun e!550452 () Bool)

(assert (=> b!976588 (= e!550452 tp_is_empty!22405)))

(declare-fun mapNonEmpty!35617 () Bool)

(declare-fun tp!67792 () Bool)

(assert (=> mapNonEmpty!35617 (= mapRes!35617 (and tp!67792 e!550452))))

(declare-fun mapRest!35617 () (Array (_ BitVec 32) ValueCell!10721))

(declare-fun mapValue!35617 () ValueCell!10721)

(declare-fun mapKey!35617 () (_ BitVec 32))

(assert (=> mapNonEmpty!35617 (= (arr!29298 _values!1425) (store mapRest!35617 mapKey!35617 mapValue!35617))))

(assert (= (and start!83682 res!653495) b!976587))

(assert (= (and b!976587 res!653497) b!976583))

(assert (= (and b!976583 res!653493) b!976580))

(assert (= (and b!976580 res!653492) b!976581))

(assert (= (and b!976581 res!653498) b!976586))

(assert (= (and b!976586 res!653496) b!976579))

(assert (= (and b!976579 res!653494) b!976582))

(assert (= (and b!976584 condMapEmpty!35617) mapIsEmpty!35617))

(assert (= (and b!976584 (not condMapEmpty!35617)) mapNonEmpty!35617))

(get-info :version)

(assert (= (and mapNonEmpty!35617 ((_ is ValueCellFull!10721) mapValue!35617)) b!976588))

(assert (= (and b!976584 ((_ is ValueCellFull!10721) mapDefault!35617)) b!976585))

(assert (= start!83682 b!976584))

(declare-fun m!904157 () Bool)

(assert (=> b!976579 m!904157))

(declare-fun m!904159 () Bool)

(assert (=> b!976579 m!904159))

(assert (=> b!976579 m!904157))

(assert (=> b!976579 m!904159))

(declare-fun m!904161 () Bool)

(assert (=> b!976579 m!904161))

(declare-fun m!904163 () Bool)

(assert (=> start!83682 m!904163))

(declare-fun m!904165 () Bool)

(assert (=> start!83682 m!904165))

(declare-fun m!904167 () Bool)

(assert (=> start!83682 m!904167))

(declare-fun m!904169 () Bool)

(assert (=> mapNonEmpty!35617 m!904169))

(assert (=> b!976586 m!904159))

(assert (=> b!976586 m!904159))

(declare-fun m!904171 () Bool)

(assert (=> b!976586 m!904171))

(declare-fun m!904173 () Bool)

(assert (=> b!976580 m!904173))

(declare-fun m!904175 () Bool)

(assert (=> b!976582 m!904175))

(declare-fun m!904177 () Bool)

(assert (=> b!976583 m!904177))

(check-sat (not b!976579) (not b!976583) b_and!31113 (not mapNonEmpty!35617) (not b!976586) (not start!83682) (not b!976580) tp_is_empty!22405 (not b!976582) (not b_next!19501))
(check-sat b_and!31113 (not b_next!19501))
