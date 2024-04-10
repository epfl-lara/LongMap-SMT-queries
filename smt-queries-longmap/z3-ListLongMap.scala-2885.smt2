; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41442 () Bool)

(assert start!41442)

(declare-fun b_free!11121 () Bool)

(declare-fun b_next!11121 () Bool)

(assert (=> start!41442 (= b_free!11121 (not b_next!11121))))

(declare-fun tp!39358 () Bool)

(declare-fun b_and!19457 () Bool)

(assert (=> start!41442 (= tp!39358 b_and!19457)))

(declare-fun b!463044 () Bool)

(declare-fun e!270305 () Bool)

(declare-fun e!270306 () Bool)

(declare-fun mapRes!20497 () Bool)

(assert (=> b!463044 (= e!270305 (and e!270306 mapRes!20497))))

(declare-fun condMapEmpty!20497 () Bool)

(declare-datatypes ((V!17837 0))(
  ( (V!17838 (val!6319 Int)) )
))
(declare-datatypes ((ValueCell!5931 0))(
  ( (ValueCellFull!5931 (v!8606 V!17837)) (EmptyCell!5931) )
))
(declare-datatypes ((array!28895 0))(
  ( (array!28896 (arr!13880 (Array (_ BitVec 32) ValueCell!5931)) (size!14232 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28895)

(declare-fun mapDefault!20497 () ValueCell!5931)

(assert (=> b!463044 (= condMapEmpty!20497 (= (arr!13880 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5931)) mapDefault!20497)))))

(declare-fun b!463045 () Bool)

(declare-fun res!276891 () Bool)

(declare-fun e!270309 () Bool)

(assert (=> b!463045 (=> (not res!276891) (not e!270309))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28897 0))(
  ( (array!28898 (arr!13881 (Array (_ BitVec 32) (_ BitVec 64))) (size!14233 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28897)

(assert (=> b!463045 (= res!276891 (and (= (size!14232 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14233 _keys!1025) (size!14232 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276893 () Bool)

(assert (=> start!41442 (=> (not res!276893) (not e!270309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41442 (= res!276893 (validMask!0 mask!1365))))

(assert (=> start!41442 e!270309))

(declare-fun tp_is_empty!12549 () Bool)

(assert (=> start!41442 tp_is_empty!12549))

(assert (=> start!41442 tp!39358))

(assert (=> start!41442 true))

(declare-fun array_inv!10032 (array!28897) Bool)

(assert (=> start!41442 (array_inv!10032 _keys!1025)))

(declare-fun array_inv!10033 (array!28895) Bool)

(assert (=> start!41442 (and (array_inv!10033 _values!833) e!270305)))

(declare-fun b!463046 () Bool)

(declare-fun res!276890 () Bool)

(assert (=> b!463046 (=> (not res!276890) (not e!270309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28897 (_ BitVec 32)) Bool)

(assert (=> b!463046 (= res!276890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463047 () Bool)

(assert (=> b!463047 (= e!270306 tp_is_empty!12549)))

(declare-fun b!463048 () Bool)

(declare-fun e!270307 () Bool)

(assert (=> b!463048 (= e!270307 tp_is_empty!12549)))

(declare-fun b!463049 () Bool)

(declare-fun res!276892 () Bool)

(assert (=> b!463049 (=> (not res!276892) (not e!270309))))

(declare-datatypes ((List!8371 0))(
  ( (Nil!8368) (Cons!8367 (h!9223 (_ BitVec 64)) (t!14315 List!8371)) )
))
(declare-fun arrayNoDuplicates!0 (array!28897 (_ BitVec 32) List!8371) Bool)

(assert (=> b!463049 (= res!276892 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8368))))

(declare-fun mapNonEmpty!20497 () Bool)

(declare-fun tp!39357 () Bool)

(assert (=> mapNonEmpty!20497 (= mapRes!20497 (and tp!39357 e!270307))))

(declare-fun mapRest!20497 () (Array (_ BitVec 32) ValueCell!5931))

(declare-fun mapKey!20497 () (_ BitVec 32))

(declare-fun mapValue!20497 () ValueCell!5931)

(assert (=> mapNonEmpty!20497 (= (arr!13880 _values!833) (store mapRest!20497 mapKey!20497 mapValue!20497))))

(declare-fun mapIsEmpty!20497 () Bool)

(assert (=> mapIsEmpty!20497 mapRes!20497))

(declare-fun b!463050 () Bool)

(assert (=> b!463050 (= e!270309 false)))

(declare-fun minValueBefore!38 () V!17837)

(declare-fun zeroValue!794 () V!17837)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8280 0))(
  ( (tuple2!8281 (_1!4151 (_ BitVec 64)) (_2!4151 V!17837)) )
))
(declare-datatypes ((List!8372 0))(
  ( (Nil!8369) (Cons!8368 (h!9224 tuple2!8280) (t!14316 List!8372)) )
))
(declare-datatypes ((ListLongMap!7193 0))(
  ( (ListLongMap!7194 (toList!3612 List!8372)) )
))
(declare-fun lt!209297 () ListLongMap!7193)

(declare-fun getCurrentListMapNoExtraKeys!1792 (array!28897 array!28895 (_ BitVec 32) (_ BitVec 32) V!17837 V!17837 (_ BitVec 32) Int) ListLongMap!7193)

(assert (=> b!463050 (= lt!209297 (getCurrentListMapNoExtraKeys!1792 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41442 res!276893) b!463045))

(assert (= (and b!463045 res!276891) b!463046))

(assert (= (and b!463046 res!276890) b!463049))

(assert (= (and b!463049 res!276892) b!463050))

(assert (= (and b!463044 condMapEmpty!20497) mapIsEmpty!20497))

(assert (= (and b!463044 (not condMapEmpty!20497)) mapNonEmpty!20497))

(get-info :version)

(assert (= (and mapNonEmpty!20497 ((_ is ValueCellFull!5931) mapValue!20497)) b!463048))

(assert (= (and b!463044 ((_ is ValueCellFull!5931) mapDefault!20497)) b!463047))

(assert (= start!41442 b!463044))

(declare-fun m!445769 () Bool)

(assert (=> b!463050 m!445769))

(declare-fun m!445771 () Bool)

(assert (=> b!463046 m!445771))

(declare-fun m!445773 () Bool)

(assert (=> mapNonEmpty!20497 m!445773))

(declare-fun m!445775 () Bool)

(assert (=> start!41442 m!445775))

(declare-fun m!445777 () Bool)

(assert (=> start!41442 m!445777))

(declare-fun m!445779 () Bool)

(assert (=> start!41442 m!445779))

(declare-fun m!445781 () Bool)

(assert (=> b!463049 m!445781))

(check-sat (not mapNonEmpty!20497) (not b!463046) (not b!463049) (not start!41442) (not b!463050) (not b_next!11121) tp_is_empty!12549 b_and!19457)
(check-sat b_and!19457 (not b_next!11121))
