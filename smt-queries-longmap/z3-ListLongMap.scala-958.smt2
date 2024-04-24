; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20848 () Bool)

(assert start!20848)

(declare-fun b_free!5497 () Bool)

(declare-fun b_next!5497 () Bool)

(assert (=> start!20848 (= b_free!5497 (not b_next!5497))))

(declare-fun tp!19532 () Bool)

(declare-fun b_and!12257 () Bool)

(assert (=> start!20848 (= tp!19532 b_and!12257)))

(declare-fun b!209167 () Bool)

(declare-fun res!101898 () Bool)

(declare-fun e!136311 () Bool)

(assert (=> b!209167 (=> (not res!101898) (not e!136311))))

(declare-datatypes ((array!9911 0))(
  ( (array!9912 (arr!4706 (Array (_ BitVec 32) (_ BitVec 64))) (size!5031 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9911)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9911 (_ BitVec 32)) Bool)

(assert (=> b!209167 (= res!101898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209168 () Bool)

(assert (=> b!209168 (= e!136311 false)))

(declare-datatypes ((V!6793 0))(
  ( (V!6794 (val!2724 Int)) )
))
(declare-datatypes ((tuple2!4060 0))(
  ( (tuple2!4061 (_1!2041 (_ BitVec 64)) (_2!2041 V!6793)) )
))
(declare-datatypes ((List!2947 0))(
  ( (Nil!2944) (Cons!2943 (h!3585 tuple2!4060) (t!7870 List!2947)) )
))
(declare-datatypes ((ListLongMap!2975 0))(
  ( (ListLongMap!2976 (toList!1503 List!2947)) )
))
(declare-fun lt!106982 () ListLongMap!2975)

(declare-datatypes ((ValueCell!2336 0))(
  ( (ValueCellFull!2336 (v!4695 V!6793)) (EmptyCell!2336) )
))
(declare-datatypes ((array!9913 0))(
  ( (array!9914 (arr!4707 (Array (_ BitVec 32) ValueCell!2336)) (size!5032 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9913)

(declare-fun v!520 () V!6793)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6793)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6793)

(declare-fun getCurrentListMapNoExtraKeys!466 (array!9911 array!9913 (_ BitVec 32) (_ BitVec 32) V!6793 V!6793 (_ BitVec 32) Int) ListLongMap!2975)

(assert (=> b!209168 (= lt!106982 (getCurrentListMapNoExtraKeys!466 _keys!825 (array!9914 (store (arr!4707 _values!649) i!601 (ValueCellFull!2336 v!520)) (size!5032 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106981 () ListLongMap!2975)

(assert (=> b!209168 (= lt!106981 (getCurrentListMapNoExtraKeys!466 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9107 () Bool)

(declare-fun mapRes!9107 () Bool)

(declare-fun tp!19531 () Bool)

(declare-fun e!136312 () Bool)

(assert (=> mapNonEmpty!9107 (= mapRes!9107 (and tp!19531 e!136312))))

(declare-fun mapValue!9107 () ValueCell!2336)

(declare-fun mapKey!9107 () (_ BitVec 32))

(declare-fun mapRest!9107 () (Array (_ BitVec 32) ValueCell!2336))

(assert (=> mapNonEmpty!9107 (= (arr!4707 _values!649) (store mapRest!9107 mapKey!9107 mapValue!9107))))

(declare-fun mapIsEmpty!9107 () Bool)

(assert (=> mapIsEmpty!9107 mapRes!9107))

(declare-fun b!209169 () Bool)

(declare-fun res!101896 () Bool)

(assert (=> b!209169 (=> (not res!101896) (not e!136311))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!209169 (= res!101896 (= (select (arr!4706 _keys!825) i!601) k0!843))))

(declare-fun b!209170 () Bool)

(declare-fun e!136310 () Bool)

(declare-fun e!136313 () Bool)

(assert (=> b!209170 (= e!136310 (and e!136313 mapRes!9107))))

(declare-fun condMapEmpty!9107 () Bool)

(declare-fun mapDefault!9107 () ValueCell!2336)

(assert (=> b!209170 (= condMapEmpty!9107 (= (arr!4707 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2336)) mapDefault!9107)))))

(declare-fun b!209171 () Bool)

(declare-fun res!101899 () Bool)

(assert (=> b!209171 (=> (not res!101899) (not e!136311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209171 (= res!101899 (validKeyInArray!0 k0!843))))

(declare-fun b!209172 () Bool)

(declare-fun tp_is_empty!5359 () Bool)

(assert (=> b!209172 (= e!136312 tp_is_empty!5359)))

(declare-fun b!209173 () Bool)

(assert (=> b!209173 (= e!136313 tp_is_empty!5359)))

(declare-fun b!209174 () Bool)

(declare-fun res!101897 () Bool)

(assert (=> b!209174 (=> (not res!101897) (not e!136311))))

(assert (=> b!209174 (= res!101897 (and (= (size!5032 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5031 _keys!825) (size!5032 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209176 () Bool)

(declare-fun res!101894 () Bool)

(assert (=> b!209176 (=> (not res!101894) (not e!136311))))

(declare-datatypes ((List!2948 0))(
  ( (Nil!2945) (Cons!2944 (h!3586 (_ BitVec 64)) (t!7871 List!2948)) )
))
(declare-fun arrayNoDuplicates!0 (array!9911 (_ BitVec 32) List!2948) Bool)

(assert (=> b!209176 (= res!101894 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2945))))

(declare-fun b!209175 () Bool)

(declare-fun res!101895 () Bool)

(assert (=> b!209175 (=> (not res!101895) (not e!136311))))

(assert (=> b!209175 (= res!101895 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5031 _keys!825))))))

(declare-fun res!101893 () Bool)

(assert (=> start!20848 (=> (not res!101893) (not e!136311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20848 (= res!101893 (validMask!0 mask!1149))))

(assert (=> start!20848 e!136311))

(declare-fun array_inv!3085 (array!9913) Bool)

(assert (=> start!20848 (and (array_inv!3085 _values!649) e!136310)))

(assert (=> start!20848 true))

(assert (=> start!20848 tp_is_empty!5359))

(declare-fun array_inv!3086 (array!9911) Bool)

(assert (=> start!20848 (array_inv!3086 _keys!825)))

(assert (=> start!20848 tp!19532))

(assert (= (and start!20848 res!101893) b!209174))

(assert (= (and b!209174 res!101897) b!209167))

(assert (= (and b!209167 res!101898) b!209176))

(assert (= (and b!209176 res!101894) b!209175))

(assert (= (and b!209175 res!101895) b!209171))

(assert (= (and b!209171 res!101899) b!209169))

(assert (= (and b!209169 res!101896) b!209168))

(assert (= (and b!209170 condMapEmpty!9107) mapIsEmpty!9107))

(assert (= (and b!209170 (not condMapEmpty!9107)) mapNonEmpty!9107))

(get-info :version)

(assert (= (and mapNonEmpty!9107 ((_ is ValueCellFull!2336) mapValue!9107)) b!209172))

(assert (= (and b!209170 ((_ is ValueCellFull!2336) mapDefault!9107)) b!209173))

(assert (= start!20848 b!209170))

(declare-fun m!236751 () Bool)

(assert (=> b!209169 m!236751))

(declare-fun m!236753 () Bool)

(assert (=> start!20848 m!236753))

(declare-fun m!236755 () Bool)

(assert (=> start!20848 m!236755))

(declare-fun m!236757 () Bool)

(assert (=> start!20848 m!236757))

(declare-fun m!236759 () Bool)

(assert (=> b!209167 m!236759))

(declare-fun m!236761 () Bool)

(assert (=> b!209176 m!236761))

(declare-fun m!236763 () Bool)

(assert (=> mapNonEmpty!9107 m!236763))

(declare-fun m!236765 () Bool)

(assert (=> b!209168 m!236765))

(declare-fun m!236767 () Bool)

(assert (=> b!209168 m!236767))

(declare-fun m!236769 () Bool)

(assert (=> b!209168 m!236769))

(declare-fun m!236771 () Bool)

(assert (=> b!209171 m!236771))

(check-sat tp_is_empty!5359 b_and!12257 (not b!209167) (not mapNonEmpty!9107) (not b!209168) (not b!209171) (not b!209176) (not start!20848) (not b_next!5497))
(check-sat b_and!12257 (not b_next!5497))
