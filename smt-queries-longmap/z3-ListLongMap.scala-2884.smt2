; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41436 () Bool)

(assert start!41436)

(declare-fun b_free!11115 () Bool)

(declare-fun b_next!11115 () Bool)

(assert (=> start!41436 (= b_free!11115 (not b_next!11115))))

(declare-fun tp!39340 () Bool)

(declare-fun b_and!19451 () Bool)

(assert (=> start!41436 (= tp!39340 b_and!19451)))

(declare-fun b!462981 () Bool)

(declare-fun res!276856 () Bool)

(declare-fun e!270261 () Bool)

(assert (=> b!462981 (=> (not res!276856) (not e!270261))))

(declare-datatypes ((array!28885 0))(
  ( (array!28886 (arr!13875 (Array (_ BitVec 32) (_ BitVec 64))) (size!14227 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28885)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28885 (_ BitVec 32)) Bool)

(assert (=> b!462981 (= res!276856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462982 () Bool)

(declare-fun e!270260 () Bool)

(declare-fun tp_is_empty!12543 () Bool)

(assert (=> b!462982 (= e!270260 tp_is_empty!12543)))

(declare-fun b!462983 () Bool)

(assert (=> b!462983 (= e!270261 false)))

(declare-datatypes ((V!17829 0))(
  ( (V!17830 (val!6316 Int)) )
))
(declare-fun minValueBefore!38 () V!17829)

(declare-fun zeroValue!794 () V!17829)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8278 0))(
  ( (tuple2!8279 (_1!4150 (_ BitVec 64)) (_2!4150 V!17829)) )
))
(declare-datatypes ((List!8368 0))(
  ( (Nil!8365) (Cons!8364 (h!9220 tuple2!8278) (t!14312 List!8368)) )
))
(declare-datatypes ((ListLongMap!7191 0))(
  ( (ListLongMap!7192 (toList!3611 List!8368)) )
))
(declare-fun lt!209288 () ListLongMap!7191)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5928 0))(
  ( (ValueCellFull!5928 (v!8603 V!17829)) (EmptyCell!5928) )
))
(declare-datatypes ((array!28887 0))(
  ( (array!28888 (arr!13876 (Array (_ BitVec 32) ValueCell!5928)) (size!14228 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28887)

(declare-fun getCurrentListMapNoExtraKeys!1791 (array!28885 array!28887 (_ BitVec 32) (_ BitVec 32) V!17829 V!17829 (_ BitVec 32) Int) ListLongMap!7191)

(assert (=> b!462983 (= lt!209288 (getCurrentListMapNoExtraKeys!1791 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462984 () Bool)

(declare-fun res!276857 () Bool)

(assert (=> b!462984 (=> (not res!276857) (not e!270261))))

(declare-datatypes ((List!8369 0))(
  ( (Nil!8366) (Cons!8365 (h!9221 (_ BitVec 64)) (t!14313 List!8369)) )
))
(declare-fun arrayNoDuplicates!0 (array!28885 (_ BitVec 32) List!8369) Bool)

(assert (=> b!462984 (= res!276857 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8366))))

(declare-fun b!462985 () Bool)

(declare-fun e!270263 () Bool)

(assert (=> b!462985 (= e!270263 tp_is_empty!12543)))

(declare-fun b!462986 () Bool)

(declare-fun e!270262 () Bool)

(declare-fun mapRes!20488 () Bool)

(assert (=> b!462986 (= e!270262 (and e!270263 mapRes!20488))))

(declare-fun condMapEmpty!20488 () Bool)

(declare-fun mapDefault!20488 () ValueCell!5928)

(assert (=> b!462986 (= condMapEmpty!20488 (= (arr!13876 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5928)) mapDefault!20488)))))

(declare-fun mapIsEmpty!20488 () Bool)

(assert (=> mapIsEmpty!20488 mapRes!20488))

(declare-fun b!462987 () Bool)

(declare-fun res!276854 () Bool)

(assert (=> b!462987 (=> (not res!276854) (not e!270261))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462987 (= res!276854 (and (= (size!14228 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14227 _keys!1025) (size!14228 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276855 () Bool)

(assert (=> start!41436 (=> (not res!276855) (not e!270261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41436 (= res!276855 (validMask!0 mask!1365))))

(assert (=> start!41436 e!270261))

(assert (=> start!41436 tp_is_empty!12543))

(assert (=> start!41436 tp!39340))

(assert (=> start!41436 true))

(declare-fun array_inv!10030 (array!28885) Bool)

(assert (=> start!41436 (array_inv!10030 _keys!1025)))

(declare-fun array_inv!10031 (array!28887) Bool)

(assert (=> start!41436 (and (array_inv!10031 _values!833) e!270262)))

(declare-fun mapNonEmpty!20488 () Bool)

(declare-fun tp!39339 () Bool)

(assert (=> mapNonEmpty!20488 (= mapRes!20488 (and tp!39339 e!270260))))

(declare-fun mapRest!20488 () (Array (_ BitVec 32) ValueCell!5928))

(declare-fun mapValue!20488 () ValueCell!5928)

(declare-fun mapKey!20488 () (_ BitVec 32))

(assert (=> mapNonEmpty!20488 (= (arr!13876 _values!833) (store mapRest!20488 mapKey!20488 mapValue!20488))))

(assert (= (and start!41436 res!276855) b!462987))

(assert (= (and b!462987 res!276854) b!462981))

(assert (= (and b!462981 res!276856) b!462984))

(assert (= (and b!462984 res!276857) b!462983))

(assert (= (and b!462986 condMapEmpty!20488) mapIsEmpty!20488))

(assert (= (and b!462986 (not condMapEmpty!20488)) mapNonEmpty!20488))

(get-info :version)

(assert (= (and mapNonEmpty!20488 ((_ is ValueCellFull!5928) mapValue!20488)) b!462982))

(assert (= (and b!462986 ((_ is ValueCellFull!5928) mapDefault!20488)) b!462985))

(assert (= start!41436 b!462986))

(declare-fun m!445727 () Bool)

(assert (=> start!41436 m!445727))

(declare-fun m!445729 () Bool)

(assert (=> start!41436 m!445729))

(declare-fun m!445731 () Bool)

(assert (=> start!41436 m!445731))

(declare-fun m!445733 () Bool)

(assert (=> mapNonEmpty!20488 m!445733))

(declare-fun m!445735 () Bool)

(assert (=> b!462984 m!445735))

(declare-fun m!445737 () Bool)

(assert (=> b!462981 m!445737))

(declare-fun m!445739 () Bool)

(assert (=> b!462983 m!445739))

(check-sat tp_is_empty!12543 (not mapNonEmpty!20488) b_and!19451 (not b_next!11115) (not start!41436) (not b!462983) (not b!462981) (not b!462984))
(check-sat b_and!19451 (not b_next!11115))
