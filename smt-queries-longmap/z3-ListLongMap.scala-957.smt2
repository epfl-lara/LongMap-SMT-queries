; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20842 () Bool)

(assert start!20842)

(declare-fun b_free!5491 () Bool)

(declare-fun b_next!5491 () Bool)

(assert (=> start!20842 (= b_free!5491 (not b_next!5491))))

(declare-fun tp!19513 () Bool)

(declare-fun b_and!12251 () Bool)

(assert (=> start!20842 (= tp!19513 b_and!12251)))

(declare-fun mapIsEmpty!9098 () Bool)

(declare-fun mapRes!9098 () Bool)

(assert (=> mapIsEmpty!9098 mapRes!9098))

(declare-fun mapNonEmpty!9098 () Bool)

(declare-fun tp!19514 () Bool)

(declare-fun e!136265 () Bool)

(assert (=> mapNonEmpty!9098 (= mapRes!9098 (and tp!19514 e!136265))))

(declare-datatypes ((V!6785 0))(
  ( (V!6786 (val!2721 Int)) )
))
(declare-datatypes ((ValueCell!2333 0))(
  ( (ValueCellFull!2333 (v!4692 V!6785)) (EmptyCell!2333) )
))
(declare-fun mapRest!9098 () (Array (_ BitVec 32) ValueCell!2333))

(declare-fun mapKey!9098 () (_ BitVec 32))

(declare-fun mapValue!9098 () ValueCell!2333)

