; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35652 () Bool)

(assert start!35652)

(declare-fun b!358202 () Bool)

(declare-fun res!199121 () Bool)

(declare-fun e!219237 () Bool)

(assert (=> b!358202 (=> (not res!199121) (not e!219237))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19788 0))(
  ( (array!19789 (arr!9387 (Array (_ BitVec 32) (_ BitVec 64))) (size!9739 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19788)

(declare-datatypes ((V!11803 0))(
  ( (V!11804 (val!4104 Int)) )
))
(declare-datatypes ((ValueCell!3716 0))(
  ( (ValueCellFull!3716 (v!6299 V!11803)) (EmptyCell!3716) )
))
(declare-datatypes ((array!19790 0))(
  ( (array!19791 (arr!9388 (Array (_ BitVec 32) ValueCell!3716)) (size!9740 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19790)

(assert (=> b!358202 (= res!199121 (and (= (size!9740 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9739 _keys!1456) (size!9740 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358203 () Bool)

(declare-fun res!199126 () Bool)

(assert (=> b!358203 (=> (not res!199126) (not e!219237))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!358203 (= res!199126 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9739 _keys!1456))))))

(declare-fun b!358204 () Bool)

(assert (=> b!358204 (= e!219237 (bvslt (bvsub (size!9739 _keys!1456) from!1805) #b00000000000000000000000000000000))))

(declare-fun b!358205 () Bool)

(declare-fun e!219238 () Bool)

(declare-fun e!219235 () Bool)

(declare-fun mapRes!13686 () Bool)

(assert (=> b!358205 (= e!219238 (and e!219235 mapRes!13686))))

(declare-fun condMapEmpty!13686 () Bool)

(declare-fun mapDefault!13686 () ValueCell!3716)

(assert (=> b!358205 (= condMapEmpty!13686 (= (arr!9388 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3716)) mapDefault!13686)))))

(declare-fun b!358206 () Bool)

(declare-fun e!219236 () Bool)

(declare-fun tp_is_empty!8119 () Bool)

(assert (=> b!358206 (= e!219236 tp_is_empty!8119)))

(declare-fun res!199123 () Bool)

(assert (=> start!35652 (=> (not res!199123) (not e!219237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35652 (= res!199123 (validMask!0 mask!1842))))

(assert (=> start!35652 e!219237))

(assert (=> start!35652 true))

(declare-fun array_inv!6938 (array!19788) Bool)

(assert (=> start!35652 (array_inv!6938 _keys!1456)))

(declare-fun array_inv!6939 (array!19790) Bool)

(assert (=> start!35652 (and (array_inv!6939 _values!1208) e!219238)))

(declare-fun mapIsEmpty!13686 () Bool)

(assert (=> mapIsEmpty!13686 mapRes!13686))

(declare-fun b!358207 () Bool)

(assert (=> b!358207 (= e!219235 tp_is_empty!8119)))

(declare-fun b!358208 () Bool)

(declare-fun res!199124 () Bool)

(assert (=> b!358208 (=> (not res!199124) (not e!219237))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358208 (= res!199124 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13686 () Bool)

(declare-fun tp!27744 () Bool)

(assert (=> mapNonEmpty!13686 (= mapRes!13686 (and tp!27744 e!219236))))

(declare-fun mapKey!13686 () (_ BitVec 32))

(declare-fun mapRest!13686 () (Array (_ BitVec 32) ValueCell!3716))

(declare-fun mapValue!13686 () ValueCell!3716)

(assert (=> mapNonEmpty!13686 (= (arr!9388 _values!1208) (store mapRest!13686 mapKey!13686 mapValue!13686))))

(declare-fun b!358209 () Bool)

(declare-fun res!199120 () Bool)

(assert (=> b!358209 (=> (not res!199120) (not e!219237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358209 (= res!199120 (validKeyInArray!0 k0!1077))))

(declare-fun b!358210 () Bool)

(declare-fun res!199122 () Bool)

(assert (=> b!358210 (=> (not res!199122) (not e!219237))))

(declare-datatypes ((List!5335 0))(
  ( (Nil!5332) (Cons!5331 (h!6187 (_ BitVec 64)) (t!10477 List!5335)) )
))
(declare-fun arrayNoDuplicates!0 (array!19788 (_ BitVec 32) List!5335) Bool)

(assert (=> b!358210 (= res!199122 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5332))))

(declare-fun b!358211 () Bool)

(declare-fun res!199125 () Bool)

(assert (=> b!358211 (=> (not res!199125) (not e!219237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19788 (_ BitVec 32)) Bool)

(assert (=> b!358211 (= res!199125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35652 res!199123) b!358202))

(assert (= (and b!358202 res!199121) b!358211))

(assert (= (and b!358211 res!199125) b!358210))

(assert (= (and b!358210 res!199122) b!358209))

(assert (= (and b!358209 res!199120) b!358203))

(assert (= (and b!358203 res!199126) b!358208))

(assert (= (and b!358208 res!199124) b!358204))

(assert (= (and b!358205 condMapEmpty!13686) mapIsEmpty!13686))

(assert (= (and b!358205 (not condMapEmpty!13686)) mapNonEmpty!13686))

(get-info :version)

(assert (= (and mapNonEmpty!13686 ((_ is ValueCellFull!3716) mapValue!13686)) b!358206))

(assert (= (and b!358205 ((_ is ValueCellFull!3716) mapDefault!13686)) b!358207))

(assert (= start!35652 b!358205))

(declare-fun m!356379 () Bool)

(assert (=> mapNonEmpty!13686 m!356379))

(declare-fun m!356381 () Bool)

(assert (=> b!358210 m!356381))

(declare-fun m!356383 () Bool)

(assert (=> b!358209 m!356383))

(declare-fun m!356385 () Bool)

(assert (=> b!358208 m!356385))

(declare-fun m!356387 () Bool)

(assert (=> b!358211 m!356387))

(declare-fun m!356389 () Bool)

(assert (=> start!35652 m!356389))

(declare-fun m!356391 () Bool)

(assert (=> start!35652 m!356391))

(declare-fun m!356393 () Bool)

(assert (=> start!35652 m!356393))

(check-sat (not start!35652) tp_is_empty!8119 (not b!358211) (not b!358208) (not b!358209) (not mapNonEmpty!13686) (not b!358210))
(check-sat)
