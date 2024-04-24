; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35820 () Bool)

(assert start!35820)

(declare-fun b!360031 () Bool)

(declare-fun e!220497 () Bool)

(assert (=> b!360031 (= e!220497 (not true))))

(declare-datatypes ((array!20106 0))(
  ( (array!20107 (arr!9546 (Array (_ BitVec 32) (_ BitVec 64))) (size!9898 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20106)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360031 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12027 0))(
  ( (V!12028 (val!4188 Int)) )
))
(declare-fun minValue!1150 () V!12027)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3800 0))(
  ( (ValueCellFull!3800 (v!6383 V!12027)) (EmptyCell!3800) )
))
(declare-datatypes ((array!20108 0))(
  ( (array!20109 (arr!9547 (Array (_ BitVec 32) ValueCell!3800)) (size!9899 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20108)

(declare-datatypes ((Unit!11057 0))(
  ( (Unit!11058) )
))
(declare-fun lt!166436 () Unit!11057)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12027)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!50 (array!20106 array!20108 (_ BitVec 32) (_ BitVec 32) V!12027 V!12027 (_ BitVec 64) (_ BitVec 32)) Unit!11057)

(assert (=> b!360031 (= lt!166436 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!50 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360032 () Bool)

(declare-fun e!220494 () Bool)

(declare-fun e!220498 () Bool)

(declare-fun mapRes!13938 () Bool)

(assert (=> b!360032 (= e!220494 (and e!220498 mapRes!13938))))

(declare-fun condMapEmpty!13938 () Bool)

(declare-fun mapDefault!13938 () ValueCell!3800)

(assert (=> b!360032 (= condMapEmpty!13938 (= (arr!9547 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3800)) mapDefault!13938)))))

(declare-fun res!200193 () Bool)

(assert (=> start!35820 (=> (not res!200193) (not e!220497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35820 (= res!200193 (validMask!0 mask!1842))))

(assert (=> start!35820 e!220497))

(declare-fun tp_is_empty!8287 () Bool)

(assert (=> start!35820 tp_is_empty!8287))

(assert (=> start!35820 true))

(declare-fun array_inv!7058 (array!20106) Bool)

(assert (=> start!35820 (array_inv!7058 _keys!1456)))

(declare-fun array_inv!7059 (array!20108) Bool)

(assert (=> start!35820 (and (array_inv!7059 _values!1208) e!220494)))

(declare-fun b!360033 () Bool)

(declare-fun res!200196 () Bool)

(assert (=> b!360033 (=> (not res!200196) (not e!220497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20106 (_ BitVec 32)) Bool)

(assert (=> b!360033 (= res!200196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360034 () Bool)

(declare-fun e!220496 () Bool)

(assert (=> b!360034 (= e!220496 tp_is_empty!8287)))

(declare-fun b!360035 () Bool)

(declare-fun res!200197 () Bool)

(assert (=> b!360035 (=> (not res!200197) (not e!220497))))

(assert (=> b!360035 (= res!200197 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13938 () Bool)

(declare-fun tp!28005 () Bool)

(assert (=> mapNonEmpty!13938 (= mapRes!13938 (and tp!28005 e!220496))))

(declare-fun mapRest!13938 () (Array (_ BitVec 32) ValueCell!3800))

(declare-fun mapValue!13938 () ValueCell!3800)

(declare-fun mapKey!13938 () (_ BitVec 32))

(assert (=> mapNonEmpty!13938 (= (arr!9547 _values!1208) (store mapRest!13938 mapKey!13938 mapValue!13938))))

(declare-fun b!360036 () Bool)

(assert (=> b!360036 (= e!220498 tp_is_empty!8287)))

(declare-fun b!360037 () Bool)

(declare-fun res!200198 () Bool)

(assert (=> b!360037 (=> (not res!200198) (not e!220497))))

(declare-datatypes ((List!5393 0))(
  ( (Nil!5390) (Cons!5389 (h!6245 (_ BitVec 64)) (t!10535 List!5393)) )
))
(declare-fun arrayNoDuplicates!0 (array!20106 (_ BitVec 32) List!5393) Bool)

(assert (=> b!360037 (= res!200198 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5390))))

(declare-fun mapIsEmpty!13938 () Bool)

(assert (=> mapIsEmpty!13938 mapRes!13938))

(declare-fun b!360038 () Bool)

(declare-fun res!200199 () Bool)

(assert (=> b!360038 (=> (not res!200199) (not e!220497))))

(assert (=> b!360038 (= res!200199 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9898 _keys!1456))))))

(declare-fun b!360039 () Bool)

(declare-fun res!200194 () Bool)

(assert (=> b!360039 (=> (not res!200194) (not e!220497))))

(assert (=> b!360039 (= res!200194 (and (= (size!9899 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9898 _keys!1456) (size!9899 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360040 () Bool)

(declare-fun res!200200 () Bool)

(assert (=> b!360040 (=> (not res!200200) (not e!220497))))

(assert (=> b!360040 (= res!200200 (not (= (select (arr!9546 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360041 () Bool)

(declare-fun res!200195 () Bool)

(assert (=> b!360041 (=> (not res!200195) (not e!220497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360041 (= res!200195 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35820 res!200193) b!360039))

(assert (= (and b!360039 res!200194) b!360033))

(assert (= (and b!360033 res!200196) b!360037))

(assert (= (and b!360037 res!200198) b!360041))

(assert (= (and b!360041 res!200195) b!360038))

(assert (= (and b!360038 res!200199) b!360035))

(assert (= (and b!360035 res!200197) b!360040))

(assert (= (and b!360040 res!200200) b!360031))

(assert (= (and b!360032 condMapEmpty!13938) mapIsEmpty!13938))

(assert (= (and b!360032 (not condMapEmpty!13938)) mapNonEmpty!13938))

(get-info :version)

(assert (= (and mapNonEmpty!13938 ((_ is ValueCellFull!3800) mapValue!13938)) b!360034))

(assert (= (and b!360032 ((_ is ValueCellFull!3800) mapDefault!13938)) b!360036))

(assert (= start!35820 b!360032))

(declare-fun m!357591 () Bool)

(assert (=> b!360041 m!357591))

(declare-fun m!357593 () Bool)

(assert (=> b!360037 m!357593))

(declare-fun m!357595 () Bool)

(assert (=> mapNonEmpty!13938 m!357595))

(declare-fun m!357597 () Bool)

(assert (=> b!360031 m!357597))

(declare-fun m!357599 () Bool)

(assert (=> b!360031 m!357599))

(declare-fun m!357601 () Bool)

(assert (=> b!360040 m!357601))

(declare-fun m!357603 () Bool)

(assert (=> start!35820 m!357603))

(declare-fun m!357605 () Bool)

(assert (=> start!35820 m!357605))

(declare-fun m!357607 () Bool)

(assert (=> start!35820 m!357607))

(declare-fun m!357609 () Bool)

(assert (=> b!360035 m!357609))

(declare-fun m!357611 () Bool)

(assert (=> b!360033 m!357611))

(check-sat (not b!360041) (not b!360037) (not start!35820) (not mapNonEmpty!13938) tp_is_empty!8287 (not b!360031) (not b!360035) (not b!360033))
(check-sat)
