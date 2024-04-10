; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82896 () Bool)

(assert start!82896)

(declare-fun b_free!19023 () Bool)

(declare-fun b_next!19023 () Bool)

(assert (=> start!82896 (= b_free!19023 (not b_next!19023))))

(declare-fun tp!66198 () Bool)

(declare-fun b_and!30511 () Bool)

(assert (=> start!82896 (= tp!66198 b_and!30511)))

(declare-fun b!967218 () Bool)

(declare-fun res!647453 () Bool)

(declare-fun e!545182 () Bool)

(assert (=> b!967218 (=> (not res!647453) (not e!545182))))

(declare-datatypes ((array!59737 0))(
  ( (array!59738 (arr!28737 (Array (_ BitVec 32) (_ BitVec 64))) (size!29216 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59737)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967218 (= res!647453 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29216 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29216 _keys!1686))))))

(declare-fun b!967219 () Bool)

(declare-fun e!545183 () Bool)

(declare-fun tp_is_empty!21831 () Bool)

(assert (=> b!967219 (= e!545183 tp_is_empty!21831)))

(declare-fun res!647456 () Bool)

(assert (=> start!82896 (=> (not res!647456) (not e!545182))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82896 (= res!647456 (validMask!0 mask!2110))))

(assert (=> start!82896 e!545182))

(assert (=> start!82896 true))

