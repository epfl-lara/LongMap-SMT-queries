; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35652 () Bool)

(assert start!35652)

(declare-fun b!357980 () Bool)

(declare-fun e!219094 () Bool)

(declare-fun tp_is_empty!8119 () Bool)

(assert (=> b!357980 (= e!219094 tp_is_empty!8119)))

(declare-fun b!357981 () Bool)

(declare-fun res!198994 () Bool)

(declare-fun e!219092 () Bool)

(assert (=> b!357981 (=> (not res!198994) (not e!219092))))

(declare-datatypes ((array!19789 0))(
  ( (array!19790 (arr!9388 (Array (_ BitVec 32) (_ BitVec 64))) (size!9741 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19789)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19789 (_ BitVec 32)) Bool)

(assert (=> b!357981 (= res!198994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!198995 () Bool)

(assert (=> start!35652 (=> (not res!198995) (not e!219092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35652 (= res!198995 (validMask!0 mask!1842))))

(assert (=> start!35652 e!219092))

(assert (=> start!35652 true))

(declare-fun array_inv!6926 (array!19789) Bool)

(assert (=> start!35652 (array_inv!6926 _keys!1456)))

(declare-datatypes ((V!11803 0))(
  ( (V!11804 (val!4104 Int)) )
))
(declare-datatypes ((ValueCell!3716 0))(
  ( (ValueCellFull!3716 (v!6292 V!11803)) (EmptyCell!3716) )
))
(declare-datatypes ((array!19791 0))(
  ( (array!19792 (arr!9389 (Array (_ BitVec 32) ValueCell!3716)) (size!9742 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19791)

(declare-fun e!219095 () Bool)

(declare-fun array_inv!6927 (array!19791) Bool)

(assert (=> start!35652 (and (array_inv!6927 _values!1208) e!219095)))

(declare-fun b!357982 () Bool)

(declare-fun res!198998 () Bool)

(assert (=> b!357982 (=> (not res!198998) (not e!219092))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357982 (= res!198998 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9741 _keys!1456))))))

(declare-fun b!357983 () Bool)

(declare-fun res!199000 () Bool)

(assert (=> b!357983 (=> (not res!199000) (not e!219092))))

(declare-datatypes ((List!5391 0))(
  ( (Nil!5388) (Cons!5387 (h!6243 (_ BitVec 64)) (t!10532 List!5391)) )
))
(declare-fun arrayNoDuplicates!0 (array!19789 (_ BitVec 32) List!5391) Bool)

(assert (=> b!357983 (= res!199000 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5388))))

(declare-fun b!357984 () Bool)

(declare-fun res!198999 () Bool)

(assert (=> b!357984 (=> (not res!198999) (not e!219092))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357984 (= res!198999 (and (= (size!9742 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9741 _keys!1456) (size!9742 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357985 () Bool)

(declare-fun res!198996 () Bool)

(assert (=> b!357985 (=> (not res!198996) (not e!219092))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357985 (= res!198996 (validKeyInArray!0 k0!1077))))

(declare-fun b!357986 () Bool)

(declare-fun e!219093 () Bool)

(assert (=> b!357986 (= e!219093 tp_is_empty!8119)))

(declare-fun mapNonEmpty!13686 () Bool)

(declare-fun mapRes!13686 () Bool)

(declare-fun tp!27744 () Bool)

(assert (=> mapNonEmpty!13686 (= mapRes!13686 (and tp!27744 e!219094))))

(declare-fun mapValue!13686 () ValueCell!3716)

(declare-fun mapKey!13686 () (_ BitVec 32))

(declare-fun mapRest!13686 () (Array (_ BitVec 32) ValueCell!3716))

(assert (=> mapNonEmpty!13686 (= (arr!9389 _values!1208) (store mapRest!13686 mapKey!13686 mapValue!13686))))

(declare-fun mapIsEmpty!13686 () Bool)

(assert (=> mapIsEmpty!13686 mapRes!13686))

(declare-fun b!357987 () Bool)

(assert (=> b!357987 (= e!219095 (and e!219093 mapRes!13686))))

(declare-fun condMapEmpty!13686 () Bool)

(declare-fun mapDefault!13686 () ValueCell!3716)

(assert (=> b!357987 (= condMapEmpty!13686 (= (arr!9389 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3716)) mapDefault!13686)))))

(declare-fun b!357988 () Bool)

(declare-fun res!198997 () Bool)

(assert (=> b!357988 (=> (not res!198997) (not e!219092))))

(declare-fun arrayContainsKey!0 (array!19789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357988 (= res!198997 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357989 () Bool)

(assert (=> b!357989 (= e!219092 (bvslt (bvsub (size!9741 _keys!1456) from!1805) #b00000000000000000000000000000000))))

(assert (= (and start!35652 res!198995) b!357984))

(assert (= (and b!357984 res!198999) b!357981))

(assert (= (and b!357981 res!198994) b!357983))

(assert (= (and b!357983 res!199000) b!357985))

(assert (= (and b!357985 res!198996) b!357982))

(assert (= (and b!357982 res!198998) b!357988))

(assert (= (and b!357988 res!198997) b!357989))

(assert (= (and b!357987 condMapEmpty!13686) mapIsEmpty!13686))

(assert (= (and b!357987 (not condMapEmpty!13686)) mapNonEmpty!13686))

(get-info :version)

(assert (= (and mapNonEmpty!13686 ((_ is ValueCellFull!3716) mapValue!13686)) b!357980))

(assert (= (and b!357987 ((_ is ValueCellFull!3716) mapDefault!13686)) b!357986))

(assert (= start!35652 b!357987))

(declare-fun m!355425 () Bool)

(assert (=> b!357985 m!355425))

(declare-fun m!355427 () Bool)

(assert (=> b!357988 m!355427))

(declare-fun m!355429 () Bool)

(assert (=> b!357981 m!355429))

(declare-fun m!355431 () Bool)

(assert (=> b!357983 m!355431))

(declare-fun m!355433 () Bool)

(assert (=> mapNonEmpty!13686 m!355433))

(declare-fun m!355435 () Bool)

(assert (=> start!35652 m!355435))

(declare-fun m!355437 () Bool)

(assert (=> start!35652 m!355437))

(declare-fun m!355439 () Bool)

(assert (=> start!35652 m!355439))

(check-sat (not b!357988) (not mapNonEmpty!13686) (not b!357985) (not b!357981) tp_is_empty!8119 (not start!35652) (not b!357983))
(check-sat)
