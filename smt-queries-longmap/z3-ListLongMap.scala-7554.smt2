; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95646 () Bool)

(assert start!95646)

(declare-fun b_free!22299 () Bool)

(declare-fun b_next!22299 () Bool)

(assert (=> start!95646 (= b_free!22299 (not b_next!22299))))

(declare-fun tp!78745 () Bool)

(declare-fun b_and!35277 () Bool)

(assert (=> start!95646 (= tp!78745 b_and!35277)))

(declare-fun res!720435 () Bool)

(declare-fun e!617868 () Bool)

(assert (=> start!95646 (=> (not res!720435) (not e!617868))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95646 (= res!720435 (validMask!0 mask!1414))))

(assert (=> start!95646 e!617868))

(assert (=> start!95646 tp!78745))

(assert (=> start!95646 true))

(declare-fun tp_is_empty!26301 () Bool)

(assert (=> start!95646 tp_is_empty!26301))

(declare-datatypes ((array!69553 0))(
  ( (array!69554 (arr!33450 (Array (_ BitVec 32) (_ BitVec 64))) (size!33986 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69553)

(declare-fun array_inv!25826 (array!69553) Bool)

(assert (=> start!95646 (array_inv!25826 _keys!1070)))

(declare-datatypes ((V!40195 0))(
  ( (V!40196 (val!13207 Int)) )
))
(declare-datatypes ((ValueCell!12441 0))(
  ( (ValueCellFull!12441 (v!15828 V!40195)) (EmptyCell!12441) )
))
(declare-datatypes ((array!69555 0))(
  ( (array!69556 (arr!33451 (Array (_ BitVec 32) ValueCell!12441)) (size!33987 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69555)

(declare-fun e!617869 () Bool)

(declare-fun array_inv!25827 (array!69555) Bool)

(assert (=> start!95646 (and (array_inv!25827 _values!874) e!617869)))

(declare-fun b!1080897 () Bool)

(declare-fun e!617871 () Bool)

(declare-fun mapRes!41206 () Bool)

(assert (=> b!1080897 (= e!617869 (and e!617871 mapRes!41206))))

(declare-fun condMapEmpty!41206 () Bool)

(declare-fun mapDefault!41206 () ValueCell!12441)

(assert (=> b!1080897 (= condMapEmpty!41206 (= (arr!33451 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12441)) mapDefault!41206)))))

(declare-fun b!1080898 () Bool)

(assert (=> b!1080898 (= e!617871 tp_is_empty!26301)))

(declare-fun b!1080899 () Bool)

(declare-fun res!720441 () Bool)

(assert (=> b!1080899 (=> (not res!720441) (not e!617868))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080899 (= res!720441 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41206 () Bool)

(assert (=> mapIsEmpty!41206 mapRes!41206))

(declare-fun b!1080900 () Bool)

(declare-fun res!720433 () Bool)

(assert (=> b!1080900 (=> (not res!720433) (not e!617868))))

(declare-datatypes ((List!23309 0))(
  ( (Nil!23306) (Cons!23305 (h!24514 (_ BitVec 64)) (t!32668 List!23309)) )
))
(declare-fun arrayNoDuplicates!0 (array!69553 (_ BitVec 32) List!23309) Bool)

(assert (=> b!1080900 (= res!720433 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23306))))

(declare-fun b!1080901 () Bool)

(declare-fun e!617870 () Bool)

(assert (=> b!1080901 (= e!617870 (not (bvsle #b00000000000000000000000000000000 (size!33986 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40195)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16728 0))(
  ( (tuple2!16729 (_1!8375 (_ BitVec 64)) (_2!8375 V!40195)) )
))
(declare-datatypes ((List!23310 0))(
  ( (Nil!23307) (Cons!23306 (h!24515 tuple2!16728) (t!32669 List!23310)) )
))
(declare-datatypes ((ListLongMap!14697 0))(
  ( (ListLongMap!14698 (toList!7364 List!23310)) )
))
(declare-fun lt!479134 () ListLongMap!14697)

(declare-fun zeroValue!831 () V!40195)

(declare-fun getCurrentListMapNoExtraKeys!3912 (array!69553 array!69555 (_ BitVec 32) (_ BitVec 32) V!40195 V!40195 (_ BitVec 32) Int) ListLongMap!14697)

(assert (=> b!1080901 (= lt!479134 (getCurrentListMapNoExtraKeys!3912 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080901 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35548 0))(
  ( (Unit!35549) )
))
(declare-fun lt!479132 () Unit!35548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69553 (_ BitVec 64) (_ BitVec 32)) Unit!35548)

(assert (=> b!1080901 (= lt!479132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41206 () Bool)

(declare-fun tp!78746 () Bool)

(declare-fun e!617872 () Bool)

(assert (=> mapNonEmpty!41206 (= mapRes!41206 (and tp!78746 e!617872))))

(declare-fun mapKey!41206 () (_ BitVec 32))

(declare-fun mapRest!41206 () (Array (_ BitVec 32) ValueCell!12441))

(declare-fun mapValue!41206 () ValueCell!12441)

(assert (=> mapNonEmpty!41206 (= (arr!33451 _values!874) (store mapRest!41206 mapKey!41206 mapValue!41206))))

(declare-fun b!1080902 () Bool)

(declare-fun res!720438 () Bool)

(assert (=> b!1080902 (=> (not res!720438) (not e!617868))))

(assert (=> b!1080902 (= res!720438 (and (= (size!33987 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33986 _keys!1070) (size!33987 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080903 () Bool)

(assert (=> b!1080903 (= e!617872 tp_is_empty!26301)))

(declare-fun b!1080904 () Bool)

(declare-fun res!720437 () Bool)

(assert (=> b!1080904 (=> (not res!720437) (not e!617868))))

(assert (=> b!1080904 (= res!720437 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33986 _keys!1070))))))

(declare-fun b!1080905 () Bool)

(declare-fun res!720434 () Bool)

(assert (=> b!1080905 (=> (not res!720434) (not e!617870))))

(declare-fun lt!479133 () array!69553)

(assert (=> b!1080905 (= res!720434 (arrayNoDuplicates!0 lt!479133 #b00000000000000000000000000000000 Nil!23306))))

(declare-fun b!1080906 () Bool)

(declare-fun res!720440 () Bool)

(assert (=> b!1080906 (=> (not res!720440) (not e!617868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69553 (_ BitVec 32)) Bool)

(assert (=> b!1080906 (= res!720440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080907 () Bool)

(assert (=> b!1080907 (= e!617868 e!617870)))

(declare-fun res!720439 () Bool)

(assert (=> b!1080907 (=> (not res!720439) (not e!617870))))

(assert (=> b!1080907 (= res!720439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479133 mask!1414))))

(assert (=> b!1080907 (= lt!479133 (array!69554 (store (arr!33450 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33986 _keys!1070)))))

(declare-fun b!1080908 () Bool)

(declare-fun res!720436 () Bool)

(assert (=> b!1080908 (=> (not res!720436) (not e!617868))))

(assert (=> b!1080908 (= res!720436 (= (select (arr!33450 _keys!1070) i!650) k0!904))))

(assert (= (and start!95646 res!720435) b!1080902))

(assert (= (and b!1080902 res!720438) b!1080906))

(assert (= (and b!1080906 res!720440) b!1080900))

(assert (= (and b!1080900 res!720433) b!1080904))

(assert (= (and b!1080904 res!720437) b!1080899))

(assert (= (and b!1080899 res!720441) b!1080908))

(assert (= (and b!1080908 res!720436) b!1080907))

(assert (= (and b!1080907 res!720439) b!1080905))

(assert (= (and b!1080905 res!720434) b!1080901))

(assert (= (and b!1080897 condMapEmpty!41206) mapIsEmpty!41206))

(assert (= (and b!1080897 (not condMapEmpty!41206)) mapNonEmpty!41206))

(get-info :version)

(assert (= (and mapNonEmpty!41206 ((_ is ValueCellFull!12441) mapValue!41206)) b!1080903))

(assert (= (and b!1080897 ((_ is ValueCellFull!12441) mapDefault!41206)) b!1080898))

(assert (= start!95646 b!1080897))

(declare-fun m!998753 () Bool)

(assert (=> start!95646 m!998753))

(declare-fun m!998755 () Bool)

(assert (=> start!95646 m!998755))

(declare-fun m!998757 () Bool)

(assert (=> start!95646 m!998757))

(declare-fun m!998759 () Bool)

(assert (=> b!1080906 m!998759))

(declare-fun m!998761 () Bool)

(assert (=> mapNonEmpty!41206 m!998761))

(declare-fun m!998763 () Bool)

(assert (=> b!1080908 m!998763))

(declare-fun m!998765 () Bool)

(assert (=> b!1080901 m!998765))

(declare-fun m!998767 () Bool)

(assert (=> b!1080901 m!998767))

(declare-fun m!998769 () Bool)

(assert (=> b!1080901 m!998769))

(declare-fun m!998771 () Bool)

(assert (=> b!1080899 m!998771))

(declare-fun m!998773 () Bool)

(assert (=> b!1080900 m!998773))

(declare-fun m!998775 () Bool)

(assert (=> b!1080905 m!998775))

(declare-fun m!998777 () Bool)

(assert (=> b!1080907 m!998777))

(declare-fun m!998779 () Bool)

(assert (=> b!1080907 m!998779))

(check-sat (not b!1080901) (not b!1080900) (not b_next!22299) (not start!95646) (not b!1080905) tp_is_empty!26301 (not mapNonEmpty!41206) (not b!1080907) (not b!1080899) b_and!35277 (not b!1080906))
(check-sat b_and!35277 (not b_next!22299))
