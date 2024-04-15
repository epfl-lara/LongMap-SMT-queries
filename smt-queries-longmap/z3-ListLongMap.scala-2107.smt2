; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35796 () Bool)

(assert start!35796)

(declare-fun mapNonEmpty!13902 () Bool)

(declare-fun mapRes!13902 () Bool)

(declare-fun tp!27969 () Bool)

(declare-fun e!220173 () Bool)

(assert (=> mapNonEmpty!13902 (= mapRes!13902 (and tp!27969 e!220173))))

(declare-datatypes ((V!11995 0))(
  ( (V!11996 (val!4176 Int)) )
))
(declare-datatypes ((ValueCell!3788 0))(
  ( (ValueCellFull!3788 (v!6364 V!11995)) (EmptyCell!3788) )
))
(declare-fun mapRest!13902 () (Array (_ BitVec 32) ValueCell!3788))

(declare-fun mapKey!13902 () (_ BitVec 32))

(declare-datatypes ((array!20053 0))(
  ( (array!20054 (arr!9520 (Array (_ BitVec 32) ValueCell!3788)) (size!9873 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20053)

(declare-fun mapValue!13902 () ValueCell!3788)

(assert (=> mapNonEmpty!13902 (= (arr!9520 _values!1208) (store mapRest!13902 mapKey!13902 mapValue!13902))))

(declare-fun b!359414 () Bool)

(declare-fun res!199785 () Bool)

(declare-fun e!220176 () Bool)

(assert (=> b!359414 (=> (not res!199785) (not e!220176))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359414 (= res!199785 (validKeyInArray!0 k0!1077))))

(declare-fun b!359415 () Bool)

(declare-fun e!220175 () Bool)

(declare-fun e!220174 () Bool)

(assert (=> b!359415 (= e!220175 (and e!220174 mapRes!13902))))

(declare-fun condMapEmpty!13902 () Bool)

(declare-fun mapDefault!13902 () ValueCell!3788)

(assert (=> b!359415 (= condMapEmpty!13902 (= (arr!9520 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3788)) mapDefault!13902)))))

(declare-fun b!359416 () Bool)

(declare-fun tp_is_empty!8263 () Bool)

(assert (=> b!359416 (= e!220174 tp_is_empty!8263)))

(declare-fun b!359417 () Bool)

(declare-fun res!199781 () Bool)

(assert (=> b!359417 (=> (not res!199781) (not e!220176))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20055 0))(
  ( (array!20056 (arr!9521 (Array (_ BitVec 32) (_ BitVec 64))) (size!9874 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20055)

(assert (=> b!359417 (= res!199781 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9874 _keys!1456))))))

(declare-fun b!359418 () Bool)

(assert (=> b!359418 (= e!220173 tp_is_empty!8263)))

(declare-fun b!359413 () Bool)

(declare-fun res!199783 () Bool)

(assert (=> b!359413 (=> (not res!199783) (not e!220176))))

(declare-fun arrayContainsKey!0 (array!20055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359413 (= res!199783 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!199784 () Bool)

(assert (=> start!35796 (=> (not res!199784) (not e!220176))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35796 (= res!199784 (validMask!0 mask!1842))))

(assert (=> start!35796 e!220176))

(assert (=> start!35796 tp_is_empty!8263))

(assert (=> start!35796 true))

(declare-fun array_inv!7022 (array!20055) Bool)

(assert (=> start!35796 (array_inv!7022 _keys!1456)))

(declare-fun array_inv!7023 (array!20053) Bool)

(assert (=> start!35796 (and (array_inv!7023 _values!1208) e!220175)))

(declare-fun b!359419 () Bool)

(declare-fun res!199786 () Bool)

(assert (=> b!359419 (=> (not res!199786) (not e!220176))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359419 (= res!199786 (and (= (size!9873 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9874 _keys!1456) (size!9873 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359420 () Bool)

(declare-fun res!199782 () Bool)

(assert (=> b!359420 (=> (not res!199782) (not e!220176))))

(declare-datatypes ((List!5441 0))(
  ( (Nil!5438) (Cons!5437 (h!6293 (_ BitVec 64)) (t!10582 List!5441)) )
))
(declare-fun arrayNoDuplicates!0 (array!20055 (_ BitVec 32) List!5441) Bool)

(assert (=> b!359420 (= res!199782 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5438))))

(declare-fun b!359421 () Bool)

(assert (=> b!359421 (= e!220176 (not true))))

(assert (=> b!359421 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11995)

(declare-datatypes ((Unit!11036 0))(
  ( (Unit!11037) )
))
(declare-fun lt!166147 () Unit!11036)

(declare-fun zeroValue!1150 () V!11995)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!41 (array!20055 array!20053 (_ BitVec 32) (_ BitVec 32) V!11995 V!11995 (_ BitVec 64) (_ BitVec 32)) Unit!11036)

(assert (=> b!359421 (= lt!166147 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!41 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13902 () Bool)

(assert (=> mapIsEmpty!13902 mapRes!13902))

(declare-fun b!359422 () Bool)

(declare-fun res!199779 () Bool)

(assert (=> b!359422 (=> (not res!199779) (not e!220176))))

(assert (=> b!359422 (= res!199779 (not (= (select (arr!9521 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359423 () Bool)

(declare-fun res!199780 () Bool)

(assert (=> b!359423 (=> (not res!199780) (not e!220176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20055 (_ BitVec 32)) Bool)

(assert (=> b!359423 (= res!199780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35796 res!199784) b!359419))

(assert (= (and b!359419 res!199786) b!359423))

(assert (= (and b!359423 res!199780) b!359420))

(assert (= (and b!359420 res!199782) b!359414))

(assert (= (and b!359414 res!199785) b!359417))

(assert (= (and b!359417 res!199781) b!359413))

(assert (= (and b!359413 res!199783) b!359422))

(assert (= (and b!359422 res!199779) b!359421))

(assert (= (and b!359415 condMapEmpty!13902) mapIsEmpty!13902))

(assert (= (and b!359415 (not condMapEmpty!13902)) mapNonEmpty!13902))

(get-info :version)

(assert (= (and mapNonEmpty!13902 ((_ is ValueCellFull!3788) mapValue!13902)) b!359418))

(assert (= (and b!359415 ((_ is ValueCellFull!3788) mapDefault!13902)) b!359416))

(assert (= start!35796 b!359415))

(declare-fun m!356373 () Bool)

(assert (=> b!359413 m!356373))

(declare-fun m!356375 () Bool)

(assert (=> b!359423 m!356375))

(declare-fun m!356377 () Bool)

(assert (=> b!359420 m!356377))

(declare-fun m!356379 () Bool)

(assert (=> mapNonEmpty!13902 m!356379))

(declare-fun m!356381 () Bool)

(assert (=> b!359422 m!356381))

(declare-fun m!356383 () Bool)

(assert (=> b!359414 m!356383))

(declare-fun m!356385 () Bool)

(assert (=> start!35796 m!356385))

(declare-fun m!356387 () Bool)

(assert (=> start!35796 m!356387))

(declare-fun m!356389 () Bool)

(assert (=> start!35796 m!356389))

(declare-fun m!356391 () Bool)

(assert (=> b!359421 m!356391))

(declare-fun m!356393 () Bool)

(assert (=> b!359421 m!356393))

(check-sat tp_is_empty!8263 (not b!359421) (not b!359414) (not b!359413) (not start!35796) (not b!359420) (not b!359423) (not mapNonEmpty!13902))
(check-sat)
