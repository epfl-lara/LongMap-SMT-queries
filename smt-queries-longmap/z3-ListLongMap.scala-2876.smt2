; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41362 () Bool)

(assert start!41362)

(declare-fun b!462184 () Bool)

(declare-fun e!269688 () Bool)

(declare-fun tp_is_empty!12493 () Bool)

(assert (=> b!462184 (= e!269688 tp_is_empty!12493)))

(declare-fun b!462185 () Bool)

(declare-fun e!269687 () Bool)

(assert (=> b!462185 (= e!269687 false)))

(declare-fun lt!208979 () Bool)

(declare-datatypes ((array!28781 0))(
  ( (array!28782 (arr!13824 (Array (_ BitVec 32) (_ BitVec 64))) (size!14177 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28781)

(declare-datatypes ((List!8364 0))(
  ( (Nil!8361) (Cons!8360 (h!9216 (_ BitVec 64)) (t!14299 List!8364)) )
))
(declare-fun arrayNoDuplicates!0 (array!28781 (_ BitVec 32) List!8364) Bool)

(assert (=> b!462185 (= lt!208979 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8361))))

(declare-fun b!462186 () Bool)

(declare-fun e!269684 () Bool)

(assert (=> b!462186 (= e!269684 tp_is_empty!12493)))

(declare-fun b!462187 () Bool)

(declare-fun res!276445 () Bool)

(assert (=> b!462187 (=> (not res!276445) (not e!269687))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((V!17763 0))(
  ( (V!17764 (val!6291 Int)) )
))
(declare-datatypes ((ValueCell!5903 0))(
  ( (ValueCellFull!5903 (v!8572 V!17763)) (EmptyCell!5903) )
))
(declare-datatypes ((array!28783 0))(
  ( (array!28784 (arr!13825 (Array (_ BitVec 32) ValueCell!5903)) (size!14178 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28783)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462187 (= res!276445 (and (= (size!14178 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14177 _keys!1025) (size!14178 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276444 () Bool)

(assert (=> start!41362 (=> (not res!276444) (not e!269687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41362 (= res!276444 (validMask!0 mask!1365))))

(assert (=> start!41362 e!269687))

(assert (=> start!41362 true))

(declare-fun array_inv!10066 (array!28781) Bool)

(assert (=> start!41362 (array_inv!10066 _keys!1025)))

(declare-fun e!269686 () Bool)

(declare-fun array_inv!10067 (array!28783) Bool)

(assert (=> start!41362 (and (array_inv!10067 _values!833) e!269686)))

(declare-fun b!462188 () Bool)

(declare-fun res!276446 () Bool)

(assert (=> b!462188 (=> (not res!276446) (not e!269687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28781 (_ BitVec 32)) Bool)

(assert (=> b!462188 (= res!276446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20410 () Bool)

(declare-fun mapRes!20410 () Bool)

(declare-fun tp!39229 () Bool)

(assert (=> mapNonEmpty!20410 (= mapRes!20410 (and tp!39229 e!269684))))

(declare-fun mapValue!20410 () ValueCell!5903)

(declare-fun mapRest!20410 () (Array (_ BitVec 32) ValueCell!5903))

(declare-fun mapKey!20410 () (_ BitVec 32))

(assert (=> mapNonEmpty!20410 (= (arr!13825 _values!833) (store mapRest!20410 mapKey!20410 mapValue!20410))))

(declare-fun mapIsEmpty!20410 () Bool)

(assert (=> mapIsEmpty!20410 mapRes!20410))

(declare-fun b!462189 () Bool)

(assert (=> b!462189 (= e!269686 (and e!269688 mapRes!20410))))

(declare-fun condMapEmpty!20410 () Bool)

(declare-fun mapDefault!20410 () ValueCell!5903)

(assert (=> b!462189 (= condMapEmpty!20410 (= (arr!13825 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5903)) mapDefault!20410)))))

(assert (= (and start!41362 res!276444) b!462187))

(assert (= (and b!462187 res!276445) b!462188))

(assert (= (and b!462188 res!276446) b!462185))

(assert (= (and b!462189 condMapEmpty!20410) mapIsEmpty!20410))

(assert (= (and b!462189 (not condMapEmpty!20410)) mapNonEmpty!20410))

(get-info :version)

(assert (= (and mapNonEmpty!20410 ((_ is ValueCellFull!5903) mapValue!20410)) b!462186))

(assert (= (and b!462189 ((_ is ValueCellFull!5903) mapDefault!20410)) b!462184))

(assert (= start!41362 b!462189))

(declare-fun m!444655 () Bool)

(assert (=> b!462185 m!444655))

(declare-fun m!444657 () Bool)

(assert (=> start!41362 m!444657))

(declare-fun m!444659 () Bool)

(assert (=> start!41362 m!444659))

(declare-fun m!444661 () Bool)

(assert (=> start!41362 m!444661))

(declare-fun m!444663 () Bool)

(assert (=> b!462188 m!444663))

(declare-fun m!444665 () Bool)

(assert (=> mapNonEmpty!20410 m!444665))

(check-sat (not mapNonEmpty!20410) (not b!462185) (not start!41362) (not b!462188) tp_is_empty!12493)
(check-sat)
