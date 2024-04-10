; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20822 () Bool)

(assert start!20822)

(declare-fun b_free!5475 () Bool)

(declare-fun b_next!5475 () Bool)

(assert (=> start!20822 (= b_free!5475 (not b_next!5475))))

(declare-fun tp!19465 () Bool)

(declare-fun b_and!12221 () Bool)

(assert (=> start!20822 (= tp!19465 b_and!12221)))

(declare-fun mapNonEmpty!9074 () Bool)

(declare-fun mapRes!9074 () Bool)

(declare-fun tp!19466 () Bool)

(declare-fun e!136124 () Bool)

(assert (=> mapNonEmpty!9074 (= mapRes!9074 (and tp!19466 e!136124))))

(declare-datatypes ((V!6763 0))(
  ( (V!6764 (val!2713 Int)) )
))
(declare-datatypes ((ValueCell!2325 0))(
  ( (ValueCellFull!2325 (v!4683 V!6763)) (EmptyCell!2325) )
))
(declare-fun mapRest!9074 () (Array (_ BitVec 32) ValueCell!2325))

(declare-datatypes ((array!9877 0))(
  ( (array!9878 (arr!4689 (Array (_ BitVec 32) ValueCell!2325)) (size!5014 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9877)

(declare-fun mapValue!9074 () ValueCell!2325)

(declare-fun mapKey!9074 () (_ BitVec 32))

(assert (=> mapNonEmpty!9074 (= (arr!4689 _values!649) (store mapRest!9074 mapKey!9074 mapValue!9074))))

(declare-fun res!101647 () Bool)

(declare-fun e!136121 () Bool)

(assert (=> start!20822 (=> (not res!101647) (not e!136121))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20822 (= res!101647 (validMask!0 mask!1149))))

(assert (=> start!20822 e!136121))

(declare-fun e!136122 () Bool)

(declare-fun array_inv!3111 (array!9877) Bool)

(assert (=> start!20822 (and (array_inv!3111 _values!649) e!136122)))

(assert (=> start!20822 true))

(declare-fun tp_is_empty!5337 () Bool)

(assert (=> start!20822 tp_is_empty!5337))

(declare-datatypes ((array!9879 0))(
  ( (array!9880 (arr!4690 (Array (_ BitVec 32) (_ BitVec 64))) (size!5015 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9879)

(declare-fun array_inv!3112 (array!9879) Bool)

(assert (=> start!20822 (array_inv!3112 _keys!825)))

(assert (=> start!20822 tp!19465))

(declare-fun b!208790 () Bool)

(declare-fun res!101642 () Bool)

(assert (=> b!208790 (=> (not res!101642) (not e!136121))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208790 (= res!101642 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5015 _keys!825))))))

(declare-fun b!208791 () Bool)

(declare-fun e!136120 () Bool)

(assert (=> b!208791 (= e!136122 (and e!136120 mapRes!9074))))

(declare-fun condMapEmpty!9074 () Bool)

(declare-fun mapDefault!9074 () ValueCell!2325)

(assert (=> b!208791 (= condMapEmpty!9074 (= (arr!4689 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2325)) mapDefault!9074)))))

(declare-fun mapIsEmpty!9074 () Bool)

(assert (=> mapIsEmpty!9074 mapRes!9074))

(declare-fun b!208792 () Bool)

(declare-fun res!101641 () Bool)

(assert (=> b!208792 (=> (not res!101641) (not e!136121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9879 (_ BitVec 32)) Bool)

(assert (=> b!208792 (= res!101641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208793 () Bool)

(assert (=> b!208793 (= e!136121 false)))

(declare-datatypes ((tuple2!4106 0))(
  ( (tuple2!4107 (_1!2064 (_ BitVec 64)) (_2!2064 V!6763)) )
))
(declare-datatypes ((List!3003 0))(
  ( (Nil!3000) (Cons!2999 (h!3641 tuple2!4106) (t!7934 List!3003)) )
))
(declare-datatypes ((ListLongMap!3019 0))(
  ( (ListLongMap!3020 (toList!1525 List!3003)) )
))
(declare-fun lt!106857 () ListLongMap!3019)

(declare-fun v!520 () V!6763)

(declare-fun zeroValue!615 () V!6763)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6763)

(declare-fun getCurrentListMapNoExtraKeys!466 (array!9879 array!9877 (_ BitVec 32) (_ BitVec 32) V!6763 V!6763 (_ BitVec 32) Int) ListLongMap!3019)

(assert (=> b!208793 (= lt!106857 (getCurrentListMapNoExtraKeys!466 _keys!825 (array!9878 (store (arr!4689 _values!649) i!601 (ValueCellFull!2325 v!520)) (size!5014 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106856 () ListLongMap!3019)

(assert (=> b!208793 (= lt!106856 (getCurrentListMapNoExtraKeys!466 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208794 () Bool)

(declare-fun res!101643 () Bool)

(assert (=> b!208794 (=> (not res!101643) (not e!136121))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208794 (= res!101643 (= (select (arr!4690 _keys!825) i!601) k0!843))))

(declare-fun b!208795 () Bool)

(assert (=> b!208795 (= e!136120 tp_is_empty!5337)))

(declare-fun b!208796 () Bool)

(declare-fun res!101645 () Bool)

(assert (=> b!208796 (=> (not res!101645) (not e!136121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208796 (= res!101645 (validKeyInArray!0 k0!843))))

(declare-fun b!208797 () Bool)

(declare-fun res!101646 () Bool)

(assert (=> b!208797 (=> (not res!101646) (not e!136121))))

(declare-datatypes ((List!3004 0))(
  ( (Nil!3001) (Cons!3000 (h!3642 (_ BitVec 64)) (t!7935 List!3004)) )
))
(declare-fun arrayNoDuplicates!0 (array!9879 (_ BitVec 32) List!3004) Bool)

(assert (=> b!208797 (= res!101646 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3001))))

(declare-fun b!208798 () Bool)

(declare-fun res!101644 () Bool)

(assert (=> b!208798 (=> (not res!101644) (not e!136121))))

(assert (=> b!208798 (= res!101644 (and (= (size!5014 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5015 _keys!825) (size!5014 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208799 () Bool)

(assert (=> b!208799 (= e!136124 tp_is_empty!5337)))

(assert (= (and start!20822 res!101647) b!208798))

(assert (= (and b!208798 res!101644) b!208792))

(assert (= (and b!208792 res!101641) b!208797))

(assert (= (and b!208797 res!101646) b!208790))

(assert (= (and b!208790 res!101642) b!208796))

(assert (= (and b!208796 res!101645) b!208794))

(assert (= (and b!208794 res!101643) b!208793))

(assert (= (and b!208791 condMapEmpty!9074) mapIsEmpty!9074))

(assert (= (and b!208791 (not condMapEmpty!9074)) mapNonEmpty!9074))

(get-info :version)

(assert (= (and mapNonEmpty!9074 ((_ is ValueCellFull!2325) mapValue!9074)) b!208799))

(assert (= (and b!208791 ((_ is ValueCellFull!2325) mapDefault!9074)) b!208795))

(assert (= start!20822 b!208791))

(declare-fun m!236327 () Bool)

(assert (=> mapNonEmpty!9074 m!236327))

(declare-fun m!236329 () Bool)

(assert (=> b!208792 m!236329))

(declare-fun m!236331 () Bool)

(assert (=> start!20822 m!236331))

(declare-fun m!236333 () Bool)

(assert (=> start!20822 m!236333))

(declare-fun m!236335 () Bool)

(assert (=> start!20822 m!236335))

(declare-fun m!236337 () Bool)

(assert (=> b!208793 m!236337))

(declare-fun m!236339 () Bool)

(assert (=> b!208793 m!236339))

(declare-fun m!236341 () Bool)

(assert (=> b!208793 m!236341))

(declare-fun m!236343 () Bool)

(assert (=> b!208796 m!236343))

(declare-fun m!236345 () Bool)

(assert (=> b!208794 m!236345))

(declare-fun m!236347 () Bool)

(assert (=> b!208797 m!236347))

(check-sat (not b!208796) (not start!20822) (not b!208797) (not b!208793) (not b_next!5475) (not mapNonEmpty!9074) (not b!208792) b_and!12221 tp_is_empty!5337)
(check-sat b_and!12221 (not b_next!5475))
