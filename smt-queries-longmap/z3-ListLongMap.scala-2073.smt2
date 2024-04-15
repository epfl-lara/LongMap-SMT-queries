; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35592 () Bool)

(assert start!35592)

(declare-fun b!356911 () Bool)

(declare-fun res!198202 () Bool)

(declare-fun e!218563 () Bool)

(assert (=> b!356911 (=> (not res!198202) (not e!218563))))

(declare-datatypes ((array!19673 0))(
  ( (array!19674 (arr!9330 (Array (_ BitVec 32) (_ BitVec 64))) (size!9683 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19673)

(declare-datatypes ((List!5351 0))(
  ( (Nil!5348) (Cons!5347 (h!6203 (_ BitVec 64)) (t!10492 List!5351)) )
))
(declare-fun arrayNoDuplicates!0 (array!19673 (_ BitVec 32) List!5351) Bool)

(assert (=> b!356911 (= res!198202 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5348))))

(declare-fun b!356912 () Bool)

(declare-fun e!218562 () Bool)

(declare-fun e!218561 () Bool)

(declare-fun mapRes!13596 () Bool)

(assert (=> b!356912 (= e!218562 (and e!218561 mapRes!13596))))

(declare-fun condMapEmpty!13596 () Bool)

(declare-datatypes ((V!11723 0))(
  ( (V!11724 (val!4074 Int)) )
))
(declare-datatypes ((ValueCell!3686 0))(
  ( (ValueCellFull!3686 (v!6262 V!11723)) (EmptyCell!3686) )
))
(declare-datatypes ((array!19675 0))(
  ( (array!19676 (arr!9331 (Array (_ BitVec 32) ValueCell!3686)) (size!9684 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19675)

(declare-fun mapDefault!13596 () ValueCell!3686)

(assert (=> b!356912 (= condMapEmpty!13596 (= (arr!9331 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3686)) mapDefault!13596)))))

(declare-fun b!356913 () Bool)

(declare-fun res!198195 () Bool)

(assert (=> b!356913 (=> (not res!198195) (not e!218563))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19673 (_ BitVec 32)) Bool)

(assert (=> b!356913 (= res!198195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356914 () Bool)

(declare-fun res!198200 () Bool)

(assert (=> b!356914 (=> (not res!198200) (not e!218563))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356914 (= res!198200 (and (= (size!9684 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9683 _keys!1456) (size!9684 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13596 () Bool)

(assert (=> mapIsEmpty!13596 mapRes!13596))

(declare-fun res!198197 () Bool)

(assert (=> start!35592 (=> (not res!198197) (not e!218563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35592 (= res!198197 (validMask!0 mask!1842))))

(assert (=> start!35592 e!218563))

(declare-fun tp_is_empty!8059 () Bool)

(assert (=> start!35592 tp_is_empty!8059))

(assert (=> start!35592 true))

(declare-fun array_inv!6890 (array!19673) Bool)

(assert (=> start!35592 (array_inv!6890 _keys!1456)))

(declare-fun array_inv!6891 (array!19675) Bool)

(assert (=> start!35592 (and (array_inv!6891 _values!1208) e!218562)))

(declare-fun b!356915 () Bool)

(declare-fun res!198196 () Bool)

(assert (=> b!356915 (=> (not res!198196) (not e!218563))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356915 (= res!198196 (validKeyInArray!0 k0!1077))))

(declare-fun b!356916 () Bool)

(declare-fun e!218564 () Bool)

(assert (=> b!356916 (= e!218564 tp_is_empty!8059)))

(declare-fun b!356917 () Bool)

(assert (=> b!356917 (= e!218563 (not true))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356917 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11723)

(declare-fun zeroValue!1150 () V!11723)

(declare-datatypes ((Unit!10990 0))(
  ( (Unit!10991) )
))
(declare-fun lt!165769 () Unit!10990)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!22 (array!19673 array!19675 (_ BitVec 32) (_ BitVec 32) V!11723 V!11723 (_ BitVec 64) (_ BitVec 32)) Unit!10990)

(assert (=> b!356917 (= lt!165769 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!22 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356918 () Bool)

(declare-fun res!198201 () Bool)

(assert (=> b!356918 (=> (not res!198201) (not e!218563))))

(assert (=> b!356918 (= res!198201 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356919 () Bool)

(declare-fun res!198198 () Bool)

(assert (=> b!356919 (=> (not res!198198) (not e!218563))))

(assert (=> b!356919 (= res!198198 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9683 _keys!1456))))))

(declare-fun b!356920 () Bool)

(assert (=> b!356920 (= e!218561 tp_is_empty!8059)))

(declare-fun mapNonEmpty!13596 () Bool)

(declare-fun tp!27573 () Bool)

(assert (=> mapNonEmpty!13596 (= mapRes!13596 (and tp!27573 e!218564))))

(declare-fun mapKey!13596 () (_ BitVec 32))

(declare-fun mapValue!13596 () ValueCell!3686)

(declare-fun mapRest!13596 () (Array (_ BitVec 32) ValueCell!3686))

(assert (=> mapNonEmpty!13596 (= (arr!9331 _values!1208) (store mapRest!13596 mapKey!13596 mapValue!13596))))

(declare-fun b!356921 () Bool)

(declare-fun res!198199 () Bool)

(assert (=> b!356921 (=> (not res!198199) (not e!218563))))

(assert (=> b!356921 (= res!198199 (not (= (select (arr!9330 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35592 res!198197) b!356914))

(assert (= (and b!356914 res!198200) b!356913))

(assert (= (and b!356913 res!198195) b!356911))

(assert (= (and b!356911 res!198202) b!356915))

(assert (= (and b!356915 res!198196) b!356919))

(assert (= (and b!356919 res!198198) b!356918))

(assert (= (and b!356918 res!198201) b!356921))

(assert (= (and b!356921 res!198199) b!356917))

(assert (= (and b!356912 condMapEmpty!13596) mapIsEmpty!13596))

(assert (= (and b!356912 (not condMapEmpty!13596)) mapNonEmpty!13596))

(get-info :version)

(assert (= (and mapNonEmpty!13596 ((_ is ValueCellFull!3686) mapValue!13596)) b!356916))

(assert (= (and b!356912 ((_ is ValueCellFull!3686) mapDefault!13596)) b!356920))

(assert (= start!35592 b!356912))

(declare-fun m!354603 () Bool)

(assert (=> b!356915 m!354603))

(declare-fun m!354605 () Bool)

(assert (=> b!356918 m!354605))

(declare-fun m!354607 () Bool)

(assert (=> b!356913 m!354607))

(declare-fun m!354609 () Bool)

(assert (=> start!35592 m!354609))

(declare-fun m!354611 () Bool)

(assert (=> start!35592 m!354611))

(declare-fun m!354613 () Bool)

(assert (=> start!35592 m!354613))

(declare-fun m!354615 () Bool)

(assert (=> b!356921 m!354615))

(declare-fun m!354617 () Bool)

(assert (=> b!356911 m!354617))

(declare-fun m!354619 () Bool)

(assert (=> mapNonEmpty!13596 m!354619))

(declare-fun m!354621 () Bool)

(assert (=> b!356917 m!354621))

(declare-fun m!354623 () Bool)

(assert (=> b!356917 m!354623))

(check-sat (not b!356917) (not b!356918) (not b!356911) (not b!356913) (not b!356915) (not start!35592) tp_is_empty!8059 (not mapNonEmpty!13596))
(check-sat)
