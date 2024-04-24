; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35538 () Bool)

(assert start!35538)

(declare-fun b!356242 () Bool)

(declare-fun res!197677 () Bool)

(declare-fun e!218298 () Bool)

(assert (=> b!356242 (=> (not res!197677) (not e!218298))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19566 0))(
  ( (array!19567 (arr!9276 (Array (_ BitVec 32) (_ BitVec 64))) (size!9628 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19566)

(assert (=> b!356242 (= res!197677 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9628 _keys!1456))))))

(declare-fun b!356243 () Bool)

(declare-fun res!197673 () Bool)

(assert (=> b!356243 (=> (not res!197673) (not e!218298))))

(declare-datatypes ((List!5274 0))(
  ( (Nil!5271) (Cons!5270 (h!6126 (_ BitVec 64)) (t!10416 List!5274)) )
))
(declare-fun arrayNoDuplicates!0 (array!19566 (_ BitVec 32) List!5274) Bool)

(assert (=> b!356243 (= res!197673 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5271))))

(declare-fun b!356244 () Bool)

(declare-fun res!197679 () Bool)

(assert (=> b!356244 (=> (not res!197679) (not e!218298))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11651 0))(
  ( (V!11652 (val!4047 Int)) )
))
(declare-datatypes ((ValueCell!3659 0))(
  ( (ValueCellFull!3659 (v!6242 V!11651)) (EmptyCell!3659) )
))
(declare-datatypes ((array!19568 0))(
  ( (array!19569 (arr!9277 (Array (_ BitVec 32) ValueCell!3659)) (size!9629 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19568)

(assert (=> b!356244 (= res!197679 (and (= (size!9629 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9628 _keys!1456) (size!9629 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356245 () Bool)

(declare-fun res!197680 () Bool)

(assert (=> b!356245 (=> (not res!197680) (not e!218298))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356245 (= res!197680 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13515 () Bool)

(declare-fun mapRes!13515 () Bool)

(declare-fun tp!27492 () Bool)

(declare-fun e!218301 () Bool)

(assert (=> mapNonEmpty!13515 (= mapRes!13515 (and tp!27492 e!218301))))

(declare-fun mapValue!13515 () ValueCell!3659)

(declare-fun mapRest!13515 () (Array (_ BitVec 32) ValueCell!3659))

(declare-fun mapKey!13515 () (_ BitVec 32))

(assert (=> mapNonEmpty!13515 (= (arr!9277 _values!1208) (store mapRest!13515 mapKey!13515 mapValue!13515))))

(declare-fun b!356246 () Bool)

(declare-fun res!197676 () Bool)

(assert (=> b!356246 (=> (not res!197676) (not e!218298))))

(declare-fun arrayContainsKey!0 (array!19566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356246 (= res!197676 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356247 () Bool)

(declare-fun e!218300 () Bool)

(declare-fun tp_is_empty!8005 () Bool)

(assert (=> b!356247 (= e!218300 tp_is_empty!8005)))

(declare-fun b!356248 () Bool)

(declare-fun e!218299 () Bool)

(assert (=> b!356248 (= e!218299 (and e!218300 mapRes!13515))))

(declare-fun condMapEmpty!13515 () Bool)

(declare-fun mapDefault!13515 () ValueCell!3659)

(assert (=> b!356248 (= condMapEmpty!13515 (= (arr!9277 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3659)) mapDefault!13515)))))

(declare-fun res!197678 () Bool)

(assert (=> start!35538 (=> (not res!197678) (not e!218298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35538 (= res!197678 (validMask!0 mask!1842))))

(assert (=> start!35538 e!218298))

(assert (=> start!35538 tp_is_empty!8005))

(assert (=> start!35538 true))

(declare-fun array_inv!6856 (array!19566) Bool)

(assert (=> start!35538 (array_inv!6856 _keys!1456)))

(declare-fun array_inv!6857 (array!19568) Bool)

(assert (=> start!35538 (and (array_inv!6857 _values!1208) e!218299)))

(declare-fun b!356249 () Bool)

(assert (=> b!356249 (= e!218301 tp_is_empty!8005)))

(declare-fun mapIsEmpty!13515 () Bool)

(assert (=> mapIsEmpty!13515 mapRes!13515))

(declare-fun b!356250 () Bool)

(assert (=> b!356250 (= e!218298 (not true))))

(assert (=> b!356250 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!10949 0))(
  ( (Unit!10950) )
))
(declare-fun lt!165941 () Unit!10949)

(declare-fun minValue!1150 () V!11651)

(declare-fun zeroValue!1150 () V!11651)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!3 (array!19566 array!19568 (_ BitVec 32) (_ BitVec 32) V!11651 V!11651 (_ BitVec 64) (_ BitVec 32)) Unit!10949)

(assert (=> b!356250 (= lt!165941 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!3 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356251 () Bool)

(declare-fun res!197675 () Bool)

(assert (=> b!356251 (=> (not res!197675) (not e!218298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19566 (_ BitVec 32)) Bool)

(assert (=> b!356251 (= res!197675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356252 () Bool)

(declare-fun res!197674 () Bool)

(assert (=> b!356252 (=> (not res!197674) (not e!218298))))

(assert (=> b!356252 (= res!197674 (not (= (select (arr!9276 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35538 res!197678) b!356244))

(assert (= (and b!356244 res!197679) b!356251))

(assert (= (and b!356251 res!197675) b!356243))

(assert (= (and b!356243 res!197673) b!356245))

(assert (= (and b!356245 res!197680) b!356242))

(assert (= (and b!356242 res!197677) b!356246))

(assert (= (and b!356246 res!197676) b!356252))

(assert (= (and b!356252 res!197674) b!356250))

(assert (= (and b!356248 condMapEmpty!13515) mapIsEmpty!13515))

(assert (= (and b!356248 (not condMapEmpty!13515)) mapNonEmpty!13515))

(get-info :version)

(assert (= (and mapNonEmpty!13515 ((_ is ValueCellFull!3659) mapValue!13515)) b!356249))

(assert (= (and b!356248 ((_ is ValueCellFull!3659) mapDefault!13515)) b!356247))

(assert (= start!35538 b!356248))

(declare-fun m!354963 () Bool)

(assert (=> b!356252 m!354963))

(declare-fun m!354965 () Bool)

(assert (=> b!356246 m!354965))

(declare-fun m!354967 () Bool)

(assert (=> b!356250 m!354967))

(declare-fun m!354969 () Bool)

(assert (=> b!356250 m!354969))

(declare-fun m!354971 () Bool)

(assert (=> start!35538 m!354971))

(declare-fun m!354973 () Bool)

(assert (=> start!35538 m!354973))

(declare-fun m!354975 () Bool)

(assert (=> start!35538 m!354975))

(declare-fun m!354977 () Bool)

(assert (=> b!356243 m!354977))

(declare-fun m!354979 () Bool)

(assert (=> b!356251 m!354979))

(declare-fun m!354981 () Bool)

(assert (=> b!356245 m!354981))

(declare-fun m!354983 () Bool)

(assert (=> mapNonEmpty!13515 m!354983))

(check-sat tp_is_empty!8005 (not b!356250) (not b!356246) (not b!356243) (not b!356245) (not mapNonEmpty!13515) (not b!356251) (not start!35538))
(check-sat)
