; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96614 () Bool)

(assert start!96614)

(declare-fun b_free!22957 () Bool)

(declare-fun b_next!22957 () Bool)

(assert (=> start!96614 (= b_free!22957 (not b_next!22957))))

(declare-fun tp!80797 () Bool)

(declare-fun b_and!36593 () Bool)

(assert (=> start!96614 (= tp!80797 b_and!36593)))

(declare-fun b!1096601 () Bool)

(declare-fun e!626163 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((V!41137 0))(
  ( (V!41138 (val!13560 Int)) )
))
(declare-datatypes ((ValueCell!12794 0))(
  ( (ValueCellFull!12794 (v!16177 V!41137)) (EmptyCell!12794) )
))
(declare-datatypes ((array!70963 0))(
  ( (array!70964 (arr!34147 (Array (_ BitVec 32) ValueCell!12794)) (size!34684 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70963)

(assert (=> b!1096601 (= e!626163 (not (bvslt i!650 (size!34684 _values!874))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17232 0))(
  ( (tuple2!17233 (_1!8627 (_ BitVec 64)) (_2!8627 V!41137)) )
))
(declare-datatypes ((List!23850 0))(
  ( (Nil!23847) (Cons!23846 (h!25064 tuple2!17232) (t!33849 List!23850)) )
))
(declare-datatypes ((ListLongMap!15209 0))(
  ( (ListLongMap!15210 (toList!7620 List!23850)) )
))
(declare-fun lt!490302 () ListLongMap!15209)

(declare-fun zeroValue!831 () V!41137)

(declare-datatypes ((array!70965 0))(
  ( (array!70966 (arr!34148 (Array (_ BitVec 32) (_ BitVec 64))) (size!34685 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70965)

(declare-fun minValue!831 () V!41137)

(declare-fun getCurrentListMapNoExtraKeys!4173 (array!70965 array!70963 (_ BitVec 32) (_ BitVec 32) V!41137 V!41137 (_ BitVec 32) Int) ListLongMap!15209)

(assert (=> b!1096601 (= lt!490302 (getCurrentListMapNoExtraKeys!4173 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096601 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36027 0))(
  ( (Unit!36028) )
))
(declare-fun lt!490300 () Unit!36027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70965 (_ BitVec 64) (_ BitVec 32)) Unit!36027)

(assert (=> b!1096601 (= lt!490300 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096602 () Bool)

(declare-fun res!731467 () Bool)

(declare-fun e!626162 () Bool)

(assert (=> b!1096602 (=> (not res!731467) (not e!626162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70965 (_ BitVec 32)) Bool)

(assert (=> b!1096602 (= res!731467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096604 () Bool)

(assert (=> b!1096604 (= e!626162 e!626163)))

(declare-fun res!731460 () Bool)

(assert (=> b!1096604 (=> (not res!731460) (not e!626163))))

(declare-fun lt!490301 () array!70965)

(assert (=> b!1096604 (= res!731460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490301 mask!1414))))

(assert (=> b!1096604 (= lt!490301 (array!70966 (store (arr!34148 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34685 _keys!1070)))))

(declare-fun b!1096605 () Bool)

(declare-fun res!731465 () Bool)

(assert (=> b!1096605 (=> (not res!731465) (not e!626162))))

(assert (=> b!1096605 (= res!731465 (and (= (size!34684 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34685 _keys!1070) (size!34684 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096606 () Bool)

(declare-fun e!626160 () Bool)

(declare-fun tp_is_empty!27007 () Bool)

(assert (=> b!1096606 (= e!626160 tp_is_empty!27007)))

(declare-fun mapNonEmpty!42271 () Bool)

(declare-fun mapRes!42271 () Bool)

(declare-fun tp!80798 () Bool)

(assert (=> mapNonEmpty!42271 (= mapRes!42271 (and tp!80798 e!626160))))

(declare-fun mapValue!42271 () ValueCell!12794)

(declare-fun mapRest!42271 () (Array (_ BitVec 32) ValueCell!12794))

(declare-fun mapKey!42271 () (_ BitVec 32))

(assert (=> mapNonEmpty!42271 (= (arr!34147 _values!874) (store mapRest!42271 mapKey!42271 mapValue!42271))))

(declare-fun b!1096607 () Bool)

(declare-fun e!626159 () Bool)

(assert (=> b!1096607 (= e!626159 tp_is_empty!27007)))

(declare-fun b!1096608 () Bool)

(declare-fun res!731459 () Bool)

(assert (=> b!1096608 (=> (not res!731459) (not e!626163))))

(declare-datatypes ((List!23851 0))(
  ( (Nil!23848) (Cons!23847 (h!25065 (_ BitVec 64)) (t!33850 List!23851)) )
))
(declare-fun arrayNoDuplicates!0 (array!70965 (_ BitVec 32) List!23851) Bool)

(assert (=> b!1096608 (= res!731459 (arrayNoDuplicates!0 lt!490301 #b00000000000000000000000000000000 Nil!23848))))

(declare-fun b!1096609 () Bool)

(declare-fun res!731461 () Bool)

(assert (=> b!1096609 (=> (not res!731461) (not e!626162))))

(assert (=> b!1096609 (= res!731461 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34685 _keys!1070))))))

(declare-fun b!1096603 () Bool)

(declare-fun e!626161 () Bool)

(assert (=> b!1096603 (= e!626161 (and e!626159 mapRes!42271))))

(declare-fun condMapEmpty!42271 () Bool)

(declare-fun mapDefault!42271 () ValueCell!12794)

(assert (=> b!1096603 (= condMapEmpty!42271 (= (arr!34147 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12794)) mapDefault!42271)))))

(declare-fun res!731463 () Bool)

(assert (=> start!96614 (=> (not res!731463) (not e!626162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96614 (= res!731463 (validMask!0 mask!1414))))

(assert (=> start!96614 e!626162))

(assert (=> start!96614 tp!80797))

(assert (=> start!96614 true))

(assert (=> start!96614 tp_is_empty!27007))

(declare-fun array_inv!26344 (array!70965) Bool)

(assert (=> start!96614 (array_inv!26344 _keys!1070)))

(declare-fun array_inv!26345 (array!70963) Bool)

(assert (=> start!96614 (and (array_inv!26345 _values!874) e!626161)))

(declare-fun b!1096610 () Bool)

(declare-fun res!731466 () Bool)

(assert (=> b!1096610 (=> (not res!731466) (not e!626162))))

(assert (=> b!1096610 (= res!731466 (= (select (arr!34148 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42271 () Bool)

(assert (=> mapIsEmpty!42271 mapRes!42271))

(declare-fun b!1096611 () Bool)

(declare-fun res!731464 () Bool)

(assert (=> b!1096611 (=> (not res!731464) (not e!626162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096611 (= res!731464 (validKeyInArray!0 k0!904))))

(declare-fun b!1096612 () Bool)

(declare-fun res!731462 () Bool)

(assert (=> b!1096612 (=> (not res!731462) (not e!626162))))

(assert (=> b!1096612 (= res!731462 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23848))))

(assert (= (and start!96614 res!731463) b!1096605))

(assert (= (and b!1096605 res!731465) b!1096602))

(assert (= (and b!1096602 res!731467) b!1096612))

(assert (= (and b!1096612 res!731462) b!1096609))

(assert (= (and b!1096609 res!731461) b!1096611))

(assert (= (and b!1096611 res!731464) b!1096610))

(assert (= (and b!1096610 res!731466) b!1096604))

(assert (= (and b!1096604 res!731460) b!1096608))

(assert (= (and b!1096608 res!731459) b!1096601))

(assert (= (and b!1096603 condMapEmpty!42271) mapIsEmpty!42271))

(assert (= (and b!1096603 (not condMapEmpty!42271)) mapNonEmpty!42271))

(get-info :version)

(assert (= (and mapNonEmpty!42271 ((_ is ValueCellFull!12794) mapValue!42271)) b!1096606))

(assert (= (and b!1096603 ((_ is ValueCellFull!12794) mapDefault!42271)) b!1096607))

(assert (= start!96614 b!1096603))

(declare-fun m!1016613 () Bool)

(assert (=> b!1096604 m!1016613))

(declare-fun m!1016615 () Bool)

(assert (=> b!1096604 m!1016615))

(declare-fun m!1016617 () Bool)

(assert (=> b!1096610 m!1016617))

(declare-fun m!1016619 () Bool)

(assert (=> b!1096602 m!1016619))

(declare-fun m!1016621 () Bool)

(assert (=> b!1096608 m!1016621))

(declare-fun m!1016623 () Bool)

(assert (=> b!1096611 m!1016623))

(declare-fun m!1016625 () Bool)

(assert (=> start!96614 m!1016625))

(declare-fun m!1016627 () Bool)

(assert (=> start!96614 m!1016627))

(declare-fun m!1016629 () Bool)

(assert (=> start!96614 m!1016629))

(declare-fun m!1016631 () Bool)

(assert (=> b!1096601 m!1016631))

(declare-fun m!1016633 () Bool)

(assert (=> b!1096601 m!1016633))

(declare-fun m!1016635 () Bool)

(assert (=> b!1096601 m!1016635))

(declare-fun m!1016637 () Bool)

(assert (=> mapNonEmpty!42271 m!1016637))

(declare-fun m!1016639 () Bool)

(assert (=> b!1096612 m!1016639))

(check-sat (not b!1096602) (not b!1096601) tp_is_empty!27007 (not mapNonEmpty!42271) (not b!1096604) (not b!1096612) (not b!1096608) (not b_next!22957) (not start!96614) b_and!36593 (not b!1096611))
(check-sat b_and!36593 (not b_next!22957))
