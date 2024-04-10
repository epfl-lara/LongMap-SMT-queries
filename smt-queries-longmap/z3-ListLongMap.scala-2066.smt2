; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35566 () Bool)

(assert start!35566)

(declare-fun b!356526 () Bool)

(declare-fun res!197851 () Bool)

(declare-fun e!218441 () Bool)

(assert (=> b!356526 (=> (not res!197851) (not e!218441))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19607 0))(
  ( (array!19608 (arr!9297 (Array (_ BitVec 32) (_ BitVec 64))) (size!9649 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19607)

(declare-datatypes ((V!11669 0))(
  ( (V!11670 (val!4054 Int)) )
))
(declare-datatypes ((ValueCell!3666 0))(
  ( (ValueCellFull!3666 (v!6248 V!11669)) (EmptyCell!3666) )
))
(declare-datatypes ((array!19609 0))(
  ( (array!19610 (arr!9298 (Array (_ BitVec 32) ValueCell!3666)) (size!9650 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19609)

(assert (=> b!356526 (= res!197851 (and (= (size!9650 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9649 _keys!1456) (size!9650 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356527 () Bool)

(declare-fun res!197848 () Bool)

(assert (=> b!356527 (=> (not res!197848) (not e!218441))))

(declare-datatypes ((List!5371 0))(
  ( (Nil!5368) (Cons!5367 (h!6223 (_ BitVec 64)) (t!10521 List!5371)) )
))
(declare-fun arrayNoDuplicates!0 (array!19607 (_ BitVec 32) List!5371) Bool)

(assert (=> b!356527 (= res!197848 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5368))))

(declare-fun b!356528 () Bool)

(declare-fun e!218437 () Bool)

(declare-fun tp_is_empty!8019 () Bool)

(assert (=> b!356528 (= e!218437 tp_is_empty!8019)))

(declare-fun b!356529 () Bool)

(declare-fun res!197847 () Bool)

(assert (=> b!356529 (=> (not res!197847) (not e!218441))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356529 (= res!197847 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9649 _keys!1456))))))

(declare-fun b!356530 () Bool)

(declare-fun e!218438 () Bool)

(assert (=> b!356530 (= e!218438 tp_is_empty!8019)))

(declare-fun b!356531 () Bool)

(assert (=> b!356531 (= e!218441 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356531 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!10974 0))(
  ( (Unit!10975) )
))
(declare-fun lt!165944 () Unit!10974)

(declare-fun minValue!1150 () V!11669)

(declare-fun zeroValue!1150 () V!11669)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!6 (array!19607 array!19609 (_ BitVec 32) (_ BitVec 32) V!11669 V!11669 (_ BitVec 64) (_ BitVec 32)) Unit!10974)

(assert (=> b!356531 (= lt!165944 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!6 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356532 () Bool)

(declare-fun res!197844 () Bool)

(assert (=> b!356532 (=> (not res!197844) (not e!218441))))

(assert (=> b!356532 (= res!197844 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356533 () Bool)

(declare-fun e!218440 () Bool)

(declare-fun mapRes!13536 () Bool)

(assert (=> b!356533 (= e!218440 (and e!218438 mapRes!13536))))

(declare-fun condMapEmpty!13536 () Bool)

(declare-fun mapDefault!13536 () ValueCell!3666)

(assert (=> b!356533 (= condMapEmpty!13536 (= (arr!9298 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3666)) mapDefault!13536)))))

(declare-fun b!356534 () Bool)

(declare-fun res!197849 () Bool)

(assert (=> b!356534 (=> (not res!197849) (not e!218441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356534 (= res!197849 (validKeyInArray!0 k0!1077))))

(declare-fun b!356535 () Bool)

(declare-fun res!197850 () Bool)

(assert (=> b!356535 (=> (not res!197850) (not e!218441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19607 (_ BitVec 32)) Bool)

(assert (=> b!356535 (= res!197850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356536 () Bool)

(declare-fun res!197846 () Bool)

(assert (=> b!356536 (=> (not res!197846) (not e!218441))))

(assert (=> b!356536 (= res!197846 (not (= (select (arr!9297 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!13536 () Bool)

(declare-fun tp!27513 () Bool)

(assert (=> mapNonEmpty!13536 (= mapRes!13536 (and tp!27513 e!218437))))

(declare-fun mapValue!13536 () ValueCell!3666)

(declare-fun mapRest!13536 () (Array (_ BitVec 32) ValueCell!3666))

(declare-fun mapKey!13536 () (_ BitVec 32))

(assert (=> mapNonEmpty!13536 (= (arr!9298 _values!1208) (store mapRest!13536 mapKey!13536 mapValue!13536))))

(declare-fun res!197845 () Bool)

(assert (=> start!35566 (=> (not res!197845) (not e!218441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35566 (= res!197845 (validMask!0 mask!1842))))

(assert (=> start!35566 e!218441))

(assert (=> start!35566 tp_is_empty!8019))

(assert (=> start!35566 true))

(declare-fun array_inv!6832 (array!19607) Bool)

(assert (=> start!35566 (array_inv!6832 _keys!1456)))

(declare-fun array_inv!6833 (array!19609) Bool)

(assert (=> start!35566 (and (array_inv!6833 _values!1208) e!218440)))

(declare-fun mapIsEmpty!13536 () Bool)

(assert (=> mapIsEmpty!13536 mapRes!13536))

(assert (= (and start!35566 res!197845) b!356526))

(assert (= (and b!356526 res!197851) b!356535))

(assert (= (and b!356535 res!197850) b!356527))

(assert (= (and b!356527 res!197848) b!356534))

(assert (= (and b!356534 res!197849) b!356529))

(assert (= (and b!356529 res!197847) b!356532))

(assert (= (and b!356532 res!197844) b!356536))

(assert (= (and b!356536 res!197846) b!356531))

(assert (= (and b!356533 condMapEmpty!13536) mapIsEmpty!13536))

(assert (= (and b!356533 (not condMapEmpty!13536)) mapNonEmpty!13536))

(get-info :version)

(assert (= (and mapNonEmpty!13536 ((_ is ValueCellFull!3666) mapValue!13536)) b!356528))

(assert (= (and b!356533 ((_ is ValueCellFull!3666) mapDefault!13536)) b!356530))

(assert (= start!35566 b!356533))

(declare-fun m!354893 () Bool)

(assert (=> b!356534 m!354893))

(declare-fun m!354895 () Bool)

(assert (=> start!35566 m!354895))

(declare-fun m!354897 () Bool)

(assert (=> start!35566 m!354897))

(declare-fun m!354899 () Bool)

(assert (=> start!35566 m!354899))

(declare-fun m!354901 () Bool)

(assert (=> b!356532 m!354901))

(declare-fun m!354903 () Bool)

(assert (=> b!356531 m!354903))

(declare-fun m!354905 () Bool)

(assert (=> b!356531 m!354905))

(declare-fun m!354907 () Bool)

(assert (=> b!356536 m!354907))

(declare-fun m!354909 () Bool)

(assert (=> b!356535 m!354909))

(declare-fun m!354911 () Bool)

(assert (=> mapNonEmpty!13536 m!354911))

(declare-fun m!354913 () Bool)

(assert (=> b!356527 m!354913))

(check-sat (not b!356535) (not b!356532) (not start!35566) (not mapNonEmpty!13536) tp_is_empty!8019 (not b!356527) (not b!356531) (not b!356534))
(check-sat)
