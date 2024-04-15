; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!718 () Bool)

(assert start!718)

(declare-fun b_free!151 () Bool)

(declare-fun b_next!151 () Bool)

(assert (=> start!718 (= b_free!151 (not b_next!151))))

(declare-fun tp!676 () Bool)

(declare-fun b_and!293 () Bool)

(assert (=> start!718 (= tp!676 b_and!293)))

(declare-fun b!4958 () Bool)

(declare-fun e!2651 () Bool)

(declare-fun tp_is_empty!229 () Bool)

(assert (=> b!4958 (= e!2651 tp_is_empty!229)))

(declare-fun b!4959 () Bool)

(declare-fun e!2649 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4959 (= e!2649 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4960 () Bool)

(declare-fun res!5992 () Bool)

(declare-fun e!2653 () Bool)

(assert (=> b!4960 (=> (not res!5992) (not e!2653))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!483 0))(
  ( (V!484 (val!120 Int)) )
))
(declare-datatypes ((ValueCell!98 0))(
  ( (ValueCellFull!98 (v!1209 V!483)) (EmptyCell!98) )
))
(declare-datatypes ((array!385 0))(
  ( (array!386 (arr!183 (Array (_ BitVec 32) ValueCell!98)) (size!245 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!385)

(declare-fun minValue!1434 () V!483)

(declare-datatypes ((array!387 0))(
  ( (array!388 (arr!184 (Array (_ BitVec 32) (_ BitVec 64))) (size!246 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!387)

(declare-fun zeroValue!1434 () V!483)

(declare-datatypes ((tuple2!110 0))(
  ( (tuple2!111 (_1!55 (_ BitVec 64)) (_2!55 V!483)) )
))
(declare-datatypes ((List!119 0))(
  ( (Nil!116) (Cons!115 (h!681 tuple2!110) (t!2250 List!119)) )
))
(declare-datatypes ((ListLongMap!115 0))(
  ( (ListLongMap!116 (toList!73 List!119)) )
))
(declare-fun contains!45 (ListLongMap!115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!32 (array!387 array!385 (_ BitVec 32) (_ BitVec 32) V!483 V!483 (_ BitVec 32) Int) ListLongMap!115)

(assert (=> b!4960 (= res!5992 (contains!45 (getCurrentListMap!32 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4961 () Bool)

(declare-fun res!5990 () Bool)

(assert (=> b!4961 (=> (not res!5990) (not e!2653))))

(assert (=> b!4961 (= res!5990 (and (= (size!245 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!246 _keys!1806) (size!245 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4962 () Bool)

(assert (=> b!4962 (= e!2653 (not true))))

(assert (=> b!4962 e!2649))

(declare-fun c!299 () Bool)

(assert (=> b!4962 (= c!299 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!57 0))(
  ( (Unit!58) )
))
(declare-fun lt!807 () Unit!57)

(declare-fun lemmaKeyInListMapIsInArray!16 (array!387 array!385 (_ BitVec 32) (_ BitVec 32) V!483 V!483 (_ BitVec 64) Int) Unit!57)

(assert (=> b!4962 (= lt!807 (lemmaKeyInListMapIsInArray!16 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4963 () Bool)

(declare-fun res!5995 () Bool)

(assert (=> b!4963 (=> (not res!5995) (not e!2653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4963 (= res!5995 (validKeyInArray!0 k0!1278))))

(declare-fun res!5994 () Bool)

(assert (=> start!718 (=> (not res!5994) (not e!2653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!718 (= res!5994 (validMask!0 mask!2250))))

(assert (=> start!718 e!2653))

(assert (=> start!718 tp!676))

(assert (=> start!718 true))

(declare-fun e!2652 () Bool)

(declare-fun array_inv!129 (array!385) Bool)

(assert (=> start!718 (and (array_inv!129 _values!1492) e!2652)))

(assert (=> start!718 tp_is_empty!229))

(declare-fun array_inv!130 (array!387) Bool)

(assert (=> start!718 (array_inv!130 _keys!1806)))

(declare-fun b!4964 () Bool)

(declare-fun res!5991 () Bool)

(assert (=> b!4964 (=> (not res!5991) (not e!2653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!387 (_ BitVec 32)) Bool)

(assert (=> b!4964 (= res!5991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!308 () Bool)

(declare-fun mapRes!308 () Bool)

(assert (=> mapIsEmpty!308 mapRes!308))

(declare-fun b!4965 () Bool)

(declare-fun e!2654 () Bool)

(assert (=> b!4965 (= e!2654 tp_is_empty!229)))

(declare-fun mapNonEmpty!308 () Bool)

(declare-fun tp!677 () Bool)

(assert (=> mapNonEmpty!308 (= mapRes!308 (and tp!677 e!2651))))

(declare-fun mapKey!308 () (_ BitVec 32))

(declare-fun mapRest!308 () (Array (_ BitVec 32) ValueCell!98))

(declare-fun mapValue!308 () ValueCell!98)

(assert (=> mapNonEmpty!308 (= (arr!183 _values!1492) (store mapRest!308 mapKey!308 mapValue!308))))

(declare-fun b!4966 () Bool)

(declare-fun res!5993 () Bool)

(assert (=> b!4966 (=> (not res!5993) (not e!2653))))

(declare-datatypes ((List!120 0))(
  ( (Nil!117) (Cons!116 (h!682 (_ BitVec 64)) (t!2251 List!120)) )
))
(declare-fun arrayNoDuplicates!0 (array!387 (_ BitVec 32) List!120) Bool)

(assert (=> b!4966 (= res!5993 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!117))))

(declare-fun b!4967 () Bool)

(declare-fun arrayContainsKey!0 (array!387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4967 (= e!2649 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4968 () Bool)

(assert (=> b!4968 (= e!2652 (and e!2654 mapRes!308))))

(declare-fun condMapEmpty!308 () Bool)

(declare-fun mapDefault!308 () ValueCell!98)

(assert (=> b!4968 (= condMapEmpty!308 (= (arr!183 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!98)) mapDefault!308)))))

(assert (= (and start!718 res!5994) b!4961))

(assert (= (and b!4961 res!5990) b!4964))

(assert (= (and b!4964 res!5991) b!4966))

(assert (= (and b!4966 res!5993) b!4960))

(assert (= (and b!4960 res!5992) b!4963))

(assert (= (and b!4963 res!5995) b!4962))

(assert (= (and b!4962 c!299) b!4967))

(assert (= (and b!4962 (not c!299)) b!4959))

(assert (= (and b!4968 condMapEmpty!308) mapIsEmpty!308))

(assert (= (and b!4968 (not condMapEmpty!308)) mapNonEmpty!308))

(get-info :version)

(assert (= (and mapNonEmpty!308 ((_ is ValueCellFull!98) mapValue!308)) b!4958))

(assert (= (and b!4968 ((_ is ValueCellFull!98) mapDefault!308)) b!4965))

(assert (= start!718 b!4968))

(declare-fun m!2705 () Bool)

(assert (=> mapNonEmpty!308 m!2705))

(declare-fun m!2707 () Bool)

(assert (=> b!4966 m!2707))

(declare-fun m!2709 () Bool)

(assert (=> b!4967 m!2709))

(declare-fun m!2711 () Bool)

(assert (=> b!4963 m!2711))

(declare-fun m!2713 () Bool)

(assert (=> b!4960 m!2713))

(assert (=> b!4960 m!2713))

(declare-fun m!2715 () Bool)

(assert (=> b!4960 m!2715))

(declare-fun m!2717 () Bool)

(assert (=> start!718 m!2717))

(declare-fun m!2719 () Bool)

(assert (=> start!718 m!2719))

(declare-fun m!2721 () Bool)

(assert (=> start!718 m!2721))

(declare-fun m!2723 () Bool)

(assert (=> b!4962 m!2723))

(declare-fun m!2725 () Bool)

(assert (=> b!4964 m!2725))

(check-sat (not b!4964) b_and!293 (not mapNonEmpty!308) (not b!4966) (not b!4960) (not b!4967) (not b!4962) (not b!4963) tp_is_empty!229 (not start!718) (not b_next!151))
(check-sat b_and!293 (not b_next!151))
