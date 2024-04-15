; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82756 () Bool)

(assert start!82756)

(declare-fun b_free!18907 () Bool)

(declare-fun b_next!18907 () Bool)

(assert (=> start!82756 (= b_free!18907 (not b_next!18907))))

(declare-fun tp!65842 () Bool)

(declare-fun b_and!30369 () Bool)

(assert (=> start!82756 (= tp!65842 b_and!30369)))

(declare-fun b!965250 () Bool)

(declare-fun res!646164 () Bool)

(declare-fun e!544120 () Bool)

(assert (=> b!965250 (=> (not res!646164) (not e!544120))))

(declare-datatypes ((array!59436 0))(
  ( (array!59437 (arr!28587 (Array (_ BitVec 32) (_ BitVec 64))) (size!29068 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59436)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59436 (_ BitVec 32)) Bool)

(assert (=> b!965250 (= res!646164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965251 () Bool)

(assert (=> b!965251 (= e!544120 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33929 0))(
  ( (V!33930 (val!10905 Int)) )
))
(declare-datatypes ((ValueCell!10373 0))(
  ( (ValueCellFull!10373 (v!13462 V!33929)) (EmptyCell!10373) )
))
(declare-datatypes ((array!59438 0))(
  ( (array!59439 (arr!28588 (Array (_ BitVec 32) ValueCell!10373)) (size!29069 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59438)

(declare-fun minValue!1342 () V!33929)

(declare-fun lt!431009 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33929)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14088 0))(
  ( (tuple2!14089 (_1!7055 (_ BitVec 64)) (_2!7055 V!33929)) )
))
(declare-datatypes ((List!19896 0))(
  ( (Nil!19893) (Cons!19892 (h!21054 tuple2!14088) (t!28250 List!19896)) )
))
(declare-datatypes ((ListLongMap!12775 0))(
  ( (ListLongMap!12776 (toList!6403 List!19896)) )
))
(declare-fun contains!5450 (ListLongMap!12775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3565 (array!59436 array!59438 (_ BitVec 32) (_ BitVec 32) V!33929 V!33929 (_ BitVec 32) Int) ListLongMap!12775)

(assert (=> b!965251 (= lt!431009 (contains!5450 (getCurrentListMap!3565 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28587 _keys!1686) i!803)))))

(declare-fun res!646165 () Bool)

(assert (=> start!82756 (=> (not res!646165) (not e!544120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82756 (= res!646165 (validMask!0 mask!2110))))

(assert (=> start!82756 e!544120))

(assert (=> start!82756 true))

(declare-fun e!544119 () Bool)

(declare-fun array_inv!22199 (array!59438) Bool)

(assert (=> start!82756 (and (array_inv!22199 _values!1400) e!544119)))

(declare-fun array_inv!22200 (array!59436) Bool)

(assert (=> start!82756 (array_inv!22200 _keys!1686)))

(assert (=> start!82756 tp!65842))

(declare-fun tp_is_empty!21709 () Bool)

(assert (=> start!82756 tp_is_empty!21709))

(declare-fun b!965252 () Bool)

(declare-fun res!646162 () Bool)

(assert (=> b!965252 (=> (not res!646162) (not e!544120))))

(declare-datatypes ((List!19897 0))(
  ( (Nil!19894) (Cons!19893 (h!21055 (_ BitVec 64)) (t!28251 List!19897)) )
))
(declare-fun arrayNoDuplicates!0 (array!59436 (_ BitVec 32) List!19897) Bool)

(assert (=> b!965252 (= res!646162 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19894))))

(declare-fun mapNonEmpty!34558 () Bool)

(declare-fun mapRes!34558 () Bool)

(declare-fun tp!65841 () Bool)

(declare-fun e!544123 () Bool)

(assert (=> mapNonEmpty!34558 (= mapRes!34558 (and tp!65841 e!544123))))

(declare-fun mapKey!34558 () (_ BitVec 32))

(declare-fun mapValue!34558 () ValueCell!10373)

(declare-fun mapRest!34558 () (Array (_ BitVec 32) ValueCell!10373))

(assert (=> mapNonEmpty!34558 (= (arr!28588 _values!1400) (store mapRest!34558 mapKey!34558 mapValue!34558))))

(declare-fun b!965253 () Bool)

(declare-fun e!544122 () Bool)

(assert (=> b!965253 (= e!544122 tp_is_empty!21709)))

(declare-fun b!965254 () Bool)

(assert (=> b!965254 (= e!544123 tp_is_empty!21709)))

(declare-fun b!965255 () Bool)

(assert (=> b!965255 (= e!544119 (and e!544122 mapRes!34558))))

(declare-fun condMapEmpty!34558 () Bool)

(declare-fun mapDefault!34558 () ValueCell!10373)

(assert (=> b!965255 (= condMapEmpty!34558 (= (arr!28588 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10373)) mapDefault!34558)))))

(declare-fun b!965256 () Bool)

(declare-fun res!646163 () Bool)

(assert (=> b!965256 (=> (not res!646163) (not e!544120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965256 (= res!646163 (validKeyInArray!0 (select (arr!28587 _keys!1686) i!803)))))

(declare-fun b!965257 () Bool)

(declare-fun res!646166 () Bool)

(assert (=> b!965257 (=> (not res!646166) (not e!544120))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965257 (= res!646166 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29068 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29068 _keys!1686))))))

(declare-fun b!965258 () Bool)

(declare-fun res!646161 () Bool)

(assert (=> b!965258 (=> (not res!646161) (not e!544120))))

(assert (=> b!965258 (= res!646161 (and (= (size!29069 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29068 _keys!1686) (size!29069 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34558 () Bool)

(assert (=> mapIsEmpty!34558 mapRes!34558))

(assert (= (and start!82756 res!646165) b!965258))

(assert (= (and b!965258 res!646161) b!965250))

(assert (= (and b!965250 res!646164) b!965252))

(assert (= (and b!965252 res!646162) b!965257))

(assert (= (and b!965257 res!646166) b!965256))

(assert (= (and b!965256 res!646163) b!965251))

(assert (= (and b!965255 condMapEmpty!34558) mapIsEmpty!34558))

(assert (= (and b!965255 (not condMapEmpty!34558)) mapNonEmpty!34558))

(get-info :version)

(assert (= (and mapNonEmpty!34558 ((_ is ValueCellFull!10373) mapValue!34558)) b!965254))

(assert (= (and b!965255 ((_ is ValueCellFull!10373) mapDefault!34558)) b!965253))

(assert (= start!82756 b!965255))

(declare-fun m!893791 () Bool)

(assert (=> start!82756 m!893791))

(declare-fun m!893793 () Bool)

(assert (=> start!82756 m!893793))

(declare-fun m!893795 () Bool)

(assert (=> start!82756 m!893795))

(declare-fun m!893797 () Bool)

(assert (=> b!965250 m!893797))

(declare-fun m!893799 () Bool)

(assert (=> mapNonEmpty!34558 m!893799))

(declare-fun m!893801 () Bool)

(assert (=> b!965256 m!893801))

(assert (=> b!965256 m!893801))

(declare-fun m!893803 () Bool)

(assert (=> b!965256 m!893803))

(declare-fun m!893805 () Bool)

(assert (=> b!965251 m!893805))

(assert (=> b!965251 m!893801))

(assert (=> b!965251 m!893805))

(assert (=> b!965251 m!893801))

(declare-fun m!893807 () Bool)

(assert (=> b!965251 m!893807))

(declare-fun m!893809 () Bool)

(assert (=> b!965252 m!893809))

(check-sat (not b!965252) (not b!965256) tp_is_empty!21709 (not b!965250) (not start!82756) (not b!965251) (not mapNonEmpty!34558) b_and!30369 (not b_next!18907))
(check-sat b_and!30369 (not b_next!18907))
