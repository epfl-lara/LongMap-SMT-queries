; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35884 () Bool)

(assert start!35884)

(declare-fun b_free!7927 () Bool)

(declare-fun b_next!7927 () Bool)

(assert (=> start!35884 (= b_free!7927 (not b_next!7927))))

(declare-fun tp!28082 () Bool)

(declare-fun b_and!15183 () Bool)

(assert (=> start!35884 (= tp!28082 b_and!15183)))

(declare-fun b!360868 () Bool)

(declare-fun res!200796 () Bool)

(declare-fun e!220891 () Bool)

(assert (=> b!360868 (=> (not res!200796) (not e!220891))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360868 (= res!200796 (validKeyInArray!0 k0!1077))))

(declare-fun b!360869 () Bool)

(declare-fun e!220896 () Bool)

(assert (=> b!360869 (= e!220891 (not e!220896))))

(declare-fun res!200801 () Bool)

(assert (=> b!360869 (=> res!200801 e!220896)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20202 0))(
  ( (array!20203 (arr!9593 (Array (_ BitVec 32) (_ BitVec 64))) (size!9945 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20202)

(assert (=> b!360869 (= res!200801 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9945 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!20202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360869 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11091 0))(
  ( (Unit!11092) )
))
(declare-fun lt!166522 () Unit!11091)

(declare-datatypes ((V!12091 0))(
  ( (V!12092 (val!4212 Int)) )
))
(declare-fun minValue!1150 () V!12091)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3824 0))(
  ( (ValueCellFull!3824 (v!6407 V!12091)) (EmptyCell!3824) )
))
(declare-datatypes ((array!20204 0))(
  ( (array!20205 (arr!9594 (Array (_ BitVec 32) ValueCell!3824)) (size!9946 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20204)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12091)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!67 (array!20202 array!20204 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 64) (_ BitVec 32)) Unit!11091)

(assert (=> b!360869 (= lt!166522 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!67 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360870 () Bool)

(declare-fun res!200795 () Bool)

(assert (=> b!360870 (=> (not res!200795) (not e!220891))))

(assert (=> b!360870 (= res!200795 (and (= (size!9946 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9945 _keys!1456) (size!9946 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360871 () Bool)

(declare-fun res!200794 () Bool)

(assert (=> b!360871 (=> (not res!200794) (not e!220891))))

(assert (=> b!360871 (= res!200794 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360872 () Bool)

(declare-fun res!200802 () Bool)

(assert (=> b!360872 (=> (not res!200802) (not e!220891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20202 (_ BitVec 32)) Bool)

(assert (=> b!360872 (= res!200802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360873 () Bool)

(declare-fun e!220894 () Bool)

(declare-fun e!220892 () Bool)

(declare-fun mapRes!14013 () Bool)

(assert (=> b!360873 (= e!220894 (and e!220892 mapRes!14013))))

(declare-fun condMapEmpty!14013 () Bool)

(declare-fun mapDefault!14013 () ValueCell!3824)

(assert (=> b!360873 (= condMapEmpty!14013 (= (arr!9594 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3824)) mapDefault!14013)))))

(declare-fun b!360874 () Bool)

(assert (=> b!360874 (= e!220896 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5656 0))(
  ( (tuple2!5657 (_1!2839 (_ BitVec 64)) (_2!2839 V!12091)) )
))
(declare-datatypes ((List!5409 0))(
  ( (Nil!5406) (Cons!5405 (h!6261 tuple2!5656) (t!10551 List!5409)) )
))
(declare-datatypes ((ListLongMap!4571 0))(
  ( (ListLongMap!4572 (toList!2301 List!5409)) )
))
(declare-fun contains!2401 (ListLongMap!4571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1829 (array!20202 array!20204 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 32) Int) ListLongMap!4571)

(assert (=> b!360874 (contains!2401 (getCurrentListMap!1829 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166523 () Unit!11091)

(declare-fun lemmaArrayContainsKeyThenInListMap!366 (array!20202 array!20204 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 64) (_ BitVec 32) Int) Unit!11091)

(assert (=> b!360874 (= lt!166523 (lemmaArrayContainsKeyThenInListMap!366 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun mapIsEmpty!14013 () Bool)

(assert (=> mapIsEmpty!14013 mapRes!14013))

(declare-fun b!360876 () Bool)

(declare-fun res!200798 () Bool)

(assert (=> b!360876 (=> (not res!200798) (not e!220891))))

(assert (=> b!360876 (= res!200798 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9945 _keys!1456))))))

(declare-fun b!360877 () Bool)

(declare-fun tp_is_empty!8335 () Bool)

(assert (=> b!360877 (= e!220892 tp_is_empty!8335)))

(declare-fun b!360878 () Bool)

(declare-fun e!220893 () Bool)

(assert (=> b!360878 (= e!220893 tp_is_empty!8335)))

(declare-fun mapNonEmpty!14013 () Bool)

(declare-fun tp!28083 () Bool)

(assert (=> mapNonEmpty!14013 (= mapRes!14013 (and tp!28083 e!220893))))

(declare-fun mapRest!14013 () (Array (_ BitVec 32) ValueCell!3824))

(declare-fun mapKey!14013 () (_ BitVec 32))

(declare-fun mapValue!14013 () ValueCell!3824)

(assert (=> mapNonEmpty!14013 (= (arr!9594 _values!1208) (store mapRest!14013 mapKey!14013 mapValue!14013))))

(declare-fun b!360879 () Bool)

(declare-fun res!200800 () Bool)

(assert (=> b!360879 (=> (not res!200800) (not e!220891))))

(assert (=> b!360879 (= res!200800 (not (= (select (arr!9593 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!200799 () Bool)

(assert (=> start!35884 (=> (not res!200799) (not e!220891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35884 (= res!200799 (validMask!0 mask!1842))))

(assert (=> start!35884 e!220891))

(assert (=> start!35884 tp_is_empty!8335))

(assert (=> start!35884 true))

(assert (=> start!35884 tp!28082))

(declare-fun array_inv!7090 (array!20202) Bool)

(assert (=> start!35884 (array_inv!7090 _keys!1456)))

(declare-fun array_inv!7091 (array!20204) Bool)

(assert (=> start!35884 (and (array_inv!7091 _values!1208) e!220894)))

(declare-fun b!360875 () Bool)

(declare-fun res!200797 () Bool)

(assert (=> b!360875 (=> (not res!200797) (not e!220891))))

(declare-datatypes ((List!5410 0))(
  ( (Nil!5407) (Cons!5406 (h!6262 (_ BitVec 64)) (t!10552 List!5410)) )
))
(declare-fun arrayNoDuplicates!0 (array!20202 (_ BitVec 32) List!5410) Bool)

(assert (=> b!360875 (= res!200797 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5407))))

(assert (= (and start!35884 res!200799) b!360870))

(assert (= (and b!360870 res!200795) b!360872))

(assert (= (and b!360872 res!200802) b!360875))

(assert (= (and b!360875 res!200797) b!360868))

(assert (= (and b!360868 res!200796) b!360876))

(assert (= (and b!360876 res!200798) b!360871))

(assert (= (and b!360871 res!200794) b!360879))

(assert (= (and b!360879 res!200800) b!360869))

(assert (= (and b!360869 (not res!200801)) b!360874))

(assert (= (and b!360873 condMapEmpty!14013) mapIsEmpty!14013))

(assert (= (and b!360873 (not condMapEmpty!14013)) mapNonEmpty!14013))

(get-info :version)

(assert (= (and mapNonEmpty!14013 ((_ is ValueCellFull!3824) mapValue!14013)) b!360878))

(assert (= (and b!360873 ((_ is ValueCellFull!3824) mapDefault!14013)) b!360877))

(assert (= start!35884 b!360873))

(declare-fun m!358145 () Bool)

(assert (=> b!360875 m!358145))

(declare-fun m!358147 () Bool)

(assert (=> b!360871 m!358147))

(declare-fun m!358149 () Bool)

(assert (=> b!360879 m!358149))

(declare-fun m!358151 () Bool)

(assert (=> b!360869 m!358151))

(declare-fun m!358153 () Bool)

(assert (=> b!360869 m!358153))

(declare-fun m!358155 () Bool)

(assert (=> b!360874 m!358155))

(assert (=> b!360874 m!358155))

(declare-fun m!358157 () Bool)

(assert (=> b!360874 m!358157))

(declare-fun m!358159 () Bool)

(assert (=> b!360874 m!358159))

(declare-fun m!358161 () Bool)

(assert (=> b!360872 m!358161))

(declare-fun m!358163 () Bool)

(assert (=> b!360868 m!358163))

(declare-fun m!358165 () Bool)

(assert (=> mapNonEmpty!14013 m!358165))

(declare-fun m!358167 () Bool)

(assert (=> start!35884 m!358167))

(declare-fun m!358169 () Bool)

(assert (=> start!35884 m!358169))

(declare-fun m!358171 () Bool)

(assert (=> start!35884 m!358171))

(check-sat (not mapNonEmpty!14013) (not b!360871) tp_is_empty!8335 (not b_next!7927) (not b!360872) b_and!15183 (not b!360869) (not b!360874) (not start!35884) (not b!360875) (not b!360868))
(check-sat b_and!15183 (not b_next!7927))