(declare-datatypes ((V!34091 0))(
  ( (V!34092 (val!10966 Int)) )
))
(declare-datatypes ((ValueCell!10434 0))(
  ( (ValueCellFull!10434 (v!13524 V!34091)) (EmptyCell!10434) )
))
(declare-datatypes ((array!59739 0))(
  ( (array!59740 (arr!28738 (Array (_ BitVec 32) ValueCell!10434)) (size!29217 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59739)

(declare-fun e!545185 () Bool)

(declare-fun array_inv!22253 (array!59739) Bool)

(assert (=> start!82896 (and (array_inv!22253 _values!1400) e!545185)))

(declare-fun array_inv!22254 (array!59737) Bool)

(assert (=> start!82896 (array_inv!22254 _keys!1686)))

(assert (=> start!82896 tp!66198))

(assert (=> start!82896 tp_is_empty!21831))

(declare-fun b!967220 () Bool)

(declare-fun e!545186 () Bool)

(assert (=> b!967220 (= e!545186 tp_is_empty!21831)))

(declare-fun b!967221 () Bool)

(declare-fun res!647455 () Bool)

(assert (=> b!967221 (=> (not res!647455) (not e!545182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59737 (_ BitVec 32)) Bool)

(assert (=> b!967221 (= res!647455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967222 () Bool)

(declare-fun res!647454 () Bool)

(assert (=> b!967222 (=> (not res!647454) (not e!545182))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967222 (= res!647454 (and (= (size!29217 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29216 _keys!1686) (size!29217 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967223 () Bool)

(declare-fun res!647452 () Bool)

(assert (=> b!967223 (=> (not res!647452) (not e!545182))))

(assert (=> b!967223 (= res!647452 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967224 () Bool)

(declare-fun mapRes!34741 () Bool)

(assert (=> b!967224 (= e!545185 (and e!545183 mapRes!34741))))

(declare-fun condMapEmpty!34741 () Bool)

(declare-fun mapDefault!34741 () ValueCell!10434)

(assert (=> b!967224 (= condMapEmpty!34741 (= (arr!28738 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10434)) mapDefault!34741)))))

(declare-fun b!967225 () Bool)

(assert (=> b!967225 (= e!545182 (not true))))

(declare-fun minValue!1342 () V!34091)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34091)

(declare-datatypes ((tuple2!14100 0))(
  ( (tuple2!14101 (_1!7061 (_ BitVec 64)) (_2!7061 V!34091)) )
))
(declare-datatypes ((List!19950 0))(
  ( (Nil!19947) (Cons!19946 (h!21108 tuple2!14100) (t!28313 List!19950)) )
))
(declare-datatypes ((ListLongMap!12797 0))(
  ( (ListLongMap!12798 (toList!6414 List!19950)) )
))
(declare-fun contains!5515 (ListLongMap!12797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3647 (array!59737 array!59739 (_ BitVec 32) (_ BitVec 32) V!34091 V!34091 (_ BitVec 32) Int) ListLongMap!12797)

(assert (=> b!967225 (contains!5515 (getCurrentListMap!3647 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28737 _keys!1686) i!803))))

(declare-datatypes ((Unit!32313 0))(
  ( (Unit!32314) )
))
(declare-fun lt!431401 () Unit!32313)

(declare-fun lemmaInListMapFromThenInFromMinusOne!51 (array!59737 array!59739 (_ BitVec 32) (_ BitVec 32) V!34091 V!34091 (_ BitVec 32) (_ BitVec 32) Int) Unit!32313)

(assert (=> b!967225 (= lt!431401 (lemmaInListMapFromThenInFromMinusOne!51 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967226 () Bool)

(declare-fun res!647457 () Bool)

(assert (=> b!967226 (=> (not res!647457) (not e!545182))))

(assert (=> b!967226 (= res!647457 (contains!5515 (getCurrentListMap!3647 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28737 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34741 () Bool)

(declare-fun tp!66197 () Bool)

(assert (=> mapNonEmpty!34741 (= mapRes!34741 (and tp!66197 e!545186))))

(declare-fun mapRest!34741 () (Array (_ BitVec 32) ValueCell!10434))

(declare-fun mapValue!34741 () ValueCell!10434)

(declare-fun mapKey!34741 () (_ BitVec 32))

(assert (=> mapNonEmpty!34741 (= (arr!28738 _values!1400) (store mapRest!34741 mapKey!34741 mapValue!34741))))

(declare-fun b!967227 () Bool)

(declare-fun res!647458 () Bool)

(assert (=> b!967227 (=> (not res!647458) (not e!545182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967227 (= res!647458 (validKeyInArray!0 (select (arr!28737 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34741 () Bool)

(assert (=> mapIsEmpty!34741 mapRes!34741))

(declare-fun b!967228 () Bool)

(declare-fun res!647451 () Bool)

(assert (=> b!967228 (=> (not res!647451) (not e!545182))))

(declare-datatypes ((List!19951 0))(
  ( (Nil!19948) (Cons!19947 (h!21109 (_ BitVec 64)) (t!28314 List!19951)) )
))
(declare-fun arrayNoDuplicates!0 (array!59737 (_ BitVec 32) List!19951) Bool)

(assert (=> b!967228 (= res!647451 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19948))))

(assert (= (and start!82896 res!647456) b!967222))

(assert (= (and b!967222 res!647454) b!967221))

(assert (= (and b!967221 res!647455) b!967228))

(assert (= (and b!967228 res!647451) b!967218))

(assert (= (and b!967218 res!647453) b!967227))

(assert (= (and b!967227 res!647458) b!967226))

(assert (= (and b!967226 res!647457) b!967223))

(assert (= (and b!967223 res!647452) b!967225))

(assert (= (and b!967224 condMapEmpty!34741) mapIsEmpty!34741))

(assert (= (and b!967224 (not condMapEmpty!34741)) mapNonEmpty!34741))

(get-info :version)

(assert (= (and mapNonEmpty!34741 ((_ is ValueCellFull!10434) mapValue!34741)) b!967220))

(assert (= (and b!967224 ((_ is ValueCellFull!10434) mapDefault!34741)) b!967219))

(assert (= start!82896 b!967224))

(declare-fun m!895817 () Bool)

(assert (=> mapNonEmpty!34741 m!895817))

(declare-fun m!895819 () Bool)

(assert (=> b!967225 m!895819))

(declare-fun m!895821 () Bool)

(assert (=> b!967225 m!895821))

(assert (=> b!967225 m!895819))

(assert (=> b!967225 m!895821))

(declare-fun m!895823 () Bool)

(assert (=> b!967225 m!895823))

(declare-fun m!895825 () Bool)

(assert (=> b!967225 m!895825))

(assert (=> b!967227 m!895821))

(assert (=> b!967227 m!895821))

(declare-fun m!895827 () Bool)

(assert (=> b!967227 m!895827))

(declare-fun m!895829 () Bool)

(assert (=> b!967228 m!895829))

(declare-fun m!895831 () Bool)

(assert (=> b!967226 m!895831))

(assert (=> b!967226 m!895821))

(assert (=> b!967226 m!895831))

(assert (=> b!967226 m!895821))

(declare-fun m!895833 () Bool)

(assert (=> b!967226 m!895833))

(declare-fun m!895835 () Bool)

(assert (=> b!967221 m!895835))

(declare-fun m!895837 () Bool)

(assert (=> start!82896 m!895837))

(declare-fun m!895839 () Bool)

(assert (=> start!82896 m!895839))

(declare-fun m!895841 () Bool)

(assert (=> start!82896 m!895841))

(check-sat (not b!967228) (not b_next!19023) (not b!967227) (not start!82896) (not mapNonEmpty!34741) b_and!30511 (not b!967221) tp_is_empty!21831 (not b!967226) (not b!967225))
(check-sat b_and!30511 (not b_next!19023))