(declare-datatypes ((array!9901 0))(
  ( (array!9902 (arr!4701 (Array (_ BitVec 32) ValueCell!2333)) (size!5026 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9901)

(assert (=> mapNonEmpty!9098 (= (arr!4701 _values!649) (store mapRest!9098 mapKey!9098 mapValue!9098))))

(declare-fun b!209077 () Bool)

(declare-fun res!101836 () Bool)

(declare-fun e!136264 () Bool)

(assert (=> b!209077 (=> (not res!101836) (not e!136264))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209077 (= res!101836 (validKeyInArray!0 k0!843))))

(declare-fun b!209078 () Bool)

(declare-fun res!101832 () Bool)

(assert (=> b!209078 (=> (not res!101832) (not e!136264))))

(declare-datatypes ((array!9903 0))(
  ( (array!9904 (arr!4702 (Array (_ BitVec 32) (_ BitVec 64))) (size!5027 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9903)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209078 (= res!101832 (= (select (arr!4702 _keys!825) i!601) k0!843))))

(declare-fun b!209079 () Bool)

(declare-fun res!101833 () Bool)

(assert (=> b!209079 (=> (not res!101833) (not e!136264))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9903 (_ BitVec 32)) Bool)

(assert (=> b!209079 (= res!101833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209080 () Bool)

(declare-fun e!136266 () Bool)

(declare-fun tp_is_empty!5353 () Bool)

(assert (=> b!209080 (= e!136266 tp_is_empty!5353)))

(declare-fun b!209081 () Bool)

(declare-fun e!136268 () Bool)

(assert (=> b!209081 (= e!136268 (and e!136266 mapRes!9098))))

(declare-fun condMapEmpty!9098 () Bool)

(declare-fun mapDefault!9098 () ValueCell!2333)

(assert (=> b!209081 (= condMapEmpty!9098 (= (arr!4701 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2333)) mapDefault!9098)))))

(declare-fun b!209082 () Bool)

(declare-fun res!101830 () Bool)

(assert (=> b!209082 (=> (not res!101830) (not e!136264))))

(declare-datatypes ((List!2945 0))(
  ( (Nil!2942) (Cons!2941 (h!3583 (_ BitVec 64)) (t!7868 List!2945)) )
))
(declare-fun arrayNoDuplicates!0 (array!9903 (_ BitVec 32) List!2945) Bool)

(assert (=> b!209082 (= res!101830 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2942))))

(declare-fun res!101834 () Bool)

(assert (=> start!20842 (=> (not res!101834) (not e!136264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20842 (= res!101834 (validMask!0 mask!1149))))

(assert (=> start!20842 e!136264))

(declare-fun array_inv!3083 (array!9901) Bool)

(assert (=> start!20842 (and (array_inv!3083 _values!649) e!136268)))

(assert (=> start!20842 true))

(assert (=> start!20842 tp_is_empty!5353))

(declare-fun array_inv!3084 (array!9903) Bool)

(assert (=> start!20842 (array_inv!3084 _keys!825)))

(assert (=> start!20842 tp!19513))

(declare-fun b!209083 () Bool)

(assert (=> b!209083 (= e!136265 tp_is_empty!5353)))

(declare-fun b!209084 () Bool)

(declare-fun res!101831 () Bool)

(assert (=> b!209084 (=> (not res!101831) (not e!136264))))

(assert (=> b!209084 (= res!101831 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5027 _keys!825))))))

(declare-fun b!209085 () Bool)

(assert (=> b!209085 (= e!136264 false)))

(declare-datatypes ((tuple2!4058 0))(
  ( (tuple2!4059 (_1!2040 (_ BitVec 64)) (_2!2040 V!6785)) )
))
(declare-datatypes ((List!2946 0))(
  ( (Nil!2943) (Cons!2942 (h!3584 tuple2!4058) (t!7869 List!2946)) )
))
(declare-datatypes ((ListLongMap!2973 0))(
  ( (ListLongMap!2974 (toList!1502 List!2946)) )
))
(declare-fun lt!106964 () ListLongMap!2973)

(declare-fun v!520 () V!6785)

(declare-fun zeroValue!615 () V!6785)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6785)

(declare-fun getCurrentListMapNoExtraKeys!465 (array!9903 array!9901 (_ BitVec 32) (_ BitVec 32) V!6785 V!6785 (_ BitVec 32) Int) ListLongMap!2973)

(assert (=> b!209085 (= lt!106964 (getCurrentListMapNoExtraKeys!465 _keys!825 (array!9902 (store (arr!4701 _values!649) i!601 (ValueCellFull!2333 v!520)) (size!5026 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106963 () ListLongMap!2973)

(assert (=> b!209085 (= lt!106963 (getCurrentListMapNoExtraKeys!465 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209086 () Bool)

(declare-fun res!101835 () Bool)

(assert (=> b!209086 (=> (not res!101835) (not e!136264))))

(assert (=> b!209086 (= res!101835 (and (= (size!5026 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5027 _keys!825) (size!5026 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20842 res!101834) b!209086))

(assert (= (and b!209086 res!101835) b!209079))

(assert (= (and b!209079 res!101833) b!209082))

(assert (= (and b!209082 res!101830) b!209084))

(assert (= (and b!209084 res!101831) b!209077))

(assert (= (and b!209077 res!101836) b!209078))

(assert (= (and b!209078 res!101832) b!209085))

(assert (= (and b!209081 condMapEmpty!9098) mapIsEmpty!9098))

(assert (= (and b!209081 (not condMapEmpty!9098)) mapNonEmpty!9098))

(get-info :version)

(assert (= (and mapNonEmpty!9098 ((_ is ValueCellFull!2333) mapValue!9098)) b!209083))

(assert (= (and b!209081 ((_ is ValueCellFull!2333) mapDefault!9098)) b!209080))

(assert (= start!20842 b!209081))

(declare-fun m!236685 () Bool)

(assert (=> b!209079 m!236685))

(declare-fun m!236687 () Bool)

(assert (=> b!209077 m!236687))

(declare-fun m!236689 () Bool)

(assert (=> start!20842 m!236689))

(declare-fun m!236691 () Bool)

(assert (=> start!20842 m!236691))

(declare-fun m!236693 () Bool)

(assert (=> start!20842 m!236693))

(declare-fun m!236695 () Bool)

(assert (=> mapNonEmpty!9098 m!236695))

(declare-fun m!236697 () Bool)

(assert (=> b!209078 m!236697))

(declare-fun m!236699 () Bool)

(assert (=> b!209082 m!236699))

(declare-fun m!236701 () Bool)

(assert (=> b!209085 m!236701))

(declare-fun m!236703 () Bool)

(assert (=> b!209085 m!236703))

(declare-fun m!236705 () Bool)

(assert (=> b!209085 m!236705))

(check-sat (not b!209082) (not b!209079) tp_is_empty!5353 (not mapNonEmpty!9098) (not b!209077) (not b!209085) b_and!12251 (not start!20842) (not b_next!5491))
(check-sat b_and!12251 (not b_next!5491))
