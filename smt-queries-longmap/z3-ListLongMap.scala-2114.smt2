; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35854 () Bool)

(assert start!35854)

(declare-fun b!360414 () Bool)

(declare-fun e!220680 () Bool)

(declare-fun tp_is_empty!8307 () Bool)

(assert (=> b!360414 (= e!220680 tp_is_empty!8307)))

(declare-fun b!360415 () Bool)

(declare-fun e!220682 () Bool)

(declare-fun e!220678 () Bool)

(declare-fun mapRes!13968 () Bool)

(assert (=> b!360415 (= e!220682 (and e!220678 mapRes!13968))))

(declare-fun condMapEmpty!13968 () Bool)

(declare-datatypes ((V!12053 0))(
  ( (V!12054 (val!4198 Int)) )
))
(declare-datatypes ((ValueCell!3810 0))(
  ( (ValueCellFull!3810 (v!6392 V!12053)) (EmptyCell!3810) )
))
(declare-datatypes ((array!20165 0))(
  ( (array!20166 (arr!9576 (Array (_ BitVec 32) ValueCell!3810)) (size!9928 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20165)

(declare-fun mapDefault!13968 () ValueCell!3810)

(assert (=> b!360415 (= condMapEmpty!13968 (= (arr!9576 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3810)) mapDefault!13968)))))

(declare-fun b!360416 () Bool)

(assert (=> b!360416 (= e!220678 tp_is_empty!8307)))

(declare-fun b!360417 () Bool)

(declare-fun res!200440 () Bool)

(declare-fun e!220681 () Bool)

(assert (=> b!360417 (=> (not res!200440) (not e!220681))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20167 0))(
  ( (array!20168 (arr!9577 (Array (_ BitVec 32) (_ BitVec 64))) (size!9929 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20167)

(assert (=> b!360417 (= res!200440 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9929 _keys!1456))))))

(declare-fun b!360418 () Bool)

(declare-fun res!200438 () Bool)

(assert (=> b!360418 (=> (not res!200438) (not e!220681))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!360418 (= res!200438 (and (= (size!9928 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9929 _keys!1456) (size!9928 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13968 () Bool)

(assert (=> mapIsEmpty!13968 mapRes!13968))

(declare-fun b!360419 () Bool)

(declare-fun res!200436 () Bool)

(assert (=> b!360419 (=> (not res!200436) (not e!220681))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!360419 (= res!200436 (not (= (select (arr!9577 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!200441 () Bool)

(assert (=> start!35854 (=> (not res!200441) (not e!220681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35854 (= res!200441 (validMask!0 mask!1842))))

(assert (=> start!35854 e!220681))

(assert (=> start!35854 tp_is_empty!8307))

(assert (=> start!35854 true))

(declare-fun array_inv!7044 (array!20167) Bool)

(assert (=> start!35854 (array_inv!7044 _keys!1456)))

(declare-fun array_inv!7045 (array!20165) Bool)

(assert (=> start!35854 (and (array_inv!7045 _values!1208) e!220682)))

(declare-fun mapNonEmpty!13968 () Bool)

(declare-fun tp!28035 () Bool)

(assert (=> mapNonEmpty!13968 (= mapRes!13968 (and tp!28035 e!220680))))

(declare-fun mapRest!13968 () (Array (_ BitVec 32) ValueCell!3810))

(declare-fun mapValue!13968 () ValueCell!3810)

(declare-fun mapKey!13968 () (_ BitVec 32))

(assert (=> mapNonEmpty!13968 (= (arr!9576 _values!1208) (store mapRest!13968 mapKey!13968 mapValue!13968))))

(declare-fun b!360420 () Bool)

(assert (=> b!360420 (= e!220681 (not true))))

(declare-fun arrayContainsKey!0 (array!20167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360420 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12053)

(declare-datatypes ((Unit!11086 0))(
  ( (Unit!11087) )
))
(declare-fun lt!166448 () Unit!11086)

(declare-fun zeroValue!1150 () V!12053)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!58 (array!20167 array!20165 (_ BitVec 32) (_ BitVec 32) V!12053 V!12053 (_ BitVec 64) (_ BitVec 32)) Unit!11086)

(assert (=> b!360420 (= lt!166448 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!58 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360421 () Bool)

(declare-fun res!200437 () Bool)

(assert (=> b!360421 (=> (not res!200437) (not e!220681))))

(declare-datatypes ((List!5488 0))(
  ( (Nil!5485) (Cons!5484 (h!6340 (_ BitVec 64)) (t!10638 List!5488)) )
))
(declare-fun arrayNoDuplicates!0 (array!20167 (_ BitVec 32) List!5488) Bool)

(assert (=> b!360421 (= res!200437 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5485))))

(declare-fun b!360422 () Bool)

(declare-fun res!200442 () Bool)

(assert (=> b!360422 (=> (not res!200442) (not e!220681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20167 (_ BitVec 32)) Bool)

(assert (=> b!360422 (= res!200442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360423 () Bool)

(declare-fun res!200443 () Bool)

(assert (=> b!360423 (=> (not res!200443) (not e!220681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360423 (= res!200443 (validKeyInArray!0 k0!1077))))

(declare-fun b!360424 () Bool)

(declare-fun res!200439 () Bool)

(assert (=> b!360424 (=> (not res!200439) (not e!220681))))

(assert (=> b!360424 (= res!200439 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35854 res!200441) b!360418))

(assert (= (and b!360418 res!200438) b!360422))

(assert (= (and b!360422 res!200442) b!360421))

(assert (= (and b!360421 res!200437) b!360423))

(assert (= (and b!360423 res!200443) b!360417))

(assert (= (and b!360417 res!200440) b!360424))

(assert (= (and b!360424 res!200439) b!360419))

(assert (= (and b!360419 res!200436) b!360420))

(assert (= (and b!360415 condMapEmpty!13968) mapIsEmpty!13968))

(assert (= (and b!360415 (not condMapEmpty!13968)) mapNonEmpty!13968))

(get-info :version)

(assert (= (and mapNonEmpty!13968 ((_ is ValueCellFull!3810) mapValue!13968)) b!360414))

(assert (= (and b!360415 ((_ is ValueCellFull!3810) mapDefault!13968)) b!360416))

(assert (= start!35854 b!360415))

(declare-fun m!357587 () Bool)

(assert (=> b!360423 m!357587))

(declare-fun m!357589 () Bool)

(assert (=> b!360422 m!357589))

(declare-fun m!357591 () Bool)

(assert (=> b!360424 m!357591))

(declare-fun m!357593 () Bool)

(assert (=> mapNonEmpty!13968 m!357593))

(declare-fun m!357595 () Bool)

(assert (=> start!35854 m!357595))

(declare-fun m!357597 () Bool)

(assert (=> start!35854 m!357597))

(declare-fun m!357599 () Bool)

(assert (=> start!35854 m!357599))

(declare-fun m!357601 () Bool)

(assert (=> b!360420 m!357601))

(declare-fun m!357603 () Bool)

(assert (=> b!360420 m!357603))

(declare-fun m!357605 () Bool)

(assert (=> b!360419 m!357605))

(declare-fun m!357607 () Bool)

(assert (=> b!360421 m!357607))

(check-sat tp_is_empty!8307 (not start!35854) (not mapNonEmpty!13968) (not b!360421) (not b!360424) (not b!360422) (not b!360423) (not b!360420))
(check-sat)
