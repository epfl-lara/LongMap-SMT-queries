; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35844 () Bool)

(assert start!35844)

(declare-fun b!360205 () Bool)

(declare-fun e!220536 () Bool)

(assert (=> b!360205 (= e!220536 (not true))))

(declare-datatypes ((array!20147 0))(
  ( (array!20148 (arr!9567 (Array (_ BitVec 32) (_ BitVec 64))) (size!9920 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20147)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360205 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12059 0))(
  ( (V!12060 (val!4200 Int)) )
))
(declare-fun minValue!1150 () V!12059)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11072 0))(
  ( (Unit!11073) )
))
(declare-fun lt!166219 () Unit!11072)

(declare-datatypes ((ValueCell!3812 0))(
  ( (ValueCellFull!3812 (v!6388 V!12059)) (EmptyCell!3812) )
))
(declare-datatypes ((array!20149 0))(
  ( (array!20150 (arr!9568 (Array (_ BitVec 32) ValueCell!3812)) (size!9921 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20149)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12059)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!59 (array!20147 array!20149 (_ BitVec 32) (_ BitVec 32) V!12059 V!12059 (_ BitVec 64) (_ BitVec 32)) Unit!11072)

(assert (=> b!360205 (= lt!166219 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!59 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun res!200357 () Bool)

(assert (=> start!35844 (=> (not res!200357) (not e!220536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35844 (= res!200357 (validMask!0 mask!1842))))

(assert (=> start!35844 e!220536))

(declare-fun tp_is_empty!8311 () Bool)

(assert (=> start!35844 tp_is_empty!8311))

(assert (=> start!35844 true))

(declare-fun array_inv!7052 (array!20147) Bool)

(assert (=> start!35844 (array_inv!7052 _keys!1456)))

(declare-fun e!220533 () Bool)

(declare-fun array_inv!7053 (array!20149) Bool)

(assert (=> start!35844 (and (array_inv!7053 _values!1208) e!220533)))

(declare-fun b!360206 () Bool)

(declare-fun e!220534 () Bool)

(assert (=> b!360206 (= e!220534 tp_is_empty!8311)))

(declare-fun b!360207 () Bool)

(declare-fun e!220535 () Bool)

(assert (=> b!360207 (= e!220535 tp_is_empty!8311)))

(declare-fun b!360208 () Bool)

(declare-fun res!200355 () Bool)

(assert (=> b!360208 (=> (not res!200355) (not e!220536))))

(assert (=> b!360208 (= res!200355 (not (= (select (arr!9567 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360209 () Bool)

(declare-fun res!200362 () Bool)

(assert (=> b!360209 (=> (not res!200362) (not e!220536))))

(assert (=> b!360209 (= res!200362 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13974 () Bool)

(declare-fun mapRes!13974 () Bool)

(declare-fun tp!28041 () Bool)

(assert (=> mapNonEmpty!13974 (= mapRes!13974 (and tp!28041 e!220535))))

(declare-fun mapRest!13974 () (Array (_ BitVec 32) ValueCell!3812))

(declare-fun mapValue!13974 () ValueCell!3812)

(declare-fun mapKey!13974 () (_ BitVec 32))

(assert (=> mapNonEmpty!13974 (= (arr!9568 _values!1208) (store mapRest!13974 mapKey!13974 mapValue!13974))))

(declare-fun b!360210 () Bool)

(declare-fun res!200356 () Bool)

(assert (=> b!360210 (=> (not res!200356) (not e!220536))))

(declare-datatypes ((List!5458 0))(
  ( (Nil!5455) (Cons!5454 (h!6310 (_ BitVec 64)) (t!10599 List!5458)) )
))
(declare-fun arrayNoDuplicates!0 (array!20147 (_ BitVec 32) List!5458) Bool)

(assert (=> b!360210 (= res!200356 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5455))))

(declare-fun b!360211 () Bool)

(declare-fun res!200360 () Bool)

(assert (=> b!360211 (=> (not res!200360) (not e!220536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20147 (_ BitVec 32)) Bool)

(assert (=> b!360211 (= res!200360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360212 () Bool)

(declare-fun res!200361 () Bool)

(assert (=> b!360212 (=> (not res!200361) (not e!220536))))

(assert (=> b!360212 (= res!200361 (and (= (size!9921 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9920 _keys!1456) (size!9921 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13974 () Bool)

(assert (=> mapIsEmpty!13974 mapRes!13974))

(declare-fun b!360213 () Bool)

(assert (=> b!360213 (= e!220533 (and e!220534 mapRes!13974))))

(declare-fun condMapEmpty!13974 () Bool)

(declare-fun mapDefault!13974 () ValueCell!3812)

(assert (=> b!360213 (= condMapEmpty!13974 (= (arr!9568 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3812)) mapDefault!13974)))))

(declare-fun b!360214 () Bool)

(declare-fun res!200358 () Bool)

(assert (=> b!360214 (=> (not res!200358) (not e!220536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360214 (= res!200358 (validKeyInArray!0 k0!1077))))

(declare-fun b!360215 () Bool)

(declare-fun res!200359 () Bool)

(assert (=> b!360215 (=> (not res!200359) (not e!220536))))

(assert (=> b!360215 (= res!200359 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9920 _keys!1456))))))

(assert (= (and start!35844 res!200357) b!360212))

(assert (= (and b!360212 res!200361) b!360211))

(assert (= (and b!360211 res!200360) b!360210))

(assert (= (and b!360210 res!200356) b!360214))

(assert (= (and b!360214 res!200358) b!360215))

(assert (= (and b!360215 res!200359) b!360209))

(assert (= (and b!360209 res!200362) b!360208))

(assert (= (and b!360208 res!200355) b!360205))

(assert (= (and b!360213 condMapEmpty!13974) mapIsEmpty!13974))

(assert (= (and b!360213 (not condMapEmpty!13974)) mapNonEmpty!13974))

(get-info :version)

(assert (= (and mapNonEmpty!13974 ((_ is ValueCellFull!3812) mapValue!13974)) b!360207))

(assert (= (and b!360213 ((_ is ValueCellFull!3812) mapDefault!13974)) b!360206))

(assert (= start!35844 b!360213))

(declare-fun m!356901 () Bool)

(assert (=> b!360208 m!356901))

(declare-fun m!356903 () Bool)

(assert (=> mapNonEmpty!13974 m!356903))

(declare-fun m!356905 () Bool)

(assert (=> b!360205 m!356905))

(declare-fun m!356907 () Bool)

(assert (=> b!360205 m!356907))

(declare-fun m!356909 () Bool)

(assert (=> b!360214 m!356909))

(declare-fun m!356911 () Bool)

(assert (=> b!360211 m!356911))

(declare-fun m!356913 () Bool)

(assert (=> b!360209 m!356913))

(declare-fun m!356915 () Bool)

(assert (=> start!35844 m!356915))

(declare-fun m!356917 () Bool)

(assert (=> start!35844 m!356917))

(declare-fun m!356919 () Bool)

(assert (=> start!35844 m!356919))

(declare-fun m!356921 () Bool)

(assert (=> b!360210 m!356921))

(check-sat (not b!360210) (not b!360205) (not start!35844) tp_is_empty!8311 (not mapNonEmpty!13974) (not b!360214) (not b!360211) (not b!360209))
(check-sat)
