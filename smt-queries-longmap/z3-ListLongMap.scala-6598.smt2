; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83640 () Bool)

(assert start!83640)

(declare-fun b_free!19459 () Bool)

(declare-fun b_next!19459 () Bool)

(assert (=> start!83640 (= b_free!19459 (not b_next!19459))))

(declare-fun tp!67666 () Bool)

(declare-fun b_and!31071 () Bool)

(assert (=> start!83640 (= tp!67666 b_and!31071)))

(declare-fun b!975940 () Bool)

(declare-fun e!550131 () Bool)

(declare-fun e!550128 () Bool)

(declare-fun mapRes!35554 () Bool)

(assert (=> b!975940 (= e!550131 (and e!550128 mapRes!35554))))

(declare-fun condMapEmpty!35554 () Bool)

(declare-datatypes ((V!34801 0))(
  ( (V!34802 (val!11232 Int)) )
))
(declare-datatypes ((ValueCell!10700 0))(
  ( (ValueCellFull!10700 (v!13788 V!34801)) (EmptyCell!10700) )
))
(declare-datatypes ((array!60794 0))(
  ( (array!60795 (arr!29256 (Array (_ BitVec 32) ValueCell!10700)) (size!29736 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60794)

(declare-fun mapDefault!35554 () ValueCell!10700)

(assert (=> b!975940 (= condMapEmpty!35554 (= (arr!29256 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10700)) mapDefault!35554)))))

(declare-fun b!975941 () Bool)

(declare-fun res!653042 () Bool)

(declare-fun e!550129 () Bool)

(assert (=> b!975941 (=> (not res!653042) (not e!550129))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34801)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34801)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60796 0))(
  ( (array!60797 (arr!29257 (Array (_ BitVec 32) (_ BitVec 64))) (size!29737 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60796)

(declare-datatypes ((tuple2!14444 0))(
  ( (tuple2!14445 (_1!7233 (_ BitVec 64)) (_2!7233 V!34801)) )
))
(declare-datatypes ((List!20292 0))(
  ( (Nil!20289) (Cons!20288 (h!21456 tuple2!14444) (t!28761 List!20292)) )
))
(declare-datatypes ((ListLongMap!13143 0))(
  ( (ListLongMap!13144 (toList!6587 List!20292)) )
))
(declare-fun contains!5688 (ListLongMap!13143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3820 (array!60796 array!60794 (_ BitVec 32) (_ BitVec 32) V!34801 V!34801 (_ BitVec 32) Int) ListLongMap!13143)

(assert (=> b!975941 (= res!653042 (contains!5688 (getCurrentListMap!3820 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29257 _keys!1717) i!822)))))

(declare-fun b!975942 () Bool)

(declare-fun e!550132 () Bool)

(declare-fun tp_is_empty!22363 () Bool)

(assert (=> b!975942 (= e!550132 tp_is_empty!22363)))

(declare-fun mapIsEmpty!35554 () Bool)

(assert (=> mapIsEmpty!35554 mapRes!35554))

(declare-fun b!975943 () Bool)

(declare-fun res!653045 () Bool)

(assert (=> b!975943 (=> (not res!653045) (not e!550129))))

(assert (=> b!975943 (= res!653045 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29737 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29737 _keys!1717))))))

(declare-fun b!975944 () Bool)

(assert (=> b!975944 (= e!550129 false)))

(declare-fun lt!433185 () ListLongMap!13143)

