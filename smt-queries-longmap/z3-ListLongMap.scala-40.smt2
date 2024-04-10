; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!714 () Bool)

(assert start!714)

(declare-fun b_free!147 () Bool)

(declare-fun b_next!147 () Bool)

(assert (=> start!714 (= b_free!147 (not b_next!147))))

(declare-fun tp!665 () Bool)

(declare-fun b_and!289 () Bool)

(assert (=> start!714 (= tp!665 b_and!289)))

(declare-fun b!4888 () Bool)

(declare-fun e!2609 () Bool)

(declare-datatypes ((array!383 0))(
  ( (array!384 (arr!182 (Array (_ BitVec 32) (_ BitVec 64))) (size!244 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!383)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4888 (= e!2609 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!302 () Bool)

(declare-fun mapRes!302 () Bool)

(assert (=> mapIsEmpty!302 mapRes!302))

(declare-fun b!4890 () Bool)

(declare-fun res!5950 () Bool)

(declare-fun e!2615 () Bool)

(assert (=> b!4890 (=> (not res!5950) (not e!2615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4890 (= res!5950 (validKeyInArray!0 k0!1278))))

(declare-fun b!4891 () Bool)

(declare-fun e!2610 () Bool)

(declare-fun tp_is_empty!225 () Bool)

(assert (=> b!4891 (= e!2610 tp_is_empty!225)))

(declare-fun b!4892 () Bool)

(declare-fun e!2612 () Bool)

(assert (=> b!4892 (= e!2615 (not e!2612))))

(declare-fun res!5954 () Bool)

(assert (=> b!4892 (=> res!5954 e!2612)))

(assert (=> b!4892 (= res!5954 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!4892 e!2609))

(declare-fun c!293 () Bool)

(assert (=> b!4892 (= c!293 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!477 0))(
  ( (V!478 (val!118 Int)) )
))
(declare-datatypes ((ValueCell!96 0))(
  ( (ValueCellFull!96 (v!1207 V!477)) (EmptyCell!96) )
))
(declare-datatypes ((array!385 0))(
  ( (array!386 (arr!183 (Array (_ BitVec 32) ValueCell!96)) (size!245 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!385)

(declare-fun minValue!1434 () V!477)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((Unit!55 0))(
  ( (Unit!56) )
))
(declare-fun lt!801 () Unit!55)

(declare-fun zeroValue!1434 () V!477)

(declare-fun lemmaKeyInListMapIsInArray!15 (array!383 array!385 (_ BitVec 32) (_ BitVec 32) V!477 V!477 (_ BitVec 64) Int) Unit!55)

(assert (=> b!4892 (= lt!801 (lemmaKeyInListMapIsInArray!15 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4893 () Bool)

(declare-fun e!2614 () Bool)

(declare-fun e!2611 () Bool)

(assert (=> b!4893 (= e!2614 (and e!2611 mapRes!302))))

(declare-fun condMapEmpty!302 () Bool)

(declare-fun mapDefault!302 () ValueCell!96)

(assert (=> b!4893 (= condMapEmpty!302 (= (arr!183 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!96)) mapDefault!302)))))

(declare-fun b!4894 () Bool)

(declare-fun res!5955 () Bool)

(assert (=> b!4894 (=> (not res!5955) (not e!2615))))

(assert (=> b!4894 (= res!5955 (and (= (size!245 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!244 _keys!1806) (size!245 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4895 () Bool)

(declare-fun res!5951 () Bool)

(assert (=> b!4895 (=> (not res!5951) (not e!2615))))

(declare-datatypes ((tuple2!110 0))(
  ( (tuple2!111 (_1!55 (_ BitVec 64)) (_2!55 V!477)) )
))
(declare-datatypes ((List!119 0))(
  ( (Nil!116) (Cons!115 (h!681 tuple2!110) (t!2250 List!119)) )
))
(declare-datatypes ((ListLongMap!115 0))(
  ( (ListLongMap!116 (toList!73 List!119)) )
))
(declare-fun contains!45 (ListLongMap!115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!32 (array!383 array!385 (_ BitVec 32) (_ BitVec 32) V!477 V!477 (_ BitVec 32) Int) ListLongMap!115)

(assert (=> b!4895 (= res!5951 (contains!45 (getCurrentListMap!32 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4896 () Bool)

(declare-fun res!5956 () Bool)

(assert (=> b!4896 (=> (not res!5956) (not e!2615))))

(declare-datatypes ((List!120 0))(
  ( (Nil!117) (Cons!116 (h!682 (_ BitVec 64)) (t!2251 List!120)) )
))
(declare-fun arrayNoDuplicates!0 (array!383 (_ BitVec 32) List!120) Bool)

(assert (=> b!4896 (= res!5956 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!117))))

(declare-fun res!5952 () Bool)

(assert (=> start!714 (=> (not res!5952) (not e!2615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!714 (= res!5952 (validMask!0 mask!2250))))

(assert (=> start!714 e!2615))

(assert (=> start!714 tp!665))

(assert (=> start!714 true))

(declare-fun array_inv!135 (array!385) Bool)

(assert (=> start!714 (and (array_inv!135 _values!1492) e!2614)))

(assert (=> start!714 tp_is_empty!225))

(declare-fun array_inv!136 (array!383) Bool)

(assert (=> start!714 (array_inv!136 _keys!1806)))

(declare-fun b!4889 () Bool)

(assert (=> b!4889 (= e!2609 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4897 () Bool)

(assert (=> b!4897 (= e!2611 tp_is_empty!225)))

(declare-fun mapNonEmpty!302 () Bool)

(declare-fun tp!664 () Bool)

(assert (=> mapNonEmpty!302 (= mapRes!302 (and tp!664 e!2610))))

(declare-fun mapValue!302 () ValueCell!96)

(declare-fun mapRest!302 () (Array (_ BitVec 32) ValueCell!96))

(declare-fun mapKey!302 () (_ BitVec 32))

(assert (=> mapNonEmpty!302 (= (arr!183 _values!1492) (store mapRest!302 mapKey!302 mapValue!302))))

(declare-fun b!4898 () Bool)

(assert (=> b!4898 (= e!2612 (= (size!244 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun b!4899 () Bool)

(declare-fun res!5953 () Bool)

(assert (=> b!4899 (=> (not res!5953) (not e!2615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!383 (_ BitVec 32)) Bool)

(assert (=> b!4899 (= res!5953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!714 res!5952) b!4894))

(assert (= (and b!4894 res!5955) b!4899))

(assert (= (and b!4899 res!5953) b!4896))

(assert (= (and b!4896 res!5956) b!4895))

(assert (= (and b!4895 res!5951) b!4890))

(assert (= (and b!4890 res!5950) b!4892))

(assert (= (and b!4892 c!293) b!4888))

(assert (= (and b!4892 (not c!293)) b!4889))

(assert (= (and b!4892 (not res!5954)) b!4898))

(assert (= (and b!4893 condMapEmpty!302) mapIsEmpty!302))

(assert (= (and b!4893 (not condMapEmpty!302)) mapNonEmpty!302))

(get-info :version)

(assert (= (and mapNonEmpty!302 ((_ is ValueCellFull!96) mapValue!302)) b!4891))

(assert (= (and b!4893 ((_ is ValueCellFull!96) mapDefault!302)) b!4897))

(assert (= start!714 b!4893))

(declare-fun m!2661 () Bool)

(assert (=> mapNonEmpty!302 m!2661))

(declare-fun m!2663 () Bool)

(assert (=> b!4896 m!2663))

(declare-fun m!2665 () Bool)

(assert (=> b!4892 m!2665))

(declare-fun m!2667 () Bool)

(assert (=> b!4892 m!2667))

(declare-fun m!2669 () Bool)

(assert (=> b!4895 m!2669))

(assert (=> b!4895 m!2669))

(declare-fun m!2671 () Bool)

(assert (=> b!4895 m!2671))

(declare-fun m!2673 () Bool)

(assert (=> b!4899 m!2673))

(assert (=> b!4888 m!2665))

(declare-fun m!2675 () Bool)

(assert (=> b!4890 m!2675))

(declare-fun m!2677 () Bool)

(assert (=> start!714 m!2677))

(declare-fun m!2679 () Bool)

(assert (=> start!714 m!2679))

(declare-fun m!2681 () Bool)

(assert (=> start!714 m!2681))

(check-sat (not b!4895) (not b!4888) (not start!714) (not mapNonEmpty!302) tp_is_empty!225 (not b_next!147) (not b!4899) b_and!289 (not b!4896) (not b!4890) (not b!4892))
(check-sat b_and!289 (not b_next!147))