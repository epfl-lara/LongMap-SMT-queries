; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43298 () Bool)

(assert start!43298)

(declare-fun b_free!12165 () Bool)

(declare-fun b_next!12165 () Bool)

(assert (=> start!43298 (= b_free!12165 (not b_next!12165))))

(declare-fun tp!42765 () Bool)

(declare-fun b_and!20917 () Bool)

(assert (=> start!43298 (= tp!42765 b_and!20917)))

(declare-fun b!479699 () Bool)

(declare-fun e!282253 () Bool)

(declare-fun tp_is_empty!13677 () Bool)

(assert (=> b!479699 (= e!282253 tp_is_empty!13677)))

(declare-fun b!479700 () Bool)

(declare-fun e!282252 () Bool)

(assert (=> b!479700 (= e!282252 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19307 0))(
  ( (V!19308 (val!6886 Int)) )
))
(declare-fun minValue!1458 () V!19307)

(declare-fun zeroValue!1458 () V!19307)

(declare-datatypes ((ValueCell!6477 0))(
  ( (ValueCellFull!6477 (v!9175 V!19307)) (EmptyCell!6477) )
))
(declare-datatypes ((array!31021 0))(
  ( (array!31022 (arr!14917 (Array (_ BitVec 32) ValueCell!6477)) (size!15275 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31021)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31023 0))(
  ( (array!31024 (arr!14918 (Array (_ BitVec 32) (_ BitVec 64))) (size!15276 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31023)

(declare-fun lt!217900 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9038 0))(
  ( (tuple2!9039 (_1!4530 (_ BitVec 64)) (_2!4530 V!19307)) )
))
(declare-datatypes ((List!9116 0))(
  ( (Nil!9113) (Cons!9112 (h!9968 tuple2!9038) (t!15322 List!9116)) )
))
(declare-datatypes ((ListLongMap!7951 0))(
  ( (ListLongMap!7952 (toList!3991 List!9116)) )
))
(declare-fun contains!2601 (ListLongMap!7951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2310 (array!31023 array!31021 (_ BitVec 32) (_ BitVec 32) V!19307 V!19307 (_ BitVec 32) Int) ListLongMap!7951)

(assert (=> b!479700 (= lt!217900 (contains!2601 (getCurrentListMap!2310 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479701 () Bool)

(declare-fun e!282251 () Bool)

(declare-fun mapRes!22213 () Bool)

(assert (=> b!479701 (= e!282251 (and e!282253 mapRes!22213))))

(declare-fun condMapEmpty!22213 () Bool)

(declare-fun mapDefault!22213 () ValueCell!6477)

(assert (=> b!479701 (= condMapEmpty!22213 (= (arr!14917 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6477)) mapDefault!22213)))))

(declare-fun b!479702 () Bool)

(declare-fun res!286137 () Bool)

(assert (=> b!479702 (=> (not res!286137) (not e!282252))))

(declare-datatypes ((List!9117 0))(
  ( (Nil!9114) (Cons!9113 (h!9969 (_ BitVec 64)) (t!15323 List!9117)) )
))
(declare-fun arrayNoDuplicates!0 (array!31023 (_ BitVec 32) List!9117) Bool)

(assert (=> b!479702 (= res!286137 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9114))))

(declare-fun b!479703 () Bool)

(declare-fun res!286139 () Bool)

(assert (=> b!479703 (=> (not res!286139) (not e!282252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31023 (_ BitVec 32)) Bool)

(assert (=> b!479703 (= res!286139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22213 () Bool)

(declare-fun tp!42766 () Bool)

(declare-fun e!282254 () Bool)

(assert (=> mapNonEmpty!22213 (= mapRes!22213 (and tp!42766 e!282254))))

(declare-fun mapKey!22213 () (_ BitVec 32))

(declare-fun mapValue!22213 () ValueCell!6477)

(declare-fun mapRest!22213 () (Array (_ BitVec 32) ValueCell!6477))

(assert (=> mapNonEmpty!22213 (= (arr!14917 _values!1516) (store mapRest!22213 mapKey!22213 mapValue!22213))))

(declare-fun res!286138 () Bool)

(assert (=> start!43298 (=> (not res!286138) (not e!282252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43298 (= res!286138 (validMask!0 mask!2352))))

(assert (=> start!43298 e!282252))

(assert (=> start!43298 true))

(assert (=> start!43298 tp_is_empty!13677))

(declare-fun array_inv!10760 (array!31021) Bool)

(assert (=> start!43298 (and (array_inv!10760 _values!1516) e!282251)))

(assert (=> start!43298 tp!42765))

(declare-fun array_inv!10761 (array!31023) Bool)

(assert (=> start!43298 (array_inv!10761 _keys!1874)))

(declare-fun b!479704 () Bool)

(declare-fun res!286140 () Bool)

(assert (=> b!479704 (=> (not res!286140) (not e!282252))))

(assert (=> b!479704 (= res!286140 (and (= (size!15275 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15276 _keys!1874) (size!15275 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479705 () Bool)

(assert (=> b!479705 (= e!282254 tp_is_empty!13677)))

(declare-fun mapIsEmpty!22213 () Bool)

(assert (=> mapIsEmpty!22213 mapRes!22213))

(assert (= (and start!43298 res!286138) b!479704))

(assert (= (and b!479704 res!286140) b!479703))

(assert (= (and b!479703 res!286139) b!479702))

(assert (= (and b!479702 res!286137) b!479700))

(assert (= (and b!479701 condMapEmpty!22213) mapIsEmpty!22213))

(assert (= (and b!479701 (not condMapEmpty!22213)) mapNonEmpty!22213))

(get-info :version)

(assert (= (and mapNonEmpty!22213 ((_ is ValueCellFull!6477) mapValue!22213)) b!479705))

(assert (= (and b!479701 ((_ is ValueCellFull!6477) mapDefault!22213)) b!479699))

(assert (= start!43298 b!479701))

(declare-fun m!461583 () Bool)

(assert (=> b!479700 m!461583))

(assert (=> b!479700 m!461583))

(declare-fun m!461585 () Bool)

(assert (=> b!479700 m!461585))

(declare-fun m!461587 () Bool)

(assert (=> b!479702 m!461587))

(declare-fun m!461589 () Bool)

(assert (=> mapNonEmpty!22213 m!461589))

(declare-fun m!461591 () Bool)

(assert (=> b!479703 m!461591))

(declare-fun m!461593 () Bool)

(assert (=> start!43298 m!461593))

(declare-fun m!461595 () Bool)

(assert (=> start!43298 m!461595))

(declare-fun m!461597 () Bool)

(assert (=> start!43298 m!461597))

(check-sat (not b!479702) (not start!43298) (not b!479700) (not b_next!12165) (not mapNonEmpty!22213) b_and!20917 (not b!479703) tp_is_empty!13677)
(check-sat b_and!20917 (not b_next!12165))
