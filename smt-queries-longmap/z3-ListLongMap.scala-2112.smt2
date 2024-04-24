; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35826 () Bool)

(assert start!35826)

(declare-fun b!360130 () Bool)

(declare-fun res!200265 () Bool)

(declare-fun e!220539 () Bool)

(assert (=> b!360130 (=> (not res!200265) (not e!220539))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20116 0))(
  ( (array!20117 (arr!9551 (Array (_ BitVec 32) (_ BitVec 64))) (size!9903 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20116)

(declare-datatypes ((V!12035 0))(
  ( (V!12036 (val!4191 Int)) )
))
(declare-datatypes ((ValueCell!3803 0))(
  ( (ValueCellFull!3803 (v!6386 V!12035)) (EmptyCell!3803) )
))
(declare-datatypes ((array!20118 0))(
  ( (array!20119 (arr!9552 (Array (_ BitVec 32) ValueCell!3803)) (size!9904 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20118)

(assert (=> b!360130 (= res!200265 (and (= (size!9904 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9903 _keys!1456) (size!9904 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360131 () Bool)

(declare-fun e!220540 () Bool)

(declare-fun tp_is_empty!8293 () Bool)

(assert (=> b!360131 (= e!220540 tp_is_empty!8293)))

(declare-fun res!200267 () Bool)

(assert (=> start!35826 (=> (not res!200267) (not e!220539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35826 (= res!200267 (validMask!0 mask!1842))))

(assert (=> start!35826 e!220539))

(assert (=> start!35826 tp_is_empty!8293))

(assert (=> start!35826 true))

(declare-fun array_inv!7062 (array!20116) Bool)

(assert (=> start!35826 (array_inv!7062 _keys!1456)))

(declare-fun e!220541 () Bool)

(declare-fun array_inv!7063 (array!20118) Bool)

(assert (=> start!35826 (and (array_inv!7063 _values!1208) e!220541)))

(declare-fun b!360132 () Bool)

(declare-fun res!200271 () Bool)

(assert (=> b!360132 (=> (not res!200271) (not e!220539))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!360132 (= res!200271 (not (= (select (arr!9551 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360133 () Bool)

(assert (=> b!360133 (= e!220539 (not true))))

(declare-fun arrayContainsKey!0 (array!20116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360133 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12035)

(declare-datatypes ((Unit!11061 0))(
  ( (Unit!11062) )
))
(declare-fun lt!166445 () Unit!11061)

(declare-fun zeroValue!1150 () V!12035)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!52 (array!20116 array!20118 (_ BitVec 32) (_ BitVec 32) V!12035 V!12035 (_ BitVec 64) (_ BitVec 32)) Unit!11061)

(assert (=> b!360133 (= lt!166445 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!52 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360134 () Bool)

(declare-fun res!200268 () Bool)

(assert (=> b!360134 (=> (not res!200268) (not e!220539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360134 (= res!200268 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13947 () Bool)

(declare-fun mapRes!13947 () Bool)

(assert (=> mapIsEmpty!13947 mapRes!13947))

(declare-fun b!360135 () Bool)

(declare-fun e!220542 () Bool)

(assert (=> b!360135 (= e!220542 tp_is_empty!8293)))

(declare-fun b!360136 () Bool)

(declare-fun res!200270 () Bool)

(assert (=> b!360136 (=> (not res!200270) (not e!220539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20116 (_ BitVec 32)) Bool)

(assert (=> b!360136 (= res!200270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360137 () Bool)

(assert (=> b!360137 (= e!220541 (and e!220542 mapRes!13947))))

(declare-fun condMapEmpty!13947 () Bool)

(declare-fun mapDefault!13947 () ValueCell!3803)

(assert (=> b!360137 (= condMapEmpty!13947 (= (arr!9552 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3803)) mapDefault!13947)))))

(declare-fun b!360138 () Bool)

(declare-fun res!200269 () Bool)

(assert (=> b!360138 (=> (not res!200269) (not e!220539))))

(assert (=> b!360138 (= res!200269 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360139 () Bool)

(declare-fun res!200272 () Bool)

(assert (=> b!360139 (=> (not res!200272) (not e!220539))))

(assert (=> b!360139 (= res!200272 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9903 _keys!1456))))))

(declare-fun mapNonEmpty!13947 () Bool)

(declare-fun tp!28014 () Bool)

(assert (=> mapNonEmpty!13947 (= mapRes!13947 (and tp!28014 e!220540))))

(declare-fun mapKey!13947 () (_ BitVec 32))

(declare-fun mapValue!13947 () ValueCell!3803)

(declare-fun mapRest!13947 () (Array (_ BitVec 32) ValueCell!3803))

(assert (=> mapNonEmpty!13947 (= (arr!9552 _values!1208) (store mapRest!13947 mapKey!13947 mapValue!13947))))

(declare-fun b!360140 () Bool)

(declare-fun res!200266 () Bool)

(assert (=> b!360140 (=> (not res!200266) (not e!220539))))

(declare-datatypes ((List!5395 0))(
  ( (Nil!5392) (Cons!5391 (h!6247 (_ BitVec 64)) (t!10537 List!5395)) )
))
(declare-fun arrayNoDuplicates!0 (array!20116 (_ BitVec 32) List!5395) Bool)

(assert (=> b!360140 (= res!200266 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5392))))

(assert (= (and start!35826 res!200267) b!360130))

(assert (= (and b!360130 res!200265) b!360136))

(assert (= (and b!360136 res!200270) b!360140))

(assert (= (and b!360140 res!200266) b!360134))

(assert (= (and b!360134 res!200268) b!360139))

(assert (= (and b!360139 res!200272) b!360138))

(assert (= (and b!360138 res!200269) b!360132))

(assert (= (and b!360132 res!200271) b!360133))

(assert (= (and b!360137 condMapEmpty!13947) mapIsEmpty!13947))

(assert (= (and b!360137 (not condMapEmpty!13947)) mapNonEmpty!13947))

(get-info :version)

(assert (= (and mapNonEmpty!13947 ((_ is ValueCellFull!3803) mapValue!13947)) b!360131))

(assert (= (and b!360137 ((_ is ValueCellFull!3803) mapDefault!13947)) b!360135))

(assert (= start!35826 b!360137))

(declare-fun m!357657 () Bool)

(assert (=> b!360140 m!357657))

(declare-fun m!357659 () Bool)

(assert (=> b!360138 m!357659))

(declare-fun m!357661 () Bool)

(assert (=> b!360133 m!357661))

(declare-fun m!357663 () Bool)

(assert (=> b!360133 m!357663))

(declare-fun m!357665 () Bool)

(assert (=> start!35826 m!357665))

(declare-fun m!357667 () Bool)

(assert (=> start!35826 m!357667))

(declare-fun m!357669 () Bool)

(assert (=> start!35826 m!357669))

(declare-fun m!357671 () Bool)

(assert (=> b!360134 m!357671))

(declare-fun m!357673 () Bool)

(assert (=> b!360136 m!357673))

(declare-fun m!357675 () Bool)

(assert (=> b!360132 m!357675))

(declare-fun m!357677 () Bool)

(assert (=> mapNonEmpty!13947 m!357677))

(check-sat (not b!360134) tp_is_empty!8293 (not b!360140) (not start!35826) (not mapNonEmpty!13947) (not b!360138) (not b!360133) (not b!360136))
(check-sat)
