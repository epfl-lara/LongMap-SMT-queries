; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35836 () Bool)

(assert start!35836)

(declare-fun b!360117 () Bool)

(declare-fun res!200221 () Bool)

(declare-fun e!220544 () Bool)

(assert (=> b!360117 (=> (not res!200221) (not e!220544))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360117 (= res!200221 (validKeyInArray!0 k0!1077))))

(declare-fun b!360118 () Bool)

(declare-fun res!200222 () Bool)

(assert (=> b!360118 (=> (not res!200222) (not e!220544))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20129 0))(
  ( (array!20130 (arr!9558 (Array (_ BitVec 32) (_ BitVec 64))) (size!9910 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20129)

(declare-datatypes ((V!12029 0))(
  ( (V!12030 (val!4189 Int)) )
))
(declare-datatypes ((ValueCell!3801 0))(
  ( (ValueCellFull!3801 (v!6383 V!12029)) (EmptyCell!3801) )
))
(declare-datatypes ((array!20131 0))(
  ( (array!20132 (arr!9559 (Array (_ BitVec 32) ValueCell!3801)) (size!9911 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20131)

(assert (=> b!360118 (= res!200222 (and (= (size!9911 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9910 _keys!1456) (size!9911 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360119 () Bool)

(declare-fun res!200226 () Bool)

(assert (=> b!360119 (=> (not res!200226) (not e!220544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20129 (_ BitVec 32)) Bool)

(assert (=> b!360119 (= res!200226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360120 () Bool)

(declare-fun e!220546 () Bool)

(declare-fun e!220545 () Bool)

(declare-fun mapRes!13941 () Bool)

(assert (=> b!360120 (= e!220546 (and e!220545 mapRes!13941))))

(declare-fun condMapEmpty!13941 () Bool)

(declare-fun mapDefault!13941 () ValueCell!3801)

(assert (=> b!360120 (= condMapEmpty!13941 (= (arr!9559 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3801)) mapDefault!13941)))))

(declare-fun mapIsEmpty!13941 () Bool)

(assert (=> mapIsEmpty!13941 mapRes!13941))

(declare-fun b!360121 () Bool)

(declare-fun res!200224 () Bool)

(assert (=> b!360121 (=> (not res!200224) (not e!220544))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360121 (= res!200224 (not (= (select (arr!9558 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360123 () Bool)

(declare-fun e!220543 () Bool)

(declare-fun tp_is_empty!8289 () Bool)

(assert (=> b!360123 (= e!220543 tp_is_empty!8289)))

(declare-fun b!360124 () Bool)

(assert (=> b!360124 (= e!220545 tp_is_empty!8289)))

(declare-fun mapNonEmpty!13941 () Bool)

(declare-fun tp!28008 () Bool)

(assert (=> mapNonEmpty!13941 (= mapRes!13941 (and tp!28008 e!220543))))

(declare-fun mapRest!13941 () (Array (_ BitVec 32) ValueCell!3801))

(declare-fun mapKey!13941 () (_ BitVec 32))

(declare-fun mapValue!13941 () ValueCell!3801)

(assert (=> mapNonEmpty!13941 (= (arr!9559 _values!1208) (store mapRest!13941 mapKey!13941 mapValue!13941))))

(declare-fun b!360125 () Bool)

(declare-fun res!200223 () Bool)

(assert (=> b!360125 (=> (not res!200223) (not e!220544))))

(declare-datatypes ((List!5483 0))(
  ( (Nil!5480) (Cons!5479 (h!6335 (_ BitVec 64)) (t!10633 List!5483)) )
))
(declare-fun arrayNoDuplicates!0 (array!20129 (_ BitVec 32) List!5483) Bool)

(assert (=> b!360125 (= res!200223 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5480))))

(declare-fun b!360126 () Bool)

(assert (=> b!360126 (= e!220544 (not true))))

(declare-fun arrayContainsKey!0 (array!20129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360126 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12029)

(declare-datatypes ((Unit!11070 0))(
  ( (Unit!11071) )
))
(declare-fun lt!166421 () Unit!11070)

(declare-fun zeroValue!1150 () V!12029)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!50 (array!20129 array!20131 (_ BitVec 32) (_ BitVec 32) V!12029 V!12029 (_ BitVec 64) (_ BitVec 32)) Unit!11070)

(assert (=> b!360126 (= lt!166421 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!50 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360127 () Bool)

(declare-fun res!200225 () Bool)

(assert (=> b!360127 (=> (not res!200225) (not e!220544))))

(assert (=> b!360127 (= res!200225 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9910 _keys!1456))))))

(declare-fun res!200220 () Bool)

(assert (=> start!35836 (=> (not res!200220) (not e!220544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35836 (= res!200220 (validMask!0 mask!1842))))

(assert (=> start!35836 e!220544))

(assert (=> start!35836 tp_is_empty!8289))

(assert (=> start!35836 true))

(declare-fun array_inv!7032 (array!20129) Bool)

(assert (=> start!35836 (array_inv!7032 _keys!1456)))

(declare-fun array_inv!7033 (array!20131) Bool)

(assert (=> start!35836 (and (array_inv!7033 _values!1208) e!220546)))

(declare-fun b!360122 () Bool)

(declare-fun res!200227 () Bool)

(assert (=> b!360122 (=> (not res!200227) (not e!220544))))

(assert (=> b!360122 (= res!200227 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35836 res!200220) b!360118))

(assert (= (and b!360118 res!200222) b!360119))

(assert (= (and b!360119 res!200226) b!360125))

(assert (= (and b!360125 res!200223) b!360117))

(assert (= (and b!360117 res!200221) b!360127))

(assert (= (and b!360127 res!200225) b!360122))

(assert (= (and b!360122 res!200227) b!360121))

(assert (= (and b!360121 res!200224) b!360126))

(assert (= (and b!360120 condMapEmpty!13941) mapIsEmpty!13941))

(assert (= (and b!360120 (not condMapEmpty!13941)) mapNonEmpty!13941))

(get-info :version)

(assert (= (and mapNonEmpty!13941 ((_ is ValueCellFull!3801) mapValue!13941)) b!360123))

(assert (= (and b!360120 ((_ is ValueCellFull!3801) mapDefault!13941)) b!360124))

(assert (= start!35836 b!360120))

(declare-fun m!357389 () Bool)

(assert (=> b!360117 m!357389))

(declare-fun m!357391 () Bool)

(assert (=> b!360126 m!357391))

(declare-fun m!357393 () Bool)

(assert (=> b!360126 m!357393))

(declare-fun m!357395 () Bool)

(assert (=> mapNonEmpty!13941 m!357395))

(declare-fun m!357397 () Bool)

(assert (=> b!360121 m!357397))

(declare-fun m!357399 () Bool)

(assert (=> b!360125 m!357399))

(declare-fun m!357401 () Bool)

(assert (=> start!35836 m!357401))

(declare-fun m!357403 () Bool)

(assert (=> start!35836 m!357403))

(declare-fun m!357405 () Bool)

(assert (=> start!35836 m!357405))

(declare-fun m!357407 () Bool)

(assert (=> b!360119 m!357407))

(declare-fun m!357409 () Bool)

(assert (=> b!360122 m!357409))

(check-sat (not b!360125) (not mapNonEmpty!13941) (not start!35836) (not b!360122) (not b!360126) (not b!360117) tp_is_empty!8289 (not b!360119))
(check-sat)
