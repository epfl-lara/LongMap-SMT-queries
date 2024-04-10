; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41532 () Bool)

(assert start!41532)

(declare-fun b_free!11199 () Bool)

(declare-fun b_next!11199 () Bool)

(assert (=> start!41532 (= b_free!11199 (not b_next!11199))))

(declare-fun tp!39595 () Bool)

(declare-fun b_and!19539 () Bool)

(assert (=> start!41532 (= tp!39595 b_and!19539)))

(declare-fun b!463936 () Bool)

(declare-fun res!277386 () Bool)

(declare-fun e!270941 () Bool)

(assert (=> b!463936 (=> (not res!277386) (not e!270941))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29043 0))(
  ( (array!29044 (arr!13953 (Array (_ BitVec 32) (_ BitVec 64))) (size!14305 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29043)

(declare-datatypes ((V!17941 0))(
  ( (V!17942 (val!6358 Int)) )
))
(declare-datatypes ((ValueCell!5970 0))(
  ( (ValueCellFull!5970 (v!8645 V!17941)) (EmptyCell!5970) )
))
(declare-datatypes ((array!29045 0))(
  ( (array!29046 (arr!13954 (Array (_ BitVec 32) ValueCell!5970)) (size!14306 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29045)

(assert (=> b!463936 (= res!277386 (and (= (size!14306 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14305 _keys!1025) (size!14306 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463937 () Bool)

(declare-fun res!277388 () Bool)

(assert (=> b!463937 (=> (not res!277388) (not e!270941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29043 (_ BitVec 32)) Bool)

(assert (=> b!463937 (= res!277388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20617 () Bool)

(declare-fun mapRes!20617 () Bool)

(declare-fun tp!39594 () Bool)

(declare-fun e!270939 () Bool)

(assert (=> mapNonEmpty!20617 (= mapRes!20617 (and tp!39594 e!270939))))

(declare-fun mapRest!20617 () (Array (_ BitVec 32) ValueCell!5970))

(declare-fun mapKey!20617 () (_ BitVec 32))

(declare-fun mapValue!20617 () ValueCell!5970)

(assert (=> mapNonEmpty!20617 (= (arr!13954 _values!833) (store mapRest!20617 mapKey!20617 mapValue!20617))))

(declare-fun b!463938 () Bool)

(declare-fun tp_is_empty!12627 () Bool)

(assert (=> b!463938 (= e!270939 tp_is_empty!12627)))

(declare-fun b!463939 () Bool)

(assert (=> b!463939 (= e!270941 false)))

(declare-datatypes ((tuple2!8328 0))(
  ( (tuple2!8329 (_1!4175 (_ BitVec 64)) (_2!4175 V!17941)) )
))
(declare-datatypes ((List!8423 0))(
  ( (Nil!8420) (Cons!8419 (h!9275 tuple2!8328) (t!14369 List!8423)) )
))
(declare-datatypes ((ListLongMap!7241 0))(
  ( (ListLongMap!7242 (toList!3636 List!8423)) )
))
(declare-fun lt!209522 () ListLongMap!7241)

(declare-fun zeroValue!794 () V!17941)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17941)

(declare-fun getCurrentListMapNoExtraKeys!1816 (array!29043 array!29045 (_ BitVec 32) (_ BitVec 32) V!17941 V!17941 (_ BitVec 32) Int) ListLongMap!7241)

(assert (=> b!463939 (= lt!209522 (getCurrentListMapNoExtraKeys!1816 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17941)

(declare-fun lt!209521 () ListLongMap!7241)

(assert (=> b!463939 (= lt!209521 (getCurrentListMapNoExtraKeys!1816 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20617 () Bool)

(assert (=> mapIsEmpty!20617 mapRes!20617))

(declare-fun b!463940 () Bool)

(declare-fun res!277385 () Bool)

(assert (=> b!463940 (=> (not res!277385) (not e!270941))))

(declare-datatypes ((List!8424 0))(
  ( (Nil!8421) (Cons!8420 (h!9276 (_ BitVec 64)) (t!14370 List!8424)) )
))
(declare-fun arrayNoDuplicates!0 (array!29043 (_ BitVec 32) List!8424) Bool)

(assert (=> b!463940 (= res!277385 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8421))))

(declare-fun b!463941 () Bool)

(declare-fun e!270938 () Bool)

(assert (=> b!463941 (= e!270938 tp_is_empty!12627)))

(declare-fun res!277387 () Bool)

(assert (=> start!41532 (=> (not res!277387) (not e!270941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41532 (= res!277387 (validMask!0 mask!1365))))

(assert (=> start!41532 e!270941))

(assert (=> start!41532 tp_is_empty!12627))

(assert (=> start!41532 tp!39595))

(assert (=> start!41532 true))

(declare-fun array_inv!10084 (array!29043) Bool)

(assert (=> start!41532 (array_inv!10084 _keys!1025)))

(declare-fun e!270940 () Bool)

(declare-fun array_inv!10085 (array!29045) Bool)

(assert (=> start!41532 (and (array_inv!10085 _values!833) e!270940)))

(declare-fun b!463942 () Bool)

(assert (=> b!463942 (= e!270940 (and e!270938 mapRes!20617))))

(declare-fun condMapEmpty!20617 () Bool)

(declare-fun mapDefault!20617 () ValueCell!5970)

(assert (=> b!463942 (= condMapEmpty!20617 (= (arr!13954 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5970)) mapDefault!20617)))))

(assert (= (and start!41532 res!277387) b!463936))

(assert (= (and b!463936 res!277386) b!463937))

(assert (= (and b!463937 res!277388) b!463940))

(assert (= (and b!463940 res!277385) b!463939))

(assert (= (and b!463942 condMapEmpty!20617) mapIsEmpty!20617))

(assert (= (and b!463942 (not condMapEmpty!20617)) mapNonEmpty!20617))

(get-info :version)

(assert (= (and mapNonEmpty!20617 ((_ is ValueCellFull!5970) mapValue!20617)) b!463938))

(assert (= (and b!463942 ((_ is ValueCellFull!5970) mapDefault!20617)) b!463941))

(assert (= start!41532 b!463942))

(declare-fun m!446409 () Bool)

(assert (=> start!41532 m!446409))

(declare-fun m!446411 () Bool)

(assert (=> start!41532 m!446411))

(declare-fun m!446413 () Bool)

(assert (=> start!41532 m!446413))

(declare-fun m!446415 () Bool)

(assert (=> mapNonEmpty!20617 m!446415))

(declare-fun m!446417 () Bool)

(assert (=> b!463937 m!446417))

(declare-fun m!446419 () Bool)

(assert (=> b!463939 m!446419))

(declare-fun m!446421 () Bool)

(assert (=> b!463939 m!446421))

(declare-fun m!446423 () Bool)

(assert (=> b!463940 m!446423))

(check-sat (not b!463937) (not b_next!11199) (not mapNonEmpty!20617) b_and!19539 (not b!463939) (not b!463940) tp_is_empty!12627 (not start!41532))
(check-sat b_and!19539 (not b_next!11199))
