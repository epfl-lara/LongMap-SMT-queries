; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35900 () Bool)

(assert start!35900)

(declare-fun b_free!7929 () Bool)

(declare-fun b_next!7929 () Bool)

(assert (=> start!35900 (= b_free!7929 (not b_next!7929))))

(declare-fun tp!28089 () Bool)

(declare-fun b_and!15171 () Bool)

(assert (=> start!35900 (= tp!28089 b_and!15171)))

(declare-fun b!360957 () Bool)

(declare-fun res!200828 () Bool)

(declare-fun e!220946 () Bool)

(assert (=> b!360957 (=> (not res!200828) (not e!220946))))

(declare-datatypes ((array!20225 0))(
  ( (array!20226 (arr!9605 (Array (_ BitVec 32) (_ BitVec 64))) (size!9957 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20225)

(declare-datatypes ((List!5498 0))(
  ( (Nil!5495) (Cons!5494 (h!6350 (_ BitVec 64)) (t!10648 List!5498)) )
))
(declare-fun arrayNoDuplicates!0 (array!20225 (_ BitVec 32) List!5498) Bool)

(assert (=> b!360957 (= res!200828 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5495))))

(declare-fun b!360958 () Bool)

(declare-fun e!220943 () Bool)

(declare-fun tp_is_empty!8337 () Bool)

(assert (=> b!360958 (= e!220943 tp_is_empty!8337)))

(declare-fun b!360959 () Bool)

(declare-fun res!200831 () Bool)

(assert (=> b!360959 (=> (not res!200831) (not e!220946))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!12093 0))(
  ( (V!12094 (val!4213 Int)) )
))
(declare-datatypes ((ValueCell!3825 0))(
  ( (ValueCellFull!3825 (v!6407 V!12093)) (EmptyCell!3825) )
))
(declare-datatypes ((array!20227 0))(
  ( (array!20228 (arr!9606 (Array (_ BitVec 32) ValueCell!3825)) (size!9958 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20227)

(assert (=> b!360959 (= res!200831 (and (= (size!9958 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9957 _keys!1456) (size!9958 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360960 () Bool)

(declare-fun res!200830 () Bool)

(assert (=> b!360960 (=> (not res!200830) (not e!220946))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360960 (= res!200830 (validKeyInArray!0 k0!1077))))

(declare-fun b!360961 () Bool)

(declare-fun res!200824 () Bool)

(assert (=> b!360961 (=> (not res!200824) (not e!220946))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360961 (= res!200824 (not (= (select (arr!9605 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360962 () Bool)

(declare-fun res!200832 () Bool)

(assert (=> b!360962 (=> (not res!200832) (not e!220946))))

(declare-fun arrayContainsKey!0 (array!20225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360962 (= res!200832 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360963 () Bool)

(declare-fun e!220944 () Bool)

(declare-fun e!220947 () Bool)

(declare-fun mapRes!14016 () Bool)

(assert (=> b!360963 (= e!220944 (and e!220947 mapRes!14016))))

(declare-fun condMapEmpty!14016 () Bool)

(declare-fun mapDefault!14016 () ValueCell!3825)

(assert (=> b!360963 (= condMapEmpty!14016 (= (arr!9606 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3825)) mapDefault!14016)))))

(declare-fun mapNonEmpty!14016 () Bool)

(declare-fun tp!28088 () Bool)

(assert (=> mapNonEmpty!14016 (= mapRes!14016 (and tp!28088 e!220943))))

(declare-fun mapRest!14016 () (Array (_ BitVec 32) ValueCell!3825))

(declare-fun mapValue!14016 () ValueCell!3825)

(declare-fun mapKey!14016 () (_ BitVec 32))

(assert (=> mapNonEmpty!14016 (= (arr!9606 _values!1208) (store mapRest!14016 mapKey!14016 mapValue!14016))))

(declare-fun mapIsEmpty!14016 () Bool)

(assert (=> mapIsEmpty!14016 mapRes!14016))

(declare-fun b!360965 () Bool)

(assert (=> b!360965 (= e!220947 tp_is_empty!8337)))

(declare-fun b!360966 () Bool)

(declare-fun res!200827 () Bool)

(assert (=> b!360966 (=> (not res!200827) (not e!220946))))

(assert (=> b!360966 (= res!200827 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9957 _keys!1456))))))

(declare-fun b!360967 () Bool)

(declare-fun e!220945 () Bool)

(assert (=> b!360967 (= e!220946 (not e!220945))))

(declare-fun res!200829 () Bool)

(assert (=> b!360967 (=> res!200829 e!220945)))

(assert (=> b!360967 (= res!200829 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9957 _keys!1456))))))

(assert (=> b!360967 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12093)

(declare-datatypes ((Unit!11104 0))(
  ( (Unit!11105) )
))
(declare-fun lt!166510 () Unit!11104)

(declare-fun zeroValue!1150 () V!12093)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!66 (array!20225 array!20227 (_ BitVec 32) (_ BitVec 32) V!12093 V!12093 (_ BitVec 64) (_ BitVec 32)) Unit!11104)

(assert (=> b!360967 (= lt!166510 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!66 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360968 () Bool)

(assert (=> b!360968 (= e!220945 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5736 0))(
  ( (tuple2!5737 (_1!2879 (_ BitVec 64)) (_2!2879 V!12093)) )
))
(declare-datatypes ((List!5499 0))(
  ( (Nil!5496) (Cons!5495 (h!6351 tuple2!5736) (t!10649 List!5499)) )
))
(declare-datatypes ((ListLongMap!4649 0))(
  ( (ListLongMap!4650 (toList!2340 List!5499)) )
))
(declare-fun contains!2421 (ListLongMap!4649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1861 (array!20225 array!20227 (_ BitVec 32) (_ BitVec 32) V!12093 V!12093 (_ BitVec 32) Int) ListLongMap!4649)

(assert (=> b!360968 (contains!2421 (getCurrentListMap!1861 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166511 () Unit!11104)

(declare-fun lemmaArrayContainsKeyThenInListMap!354 (array!20225 array!20227 (_ BitVec 32) (_ BitVec 32) V!12093 V!12093 (_ BitVec 64) (_ BitVec 32) Int) Unit!11104)

(assert (=> b!360968 (= lt!166511 (lemmaArrayContainsKeyThenInListMap!354 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun res!200826 () Bool)

(assert (=> start!35900 (=> (not res!200826) (not e!220946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35900 (= res!200826 (validMask!0 mask!1842))))

(assert (=> start!35900 e!220946))

(assert (=> start!35900 tp_is_empty!8337))

(assert (=> start!35900 true))

(assert (=> start!35900 tp!28089))

(declare-fun array_inv!7066 (array!20225) Bool)

(assert (=> start!35900 (array_inv!7066 _keys!1456)))

(declare-fun array_inv!7067 (array!20227) Bool)

(assert (=> start!35900 (and (array_inv!7067 _values!1208) e!220944)))

(declare-fun b!360964 () Bool)

(declare-fun res!200825 () Bool)

(assert (=> b!360964 (=> (not res!200825) (not e!220946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20225 (_ BitVec 32)) Bool)

(assert (=> b!360964 (= res!200825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35900 res!200826) b!360959))

(assert (= (and b!360959 res!200831) b!360964))

(assert (= (and b!360964 res!200825) b!360957))

(assert (= (and b!360957 res!200828) b!360960))

(assert (= (and b!360960 res!200830) b!360966))

(assert (= (and b!360966 res!200827) b!360962))

(assert (= (and b!360962 res!200832) b!360961))

(assert (= (and b!360961 res!200824) b!360967))

(assert (= (and b!360967 (not res!200829)) b!360968))

(assert (= (and b!360963 condMapEmpty!14016) mapIsEmpty!14016))

(assert (= (and b!360963 (not condMapEmpty!14016)) mapNonEmpty!14016))

(get-info :version)

(assert (= (and mapNonEmpty!14016 ((_ is ValueCellFull!3825) mapValue!14016)) b!360958))

(assert (= (and b!360963 ((_ is ValueCellFull!3825) mapDefault!14016)) b!360965))

(assert (= start!35900 b!360963))

(declare-fun m!357949 () Bool)

(assert (=> b!360961 m!357949))

(declare-fun m!357951 () Bool)

(assert (=> b!360968 m!357951))

(assert (=> b!360968 m!357951))

(declare-fun m!357953 () Bool)

(assert (=> b!360968 m!357953))

(declare-fun m!357955 () Bool)

(assert (=> b!360968 m!357955))

(declare-fun m!357957 () Bool)

(assert (=> b!360967 m!357957))

(declare-fun m!357959 () Bool)

(assert (=> b!360967 m!357959))

(declare-fun m!357961 () Bool)

(assert (=> b!360962 m!357961))

(declare-fun m!357963 () Bool)

(assert (=> mapNonEmpty!14016 m!357963))

(declare-fun m!357965 () Bool)

(assert (=> b!360960 m!357965))

(declare-fun m!357967 () Bool)

(assert (=> start!35900 m!357967))

(declare-fun m!357969 () Bool)

(assert (=> start!35900 m!357969))

(declare-fun m!357971 () Bool)

(assert (=> start!35900 m!357971))

(declare-fun m!357973 () Bool)

(assert (=> b!360964 m!357973))

(declare-fun m!357975 () Bool)

(assert (=> b!360957 m!357975))

(check-sat (not b!360967) (not b!360962) (not start!35900) tp_is_empty!8337 (not b!360964) (not b_next!7929) (not b!360957) b_and!15171 (not b!360960) (not b!360968) (not mapNonEmpty!14016))
(check-sat b_and!15171 (not b_next!7929))
