; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41354 () Bool)

(assert start!41354)

(declare-fun b!462257 () Bool)

(declare-fun res!276474 () Bool)

(declare-fun e!269695 () Bool)

(assert (=> b!462257 (=> (not res!276474) (not e!269695))))

(declare-datatypes ((array!28745 0))(
  ( (array!28746 (arr!13806 (Array (_ BitVec 32) (_ BitVec 64))) (size!14158 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28745)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28745 (_ BitVec 32)) Bool)

(assert (=> b!462257 (= res!276474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462258 () Bool)

(assert (=> b!462258 (= e!269695 false)))

(declare-fun lt!209180 () Bool)

(declare-datatypes ((List!8336 0))(
  ( (Nil!8333) (Cons!8332 (h!9188 (_ BitVec 64)) (t!14280 List!8336)) )
))
(declare-fun arrayNoDuplicates!0 (array!28745 (_ BitVec 32) List!8336) Bool)

(assert (=> b!462258 (= lt!209180 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8333))))

(declare-fun mapIsEmpty!20377 () Bool)

(declare-fun mapRes!20377 () Bool)

(assert (=> mapIsEmpty!20377 mapRes!20377))

(declare-fun b!462259 () Bool)

(declare-fun e!269694 () Bool)

(declare-fun tp_is_empty!12471 () Bool)

(assert (=> b!462259 (= e!269694 tp_is_empty!12471)))

(declare-fun b!462260 () Bool)

(declare-fun res!276475 () Bool)

(assert (=> b!462260 (=> (not res!276475) (not e!269695))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17733 0))(
  ( (V!17734 (val!6280 Int)) )
))
(declare-datatypes ((ValueCell!5892 0))(
  ( (ValueCellFull!5892 (v!8567 V!17733)) (EmptyCell!5892) )
))
(declare-datatypes ((array!28747 0))(
  ( (array!28748 (arr!13807 (Array (_ BitVec 32) ValueCell!5892)) (size!14159 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28747)

(assert (=> b!462260 (= res!276475 (and (= (size!14159 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14158 _keys!1025) (size!14159 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276476 () Bool)

(assert (=> start!41354 (=> (not res!276476) (not e!269695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41354 (= res!276476 (validMask!0 mask!1365))))

(assert (=> start!41354 e!269695))

(assert (=> start!41354 true))

(declare-fun array_inv!9982 (array!28745) Bool)

(assert (=> start!41354 (array_inv!9982 _keys!1025)))

(declare-fun e!269696 () Bool)

(declare-fun array_inv!9983 (array!28747) Bool)

(assert (=> start!41354 (and (array_inv!9983 _values!833) e!269696)))

(declare-fun b!462261 () Bool)

(declare-fun e!269697 () Bool)

(assert (=> b!462261 (= e!269697 tp_is_empty!12471)))

(declare-fun b!462262 () Bool)

(assert (=> b!462262 (= e!269696 (and e!269694 mapRes!20377))))

(declare-fun condMapEmpty!20377 () Bool)

(declare-fun mapDefault!20377 () ValueCell!5892)

(assert (=> b!462262 (= condMapEmpty!20377 (= (arr!13807 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5892)) mapDefault!20377)))))

(declare-fun mapNonEmpty!20377 () Bool)

(declare-fun tp!39196 () Bool)

(assert (=> mapNonEmpty!20377 (= mapRes!20377 (and tp!39196 e!269697))))

(declare-fun mapRest!20377 () (Array (_ BitVec 32) ValueCell!5892))

(declare-fun mapKey!20377 () (_ BitVec 32))

(declare-fun mapValue!20377 () ValueCell!5892)

(assert (=> mapNonEmpty!20377 (= (arr!13807 _values!833) (store mapRest!20377 mapKey!20377 mapValue!20377))))

(assert (= (and start!41354 res!276476) b!462260))

(assert (= (and b!462260 res!276475) b!462257))

(assert (= (and b!462257 res!276474) b!462258))

(assert (= (and b!462262 condMapEmpty!20377) mapIsEmpty!20377))

(assert (= (and b!462262 (not condMapEmpty!20377)) mapNonEmpty!20377))

(get-info :version)

(assert (= (and mapNonEmpty!20377 ((_ is ValueCellFull!5892) mapValue!20377)) b!462261))

(assert (= (and b!462262 ((_ is ValueCellFull!5892) mapDefault!20377)) b!462259))

(assert (= start!41354 b!462262))

(declare-fun m!445257 () Bool)

(assert (=> b!462257 m!445257))

(declare-fun m!445259 () Bool)

(assert (=> b!462258 m!445259))

(declare-fun m!445261 () Bool)

(assert (=> start!41354 m!445261))

(declare-fun m!445263 () Bool)

(assert (=> start!41354 m!445263))

(declare-fun m!445265 () Bool)

(assert (=> start!41354 m!445265))

(declare-fun m!445267 () Bool)

(assert (=> mapNonEmpty!20377 m!445267))

(check-sat (not b!462257) (not mapNonEmpty!20377) (not b!462258) tp_is_empty!12471 (not start!41354))
(check-sat)
