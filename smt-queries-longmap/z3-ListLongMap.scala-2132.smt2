; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36040 () Bool)

(assert start!36040)

(declare-fun res!201378 () Bool)

(declare-fun e!221674 () Bool)

(assert (=> start!36040 (=> (not res!201378) (not e!221674))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36040 (= res!201378 (validMask!0 mask!1943))))

(assert (=> start!36040 e!221674))

(assert (=> start!36040 true))

(declare-datatypes ((V!12195 0))(
  ( (V!12196 (val!4251 Int)) )
))
(declare-datatypes ((ValueCell!3863 0))(
  ( (ValueCellFull!3863 (v!6447 V!12195)) (EmptyCell!3863) )
))
(declare-datatypes ((array!20368 0))(
  ( (array!20369 (arr!9668 (Array (_ BitVec 32) ValueCell!3863)) (size!10020 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20368)

(declare-fun e!221672 () Bool)

(declare-fun array_inv!7142 (array!20368) Bool)

(assert (=> start!36040 (and (array_inv!7142 _values!1277) e!221672)))

(declare-datatypes ((array!20370 0))(
  ( (array!20371 (arr!9669 (Array (_ BitVec 32) (_ BitVec 64))) (size!10021 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20370)

(declare-fun array_inv!7143 (array!20370) Bool)

(assert (=> start!36040 (array_inv!7143 _keys!1541)))

(declare-fun b!361927 () Bool)

(assert (=> b!361927 (= e!221674 false)))

(declare-fun lt!166623 () Bool)

(declare-datatypes ((List!5431 0))(
  ( (Nil!5428) (Cons!5427 (h!6283 (_ BitVec 64)) (t!10573 List!5431)) )
))
(declare-fun arrayNoDuplicates!0 (array!20370 (_ BitVec 32) List!5431) Bool)

(assert (=> b!361927 (= lt!166623 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5428))))

(declare-fun b!361928 () Bool)

(declare-fun e!221675 () Bool)

(declare-fun tp_is_empty!8413 () Bool)

(assert (=> b!361928 (= e!221675 tp_is_empty!8413)))

(declare-fun b!361929 () Bool)

(declare-fun res!201380 () Bool)

(assert (=> b!361929 (=> (not res!201380) (not e!221674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20370 (_ BitVec 32)) Bool)

(assert (=> b!361929 (= res!201380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361930 () Bool)

(declare-fun e!221671 () Bool)

(declare-fun mapRes!14154 () Bool)

(assert (=> b!361930 (= e!221672 (and e!221671 mapRes!14154))))

(declare-fun condMapEmpty!14154 () Bool)

(declare-fun mapDefault!14154 () ValueCell!3863)

(assert (=> b!361930 (= condMapEmpty!14154 (= (arr!9668 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3863)) mapDefault!14154)))))

(declare-fun b!361931 () Bool)

(assert (=> b!361931 (= e!221671 tp_is_empty!8413)))

(declare-fun mapNonEmpty!14154 () Bool)

(declare-fun tp!28230 () Bool)

(assert (=> mapNonEmpty!14154 (= mapRes!14154 (and tp!28230 e!221675))))

(declare-fun mapValue!14154 () ValueCell!3863)

(declare-fun mapRest!14154 () (Array (_ BitVec 32) ValueCell!3863))

(declare-fun mapKey!14154 () (_ BitVec 32))

(assert (=> mapNonEmpty!14154 (= (arr!9668 _values!1277) (store mapRest!14154 mapKey!14154 mapValue!14154))))

(declare-fun b!361932 () Bool)

(declare-fun res!201379 () Bool)

(assert (=> b!361932 (=> (not res!201379) (not e!221674))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361932 (= res!201379 (and (= (size!10020 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10021 _keys!1541) (size!10020 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14154 () Bool)

(assert (=> mapIsEmpty!14154 mapRes!14154))

(assert (= (and start!36040 res!201378) b!361932))

(assert (= (and b!361932 res!201379) b!361929))

(assert (= (and b!361929 res!201380) b!361927))

(assert (= (and b!361930 condMapEmpty!14154) mapIsEmpty!14154))

(assert (= (and b!361930 (not condMapEmpty!14154)) mapNonEmpty!14154))

(get-info :version)

(assert (= (and mapNonEmpty!14154 ((_ is ValueCellFull!3863) mapValue!14154)) b!361928))

(assert (= (and b!361930 ((_ is ValueCellFull!3863) mapDefault!14154)) b!361931))

(assert (= start!36040 b!361930))

(declare-fun m!358807 () Bool)

(assert (=> start!36040 m!358807))

(declare-fun m!358809 () Bool)

(assert (=> start!36040 m!358809))

(declare-fun m!358811 () Bool)

(assert (=> start!36040 m!358811))

(declare-fun m!358813 () Bool)

(assert (=> b!361927 m!358813))

(declare-fun m!358815 () Bool)

(assert (=> b!361929 m!358815))

(declare-fun m!358817 () Bool)

(assert (=> mapNonEmpty!14154 m!358817))

(check-sat (not b!361927) (not mapNonEmpty!14154) (not start!36040) (not b!361929) tp_is_empty!8413)
(check-sat)
