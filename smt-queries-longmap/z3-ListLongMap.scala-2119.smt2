; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35884 () Bool)

(assert start!35884)

(declare-fun b_free!7927 () Bool)

(declare-fun b_next!7927 () Bool)

(assert (=> start!35884 (= b_free!7927 (not b_next!7927))))

(declare-fun tp!28082 () Bool)

(declare-fun b_and!15143 () Bool)

(assert (=> start!35884 (= tp!28082 b_and!15143)))

(declare-fun b!360646 () Bool)

(declare-fun res!200670 () Bool)

(declare-fun e!220750 () Bool)

(assert (=> b!360646 (=> (not res!200670) (not e!220750))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20197 0))(
  ( (array!20198 (arr!9591 (Array (_ BitVec 32) (_ BitVec 64))) (size!9944 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20197)

(assert (=> b!360646 (= res!200670 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9944 _keys!1456))))))

(declare-fun b!360647 () Bool)

(declare-fun e!220752 () Bool)

(assert (=> b!360647 (= e!220752 true)))

(declare-datatypes ((V!12091 0))(
  ( (V!12092 (val!4212 Int)) )
))
(declare-fun minValue!1150 () V!12091)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3824 0))(
  ( (ValueCellFull!3824 (v!6400 V!12091)) (EmptyCell!3824) )
))
(declare-datatypes ((array!20199 0))(
  ( (array!20200 (arr!9592 (Array (_ BitVec 32) ValueCell!3824)) (size!9945 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20199)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12091)

(declare-datatypes ((tuple2!5708 0))(
  ( (tuple2!5709 (_1!2865 (_ BitVec 64)) (_2!2865 V!12091)) )
))
(declare-datatypes ((List!5464 0))(
  ( (Nil!5461) (Cons!5460 (h!6316 tuple2!5708) (t!10605 List!5464)) )
))
(declare-datatypes ((ListLongMap!4611 0))(
  ( (ListLongMap!4612 (toList!2321 List!5464)) )
))
(declare-fun contains!2412 (ListLongMap!4611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1826 (array!20197 array!20199 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 32) Int) ListLongMap!4611)

(assert (=> b!360647 (contains!2412 (getCurrentListMap!1826 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11084 0))(
  ( (Unit!11085) )
))
(declare-fun lt!166269 () Unit!11084)

(declare-fun lemmaArrayContainsKeyThenInListMap!358 (array!20197 array!20199 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 64) (_ BitVec 32) Int) Unit!11084)

(assert (=> b!360647 (= lt!166269 (lemmaArrayContainsKeyThenInListMap!358 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun mapIsEmpty!14013 () Bool)

(declare-fun mapRes!14013 () Bool)

(assert (=> mapIsEmpty!14013 mapRes!14013))

(declare-fun b!360648 () Bool)

(declare-fun e!220753 () Bool)

(declare-fun e!220749 () Bool)

(assert (=> b!360648 (= e!220753 (and e!220749 mapRes!14013))))

(declare-fun condMapEmpty!14013 () Bool)

(declare-fun mapDefault!14013 () ValueCell!3824)

(assert (=> b!360648 (= condMapEmpty!14013 (= (arr!9592 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3824)) mapDefault!14013)))))

(declare-fun b!360649 () Bool)

(declare-fun res!200676 () Bool)

(assert (=> b!360649 (=> (not res!200676) (not e!220750))))

(declare-datatypes ((List!5465 0))(
  ( (Nil!5462) (Cons!5461 (h!6317 (_ BitVec 64)) (t!10606 List!5465)) )
))
(declare-fun arrayNoDuplicates!0 (array!20197 (_ BitVec 32) List!5465) Bool)

(assert (=> b!360649 (= res!200676 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5462))))

(declare-fun b!360650 () Bool)

(declare-fun res!200674 () Bool)

(assert (=> b!360650 (=> (not res!200674) (not e!220750))))

(declare-fun arrayContainsKey!0 (array!20197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360650 (= res!200674 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!200671 () Bool)

(assert (=> start!35884 (=> (not res!200671) (not e!220750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35884 (= res!200671 (validMask!0 mask!1842))))

(assert (=> start!35884 e!220750))

(declare-fun tp_is_empty!8335 () Bool)

(assert (=> start!35884 tp_is_empty!8335))

(assert (=> start!35884 true))

(assert (=> start!35884 tp!28082))

(declare-fun array_inv!7066 (array!20197) Bool)

(assert (=> start!35884 (array_inv!7066 _keys!1456)))

(declare-fun array_inv!7067 (array!20199) Bool)

(assert (=> start!35884 (and (array_inv!7067 _values!1208) e!220753)))

(declare-fun b!360651 () Bool)

(declare-fun e!220754 () Bool)

(assert (=> b!360651 (= e!220754 tp_is_empty!8335)))

(declare-fun b!360652 () Bool)

(assert (=> b!360652 (= e!220749 tp_is_empty!8335)))

(declare-fun b!360653 () Bool)

(declare-fun res!200672 () Bool)

(assert (=> b!360653 (=> (not res!200672) (not e!220750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20197 (_ BitVec 32)) Bool)

(assert (=> b!360653 (= res!200672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360654 () Bool)

(declare-fun res!200668 () Bool)

(assert (=> b!360654 (=> (not res!200668) (not e!220750))))

(assert (=> b!360654 (= res!200668 (not (= (select (arr!9591 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!14013 () Bool)

(declare-fun tp!28083 () Bool)

(assert (=> mapNonEmpty!14013 (= mapRes!14013 (and tp!28083 e!220754))))

(declare-fun mapRest!14013 () (Array (_ BitVec 32) ValueCell!3824))

(declare-fun mapValue!14013 () ValueCell!3824)

(declare-fun mapKey!14013 () (_ BitVec 32))

(assert (=> mapNonEmpty!14013 (= (arr!9592 _values!1208) (store mapRest!14013 mapKey!14013 mapValue!14013))))

(declare-fun b!360655 () Bool)

(declare-fun res!200675 () Bool)

(assert (=> b!360655 (=> (not res!200675) (not e!220750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360655 (= res!200675 (validKeyInArray!0 k0!1077))))

(declare-fun b!360656 () Bool)

(declare-fun res!200673 () Bool)

(assert (=> b!360656 (=> (not res!200673) (not e!220750))))

(assert (=> b!360656 (= res!200673 (and (= (size!9945 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9944 _keys!1456) (size!9945 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360657 () Bool)

(assert (=> b!360657 (= e!220750 (not e!220752))))

(declare-fun res!200669 () Bool)

(assert (=> b!360657 (=> res!200669 e!220752)))

(assert (=> b!360657 (= res!200669 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9944 _keys!1456))))))

(assert (=> b!360657 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166270 () Unit!11084)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!65 (array!20197 array!20199 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 64) (_ BitVec 32)) Unit!11084)

(assert (=> b!360657 (= lt!166270 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!65 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (= (and start!35884 res!200671) b!360656))

(assert (= (and b!360656 res!200673) b!360653))

(assert (= (and b!360653 res!200672) b!360649))

(assert (= (and b!360649 res!200676) b!360655))

(assert (= (and b!360655 res!200675) b!360646))

(assert (= (and b!360646 res!200670) b!360650))

(assert (= (and b!360650 res!200674) b!360654))

(assert (= (and b!360654 res!200668) b!360657))

(assert (= (and b!360657 (not res!200669)) b!360647))

(assert (= (and b!360648 condMapEmpty!14013) mapIsEmpty!14013))

(assert (= (and b!360648 (not condMapEmpty!14013)) mapNonEmpty!14013))

(get-info :version)

(assert (= (and mapNonEmpty!14013 ((_ is ValueCellFull!3824) mapValue!14013)) b!360651))

(assert (= (and b!360648 ((_ is ValueCellFull!3824) mapDefault!14013)) b!360652))

(assert (= start!35884 b!360648))

(declare-fun m!357191 () Bool)

(assert (=> b!360647 m!357191))

(assert (=> b!360647 m!357191))

(declare-fun m!357193 () Bool)

(assert (=> b!360647 m!357193))

(declare-fun m!357195 () Bool)

(assert (=> b!360647 m!357195))

(declare-fun m!357197 () Bool)

(assert (=> b!360650 m!357197))

(declare-fun m!357199 () Bool)

(assert (=> b!360649 m!357199))

(declare-fun m!357201 () Bool)

(assert (=> start!35884 m!357201))

(declare-fun m!357203 () Bool)

(assert (=> start!35884 m!357203))

(declare-fun m!357205 () Bool)

(assert (=> start!35884 m!357205))

(declare-fun m!357207 () Bool)

(assert (=> b!360654 m!357207))

(declare-fun m!357209 () Bool)

(assert (=> b!360655 m!357209))

(declare-fun m!357211 () Bool)

(assert (=> b!360657 m!357211))

(declare-fun m!357213 () Bool)

(assert (=> b!360657 m!357213))

(declare-fun m!357215 () Bool)

(assert (=> mapNonEmpty!14013 m!357215))

(declare-fun m!357217 () Bool)

(assert (=> b!360653 m!357217))

(check-sat b_and!15143 (not start!35884) (not b!360650) (not mapNonEmpty!14013) (not b!360657) (not b!360649) (not b_next!7927) (not b!360653) (not b!360647) (not b!360655) tp_is_empty!8335)
(check-sat b_and!15143 (not b_next!7927))
