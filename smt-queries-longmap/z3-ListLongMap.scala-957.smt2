; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20840 () Bool)

(assert start!20840)

(declare-fun b_free!5493 () Bool)

(declare-fun b_next!5493 () Bool)

(assert (=> start!20840 (= b_free!5493 (not b_next!5493))))

(declare-fun tp!19519 () Bool)

(declare-fun b_and!12239 () Bool)

(assert (=> start!20840 (= tp!19519 b_and!12239)))

(declare-fun b!209060 () Bool)

(declare-fun e!136257 () Bool)

(declare-fun e!136256 () Bool)

(declare-fun mapRes!9101 () Bool)

(assert (=> b!209060 (= e!136257 (and e!136256 mapRes!9101))))

(declare-fun condMapEmpty!9101 () Bool)

(declare-datatypes ((V!6787 0))(
  ( (V!6788 (val!2722 Int)) )
))
(declare-datatypes ((ValueCell!2334 0))(
  ( (ValueCellFull!2334 (v!4692 V!6787)) (EmptyCell!2334) )
))
(declare-datatypes ((array!9911 0))(
  ( (array!9912 (arr!4706 (Array (_ BitVec 32) ValueCell!2334)) (size!5031 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9911)

(declare-fun mapDefault!9101 () ValueCell!2334)

(assert (=> b!209060 (= condMapEmpty!9101 (= (arr!4706 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2334)) mapDefault!9101)))))

(declare-fun res!101835 () Bool)

(declare-fun e!136255 () Bool)

(assert (=> start!20840 (=> (not res!101835) (not e!136255))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20840 (= res!101835 (validMask!0 mask!1149))))

(assert (=> start!20840 e!136255))

(declare-fun array_inv!3119 (array!9911) Bool)

(assert (=> start!20840 (and (array_inv!3119 _values!649) e!136257)))

(assert (=> start!20840 true))

(declare-fun tp_is_empty!5355 () Bool)

(assert (=> start!20840 tp_is_empty!5355))

(declare-datatypes ((array!9913 0))(
  ( (array!9914 (arr!4707 (Array (_ BitVec 32) (_ BitVec 64))) (size!5032 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9913)

(declare-fun array_inv!3120 (array!9913) Bool)

(assert (=> start!20840 (array_inv!3120 _keys!825)))

(assert (=> start!20840 tp!19519))

(declare-fun b!209061 () Bool)

(assert (=> b!209061 (= e!136256 tp_is_empty!5355)))

(declare-fun mapIsEmpty!9101 () Bool)

(assert (=> mapIsEmpty!9101 mapRes!9101))

(declare-fun b!209062 () Bool)

(declare-fun res!101830 () Bool)

(assert (=> b!209062 (=> (not res!101830) (not e!136255))))

(declare-datatypes ((List!3012 0))(
  ( (Nil!3009) (Cons!3008 (h!3650 (_ BitVec 64)) (t!7943 List!3012)) )
))
(declare-fun arrayNoDuplicates!0 (array!9913 (_ BitVec 32) List!3012) Bool)

(assert (=> b!209062 (= res!101830 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3009))))

(declare-fun mapNonEmpty!9101 () Bool)

(declare-fun tp!19520 () Bool)

(declare-fun e!136259 () Bool)

(assert (=> mapNonEmpty!9101 (= mapRes!9101 (and tp!19520 e!136259))))

(declare-fun mapValue!9101 () ValueCell!2334)

(declare-fun mapKey!9101 () (_ BitVec 32))

(declare-fun mapRest!9101 () (Array (_ BitVec 32) ValueCell!2334))

(assert (=> mapNonEmpty!9101 (= (arr!4706 _values!649) (store mapRest!9101 mapKey!9101 mapValue!9101))))

(declare-fun b!209063 () Bool)

(declare-fun res!101831 () Bool)

(assert (=> b!209063 (=> (not res!101831) (not e!136255))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209063 (= res!101831 (validKeyInArray!0 k0!843))))

(declare-fun b!209064 () Bool)

(declare-fun res!101836 () Bool)

(assert (=> b!209064 (=> (not res!101836) (not e!136255))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209064 (= res!101836 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5032 _keys!825))))))

(declare-fun b!209065 () Bool)

(declare-fun res!101834 () Bool)

(assert (=> b!209065 (=> (not res!101834) (not e!136255))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209065 (= res!101834 (and (= (size!5031 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5032 _keys!825) (size!5031 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209066 () Bool)

(declare-fun res!101832 () Bool)

(assert (=> b!209066 (=> (not res!101832) (not e!136255))))

(assert (=> b!209066 (= res!101832 (= (select (arr!4707 _keys!825) i!601) k0!843))))

(declare-fun b!209067 () Bool)

(assert (=> b!209067 (= e!136255 false)))

(declare-fun v!520 () V!6787)

(declare-fun zeroValue!615 () V!6787)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!4116 0))(
  ( (tuple2!4117 (_1!2069 (_ BitVec 64)) (_2!2069 V!6787)) )
))
(declare-datatypes ((List!3013 0))(
  ( (Nil!3010) (Cons!3009 (h!3651 tuple2!4116) (t!7944 List!3013)) )
))
(declare-datatypes ((ListLongMap!3029 0))(
  ( (ListLongMap!3030 (toList!1530 List!3013)) )
))
(declare-fun lt!106911 () ListLongMap!3029)

(declare-fun minValue!615 () V!6787)

(declare-fun getCurrentListMapNoExtraKeys!471 (array!9913 array!9911 (_ BitVec 32) (_ BitVec 32) V!6787 V!6787 (_ BitVec 32) Int) ListLongMap!3029)

(assert (=> b!209067 (= lt!106911 (getCurrentListMapNoExtraKeys!471 _keys!825 (array!9912 (store (arr!4706 _values!649) i!601 (ValueCellFull!2334 v!520)) (size!5031 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106910 () ListLongMap!3029)

(assert (=> b!209067 (= lt!106910 (getCurrentListMapNoExtraKeys!471 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209068 () Bool)

(declare-fun res!101833 () Bool)

(assert (=> b!209068 (=> (not res!101833) (not e!136255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9913 (_ BitVec 32)) Bool)

(assert (=> b!209068 (= res!101833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209069 () Bool)

(assert (=> b!209069 (= e!136259 tp_is_empty!5355)))

(assert (= (and start!20840 res!101835) b!209065))

(assert (= (and b!209065 res!101834) b!209068))

(assert (= (and b!209068 res!101833) b!209062))

(assert (= (and b!209062 res!101830) b!209064))

(assert (= (and b!209064 res!101836) b!209063))

(assert (= (and b!209063 res!101831) b!209066))

(assert (= (and b!209066 res!101832) b!209067))

(assert (= (and b!209060 condMapEmpty!9101) mapIsEmpty!9101))

(assert (= (and b!209060 (not condMapEmpty!9101)) mapNonEmpty!9101))

(get-info :version)

(assert (= (and mapNonEmpty!9101 ((_ is ValueCellFull!2334) mapValue!9101)) b!209069))

(assert (= (and b!209060 ((_ is ValueCellFull!2334) mapDefault!9101)) b!209061))

(assert (= start!20840 b!209060))

(declare-fun m!236525 () Bool)

(assert (=> b!209066 m!236525))

(declare-fun m!236527 () Bool)

(assert (=> b!209063 m!236527))

(declare-fun m!236529 () Bool)

(assert (=> b!209068 m!236529))

(declare-fun m!236531 () Bool)

(assert (=> b!209067 m!236531))

(declare-fun m!236533 () Bool)

(assert (=> b!209067 m!236533))

(declare-fun m!236535 () Bool)

(assert (=> b!209067 m!236535))

(declare-fun m!236537 () Bool)

(assert (=> start!20840 m!236537))

(declare-fun m!236539 () Bool)

(assert (=> start!20840 m!236539))

(declare-fun m!236541 () Bool)

(assert (=> start!20840 m!236541))

(declare-fun m!236543 () Bool)

(assert (=> b!209062 m!236543))

(declare-fun m!236545 () Bool)

(assert (=> mapNonEmpty!9101 m!236545))

(check-sat (not b!209067) (not b!209062) (not mapNonEmpty!9101) (not b_next!5493) (not b!209068) (not b!209063) b_and!12239 tp_is_empty!5355 (not start!20840))
(check-sat b_and!12239 (not b_next!5493))
