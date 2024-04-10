; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35338 () Bool)

(assert start!35338)

(declare-fun mapIsEmpty!13209 () Bool)

(declare-fun mapRes!13209 () Bool)

(assert (=> mapIsEmpty!13209 mapRes!13209))

(declare-fun b!353883 () Bool)

(declare-fun res!196195 () Bool)

(declare-fun e!216790 () Bool)

(assert (=> b!353883 (=> (not res!196195) (not e!216790))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11381 0))(
  ( (V!11382 (val!3946 Int)) )
))
(declare-datatypes ((ValueCell!3558 0))(
  ( (ValueCellFull!3558 (v!6140 V!11381)) (EmptyCell!3558) )
))
(declare-datatypes ((array!19201 0))(
  ( (array!19202 (arr!9095 (Array (_ BitVec 32) ValueCell!3558)) (size!9447 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19201)

(declare-datatypes ((array!19203 0))(
  ( (array!19204 (arr!9096 (Array (_ BitVec 32) (_ BitVec 64))) (size!9448 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19203)

(assert (=> b!353883 (= res!196195 (and (= (size!9447 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9448 _keys!1456) (size!9447 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13209 () Bool)

(declare-fun tp!27105 () Bool)

(declare-fun e!216792 () Bool)

(assert (=> mapNonEmpty!13209 (= mapRes!13209 (and tp!27105 e!216792))))

(declare-fun mapValue!13209 () ValueCell!3558)

(declare-fun mapRest!13209 () (Array (_ BitVec 32) ValueCell!3558))

(declare-fun mapKey!13209 () (_ BitVec 32))

(assert (=> mapNonEmpty!13209 (= (arr!9095 _values!1208) (store mapRest!13209 mapKey!13209 mapValue!13209))))

(declare-fun b!353884 () Bool)

(declare-fun res!196194 () Bool)

(assert (=> b!353884 (=> (not res!196194) (not e!216790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19203 (_ BitVec 32)) Bool)

(assert (=> b!353884 (= res!196194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196193 () Bool)

(assert (=> start!35338 (=> (not res!196193) (not e!216790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35338 (= res!196193 (validMask!0 mask!1842))))

(assert (=> start!35338 e!216790))

(assert (=> start!35338 true))

(declare-fun e!216793 () Bool)

(declare-fun array_inv!6696 (array!19201) Bool)

(assert (=> start!35338 (and (array_inv!6696 _values!1208) e!216793)))

(declare-fun array_inv!6697 (array!19203) Bool)

(assert (=> start!35338 (array_inv!6697 _keys!1456)))

(declare-fun b!353885 () Bool)

(declare-fun e!216794 () Bool)

(declare-fun tp_is_empty!7803 () Bool)

(assert (=> b!353885 (= e!216794 tp_is_empty!7803)))

(declare-fun b!353886 () Bool)

(assert (=> b!353886 (= e!216792 tp_is_empty!7803)))

(declare-fun b!353887 () Bool)

(assert (=> b!353887 (= e!216793 (and e!216794 mapRes!13209))))

(declare-fun condMapEmpty!13209 () Bool)

(declare-fun mapDefault!13209 () ValueCell!3558)

(assert (=> b!353887 (= condMapEmpty!13209 (= (arr!9095 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3558)) mapDefault!13209)))))

(declare-fun b!353888 () Bool)

(assert (=> b!353888 (= e!216790 false)))

(declare-fun lt!165620 () Bool)

(declare-datatypes ((List!5283 0))(
  ( (Nil!5280) (Cons!5279 (h!6135 (_ BitVec 64)) (t!10433 List!5283)) )
))
(declare-fun arrayNoDuplicates!0 (array!19203 (_ BitVec 32) List!5283) Bool)

(assert (=> b!353888 (= lt!165620 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5280))))

(assert (= (and start!35338 res!196193) b!353883))

(assert (= (and b!353883 res!196195) b!353884))

(assert (= (and b!353884 res!196194) b!353888))

(assert (= (and b!353887 condMapEmpty!13209) mapIsEmpty!13209))

(assert (= (and b!353887 (not condMapEmpty!13209)) mapNonEmpty!13209))

(get-info :version)

(assert (= (and mapNonEmpty!13209 ((_ is ValueCellFull!3558) mapValue!13209)) b!353886))

(assert (= (and b!353887 ((_ is ValueCellFull!3558) mapDefault!13209)) b!353885))

(assert (= start!35338 b!353887))

(declare-fun m!353095 () Bool)

(assert (=> mapNonEmpty!13209 m!353095))

(declare-fun m!353097 () Bool)

(assert (=> b!353884 m!353097))

(declare-fun m!353099 () Bool)

(assert (=> start!35338 m!353099))

(declare-fun m!353101 () Bool)

(assert (=> start!35338 m!353101))

(declare-fun m!353103 () Bool)

(assert (=> start!35338 m!353103))

(declare-fun m!353105 () Bool)

(assert (=> b!353888 m!353105))

(check-sat (not mapNonEmpty!13209) (not start!35338) tp_is_empty!7803 (not b!353884) (not b!353888))
(check-sat)
