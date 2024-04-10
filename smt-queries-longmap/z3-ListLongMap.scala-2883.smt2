; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41430 () Bool)

(assert start!41430)

(declare-fun b_free!11109 () Bool)

(declare-fun b_next!11109 () Bool)

(assert (=> start!41430 (= b_free!11109 (not b_next!11109))))

(declare-fun tp!39322 () Bool)

(declare-fun b_and!19445 () Bool)

(assert (=> start!41430 (= tp!39322 b_and!19445)))

(declare-fun b!462918 () Bool)

(declare-fun res!276819 () Bool)

(declare-fun e!270217 () Bool)

(assert (=> b!462918 (=> (not res!276819) (not e!270217))))

(declare-datatypes ((array!28875 0))(
  ( (array!28876 (arr!13870 (Array (_ BitVec 32) (_ BitVec 64))) (size!14222 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28875)

(declare-datatypes ((List!8365 0))(
  ( (Nil!8362) (Cons!8361 (h!9217 (_ BitVec 64)) (t!14309 List!8365)) )
))
(declare-fun arrayNoDuplicates!0 (array!28875 (_ BitVec 32) List!8365) Bool)

(assert (=> b!462918 (= res!276819 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8362))))

(declare-fun b!462919 () Bool)

(declare-fun e!270215 () Bool)

(declare-fun tp_is_empty!12537 () Bool)

(assert (=> b!462919 (= e!270215 tp_is_empty!12537)))

(declare-fun b!462920 () Bool)

(declare-fun e!270219 () Bool)

(assert (=> b!462920 (= e!270219 tp_is_empty!12537)))

(declare-fun b!462921 () Bool)

(declare-fun res!276821 () Bool)

(assert (=> b!462921 (=> (not res!276821) (not e!270217))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17821 0))(
  ( (V!17822 (val!6313 Int)) )
))
(declare-datatypes ((ValueCell!5925 0))(
  ( (ValueCellFull!5925 (v!8600 V!17821)) (EmptyCell!5925) )
))
(declare-datatypes ((array!28877 0))(
  ( (array!28878 (arr!13871 (Array (_ BitVec 32) ValueCell!5925)) (size!14223 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28877)

(assert (=> b!462921 (= res!276821 (and (= (size!14223 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14222 _keys!1025) (size!14223 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462922 () Bool)

(assert (=> b!462922 (= e!270217 false)))

(declare-datatypes ((tuple2!8274 0))(
  ( (tuple2!8275 (_1!4148 (_ BitVec 64)) (_2!4148 V!17821)) )
))
(declare-datatypes ((List!8366 0))(
  ( (Nil!8363) (Cons!8362 (h!9218 tuple2!8274) (t!14310 List!8366)) )
))
(declare-datatypes ((ListLongMap!7187 0))(
  ( (ListLongMap!7188 (toList!3609 List!8366)) )
))
(declare-fun lt!209279 () ListLongMap!7187)

(declare-fun minValueBefore!38 () V!17821)

(declare-fun zeroValue!794 () V!17821)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1789 (array!28875 array!28877 (_ BitVec 32) (_ BitVec 32) V!17821 V!17821 (_ BitVec 32) Int) ListLongMap!7187)

(assert (=> b!462922 (= lt!209279 (getCurrentListMapNoExtraKeys!1789 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462923 () Bool)

(declare-fun e!270216 () Bool)

(declare-fun mapRes!20479 () Bool)

(assert (=> b!462923 (= e!270216 (and e!270219 mapRes!20479))))

(declare-fun condMapEmpty!20479 () Bool)

(declare-fun mapDefault!20479 () ValueCell!5925)

(assert (=> b!462923 (= condMapEmpty!20479 (= (arr!13871 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5925)) mapDefault!20479)))))

(declare-fun b!462924 () Bool)

(declare-fun res!276820 () Bool)

(assert (=> b!462924 (=> (not res!276820) (not e!270217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28875 (_ BitVec 32)) Bool)

(assert (=> b!462924 (= res!276820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276818 () Bool)

(assert (=> start!41430 (=> (not res!276818) (not e!270217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41430 (= res!276818 (validMask!0 mask!1365))))

(assert (=> start!41430 e!270217))

(assert (=> start!41430 tp_is_empty!12537))

(assert (=> start!41430 tp!39322))

(assert (=> start!41430 true))

(declare-fun array_inv!10028 (array!28875) Bool)

(assert (=> start!41430 (array_inv!10028 _keys!1025)))

(declare-fun array_inv!10029 (array!28877) Bool)

(assert (=> start!41430 (and (array_inv!10029 _values!833) e!270216)))

(declare-fun mapNonEmpty!20479 () Bool)

(declare-fun tp!39321 () Bool)

(assert (=> mapNonEmpty!20479 (= mapRes!20479 (and tp!39321 e!270215))))

(declare-fun mapValue!20479 () ValueCell!5925)

(declare-fun mapRest!20479 () (Array (_ BitVec 32) ValueCell!5925))

(declare-fun mapKey!20479 () (_ BitVec 32))

(assert (=> mapNonEmpty!20479 (= (arr!13871 _values!833) (store mapRest!20479 mapKey!20479 mapValue!20479))))

(declare-fun mapIsEmpty!20479 () Bool)

(assert (=> mapIsEmpty!20479 mapRes!20479))

(assert (= (and start!41430 res!276818) b!462921))

(assert (= (and b!462921 res!276821) b!462924))

(assert (= (and b!462924 res!276820) b!462918))

(assert (= (and b!462918 res!276819) b!462922))

(assert (= (and b!462923 condMapEmpty!20479) mapIsEmpty!20479))

(assert (= (and b!462923 (not condMapEmpty!20479)) mapNonEmpty!20479))

(get-info :version)

(assert (= (and mapNonEmpty!20479 ((_ is ValueCellFull!5925) mapValue!20479)) b!462919))

(assert (= (and b!462923 ((_ is ValueCellFull!5925) mapDefault!20479)) b!462920))

(assert (= start!41430 b!462923))

(declare-fun m!445685 () Bool)

(assert (=> b!462918 m!445685))

(declare-fun m!445687 () Bool)

(assert (=> mapNonEmpty!20479 m!445687))

(declare-fun m!445689 () Bool)

(assert (=> start!41430 m!445689))

(declare-fun m!445691 () Bool)

(assert (=> start!41430 m!445691))

(declare-fun m!445693 () Bool)

(assert (=> start!41430 m!445693))

(declare-fun m!445695 () Bool)

(assert (=> b!462922 m!445695))

(declare-fun m!445697 () Bool)

(assert (=> b!462924 m!445697))

(check-sat (not b!462918) (not b!462924) (not b!462922) (not b_next!11109) tp_is_empty!12537 b_and!19445 (not mapNonEmpty!20479) (not start!41430))
(check-sat b_and!19445 (not b_next!11109))
