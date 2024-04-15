; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42534 () Bool)

(assert start!42534)

(declare-fun b_free!11983 () Bool)

(declare-fun b_next!11983 () Bool)

(assert (=> start!42534 (= b_free!11983 (not b_next!11983))))

(declare-fun tp!41989 () Bool)

(declare-fun b_and!20437 () Bool)

(assert (=> start!42534 (= tp!41989 b_and!20437)))

(declare-fun b!474439 () Bool)

(declare-fun e!278482 () Bool)

(declare-fun e!278484 () Bool)

(declare-fun mapRes!21835 () Bool)

(assert (=> b!474439 (= e!278482 (and e!278484 mapRes!21835))))

(declare-fun condMapEmpty!21835 () Bool)

(declare-datatypes ((V!18987 0))(
  ( (V!18988 (val!6750 Int)) )
))
(declare-datatypes ((ValueCell!6362 0))(
  ( (ValueCellFull!6362 (v!9037 V!18987)) (EmptyCell!6362) )
))
(declare-datatypes ((array!30557 0))(
  ( (array!30558 (arr!14696 (Array (_ BitVec 32) ValueCell!6362)) (size!15049 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30557)

(declare-fun mapDefault!21835 () ValueCell!6362)

(assert (=> b!474439 (= condMapEmpty!21835 (= (arr!14696 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6362)) mapDefault!21835)))))

(declare-fun b!474440 () Bool)

(declare-fun res!283389 () Bool)

(declare-fun e!278481 () Bool)

(assert (=> b!474440 (=> (not res!283389) (not e!278481))))

(declare-datatypes ((array!30559 0))(
  ( (array!30560 (arr!14697 (Array (_ BitVec 32) (_ BitVec 64))) (size!15050 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30559)

(declare-datatypes ((List!9019 0))(
  ( (Nil!9016) (Cons!9015 (h!9871 (_ BitVec 64)) (t!14984 List!9019)) )
))
(declare-fun arrayNoDuplicates!0 (array!30559 (_ BitVec 32) List!9019) Bool)

(assert (=> b!474440 (= res!283389 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9016))))

(declare-fun b!474441 () Bool)

(declare-fun tp_is_empty!13411 () Bool)

(assert (=> b!474441 (= e!278484 tp_is_empty!13411)))

(declare-fun res!283387 () Bool)

(assert (=> start!42534 (=> (not res!283387) (not e!278481))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42534 (= res!283387 (validMask!0 mask!1365))))

(assert (=> start!42534 e!278481))

(assert (=> start!42534 tp_is_empty!13411))

(assert (=> start!42534 tp!41989))

(assert (=> start!42534 true))

(declare-fun array_inv!10684 (array!30559) Bool)

(assert (=> start!42534 (array_inv!10684 _keys!1025)))

(declare-fun array_inv!10685 (array!30557) Bool)

(assert (=> start!42534 (and (array_inv!10685 _values!833) e!278482)))

(declare-fun b!474442 () Bool)

(assert (=> b!474442 (= e!278481 false)))

(declare-fun zeroValue!794 () V!18987)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((tuple2!8956 0))(
  ( (tuple2!8957 (_1!4489 (_ BitVec 64)) (_2!4489 V!18987)) )
))
(declare-datatypes ((List!9020 0))(
  ( (Nil!9017) (Cons!9016 (h!9872 tuple2!8956) (t!14985 List!9020)) )
))
(declare-datatypes ((ListLongMap!7859 0))(
  ( (ListLongMap!7860 (toList!3945 List!9020)) )
))
(declare-fun lt!216034 () ListLongMap!7859)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18987)

(declare-fun getCurrentListMapNoExtraKeys!2112 (array!30559 array!30557 (_ BitVec 32) (_ BitVec 32) V!18987 V!18987 (_ BitVec 32) Int) ListLongMap!7859)

(assert (=> b!474442 (= lt!216034 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18987)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216035 () ListLongMap!7859)

(assert (=> b!474442 (= lt!216035 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474443 () Bool)

(declare-fun res!283386 () Bool)

(assert (=> b!474443 (=> (not res!283386) (not e!278481))))

(assert (=> b!474443 (= res!283386 (and (= (size!15049 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15050 _keys!1025) (size!15049 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474444 () Bool)

(declare-fun e!278483 () Bool)

(assert (=> b!474444 (= e!278483 tp_is_empty!13411)))

(declare-fun mapNonEmpty!21835 () Bool)

(declare-fun tp!41988 () Bool)

(assert (=> mapNonEmpty!21835 (= mapRes!21835 (and tp!41988 e!278483))))

(declare-fun mapRest!21835 () (Array (_ BitVec 32) ValueCell!6362))

(declare-fun mapKey!21835 () (_ BitVec 32))

(declare-fun mapValue!21835 () ValueCell!6362)

(assert (=> mapNonEmpty!21835 (= (arr!14696 _values!833) (store mapRest!21835 mapKey!21835 mapValue!21835))))

(declare-fun b!474445 () Bool)

(declare-fun res!283388 () Bool)

(assert (=> b!474445 (=> (not res!283388) (not e!278481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30559 (_ BitVec 32)) Bool)

(assert (=> b!474445 (= res!283388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21835 () Bool)

(assert (=> mapIsEmpty!21835 mapRes!21835))

(assert (= (and start!42534 res!283387) b!474443))

(assert (= (and b!474443 res!283386) b!474445))

(assert (= (and b!474445 res!283388) b!474440))

(assert (= (and b!474440 res!283389) b!474442))

(assert (= (and b!474439 condMapEmpty!21835) mapIsEmpty!21835))

(assert (= (and b!474439 (not condMapEmpty!21835)) mapNonEmpty!21835))

(get-info :version)

(assert (= (and mapNonEmpty!21835 ((_ is ValueCellFull!6362) mapValue!21835)) b!474444))

(assert (= (and b!474439 ((_ is ValueCellFull!6362) mapDefault!21835)) b!474441))

(assert (= start!42534 b!474439))

(declare-fun m!456329 () Bool)

(assert (=> b!474445 m!456329))

(declare-fun m!456331 () Bool)

(assert (=> start!42534 m!456331))

(declare-fun m!456333 () Bool)

(assert (=> start!42534 m!456333))

(declare-fun m!456335 () Bool)

(assert (=> start!42534 m!456335))

(declare-fun m!456337 () Bool)

(assert (=> mapNonEmpty!21835 m!456337))

(declare-fun m!456339 () Bool)

(assert (=> b!474440 m!456339))

(declare-fun m!456341 () Bool)

(assert (=> b!474442 m!456341))

(declare-fun m!456343 () Bool)

(assert (=> b!474442 m!456343))

(check-sat (not b!474445) (not start!42534) (not b_next!11983) tp_is_empty!13411 (not b!474442) b_and!20437 (not mapNonEmpty!21835) (not b!474440))
(check-sat b_and!20437 (not b_next!11983))
