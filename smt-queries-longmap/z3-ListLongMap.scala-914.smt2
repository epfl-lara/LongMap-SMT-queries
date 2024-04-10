; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20582 () Bool)

(assert start!20582)

(declare-fun b_free!5241 () Bool)

(declare-fun b_next!5241 () Bool)

(assert (=> start!20582 (= b_free!5241 (not b_next!5241))))

(declare-fun tp!18755 () Bool)

(declare-fun b_and!11987 () Bool)

(assert (=> start!20582 (= tp!18755 b_and!11987)))

(declare-fun b!204984 () Bool)

(declare-fun res!98921 () Bool)

(declare-fun e!134079 () Bool)

(assert (=> b!204984 (=> (not res!98921) (not e!134079))))

(declare-datatypes ((array!9407 0))(
  ( (array!9408 (arr!4454 (Array (_ BitVec 32) (_ BitVec 64))) (size!4779 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9407)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204984 (= res!98921 (= (select (arr!4454 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8714 () Bool)

(declare-fun mapRes!8714 () Bool)

(declare-fun tp!18754 () Bool)

(declare-fun e!134080 () Bool)

(assert (=> mapNonEmpty!8714 (= mapRes!8714 (and tp!18754 e!134080))))

(declare-fun mapKey!8714 () (_ BitVec 32))

(declare-datatypes ((V!6443 0))(
  ( (V!6444 (val!2593 Int)) )
))
(declare-datatypes ((ValueCell!2205 0))(
  ( (ValueCellFull!2205 (v!4563 V!6443)) (EmptyCell!2205) )
))
(declare-fun mapRest!8714 () (Array (_ BitVec 32) ValueCell!2205))

(declare-datatypes ((array!9409 0))(
  ( (array!9410 (arr!4455 (Array (_ BitVec 32) ValueCell!2205)) (size!4780 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9409)

(declare-fun mapValue!8714 () ValueCell!2205)

(assert (=> mapNonEmpty!8714 (= (arr!4455 _values!649) (store mapRest!8714 mapKey!8714 mapValue!8714))))

(declare-fun b!204985 () Bool)

(declare-fun e!134084 () Bool)

(assert (=> b!204985 (= e!134079 (not e!134084))))

(declare-fun res!98923 () Bool)

(assert (=> b!204985 (=> res!98923 e!134084)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204985 (= res!98923 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3930 0))(
  ( (tuple2!3931 (_1!1976 (_ BitVec 64)) (_2!1976 V!6443)) )
))
(declare-datatypes ((List!2829 0))(
  ( (Nil!2826) (Cons!2825 (h!3467 tuple2!3930) (t!7760 List!2829)) )
))
(declare-datatypes ((ListLongMap!2843 0))(
  ( (ListLongMap!2844 (toList!1437 List!2829)) )
))
(declare-fun lt!104116 () ListLongMap!2843)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6443)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6443)

(declare-fun getCurrentListMap!1010 (array!9407 array!9409 (_ BitVec 32) (_ BitVec 32) V!6443 V!6443 (_ BitVec 32) Int) ListLongMap!2843)

(assert (=> b!204985 (= lt!104116 (getCurrentListMap!1010 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104121 () array!9409)

(declare-fun lt!104119 () ListLongMap!2843)

(assert (=> b!204985 (= lt!104119 (getCurrentListMap!1010 _keys!825 lt!104121 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104122 () ListLongMap!2843)

(declare-fun lt!104120 () ListLongMap!2843)

(assert (=> b!204985 (and (= lt!104122 lt!104120) (= lt!104120 lt!104122))))

(declare-fun lt!104127 () ListLongMap!2843)

(declare-fun lt!104117 () tuple2!3930)

(declare-fun +!464 (ListLongMap!2843 tuple2!3930) ListLongMap!2843)

(assert (=> b!204985 (= lt!104120 (+!464 lt!104127 lt!104117))))

(declare-fun v!520 () V!6443)

(assert (=> b!204985 (= lt!104117 (tuple2!3931 k0!843 v!520))))

(declare-datatypes ((Unit!6220 0))(
  ( (Unit!6221) )
))
(declare-fun lt!104118 () Unit!6220)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!123 (array!9407 array!9409 (_ BitVec 32) (_ BitVec 32) V!6443 V!6443 (_ BitVec 32) (_ BitVec 64) V!6443 (_ BitVec 32) Int) Unit!6220)

(assert (=> b!204985 (= lt!104118 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!123 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!384 (array!9407 array!9409 (_ BitVec 32) (_ BitVec 32) V!6443 V!6443 (_ BitVec 32) Int) ListLongMap!2843)

(assert (=> b!204985 (= lt!104122 (getCurrentListMapNoExtraKeys!384 _keys!825 lt!104121 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204985 (= lt!104121 (array!9410 (store (arr!4455 _values!649) i!601 (ValueCellFull!2205 v!520)) (size!4780 _values!649)))))

(assert (=> b!204985 (= lt!104127 (getCurrentListMapNoExtraKeys!384 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204986 () Bool)

(declare-fun res!98920 () Bool)

(assert (=> b!204986 (=> (not res!98920) (not e!134079))))

(assert (=> b!204986 (= res!98920 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4779 _keys!825))))))

(declare-fun b!204987 () Bool)

(declare-fun tp_is_empty!5097 () Bool)

(assert (=> b!204987 (= e!134080 tp_is_empty!5097)))

(declare-fun b!204988 () Bool)

(declare-fun e!134083 () Bool)

(assert (=> b!204988 (= e!134084 e!134083)))

(declare-fun res!98918 () Bool)

(assert (=> b!204988 (=> res!98918 e!134083)))

(assert (=> b!204988 (= res!98918 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104125 () ListLongMap!2843)

(assert (=> b!204988 (= lt!104116 lt!104125)))

(declare-fun lt!104124 () tuple2!3930)

(assert (=> b!204988 (= lt!104125 (+!464 lt!104127 lt!104124))))

(declare-fun lt!104126 () ListLongMap!2843)

(assert (=> b!204988 (= lt!104119 lt!104126)))

(assert (=> b!204988 (= lt!104126 (+!464 lt!104120 lt!104124))))

(assert (=> b!204988 (= lt!104119 (+!464 lt!104122 lt!104124))))

(assert (=> b!204988 (= lt!104124 (tuple2!3931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204989 () Bool)

(declare-fun res!98916 () Bool)

(assert (=> b!204989 (=> (not res!98916) (not e!134079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204989 (= res!98916 (validKeyInArray!0 k0!843))))

(declare-fun b!204990 () Bool)

(declare-fun e!134082 () Bool)

(declare-fun e!134078 () Bool)

(assert (=> b!204990 (= e!134082 (and e!134078 mapRes!8714))))

(declare-fun condMapEmpty!8714 () Bool)

(declare-fun mapDefault!8714 () ValueCell!2205)

(assert (=> b!204990 (= condMapEmpty!8714 (= (arr!4455 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2205)) mapDefault!8714)))))

(declare-fun mapIsEmpty!8714 () Bool)

(assert (=> mapIsEmpty!8714 mapRes!8714))

(declare-fun b!204991 () Bool)

(declare-fun res!98922 () Bool)

(assert (=> b!204991 (=> (not res!98922) (not e!134079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9407 (_ BitVec 32)) Bool)

(assert (=> b!204991 (= res!98922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204992 () Bool)

(assert (=> b!204992 (= e!134078 tp_is_empty!5097)))

(declare-fun b!204993 () Bool)

(declare-fun res!98919 () Bool)

(assert (=> b!204993 (=> (not res!98919) (not e!134079))))

(assert (=> b!204993 (= res!98919 (and (= (size!4780 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4779 _keys!825) (size!4780 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!98917 () Bool)

(assert (=> start!20582 (=> (not res!98917) (not e!134079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20582 (= res!98917 (validMask!0 mask!1149))))

(assert (=> start!20582 e!134079))

(declare-fun array_inv!2941 (array!9409) Bool)

(assert (=> start!20582 (and (array_inv!2941 _values!649) e!134082)))

(assert (=> start!20582 true))

(assert (=> start!20582 tp_is_empty!5097))

(declare-fun array_inv!2942 (array!9407) Bool)

(assert (=> start!20582 (array_inv!2942 _keys!825)))

(assert (=> start!20582 tp!18755))

(declare-fun b!204994 () Bool)

(declare-fun res!98915 () Bool)

(assert (=> b!204994 (=> (not res!98915) (not e!134079))))

(declare-datatypes ((List!2830 0))(
  ( (Nil!2827) (Cons!2826 (h!3468 (_ BitVec 64)) (t!7761 List!2830)) )
))
(declare-fun arrayNoDuplicates!0 (array!9407 (_ BitVec 32) List!2830) Bool)

(assert (=> b!204994 (= res!98915 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2827))))

(declare-fun b!204995 () Bool)

(assert (=> b!204995 (= e!134083 true)))

(assert (=> b!204995 (= lt!104126 (+!464 lt!104125 lt!104117))))

(declare-fun lt!104123 () Unit!6220)

(declare-fun addCommutativeForDiffKeys!169 (ListLongMap!2843 (_ BitVec 64) V!6443 (_ BitVec 64) V!6443) Unit!6220)

(assert (=> b!204995 (= lt!104123 (addCommutativeForDiffKeys!169 lt!104127 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20582 res!98917) b!204993))

(assert (= (and b!204993 res!98919) b!204991))

(assert (= (and b!204991 res!98922) b!204994))

(assert (= (and b!204994 res!98915) b!204986))

(assert (= (and b!204986 res!98920) b!204989))

(assert (= (and b!204989 res!98916) b!204984))

(assert (= (and b!204984 res!98921) b!204985))

(assert (= (and b!204985 (not res!98923)) b!204988))

(assert (= (and b!204988 (not res!98918)) b!204995))

(assert (= (and b!204990 condMapEmpty!8714) mapIsEmpty!8714))

(assert (= (and b!204990 (not condMapEmpty!8714)) mapNonEmpty!8714))

(get-info :version)

(assert (= (and mapNonEmpty!8714 ((_ is ValueCellFull!2205) mapValue!8714)) b!204987))

(assert (= (and b!204990 ((_ is ValueCellFull!2205) mapDefault!8714)) b!204992))

(assert (= start!20582 b!204990))

(declare-fun m!232559 () Bool)

(assert (=> b!204988 m!232559))

(declare-fun m!232561 () Bool)

(assert (=> b!204988 m!232561))

(declare-fun m!232563 () Bool)

(assert (=> b!204988 m!232563))

(declare-fun m!232565 () Bool)

(assert (=> b!204995 m!232565))

(declare-fun m!232567 () Bool)

(assert (=> b!204995 m!232567))

(declare-fun m!232569 () Bool)

(assert (=> b!204985 m!232569))

(declare-fun m!232571 () Bool)

(assert (=> b!204985 m!232571))

(declare-fun m!232573 () Bool)

(assert (=> b!204985 m!232573))

(declare-fun m!232575 () Bool)

(assert (=> b!204985 m!232575))

(declare-fun m!232577 () Bool)

(assert (=> b!204985 m!232577))

(declare-fun m!232579 () Bool)

(assert (=> b!204985 m!232579))

(declare-fun m!232581 () Bool)

(assert (=> b!204985 m!232581))

(declare-fun m!232583 () Bool)

(assert (=> start!20582 m!232583))

(declare-fun m!232585 () Bool)

(assert (=> start!20582 m!232585))

(declare-fun m!232587 () Bool)

(assert (=> start!20582 m!232587))

(declare-fun m!232589 () Bool)

(assert (=> b!204991 m!232589))

(declare-fun m!232591 () Bool)

(assert (=> b!204989 m!232591))

(declare-fun m!232593 () Bool)

(assert (=> mapNonEmpty!8714 m!232593))

(declare-fun m!232595 () Bool)

(assert (=> b!204984 m!232595))

(declare-fun m!232597 () Bool)

(assert (=> b!204994 m!232597))

(check-sat (not b!204989) (not start!20582) (not b!204985) (not b!204991) (not b!204988) (not b!204994) (not b!204995) b_and!11987 (not b_next!5241) tp_is_empty!5097 (not mapNonEmpty!8714))
(check-sat b_and!11987 (not b_next!5241))
