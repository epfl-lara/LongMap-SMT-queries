; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35592 () Bool)

(assert start!35592)

(declare-fun b!357133 () Bool)

(declare-fun res!198323 () Bool)

(declare-fun e!218707 () Bool)

(assert (=> b!357133 (=> (not res!198323) (not e!218707))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357133 (= res!198323 (validKeyInArray!0 k0!1077))))

(declare-fun b!357134 () Bool)

(declare-fun res!198328 () Bool)

(assert (=> b!357134 (=> (not res!198328) (not e!218707))))

(declare-datatypes ((array!19668 0))(
  ( (array!19669 (arr!9327 (Array (_ BitVec 32) (_ BitVec 64))) (size!9679 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19668)

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357134 (= res!198328 (not (= (select (arr!9327 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357135 () Bool)

(declare-fun res!198322 () Bool)

(assert (=> b!357135 (=> (not res!198322) (not e!218707))))

(assert (=> b!357135 (= res!198322 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9679 _keys!1456))))))

(declare-fun b!357136 () Bool)

(declare-fun res!198321 () Bool)

(assert (=> b!357136 (=> (not res!198321) (not e!218707))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11723 0))(
  ( (V!11724 (val!4074 Int)) )
))
(declare-datatypes ((ValueCell!3686 0))(
  ( (ValueCellFull!3686 (v!6269 V!11723)) (EmptyCell!3686) )
))
(declare-datatypes ((array!19670 0))(
  ( (array!19671 (arr!9328 (Array (_ BitVec 32) ValueCell!3686)) (size!9680 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19670)

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!357136 (= res!198321 (and (= (size!9680 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9679 _keys!1456) (size!9680 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13596 () Bool)

(declare-fun mapRes!13596 () Bool)

(declare-fun tp!27573 () Bool)

(declare-fun e!218706 () Bool)

(assert (=> mapNonEmpty!13596 (= mapRes!13596 (and tp!27573 e!218706))))

(declare-fun mapValue!13596 () ValueCell!3686)

(declare-fun mapKey!13596 () (_ BitVec 32))

(declare-fun mapRest!13596 () (Array (_ BitVec 32) ValueCell!3686))

(assert (=> mapNonEmpty!13596 (= (arr!9328 _values!1208) (store mapRest!13596 mapKey!13596 mapValue!13596))))

(declare-fun b!357137 () Bool)

(declare-fun e!218704 () Bool)

(declare-fun tp_is_empty!8059 () Bool)

(assert (=> b!357137 (= e!218704 tp_is_empty!8059)))

(declare-fun b!357138 () Bool)

(assert (=> b!357138 (= e!218706 tp_is_empty!8059)))

(declare-fun b!357139 () Bool)

(declare-fun e!218705 () Bool)

(assert (=> b!357139 (= e!218705 (and e!218704 mapRes!13596))))

(declare-fun condMapEmpty!13596 () Bool)

(declare-fun mapDefault!13596 () ValueCell!3686)

(assert (=> b!357139 (= condMapEmpty!13596 (= (arr!9328 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3686)) mapDefault!13596)))))

(declare-fun b!357140 () Bool)

(declare-fun res!198327 () Bool)

(assert (=> b!357140 (=> (not res!198327) (not e!218707))))

(declare-fun arrayContainsKey!0 (array!19668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357140 (= res!198327 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357141 () Bool)

(declare-fun res!198326 () Bool)

(assert (=> b!357141 (=> (not res!198326) (not e!218707))))

(declare-datatypes ((List!5293 0))(
  ( (Nil!5290) (Cons!5289 (h!6145 (_ BitVec 64)) (t!10435 List!5293)) )
))
(declare-fun arrayNoDuplicates!0 (array!19668 (_ BitVec 32) List!5293) Bool)

(assert (=> b!357141 (= res!198326 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5290))))

(declare-fun b!357142 () Bool)

(declare-fun res!198324 () Bool)

(assert (=> b!357142 (=> (not res!198324) (not e!218707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19668 (_ BitVec 32)) Bool)

(assert (=> b!357142 (= res!198324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357143 () Bool)

(assert (=> b!357143 (= e!218707 (not true))))

(assert (=> b!357143 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11723)

(declare-fun zeroValue!1150 () V!11723)

(declare-datatypes ((Unit!10991 0))(
  ( (Unit!10992) )
))
(declare-fun lt!166022 () Unit!10991)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!24 (array!19668 array!19670 (_ BitVec 32) (_ BitVec 32) V!11723 V!11723 (_ BitVec 64) (_ BitVec 32)) Unit!10991)

(assert (=> b!357143 (= lt!166022 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!24 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13596 () Bool)

(assert (=> mapIsEmpty!13596 mapRes!13596))

(declare-fun res!198325 () Bool)

(assert (=> start!35592 (=> (not res!198325) (not e!218707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35592 (= res!198325 (validMask!0 mask!1842))))

(assert (=> start!35592 e!218707))

(assert (=> start!35592 tp_is_empty!8059))

(assert (=> start!35592 true))

(declare-fun array_inv!6892 (array!19668) Bool)

(assert (=> start!35592 (array_inv!6892 _keys!1456)))

(declare-fun array_inv!6893 (array!19670) Bool)

(assert (=> start!35592 (and (array_inv!6893 _values!1208) e!218705)))

(assert (= (and start!35592 res!198325) b!357136))

(assert (= (and b!357136 res!198321) b!357142))

(assert (= (and b!357142 res!198324) b!357141))

(assert (= (and b!357141 res!198326) b!357133))

(assert (= (and b!357133 res!198323) b!357135))

(assert (= (and b!357135 res!198322) b!357140))

(assert (= (and b!357140 res!198327) b!357134))

(assert (= (and b!357134 res!198328) b!357143))

(assert (= (and b!357139 condMapEmpty!13596) mapIsEmpty!13596))

(assert (= (and b!357139 (not condMapEmpty!13596)) mapNonEmpty!13596))

(get-info :version)

(assert (= (and mapNonEmpty!13596 ((_ is ValueCellFull!3686) mapValue!13596)) b!357138))

(assert (= (and b!357139 ((_ is ValueCellFull!3686) mapDefault!13596)) b!357137))

(assert (= start!35592 b!357139))

(declare-fun m!355557 () Bool)

(assert (=> b!357142 m!355557))

(declare-fun m!355559 () Bool)

(assert (=> b!357141 m!355559))

(declare-fun m!355561 () Bool)

(assert (=> b!357140 m!355561))

(declare-fun m!355563 () Bool)

(assert (=> b!357133 m!355563))

(declare-fun m!355565 () Bool)

(assert (=> mapNonEmpty!13596 m!355565))

(declare-fun m!355567 () Bool)

(assert (=> b!357143 m!355567))

(declare-fun m!355569 () Bool)

(assert (=> b!357143 m!355569))

(declare-fun m!355571 () Bool)

(assert (=> start!35592 m!355571))

(declare-fun m!355573 () Bool)

(assert (=> start!35592 m!355573))

(declare-fun m!355575 () Bool)

(assert (=> start!35592 m!355575))

(declare-fun m!355577 () Bool)

(assert (=> b!357134 m!355577))

(check-sat (not b!357133) (not b!357141) (not b!357140) (not b!357142) (not mapNonEmpty!13596) tp_is_empty!8059 (not b!357143) (not start!35592))
(check-sat)
