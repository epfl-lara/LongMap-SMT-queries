; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83074 () Bool)

(assert start!83074)

(declare-fun b_free!19033 () Bool)

(declare-fun b_next!19033 () Bool)

(assert (=> start!83074 (= b_free!19033 (not b_next!19033))))

(declare-fun tp!66228 () Bool)

(declare-fun b_and!30531 () Bool)

(assert (=> start!83074 (= tp!66228 b_and!30531)))

(declare-fun mapIsEmpty!34756 () Bool)

(declare-fun mapRes!34756 () Bool)

(assert (=> mapIsEmpty!34756 mapRes!34756))

(declare-fun b!968287 () Bool)

(declare-fun e!545839 () Bool)

(declare-fun tp_is_empty!21841 () Bool)

(assert (=> b!968287 (= e!545839 tp_is_empty!21841)))

(declare-fun b!968288 () Bool)

(declare-fun res!647919 () Bool)

(declare-fun e!545843 () Bool)

(assert (=> b!968288 (=> (not res!647919) (not e!545843))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34105 0))(
  ( (V!34106 (val!10971 Int)) )
))
(declare-datatypes ((ValueCell!10439 0))(
  ( (ValueCellFull!10439 (v!13526 V!34105)) (EmptyCell!10439) )
))
(declare-datatypes ((array!59778 0))(
  ( (array!59779 (arr!28753 (Array (_ BitVec 32) ValueCell!10439)) (size!29233 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59778)

(declare-datatypes ((array!59780 0))(
  ( (array!59781 (arr!28754 (Array (_ BitVec 32) (_ BitVec 64))) (size!29234 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59780)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!968288 (= res!647919 (and (= (size!29233 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29234 _keys!1686) (size!29233 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968289 () Bool)

(assert (=> b!968289 (= e!545843 (not true))))

(declare-fun minValue!1342 () V!34105)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34105)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14100 0))(
  ( (tuple2!14101 (_1!7061 (_ BitVec 64)) (_2!7061 V!34105)) )
))
(declare-datatypes ((List!19946 0))(
  ( (Nil!19943) (Cons!19942 (h!21110 tuple2!14100) (t!28301 List!19946)) )
))
(declare-datatypes ((ListLongMap!12799 0))(
  ( (ListLongMap!12800 (toList!6415 List!19946)) )
))
(declare-fun contains!5527 (ListLongMap!12799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3648 (array!59780 array!59778 (_ BitVec 32) (_ BitVec 32) V!34105 V!34105 (_ BitVec 32) Int) ListLongMap!12799)

(assert (=> b!968289 (contains!5527 (getCurrentListMap!3648 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28754 _keys!1686) i!803))))

(declare-datatypes ((Unit!32284 0))(
  ( (Unit!32285) )
))
(declare-fun lt!431777 () Unit!32284)

(declare-fun lemmaInListMapFromThenInFromMinusOne!53 (array!59780 array!59778 (_ BitVec 32) (_ BitVec 32) V!34105 V!34105 (_ BitVec 32) (_ BitVec 32) Int) Unit!32284)

(assert (=> b!968289 (= lt!431777 (lemmaInListMapFromThenInFromMinusOne!53 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968290 () Bool)

(declare-fun e!545840 () Bool)

(assert (=> b!968290 (= e!545840 (and e!545839 mapRes!34756))))

(declare-fun condMapEmpty!34756 () Bool)

(declare-fun mapDefault!34756 () ValueCell!10439)

(assert (=> b!968290 (= condMapEmpty!34756 (= (arr!28753 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10439)) mapDefault!34756)))))

(declare-fun b!968291 () Bool)

(declare-fun res!647917 () Bool)

(assert (=> b!968291 (=> (not res!647917) (not e!545843))))

(assert (=> b!968291 (= res!647917 (contains!5527 (getCurrentListMap!3648 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28754 _keys!1686) i!803)))))

(declare-fun b!968286 () Bool)

(declare-fun res!647922 () Bool)

(assert (=> b!968286 (=> (not res!647922) (not e!545843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968286 (= res!647922 (validKeyInArray!0 (select (arr!28754 _keys!1686) i!803)))))

(declare-fun res!647921 () Bool)

(assert (=> start!83074 (=> (not res!647921) (not e!545843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83074 (= res!647921 (validMask!0 mask!2110))))

(assert (=> start!83074 e!545843))

(assert (=> start!83074 true))

(declare-fun array_inv!22321 (array!59778) Bool)

(assert (=> start!83074 (and (array_inv!22321 _values!1400) e!545840)))

(declare-fun array_inv!22322 (array!59780) Bool)

(assert (=> start!83074 (array_inv!22322 _keys!1686)))

(assert (=> start!83074 tp!66228))

(assert (=> start!83074 tp_is_empty!21841))

(declare-fun mapNonEmpty!34756 () Bool)

(declare-fun tp!66229 () Bool)

(declare-fun e!545841 () Bool)

(assert (=> mapNonEmpty!34756 (= mapRes!34756 (and tp!66229 e!545841))))

(declare-fun mapRest!34756 () (Array (_ BitVec 32) ValueCell!10439))

(declare-fun mapKey!34756 () (_ BitVec 32))

(declare-fun mapValue!34756 () ValueCell!10439)

(assert (=> mapNonEmpty!34756 (= (arr!28753 _values!1400) (store mapRest!34756 mapKey!34756 mapValue!34756))))

(declare-fun b!968292 () Bool)

(declare-fun res!647915 () Bool)

(assert (=> b!968292 (=> (not res!647915) (not e!545843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59780 (_ BitVec 32)) Bool)

(assert (=> b!968292 (= res!647915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968293 () Bool)

(assert (=> b!968293 (= e!545841 tp_is_empty!21841)))

(declare-fun b!968294 () Bool)

(declare-fun res!647916 () Bool)

(assert (=> b!968294 (=> (not res!647916) (not e!545843))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968294 (= res!647916 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29234 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29234 _keys!1686))))))

(declare-fun b!968295 () Bool)

(declare-fun res!647918 () Bool)

(assert (=> b!968295 (=> (not res!647918) (not e!545843))))

(assert (=> b!968295 (= res!647918 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968296 () Bool)

(declare-fun res!647920 () Bool)

(assert (=> b!968296 (=> (not res!647920) (not e!545843))))

(declare-datatypes ((List!19947 0))(
  ( (Nil!19944) (Cons!19943 (h!21111 (_ BitVec 64)) (t!28302 List!19947)) )
))
(declare-fun arrayNoDuplicates!0 (array!59780 (_ BitVec 32) List!19947) Bool)

(assert (=> b!968296 (= res!647920 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19944))))

(assert (= (and start!83074 res!647921) b!968288))

(assert (= (and b!968288 res!647919) b!968292))

(assert (= (and b!968292 res!647915) b!968296))

(assert (= (and b!968296 res!647920) b!968294))

(assert (= (and b!968294 res!647916) b!968286))

(assert (= (and b!968286 res!647922) b!968291))

(assert (= (and b!968291 res!647917) b!968295))

(assert (= (and b!968295 res!647918) b!968289))

(assert (= (and b!968290 condMapEmpty!34756) mapIsEmpty!34756))

(assert (= (and b!968290 (not condMapEmpty!34756)) mapNonEmpty!34756))

(get-info :version)

(assert (= (and mapNonEmpty!34756 ((_ is ValueCellFull!10439) mapValue!34756)) b!968293))

(assert (= (and b!968290 ((_ is ValueCellFull!10439) mapDefault!34756)) b!968287))

(assert (= start!83074 b!968290))

(declare-fun m!897241 () Bool)

(assert (=> b!968292 m!897241))

(declare-fun m!897243 () Bool)

(assert (=> b!968296 m!897243))

(declare-fun m!897245 () Bool)

(assert (=> mapNonEmpty!34756 m!897245))

(declare-fun m!897247 () Bool)

(assert (=> b!968289 m!897247))

(declare-fun m!897249 () Bool)

(assert (=> b!968289 m!897249))

(assert (=> b!968289 m!897247))

(assert (=> b!968289 m!897249))

(declare-fun m!897251 () Bool)

(assert (=> b!968289 m!897251))

(declare-fun m!897253 () Bool)

(assert (=> b!968289 m!897253))

(declare-fun m!897255 () Bool)

(assert (=> b!968291 m!897255))

(assert (=> b!968291 m!897249))

(assert (=> b!968291 m!897255))

(assert (=> b!968291 m!897249))

(declare-fun m!897257 () Bool)

(assert (=> b!968291 m!897257))

(declare-fun m!897259 () Bool)

(assert (=> start!83074 m!897259))

(declare-fun m!897261 () Bool)

(assert (=> start!83074 m!897261))

(declare-fun m!897263 () Bool)

(assert (=> start!83074 m!897263))

(assert (=> b!968286 m!897249))

(assert (=> b!968286 m!897249))

(declare-fun m!897265 () Bool)

(assert (=> b!968286 m!897265))

(check-sat (not start!83074) (not b!968292) (not b_next!19033) b_and!30531 (not b!968286) (not b!968296) (not mapNonEmpty!34756) tp_is_empty!21841 (not b!968289) (not b!968291))
(check-sat b_and!30531 (not b_next!19033))
