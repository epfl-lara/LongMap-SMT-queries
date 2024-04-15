; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!712 () Bool)

(assert start!712)

(declare-fun b_free!145 () Bool)

(declare-fun b_next!145 () Bool)

(assert (=> start!712 (= b_free!145 (not b_next!145))))

(declare-fun tp!658 () Bool)

(declare-fun b_and!287 () Bool)

(assert (=> start!712 (= tp!658 b_and!287)))

(declare-fun b!4852 () Bool)

(declare-fun res!5933 () Bool)

(declare-fun e!2594 () Bool)

(assert (=> b!4852 (=> (not res!5933) (not e!2594))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4852 (= res!5933 (validKeyInArray!0 k0!1278))))

(declare-fun res!5934 () Bool)

(assert (=> start!712 (=> (not res!5934) (not e!2594))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!712 (= res!5934 (validMask!0 mask!2250))))

(assert (=> start!712 e!2594))

(assert (=> start!712 tp!658))

(assert (=> start!712 true))

(declare-datatypes ((V!475 0))(
  ( (V!476 (val!117 Int)) )
))
(declare-datatypes ((ValueCell!95 0))(
  ( (ValueCellFull!95 (v!1206 V!475)) (EmptyCell!95) )
))
(declare-datatypes ((array!373 0))(
  ( (array!374 (arr!177 (Array (_ BitVec 32) ValueCell!95)) (size!239 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!373)

(declare-fun e!2591 () Bool)

(declare-fun array_inv!125 (array!373) Bool)

(assert (=> start!712 (and (array_inv!125 _values!1492) e!2591)))

(declare-fun tp_is_empty!223 () Bool)

(assert (=> start!712 tp_is_empty!223))

(declare-datatypes ((array!375 0))(
  ( (array!376 (arr!178 (Array (_ BitVec 32) (_ BitVec 64))) (size!240 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!375)

(declare-fun array_inv!126 (array!375) Bool)

(assert (=> start!712 (array_inv!126 _keys!1806)))

(declare-fun mapNonEmpty!299 () Bool)

(declare-fun mapRes!299 () Bool)

(declare-fun tp!659 () Bool)

(declare-fun e!2588 () Bool)

(assert (=> mapNonEmpty!299 (= mapRes!299 (and tp!659 e!2588))))

(declare-fun mapRest!299 () (Array (_ BitVec 32) ValueCell!95))

(declare-fun mapValue!299 () ValueCell!95)

(declare-fun mapKey!299 () (_ BitVec 32))

(assert (=> mapNonEmpty!299 (= (arr!177 _values!1492) (store mapRest!299 mapKey!299 mapValue!299))))

(declare-fun mapIsEmpty!299 () Bool)

(assert (=> mapIsEmpty!299 mapRes!299))

(declare-fun b!4853 () Bool)

(declare-fun e!2589 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4853 (= e!2589 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4854 () Bool)

(assert (=> b!4854 (= e!2588 tp_is_empty!223)))

(declare-fun b!4855 () Bool)

(declare-fun res!5931 () Bool)

(assert (=> b!4855 (=> (not res!5931) (not e!2594))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!475)

(declare-fun zeroValue!1434 () V!475)

(declare-datatypes ((tuple2!106 0))(
  ( (tuple2!107 (_1!53 (_ BitVec 64)) (_2!53 V!475)) )
))
(declare-datatypes ((List!114 0))(
  ( (Nil!111) (Cons!110 (h!676 tuple2!106) (t!2245 List!114)) )
))
(declare-datatypes ((ListLongMap!111 0))(
  ( (ListLongMap!112 (toList!71 List!114)) )
))
(declare-fun contains!43 (ListLongMap!111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!30 (array!375 array!373 (_ BitVec 32) (_ BitVec 32) V!475 V!475 (_ BitVec 32) Int) ListLongMap!111)

(assert (=> b!4855 (= res!5931 (contains!43 (getCurrentListMap!30 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4856 () Bool)

(declare-fun e!2592 () Bool)

(assert (=> b!4856 (= e!2592 (= (size!240 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun b!4857 () Bool)

(declare-fun arrayContainsKey!0 (array!375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4857 (= e!2589 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4858 () Bool)

(declare-fun e!2590 () Bool)

(assert (=> b!4858 (= e!2590 tp_is_empty!223)))

(declare-fun b!4859 () Bool)

(declare-fun res!5929 () Bool)

(assert (=> b!4859 (=> (not res!5929) (not e!2594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!375 (_ BitVec 32)) Bool)

(assert (=> b!4859 (= res!5929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4860 () Bool)

(declare-fun res!5935 () Bool)

(assert (=> b!4860 (=> (not res!5935) (not e!2594))))

(assert (=> b!4860 (= res!5935 (and (= (size!239 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!240 _keys!1806) (size!239 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4861 () Bool)

(assert (=> b!4861 (= e!2594 (not e!2592))))

(declare-fun res!5930 () Bool)

(assert (=> b!4861 (=> res!5930 e!2592)))

(assert (=> b!4861 (= res!5930 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!4861 e!2589))

(declare-fun c!290 () Bool)

(assert (=> b!4861 (= c!290 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!51 0))(
  ( (Unit!52) )
))
(declare-fun lt!798 () Unit!51)

(declare-fun lemmaKeyInListMapIsInArray!13 (array!375 array!373 (_ BitVec 32) (_ BitVec 32) V!475 V!475 (_ BitVec 64) Int) Unit!51)

(assert (=> b!4861 (= lt!798 (lemmaKeyInListMapIsInArray!13 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4862 () Bool)

(assert (=> b!4862 (= e!2591 (and e!2590 mapRes!299))))

(declare-fun condMapEmpty!299 () Bool)

(declare-fun mapDefault!299 () ValueCell!95)

(assert (=> b!4862 (= condMapEmpty!299 (= (arr!177 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!95)) mapDefault!299)))))

(declare-fun b!4863 () Bool)

(declare-fun res!5932 () Bool)

(assert (=> b!4863 (=> (not res!5932) (not e!2594))))

(declare-datatypes ((List!115 0))(
  ( (Nil!112) (Cons!111 (h!677 (_ BitVec 64)) (t!2246 List!115)) )
))
(declare-fun arrayNoDuplicates!0 (array!375 (_ BitVec 32) List!115) Bool)

(assert (=> b!4863 (= res!5932 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!112))))

(assert (= (and start!712 res!5934) b!4860))

(assert (= (and b!4860 res!5935) b!4859))

(assert (= (and b!4859 res!5929) b!4863))

(assert (= (and b!4863 res!5932) b!4855))

(assert (= (and b!4855 res!5931) b!4852))

(assert (= (and b!4852 res!5933) b!4861))

(assert (= (and b!4861 c!290) b!4857))

(assert (= (and b!4861 (not c!290)) b!4853))

(assert (= (and b!4861 (not res!5930)) b!4856))

(assert (= (and b!4862 condMapEmpty!299) mapIsEmpty!299))

(assert (= (and b!4862 (not condMapEmpty!299)) mapNonEmpty!299))

(get-info :version)

(assert (= (and mapNonEmpty!299 ((_ is ValueCellFull!95) mapValue!299)) b!4854))

(assert (= (and b!4862 ((_ is ValueCellFull!95) mapDefault!299)) b!4858))

(assert (= start!712 b!4862))

(declare-fun m!2639 () Bool)

(assert (=> start!712 m!2639))

(declare-fun m!2641 () Bool)

(assert (=> start!712 m!2641))

(declare-fun m!2643 () Bool)

(assert (=> start!712 m!2643))

(declare-fun m!2645 () Bool)

(assert (=> b!4859 m!2645))

(declare-fun m!2647 () Bool)

(assert (=> b!4855 m!2647))

(assert (=> b!4855 m!2647))

(declare-fun m!2649 () Bool)

(assert (=> b!4855 m!2649))

(declare-fun m!2651 () Bool)

(assert (=> mapNonEmpty!299 m!2651))

(declare-fun m!2653 () Bool)

(assert (=> b!4861 m!2653))

(declare-fun m!2655 () Bool)

(assert (=> b!4861 m!2655))

(declare-fun m!2657 () Bool)

(assert (=> b!4852 m!2657))

(declare-fun m!2659 () Bool)

(assert (=> b!4863 m!2659))

(assert (=> b!4857 m!2653))

(check-sat (not b!4859) (not b!4857) tp_is_empty!223 (not mapNonEmpty!299) (not b!4855) (not start!712) (not b_next!145) (not b!4852) (not b!4861) b_and!287 (not b!4863))
(check-sat b_and!287 (not b_next!145))
