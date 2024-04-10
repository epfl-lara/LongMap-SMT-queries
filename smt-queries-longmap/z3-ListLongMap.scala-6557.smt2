; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83228 () Bool)

(assert start!83228)

(declare-fun b_free!19221 () Bool)

(declare-fun b_next!19221 () Bool)

(assert (=> start!83228 (= b_free!19221 (not b_next!19221))))

(declare-fun tp!66942 () Bool)

(declare-fun b_and!30709 () Bool)

(assert (=> start!83228 (= tp!66942 b_and!30709)))

(declare-fun b!971119 () Bool)

(declare-fun res!649995 () Bool)

(declare-fun e!547457 () Bool)

(assert (=> b!971119 (=> (not res!649995) (not e!547457))))

(declare-datatypes ((array!60291 0))(
  ( (array!60292 (arr!29009 (Array (_ BitVec 32) (_ BitVec 64))) (size!29488 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60291)

(declare-datatypes ((List!20108 0))(
  ( (Nil!20105) (Cons!20104 (h!21266 (_ BitVec 64)) (t!28471 List!20108)) )
))
(declare-fun arrayNoDuplicates!0 (array!60291 (_ BitVec 32) List!20108) Bool)

(assert (=> b!971119 (= res!649995 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20105))))

(declare-fun b!971120 () Bool)

(declare-fun res!649998 () Bool)

(assert (=> b!971120 (=> (not res!649998) (not e!547457))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34475 0))(
  ( (V!34476 (val!11110 Int)) )
))
(declare-datatypes ((ValueCell!10578 0))(
  ( (ValueCellFull!10578 (v!13669 V!34475)) (EmptyCell!10578) )
))
(declare-datatypes ((array!60293 0))(
  ( (array!60294 (arr!29010 (Array (_ BitVec 32) ValueCell!10578)) (size!29489 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60293)

(declare-fun zeroValue!1367 () V!34475)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34475)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14240 0))(
  ( (tuple2!14241 (_1!7131 (_ BitVec 64)) (_2!7131 V!34475)) )
))
(declare-datatypes ((List!20109 0))(
  ( (Nil!20106) (Cons!20105 (h!21267 tuple2!14240) (t!28472 List!20109)) )
))
(declare-datatypes ((ListLongMap!12937 0))(
  ( (ListLongMap!12938 (toList!6484 List!20109)) )
))
(declare-fun contains!5586 (ListLongMap!12937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3717 (array!60291 array!60293 (_ BitVec 32) (_ BitVec 32) V!34475 V!34475 (_ BitVec 32) Int) ListLongMap!12937)

(assert (=> b!971120 (= res!649998 (contains!5586 (getCurrentListMap!3717 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29009 _keys!1717) i!822)))))

(declare-fun res!649993 () Bool)

(assert (=> start!83228 (=> (not res!649993) (not e!547457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83228 (= res!649993 (validMask!0 mask!2147))))

(assert (=> start!83228 e!547457))

(assert (=> start!83228 true))

(declare-fun e!547455 () Bool)

(declare-fun array_inv!22451 (array!60293) Bool)

(assert (=> start!83228 (and (array_inv!22451 _values!1425) e!547455)))

(declare-fun tp_is_empty!22119 () Bool)

(assert (=> start!83228 tp_is_empty!22119))

(assert (=> start!83228 tp!66942))

(declare-fun array_inv!22452 (array!60291) Bool)

(assert (=> start!83228 (array_inv!22452 _keys!1717)))

(declare-fun b!971121 () Bool)

(declare-fun res!649996 () Bool)

(assert (=> b!971121 (=> (not res!649996) (not e!547457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971121 (= res!649996 (validKeyInArray!0 (select (arr!29009 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35188 () Bool)

(declare-fun mapRes!35188 () Bool)

(declare-fun tp!66941 () Bool)

(declare-fun e!547456 () Bool)

(assert (=> mapNonEmpty!35188 (= mapRes!35188 (and tp!66941 e!547456))))

(declare-fun mapRest!35188 () (Array (_ BitVec 32) ValueCell!10578))

(declare-fun mapValue!35188 () ValueCell!10578)

(declare-fun mapKey!35188 () (_ BitVec 32))

(assert (=> mapNonEmpty!35188 (= (arr!29010 _values!1425) (store mapRest!35188 mapKey!35188 mapValue!35188))))

(declare-fun b!971122 () Bool)

(declare-fun e!547458 () Bool)

(assert (=> b!971122 (= e!547458 tp_is_empty!22119)))

(declare-fun b!971123 () Bool)

(assert (=> b!971123 (= e!547455 (and e!547458 mapRes!35188))))

(declare-fun condMapEmpty!35188 () Bool)

(declare-fun mapDefault!35188 () ValueCell!10578)

(assert (=> b!971123 (= condMapEmpty!35188 (= (arr!29010 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10578)) mapDefault!35188)))))

(declare-fun b!971124 () Bool)

(declare-fun res!649994 () Bool)

(assert (=> b!971124 (=> (not res!649994) (not e!547457))))

(assert (=> b!971124 (= res!649994 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29488 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29488 _keys!1717))))))

(declare-fun b!971125 () Bool)

(assert (=> b!971125 (= e!547457 false)))

(declare-fun lt!431801 () ListLongMap!12937)

(assert (=> b!971125 (= lt!431801 (getCurrentListMap!3717 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971126 () Bool)

(declare-fun res!649992 () Bool)

(assert (=> b!971126 (=> (not res!649992) (not e!547457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60291 (_ BitVec 32)) Bool)

(assert (=> b!971126 (= res!649992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971127 () Bool)

(declare-fun res!649997 () Bool)

(assert (=> b!971127 (=> (not res!649997) (not e!547457))))

(assert (=> b!971127 (= res!649997 (and (= (size!29489 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29488 _keys!1717) (size!29489 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35188 () Bool)

(assert (=> mapIsEmpty!35188 mapRes!35188))

(declare-fun b!971128 () Bool)

(assert (=> b!971128 (= e!547456 tp_is_empty!22119)))

(assert (= (and start!83228 res!649993) b!971127))

(assert (= (and b!971127 res!649997) b!971126))

(assert (= (and b!971126 res!649992) b!971119))

(assert (= (and b!971119 res!649995) b!971124))

(assert (= (and b!971124 res!649994) b!971121))

(assert (= (and b!971121 res!649996) b!971120))

(assert (= (and b!971120 res!649998) b!971125))

(assert (= (and b!971123 condMapEmpty!35188) mapIsEmpty!35188))

(assert (= (and b!971123 (not condMapEmpty!35188)) mapNonEmpty!35188))

(get-info :version)

(assert (= (and mapNonEmpty!35188 ((_ is ValueCellFull!10578) mapValue!35188)) b!971128))

(assert (= (and b!971123 ((_ is ValueCellFull!10578) mapDefault!35188)) b!971122))

(assert (= start!83228 b!971123))

(declare-fun m!898661 () Bool)

(assert (=> mapNonEmpty!35188 m!898661))

(declare-fun m!898663 () Bool)

(assert (=> b!971126 m!898663))

(declare-fun m!898665 () Bool)

(assert (=> b!971121 m!898665))

(assert (=> b!971121 m!898665))

(declare-fun m!898667 () Bool)

(assert (=> b!971121 m!898667))

(declare-fun m!898669 () Bool)

(assert (=> b!971120 m!898669))

(assert (=> b!971120 m!898665))

(assert (=> b!971120 m!898669))

(assert (=> b!971120 m!898665))

(declare-fun m!898671 () Bool)

(assert (=> b!971120 m!898671))

(declare-fun m!898673 () Bool)

(assert (=> start!83228 m!898673))

(declare-fun m!898675 () Bool)

(assert (=> start!83228 m!898675))

(declare-fun m!898677 () Bool)

(assert (=> start!83228 m!898677))

(declare-fun m!898679 () Bool)

(assert (=> b!971119 m!898679))

(declare-fun m!898681 () Bool)

(assert (=> b!971125 m!898681))

(check-sat (not mapNonEmpty!35188) (not b_next!19221) (not b!971119) (not b!971120) b_and!30709 (not b!971121) tp_is_empty!22119 (not b!971126) (not b!971125) (not start!83228))
(check-sat b_and!30709 (not b_next!19221))
