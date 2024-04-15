; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83472 () Bool)

(assert start!83472)

(declare-fun b_free!19477 () Bool)

(declare-fun b_next!19477 () Bool)

(assert (=> start!83472 (= b_free!19477 (not b_next!19477))))

(declare-fun tp!67719 () Bool)

(declare-fun b_and!31053 () Bool)

(assert (=> start!83472 (= tp!67719 b_and!31053)))

(declare-fun b!975068 () Bool)

(declare-fun res!652781 () Bool)

(declare-fun e!549533 () Bool)

(assert (=> b!975068 (=> (not res!652781) (not e!549533))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34825 0))(
  ( (V!34826 (val!11241 Int)) )
))
(declare-datatypes ((ValueCell!10709 0))(
  ( (ValueCellFull!10709 (v!13799 V!34825)) (EmptyCell!10709) )
))
(declare-datatypes ((array!60722 0))(
  ( (array!60723 (arr!29225 (Array (_ BitVec 32) ValueCell!10709)) (size!29706 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60722)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60724 0))(
  ( (array!60725 (arr!29226 (Array (_ BitVec 32) (_ BitVec 64))) (size!29707 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60724)

(assert (=> b!975068 (= res!652781 (and (= (size!29706 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29707 _keys!1717) (size!29706 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975069 () Bool)

(declare-fun res!652782 () Bool)

(assert (=> b!975069 (=> (not res!652782) (not e!549533))))

(declare-datatypes ((List!20325 0))(
  ( (Nil!20322) (Cons!20321 (h!21483 (_ BitVec 64)) (t!28793 List!20325)) )
))
(declare-fun arrayNoDuplicates!0 (array!60724 (_ BitVec 32) List!20325) Bool)

(assert (=> b!975069 (= res!652782 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20322))))

(declare-fun b!975070 () Bool)

(declare-fun res!652780 () Bool)

(assert (=> b!975070 (=> (not res!652780) (not e!549533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60724 (_ BitVec 32)) Bool)

(assert (=> b!975070 (= res!652780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35581 () Bool)

(declare-fun mapRes!35581 () Bool)

(assert (=> mapIsEmpty!35581 mapRes!35581))

(declare-fun b!975071 () Bool)

(declare-fun e!549536 () Bool)

(declare-fun e!549535 () Bool)

(assert (=> b!975071 (= e!549536 (and e!549535 mapRes!35581))))

(declare-fun condMapEmpty!35581 () Bool)

(declare-fun mapDefault!35581 () ValueCell!10709)

(assert (=> b!975071 (= condMapEmpty!35581 (= (arr!29225 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10709)) mapDefault!35581)))))

(declare-fun b!975072 () Bool)

(assert (=> b!975072 (= e!549533 false)))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34825)

(declare-fun zeroValue!1367 () V!34825)

(declare-datatypes ((tuple2!14518 0))(
  ( (tuple2!14519 (_1!7270 (_ BitVec 64)) (_2!7270 V!34825)) )
))
(declare-datatypes ((List!20326 0))(
  ( (Nil!20323) (Cons!20322 (h!21484 tuple2!14518) (t!28794 List!20326)) )
))
(declare-datatypes ((ListLongMap!13205 0))(
  ( (ListLongMap!13206 (toList!6618 List!20326)) )
))
(declare-fun lt!432615 () ListLongMap!13205)

(declare-fun getCurrentListMap!3780 (array!60724 array!60722 (_ BitVec 32) (_ BitVec 32) V!34825 V!34825 (_ BitVec 32) Int) ListLongMap!13205)

(assert (=> b!975072 (= lt!432615 (getCurrentListMap!3780 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975073 () Bool)

(declare-fun res!652779 () Bool)

(assert (=> b!975073 (=> (not res!652779) (not e!549533))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5649 (ListLongMap!13205 (_ BitVec 64)) Bool)

(assert (=> b!975073 (= res!652779 (contains!5649 (getCurrentListMap!3780 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29226 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35581 () Bool)

(declare-fun tp!67720 () Bool)

(declare-fun e!549537 () Bool)

(assert (=> mapNonEmpty!35581 (= mapRes!35581 (and tp!67720 e!549537))))

(declare-fun mapRest!35581 () (Array (_ BitVec 32) ValueCell!10709))

(declare-fun mapValue!35581 () ValueCell!10709)

(declare-fun mapKey!35581 () (_ BitVec 32))

(assert (=> mapNonEmpty!35581 (= (arr!29225 _values!1425) (store mapRest!35581 mapKey!35581 mapValue!35581))))

(declare-fun b!975074 () Bool)

(declare-fun tp_is_empty!22381 () Bool)

(assert (=> b!975074 (= e!549535 tp_is_empty!22381)))

(declare-fun res!652778 () Bool)

(assert (=> start!83472 (=> (not res!652778) (not e!549533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83472 (= res!652778 (validMask!0 mask!2147))))

(assert (=> start!83472 e!549533))

(assert (=> start!83472 true))

(declare-fun array_inv!22649 (array!60722) Bool)

(assert (=> start!83472 (and (array_inv!22649 _values!1425) e!549536)))

(assert (=> start!83472 tp_is_empty!22381))

(assert (=> start!83472 tp!67719))

(declare-fun array_inv!22650 (array!60724) Bool)

(assert (=> start!83472 (array_inv!22650 _keys!1717)))

(declare-fun b!975075 () Bool)

(declare-fun res!652777 () Bool)

(assert (=> b!975075 (=> (not res!652777) (not e!549533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975075 (= res!652777 (validKeyInArray!0 (select (arr!29226 _keys!1717) i!822)))))

(declare-fun b!975076 () Bool)

(declare-fun res!652783 () Bool)

(assert (=> b!975076 (=> (not res!652783) (not e!549533))))

(assert (=> b!975076 (= res!652783 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29707 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29707 _keys!1717))))))

(declare-fun b!975077 () Bool)

(assert (=> b!975077 (= e!549537 tp_is_empty!22381)))

(assert (= (and start!83472 res!652778) b!975068))

(assert (= (and b!975068 res!652781) b!975070))

(assert (= (and b!975070 res!652780) b!975069))

(assert (= (and b!975069 res!652782) b!975076))

(assert (= (and b!975076 res!652783) b!975075))

(assert (= (and b!975075 res!652777) b!975073))

(assert (= (and b!975073 res!652779) b!975072))

(assert (= (and b!975071 condMapEmpty!35581) mapIsEmpty!35581))

(assert (= (and b!975071 (not condMapEmpty!35581)) mapNonEmpty!35581))

(get-info :version)

(assert (= (and mapNonEmpty!35581 ((_ is ValueCellFull!10709) mapValue!35581)) b!975077))

(assert (= (and b!975071 ((_ is ValueCellFull!10709) mapDefault!35581)) b!975074))

(assert (= start!83472 b!975071))

(declare-fun m!901829 () Bool)

(assert (=> b!975073 m!901829))

(declare-fun m!901831 () Bool)

(assert (=> b!975073 m!901831))

(assert (=> b!975073 m!901829))

(assert (=> b!975073 m!901831))

(declare-fun m!901833 () Bool)

(assert (=> b!975073 m!901833))

(declare-fun m!901835 () Bool)

(assert (=> b!975072 m!901835))

(declare-fun m!901837 () Bool)

(assert (=> b!975070 m!901837))

(declare-fun m!901839 () Bool)

(assert (=> b!975069 m!901839))

(declare-fun m!901841 () Bool)

(assert (=> mapNonEmpty!35581 m!901841))

(assert (=> b!975075 m!901831))

(assert (=> b!975075 m!901831))

(declare-fun m!901843 () Bool)

(assert (=> b!975075 m!901843))

(declare-fun m!901845 () Bool)

(assert (=> start!83472 m!901845))

(declare-fun m!901847 () Bool)

(assert (=> start!83472 m!901847))

(declare-fun m!901849 () Bool)

(assert (=> start!83472 m!901849))

(check-sat (not mapNonEmpty!35581) tp_is_empty!22381 (not b!975073) (not b!975075) (not b!975070) b_and!31053 (not b!975069) (not start!83472) (not b_next!19477) (not b!975072))
(check-sat b_and!31053 (not b_next!19477))
