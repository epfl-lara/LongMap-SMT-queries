; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82914 () Bool)

(assert start!82914)

(declare-fun b_free!19041 () Bool)

(declare-fun b_next!19041 () Bool)

(assert (=> start!82914 (= b_free!19041 (not b_next!19041))))

(declare-fun tp!66252 () Bool)

(declare-fun b_and!30529 () Bool)

(assert (=> start!82914 (= tp!66252 b_and!30529)))

(declare-fun b!967515 () Bool)

(declare-fun res!647669 () Bool)

(declare-fun e!545320 () Bool)

(assert (=> b!967515 (=> (not res!647669) (not e!545320))))

(declare-datatypes ((array!59771 0))(
  ( (array!59772 (arr!28754 (Array (_ BitVec 32) (_ BitVec 64))) (size!29233 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59771)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967515 (= res!647669 (validKeyInArray!0 (select (arr!28754 _keys!1686) i!803)))))

(declare-fun b!967516 () Bool)

(declare-fun e!545318 () Bool)

(declare-fun e!545317 () Bool)

(declare-fun mapRes!34768 () Bool)

(assert (=> b!967516 (= e!545318 (and e!545317 mapRes!34768))))

(declare-fun condMapEmpty!34768 () Bool)

(declare-datatypes ((V!34115 0))(
  ( (V!34116 (val!10975 Int)) )
))
(declare-datatypes ((ValueCell!10443 0))(
  ( (ValueCellFull!10443 (v!13533 V!34115)) (EmptyCell!10443) )
))
(declare-datatypes ((array!59773 0))(
  ( (array!59774 (arr!28755 (Array (_ BitVec 32) ValueCell!10443)) (size!29234 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59773)

(declare-fun mapDefault!34768 () ValueCell!10443)

(assert (=> b!967516 (= condMapEmpty!34768 (= (arr!28755 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10443)) mapDefault!34768)))))

(declare-fun b!967517 () Bool)

(declare-fun res!647673 () Bool)

(assert (=> b!967517 (=> (not res!647673) (not e!545320))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59771 (_ BitVec 32)) Bool)

(assert (=> b!967517 (= res!647673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34768 () Bool)

(assert (=> mapIsEmpty!34768 mapRes!34768))

(declare-fun b!967518 () Bool)

(declare-fun res!647667 () Bool)

(assert (=> b!967518 (=> (not res!647667) (not e!545320))))

(declare-datatypes ((List!19965 0))(
  ( (Nil!19962) (Cons!19961 (h!21123 (_ BitVec 64)) (t!28328 List!19965)) )
))
(declare-fun arrayNoDuplicates!0 (array!59771 (_ BitVec 32) List!19965) Bool)

(assert (=> b!967518 (= res!647667 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19962))))

(declare-fun b!967519 () Bool)

(declare-fun res!647671 () Bool)

(assert (=> b!967519 (=> (not res!647671) (not e!545320))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967519 (= res!647671 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967520 () Bool)

(declare-fun res!647672 () Bool)

(assert (=> b!967520 (=> (not res!647672) (not e!545320))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967520 (= res!647672 (and (= (size!29234 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29233 _keys!1686) (size!29234 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967521 () Bool)

(assert (=> b!967521 (= e!545320 (not true))))

(declare-fun minValue!1342 () V!34115)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34115)

(declare-datatypes ((tuple2!14116 0))(
  ( (tuple2!14117 (_1!7069 (_ BitVec 64)) (_2!7069 V!34115)) )
))
(declare-datatypes ((List!19966 0))(
  ( (Nil!19963) (Cons!19962 (h!21124 tuple2!14116) (t!28329 List!19966)) )
))
(declare-datatypes ((ListLongMap!12813 0))(
  ( (ListLongMap!12814 (toList!6422 List!19966)) )
))
(declare-fun contains!5523 (ListLongMap!12813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3655 (array!59771 array!59773 (_ BitVec 32) (_ BitVec 32) V!34115 V!34115 (_ BitVec 32) Int) ListLongMap!12813)

(assert (=> b!967521 (contains!5523 (getCurrentListMap!3655 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28754 _keys!1686) i!803))))

(declare-datatypes ((Unit!32327 0))(
  ( (Unit!32328) )
))
(declare-fun lt!431428 () Unit!32327)

(declare-fun lemmaInListMapFromThenInFromMinusOne!58 (array!59771 array!59773 (_ BitVec 32) (_ BitVec 32) V!34115 V!34115 (_ BitVec 32) (_ BitVec 32) Int) Unit!32327)

(assert (=> b!967521 (= lt!431428 (lemmaInListMapFromThenInFromMinusOne!58 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967522 () Bool)

(declare-fun res!647674 () Bool)

(assert (=> b!967522 (=> (not res!647674) (not e!545320))))

(assert (=> b!967522 (= res!647674 (contains!5523 (getCurrentListMap!3655 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28754 _keys!1686) i!803)))))

(declare-fun res!647668 () Bool)

(assert (=> start!82914 (=> (not res!647668) (not e!545320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82914 (= res!647668 (validMask!0 mask!2110))))

(assert (=> start!82914 e!545320))

(assert (=> start!82914 true))

(declare-fun array_inv!22267 (array!59773) Bool)

(assert (=> start!82914 (and (array_inv!22267 _values!1400) e!545318)))

(declare-fun array_inv!22268 (array!59771) Bool)

(assert (=> start!82914 (array_inv!22268 _keys!1686)))

(assert (=> start!82914 tp!66252))

(declare-fun tp_is_empty!21849 () Bool)

(assert (=> start!82914 tp_is_empty!21849))

(declare-fun b!967523 () Bool)

(declare-fun e!545321 () Bool)

(assert (=> b!967523 (= e!545321 tp_is_empty!21849)))

(declare-fun mapNonEmpty!34768 () Bool)

(declare-fun tp!66251 () Bool)

(assert (=> mapNonEmpty!34768 (= mapRes!34768 (and tp!66251 e!545321))))

(declare-fun mapValue!34768 () ValueCell!10443)

(declare-fun mapKey!34768 () (_ BitVec 32))

(declare-fun mapRest!34768 () (Array (_ BitVec 32) ValueCell!10443))

(assert (=> mapNonEmpty!34768 (= (arr!28755 _values!1400) (store mapRest!34768 mapKey!34768 mapValue!34768))))

(declare-fun b!967524 () Bool)

(assert (=> b!967524 (= e!545317 tp_is_empty!21849)))

(declare-fun b!967525 () Bool)

(declare-fun res!647670 () Bool)

(assert (=> b!967525 (=> (not res!647670) (not e!545320))))

(assert (=> b!967525 (= res!647670 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29233 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29233 _keys!1686))))))

(assert (= (and start!82914 res!647668) b!967520))

(assert (= (and b!967520 res!647672) b!967517))

(assert (= (and b!967517 res!647673) b!967518))

(assert (= (and b!967518 res!647667) b!967525))

(assert (= (and b!967525 res!647670) b!967515))

(assert (= (and b!967515 res!647669) b!967522))

(assert (= (and b!967522 res!647674) b!967519))

(assert (= (and b!967519 res!647671) b!967521))

(assert (= (and b!967516 condMapEmpty!34768) mapIsEmpty!34768))

(assert (= (and b!967516 (not condMapEmpty!34768)) mapNonEmpty!34768))

(get-info :version)

(assert (= (and mapNonEmpty!34768 ((_ is ValueCellFull!10443) mapValue!34768)) b!967523))

(assert (= (and b!967516 ((_ is ValueCellFull!10443) mapDefault!34768)) b!967524))

(assert (= start!82914 b!967516))

(declare-fun m!896051 () Bool)

(assert (=> b!967521 m!896051))

(declare-fun m!896053 () Bool)

(assert (=> b!967521 m!896053))

(assert (=> b!967521 m!896051))

(assert (=> b!967521 m!896053))

(declare-fun m!896055 () Bool)

(assert (=> b!967521 m!896055))

(declare-fun m!896057 () Bool)

(assert (=> b!967521 m!896057))

(assert (=> b!967515 m!896053))

(assert (=> b!967515 m!896053))

(declare-fun m!896059 () Bool)

(assert (=> b!967515 m!896059))

(declare-fun m!896061 () Bool)

(assert (=> mapNonEmpty!34768 m!896061))

(declare-fun m!896063 () Bool)

(assert (=> b!967518 m!896063))

(declare-fun m!896065 () Bool)

(assert (=> start!82914 m!896065))

(declare-fun m!896067 () Bool)

(assert (=> start!82914 m!896067))

(declare-fun m!896069 () Bool)

(assert (=> start!82914 m!896069))

(declare-fun m!896071 () Bool)

(assert (=> b!967517 m!896071))

(declare-fun m!896073 () Bool)

(assert (=> b!967522 m!896073))

(assert (=> b!967522 m!896053))

(assert (=> b!967522 m!896073))

(assert (=> b!967522 m!896053))

(declare-fun m!896075 () Bool)

(assert (=> b!967522 m!896075))

(check-sat (not b!967521) b_and!30529 (not b_next!19041) tp_is_empty!21849 (not mapNonEmpty!34768) (not b!967518) (not b!967522) (not start!82914) (not b!967517) (not b!967515))
(check-sat b_and!30529 (not b_next!19041))
