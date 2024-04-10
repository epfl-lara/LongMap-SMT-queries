; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20552 () Bool)

(assert start!20552)

(declare-fun b_free!5211 () Bool)

(declare-fun b_next!5211 () Bool)

(assert (=> start!20552 (= b_free!5211 (not b_next!5211))))

(declare-fun tp!18665 () Bool)

(declare-fun b_and!11957 () Bool)

(assert (=> start!20552 (= tp!18665 b_and!11957)))

(declare-fun mapNonEmpty!8669 () Bool)

(declare-fun mapRes!8669 () Bool)

(declare-fun tp!18664 () Bool)

(declare-fun e!133763 () Bool)

(assert (=> mapNonEmpty!8669 (= mapRes!8669 (and tp!18664 e!133763))))

(declare-fun mapKey!8669 () (_ BitVec 32))

(declare-datatypes ((V!6403 0))(
  ( (V!6404 (val!2578 Int)) )
))
(declare-datatypes ((ValueCell!2190 0))(
  ( (ValueCellFull!2190 (v!4548 V!6403)) (EmptyCell!2190) )
))
(declare-fun mapValue!8669 () ValueCell!2190)

(declare-datatypes ((array!9351 0))(
  ( (array!9352 (arr!4426 (Array (_ BitVec 32) ValueCell!2190)) (size!4751 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9351)

(declare-fun mapRest!8669 () (Array (_ BitVec 32) ValueCell!2190))

(assert (=> mapNonEmpty!8669 (= (arr!4426 _values!649) (store mapRest!8669 mapKey!8669 mapValue!8669))))

(declare-fun b!204440 () Bool)

(declare-fun res!98510 () Bool)

(declare-fun e!133764 () Bool)

(assert (=> b!204440 (=> (not res!98510) (not e!133764))))

(declare-datatypes ((array!9353 0))(
  ( (array!9354 (arr!4427 (Array (_ BitVec 32) (_ BitVec 64))) (size!4752 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9353)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204440 (= res!98510 (= (select (arr!4427 _keys!825) i!601) k0!843))))

(declare-fun b!204441 () Bool)

(declare-fun res!98511 () Bool)

(assert (=> b!204441 (=> (not res!98511) (not e!133764))))

(declare-datatypes ((List!2809 0))(
  ( (Nil!2806) (Cons!2805 (h!3447 (_ BitVec 64)) (t!7740 List!2809)) )
))
(declare-fun arrayNoDuplicates!0 (array!9353 (_ BitVec 32) List!2809) Bool)

(assert (=> b!204441 (= res!98511 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2806))))

(declare-fun b!204442 () Bool)

(declare-fun res!98512 () Bool)

(declare-fun e!133769 () Bool)

(assert (=> b!204442 (=> (not res!98512) (not e!133769))))

(declare-datatypes ((tuple2!3910 0))(
  ( (tuple2!3911 (_1!1966 (_ BitVec 64)) (_2!1966 V!6403)) )
))
(declare-datatypes ((List!2810 0))(
  ( (Nil!2807) (Cons!2806 (h!3448 tuple2!3910) (t!7741 List!2810)) )
))
(declare-datatypes ((ListLongMap!2823 0))(
  ( (ListLongMap!2824 (toList!1427 List!2810)) )
))
(declare-fun lt!103592 () ListLongMap!2823)

(declare-fun lt!103595 () tuple2!3910)

(declare-fun lt!103599 () ListLongMap!2823)

(declare-fun +!454 (ListLongMap!2823 tuple2!3910) ListLongMap!2823)

(assert (=> b!204442 (= res!98512 (= lt!103592 (+!454 lt!103599 lt!103595)))))

(declare-fun b!204443 () Bool)

(declare-fun e!133767 () Bool)

(declare-fun tp_is_empty!5067 () Bool)

(assert (=> b!204443 (= e!133767 tp_is_empty!5067)))

(declare-fun mapIsEmpty!8669 () Bool)

(assert (=> mapIsEmpty!8669 mapRes!8669))

(declare-fun b!204445 () Bool)

(declare-fun e!133766 () Bool)

(assert (=> b!204445 (= e!133766 (and e!133767 mapRes!8669))))

(declare-fun condMapEmpty!8669 () Bool)

(declare-fun mapDefault!8669 () ValueCell!2190)

(assert (=> b!204445 (= condMapEmpty!8669 (= (arr!4426 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2190)) mapDefault!8669)))))

(declare-fun b!204446 () Bool)

(declare-fun res!98514 () Bool)

(assert (=> b!204446 (=> (not res!98514) (not e!133764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204446 (= res!98514 (validKeyInArray!0 k0!843))))

(declare-fun b!204447 () Bool)

(declare-fun res!98515 () Bool)

(assert (=> b!204447 (=> (not res!98515) (not e!133764))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!204447 (= res!98515 (and (= (size!4751 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4752 _keys!825) (size!4751 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204448 () Bool)

(declare-fun e!133768 () Bool)

(assert (=> b!204448 (= e!133768 true)))

(assert (=> b!204448 e!133769))

(declare-fun res!98506 () Bool)

(assert (=> b!204448 (=> (not res!98506) (not e!133769))))

(declare-fun lt!103598 () ListLongMap!2823)

(assert (=> b!204448 (= res!98506 (= lt!103592 (+!454 lt!103598 lt!103595)))))

(declare-fun minValue!615 () V!6403)

(assert (=> b!204448 (= lt!103595 (tuple2!3911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204449 () Bool)

(assert (=> b!204449 (= e!133764 (not e!133768))))

(declare-fun res!98507 () Bool)

(assert (=> b!204449 (=> res!98507 e!133768)))

(assert (=> b!204449 (= res!98507 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!103597 () ListLongMap!2823)

(declare-fun zeroValue!615 () V!6403)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1000 (array!9353 array!9351 (_ BitVec 32) (_ BitVec 32) V!6403 V!6403 (_ BitVec 32) Int) ListLongMap!2823)

(assert (=> b!204449 (= lt!103597 (getCurrentListMap!1000 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103593 () array!9351)

(assert (=> b!204449 (= lt!103592 (getCurrentListMap!1000 _keys!825 lt!103593 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204449 (and (= lt!103598 lt!103599) (= lt!103599 lt!103598))))

(declare-fun lt!103594 () ListLongMap!2823)

(declare-fun v!520 () V!6403)

(assert (=> b!204449 (= lt!103599 (+!454 lt!103594 (tuple2!3911 k0!843 v!520)))))

(declare-datatypes ((Unit!6200 0))(
  ( (Unit!6201) )
))
(declare-fun lt!103596 () Unit!6200)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!113 (array!9353 array!9351 (_ BitVec 32) (_ BitVec 32) V!6403 V!6403 (_ BitVec 32) (_ BitVec 64) V!6403 (_ BitVec 32) Int) Unit!6200)

(assert (=> b!204449 (= lt!103596 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!113 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!374 (array!9353 array!9351 (_ BitVec 32) (_ BitVec 32) V!6403 V!6403 (_ BitVec 32) Int) ListLongMap!2823)

(assert (=> b!204449 (= lt!103598 (getCurrentListMapNoExtraKeys!374 _keys!825 lt!103593 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204449 (= lt!103593 (array!9352 (store (arr!4426 _values!649) i!601 (ValueCellFull!2190 v!520)) (size!4751 _values!649)))))

(assert (=> b!204449 (= lt!103594 (getCurrentListMapNoExtraKeys!374 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204450 () Bool)

(declare-fun res!98513 () Bool)

(assert (=> b!204450 (=> (not res!98513) (not e!133764))))

(assert (=> b!204450 (= res!98513 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4752 _keys!825))))))

(declare-fun b!204451 () Bool)

(assert (=> b!204451 (= e!133763 tp_is_empty!5067)))

(declare-fun b!204452 () Bool)

(assert (=> b!204452 (= e!133769 (= lt!103597 (+!454 lt!103594 lt!103595)))))

(declare-fun res!98509 () Bool)

(assert (=> start!20552 (=> (not res!98509) (not e!133764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20552 (= res!98509 (validMask!0 mask!1149))))

(assert (=> start!20552 e!133764))

(declare-fun array_inv!2923 (array!9351) Bool)

(assert (=> start!20552 (and (array_inv!2923 _values!649) e!133766)))

(assert (=> start!20552 true))

(assert (=> start!20552 tp_is_empty!5067))

(declare-fun array_inv!2924 (array!9353) Bool)

(assert (=> start!20552 (array_inv!2924 _keys!825)))

(assert (=> start!20552 tp!18665))

(declare-fun b!204444 () Bool)

(declare-fun res!98508 () Bool)

(assert (=> b!204444 (=> (not res!98508) (not e!133764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9353 (_ BitVec 32)) Bool)

(assert (=> b!204444 (= res!98508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20552 res!98509) b!204447))

(assert (= (and b!204447 res!98515) b!204444))

(assert (= (and b!204444 res!98508) b!204441))

(assert (= (and b!204441 res!98511) b!204450))

(assert (= (and b!204450 res!98513) b!204446))

(assert (= (and b!204446 res!98514) b!204440))

(assert (= (and b!204440 res!98510) b!204449))

(assert (= (and b!204449 (not res!98507)) b!204448))

(assert (= (and b!204448 res!98506) b!204442))

(assert (= (and b!204442 res!98512) b!204452))

(assert (= (and b!204445 condMapEmpty!8669) mapIsEmpty!8669))

(assert (= (and b!204445 (not condMapEmpty!8669)) mapNonEmpty!8669))

(get-info :version)

(assert (= (and mapNonEmpty!8669 ((_ is ValueCellFull!2190) mapValue!8669)) b!204451))

(assert (= (and b!204445 ((_ is ValueCellFull!2190) mapDefault!8669)) b!204443))

(assert (= start!20552 b!204445))

(declare-fun m!231967 () Bool)

(assert (=> b!204446 m!231967))

(declare-fun m!231969 () Bool)

(assert (=> mapNonEmpty!8669 m!231969))

(declare-fun m!231971 () Bool)

(assert (=> b!204449 m!231971))

(declare-fun m!231973 () Bool)

(assert (=> b!204449 m!231973))

(declare-fun m!231975 () Bool)

(assert (=> b!204449 m!231975))

(declare-fun m!231977 () Bool)

(assert (=> b!204449 m!231977))

(declare-fun m!231979 () Bool)

(assert (=> b!204449 m!231979))

(declare-fun m!231981 () Bool)

(assert (=> b!204449 m!231981))

(declare-fun m!231983 () Bool)

(assert (=> b!204449 m!231983))

(declare-fun m!231985 () Bool)

(assert (=> b!204448 m!231985))

(declare-fun m!231987 () Bool)

(assert (=> b!204444 m!231987))

(declare-fun m!231989 () Bool)

(assert (=> b!204441 m!231989))

(declare-fun m!231991 () Bool)

(assert (=> b!204452 m!231991))

(declare-fun m!231993 () Bool)

(assert (=> b!204440 m!231993))

(declare-fun m!231995 () Bool)

(assert (=> b!204442 m!231995))

(declare-fun m!231997 () Bool)

(assert (=> start!20552 m!231997))

(declare-fun m!231999 () Bool)

(assert (=> start!20552 m!231999))

(declare-fun m!232001 () Bool)

(assert (=> start!20552 m!232001))

(check-sat (not b!204449) (not b!204446) (not b!204441) b_and!11957 (not b!204448) (not b!204452) (not mapNonEmpty!8669) (not start!20552) (not b!204442) (not b_next!5211) (not b!204444) tp_is_empty!5067)
(check-sat b_and!11957 (not b_next!5211))