(assert (=> b!975944 (= lt!433185 (getCurrentListMap!3820 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653044 () Bool)

(assert (=> start!83640 (=> (not res!653044) (not e!550129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83640 (= res!653044 (validMask!0 mask!2147))))

(assert (=> start!83640 e!550129))

(assert (=> start!83640 true))

(declare-fun array_inv!22677 (array!60794) Bool)

(assert (=> start!83640 (and (array_inv!22677 _values!1425) e!550131)))

(assert (=> start!83640 tp_is_empty!22363))

(assert (=> start!83640 tp!67666))

(declare-fun array_inv!22678 (array!60796) Bool)

(assert (=> start!83640 (array_inv!22678 _keys!1717)))

(declare-fun b!975945 () Bool)

(declare-fun res!653043 () Bool)

(assert (=> b!975945 (=> (not res!653043) (not e!550129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975945 (= res!653043 (validKeyInArray!0 (select (arr!29257 _keys!1717) i!822)))))

(declare-fun b!975946 () Bool)

(declare-fun res!653048 () Bool)

(assert (=> b!975946 (=> (not res!653048) (not e!550129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60796 (_ BitVec 32)) Bool)

(assert (=> b!975946 (= res!653048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975947 () Bool)

(assert (=> b!975947 (= e!550128 tp_is_empty!22363)))

(declare-fun b!975948 () Bool)

(declare-fun res!653046 () Bool)

(assert (=> b!975948 (=> (not res!653046) (not e!550129))))

(declare-datatypes ((List!20293 0))(
  ( (Nil!20290) (Cons!20289 (h!21457 (_ BitVec 64)) (t!28762 List!20293)) )
))
(declare-fun arrayNoDuplicates!0 (array!60796 (_ BitVec 32) List!20293) Bool)

(assert (=> b!975948 (= res!653046 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20290))))

(declare-fun b!975949 () Bool)

(declare-fun res!653047 () Bool)

(assert (=> b!975949 (=> (not res!653047) (not e!550129))))

(assert (=> b!975949 (= res!653047 (and (= (size!29736 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29737 _keys!1717) (size!29736 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35554 () Bool)

(declare-fun tp!67665 () Bool)

(assert (=> mapNonEmpty!35554 (= mapRes!35554 (and tp!67665 e!550132))))

(declare-fun mapRest!35554 () (Array (_ BitVec 32) ValueCell!10700))

(declare-fun mapKey!35554 () (_ BitVec 32))

(declare-fun mapValue!35554 () ValueCell!10700)

(assert (=> mapNonEmpty!35554 (= (arr!29256 _values!1425) (store mapRest!35554 mapKey!35554 mapValue!35554))))

(assert (= (and start!83640 res!653044) b!975949))

(assert (= (and b!975949 res!653047) b!975946))

(assert (= (and b!975946 res!653048) b!975948))

(assert (= (and b!975948 res!653046) b!975943))

(assert (= (and b!975943 res!653045) b!975945))

(assert (= (and b!975945 res!653043) b!975941))

(assert (= (and b!975941 res!653042) b!975944))

(assert (= (and b!975940 condMapEmpty!35554) mapIsEmpty!35554))

(assert (= (and b!975940 (not condMapEmpty!35554)) mapNonEmpty!35554))

(get-info :version)

(assert (= (and mapNonEmpty!35554 ((_ is ValueCellFull!10700) mapValue!35554)) b!975942))

(assert (= (and b!975940 ((_ is ValueCellFull!10700) mapDefault!35554)) b!975947))

(assert (= start!83640 b!975940))

(declare-fun m!903683 () Bool)

(assert (=> mapNonEmpty!35554 m!903683))

(declare-fun m!903685 () Bool)

(assert (=> b!975944 m!903685))

(declare-fun m!903687 () Bool)

(assert (=> b!975946 m!903687))

(declare-fun m!903689 () Bool)

(assert (=> b!975945 m!903689))

(assert (=> b!975945 m!903689))

(declare-fun m!903691 () Bool)

(assert (=> b!975945 m!903691))

(declare-fun m!903693 () Bool)

(assert (=> start!83640 m!903693))

(declare-fun m!903695 () Bool)

(assert (=> start!83640 m!903695))

(declare-fun m!903697 () Bool)

(assert (=> start!83640 m!903697))

(declare-fun m!903699 () Bool)

(assert (=> b!975948 m!903699))

(declare-fun m!903701 () Bool)

(assert (=> b!975941 m!903701))

(assert (=> b!975941 m!903689))

(assert (=> b!975941 m!903701))

(assert (=> b!975941 m!903689))

(declare-fun m!903703 () Bool)

(assert (=> b!975941 m!903703))

(check-sat (not b!975941) (not b_next!19459) b_and!31071 (not mapNonEmpty!35554) (not b!975946) (not b!975945) (not b!975944) (not b!975948) (not start!83640) tp_is_empty!22363)
(check-sat b_and!31071 (not b_next!19459))
