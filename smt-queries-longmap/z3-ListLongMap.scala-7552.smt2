; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95634 () Bool)

(assert start!95634)

(declare-fun b_free!22287 () Bool)

(declare-fun b_next!22287 () Bool)

(assert (=> start!95634 (= b_free!22287 (not b_next!22287))))

(declare-fun tp!78709 () Bool)

(declare-fun b_and!35265 () Bool)

(assert (=> start!95634 (= tp!78709 b_and!35265)))

(declare-fun b!1080681 () Bool)

(declare-fun res!720278 () Bool)

(declare-fun e!617762 () Bool)

(assert (=> b!1080681 (=> (not res!720278) (not e!617762))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69529 0))(
  ( (array!69530 (arr!33438 (Array (_ BitVec 32) (_ BitVec 64))) (size!33974 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69529)

(declare-datatypes ((V!40179 0))(
  ( (V!40180 (val!13201 Int)) )
))
(declare-datatypes ((ValueCell!12435 0))(
  ( (ValueCellFull!12435 (v!15822 V!40179)) (EmptyCell!12435) )
))
(declare-datatypes ((array!69531 0))(
  ( (array!69532 (arr!33439 (Array (_ BitVec 32) ValueCell!12435)) (size!33975 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69531)

(assert (=> b!1080681 (= res!720278 (and (= (size!33975 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33974 _keys!1070) (size!33975 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080682 () Bool)

(declare-fun e!617761 () Bool)

(declare-fun tp_is_empty!26289 () Bool)

(assert (=> b!1080682 (= e!617761 tp_is_empty!26289)))

(declare-fun b!1080683 () Bool)

(declare-fun res!720276 () Bool)

(declare-fun e!617760 () Bool)

(assert (=> b!1080683 (=> (not res!720276) (not e!617760))))

(declare-fun lt!479078 () array!69529)

(declare-datatypes ((List!23301 0))(
  ( (Nil!23298) (Cons!23297 (h!24506 (_ BitVec 64)) (t!32660 List!23301)) )
))
(declare-fun arrayNoDuplicates!0 (array!69529 (_ BitVec 32) List!23301) Bool)

(assert (=> b!1080683 (= res!720276 (arrayNoDuplicates!0 lt!479078 #b00000000000000000000000000000000 Nil!23298))))

(declare-fun res!720272 () Bool)

(assert (=> start!95634 (=> (not res!720272) (not e!617762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95634 (= res!720272 (validMask!0 mask!1414))))

(assert (=> start!95634 e!617762))

(assert (=> start!95634 tp!78709))

(assert (=> start!95634 true))

(assert (=> start!95634 tp_is_empty!26289))

(declare-fun array_inv!25816 (array!69529) Bool)

(assert (=> start!95634 (array_inv!25816 _keys!1070)))

(declare-fun e!617764 () Bool)

(declare-fun array_inv!25817 (array!69531) Bool)

(assert (=> start!95634 (and (array_inv!25817 _values!874) e!617764)))

(declare-fun b!1080684 () Bool)

(assert (=> b!1080684 (= e!617760 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40179)

(declare-datatypes ((tuple2!16720 0))(
  ( (tuple2!16721 (_1!8371 (_ BitVec 64)) (_2!8371 V!40179)) )
))
(declare-datatypes ((List!23302 0))(
  ( (Nil!23299) (Cons!23298 (h!24507 tuple2!16720) (t!32661 List!23302)) )
))
(declare-datatypes ((ListLongMap!14689 0))(
  ( (ListLongMap!14690 (toList!7360 List!23302)) )
))
(declare-fun lt!479079 () ListLongMap!14689)

(declare-fun zeroValue!831 () V!40179)

(declare-fun getCurrentListMapNoExtraKeys!3908 (array!69529 array!69531 (_ BitVec 32) (_ BitVec 32) V!40179 V!40179 (_ BitVec 32) Int) ListLongMap!14689)

(assert (=> b!1080684 (= lt!479079 (getCurrentListMapNoExtraKeys!3908 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080684 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35540 0))(
  ( (Unit!35541) )
))
(declare-fun lt!479080 () Unit!35540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69529 (_ BitVec 64) (_ BitVec 32)) Unit!35540)

(assert (=> b!1080684 (= lt!479080 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080685 () Bool)

(declare-fun res!720277 () Bool)

(assert (=> b!1080685 (=> (not res!720277) (not e!617762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69529 (_ BitVec 32)) Bool)

(assert (=> b!1080685 (= res!720277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080686 () Bool)

(declare-fun e!617763 () Bool)

(assert (=> b!1080686 (= e!617763 tp_is_empty!26289)))

(declare-fun b!1080687 () Bool)

(declare-fun res!720274 () Bool)

(assert (=> b!1080687 (=> (not res!720274) (not e!617762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080687 (= res!720274 (validKeyInArray!0 k0!904))))

(declare-fun b!1080688 () Bool)

(declare-fun mapRes!41188 () Bool)

(assert (=> b!1080688 (= e!617764 (and e!617763 mapRes!41188))))

(declare-fun condMapEmpty!41188 () Bool)

(declare-fun mapDefault!41188 () ValueCell!12435)

(assert (=> b!1080688 (= condMapEmpty!41188 (= (arr!33439 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12435)) mapDefault!41188)))))

(declare-fun b!1080689 () Bool)

(declare-fun res!720279 () Bool)

(assert (=> b!1080689 (=> (not res!720279) (not e!617762))))

(assert (=> b!1080689 (= res!720279 (= (select (arr!33438 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41188 () Bool)

(declare-fun tp!78710 () Bool)

(assert (=> mapNonEmpty!41188 (= mapRes!41188 (and tp!78710 e!617761))))

(declare-fun mapKey!41188 () (_ BitVec 32))

(declare-fun mapValue!41188 () ValueCell!12435)

(declare-fun mapRest!41188 () (Array (_ BitVec 32) ValueCell!12435))

(assert (=> mapNonEmpty!41188 (= (arr!33439 _values!874) (store mapRest!41188 mapKey!41188 mapValue!41188))))

(declare-fun b!1080690 () Bool)

(declare-fun res!720273 () Bool)

(assert (=> b!1080690 (=> (not res!720273) (not e!617762))))

(assert (=> b!1080690 (= res!720273 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23298))))

(declare-fun mapIsEmpty!41188 () Bool)

(assert (=> mapIsEmpty!41188 mapRes!41188))

(declare-fun b!1080691 () Bool)

(declare-fun res!720275 () Bool)

(assert (=> b!1080691 (=> (not res!720275) (not e!617762))))

(assert (=> b!1080691 (= res!720275 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33974 _keys!1070))))))

(declare-fun b!1080692 () Bool)

(assert (=> b!1080692 (= e!617762 e!617760)))

(declare-fun res!720271 () Bool)

(assert (=> b!1080692 (=> (not res!720271) (not e!617760))))

(assert (=> b!1080692 (= res!720271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479078 mask!1414))))

(assert (=> b!1080692 (= lt!479078 (array!69530 (store (arr!33438 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33974 _keys!1070)))))

(assert (= (and start!95634 res!720272) b!1080681))

(assert (= (and b!1080681 res!720278) b!1080685))

(assert (= (and b!1080685 res!720277) b!1080690))

(assert (= (and b!1080690 res!720273) b!1080691))

(assert (= (and b!1080691 res!720275) b!1080687))

(assert (= (and b!1080687 res!720274) b!1080689))

(assert (= (and b!1080689 res!720279) b!1080692))

(assert (= (and b!1080692 res!720271) b!1080683))

(assert (= (and b!1080683 res!720276) b!1080684))

(assert (= (and b!1080688 condMapEmpty!41188) mapIsEmpty!41188))

(assert (= (and b!1080688 (not condMapEmpty!41188)) mapNonEmpty!41188))

(get-info :version)

(assert (= (and mapNonEmpty!41188 ((_ is ValueCellFull!12435) mapValue!41188)) b!1080682))

(assert (= (and b!1080688 ((_ is ValueCellFull!12435) mapDefault!41188)) b!1080686))

(assert (= start!95634 b!1080688))

(declare-fun m!998585 () Bool)

(assert (=> b!1080690 m!998585))

(declare-fun m!998587 () Bool)

(assert (=> start!95634 m!998587))

(declare-fun m!998589 () Bool)

(assert (=> start!95634 m!998589))

(declare-fun m!998591 () Bool)

(assert (=> start!95634 m!998591))

(declare-fun m!998593 () Bool)

(assert (=> mapNonEmpty!41188 m!998593))

(declare-fun m!998595 () Bool)

(assert (=> b!1080684 m!998595))

(declare-fun m!998597 () Bool)

(assert (=> b!1080684 m!998597))

(declare-fun m!998599 () Bool)

(assert (=> b!1080684 m!998599))

(declare-fun m!998601 () Bool)

(assert (=> b!1080685 m!998601))

(declare-fun m!998603 () Bool)

(assert (=> b!1080683 m!998603))

(declare-fun m!998605 () Bool)

(assert (=> b!1080687 m!998605))

(declare-fun m!998607 () Bool)

(assert (=> b!1080692 m!998607))

(declare-fun m!998609 () Bool)

(assert (=> b!1080692 m!998609))

(declare-fun m!998611 () Bool)

(assert (=> b!1080689 m!998611))

(check-sat (not start!95634) (not b!1080684) (not b!1080692) (not b_next!22287) (not mapNonEmpty!41188) (not b!1080690) (not b!1080687) (not b!1080685) tp_is_empty!26289 b_and!35265 (not b!1080683))
(check-sat b_and!35265 (not b_next!22287))
