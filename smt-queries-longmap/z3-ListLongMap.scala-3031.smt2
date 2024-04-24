; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42546 () Bool)

(assert start!42546)

(declare-fun b_free!11995 () Bool)

(declare-fun b_next!11995 () Bool)

(assert (=> start!42546 (= b_free!11995 (not b_next!11995))))

(declare-fun tp!42024 () Bool)

(declare-fun b_and!20485 () Bool)

(assert (=> start!42546 (= tp!42024 b_and!20485)))

(declare-fun res!283581 () Bool)

(declare-fun e!278708 () Bool)

(assert (=> start!42546 (=> (not res!283581) (not e!278708))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42546 (= res!283581 (validMask!0 mask!1365))))

(assert (=> start!42546 e!278708))

(declare-fun tp_is_empty!13423 () Bool)

(assert (=> start!42546 tp_is_empty!13423))

(assert (=> start!42546 tp!42024))

(assert (=> start!42546 true))

(declare-datatypes ((array!30572 0))(
  ( (array!30573 (arr!14703 (Array (_ BitVec 32) (_ BitVec 64))) (size!15055 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30572)

(declare-fun array_inv!10686 (array!30572) Bool)

(assert (=> start!42546 (array_inv!10686 _keys!1025)))

(declare-datatypes ((V!19003 0))(
  ( (V!19004 (val!6756 Int)) )
))
(declare-datatypes ((ValueCell!6368 0))(
  ( (ValueCellFull!6368 (v!9050 V!19003)) (EmptyCell!6368) )
))
(declare-datatypes ((array!30574 0))(
  ( (array!30575 (arr!14704 (Array (_ BitVec 32) ValueCell!6368)) (size!15056 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30574)

(declare-fun e!278705 () Bool)

(declare-fun array_inv!10687 (array!30574) Bool)

(assert (=> start!42546 (and (array_inv!10687 _values!833) e!278705)))

(declare-fun b!474775 () Bool)

(declare-fun res!283580 () Bool)

(assert (=> b!474775 (=> (not res!283580) (not e!278708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30572 (_ BitVec 32)) Bool)

(assert (=> b!474775 (= res!283580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474776 () Bool)

(declare-fun e!278709 () Bool)

(declare-fun mapRes!21853 () Bool)

(assert (=> b!474776 (= e!278705 (and e!278709 mapRes!21853))))

(declare-fun condMapEmpty!21853 () Bool)

(declare-fun mapDefault!21853 () ValueCell!6368)

(assert (=> b!474776 (= condMapEmpty!21853 (= (arr!14704 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6368)) mapDefault!21853)))))

(declare-fun mapNonEmpty!21853 () Bool)

(declare-fun tp!42025 () Bool)

(declare-fun e!278706 () Bool)

(assert (=> mapNonEmpty!21853 (= mapRes!21853 (and tp!42025 e!278706))))

(declare-fun mapKey!21853 () (_ BitVec 32))

(declare-fun mapRest!21853 () (Array (_ BitVec 32) ValueCell!6368))

(declare-fun mapValue!21853 () ValueCell!6368)

(assert (=> mapNonEmpty!21853 (= (arr!14704 _values!833) (store mapRest!21853 mapKey!21853 mapValue!21853))))

(declare-fun b!474777 () Bool)

(declare-fun res!283583 () Bool)

(assert (=> b!474777 (=> (not res!283583) (not e!278708))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474777 (= res!283583 (and (= (size!15056 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15055 _keys!1025) (size!15056 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474778 () Bool)

(assert (=> b!474778 (= e!278709 tp_is_empty!13423)))

(declare-fun mapIsEmpty!21853 () Bool)

(assert (=> mapIsEmpty!21853 mapRes!21853))

(declare-fun b!474779 () Bool)

(assert (=> b!474779 (= e!278708 false)))

(declare-datatypes ((tuple2!8834 0))(
  ( (tuple2!8835 (_1!4428 (_ BitVec 64)) (_2!4428 V!19003)) )
))
(declare-datatypes ((List!8893 0))(
  ( (Nil!8890) (Cons!8889 (h!9745 tuple2!8834) (t!14859 List!8893)) )
))
(declare-datatypes ((ListLongMap!7749 0))(
  ( (ListLongMap!7750 (toList!3890 List!8893)) )
))
(declare-fun lt!216316 () ListLongMap!7749)

(declare-fun zeroValue!794 () V!19003)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19003)

(declare-fun getCurrentListMapNoExtraKeys!2097 (array!30572 array!30574 (_ BitVec 32) (_ BitVec 32) V!19003 V!19003 (_ BitVec 32) Int) ListLongMap!7749)

(assert (=> b!474779 (= lt!216316 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19003)

(declare-fun lt!216317 () ListLongMap!7749)

(assert (=> b!474779 (= lt!216317 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474780 () Bool)

(declare-fun res!283582 () Bool)

(assert (=> b!474780 (=> (not res!283582) (not e!278708))))

(declare-datatypes ((List!8894 0))(
  ( (Nil!8891) (Cons!8890 (h!9746 (_ BitVec 64)) (t!14860 List!8894)) )
))
(declare-fun arrayNoDuplicates!0 (array!30572 (_ BitVec 32) List!8894) Bool)

(assert (=> b!474780 (= res!283582 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8891))))

(declare-fun b!474781 () Bool)

(assert (=> b!474781 (= e!278706 tp_is_empty!13423)))

(assert (= (and start!42546 res!283581) b!474777))

(assert (= (and b!474777 res!283583) b!474775))

(assert (= (and b!474775 res!283580) b!474780))

(assert (= (and b!474780 res!283582) b!474779))

(assert (= (and b!474776 condMapEmpty!21853) mapIsEmpty!21853))

(assert (= (and b!474776 (not condMapEmpty!21853)) mapNonEmpty!21853))

(get-info :version)

(assert (= (and mapNonEmpty!21853 ((_ is ValueCellFull!6368) mapValue!21853)) b!474781))

(assert (= (and b!474776 ((_ is ValueCellFull!6368) mapDefault!21853)) b!474778))

(assert (= start!42546 b!474776))

(declare-fun m!457341 () Bool)

(assert (=> b!474775 m!457341))

(declare-fun m!457343 () Bool)

(assert (=> start!42546 m!457343))

(declare-fun m!457345 () Bool)

(assert (=> start!42546 m!457345))

(declare-fun m!457347 () Bool)

(assert (=> start!42546 m!457347))

(declare-fun m!457349 () Bool)

(assert (=> b!474780 m!457349))

(declare-fun m!457351 () Bool)

(assert (=> mapNonEmpty!21853 m!457351))

(declare-fun m!457353 () Bool)

(assert (=> b!474779 m!457353))

(declare-fun m!457355 () Bool)

(assert (=> b!474779 m!457355))

(check-sat (not start!42546) b_and!20485 (not b!474780) tp_is_empty!13423 (not b!474775) (not mapNonEmpty!21853) (not b_next!11995) (not b!474779))
(check-sat b_and!20485 (not b_next!11995))
