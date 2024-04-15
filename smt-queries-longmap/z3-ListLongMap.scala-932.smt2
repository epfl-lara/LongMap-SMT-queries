; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20692 () Bool)

(assert start!20692)

(declare-fun b_free!5347 () Bool)

(declare-fun b_next!5347 () Bool)

(assert (=> start!20692 (= b_free!5347 (not b_next!5347))))

(declare-fun tp!19073 () Bool)

(declare-fun b_and!12067 () Bool)

(assert (=> start!20692 (= tp!19073 b_and!12067)))

(declare-fun mapNonEmpty!8873 () Bool)

(declare-fun mapRes!8873 () Bool)

(declare-fun tp!19072 () Bool)

(declare-fun e!135018 () Bool)

(assert (=> mapNonEmpty!8873 (= mapRes!8873 (and tp!19072 e!135018))))

(declare-datatypes ((V!6585 0))(
  ( (V!6586 (val!2646 Int)) )
))
(declare-datatypes ((ValueCell!2258 0))(
  ( (ValueCellFull!2258 (v!4610 V!6585)) (EmptyCell!2258) )
))
(declare-datatypes ((array!9603 0))(
  ( (array!9604 (arr!4551 (Array (_ BitVec 32) ValueCell!2258)) (size!4877 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9603)

(declare-fun mapValue!8873 () ValueCell!2258)

(declare-fun mapRest!8873 () (Array (_ BitVec 32) ValueCell!2258))

(declare-fun mapKey!8873 () (_ BitVec 32))

(assert (=> mapNonEmpty!8873 (= (arr!4551 _values!649) (store mapRest!8873 mapKey!8873 mapValue!8873))))

(declare-fun b!206669 () Bool)

(declare-fun res!100178 () Bool)

(declare-fun e!135016 () Bool)

(assert (=> b!206669 (=> (not res!100178) (not e!135016))))

(declare-datatypes ((array!9605 0))(
  ( (array!9606 (arr!4552 (Array (_ BitVec 32) (_ BitVec 64))) (size!4878 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9605)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9605 (_ BitVec 32)) Bool)

(assert (=> b!206669 (= res!100178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206670 () Bool)

(declare-fun e!135014 () Bool)

(declare-fun tp_is_empty!5203 () Bool)

(assert (=> b!206670 (= e!135014 tp_is_empty!5203)))

(declare-fun b!206671 () Bool)

(declare-fun res!100175 () Bool)

(assert (=> b!206671 (=> (not res!100175) (not e!135016))))

(declare-datatypes ((List!2899 0))(
  ( (Nil!2896) (Cons!2895 (h!3537 (_ BitVec 64)) (t!7821 List!2899)) )
))
(declare-fun arrayNoDuplicates!0 (array!9605 (_ BitVec 32) List!2899) Bool)

(assert (=> b!206671 (= res!100175 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2896))))

(declare-fun b!206672 () Bool)

(declare-fun res!100176 () Bool)

(assert (=> b!206672 (=> (not res!100176) (not e!135016))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206672 (= res!100176 (and (= (size!4877 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4878 _keys!825) (size!4877 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206673 () Bool)

(assert (=> b!206673 (= e!135016 (not true))))

(declare-datatypes ((tuple2!3996 0))(
  ( (tuple2!3997 (_1!2009 (_ BitVec 64)) (_2!2009 V!6585)) )
))
(declare-datatypes ((List!2900 0))(
  ( (Nil!2897) (Cons!2896 (h!3538 tuple2!3996) (t!7822 List!2900)) )
))
(declare-datatypes ((ListLongMap!2899 0))(
  ( (ListLongMap!2900 (toList!1465 List!2900)) )
))
(declare-fun lt!105654 () ListLongMap!2899)

(declare-fun zeroValue!615 () V!6585)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6585)

(declare-fun getCurrentListMap!1006 (array!9605 array!9603 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) Int) ListLongMap!2899)

(assert (=> b!206673 (= lt!105654 (getCurrentListMap!1006 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105657 () array!9603)

(declare-fun lt!105655 () ListLongMap!2899)

(assert (=> b!206673 (= lt!105655 (getCurrentListMap!1006 _keys!825 lt!105657 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105653 () ListLongMap!2899)

(declare-fun lt!105659 () ListLongMap!2899)

(assert (=> b!206673 (and (= lt!105653 lt!105659) (= lt!105659 lt!105653))))

(declare-fun v!520 () V!6585)

(declare-fun lt!105656 () ListLongMap!2899)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!514 (ListLongMap!2899 tuple2!3996) ListLongMap!2899)

(assert (=> b!206673 (= lt!105659 (+!514 lt!105656 (tuple2!3997 k0!843 v!520)))))

(declare-datatypes ((Unit!6268 0))(
  ( (Unit!6269) )
))
(declare-fun lt!105658 () Unit!6268)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!165 (array!9605 array!9603 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) (_ BitVec 64) V!6585 (_ BitVec 32) Int) Unit!6268)

(assert (=> b!206673 (= lt!105658 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!165 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!416 (array!9605 array!9603 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) Int) ListLongMap!2899)

(assert (=> b!206673 (= lt!105653 (getCurrentListMapNoExtraKeys!416 _keys!825 lt!105657 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206673 (= lt!105657 (array!9604 (store (arr!4551 _values!649) i!601 (ValueCellFull!2258 v!520)) (size!4877 _values!649)))))

(assert (=> b!206673 (= lt!105656 (getCurrentListMapNoExtraKeys!416 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206675 () Bool)

(assert (=> b!206675 (= e!135018 tp_is_empty!5203)))

(declare-fun b!206676 () Bool)

(declare-fun e!135015 () Bool)

(assert (=> b!206676 (= e!135015 (and e!135014 mapRes!8873))))

(declare-fun condMapEmpty!8873 () Bool)

(declare-fun mapDefault!8873 () ValueCell!2258)

(assert (=> b!206676 (= condMapEmpty!8873 (= (arr!4551 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2258)) mapDefault!8873)))))

(declare-fun b!206677 () Bool)

(declare-fun res!100181 () Bool)

(assert (=> b!206677 (=> (not res!100181) (not e!135016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206677 (= res!100181 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8873 () Bool)

(assert (=> mapIsEmpty!8873 mapRes!8873))

(declare-fun b!206678 () Bool)

(declare-fun res!100179 () Bool)

(assert (=> b!206678 (=> (not res!100179) (not e!135016))))

(assert (=> b!206678 (= res!100179 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4878 _keys!825))))))

(declare-fun res!100177 () Bool)

(assert (=> start!20692 (=> (not res!100177) (not e!135016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20692 (= res!100177 (validMask!0 mask!1149))))

(assert (=> start!20692 e!135016))

(declare-fun array_inv!2987 (array!9603) Bool)

(assert (=> start!20692 (and (array_inv!2987 _values!649) e!135015)))

(assert (=> start!20692 true))

(assert (=> start!20692 tp_is_empty!5203))

(declare-fun array_inv!2988 (array!9605) Bool)

(assert (=> start!20692 (array_inv!2988 _keys!825)))

(assert (=> start!20692 tp!19073))

(declare-fun b!206674 () Bool)

(declare-fun res!100180 () Bool)

(assert (=> b!206674 (=> (not res!100180) (not e!135016))))

(assert (=> b!206674 (= res!100180 (= (select (arr!4552 _keys!825) i!601) k0!843))))

(assert (= (and start!20692 res!100177) b!206672))

(assert (= (and b!206672 res!100176) b!206669))

(assert (= (and b!206669 res!100178) b!206671))

(assert (= (and b!206671 res!100175) b!206678))

(assert (= (and b!206678 res!100179) b!206677))

(assert (= (and b!206677 res!100181) b!206674))

(assert (= (and b!206674 res!100180) b!206673))

(assert (= (and b!206676 condMapEmpty!8873) mapIsEmpty!8873))

(assert (= (and b!206676 (not condMapEmpty!8873)) mapNonEmpty!8873))

(get-info :version)

(assert (= (and mapNonEmpty!8873 ((_ is ValueCellFull!2258) mapValue!8873)) b!206675))

(assert (= (and b!206676 ((_ is ValueCellFull!2258) mapDefault!8873)) b!206670))

(assert (= start!20692 b!206676))

(declare-fun m!233943 () Bool)

(assert (=> b!206669 m!233943))

(declare-fun m!233945 () Bool)

(assert (=> start!20692 m!233945))

(declare-fun m!233947 () Bool)

(assert (=> start!20692 m!233947))

(declare-fun m!233949 () Bool)

(assert (=> start!20692 m!233949))

(declare-fun m!233951 () Bool)

(assert (=> b!206671 m!233951))

(declare-fun m!233953 () Bool)

(assert (=> b!206673 m!233953))

(declare-fun m!233955 () Bool)

(assert (=> b!206673 m!233955))

(declare-fun m!233957 () Bool)

(assert (=> b!206673 m!233957))

(declare-fun m!233959 () Bool)

(assert (=> b!206673 m!233959))

(declare-fun m!233961 () Bool)

(assert (=> b!206673 m!233961))

(declare-fun m!233963 () Bool)

(assert (=> b!206673 m!233963))

(declare-fun m!233965 () Bool)

(assert (=> b!206673 m!233965))

(declare-fun m!233967 () Bool)

(assert (=> b!206674 m!233967))

(declare-fun m!233969 () Bool)

(assert (=> mapNonEmpty!8873 m!233969))

(declare-fun m!233971 () Bool)

(assert (=> b!206677 m!233971))

(check-sat (not mapNonEmpty!8873) (not b_next!5347) (not start!20692) tp_is_empty!5203 b_and!12067 (not b!206669) (not b!206673) (not b!206677) (not b!206671))
(check-sat b_and!12067 (not b_next!5347))
